namespace __FViewportSelectTargetParamsFunctions
{
UFUNCTION()
TSoftClassPtr<UEUIUserWidget> __FViewportSelectTargetParams_GetSelectUMG(const TDataObjectPtr<FViewportSelectTargetParams> &inout DataObject)
{
    TSoftClassPtr<UEUIUserWidget> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SelectUMG' from a null 'FViewportSelectTargetParams' DataObject!");
        }
        FViewportSelectTargetParams local_234;
        return local_234.SelectUMG;
    }
    return __r;
}
UFUNCTION()
uint8 __FViewportSelectTargetParams_GetTargetRelation(const TDataObjectPtr<FViewportSelectTargetParams> &inout DataObject)
{
    int local_235 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TargetRelation' from a null 'FViewportSelectTargetParams' DataObject!");
        }
        FViewportSelectTargetParams local_234;
        return int(local_234.TargetRelation);
    }
    return local_235;
}
UFUNCTION()
EViewportSelectTeammateType __FViewportSelectTargetParams_GetTargetTeammateType(const TDataObjectPtr<FViewportSelectTargetParams> &inout DataObject)
{
    int local_235 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TargetTeammateType' from a null 'FViewportSelectTargetParams' DataObject!");
        }
        FViewportSelectTargetParams local_234;
        local_235 = int(local_234.TargetTeammateType);
        return EViewportSelectTeammateType(local_235);
    }
    return EViewportSelectTeammateType(local_235);
}
UFUNCTION()
bool __FViewportSelectTargetParams_GetbIgnoreObstacleOnViewPath(const TDataObjectPtr<FViewportSelectTargetParams> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bIgnoreObstacleOnViewPath' from a null 'FViewportSelectTargetParams' DataObject!");
        }
        FViewportSelectTargetParams local_234;
        return local_234.bIgnoreObstacleOnViewPath;
    }
    return local_1;
}
UFUNCTION()
int __FViewportSelectTargetParams_GetTargetNum(const TDataObjectPtr<FViewportSelectTargetParams> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TargetNum' from a null 'FViewportSelectTargetParams' DataObject!");
        }
        FViewportSelectTargetParams defaultValue;
        return defaultValue.TargetNum;
    }
    return DataObject.Get().TargetNum;
}
UFUNCTION()
float32 __FViewportSelectTargetParams_GetHorizontalRatio(const TDataObjectPtr<FViewportSelectTargetParams> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HorizontalRatio' from a null 'FViewportSelectTargetParams' DataObject!");
        }
        FViewportSelectTargetParams defaultValue;
        return defaultValue.HorizontalRatio;
    }
    return DataObject.Get().HorizontalRatio;
}
UFUNCTION()
float32 __FViewportSelectTargetParams_GetVerticalRatio(const TDataObjectPtr<FViewportSelectTargetParams> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'VerticalRatio' from a null 'FViewportSelectTargetParams' DataObject!");
        }
        FViewportSelectTargetParams defaultValue;
        return defaultValue.VerticalRatio;
    }
    return DataObject.Get().VerticalRatio;
}
UFUNCTION()
float32 __FViewportSelectTargetParams_GetMinDistance(const TDataObjectPtr<FViewportSelectTargetParams> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MinDistance' from a null 'FViewportSelectTargetParams' DataObject!");
        }
        FViewportSelectTargetParams defaultValue;
        return defaultValue.MinDistance;
    }
    return DataObject.Get().MinDistance;
}
UFUNCTION()
float32 __FViewportSelectTargetParams_GetMaxDistance(const TDataObjectPtr<FViewportSelectTargetParams> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MaxDistance' from a null 'FViewportSelectTargetParams' DataObject!");
        }
        FViewportSelectTargetParams defaultValue;
        return defaultValue.MaxDistance;
    }
    return DataObject.Get().MaxDistance;
}
UFUNCTION()
FRuntimeFloatCurve __FViewportSelectTargetParams_GetDistanceWeight(const TDataObjectPtr<FViewportSelectTargetParams> &inout DataObject)
{
    FRuntimeFloatCurve __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DistanceWeight' from a null 'FViewportSelectTargetParams' DataObject!");
        }
        FViewportSelectTargetParams local_234;
        return local_234.DistanceWeight;
    }
    return __r;
}
UFUNCTION()
FRuntimeFloatCurve __FViewportSelectTargetParams_GetAngleWeight(const TDataObjectPtr<FViewportSelectTargetParams> &inout DataObject)
{
    FRuntimeFloatCurve __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AngleWeight' from a null 'FViewportSelectTargetParams' DataObject!");
        }
        FViewportSelectTargetParams local_234;
        return local_234.AngleWeight;
    }
    return __r;
}
UFUNCTION()
FRuntimeFloatCurve __FViewportSelectTargetParams_GetVerticalDistanceToCrosshairWeight(const TDataObjectPtr<FViewportSelectTargetParams> &inout DataObject)
{
    FRuntimeFloatCurve __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'VerticalDistanceToCrosshairWeight' from a null 'FViewportSelectTargetParams' DataObject!");
        }
        FViewportSelectTargetParams local_234;
        return local_234.VerticalDistanceToCrosshairWeight;
    }
    return __r;
}
UFUNCTION()
FGameplayTagContainer __FViewportSelectTargetParams_GetIncludeTags(const TDataObjectPtr<FViewportSelectTargetParams> &inout DataObject)
{
    FGameplayTagContainer __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IncludeTags' from a null 'FViewportSelectTargetParams' DataObject!");
        }
        FViewportSelectTargetParams local_234;
        return local_234.IncludeTags;
    }
    return __r;
}
UFUNCTION()
FGameplayTagContainer __FViewportSelectTargetParams_GetExcludeTags(const TDataObjectPtr<FViewportSelectTargetParams> &inout DataObject)
{
    FGameplayTagContainer __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExcludeTags' from a null 'FViewportSelectTargetParams' DataObject!");
        }
        FViewportSelectTargetParams local_234;
        return local_234.ExcludeTags;
    }
    return __r;
}
UFUNCTION()
bool __FViewportSelectTargetParams_GetbNeedConfirm(const TDataObjectPtr<FViewportSelectTargetParams> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        local_1 = !(EUIGlobals::GIsDuringPropertyConversion);
        if (local_1)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bNeedConfirm' from a null 'FViewportSelectTargetParams' DataObject!");
        }
        FViewportSelectTargetParams local_234;
        return local_234.bNeedConfirm;
    }
    return local_1;
}
UFUNCTION()
TDataObjectPtr<FEnhancedInputContextConfig> __FViewportSelectTargetParams_GetConfirmInputContextConfig(const TDataObjectPtr<FViewportSelectTargetParams> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ConfirmInputContextConfig' from a null 'FViewportSelectTargetParams' DataObject!");
        }
        FViewportSelectTargetParams local_234;
        return local_234.GetConfirmInputContextConfig();
    }
    return GetConfirmInputContextConfig();
}
UFUNCTION()
FName __FViewportSelectTargetParams_GetConfirmTriggerName(const TDataObjectPtr<FViewportSelectTargetParams> &inout DataObject)
{
    FName __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ConfirmTriggerName' from a null 'FViewportSelectTargetParams' DataObject!");
        }
        FViewportSelectTargetParams local_234;
        return local_234.ConfirmTriggerName;
    }
    return __r;
}
UFUNCTION()
float32 __FViewportSelectTargetParams_GetConfirmTriggerValidateTime(const TDataObjectPtr<FViewportSelectTargetParams> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ConfirmTriggerValidateTime' from a null 'FViewportSelectTargetParams' DataObject!");
        }
        FViewportSelectTargetParams defaultValue;
        return defaultValue.ConfirmTriggerValidateTime;
    }
    return DataObject.Get().ConfirmTriggerValidateTime;
}
UFUNCTION()
UESMInputTriggerAsset __FViewportSelectTargetParams_GetConfirmInput(const TDataObjectPtr<FViewportSelectTargetParams> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ConfirmInput' from a null 'FViewportSelectTargetParams' DataObject!");
        }
        FViewportSelectTargetParams local_234;
        return local_234.ConfirmInput;
    }
    UESMInputTriggerAsset local_236;
    return local_236;
}
UFUNCTION()
TMap<UESMInputTriggerAsset, ESelectTargetQuickSelectType> __FViewportSelectTargetParams_GetQuickSelectInputs(const TDataObjectPtr<FViewportSelectTargetParams> &inout DataObject)
{
    TMap<UESMInputTriggerAsset, ESelectTargetQuickSelectType> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'QuickSelectInputs' from a null 'FViewportSelectTargetParams' DataObject!");
        }
        FViewportSelectTargetParams local_234;
        return local_234.QuickSelectInputs;
    }
    return __r;
}
UFUNCTION()
float32 __FViewportSelectTargetParams_GetQuickSelectMaxDistance(const TDataObjectPtr<FViewportSelectTargetParams> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'QuickSelectMaxDistance' from a null 'FViewportSelectTargetParams' DataObject!");
        }
        FViewportSelectTargetParams defaultValue;
        return defaultValue.QuickSelectMaxDistance;
    }
    return DataObject.Get().QuickSelectMaxDistance;
}
UFUNCTION()
TDataObjectPtr<FMessageHintConfig> __FViewportSelectTargetParams_GetQuickSelectOutOfRangeMessageHint(const TDataObjectPtr<FViewportSelectTargetParams> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'QuickSelectOutOfRangeMessageHint' from a null 'FViewportSelectTargetParams' DataObject!");
        }
        FViewportSelectTargetParams local_234;
        return local_234.GetQuickSelectOutOfRangeMessageHint();
    }
    return GetQuickSelectOutOfRangeMessageHint();
}
UFUNCTION()
FViewportSelectTargetParams CastToFViewportSelectTargetParams(const TDataObjectPtr<FViewportSelectTargetParams> &inout DataObject)
{
    FViewportSelectTargetParams __r;
    return __r;
}
}
namespace __FSkillTargetPositionSelectParamsFunctions
{
UFUNCTION()
float32 __FSkillTargetPositionSelectParams_GetInitDistance(const TDataObjectPtr<FSkillTargetPositionSelectParams> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InitDistance' from a null 'FSkillTargetPositionSelectParams' DataObject!");
        }
        FSkillTargetPositionSelectParams defaultValue;
        return defaultValue.InitDistance;
    }
    return DataObject.Get().InitDistance;
}
UFUNCTION()
float32 __FSkillTargetPositionSelectParams_GetMaxDistance(const TDataObjectPtr<FSkillTargetPositionSelectParams> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MaxDistance' from a null 'FSkillTargetPositionSelectParams' DataObject!");
        }
        FSkillTargetPositionSelectParams defaultValue;
        return defaultValue.MaxDistance;
    }
    return DataObject.Get().MaxDistance;
}
UFUNCTION()
float32 __FSkillTargetPositionSelectParams_GetMinDistance(const TDataObjectPtr<FSkillTargetPositionSelectParams> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MinDistance' from a null 'FSkillTargetPositionSelectParams' DataObject!");
        }
        FSkillTargetPositionSelectParams defaultValue;
        return defaultValue.MinDistance;
    }
    return DataObject.Get().MinDistance;
}
UFUNCTION()
float32 __FSkillTargetPositionSelectParams_GetInitAngle(const TDataObjectPtr<FSkillTargetPositionSelectParams> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'InitAngle' from a null 'FSkillTargetPositionSelectParams' DataObject!");
        }
        FSkillTargetPositionSelectParams defaultValue;
        return defaultValue.InitAngle;
    }
    return DataObject.Get().InitAngle;
}
UFUNCTION()
float32 __FSkillTargetPositionSelectParams_GetMaxAngle(const TDataObjectPtr<FSkillTargetPositionSelectParams> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MaxAngle' from a null 'FSkillTargetPositionSelectParams' DataObject!");
        }
        FSkillTargetPositionSelectParams defaultValue;
        return defaultValue.MaxAngle;
    }
    return DataObject.Get().MaxAngle;
}
UFUNCTION()
float32 __FSkillTargetPositionSelectParams_GetMinAngle(const TDataObjectPtr<FSkillTargetPositionSelectParams> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'MinAngle' from a null 'FSkillTargetPositionSelectParams' DataObject!");
        }
        FSkillTargetPositionSelectParams defaultValue;
        return defaultValue.MinAngle;
    }
    return DataObject.Get().MinAngle;
}
UFUNCTION()
float32 __FSkillTargetPositionSelectParams_GetDistanceSpeed(const TDataObjectPtr<FSkillTargetPositionSelectParams> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DistanceSpeed' from a null 'FSkillTargetPositionSelectParams' DataObject!");
        }
        FSkillTargetPositionSelectParams defaultValue;
        return defaultValue.DistanceSpeed;
    }
    return DataObject.Get().DistanceSpeed;
}
UFUNCTION()
float32 __FSkillTargetPositionSelectParams_GetAngleSpeed(const TDataObjectPtr<FSkillTargetPositionSelectParams> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AngleSpeed' from a null 'FSkillTargetPositionSelectParams' DataObject!");
        }
        FSkillTargetPositionSelectParams defaultValue;
        return defaultValue.AngleSpeed;
    }
    return DataObject.Get().AngleSpeed;
}
UFUNCTION()
float32 __FSkillTargetPositionSelectParams_GetPreTraceHeight(const TDataObjectPtr<FSkillTargetPositionSelectParams> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PreTraceHeight' from a null 'FSkillTargetPositionSelectParams' DataObject!");
        }
        FSkillTargetPositionSelectParams defaultValue;
        return defaultValue.PreTraceHeight;
    }
    return DataObject.Get().PreTraceHeight;
}
UFUNCTION()
float32 __FSkillTargetPositionSelectParams_GetTraceDownFloorDistance(const TDataObjectPtr<FSkillTargetPositionSelectParams> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TraceDownFloorDistance' from a null 'FSkillTargetPositionSelectParams' DataObject!");
        }
        FSkillTargetPositionSelectParams defaultValue;
        return defaultValue.TraceDownFloorDistance;
    }
    return DataObject.Get().TraceDownFloorDistance;
}
UFUNCTION()
FDataObjectPtr __FSkillTargetPositionSelectParams_GetCameraLookAtTargetConfig(const TDataObjectPtr<FSkillTargetPositionSelectParams> &inout DataObject)
{
    FDataObjectPtr __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'CameraLookAtTargetConfig' from a null 'FSkillTargetPositionSelectParams' DataObject!");
        }
        FSkillTargetPositionSelectParams local_78;
        return local_78.CameraLookAtTargetConfig;
    }
    return __r;
}
UFUNCTION()
FSkillTargetPositionFXConfig __FSkillTargetPositionSelectParams_GetHintFxConfig(const TDataObjectPtr<FSkillTargetPositionSelectParams> &inout DataObject)
{
    FSkillTargetPositionFXConfig __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HintFxConfig' from a null 'FSkillTargetPositionSelectParams' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
FSkillTargetPositionSelectParams CastToFSkillTargetPositionSelectParams(const TDataObjectPtr<FSkillTargetPositionSelectParams> &inout DataObject)
{
    FSkillTargetPositionSelectParams __r;
    return __r;
}
}
