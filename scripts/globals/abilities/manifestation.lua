-----------------------------------
-- Ability: Manifestation
-- Extends the effect of your next enfeebling1 black magic spell to targets within range. MP cost and casting time2 are doubled.
-- Obtained: Scholar Level 40
-- Recast Time: Stratagem Charge
-- Duration: 1 compatible black magic spell or 60 seconds, whichever occurs first
--
-- Level   |Charges |Recharge Time per Charge
-- -----   -------- ---------------
-- 10      |1       |4:00 minutes
-- 30      |2       |2:00 minutes
-- 50      |3       |1:20 minutes
-- 70      |4       |1:00 minute
-- 90      |5       |48 seconds
-----------------------------------
require("scripts/globals/msg")
-----------------------------------
local abilityObject = {}

abilityObject.onAbilityCheck = function(player, target, ability)
    if player:hasStatusEffect(xi.effect.MANIFESTATION) then
        return xi.msg.basic.EFFECT_ALREADY_ACTIVE, 0
    end

    return 0, 0
end

abilityObject.onUseAbility = function(player, target, ability)
    player:addStatusEffect(xi.effect.MANIFESTATION, 1, 0, 60)

    return xi.effect.MANIFESTATION
end

return abilityObject
