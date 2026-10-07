

// NOTE: class defaults are not authored in this module: UGameAttribute_HP (default scalar field UGameAttribute.bExposeToView has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class UGameAttribute_HP : UGameAttributeConsumable
{
    UGameAttribute_HP()
    {
        return;
    }
}

class UGameAttribute_HPMax : UGameAttribute
{
    UGameAttribute_HPMax()
    {
        return;
    }
    UFUNCTION()
    void OnValueChange_Implementation(const FECSEntity &inout Entity, const FFPTime &inout Time, const float32 OldValue, const float32 NewValue) const
    {
        ::GameAttributeCalculation::UpdateCurValueByMax_IncreaseScalar(Entity, Time, OldValue, NewValue, Attribute::HP);
        return;
    }
}

class UGameAttribute_Posture : UGameAttributeConsumable
{
    UGameAttribute_Posture()
    {
        return;
    }
}

class UGameAttribute_PostureRecoverDelay : UGameAttribute
{
    UGameAttribute_PostureRecoverDelay()
    {
        return;
    }
}

class UGameAttribute_PostureRecoverSpeed : UGameAttribute
{
    UGameAttribute_PostureRecoverSpeed()
    {
        return;
    }
}

class UGameAttribute_PostureMax : UGameAttribute
{
    UGameAttribute_PostureMax()
    {
        return;
    }
    UFUNCTION()
    void OnValueChange_Implementation(const FECSEntity &inout Entity, const FFPTime &inout Time, const float32 OldValue, const float32 NewValue) const
    {
        ::GameAttributeCalculation::UpdateCurValueByMax_IncreaseScalar(Entity, Time, OldValue, NewValue, Attribute::Posture);
        return;
    }
}

class UGameAttribute_TempPosture : UGameAttribute
{
    UGameAttribute_TempPosture()
    {
        return;
    }
}

class UGameAttribute_EcologyPosture : UGameAttributeConsumable
{
    UGameAttribute_EcologyPosture()
    {
        return;
    }
}

class UGameAttribute_EcologyPostureRecoverDelay : UGameAttribute
{
    UGameAttribute_EcologyPostureRecoverDelay()
    {
        return;
    }
}

class UGameAttribute_EcologyPostureRecoverSpeed : UGameAttribute
{
    UGameAttribute_EcologyPostureRecoverSpeed()
    {
        return;
    }
}

class UGameAttribute_EcologyPostureMax : UGameAttribute
{
    UGameAttribute_EcologyPostureMax()
    {
        return;
    }
    UFUNCTION()
    void OnValueChange_Implementation(const FECSEntity &inout Entity, const FFPTime &inout Time, const float32 OldValue, const float32 NewValue) const
    {
        ::GameAttributeCalculation::UpdateCurValueByMax_IncreaseScalar(Entity, Time, OldValue, NewValue, Attribute::EcologyPosture);
        return;
    }
}

class UGameAttribute_StaminaRecoverDelay : UGameAttribute
{
    UGameAttribute_StaminaRecoverDelay()
    {
        return;
    }
}

class UGameAttribute_StaminaRecoverSpeed : UGameAttribute
{
    UGameAttribute_StaminaRecoverSpeed()
    {
        return;
    }
}

class UGameAttribute_StaminaMax : UGameAttribute
{
    UGameAttribute_StaminaMax()
    {
        return;
    }
    UFUNCTION()
    void OnValueChange_Implementation(const FECSEntity &inout Entity, const FFPTime &inout Time, const float32 OldValue, const float32 NewValue) const
    {
        ::GameAttributeCalculation::UpdateCurValueByMax_IncreaseScalar(Entity, Time, OldValue, NewValue, Attribute::Stamina);
        return;
    }
}

class UGameAttribute_Stamina : UGameAttributeConsumable
{
    UGameAttribute_Stamina()
    {
        return;
    }
}

class UGameAttribute_StaminaConsumeCoefficient : UGameAttribute
{
    UGameAttribute_StaminaConsumeCoefficient()
    {
        return;
    }
}

class UGameAttribute_Shield : UGameAttributeConsumable
{
    UGameAttribute_Shield()
    {
        return;
    }
}

class UGameAttribute_ShieldMax : UGameAttributeConsumable
{
    UGameAttribute_ShieldMax()
    {
        return;
    }
}

