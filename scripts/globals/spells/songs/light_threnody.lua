-----------------------------------
-- Spell: Threnody - xi.mod.LIGHT_MEVA
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    return xi.magic.handleThrenody(caster, target, spell, 50, 60, xi.mod.LIGHT_MEVA)
end

return spellObject
