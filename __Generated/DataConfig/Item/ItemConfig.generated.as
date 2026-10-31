namespace __FItemConfigFunctions
{
UFUNCTION()
FText __FItemConfig_GetItemName(const TDataObjectPtr<FItemConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ItemName' from a null 'FItemConfig' DataObject!");
        }
        FItemConfig local_184;
        return local_184.ItemName;
    }
    return __r;
}
UFUNCTION()
FText __FItemConfig_GetItemDescription(const TDataObjectPtr<FItemConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ItemDescription' from a null 'FItemConfig' DataObject!");
        }
        FItemConfig local_184;
        return local_184.ItemDescription;
    }
    return __r;
}
UFUNCTION()
FText __FItemConfig_GetItemBackgroundDescription(const TDataObjectPtr<FItemConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ItemBackgroundDescription' from a null 'FItemConfig' DataObject!");
        }
        FItemConfig local_184;
        return local_184.ItemBackgroundDescription;
    }
    return __r;
}
UFUNCTION()
EItemType __FItemConfig_GetItemType(const TDataObjectPtr<FItemConfig> &inout DataObject)
{
    int local_185 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ItemType' from a null 'FItemConfig' DataObject!");
        }
        FItemConfig local_184;
        local_185 = int(local_184.ItemType);
        return EItemType(local_185);
    }
    return EItemType(local_185);
}
UFUNCTION()
EItemTrunk __FItemConfig_GetItemTrunk(const TDataObjectPtr<FItemConfig> &inout DataObject)
{
    int local_185 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ItemTrunk' from a null 'FItemConfig' DataObject!");
        }
        FItemConfig local_184;
        local_185 = int(local_184.ItemTrunk);
        return EItemTrunk(local_185);
    }
    return EItemTrunk(local_185);
}
UFUNCTION()
FFilteredGameplayTag __FItemConfig_GetItemCategory(const TDataObjectPtr<FItemConfig> &inout DataObject)
{
    FFilteredGameplayTag __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ItemCategory' from a null 'FItemConfig' DataObject!");
        }
        FItemConfig local_184;
        return local_184.ItemCategory;
    }
    return __r;
}
UFUNCTION()
FGameplayTagContainer __FItemConfig_GetItemTags(const TDataObjectPtr<FItemConfig> &inout DataObject)
{
    FGameplayTagContainer __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ItemTags' from a null 'FItemConfig' DataObject!");
        }
        FItemConfig local_184;
        return local_184.ItemTags;
    }
    return __r;
}
UFUNCTION()
EItemRarity __FItemConfig_GetRarity(const TDataObjectPtr<FItemConfig> &inout DataObject)
{
    int local_185 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Rarity' from a null 'FItemConfig' DataObject!");
        }
        FItemConfig local_184;
        local_185 = int(local_184.Rarity);
        return EItemRarity(local_185);
    }
    return EItemRarity(local_185);
}
UFUNCTION()
FSoftBrush __FItemConfig_GetItemIcon(const TDataObjectPtr<FItemConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ItemIcon' from a null 'FItemConfig' DataObject!");
        }
        FItemConfig local_184;
        return local_184.ItemIcon;
    }
    return __r;
}
UFUNCTION()
TSoftClassPtr<ACollectionPrefab> __FItemConfig_GetDropPrefab(const TDataObjectPtr<FItemConfig> &inout DataObject)
{
    TSoftClassPtr<ACollectionPrefab> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DropPrefab' from a null 'FItemConfig' DataObject!");
        }
        FItemConfig local_184;
        return local_184.DropPrefab;
    }
    return __r;
}
UFUNCTION()
EDropItemAllocation __FItemConfig_GetDefaultDropAllocation(const TDataObjectPtr<FItemConfig> &inout DataObject)
{
    int local_185 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultDropAllocation' from a null 'FItemConfig' DataObject!");
        }
        FItemConfig local_184;
        local_185 = int(local_184.DefaultDropAllocation);
        return EDropItemAllocation(local_185);
    }
    return EDropItemAllocation(local_185);
}
UFUNCTION()
TMap<EItemActionType, TSubclassOf<UItemActionConfigBase>> __FItemConfig_GetItemActions(const TDataObjectPtr<FItemConfig> &inout DataObject)
{
    TMap<EItemActionType, TSubclassOf<UItemActionConfigBase>> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ItemActions' from a null 'FItemConfig' DataObject!");
        }
        FItemConfig local_184;
        return local_184.ItemActions;
    }
    return __r;
}
UFUNCTION()
TDataObjectPtr<FDropItemConfigBase> __FItemConfig_GetDecomposeConfig(const TDataObjectPtr<FItemConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DecomposeConfig' from a null 'FItemConfig' DataObject!");
        }
        FItemConfig local_184;
        return local_184.GetDecomposeConfig();
    }
    return GetDecomposeConfig();
}
UFUNCTION()
bool __FItemConfig_GetbAllowDestroy(const TDataObjectPtr<FItemConfig> &inout DataObject)
{
    bool local_1 = false;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bAllowDestroy' from a null 'FItemConfig' DataObject!");
        }
        FItemConfig local_184;
        return local_184.bAllowDestroy;
    }
    return local_1;
}
UFUNCTION()
TArray<FItemGainWayConfig> __FItemConfig_GetGainWays(const TDataObjectPtr<FItemConfig> &inout DataObject)
{
    TArray<FItemGainWayConfig> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GainWays' from a null 'FItemConfig' DataObject!");
        }
        FItemConfig local_184;
        return local_184.GainWays;
    }
    return __r;
}
UFUNCTION()
TDataObjectPtr<FMessageHintConfig> __FItemConfig_GetItemShortageTips(const TDataObjectPtr<FItemConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ItemShortageTips' from a null 'FItemConfig' DataObject!");
        }
        FItemConfig local_184;
        return local_184.GetItemShortageTips();
    }
    return GetItemShortageTips();
}
UFUNCTION()
FItemConfig CastToFItemConfig(const TDataObjectPtr<FItemConfig> &inout DataObject)
{
    FItemConfig __r;
    return __r;
}
}