class UGameAttribute_ChargeEnergy : UGameAttributeConsumable
{
    UGameAttribute_ChargeEnergy()
    {
        return;
    }
}

class UGameAttribute_ChargeEnergyMax : UGameAttribute
{
    UGameAttribute_ChargeEnergyMax()
    {
        return;
    }
}

class UGameAttribute_UltraSkillEnergy : UGameAttributeConsumable
{
    UGameAttribute_UltraSkillEnergy()
    {
        return;
    }
}

class UGameAttribute_UltraSkillEnergyRecoverCoefficient : UGameAttribute
{
    UGameAttribute_UltraSkillEnergyRecoverCoefficient()
    {
        return;
    }
}

class UGameAttribute_UltraSkillEnergyMax : UGameAttribute
{
    UGameAttribute_UltraSkillEnergyMax()
    {
        return;
    }
}

class UGameAttribute_SimpleSkillEnergy : UGameAttributeConsumable
{
    UGameAttribute_SimpleSkillEnergy()
    {
        return;
    }
}

class UGameAttribute_SimpleSkillEnergyRecoverCoefficient : UGameAttribute
{
    UGameAttribute_SimpleSkillEnergyRecoverCoefficient()
    {
        return;
    }
}

class UGameAttribute_SimpleSkillEnergyMax : UGameAttribute
{
    UGameAttribute_SimpleSkillEnergyMax()
    {
        return;
    }
}

class UGameAttribute_SimpleSkillEnergyRecoverSpeed : UGameAttribute
{
    UGameAttribute_SimpleSkillEnergyRecoverSpeed()
    {
        return;
    }
}

class UGameAttribute_ExtraSkillEnergy : UGameAttributeConsumable
{
    UGameAttribute_ExtraSkillEnergy()
    {
        return;
    }
}

class UGameAttribute_ExtraSkillEnergyRecoverCoefficient : UGameAttribute
{
    UGameAttribute_ExtraSkillEnergyRecoverCoefficient()
    {
        return;
    }
}

class UGameAttribute_ExtraSkillEnergyMax : UGameAttribute
{
    UGameAttribute_ExtraSkillEnergyMax()
    {
        return;
    }
}

class UGameAttribute_ExtraSkillEnergyRecoverSpeed : UGameAttribute
{
    UGameAttribute_ExtraSkillEnergyRecoverSpeed()
    {
        return;
    }
}

class UGameAttribute_CustomSkillEnergy : UGameAttributeConsumable
{
    UGameAttribute_CustomSkillEnergy()
    {
        return;
    }
}

class UGameAttribute_CustomSkillEnergyEnergyConsumeCoefficient : UGameAttributeConsumable
{
    UGameAttribute_CustomSkillEnergyEnergyConsumeCoefficient()
    {
        return;
    }
}

class UGameAttribute_CustomSkillEnergyEnergyRecoverCoefficient : UGameAttributeConsumable
{
    UGameAttribute_CustomSkillEnergyEnergyRecoverCoefficient()
    {
        return;
    }
}

class UGameAttribute_CustomSkillEnergyMin : UGameAttribute
{
    UGameAttribute_CustomSkillEnergyMin()
    {
        return;
    }
    UFUNCTION()
    void OnValueChange_Implementation(const FECSEntity &inout Entity, const FFPTime &inout Time, const float32 OldValue, const float32 NewValue) const
    {
        ::GameAttributeCalculation::UpdateCurValueByMin_Limit(Entity, Time, OldValue, NewValue, Attribute::CustomSkillEnergy);
        return;
    }
}

class UGameAttribute_CustomSkillEnergyMax : UGameAttribute
{
    UGameAttribute_CustomSkillEnergyMax()
    {
        return;
    }
    UFUNCTION()
    void OnValueChange_Implementation(const FECSEntity &inout Entity, const FFPTime &inout Time, const float32 OldValue, const float32 NewValue) const
    {
        ::GameAttributeCalculation::UpdateCurValueByMax_Limit(Entity, Time, OldValue, NewValue, Attribute::CustomSkillEnergy);
        return;
    }
}

class UGameAttribute_CustomSkillEnergyRecoverDelay : UGameAttribute
{
    UGameAttribute_CustomSkillEnergyRecoverDelay()
    {
        return;
    }
}

