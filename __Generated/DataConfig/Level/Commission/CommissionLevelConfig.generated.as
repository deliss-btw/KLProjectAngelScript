namespace __FCommissionLevelAttackConfigFunctions
{
UFUNCTION()
int __FCommissionLevelAttackConfig_GetCommissionLevel(const TDataObjectPtr<FCommissionLevelAttackConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CommissionLevel' from a null 'FCommissionLevelAttackConfig' DataObject!");
        }
        FCommissionLevelAttackConfig defaultValue;
        return defaultValue.CommissionLevel;
    }
    return DataObject.Get().CommissionLevel;
}
UFUNCTION()
float32 __FCommissionLevelAttackConfig_GetAttack(const TDataObjectPtr<FCommissionLevelAttackConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Attack' from a null 'FCommissionLevelAttackConfig' DataObject!");
        }
        FCommissionLevelAttackConfig defaultValue;
        return defaultValue.Attack;
    }
    return DataObject.Get().Attack;
}
UFUNCTION()
float32 __FCommissionLevelAttackConfig_GetPostureAttack(const TDataObjectPtr<FCommissionLevelAttackConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PostureAttack' from a null 'FCommissionLevelAttackConfig' DataObject!");
        }
        FCommissionLevelAttackConfig defaultValue;
        return defaultValue.PostureAttack;
    }
    return DataObject.Get().PostureAttack;
}
UFUNCTION()
FCommissionLevelAttackConfig CastToFCommissionLevelAttackConfig(const TDataObjectPtr<FCommissionLevelAttackConfig> &inout DataObject)
{
    FCommissionLevelAttackConfig __r;
    return __r;
}
}
