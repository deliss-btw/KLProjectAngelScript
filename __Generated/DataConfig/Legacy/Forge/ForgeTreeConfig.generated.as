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
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ForgeTreeName' from a null 'FForgeTreeConfig' DataObject!");
        }
        FForgeTreeConfig local_136;
        return local_136.ForgeTreeName;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FForgeTreeConfig_GetForgeTreeImage(const TDataObjectPtr<FForgeTreeConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ForgeTreeImage' from a null 'FForgeTreeConfig' DataObject!");
        }
        FForgeTreeConfig local_136;
        return local_136.ForgeTreeImage;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FForgeTreeConfig_GetForgeTreeHiddenImage(const TDataObjectPtr<FForgeTreeConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ForgeTreeHiddenImage' from a null 'FForgeTreeConfig' DataObject!");
        }
        FForgeTreeConfig local_136;
        return local_136.ForgeTreeHiddenImage;
    }
    return __r;
}
UFUNCTION()
EWeaponType __FForgeTreeConfig_GetWeaponType(const TDataObjectPtr<FForgeTreeConfig> &inout DataObject)
{
    int local_137 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'WeaponType' from a null 'FForgeTreeConfig' DataObject!");
        }
        FForgeTreeConfig local_136;
        local_137 = int(local_136.WeaponType);
        return EWeaponType(local_137);
    }
    return EWeaponType(local_137);
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
    return GetShowCondition();
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
    return GetUnlockCondition();
}
UFUNCTION()
TArray<FForgeTreeData> __FForgeTreeConfig_GetBranchArray1(const TDataObjectPtr<FForgeTreeConfig> &inout DataObject)
{
    TArray<FForgeTreeData> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BranchArray1' from a null 'FForgeTreeConfig' DataObject!");
        }
        FForgeTreeConfig local_136;
        return local_136.BranchArray1;
    }
    return __r;
}
UFUNCTION()
TArray<FForgeTreeData> __FForgeTreeConfig_GetBranchArray2(const TDataObjectPtr<FForgeTreeConfig> &inout DataObject)
{
    TArray<FForgeTreeData> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BranchArray2' from a null 'FForgeTreeConfig' DataObject!");
        }
        FForgeTreeConfig local_136;
        return local_136.BranchArray2;
    }
    return __r;
}
UFUNCTION()
TArray<FForgeTreeData> __FForgeTreeConfig_GetBranchArray3(const TDataObjectPtr<FForgeTreeConfig> &inout DataObject)
{
    TArray<FForgeTreeData> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BranchArray3' from a null 'FForgeTreeConfig' DataObject!");
        }
        FForgeTreeConfig local_136;
        return local_136.BranchArray3;
    }
    return __r;
}
UFUNCTION()
FForgeTreeConfig CastToFForgeTreeConfig(const TDataObjectPtr<FForgeTreeConfig> &inout DataObject)
{
    FForgeTreeConfig __r;
    return __r;
}
}