class UGameAttribute_CustomSkillEnergyRecoverSpeed : UGameAttribute
{
    UGameAttribute_CustomSkillEnergyRecoverSpeed()
    {
        return;
    }
}

class UGameAttribute_CustomSkillEnergy_2 : UGameAttributeConsumable
{
    UGameAttribute_CustomSkillEnergy_2()
    {
        return;
    }
}

class UGameAttribute_CustomSkillEnergyEnergyConsumeCoefficient_2 : UGameAttributeConsumable
{
    UGameAttribute_CustomSkillEnergyEnergyConsumeCoefficient_2()
    {
        return;
    }
}

class UGameAttribute_CustomSkillEnergyEnergyRecoverCoefficient_2 : UGameAttributeConsumable
{
    UGameAttribute_CustomSkillEnergyEnergyRecoverCoefficient_2()
    {
        return;
    }
}

class UGameAttribute_CustomSkillEnergyMin_2 : UGameAttribute
{
    UGameAttribute_CustomSkillEnergyMin_2()
    {
        return;
    }
    UFUNCTION()
    void OnValueChange_Implementation(const FECSEntity &inout Entity, const FFPTime &inout Time, const float32 OldValue, const float32 NewValue) const
    {
        ::GameAttributeCalculation::UpdateCurValueByMin_Limit(Entity, Time, OldValue, NewValue, Attribute::CustomSkillEnergy_2);
        return;
    }
}

class UGameAttribute_CustomSkillEnergyMax_2 : UGameAttribute
{
    UGameAttribute_CustomSkillEnergyMax_2()
    {
        return;
    }
    UFUNCTION()
    void OnValueChange_Implementation(const FECSEntity &inout Entity, const FFPTime &inout Time, const float32 OldValue, const float32 NewValue) const
    {
        ::GameAttributeCalculation::UpdateCurValueByMax_Limit(Entity, Time, OldValue, NewValue, Attribute::CustomSkillEnergy_2);
        return;
    }
}

class UGameAttribute_CustomSkillEnergyRecoverDelay_2 : UGameAttribute
{
    UGameAttribute_CustomSkillEnergyRecoverDelay_2()
    {
        return;
    }
}

class UGameAttribute_CustomSkillEnergyRecoverSpeed_2 : UGameAttribute
{
    UGameAttribute_CustomSkillEnergyRecoverSpeed_2()
    {
        return;
    }
}

class UGameAttribute_CustomSkillEnergy_3 : UGameAttributeConsumable
{
    UGameAttribute_CustomSkillEnergy_3()
    {
        return;
    }
}

class UGameAttribute_CustomSkillEnergyEnergyConsumeCoefficient_3 : UGameAttributeConsumable
{
    UGameAttribute_CustomSkillEnergyEnergyConsumeCoefficient_3()
    {
        return;
    }
}

class UGameAttribute_CustomSkillEnergyEnergyRecoverCoefficient_3 : UGameAttribute
{
    UGameAttribute_CustomSkillEnergyEnergyRecoverCoefficient_3()
    {
        return;
    }
}

class UGameAttribute_CustomSkillEnergyMin_3 : UGameAttribute
{
    UGameAttribute_CustomSkillEnergyMin_3()
    {
        return;
    }
    UFUNCTION()
    void OnValueChange_Implementation(const FECSEntity &inout Entity, const FFPTime &inout Time, const float32 OldValue, const float32 NewValue) const
    {
        ::GameAttributeCalculation::UpdateCurValueByMin_Limit(Entity, Time, OldValue, NewValue, Attribute::CustomSkillEnergy_3);
        return;
    }
}

class UGameAttribute_CustomSkillEnergyMax_3 : UGameAttribute
{
    UGameAttribute_CustomSkillEnergyMax_3()
    {
        return;
    }
    UFUNCTION()
    void OnValueChange_Implementation(const FECSEntity &inout Entity, const FFPTime &inout Time, const float32 OldValue, const float32 NewValue) const
    {
        ::GameAttributeCalculation::UpdateCurValueByMax_Limit(Entity, Time, OldValue, NewValue, Attribute::CustomSkillEnergy_3);
        return;
    }
}

class UGameAttribute_CustomSkillEnergyRecoverDelay_3 : UGameAttribute
{
    UGameAttribute_CustomSkillEnergyRecoverDelay_3()
    {
        return;
    }
}

