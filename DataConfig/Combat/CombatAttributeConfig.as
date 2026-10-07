

struct FGameAttribute_DefaultConfig : FDataObject
{
    FDataObject _base_FDataObject;
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
    float32 HotSpring_AccumulationMax = 100.0f;
    UPROPERTY()
    float32 HotSpring_AccumulationCoefficient = 1.0f;
    UPROPERTY()
    float32 LeylineMiasma_AccumulationMax = 100.0f;
    UPROPERTY()
    float32 LeylineMiasma_AccumulationCoefficient = 1.0f;
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
    float32 CustomSkillEnergyMin = 0.0f;
    UPROPERTY()
    float32 CustomSkillEnergyMax = 0.0f;
    UPROPERTY()
    float32 CustomSkillEnergyRecoverDelay = 0.0f;
    UPROPERTY()
    float32 CustomSkillEnergyRecoverSpeed = 0.0f;
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

struct FGameAttributeGrowByLevelConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    float32 HPMax = 0.0f;
    UPROPERTY()
    float32 StaminaMax = 0.0f;


}

