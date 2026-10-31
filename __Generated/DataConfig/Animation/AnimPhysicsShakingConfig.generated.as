namespace __FAnimPhysicsShakingConfigFunctions
{
UFUNCTION()
TArray<FBoneChainBaseConfig> __FAnimPhysicsShakingConfig_GetBoneChainBaseConfigs(const TDataObjectPtr<FAnimPhysicsShakingConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BoneChainBaseConfigs' from a null 'FAnimPhysicsShakingConfig' DataObject!");
        }
        FAnimPhysicsShakingConfig local_74;
        return local_74.BoneChainBaseConfigs;
    }
    return DataObject.Get().BoneChainBaseConfigs;
}
UFUNCTION()
FBoneChainShakeCurveConfig __FAnimPhysicsShakingConfig_GetDefaultShakeCurveConfig(const TDataObjectPtr<FAnimPhysicsShakingConfig> &inout DataObject)
{
    FBoneChainShakeCurveConfig __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultShakeCurveConfig' from a null 'FAnimPhysicsShakingConfig' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
TArray<FBoneChainShakeCurveConfig> __FAnimPhysicsShakingConfig_GetOverrideShakeCurveConfigs(const TDataObjectPtr<FAnimPhysicsShakingConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'OverrideShakeCurveConfigs' from a null 'FAnimPhysicsShakingConfig' DataObject!");
        }
        FAnimPhysicsShakingConfig local_74;
        return local_74.OverrideShakeCurveConfigs;
    }
    return DataObject.Get().OverrideShakeCurveConfigs;
}
UFUNCTION()
FAnimPhysicsShakingConfig CastToFAnimPhysicsShakingConfig(const TDataObjectPtr<FAnimPhysicsShakingConfig> &inout DataObject)
{
    FAnimPhysicsShakingConfig __r;
    return __r;
}
}