class UGameAttribute_CustomSkillEnergyRecoverSpeed_3 : UGameAttribute
{
    UGameAttribute_CustomSkillEnergyRecoverSpeed_3()
    {
        return;
    }
}

class UGameAttribute_CustomSkillEnergy_4 : UGameAttributeConsumable
{
    UGameAttribute_CustomSkillEnergy_4()
    {
        return;
    }
}

class UGameAttribute_CustomSkillEnergyEnergyConsumeCoefficient_4 : UGameAttributeConsumable
{
    UGameAttribute_CustomSkillEnergyEnergyConsumeCoefficient_4()
    {
        return;
    }
}

class UGameAttribute_CustomSkillEnergyEnergyRecoverCoefficient_4 : UGameAttribute
{
    UGameAttribute_CustomSkillEnergyEnergyRecoverCoefficient_4()
    {
        return;
    }
}

class UGameAttribute_CustomSkillEnergyMin_4 : UGameAttribute
{
    UGameAttribute_CustomSkillEnergyMin_4()
    {
        return;
    }
}

class UGameAttribute_CustomSkillEnergyMax_4 : UGameAttribute
{
    UGameAttribute_CustomSkillEnergyMax_4()
    {
        return;
    }
}

class UGameAttribute_CustomSkillEnergyRecoverDelay_4 : UGameAttribute
{
    UGameAttribute_CustomSkillEnergyRecoverDelay_4()
    {
        return;
    }
}

class UGameAttribute_CustomSkillEnergyRecoverSpeed_4 : UGameAttribute
{
    UGameAttribute_CustomSkillEnergyRecoverSpeed_4()
    {
        return;
    }
}

class UGameAttribute_SimpleSkillRecoverSpeed : UGameAttribute
{
    UGameAttribute_SimpleSkillRecoverSpeed()
    {
        return;
    }
}

class UGameAttribute_SwitchPlayerEnergy_Max : UGameAttribute
{
    UGameAttribute_SwitchPlayerEnergy_Max()
    {
        return;
    }
}

class UGameAttribute_SwitchPlayerEnergyRecoverCoefficient : UGameAttribute
{
    UGameAttribute_SwitchPlayerEnergyRecoverCoefficient()
    {
        return;
    }
}

class UGameAttribute_SwitchPlayerEnergy : UGameAttributeConsumable
{
    UGameAttribute_SwitchPlayerEnergy()
    {
        return;
    }
}

class UGameAttribute_SwitchPlayerEnergy_RecoverSpeed : UGameAttribute
{
    UGameAttribute_SwitchPlayerEnergy_RecoverSpeed()
    {
        return;
    }
}

class UGameAttribute_EscapeEnergy : UGameAttributeConsumable
{
    UGameAttribute_EscapeEnergy()
    {
        return;
    }
}

class UGameAttribute_EscapeEnergy_Max : UGameAttribute
{
    UGameAttribute_EscapeEnergy_Max()
    {
        return;
    }
}

class UGameAttribute_EscapeEnergy_RecoverSpeed : UGameAttribute
{
    UGameAttribute_EscapeEnergy_RecoverSpeed()
    {
        return;
    }
}

class UGameAttribute_BaseHatred : UGameAttribute
{
    UGameAttribute_BaseHatred()
    {
        return;
    }
}

class UGameAttribute_ChargeSpeed : UGameAttribute
{
    UGameAttribute_ChargeSpeed()
    {
        return;
    }
}

class UGameAttribute_CastingSpeed : UGameAttribute
{
    UGameAttribute_CastingSpeed()
    {
        return;
    }
}

class UGameAttribute_MutualClashMax : UGameAttributeConsumable
{
    UGameAttribute_MutualClashMax()
    {
        return;
    }
    UFUNCTION()
    void OnValueChange_Implementation(const FECSEntity &inout Entity, const FFPTime &inout Time, const float32 OldValue, const float32 NewValue) const
    {
        ::GameAttributeCalculation::UpdateCurValueByMax_IncreaseScalar(Entity, Time, OldValue, NewValue, Attribute::MutualClash);
        return;
    }
}

class UGameAttribute_MutualClashCoefficient : UGameAttribute
{
    UGameAttribute_MutualClashCoefficient()
    {
        return;
    }
}

