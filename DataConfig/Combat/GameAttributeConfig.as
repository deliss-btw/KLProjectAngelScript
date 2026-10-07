

struct FGameAttributeInitConfigBase : FDataObject
{
    FDataObject _base_FDataObject;

    FGameAttributeInitConfigBase()
    {
        return;
    }
}

struct FGameAttributeInitConfig_Avatar : FGameAttributeInitConfigBase
{
    FGameAttributeInitConfigBase _base_FGameAttributeInitConfigBase;
    UPROPERTY()
    float32 HP;
    UPROPERTY()
    float32 HPMax;
    UPROPERTY()
    float32 Posture;
    UPROPERTY()
    float32 PostureMax;
    UPROPERTY()
    float32 PostureRecoverDelay;
    UPROPERTY()
    float32 PostureRecoverSpeed;
    UPROPERTY()
    float32 StaminaMax = 100.0f;
    UPROPERTY()
    float32 StaminaRecoverSpeed = 35.0f;
    UPROPERTY()
    float32 SwitchPlayerEnergy_Max = 100.0f;
    UPROPERTY()
    float32 SwitchPlayerEnergy_RecoverSpeed = 0.0f;
    UPROPERTY()
    float32 SwitchPlayerEnergyRecoverCoefficient = 1.0f;
    UPROPERTY()
    float32 EscapeEnergy = 0.0f;
    UPROPERTY()
    float32 EscapeEnergy_Max = 0.0f;
    UPROPERTY()
    float32 EscapeEnergy_RecoverSpeed = 0.0f;
    UPROPERTY()
    float32 Burning_AccumulationMax = 100.0f;
    UPROPERTY()
    float32 Burning_AccumulationCoefficient = 1.0f;
    UPROPERTY()
    float32 Burning_RecoverDelay = 1.0f;
    UPROPERTY()
    float32 Burning_RecoverSpeed = 1.0f;
    UPROPERTY()
    float32 Poisoning_AccumulationMax = 100.0f;
    UPROPERTY()
    float32 Poisoning_AccumulationCoefficient = 1.0f;
    UPROPERTY()
    float32 Poisoning_RecoverDelay = 1.0f;
    UPROPERTY()
    float32 Poisoning_RecoverSpeed = 0.5f;
    UPROPERTY()
    float32 Doomed_AccumulationMax = 100.0f;
    UPROPERTY()
    float32 Doomed_AccumulationCoefficient = 1.0f;
    UPROPERTY()
    float32 Doomed_RecoverDelay = 1.0f;
    UPROPERTY()
    float32 Doomed_RecoverSpeed = 0.5f;
    UPROPERTY()
    float32 Dizzy_AccumulationMax = 100.0f;
    UPROPERTY()
    float32 Dizzy_AccumulationCoefficient = 1.0f;
    UPROPERTY()
    float32 Dizzy_RecoverDelay = 1.0f;
    UPROPERTY()
    float32 Dizzy_RecoverSpeed = 0.5f;
    UPROPERTY()
    float32 HotSpring_AccumulationMax = 100.0f;
    UPROPERTY()
    float32 HotSpring_AccumulationCoefficient = 1.0f;
    UPROPERTY()
    float32 HotSpring_RecoverDelay = 1.0f;
    UPROPERTY()
    float32 HotSpring_RecoverSpeed = 0.5f;
    UPROPERTY()
    float32 LeylineMiasma_AccumulationMax = 100.0f;
    UPROPERTY()
    float32 LeylineMiasma_AccumulationCoefficient = 1.0f;
    UPROPERTY()
    float32 LeylineMiasma_RecoverDelay = 1.0f;
    UPROPERTY()
    float32 LeylineMiasma_RecoverSpeed = 10.0f;
    UPROPERTY()
    float32 Freeze_AccumulationMax = 100.0f;
    UPROPERTY()
    float32 Freeze_AccumulationCoefficient = 1.0f;
    UPROPERTY()
    float32 Freeze_RecoverDelay = 1.0f;
    UPROPERTY()
    float32 Freeze_RecoverSpeed = 0.5f;
    UPROPERTY()
    float32 Electrified_AccumulationMax = 100.0f;
    UPROPERTY()
    float32 Electrified_AccumulationCoefficient = 1.0f;
    UPROPERTY()
    float32 Electrified_RecoverDelay = 1.0f;
    UPROPERTY()
    float32 Electrified_RecoverSpeed = 0.5f;
    UPROPERTY()
    float32 Light_AccumulationMax = 100.0f;
    UPROPERTY()
    float32 Light_AccumulationCoefficient = 1.0f;
    UPROPERTY()
    float32 Light_RecoverDelay = 1.0f;
    UPROPERTY()
    float32 Light_RecoverSpeed = 0.5f;
    UPROPERTY()
    float32 Dark_AccumulationMax = 100.0f;
    UPROPERTY()
    float32 Dark_AccumulationCoefficient = 1.0f;
    UPROPERTY()
    float32 Dark_RecoverDelay = 1.0f;
    UPROPERTY()
    float32 Dark_RecoverSpeed = 0.5f;
    UPROPERTY()
    float32 BaseHatred = 0.0f;
    UPROPERTY()
    float32 Attack;
    UPROPERTY()
    float32 PostureAttack;
    UPROPERTY()
    float32 EcologyPostureAttack;
    UPROPERTY()
    float32 Defense = 0.0f;
    UPROPERTY()
    float32 InnateDamageReduceRatio = 0.0f;
    UPROPERTY()
    float32 CriticalRating = 0.0f;
    UPROPERTY()
    float32 CriticalDamage = 0.0f;
    UPROPERTY()
    float32 SimpleSkillEnergy = 100.0f;
    UPROPERTY()
    float32 SimpleSkillEnergyMax = 100.0f;
    UPROPERTY()
    float32 SimpleSkillRecoverSpeed = 0.0f;
    UPROPERTY()
    float32 ExtraSkillEnergy = 100.0f;
    UPROPERTY()
    float32 ExtraSkillEnergyMax = 100.0f;
    UPROPERTY()
    float32 ExtraSkillEnergyRecoverSpeed = 5.0f;
    UPROPERTY()
    float32 UltraSkillEnergy = 0.0f;
    UPROPERTY()
    float32 UltraSkillEnergyMax = 100.0f;
    UPROPERTY()
    float32 UltraSkillEnergyRecoverCoefficient = 1.0f;
    UPROPERTY()
    float32 CustomSkillEnergy = 0.0f;
    UPROPERTY()
    float32 CustomSkillEnergyMin = 0.0f;
    UPROPERTY()
    float32 CustomSkillEnergyMax = 0.0f;
    UPROPERTY()
    float32 CustomSkillEnergyRecoverDelay = 0.0f;
    UPROPERTY()
    float32 CustomSkillEnergyRecoverSpeed = 0.0f;
    UPROPERTY()
    float32 CustomSkillEnergyEnergyRecoverCoefficient = 1.0f;
    UPROPERTY()
    float32 CustomSkillEnergyEnergyConsumeCoefficient = 1.0f;
    UPROPERTY()
    float32 CustomSkillEnergy_2 = 0.0f;
    UPROPERTY()
    float32 CustomSkillEnergyMin_2 = 0.0f;
    UPROPERTY()
    float32 CustomSkillEnergyMax_2 = 0.0f;
    UPROPERTY()
    float32 CustomSkillEnergyRecoverDelay_2 = 0.0f;
    UPROPERTY()
    float32 CustomSkillEnergyRecoverSpeed_2 = 0.0f;
    UPROPERTY()
    float32 CustomSkillEnergyEnergyRecoverCoefficient_2 = 1.0f;
    UPROPERTY()
    float32 CustomSkillEnergyEnergyConsumeCoefficient_2 = 1.0f;
    UPROPERTY()
    float32 CustomSkillEnergy_3 = 0.0f;
    UPROPERTY()
    float32 CustomSkillEnergyMin_3 = 0.0f;
    UPROPERTY()
    float32 CustomSkillEnergyMax_3 = 0.0f;
    UPROPERTY()
    float32 CustomSkillEnergyRecoverDelay_3 = 0.0f;
    UPROPERTY()
    float32 CustomSkillEnergyRecoverSpeed_3 = 0.0f;
    UPROPERTY()
    float32 CustomSkillEnergyEnergyRecoverCoefficient_3 = 1.0f;
    UPROPERTY()
    float32 CustomSkillEnergyEnergyConsumeCoefficient_3 = 1.0f;
    UPROPERTY()
    float32 CustomSkillEnergy_4 = 0.0f;
    UPROPERTY()
    float32 CustomSkillEnergyMin_4 = 0.0f;
    UPROPERTY()
    float32 CustomSkillEnergyMax_4 = 0.0f;
    UPROPERTY()
    float32 CustomSkillEnergyRecoverDelay_4 = 0.0f;
    UPROPERTY()
    float32 CustomSkillEnergyRecoverSpeed_4 = 0.0f;
    UPROPERTY()
    float32 CustomSkillEnergyEnergyRecoverCoefficient_4 = 1.0f;
    UPROPERTY()
    float32 CustomSkillEnergyEnergyConsumeCoefficient_4 = 1.0f;
    UPROPERTY()
    float32 HealEffect = 1.0f;
    UPROPERTY()
    float32 SkillHealRatio = 0.0f;
    UPROPERTY()
    float32 TakeHealRatio = 0.0f;
    UPROPERTY()
    float32 RecoverHpRatio = 0.0f;


}

