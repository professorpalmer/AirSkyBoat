-----------------------------------
--   Spell: Poison
-----------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
-----------------------------------
local spellObject = {}

spellObject.onMagicCastingCheck = function(caster, target, spell)
    return 0
end

spellObject.onSpellCast = function(caster, target, spell)
    if target:hasImmunity(xi.immunity.POISON) then
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
        return
    end

    local dINT = caster:getStat(xi.mod.INT) - target:getStat(xi.mod.INT)
    local power = 4
    local duration = xi.magic.calculateDuration(30, spell:getSkillType(), spell:getSpellGroup(), caster, target)

    local params = {}
    params.diff = dINT
    params.skillType = xi.skill.ENFEEBLING_MAGIC
    params.bonus = 0
    params.effect = xi.effect.POISON
    params.tier = 1

    if not xi.magic.differentEffect(caster, target, spell, params) then
        spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
        return params.effect
    end

    local resist = xi.magic.applyResistanceEffect(caster, target, spell, params)

    if resist >= 0.5 then -- effect taken
        local resduration = duration * resist

        resduration = xi.magic.calculateBuildDuration(target, resduration, params.effect, caster)

        if target:addStatusEffect(params.effect, power, 3, resduration, 0, params.tier) then
            spell:setMsg(xi.msg.basic.MAGIC_ENFEEB_IS)
            xi.magic.handleBurstMsg(caster, target, spell)
        else
            spell:setMsg(xi.msg.basic.MAGIC_NO_EFFECT)
        end
    else -- resist entirely.
        spell:setMsg(xi.msg.basic.MAGIC_RESIST)
    end

    return params.effect
end

return spellObject
