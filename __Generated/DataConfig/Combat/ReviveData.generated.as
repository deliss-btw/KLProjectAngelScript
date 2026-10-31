namespace __FReviveDataFunctions
{
UFUNCTION()
int __FReviveData_GetReviveID(const TDataObjectPtr<FReviveData> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ReviveID' from a null 'FReviveData' DataObject!");
        }
        FReviveData defaultValue;
        return defaultValue.ReviveID;
    }
    return DataObject.Get().ReviveID;
}
UFUNCTION()
FString __FReviveData_GetReviveDes(const TDataObjectPtr<FReviveData> &inout DataObject)
{
    FString __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ReviveDes' from a null 'FReviveData' DataObject!");
        }
        FReviveData local_68;
        return local_68.ReviveDes;
    }
    return __r;
}
UFUNCTION()
bool __FReviveData_GetbCanHitOrLockTargetWhenNearDeath(const TDataObjectPtr<FReviveData> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bCanHitOrLockTargetWhenNearDeath' from a null 'FReviveData' DataObject!");
        }
        FReviveData local_68;
        return local_68.bCanHitOrLockTargetWhenNearDeath;
    }
    return local_1;
}
UFUNCTION()
EKnockdownCond __FReviveData_GetKnockdownCond(const TDataObjectPtr<FReviveData> &inout DataObject)
{
    int local_69 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'KnockdownCond' from a null 'FReviveData' DataObject!");
        }
        FReviveData local_68;
        local_69 = int(local_68.KnockdownCond);
        return EKnockdownCond(local_69);
    }
    return EKnockdownCond(local_69);
}
UFUNCTION()
EKnockdownHpType __FReviveData_GetKnockdownHpType(const TDataObjectPtr<FReviveData> &inout DataObject)
{
    int local_69 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'KnockdownHpType' from a null 'FReviveData' DataObject!");
        }
        FReviveData local_68;
        local_69 = int(local_68.KnockdownHpType);
        return EKnockdownHpType(local_69);
    }
    return EKnockdownHpType(local_69);
}
UFUNCTION()
int __FReviveData_GetKnockdownHp(const TDataObjectPtr<FReviveData> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'KnockdownHp' from a null 'FReviveData' DataObject!");
        }
        FReviveData defaultValue;
        return defaultValue.KnockdownHp;
    }
    return DataObject.Get().KnockdownHp;
}
UFUNCTION()
int __FReviveData_GetKnockdownDecHp(const TDataObjectPtr<FReviveData> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'KnockdownDecHp' from a null 'FReviveData' DataObject!");
        }
        FReviveData defaultValue;
        return defaultValue.KnockdownDecHp;
    }
    return DataObject.Get().KnockdownDecHp;
}
UFUNCTION()
FBuffConfigRef __FReviveData_GetKnockdownBuff(const TDataObjectPtr<FReviveData> &inout DataObject)
{
    FBuffConfigRef __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'KnockdownBuff' from a null 'FReviveData' DataObject!");
        }
        FReviveData local_68;
        return local_68.KnockdownBuff;
    }
    return __r;
}
UFUNCTION()
int __FReviveData_GetKnockdownTimes(const TDataObjectPtr<FReviveData> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'KnockdownTimes' from a null 'FReviveData' DataObject!");
        }
        FReviveData defaultValue;
        return defaultValue.KnockdownTimes;
    }
    return DataObject.Get().KnockdownTimes;
}
UFUNCTION()
ERescueType __FReviveData_GetRescueType(const TDataObjectPtr<FReviveData> &inout DataObject)
{
    int local_69 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RescueType' from a null 'FReviveData' DataObject!");
        }
        FReviveData local_68;
        local_69 = int(local_68.RescueType);
        return ERescueType(local_69);
    }
    return ERescueType(local_69);
}
UFUNCTION()
int __FReviveData_GetRescueSkillID(const TDataObjectPtr<FReviveData> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RescueSkillID' from a null 'FReviveData' DataObject!");
        }
        FReviveData defaultValue;
        return defaultValue.RescueSkillID;
    }
    return DataObject.Get().RescueSkillID;
}
UFUNCTION()
int __FReviveData_GetRescueHP(const TDataObjectPtr<FReviveData> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RescueHP' from a null 'FReviveData' DataObject!");
        }
        FReviveData defaultValue;
        return defaultValue.RescueHP;
    }
    return DataObject.Get().RescueHP;
}
UFUNCTION()
int __FReviveData_GetRescueBuff(const TDataObjectPtr<FReviveData> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RescueBuff' from a null 'FReviveData' DataObject!");
        }
        FReviveData defaultValue;
        return defaultValue.RescueBuff;
    }
    return DataObject.Get().RescueBuff;
}
UFUNCTION()
int __FReviveData_GetReviveCD(const TDataObjectPtr<FReviveData> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ReviveCD' from a null 'FReviveData' DataObject!");
        }
        FReviveData defaultValue;
        return defaultValue.ReviveCD;
    }
    return DataObject.Get().ReviveCD;
}
UFUNCTION()
int __FReviveData_GetRevivePunishCD(const TDataObjectPtr<FReviveData> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RevivePunishCD' from a null 'FReviveData' DataObject!");
        }
        FReviveData defaultValue;
        return defaultValue.RevivePunishCD;
    }
    return DataObject.Get().RevivePunishCD;
}
UFUNCTION()
int __FReviveData_GetRevivePunishTime(const TDataObjectPtr<FReviveData> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RevivePunishTime' from a null 'FReviveData' DataObject!");
        }
        FReviveData defaultValue;
        return defaultValue.RevivePunishTime;
    }
    return DataObject.Get().RevivePunishTime;
}
UFUNCTION()
TArray<EReviveType> __FReviveData_GetReviveType(const TDataObjectPtr<FReviveData> &inout DataObject)
{
    TArray<EReviveType> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ReviveType' from a null 'FReviveData' DataObject!");
        }
        FReviveData local_68;
        return local_68.ReviveType;
    }
    return __r;
}
UFUNCTION()
int __FReviveData_GetReviveHp(const TDataObjectPtr<FReviveData> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ReviveHp' from a null 'FReviveData' DataObject!");
        }
        FReviveData defaultValue;
        return defaultValue.ReviveHp;
    }
    return DataObject.Get().ReviveHp;
}
UFUNCTION()
bool __FReviveData_GetbIsReplyPotion(const TDataObjectPtr<FReviveData> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bIsReplyPotion' from a null 'FReviveData' DataObject!");
        }
        FReviveData local_68;
        return local_68.bIsReplyPotion;
    }
    return local_1;
}
UFUNCTION()
int __FReviveData_GetReviveBuff(const TDataObjectPtr<FReviveData> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ReviveBuff' from a null 'FReviveData' DataObject!");
        }
        FReviveData defaultValue;
        return defaultValue.ReviveBuff;
    }
    return DataObject.Get().ReviveBuff;
}
UFUNCTION()
bool __FReviveData_GetbUseOverrideRevivePrefabClass(const TDataObjectPtr<FReviveData> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bUseOverrideRevivePrefabClass' from a null 'FReviveData' DataObject!");
        }
        FReviveData local_68;
        return local_68.bUseOverrideRevivePrefabClass;
    }
    return local_1;
}
UFUNCTION()
TArray<TSubclassOf<AECSPrefab>> __FReviveData_GetRestPointRevivePrefabClass(const TDataObjectPtr<FReviveData> &inout DataObject)
{
    TArray<TSubclassOf<AECSPrefab>> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RestPointRevivePrefabClass' from a null 'FReviveData' DataObject!");
        }
        FReviveData local_68;
        return local_68.RestPointRevivePrefabClass;
    }
    return __r;
}
UFUNCTION()
FReviveData CastToFReviveData(const TDataObjectPtr<FReviveData> &inout DataObject)
{
    FReviveData __r;
    return __r;
}
}