struct FGameAttributeInitConfig_CombatUnit : FGameAttributeInitConfigBase
{
    FGameAttributeInitConfigBase _base_FGameAttributeInitConfigBase;
    UPROPERTY()
    float32 HP;
    UPROPERTY()
    float32 HPMax;
    UPROPERTY()
    float32 Posture;
    UPROPERTY()
    float32 PostureMax;
    UPROPERTY()
    float32 PostureRecoverDelay;
    UPROPERTY()
    float32 PostureRecoverSpeed;
    UPROPERTY()
    float32 StaminaMax = 100.0f;
    UPROPERTY()
    float32 StaminaRecoverSpeed = 35.0f;
    UPROPERTY()
    float32 StaminaRecoverDelay = 0.0f;
    UPROPERTY()
    float32 BaseHatred = 0.0f;
    UPROPERTY()
    float32 MutualClash = 100.0f;
    UPROPERTY()
    float32 MutualClashMax = 100.0f;
    UPROPERTY()
    float32 Burning_Accumulation = 100.0f;
    UPROPERTY()
    float32 Burning_AccumulationMax = 100.0f;
    UPROPERTY()
    float32 Burning_AccumulationCoefficient = 1.0f;
    UPROPERTY()
    float32 Burning_RecoverDelay = 1.0f;
    UPROPERTY()
    float32 Burning_RecoverSpeed = 0.5f;
    UPROPERTY()
    float32 Poisoning_Accumulation = 100.0f;
    UPROPERTY()
    float32 Poisoning_AccumulationMax = 100.0f;
    UPROPERTY()
    float32 Poisoning_AccumulationCoefficient = 1.0f;
    UPROPERTY()
    float32 Poisoning_RecoverDelay = 0.5f;
    UPROPERTY()
    float32 Poisoning_RecoverSpeed = 5.0f;
    UPROPERTY()
    float32 Doomed_Accumulation = 100.0f;
    UPROPERTY()
    float32 Doomed_AccumulationMax = 100.0f;
    UPROPERTY()
    float32 Doomed_AccumulationCoefficient = 1.0f;
    UPROPERTY()
    float32 Doomed_RecoverDelay = 5.0f;
    UPROPERTY()
    float32 Doomed_RecoverSpeed = 2.0f;
    UPROPERTY()
    float32 Dizzy_Accumulation = 100.0f;
    UPROPERTY()
    float32 Dizzy_AccumulationMax = 100.0f;
    UPROPERTY()
    float32 Dizzy_AccumulationCoefficient = 1.0f;
    UPROPERTY()
    float32 Dizzy_RecoverDelay = 0.5f;
    UPROPERTY()
    float32 Dizzy_RecoverSpeed = 5.0f;
    UPROPERTY()
    float32 HotSpring_Accumulation = 100.0f;
    UPROPERTY()
    float32 HotSpring_AccumulationMax = 100.0f;
    UPROPERTY()
    float32 HotSpring_AccumulationCoefficient = 1.0f;
    UPROPERTY()
    float32 HotSpring_RecoverDelay = 1.0f;
    UPROPERTY()
    float32 HotSpring_RecoverSpeed = 0.5f;
    UPROPERTY()
    float32 LeylineMiasma_Accumulation = 100.0f;
    UPROPERTY()
    float32 LeylineMiasma_AccumulationMax = 100.0f;
    UPROPERTY()
    float32 LeylineMiasma_AccumulationCoefficient = 1.0f;
    UPROPERTY()
    float32 LeylineMiasma_RecoverDelay = 1.0f;
    UPROPERTY()
    float32 LeylineMiasma_RecoverSpeed = 10.0f;
    UPROPERTY()
    float32 Freeze_Accumulation = 100.0f;
    UPROPERTY()
    float32 Freeze_AccumulationMax = 100.0f;
    UPROPERTY()
    float32 Freeze_AccumulationCoefficient = 1.0f;
    UPROPERTY()
    float32 Freeze_RecoverDelay = 1.0f;
    UPROPERTY()
    float32 Freeze_RecoverSpeed = 0.5f;
    UPROPERTY()
    float32 Electrified_Accumulation = 100.0f;
    UPROPERTY()
    float32 Electrified_AccumulationMax = 100.0f;
    UPROPERTY()
    float32 Electrified_AccumulationCoefficient = 1.0f;
    UPROPERTY()
    float32 Electrified_RecoverDelay = 1.0f;
    UPROPERTY()
    float32 Electrified_RecoverSpeed = 0.5f;
    UPROPERTY()
    float32 Light_Accumulation = 100.0f;
    UPROPERTY()
    float32 Light_AccumulationMax = 100.0f;
    UPROPERTY()
    float32 Light_AccumulationCoefficient = 1.0f;
    UPROPERTY()
    float32 Light_RecoverDelay = 1.0f;
    UPROPERTY()
    float32 Light_RecoverSpeed = 0.5f;
    UPROPERTY()
    float32 Dark_Accumulation = 100.0f;
    UPROPERTY()
    float32 Dark_AccumulationMax = 100.0f;
    UPROPERTY()
    float32 Dark_AccumulationCoefficient = 1.0f;
    UPROPERTY()
    float32 Dark_RecoverDelay = 1.0f;
    UPROPERTY()
    float32 Dark_RecoverSpeed = 0.5f;
    UPROPERTY()
    float32 TakePhysicalDamage = 0.0f;
    UPROPERTY()
    float32 TakePowerDamage = 0.0f;
    UPROPERTY()
    float32 TakeFireDamage = 0.0f;
    UPROPERTY()
    float32 TakeThunderDamage = 0.0f;
    UPROPERTY()
    float32 TakeIceDamage = 0.0f;
    UPROPERTY()
    float32 TakeLightDamage = 0.0f;
    UPROPERTY()
    float32 TakeShadowDamage = 0.0f;
    UPROPERTY()
    float32 Attack;
    UPROPERTY()
    float32 PostureAttack;
    UPROPERTY()
    float32 EcologyPostureAttack;
    UPROPERTY()
    float32 Defense = 0.0f;
    UPROPERTY()
    float32 InnateDamageReduceRatio = 0.0f;


}

