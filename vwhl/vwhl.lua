--[[
vwhl - voidwatch highlighter v1.20131102

Copyright (c) 2013, Giuliano Riccio
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright
notice, this list of conditions and the following disclaimer.
* Redistributions in binary form must reproduce the above copyright
notice, this list of conditions and the following disclaimer in the
documentation and/or other materials provided with the distribution.
* Neither the name of vwhl nor the
names of its contributors may be used to endorse or promote products
derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL Giuliano Riccio BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
]]

require 'chat'


_addon.name    = 'vwhl'
_addon.author  = 'Zohno'
_addon.version = '1.20131102'
_addon.command = 'vwhl'

windower.register_event('incoming text', function(original, modified, mode)
    if mode ~= 148 then
        return modified, mode
    end

    if original:match('The fiend appears') then
        if original:match('extremely vulnerable') then
            original = original:gsub('extremely vulnerable', ('extremely vulnerable (5)'):color(258))
        elseif original:match('highly vulnerable') then
            original = original:gsub('highly vulnerable', ('highly vulnerable (3)'):color(258))
        else
            original = original:gsub('vulnerable', ('vulnerable (1)'):color(258))
        end

        if original:match('great sword') then
            original = original:gsub('great sword', ('great sword'):color(258))
        elseif original:match('sword') then
            original = original:gsub('sword', ('sword'):color(258))
        elseif original:match('great axe') then
            original = original:gsub('great axe', ('great axe'):color(258))
        elseif original:match('axe') then
            original = original:gsub('axe', ('axe'):color(258))
        end

        original = original
            :gsub('(%w+) elemental', ('%1'):color(258)..' elemental')
            :gsub('white magic', ('white magic'):color(258))
            :gsub('black magic', ('black magic'):color(258))
            :gsub('ninjutsu', ('ninjutsu'):color(258))
            :gsub('bard songs', ('bard songs'):color(258))
            :gsub('blue magic', ('blue magic'):color(258))
            :gsub('abilities', ('abilities'):color(258))
            :gsub('warrior', ('warrior'):color(258))
            :gsub('monk', ('monk'):color(258))
            :gsub('white mage', ('white mage'):color(258))
            :gsub('black mage', ('black mage'):color(258))
            :gsub('red mage', ('red mage'):color(258))
            :gsub('thief', ('thief'):color(258))
            :gsub('paladin', ('paladin'):color(258))
            :gsub('dark knight', ('dark knight'):color(258))
            :gsub('beastmaster', ('beastmaster'):color(258))
            :gsub('bard', ('bard'):color(258))
            :gsub('ranger', ('ranger'):color(258))
            :gsub('samurai', ('samurai'):color(258))
            :gsub('ninja', ('ninja'):color(258))
            :gsub('dragoon', ('dragoon'):color(258))
            :gsub('summoner', ('summoner'):color(258))
            :gsub('blue mage', ('blue mage'):color(258))
            :gsub('corsair', ('corsair'):color(258))
            :gsub('puppetmaster', ('puppetmaster'):color(258))
            :gsub('dancer', ('dancer'):color(258))
            :gsub('scholar', ('scholar'):color(258))
            :gsub('hand%-to%-hand', ('hand-to-hand'):color(258))
            :gsub('dagger', ('dagger'):color(258))
            :gsub('scythe', ('scythe'):color(258))
            :gsub('polearm', ('polearm'):color(258))
            :gsub('katana', ('katana'):color(258))
            :gsub('great katana', ('great katana'):color(258))
            :gsub('club', ('club'):color(258))
            :gsub('staff', ('staff'):color(258))
            :gsub('archery', ('archery'):color(258))
            :gsub('marksmanship', ('marksmanship'):color(258))
            :gsub('pet', ('pet'):color(258))
            :gsub('automaton', ('automaton'):color(258))
            :gsub('avatar', ('avatar'):color(258))
            :gsub('wyvern', ('wyvern'):color(258))
            :gsub('weapon skills', ('weapon skills'):color(258))
            :gsub('special attacks', ('special attacks'):color(258))
            :gsub('blood pacts', ('blood pacts'):color(258))

        windower.add_to_chat(12, '>>> '..original)
    elseif original:match('L\'un des points faibles') then
        if original:match('points faibles critiques') then
            original = original:gsub('points faibles critiques', ('points faibles critiques (5)'):color(258))
        elseif original:match('points faibles majeurs') then
            original = original:gsub('points faibles majeurs', ('points faibles majeurs (3)'):color(258))
        else
            original = original:gsub('points faibles', ('points faibles (1)'):color(258))
        end

        if original:match('grande ??p??e') then
            original = original:gsub('grande ??p??e', ('grande ??p??e'):color(258))
        elseif original:match('??p??e') then
            original = original:gsub('??p??e', ('??p??e'):color(258))
        elseif original:match('grande hache') then
            original = original:gsub('grande hache', ('grande hache'):color(258))
        elseif original:match('hache') then
            original = original:gsub('hache', ('hache'):color(258))
        end

        original = original
            :gsub('feu', ('feu'):color(258))
            :gsub('glace', ('glace'):color(258))
            :gsub('vent', ('vent'):color(258))
            :gsub('terre', ('terre'):color(258))
            :gsub('foudre', ('foudre'):color(258))
            :gsub('eau', ('eau'):color(258))
            :gsub('lumi??re', ('lumi??re'):color(258))
            :gsub('t??n??bres', ('t??n??bres'):color(258))
            :gsub('magie blanche', ('magie blanche'):color(258))
            :gsub('magie noire', ('magie noire'):color(258))
            :gsub('ninjutsu', ('ninjutsu'):color(258))
            :gsub('chant', ('chant'):color(258))
            :gsub('magie bleue', ('magie bleue'):color(258))
            :gsub('souffle', ('souffle'):color(258))

            :gsub('guerrier', ('guerrier'):color(258))
            :gsub('moine', ('moine'):color(258))
            :gsub('mage blanc', ('mage blanc'):color(258))
            :gsub('mage noir', ('mage noir'):color(258))
            :gsub('mage rouge', ('mage rouge'):color(258))
            :gsub('voleur', ('voleur'):color(258))
            :gsub('paladin', ('paladin'):color(258))
            :gsub('chevalier noir', ('chevalier noir'):color(258))
            :gsub('dresseur', ('dresseur'):color(258))
            :gsub('barde', ('barde'):color(258))
            :gsub('chasseur', ('chasseur'):color(258))
            :gsub('samoura??', ('samoura??'):color(258))
            :gsub('ninja', ('ninja'):color(258))
            :gsub('chevalier dragon', ('chevalier dragon'):color(258))
            :gsub('invocateur', ('invocateur'):color(258))
            :gsub('mage bleu', ('mage bleu'):color(258))
            :gsub('corsaire', ('corsaire'):color(258))
            :gsub('marionnettiste', ('marionnettiste'):color(258))
            :gsub('danseur', ('danseur'):color(258))
            :gsub('??rudit', ('??rudit'):color(258))

            :gsub('corps ?? corps', ('corps ?? corps'):color(258))
            :gsub('dague', ('dague'):color(258))
            :gsub('faux', ('faux'):color(258))
            :gsub('arme d\'hast', ('arme d\'hast'):color(258))
            :gsub('katana', ('katana'):color(258))
            :gsub('grand katana', ('grand katana'):color(258))
            :gsub('massue', ('massue'):color(258))
            :gsub('crosse', ('crosse'):color(258))
            :gsub('archerie', ('archerie'):color(258))
            :gsub('artillerie', ('artillerie'):color(258))
            :gsub('familier', ('familier'):color(258))
            :gsub('automate', ('automate'):color(258))
            :gsub('avatar', ('avatar'):color(258))
            :gsub('wyvern', ('wyvern'):color(258))
            :gsub('comp??tence arme', ('comp??tence arme'):color(258))
            :gsub('attaque sp??ciale', ('attaque sp??ciale'):color(258))
            :gsub('pacte de sang', ('pacte de sang'):color(258))

        windower.add_to_chat(12, '>>> '..original)
    elseif original:match('Das Monster ist nun') then
        if original:match('ganz besonders anf??llig') then
            original = original:gsub('ganz besonders anf??llig', ('ganz besonders anf??llig (5)'):color(258))
        elseif original:match('besonders anf??llig') then
            original = original:gsub('besonders anf??llig', ('besonders anf??llig (3)'):color(258))
        else
            original = original:gsub('anf??llig', ('anf??llig (1)'):color(258))
        end

        original = original
            :gsub('(%w+)%-Elementarschaden', ('%1'):color(258)..'-Elementarschaden')
            :gsub('(%w+)%-Magie', ('%1'):color(258)..'-Magie')
            :gsub('Wei??magie', ('Wei??magie'):color(258))
            :gsub('Schwarzmagie', ('Schwarzmagie'):color(258))
            :gsub('Ninjutsu', ('Ninjutsu'):color(258))
            :gsub('Gesang', ('Gesang'):color(258))
            :gsub('Blaumagie', ('Blaumagie'):color(258))

            :gsub('Kriegern', ('Kriegern'):color(258))
            :gsub('M??nchen', ('M??nchen'):color(258))
            :gsub('Wei??magiern', ('Wei??magiern'):color(258))
            :gsub('Schwarzmagiern', ('Schwarzmagiern'):color(258))
            :gsub('Rotmagiern', ('Rotmagiern'):color(258))
            :gsub('Dieben', ('Dieben'):color(258))
            :gsub('Paladinen', ('Paladinen'):color(258))
            :gsub('Dunkelrittern', ('Dunkelrittern'):color(258))
            :gsub('Bestienb??ndigern', ('Bestienb??ndigern'):color(258))
            :gsub('Barden', ('Barden'):color(258))
            :gsub('J??gern', ('J??gern'):color(258))
            :gsub('Samurai', ('Samurai'):color(258))
            :gsub('Ninja', ('Ninja'):color(258))
            :gsub('Dragoons', ('Dragoons'):color(258))
            :gsub('Beschw??rern', ('Beschw??rern'):color(258))
            :gsub('Blaumagiern', ('Blaumagiern'):color(258))
            :gsub('Freibeutern', ('Freibeutern'):color(258))
            :gsub('Puppenmeistern', ('Puppenmeistern'):color(258))
            :gsub('T??nzern', ('T??nzern'):color(258))
            :gsub('Gelehrten', ('Gelehrten'):color(258))

            :gsub('F??usten', ('F??usten'):color(258))
            :gsub('Dolchen', ('Dolchen'):color(258))
            :gsub('Schwertern', ('Schwertern'):color(258))
            :gsub('Gro??schwertern', ('Gro??schwertern'):color(258))
            :gsub('??xten', ('??xten'):color(258))
            :gsub('Gro????xten', ('Gro????xten'):color(258))
            :gsub('Sensen', ('Sensen'):color(258))
            :gsub('Lanzen', ('Lanzen'):color(258))
            :gsub('Katanas', ('Katanas'):color(258))
            :gsub('Gro??katanas', ('Gro??katanas'):color(258))
            :gsub('Keulen', ('Keulen'):color(258))
            :gsub('Kampfst??cken', ('Kampfst??cken'):color(258))
            :gsub('B??gen', ('B??gen'):color(258))
            :gsub('Schusswaffen', ('Schusswaffen'):color(258))
            :gsub('Haustieren', ('Haustieren'):color(258))
            :gsub('Automaten', ('Automaten'):color(258))
            :gsub('Avataren', ('Avataren'):color(258))
            :gsub('(Wyverns?)', ('%1'):color(258))
            :gsub('Waffenfertigkeiten', ('Waffenfertigkeiten'):color(258))
            :gsub('Spezialattacken', ('Spezialattacken'):color(258))
            :gsub('Blutsb??nde', ('Blutsb??nde'):color(258))

        --windower.add_to_chat(12, '>>> '..original)
        windower.chat.input('/p >>> ' .. original)
    end

    return modified, mode
end)