class UGameAttribute_MutualClash : UGameAttributeConsumable
{
    UGameAttribute_MutualClash()
    {
        return;
    }
}

class UGameAttribute_HealEffect : UGameAttribute
{
    UGameAttribute_HealEffect()
    {
        return;
    }
}

class UGameAttribute_SkillHealRatio : UGameAttribute
{
    UGameAttribute_SkillHealRatio()
    {
        return;
    }
}

class UGameAttribute_TakeHealRatio : UGameAttribute
{
    UGameAttribute_TakeHealRatio()
    {
        return;
    }
}

class UGameAttribute_RecoverHpRatio : UGameAttribute
{
    UGameAttribute_RecoverHpRatio()
    {
        return;
    }
}

class UGameAttribute_Attack : UGameAttribute
{
    UGameAttribute_Attack()
    {
        return;
    }
}

class UGameAttribute_DamageAddRatio : UGameAttribute
{
    UGameAttribute_DamageAddRatio()
    {
        return;
    }
}

class UGameAttribute_TeamDamageAddRatio : UGameAttributeModifyNonStackable
{
    UGameAttribute_TeamDamageAddRatio()
    {
        return;
    }
}

class UGameAttribute_CriticalRating : UGameAttribute
{
    UGameAttribute_CriticalRating()
    {
        return;
    }
}

class UGameAttribute_CriticalDamage : UGameAttribute
{
    UGameAttribute_CriticalDamage()
    {
        return;
    }
}

class UGameAttribute_PhysicalDamage : UGameAttribute
{
    UGameAttribute_PhysicalDamage()
    {
        return;
    }
}

class UGameAttribute_PowerDamage : UGameAttribute
{
    UGameAttribute_PowerDamage()
    {
        return;
    }
}

class UGameAttribute_FireDamage : UGameAttribute
{
    UGameAttribute_FireDamage()
    {
        return;
    }
}

class UGameAttribute_ThunderDamage : UGameAttribute
{
    UGameAttribute_ThunderDamage()
    {
        return;
    }
}

class UGameAttribute_IceDamage : UGameAttribute
{
    UGameAttribute_IceDamage()
    {
        return;
    }
}

class UGameAttribute_LightDamage : UGameAttribute
{
    UGameAttribute_LightDamage()
    {
        return;
    }
}

class UGameAttribute_ShadowDamage : UGameAttribute
{
    UGameAttribute_ShadowDamage()
    {
        return;
    }
}

class UGameAttribute_ExecutionDamageAddRatio : UGameAttribute
{
    UGameAttribute_ExecutionDamageAddRatio()
    {
        return;
    }
}

class UGameAttribute_PostureAttack : UGameAttribute
{
    UGameAttribute_PostureAttack()
    {
        return;
    }
}

class UGameAttribute_PostureDamageAddRatio : UGameAttribute
{
    UGameAttribute_PostureDamageAddRatio()
    {
        return;
    }
}

class UGameAttribute_EcologyPostureAttack : UGameAttribute
{
    UGameAttribute_EcologyPostureAttack()
    {
        return;
    }
}

class UGameAttribute_Defense : UGameAttribute
{
    UGameAttribute_Defense()
    {
        return;
    }
}

class UGameAttribute_TakeDamageReduceRatio : UGameAttribute
{
    UGameAttribute_TakeDamageReduceRatio()
    {
        return;
    }
}

class UGameAttribute_InnateDamageReduceRatio : UGameAttribute
{
    UGameAttribute_InnateDamageReduceRatio()
    {
        return;
    }
}

class UGameAttribute_IndependentTakeDamageRatio : UGameAttribute
{
    UGameAttribute_IndependentTakeDamageRatio()
    {
        return;
    }
}

class UGameAttribute_TakePhysicalDamage : UGameAttribute
{
    UGameAttribute_TakePhysicalDamage()
    {
        return;
    }
}

class UGameAttribute_TakePowerDamage : UGameAttribute
{
    UGameAttribute_TakePowerDamage()
    {
        return;
    }
}

class UGameAttribute_TakeFireDamage : UGameAttribute
{
    UGameAttribute_TakeFireDamage()
    {
        return;
    }
}