struct FGameAttributeInitConfig_Monster : FGameAttributeInitConfig_CombatUnit
{
    FGameAttributeInitConfig_CombatUnit _base_FGameAttributeInitConfig_CombatUnit;
    UPROPERTY()
    float32 EcologyPosture = 100.0f;
    UPROPERTY()
    float32 EcologyPostureMax = 100.0f;
    UPROPERTY()
    float32 EcologyPostureRecoverDelay = 0.0f;
    UPROPERTY()
    float32 EcologyPostureRecoverSpeed = 0.0f;


}

struct FGameAttributeInitConfig_Prop : FGameAttributeInitConfigBase
{
    FGameAttributeInitConfigBase _base_FGameAttributeInitConfigBase;
    UPROPERTY()
    float32 HP;
    UPROPERTY()
    float32 HPMax;
    UPROPERTY()
    float32 Posture;
    UPROPERTY()
    float32 PostureMax;
    UPROPERTY()
    float32 StaminaMax = 100.0f;
    UPROPERTY()
    float32 Attack;
    UPROPERTY()
    float32 PostureAttack;
    UPROPERTY()
    float32 Defense = 0.0f;
    UPROPERTY()
    float32 InnateDamageReduceRatio = 0.0f;
    UPROPERTY()
    float32 CriticalRating = 0.0f;
    UPROPERTY()
    float32 CriticalDamage = 0.0f;
    UPROPERTY()
    float32 MutualClash = 100.0f;
    UPROPERTY()
    float32 MutualClashMax = 100.0f;
    UPROPERTY()
    float32 Burning_AccumulationMax = 100.0f;
    UPROPERTY()
    float32 Burning_AccumulationCoefficient = 1.0f;
    UPROPERTY()
    float32 Poisoning_AccumulationMax = 100.0f;
    UPROPERTY()
    float32 Poisoning_AccumulationCoefficient = 1.0f;
    UPROPERTY()
    float32 Doomed_AccumulationMax = 100.0f;
    UPROPERTY()
    float32 Doomed_AccumulationCoefficient = 1.0f;
    UPROPERTY()
    float32 Dizzy_AccumulationMax = 100.0f;
    UPROPERTY()
    float32 Dizzy_AccumulationCoefficient = 1.0f;
    UPROPERTY()
    float32 Freeze_AccumulationMax = 100.0f;
    UPROPERTY()
    float32 Freeze_AccumulationCoefficient = 1.0f;
    UPROPERTY()
    float32 Electrified_AccumulationMax = 100.0f;
    UPROPERTY()
    float32 Electrified_AccumulationCoefficient = 1.0f;
    UPROPERTY()
    float32 Light_AccumulationMax = 100.0f;
    UPROPERTY()
    float32 Light_AccumulationCoefficient = 1.0f;
    UPROPERTY()
    float32 Dark_AccumulationMax = 100.0f;
    UPROPERTY()
    float32 Dark_AccumulationCoefficient = 1.0f;
    UPROPERTY()
    float32 SimpleSkillEnergy = 100.0f;
    UPROPERTY()
    float32 SimpleSkillEnergyMax = 100.0f;
    UPROPERTY()
    float32 SimpleSkillEnergyRecoverSpeed = 5.0f;
    UPROPERTY()
    float32 ExtraSkillEnergy = 100.0f;
    UPROPERTY()
    float32 ExtraSkillEnergyMax = 100.0f;
    UPROPERTY()
    float32 ExtraSkillEnergyRecoverSpeed = 5.0f;
    UPROPERTY()
    float32 UltraSkillEnergy = 0.0f;
    UPROPERTY()
    float32 UltraSkillEnergyMax = 100.0f;
    UPROPERTY()
    float32 CustomSkillEnergy = 0.0f;
    UPROPERTY()
    float32 CustomSkillEnergyMax = 0.0f;
    UPROPERTY()
    float32 CustomSkillEnergyRecoverDelay = 0.0f;
    UPROPERTY()
    float32 CustomSkillEnergyRecoverSpeed = 0.0f;
    UPROPERTY()
    float32 CustomSkillEnergy_2 = 0.0f;
    UPROPERTY()
    float32 CustomSkillEnergyMax_2 = 0.0f;
    UPROPERTY()
    float32 CustomSkillEnergyRecoverDelay_2 = 0.0f;
    UPROPERTY()
    float32 CustomSkillEnergyRecoverSpeed_2 = 0.0f;
    UPROPERTY()
    float32 PostureRecoverDelay = 0.0f;
    UPROPERTY()
    float32 PostureRecoverSpeed = 0.0f;
    UPROPERTY()
    float32 SwitchPlayerEnergy_Max = 100.0f;
    UPROPERTY()
    float32 SwitchPlayerEnergy_RecoverSpeed = 0.0f;
    UPROPERTY()
    float32 SwitchPlayerEnergyRecoverCoefficient = 1.0f;
    UPROPERTY()
    float32 EscapeEnergy = 0.0f;
    UPROPERTY()
    float32 EscapeEnergy_Max = 0.0f;
    UPROPERTY()
    float32 EscapeEnergy_RecoverSpeed = 0.0f;
    UPROPERTY()
    float32 BaseHatred = 0.0f;
    UPROPERTY()
    float32 HealEffect = 1.0f;
    UPROPERTY()
    float32 EnvBreakHP;
    UPROPERTY()
    float32 EnvBreakHPMax;
    UPROPERTY()
    float32 EcologyPostureAttack;
    UPROPERTY()
    float32 EcologyPosture;
    UPROPERTY()
    float32 EcologyPostureMax;
    UPROPERTY()
    float32 EcologyPostureRecoverDelay;
    UPROPERTY()
    float32 EcologyPostureRecoverSpeed;


}

struct FGameAttributeInitConfig_NPC : FGameAttributeInitConfig_CombatUnit
{
    FGameAttributeInitConfig_CombatUnit _base_FGameAttributeInitConfig_CombatUnit;

    FGameAttributeInitConfig_NPC()
    {
        super();
        return;
    }
}

struct FGameAttributeInitConfig_Creature : FGameAttributeInitConfigBase
{
    FGameAttributeInitConfigBase _base_FGameAttributeInitConfigBase;

    FGameAttributeInitConfig_Creature()
    {
        super();
        return;
    }
}

