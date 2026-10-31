namespace __FExecutionConfigDataObjectFunctions
{
UFUNCTION()
int __FExecutionConfigDataObject_GetMaxExecutedNum(const TDataObjectPtr<FExecutionConfigDataObject> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MaxExecutedNum' from a null 'FExecutionConfigDataObject' DataObject!");
        }
        FExecutionConfigDataObject defaultValue;
        return defaultValue.MaxExecutedNum;
    }
    return DataObject.Get().MaxExecutedNum;
}
UFUNCTION()
TDataObjectPtr<FMessageHintConfig> __FExecutionConfigDataObject_GetMessageHintConfig(const TDataObjectPtr<FExecutionConfigDataObject> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MessageHintConfig' from a null 'FExecutionConfigDataObject' DataObject!");
        }
        FExecutionConfigDataObject local_146;
        return local_146.GetMessageHintConfig();
    }
    return GetMessageHintConfig();
}
UFUNCTION()
float32 __FExecutionConfigDataObject_GetExecutedDamageHPRatio(const TDataObjectPtr<FExecutionConfigDataObject> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExecutedDamageHPRatio' from a null 'FExecutionConfigDataObject' DataObject!");
        }
        FExecutionConfigDataObject defaultValue;
        return defaultValue.ExecutedDamageHPRatio;
    }
    return DataObject.Get().ExecutedDamageHPRatio;
}
UFUNCTION()
FBuffConfigRef __FExecutionConfigDataObject_GetExecuteMonsterDebuff(const TDataObjectPtr<FExecutionConfigDataObject> &inout DataObject)
{
    FBuffConfigRef __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExecuteMonsterDebuff' from a null 'FExecutionConfigDataObject' DataObject!");
        }
        FExecutionConfigDataObject local_146;
        return local_146.ExecuteMonsterDebuff;
    }
    return __r;
}
UFUNCTION()
FName __FExecutionConfigDataObject_GetExecutedMonsterState(const TDataObjectPtr<FExecutionConfigDataObject> &inout DataObject)
{
    FName __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExecutedMonsterState' from a null 'FExecutionConfigDataObject' DataObject!");
        }
        FExecutionConfigDataObject local_146;
        return local_146.ExecutedMonsterState;
    }
    return __r;
}
UFUNCTION()
EExecutedPreType __FExecutionConfigDataObject_GetExecutedPreType(const TDataObjectPtr<FExecutionConfigDataObject> &inout DataObject)
{
    int local_147 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExecutedPreType' from a null 'FExecutionConfigDataObject' DataObject!");
        }
        FExecutionConfigDataObject local_146;
        local_147 = int(local_146.ExecutedPreType);
        return EExecutedPreType(local_147);
    }
    return EExecutedPreType(local_147);
}
UFUNCTION()
FName __FExecutionConfigDataObject_GetExecuterAnimKey(const TDataObjectPtr<FExecutionConfigDataObject> &inout DataObject)
{
    FName __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExecuterAnimKey' from a null 'FExecutionConfigDataObject' DataObject!");
        }
        FExecutionConfigDataObject local_146;
        return local_146.ExecuterAnimKey;
    }
    return __r;
}
UFUNCTION()
FBuffConfigRef __FExecutionConfigDataObject_GetExecuteBuff(const TDataObjectPtr<FExecutionConfigDataObject> &inout DataObject)
{
    FBuffConfigRef __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExecuteBuff' from a null 'FExecutionConfigDataObject' DataObject!");
        }
        FExecutionConfigDataObject local_146;
        return local_146.ExecuteBuff;
    }
    return __r;
}
UFUNCTION()
float32 __FExecutionConfigDataObject_GetExecuteBuffDelayAddTime(const TDataObjectPtr<FExecutionConfigDataObject> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExecuteBuffDelayAddTime' from a null 'FExecutionConfigDataObject' DataObject!");
        }
        FExecutionConfigDataObject defaultValue;
        return defaultValue.ExecuteBuffDelayAddTime;
    }
    return DataObject.Get().ExecuteBuffDelayAddTime;
}
UFUNCTION()
float32 __FExecutionConfigDataObject_GetExecuteBuffDistanceXY(const TDataObjectPtr<FExecutionConfigDataObject> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExecuteBuffDistanceXY' from a null 'FExecutionConfigDataObject' DataObject!");
        }
        FExecutionConfigDataObject defaultValue;
        return defaultValue.ExecuteBuffDistanceXY;
    }
    return DataObject.Get().ExecuteBuffDistanceXY;
}
UFUNCTION()
FName __FExecutionConfigDataObject_GetExecuteInterruptAvatarTrigger(const TDataObjectPtr<FExecutionConfigDataObject> &inout DataObject)
{
    FName __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExecuteInterruptAvatarTrigger' from a null 'FExecutionConfigDataObject' DataObject!");
        }
        FExecutionConfigDataObject local_146;
        return local_146.ExecuteInterruptAvatarTrigger;
    }
    return __r;
}
UFUNCTION()
TSoftClassPtr<AFXActor> __FExecutionConfigDataObject_GetChaosKnotFX(const TDataObjectPtr<FExecutionConfigDataObject> &inout DataObject)
{
    TSoftClassPtr<AFXActor> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ChaosKnotFX' from a null 'FExecutionConfigDataObject' DataObject!");
        }
        FExecutionConfigDataObject local_146;
        return local_146.ChaosKnotFX;
    }
    return __r;
}
UFUNCTION()
TSoftClassPtr<AFXActor> __FExecutionConfigDataObject_GetChaosKnotBreakFX(const TDataObjectPtr<FExecutionConfigDataObject> &inout DataObject)
{
    TSoftClassPtr<AFXActor> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ChaosKnotBreakFX' from a null 'FExecutionConfigDataObject' DataObject!");
        }
        FExecutionConfigDataObject local_146;
        return local_146.ChaosKnotBreakFX;
    }
    return __r;
}
UFUNCTION()
FName __FExecutionConfigDataObject_GetChaosKnotSocket(const TDataObjectPtr<FExecutionConfigDataObject> &inout DataObject)
{
    FName __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ChaosKnotSocket' from a null 'FExecutionConfigDataObject' DataObject!");
        }
        FExecutionConfigDataObject local_146;
        return local_146.ChaosKnotSocket;
    }
    return __r;
}
UFUNCTION()
FVector __FExecutionConfigDataObject_GetChaosKnotOffset(const TDataObjectPtr<FExecutionConfigDataObject> &inout DataObject)
{
    FVector __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ChaosKnotOffset' from a null 'FExecutionConfigDataObject' DataObject!");
        }
        FExecutionConfigDataObject local_146;
        return local_146.ChaosKnotOffset;
    }
    return __r;
}
UFUNCTION()
FRotator __FExecutionConfigDataObject_GetChaosKnotRotationOffset(const TDataObjectPtr<FExecutionConfigDataObject> &inout DataObject)
{
    FRotator __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ChaosKnotRotationOffset' from a null 'FExecutionConfigDataObject' DataObject!");
        }
        FExecutionConfigDataObject local_146;
        return local_146.ChaosKnotRotationOffset;
    }
    return __r;
}
UFUNCTION()
TSoftClassPtr<AEnergyBallPrefab> __FExecutionConfigDataObject_GetBuffBallPrefab(const TDataObjectPtr<FExecutionConfigDataObject> &inout DataObject)
{
    TSoftClassPtr<AEnergyBallPrefab> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BuffBallPrefab' from a null 'FExecutionConfigDataObject' DataObject!");
        }
        FExecutionConfigDataObject local_146;
        return local_146.BuffBallPrefab;
    }
    return __r;
}
UFUNCTION()
int __FExecutionConfigDataObject_GetBuffBallNum(const TDataObjectPtr<FExecutionConfigDataObject> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BuffBallNum' from a null 'FExecutionConfigDataObject' DataObject!");
        }
        FExecutionConfigDataObject defaultValue;
        return defaultValue.BuffBallNum;
    }
    return DataObject.Get().BuffBallNum;
}
UFUNCTION()
FExecutionConfigDataObject CastToFExecutionConfigDataObject(const TDataObjectPtr<FExecutionConfigDataObject> &inout DataObject)
{
    FExecutionConfigDataObject __r;
    return __r;
}
}
