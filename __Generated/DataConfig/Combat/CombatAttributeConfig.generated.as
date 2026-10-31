namespace __FGameAttribute_DefaultConfigFunctions
{
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetHP(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HP' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.HP;
    }
    return DataObject.Get().HP;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetHPMax(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HPMax' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.HPMax;
    }
    return DataObject.Get().HPMax;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetPosture(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Posture' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.Posture;
    }
    return DataObject.Get().Posture;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetPostureMax(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PostureMax' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.PostureMax;
    }
    return DataObject.Get().PostureMax;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetStaminaMax(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'StaminaMax' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.StaminaMax;
    }
    return DataObject.Get().StaminaMax;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetAttack(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Attack' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.Attack;
    }
    return DataObject.Get().Attack;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetPostureAttack(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PostureAttack' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.PostureAttack;
    }
    return DataObject.Get().PostureAttack;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetDefense(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Defense' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.Defense;
    }
    return DataObject.Get().Defense;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetInnateDamageReduceRatio(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InnateDamageReduceRatio' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.InnateDamageReduceRatio;
    }
    return DataObject.Get().InnateDamageReduceRatio;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetCriticalRating(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CriticalRating' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.CriticalRating;
    }
    return DataObject.Get().CriticalRating;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetCriticalDamage(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CriticalDamage' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.CriticalDamage;
    }
    return DataObject.Get().CriticalDamage;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetMutualClash(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MutualClash' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.MutualClash;
    }
    return DataObject.Get().MutualClash;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetMutualClashMax(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MutualClashMax' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.MutualClashMax;
    }
    return DataObject.Get().MutualClashMax;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetBurning_AccumulationMax(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Burning_AccumulationMax' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.Burning_AccumulationMax;
    }
    return DataObject.Get().Burning_AccumulationMax;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetPoisoning_AccumulationMax(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Poisoning_AccumulationMax' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.Poisoning_AccumulationMax;
    }
    return DataObject.Get().Poisoning_AccumulationMax;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetDoomed_AccumulationMax(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Doomed_AccumulationMax' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.Doomed_AccumulationMax;
    }
    return DataObject.Get().Doomed_AccumulationMax;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetDizzy_AccumulationMax(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Dizzy_AccumulationMax' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.Dizzy_AccumulationMax;
    }
    return DataObject.Get().Dizzy_AccumulationMax;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetHotSpring_AccumulationMax(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HotSpring_AccumulationMax' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.HotSpring_AccumulationMax;
    }
    return DataObject.Get().HotSpring_AccumulationMax;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetLeylineMiasma_AccumulationMax(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LeylineMiasma_AccumulationMax' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.LeylineMiasma_AccumulationMax;
    }
    return DataObject.Get().LeylineMiasma_AccumulationMax;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetFreeze_AccumulationMax(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Freeze_AccumulationMax' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.Freeze_AccumulationMax;
    }
    return DataObject.Get().Freeze_AccumulationMax;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetElectrified_AccumulationMax(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Electrified_AccumulationMax' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.Electrified_AccumulationMax;
    }
    return DataObject.Get().Electrified_AccumulationMax;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetLight_AccumulationMax(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Light_AccumulationMax' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.Light_AccumulationMax;
    }
    return DataObject.Get().Light_AccumulationMax;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetDark_AccumulationMax(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Dark_AccumulationMax' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.Dark_AccumulationMax;
    }
    return DataObject.Get().Dark_AccumulationMax;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetSimpleSkillEnergy(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SimpleSkillEnergy' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.SimpleSkillEnergy;
    }
    return DataObject.Get().SimpleSkillEnergy;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetSimpleSkillEnergyMax(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SimpleSkillEnergyMax' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.SimpleSkillEnergyMax;
    }
    return DataObject.Get().SimpleSkillEnergyMax;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetSimpleSkillEnergyRecoverSpeed(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SimpleSkillEnergyRecoverSpeed' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.SimpleSkillEnergyRecoverSpeed;
    }
    return DataObject.Get().SimpleSkillEnergyRecoverSpeed;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetExtraSkillEnergy(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExtraSkillEnergy' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.ExtraSkillEnergy;
    }
    return DataObject.Get().ExtraSkillEnergy;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetExtraSkillEnergyMax(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExtraSkillEnergyMax' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.ExtraSkillEnergyMax;
    }
    return DataObject.Get().ExtraSkillEnergyMax;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetExtraSkillEnergyRecoverSpeed(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExtraSkillEnergyRecoverSpeed' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.ExtraSkillEnergyRecoverSpeed;
    }
    return DataObject.Get().ExtraSkillEnergyRecoverSpeed;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetUltraSkillEnergy(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UltraSkillEnergy' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.UltraSkillEnergy;
    }
    return DataObject.Get().UltraSkillEnergy;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetUltraSkillEnergyMax(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UltraSkillEnergyMax' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.UltraSkillEnergyMax;
    }
    return DataObject.Get().UltraSkillEnergyMax;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetCustomSkillEnergy(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CustomSkillEnergy' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.CustomSkillEnergy;
    }
    return DataObject.Get().CustomSkillEnergy;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetCustomSkillEnergyMin(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CustomSkillEnergyMin' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.CustomSkillEnergyMin;
    }
    return DataObject.Get().CustomSkillEnergyMin;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetCustomSkillEnergyMax(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CustomSkillEnergyMax' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.CustomSkillEnergyMax;
    }
    return DataObject.Get().CustomSkillEnergyMax;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetCustomSkillEnergyRecoverDelay(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CustomSkillEnergyRecoverDelay' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.CustomSkillEnergyRecoverDelay;
    }
    return DataObject.Get().CustomSkillEnergyRecoverDelay;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetCustomSkillEnergyRecoverSpeed(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CustomSkillEnergyRecoverSpeed' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.CustomSkillEnergyRecoverSpeed;
    }
    return DataObject.Get().CustomSkillEnergyRecoverSpeed;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetCustomSkillEnergy_2(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CustomSkillEnergy_2' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.CustomSkillEnergy_2;
    }
    return DataObject.Get().CustomSkillEnergy_2;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetCustomSkillEnergyMin_2(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CustomSkillEnergyMin_2' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.CustomSkillEnergyMin_2;
    }
    return DataObject.Get().CustomSkillEnergyMin_2;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetCustomSkillEnergyMax_2(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CustomSkillEnergyMax_2' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.CustomSkillEnergyMax_2;
    }
    return DataObject.Get().CustomSkillEnergyMax_2;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetCustomSkillEnergyRecoverDelay_2(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CustomSkillEnergyRecoverDelay_2' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.CustomSkillEnergyRecoverDelay_2;
    }
    return DataObject.Get().CustomSkillEnergyRecoverDelay_2;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetCustomSkillEnergyRecoverSpeed_2(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CustomSkillEnergyRecoverSpeed_2' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.CustomSkillEnergyRecoverSpeed_2;
    }
    return DataObject.Get().CustomSkillEnergyRecoverSpeed_2;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetCustomSkillEnergy_3(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CustomSkillEnergy_3' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.CustomSkillEnergy_3;
    }
    return DataObject.Get().CustomSkillEnergy_3;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetCustomSkillEnergyMin_3(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CustomSkillEnergyMin_3' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.CustomSkillEnergyMin_3;
    }
    return DataObject.Get().CustomSkillEnergyMin_3;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetCustomSkillEnergyMax_3(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CustomSkillEnergyMax_3' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.CustomSkillEnergyMax_3;
    }
    return DataObject.Get().CustomSkillEnergyMax_3;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetCustomSkillEnergyRecoverDelay_3(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CustomSkillEnergyRecoverDelay_3' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.CustomSkillEnergyRecoverDelay_3;
    }
    return DataObject.Get().CustomSkillEnergyRecoverDelay_3;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetCustomSkillEnergyRecoverSpeed_3(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CustomSkillEnergyRecoverSpeed_3' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.CustomSkillEnergyRecoverSpeed_3;
    }
    return DataObject.Get().CustomSkillEnergyRecoverSpeed_3;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetCustomSkillEnergy_4(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CustomSkillEnergy_4' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.CustomSkillEnergy_4;
    }
    return DataObject.Get().CustomSkillEnergy_4;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetCustomSkillEnergyMin_4(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CustomSkillEnergyMin_4' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.CustomSkillEnergyMin_4;
    }
    return DataObject.Get().CustomSkillEnergyMin_4;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetCustomSkillEnergyMax_4(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CustomSkillEnergyMax_4' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.CustomSkillEnergyMax_4;
    }
    return DataObject.Get().CustomSkillEnergyMax_4;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetCustomSkillEnergyRecoverDelay_4(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CustomSkillEnergyRecoverDelay_4' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.CustomSkillEnergyRecoverDelay_4;
    }
    return DataObject.Get().CustomSkillEnergyRecoverDelay_4;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetCustomSkillEnergyRecoverSpeed_4(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CustomSkillEnergyRecoverSpeed_4' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.CustomSkillEnergyRecoverSpeed_4;
    }
    return DataObject.Get().CustomSkillEnergyRecoverSpeed_4;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetPostureRecoverDelay(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PostureRecoverDelay' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.PostureRecoverDelay;
    }
    return DataObject.Get().PostureRecoverDelay;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetPostureRecoverSpeed(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PostureRecoverSpeed' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.PostureRecoverSpeed;
    }
    return DataObject.Get().PostureRecoverSpeed;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetSwitchPlayerEnergy_Max(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SwitchPlayerEnergy_Max' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.SwitchPlayerEnergy_Max;
    }
    return DataObject.Get().SwitchPlayerEnergy_Max;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetSwitchPlayerEnergy_RecoverSpeed(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SwitchPlayerEnergy_RecoverSpeed' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.SwitchPlayerEnergy_RecoverSpeed;
    }
    return DataObject.Get().SwitchPlayerEnergy_RecoverSpeed;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetSwitchPlayerEnergyRecoverCoefficient(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SwitchPlayerEnergyRecoverCoefficient' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.SwitchPlayerEnergyRecoverCoefficient;
    }
    return DataObject.Get().SwitchPlayerEnergyRecoverCoefficient;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetEscapeEnergy(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EscapeEnergy' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.EscapeEnergy;
    }
    return DataObject.Get().EscapeEnergy;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetEscapeEnergy_Max(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EscapeEnergy_Max' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.EscapeEnergy_Max;
    }
    return DataObject.Get().EscapeEnergy_Max;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetEscapeEnergy_RecoverSpeed(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EscapeEnergy_RecoverSpeed' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.EscapeEnergy_RecoverSpeed;
    }
    return DataObject.Get().EscapeEnergy_RecoverSpeed;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetBaseHatred(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BaseHatred' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.BaseHatred;
    }
    return DataObject.Get().BaseHatred;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetHealEffect(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HealEffect' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.HealEffect;
    }
    return DataObject.Get().HealEffect;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetEnvBreakHP(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EnvBreakHP' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.EnvBreakHP;
    }
    return DataObject.Get().EnvBreakHP;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetEnvBreakHPMax(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EnvBreakHPMax' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.EnvBreakHPMax;
    }
    return DataObject.Get().EnvBreakHPMax;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetEcologyPostureAttack(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EcologyPostureAttack' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.EcologyPostureAttack;
    }
    return DataObject.Get().EcologyPostureAttack;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetEcologyPosture(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EcologyPosture' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.EcologyPosture;
    }
    return DataObject.Get().EcologyPosture;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetEcologyPostureMax(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EcologyPostureMax' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.EcologyPostureMax;
    }
    return DataObject.Get().EcologyPostureMax;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetEcologyPostureRecoverDelay(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EcologyPostureRecoverDelay' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.EcologyPostureRecoverDelay;
    }
    return DataObject.Get().EcologyPostureRecoverDelay;
}
UFUNCTION()
float32 __FGameAttribute_DefaultConfig_GetEcologyPostureRecoverSpeed(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'EcologyPostureRecoverSpeed' from a null 'FGameAttribute_DefaultConfig' DataObject!");
        }
        FGameAttribute_DefaultConfig defaultValue;
        return defaultValue.EcologyPostureRecoverSpeed;
    }
    return DataObject.Get().EcologyPostureRecoverSpeed;
}
UFUNCTION()
FGameAttribute_DefaultConfig CastToFGameAttribute_DefaultConfig(const TDataObjectPtr<FGameAttribute_DefaultConfig> &inout DataObject)
{
    FGameAttribute_DefaultConfig __r;
    return __r;
}
}
namespace __FGameAttributeGrowByLevelConfigFunctions
{
UFUNCTION()
float32 __FGameAttributeGrowByLevelConfig_GetHPMax(const TDataObjectPtr<FGameAttributeGrowByLevelConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HPMax' from a null 'FGameAttributeGrowByLevelConfig' DataObject!");
        }
        FGameAttributeGrowByLevelConfig defaultValue;
        return defaultValue.HPMax;
    }
    return DataObject.Get().HPMax;
}
UFUNCTION()
float32 __FGameAttributeGrowByLevelConfig_GetStaminaMax(const TDataObjectPtr<FGameAttributeGrowByLevelConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'StaminaMax' from a null 'FGameAttributeGrowByLevelConfig' DataObject!");
        }
        FGameAttributeGrowByLevelConfig defaultValue;
        return defaultValue.StaminaMax;
    }
    return DataObject.Get().StaminaMax;
}
UFUNCTION()
FGameAttributeGrowByLevelConfig CastToFGameAttributeGrowByLevelConfig(const TDataObjectPtr<FGameAttributeGrowByLevelConfig> &inout DataObject)
{
    FGameAttributeGrowByLevelConfig __r;
    return __r;
}
}
