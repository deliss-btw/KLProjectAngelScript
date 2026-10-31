namespace __FForgeTreeConfigFunctions
{
UFUNCTION()
int __FForgeTreeConfig_GetPriority(const TDataObjectPtr<FForgeTreeConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Priority' from a null 'FForgeTreeConfig' DataObject!");
        }
        FForgeTreeConfig defaultValue;
        return defaultValue.Priority;
    }
    return DataObject.Get().Priority;
}
UFUNCTION()
FText __FForgeTreeConfig_GetForgeTreeName(const TDataObjectPtr<FForgeTreeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ForgeTreeName' from a null 'FForgeTreeConfig' DataObject!");
        }
        FForgeTreeConfig local_136;
        return local_136.ForgeTreeName;
    }
    return DataObject.Get().ForgeTreeName;
}
UFUNCTION()
FSoftBrush __FForgeTreeConfig_GetForgeTreeImage(const TDataObjectPtr<FForgeTreeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ForgeTreeImage' from a null 'FForgeTreeConfig' DataObject!");
        }
        FForgeTreeConfig local_136;
        return local_136.ForgeTreeImage;
    }
    return DataObject.Get().ForgeTreeImage;
}
UFUNCTION()
FSoftBrush __FForgeTreeConfig_GetForgeTreeHiddenImage(const TDataObjectPtr<FForgeTreeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ForgeTreeHiddenImage' from a null 'FForgeTreeConfig' DataObject!");
        }
        FForgeTreeConfig local_136;
        return local_136.ForgeTreeHiddenImage;
    }
    return DataObject.Get().ForgeTreeHiddenImage;
}
UFUNCTION()
EWeaponType __FForgeTreeConfig_GetWeaponType(const TDataObjectPtr<FForgeTreeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeaponType' from a null 'FForgeTreeConfig' DataObject!");
        }
        FForgeTreeConfig local_136;
        return local_136.WeaponType;
    }
    return DataObject.Get().WeaponType;
}
UFUNCTION()
TArray<TDataObjectPtr<FConditionConfig>> __FForgeTreeConfig_GetShowCondition(const TDataObjectPtr<FForgeTreeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ShowCondition' from a null 'FForgeTreeConfig' DataObject!");
        }
        FForgeTreeConfig local_136;
        return local_136.GetShowCondition();
    }
    return DataObject.Get().GetShowCondition();
}
UFUNCTION()
TArray<TDataObjectPtr<FConditionConfig>> __FForgeTreeConfig_GetUnlockCondition(const TDataObjectPtr<FForgeTreeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UnlockCondition' from a null 'FForgeTreeConfig' DataObject!");
        }
        FForgeTreeConfig local_136;
        return local_136.GetUnlockCondition();
    }
    return DataObject.Get().GetUnlockCondition();
}
UFUNCTION()
TArray<FForgeTreeData> __FForgeTreeConfig_GetBranchArray1(const TDataObjectPtr<FForgeTreeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BranchArray1' from a null 'FForgeTreeConfig' DataObject!");
        }
        FForgeTreeConfig local_136;
        return local_136.BranchArray1;
    }
    return DataObject.Get().BranchArray1;
}
UFUNCTION()
TArray<FForgeTreeData> __FForgeTreeConfig_GetBranchArray2(const TDataObjectPtr<FForgeTreeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BranchArray2' from a null 'FForgeTreeConfig' DataObject!");
        }
        FForgeTreeConfig local_136;
        return local_136.BranchArray2;
    }
    return DataObject.Get().BranchArray2;
}
UFUNCTION()
TArray<FForgeTreeData> __FForgeTreeConfig_GetBranchArray3(const TDataObjectPtr<FForgeTreeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BranchArray3' from a null 'FForgeTreeConfig' DataObject!");
        }
        FForgeTreeConfig local_136;
        return local_136.BranchArray3;
    }
    return DataObject.Get().BranchArray3;
}
UFUNCTION()
FForgeTreeConfig CastToFForgeTreeConfig(const TDataObjectPtr<FForgeTreeConfig> &inout DataObject)
{
    FForgeTreeConfig __r;
    return __r;
}
}
