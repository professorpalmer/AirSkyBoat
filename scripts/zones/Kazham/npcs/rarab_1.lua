-----------------------------------
-- Area: Kazham
--  NPC: Rarab
-- Nonstandard NPC w/o Nametag
-----------------------------------
require("scripts/globals/pathfind")
-----------------------------------
local entity = {}

local path =
{
    98.726, -14.000, -100.304,
    98.726, -14.000, -100.304,
    98.726, -14.000, -100.304,
    102.019, -14.000, -103.237,
    102.019, -14.000, -103.237,
    103.099, -14.000, -100.815,
    103.099, -14.000, -100.815,
    103.099, -14.000, -100.815,
    103.099, -14.000, -100.815,
    100.966, -14.000, -101.352,
    100.966, -14.000, -101.352,
    100.966, -14.000, -101.352,
    100.966, -14.000, -101.352,
    96.692, -14.000, -102.157,
    96.692, -14.000, -102.157,
    96.508, -14.000, -100.242,
    96.508, -14.000, -100.242,
    96.508, -14.000, -100.242,
    96.508, -14.000, -100.242,
    96.508, -14.000, -100.242,
    100.919, -14.000, -104.135,
    100.919, -14.000, -104.135,
    100.919, -14.000, -104.135,
}

entity.onSpawn = function(npc)
    npc:initNpcAi()
    npc:setPos(xi.path.first(path))
end

entity.onPath = function(npc)
    xi.path.patrol(npc, path, xi.path.flag.RUN)
end

return entity