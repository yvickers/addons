_addon.name = 'Powder'
_addon.author = 'Pchan'
_addon.version = '1.0.0.4'
_addon.command = 'powder'

require('chat')
require('logger')
packets = require('packets')
json  = require('json')
files = require('files')
config = require('config')
--db = require('map')
res = require('resources')

pkt = {}


	

defaults = {}
settings = config.load(defaults)

busy = false
busy2= false
busy3= false
nb=0

nom=windower.ffxi.get_player().name
nom_id=1095
q=0
r=1

print(nom)

for i,v in pairs(windower.ffxi.get_mob_array()) do
	if v['name'] == nom then
		nom_id = i
	end
end

print(nom_id)


windower.register_event('addon command', function(cmd,n,...)
	if cmd=='buy' then
		if not busy then
			busy=true
			poke_npc(17719646,350)
		end
		q=math.floor(n/8)
		r=n-q*8
	
	
	
	elseif cmd=='poke' then
		poke_npc(17719304,8)
		coroutine.sleep((2))
		windower.send_command('setkey escape down; wait 0.2;setkey escape up; wait 0.2;')
	
	
	elseif cmd=='acheron' then
		if not busy2 then
			busy2=true
			poke_npc(17719638,342)
		end
	elseif cmd=='feather' then
		if not busy3 then
			busy3=true
			poke_npc(17764454,102)
		end
	
	elseif cmd=='sell' then
		windower.send_command('sellnpc2 prize powder')
	elseif cmd=='store' then
		windower.send_command('put prize powder satchel all;wait 1;put prize powder sack all;wait 1;put prize powder case all;wait 1;')
		--windower.send_command('wait 1;sellnpc2 prize powder;')
	elseif cmd=='get' then
		print("get")
		windower.send_command('get prize powder all;wait 2;powder sell')
	end
		
end)

windower.register_event('incoming chunk',function(id,data,modified,injected,blocked)

	if id == 0x034 or id == 0x032 or id==0x052 then
		if busy3==true then
			local packet = packets.new('outgoing', 0x083)
			packet['Count']=12
			packet['_unknown2']=0
			packet['Shop Slot']=1
			packet['_unknown4']=0
			packets.inject(packet)
			packets.inject(packet)
			packets.inject(packet)
			packets.inject(packet)
			packets.inject(packet)
			packets.inject(packet)
			packets.inject(packet)
			packets.inject(packet)
			packets.inject(packet)
			packets.inject(packet)
			
			
			local packet = packets.new('outgoing', 0x03A)
			packet['Bag']=0
			packet['_unknown1']=0
			packet['_unknown2']=0
			
			packets.inject(packet)
			
			
			
			busy3 = false
			return true
		end
		if busy2==true then
			local packet = packets.new('outgoing', 0x05B)
			packet["Target"]=17719638
			packet["Option Index"]=9 -- acheron=9 mais je teste avec cesti (3) qui est pas cher
			packet["_unknown1"]=41 -- acheron 41 cesti 0
			packet["Target Index"]=342
			packet["Automated Message"]=true
			packet["_unknown2"]=0
			packet["Zone"]=230
			packet["Menu ID"]=995
			packets.inject(packet)
			packets.inject(packet)
			packets.inject(packet)
			packets.inject(packet)
			packets.inject(packet)
			
			
			
			local packet = packets.new('outgoing', 0x05B)
			packet["Target"]=17719638
			packet["Option Index"]=0
			packet["_unknown1"]=16384
			packet["Target Index"]=342
			packet["Automated Message"]=false
			packet["_unknown2"]=0
			packet["Zone"]=230
			packet["Menu ID"]=995
			packets.inject(packet)
			
			
			
			local packet = packets.new('outgoing', 0x016, {["Target Index"]=nom_id,})
			packets.inject(packet)
			busy2 = false
			return true
		end
		
		
		if busy==true then
			local packet = packets.new('outgoing', 0x05B)
			packet["Target"]=17719646
			packet["Option Index"]=10 
			packet["_unknown1"]=0 
			packet["Target Index"]=350
			packet["Automated Message"]=true
			packet["_unknown2"]=0
			packet["Zone"]=230
			packet["Menu ID"]=3529
			packets.inject(packet)
			
			local packet = packets.new('outgoing', 0x05B)
			packet["Target"]=17719646
			packet["Option Index"]=387
			packet["_unknown1"]=0
			packet["Target Index"]=350
			packet["Automated Message"]=true
			packet["_unknown2"]=0
			packet["Zone"]=230
			packet["Menu ID"]=3529
			packets.inject(packet)
			
			local packet = packets.new('outgoing', 0x05B)
			packet["Target"]=17719646
			packet["Option Index"]=388+r*8192
			packet["_unknown1"]=q
			packet["Target Index"]=350
			packet["Automated Message"]=true
			packet["_unknown2"]=0
			packet["Zone"]=230
			packet["Menu ID"]=3529
			packets.inject(packet)
			
			
			
			local packet=packets.new('outgoing', 0x05B)
			packet['Target']=17719646
			packet['Option Index']=0
			packet['_unknown1']=16384
			packet['Target Index']=350
			packet['Automated Message']=false
			packet['_unknown2']=0
			packet['zone']=230
			packet['Menu ID']=3529
			
			
			packets.inject(packet)
			
			coroutine.sleep((3))
			print("finished")
			windower.send_command('setkey escape down; wait 0.2;setkey escape up; wait 0.2;')
			windower.send_command('powder store;wait 0.2;')
			local packet = packets.new('outgoing', 0x016, {["Target Index"]=nom_id,["_junk1"]=0})
			packets.inject(packet)
			busy = false
			
			
			
			return true
			
		end
	
	
	end

end)




function poke_npc(npc,target_index)

	if npc and target_index then
		

		local packet = packets.new('outgoing', 0x01A, {

			["Target"]=npc,

			["Target Index"]=target_index,

			["Category"]=0,

			["Param"]=0,

			["_unknown1"]=0})
		packets.inject(packet)

	end

end