class UGameAttribute_TakeThunderDamage : UGameAttribute
{
    UGameAttribute_TakeThunderDamage()
    {
        return;
    }
}

class UGameAttribute_TakeIceDamage : UGameAttribute
{
    UGameAttribute_TakeIceDamage()
    {
        return;
    }
}

class UGameAttribute_TakeLightDamage : UGameAttribute
{
    UGameAttribute_TakeLightDamage()
    {
        return;
    }
}

class UGameAttribute_TakeShadowDamage : UGameAttribute
{
    UGameAttribute_TakeShadowDamage()
    {
        return;
    }
}

class UGameAttribute_GuardStateDamageRatio : UGameAttribute
{
    UGameAttribute_GuardStateDamageRatio()
    {
        return;
    }
}

class UGameAttribute_Vulnerable : UGameAttribute
{
    UGameAttribute_Vulnerable()
    {
        return;
    }
}

class UGameAttribute_TeamVulnerable : UGameAttributeModifyNonStackable
{
    UGameAttribute_TeamVulnerable()
    {
        return;
    }
}

class UGameAttribute_TakePostureDamageReduceRatio : UGameAttribute
{
    UGameAttribute_TakePostureDamageReduceRatio()
    {
        return;
    }
}

class UGameAttribute_TakePostureDamageAddRatio : UGameAttribute
{
    UGameAttribute_TakePostureDamageAddRatio()
    {
        return;
    }
}

class UGameAttribute_EnvBreakHPMax : UGameAttribute
{
    UGameAttribute_EnvBreakHPMax()
    {
        return;
    }
}

class UGameAttribute_EnvBreakHP : UGameAttributeConsumable
{
    UGameAttribute_EnvBreakHP()
    {
        return;
    }
}

class UGameAttribute_ProjectileAttenuationRangeScale : UGameAttribute
{
    UGameAttribute_ProjectileAttenuationRangeScale()
    {
        return;
    }
}

class UGameAttribute_ProjectileAttenuationValueScale : UGameAttribute
{
    UGameAttribute_ProjectileAttenuationValueScale()
    {
        return;
    }
}

class UGameAttribute_RescueNearDeathTeammateProgressScale : UGameAttribute
{
    UGameAttribute_RescueNearDeathTeammateProgressScale()
    {
        return;
    }
}

namespace GameAttributeCalculation
{
void UpdateCurValueByMax_IncreaseScalar(const FECSEntity &inout Entity, const FFPTime &inout Time, const float32 OldMaxValue, const float32 NewMaxValue, const FGameAttributeRef &inout AttributeRef)
{
    int local_8 = 0;
    if (NewMaxValue > OldMaxValue)
    {
        float32 local_11 = (local_8.GetAttributeValue(AttributeRef, Time) / OldMaxValue) * NewMaxValue;
        FGameAttributeUtils::ChangeConsumeValue(Entity, AttributeRef, Time, local_11, -1.0f);
        return;
    }
    if (local_8.GetAttributeValue(AttributeRef, Time) > NewMaxValue)
    {
        FGameAttributeUtils::ChangeConsumeValue(Entity, AttributeRef, Time, NewMaxValue, -1.0f);
    }
    return;
}
void UpdateCurValueByMax_Limit(const FECSEntity &inout Entity, const FFPTime &inout Time, const float32 OldMaxValue, const float32 NewMaxValue, const FGameAttributeRef &inout AttributeRef)
{
    int local_8 = 0;
    if (NewMaxValue < OldMaxValue)
    {
        if (local_8.GetAttributeValue(AttributeRef, Time) > NewMaxValue)
        {
            FGameAttributeUtils::ChangeConsumeValue(Entity, AttributeRef, Time, NewMaxValue, -1.0f);
        }
    }
    return;
}
void UpdateCurValueByMin_Limit(const FECSEntity &inout Entity, const FFPTime &inout Time, const float32 OldMinValue, const float32 NewMinValue, const FGameAttributeRef &inout AttributeRef)
{
    int local_8 = 0;
    if (NewMinValue > OldMinValue)
    {
        if (local_8.GetAttributeValue(AttributeRef, Time) < NewMinValue)
        {
            FGameAttributeUtils::ChangeConsumeValue(Entity, AttributeRef, Time, NewMinValue, -1.0f);
        }
    }
    return;
}
}
