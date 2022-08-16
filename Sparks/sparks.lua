--[[

]]--

_addon.author   = 'Edrakali';
_addon.name     = 'sparks';
_addon.version  = '1.1';

require 'common'
--require 'helper';

choices = {
    [0] = {name = "archeon", description = "Archeon Shield, applicable from Sparks NPCs", npcs = {'Eternal Flame','Rolandienne','Isakoth','Fhelm Jobeizat'}, choice = string.char(9,0,0x29,0)},
    [1] = {name = "velvet", description = "Velvet Cuffs, applicable from Sparks NPCs", npcs = {'Eternal Flame','Rolandienne','Isakoth','Fhelm Jobeizat'}, choice = string.char(6,0,64,0)},
    [2] = {name = "buckler", description = "Darksteel Buckler, applicable from Sparks NPCs", npcs = {'Eternal Flame','Rolandienne','Isakoth','Fhelm Jobeizat'}, choice = string.char(8,0,36,0)},
    [3] = {name = "cobalt", description = "Cobalt Cell x12, applicable from Voidwatch Officer NPCs", npcs = {'Voidwatch Officer'}, choice = string.char(2,0,1,3)},
    [4] = {name = "rubicund", description = "Rubicund Cell x12, applicable from Voidwatch Officer NPCs", npcs = {'Voidwatch Officer'}, choice = string.char(2,0,2,3)},
    [5] = {name = "xan", description = "Xanthous Cell x12, applicable from Voidwatch Officer NPCs", npcs = {'Voidwatch Officer'}, choice = string.char(2,0,3,3)},
    [6] = {name = "voiddust", description = "Voiddust, Purchashed from Voidwatch Purveyor", npcs = {'Voidwatch Purveyor'}, choice = string.char(1,0,0x45,0)}    
}

choice = string.char(9,0,0x29,0); --default is archeon shield
choiceIndex = 0;
_choiceName = "archeon";
---------------------------------------------------------------------------------------------------
-- func: outgoing_packet
-- desc: Called when our addon receives an outgoing packet.
---------------------------------------------------------------------------------------------------
ashita.register_event('outgoing_packet', function(id, size, packet)
    if (id == 0x5B) then
        local newchoice = choice; --get global variable
        local newpacket = packet:sub(1,8) .. newchoice .. packet:sub(13)
        newpacket= newpacket:totable();
        local original_choice = packet:sub(9,12);
        tarID = packet:sub(5,8)
        tarID = struct.unpack('l', tarID);
        tar = get_name_by_sID(tarID)
        npcs = choices[choiceIndex].npcs;
        found = false;
        for i = 1, #npcs do
            if tar == npcs[i] then
                found=true;
            end;
        end;
        local original_choice = struct.unpack('l', original_choice);
        if (original_choice == 0 or original_choice == 0x40000000) and found==true then
            -- print("[sparks] condition met");
            AddOutgoingPacket(newpacket, id, #newpacket);
            return true;
        end
    end
    return false;
end );



---------------------------------------------------------------------------------------------------
-- func: Command
-- desc: Called when our addon receives a command.
-- retn: bool - True if the addon handled the command, false otherwise to allow further addons to process the command.
---------------------------------------------------------------------------------------------------
ashita.register_event('command', function(cmd, nType)
    -- Skip commands that we should not handle..
    
    local args = cmd:GetArgs();
    if (args[1] ~= '/sparks' and args[1] ~= '/spa') then
        return false;
    elseif args[2] == "choice" then
        if args[3] == nil then
            print("[sparks] " .. "Syntax: /sparks choice <Choice Name>");
            return true;
        end
        choiceName = args[3];
        SetChoiceByName(choiceName);
        return true;
    elseif args[2] == "list" then
        listChoices();
        return true;
    elseif args[2] == "current" then
        printCurrentChoice();
        return true;
    end;
    return true;
end );

function SetChoiceByName(choiceName)
    local found = false;
    for i = 1, #choices do
        if choices[i].name == choiceName then
            print("[sparks] choice " .. choiceName .. " set");
            choice = choices[i].choice;
            choiceIndex = i;
            _choiceName = choices[i].name;
            found = true;
            break;
        end;
    end;
    if found == false then
        print("[sparks] choice " .. choiceName .. " not found.");
    end;
end;

function listChoices()
    print("[sparks] Listing Choices..");
    for i =1, #choices do
        print(choices[i].name .. ": " .. choices[i].description);
    end;
end;

function printCurrentChoice()
    print("[sparks] Current choice: " .. _choiceName);
end;


function get_name_by_sID(given_sID)
    local entity  = AshitaCore:GetDataManager():GetEntity();
    for x = 1, 2048 do
        if (given_sID == entity:GetServerID( x )) then
            return entity:GetName( x );         
        end
    end
    return false
end