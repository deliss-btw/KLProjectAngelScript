enum EHealHPType
{
    SkillHeal,
    NonSkillHeal,
    RecoverHp,
}

namespace HealHpUtils
{
bool HealHP(const FECSEntity &inout HealFromEntity, const FECSEntity &inout Entity, const FFPTime &inout Time, const float32 HP, const float32 HPRatio, const EHealHPType HealHPType, float32 &out RealHealHP)
{
    RealHealHP = 0.0f;
    Has local_6;
    bool local_8 = ECS::GetRuntimeInfo().IsClient && !(local_6.opCall());
    if (local_8)
    {
        return false;
    }
    Has local_12;
    if (local_12.opCall())
    {
        local_8 = true;
    }
    else
    {
        Has local_16;
        local_8 = local_16.opCall();
    }
    if (local_8)
    {
        return false;
    }
    if (Entity.MatchGameplayTag(GameplayTags::CombatState_Special_BanRecoverHP))
    {
        return false;
    }
    if (Entity.MatchGameplayTag(GameplayTags::CombatState_Special_BanHeal))
    {
        if (int(HealHPType) == 0 || (int(HealHPType) == 1))
        {
            return false;
        }
    }
    Get local_24;
    float32 local_25 = local_24.opCall().GetAttributeValue(Attribute::HPMax, Time);
    float32 local_19 = local_24.opCall().GetAttributeValue(Attribute::HP, Time);
    float32 local_40 = FMath::Max(0.0f, 1.0f + FGameAttributeUtils::GetAttributeValue(HealFromEntity, Attribute::SkillHealRatio, Time, true, 0.0f, false, FGameAttributeModificationValue()));
    float32 local_39 = FMath::Max(0.0f, 1.0f + FGameAttributeUtils::GetAttributeValue(Entity, Attribute::TakeHealRatio, Time, true, 0.0f, false, FGameAttributeModificationValue()));
    float32 local_41 = FMath::Max(0.0f, 1.0f + FGameAttributeUtils::GetAttributeValue(Entity, Attribute::RecoverHpRatio, Time, true, 0.0f, false, FGameAttributeModificationValue()));
    float32 local_42 = (local_25 * HPRatio) + HP;
    if (int(HealHPType) == 0)
    {
        local_42 = local_42 * ((local_40 * local_39) * local_41);
    }
    else
    {
        if (int(HealHPType) == 1)
        {
            local_42 = local_42 * (local_39 * local_41);
        }
        else
        {
            if (int(HealHPType) == 2)
            {
                local_42 = local_42 * local_41;
            }
        }
    }
    float32 local_43 = FMath::Max(0.0f, local_42);
    RealHealHP = float32((FMath::Clamp(local_42, 0.0, (local_25 - local_19))));
    FGameAttributeUtils::Recover(Entity, Attribute::HP, Time, local_42, -1.0f);
    if (!((HealFromEntity == ENTITY_NULL)))
    {
        ModifyOrAdd local_56;
        local_56.opCall().AddRecord(Time, RealHealHP, EHealHPType(HealHPType), Entity);
    }
    if (int(HealHPType) != 2)
    {
        FCE_HealOtherEvent local_62;
        CommissionStatsUtils::AddHealToHP(HealFromEntity, Entity, RealHealHP, local_19, local_25);
        local_62.HealFromEntity = HealFromEntity;
        local_62.HealedEntity = Entity;
        local_62.HealHPType = HealHPType;
        local_62.TotalHealHP = local_43;
        local_62.RealHealHP = RealHealHP;
        local_62.OverHealHP = (local_43 - RealHealHP);
    }
    FCE_HealedEvent local_68;
    local_68.HealFromEntity = HealFromEntity;
    local_68.HealedEntity = Entity;
    local_68.HealHPType = HealHPType;
    local_68.TotalHealHP = local_43;
    local_68.RealHealHP = RealHealHP;
    local_68.OverHealHP = (local_43 - RealHealHP);
    return true;
}
}
