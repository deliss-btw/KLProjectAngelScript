namespace __FItemConfigFunctions
{
UFUNCTION()
FText __FItemConfig_GetItemName(const TDataObjectPtr<FItemConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ItemName' from a null 'FItemConfig' DataObject!");
        }
        FItemConfig local_184;
        return local_184.ItemName;
    }
    return DataObject.Get().ItemName;
}
UFUNCTION()
FText __FItemConfig_GetItemDescription(const TDataObjectPtr<FItemConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ItemDescription' from a null 'FItemConfig' DataObject!");
        }
        FItemConfig local_184;
        return local_184.ItemDescription;
    }
    return DataObject.Get().ItemDescription;
}
UFUNCTION()
FText __FItemConfig_GetItemBackgroundDescription(const TDataObjectPtr<FItemConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ItemBackgroundDescription' from a null 'FItemConfig' DataObject!");
        }
        FItemConfig local_184;
        return local_184.ItemBackgroundDescription;
    }
    return DataObject.Get().ItemBackgroundDescription;
}
UFUNCTION()
EItemType __FItemConfig_GetItemType(const TDataObjectPtr<FItemConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ItemType' from a null 'FItemConfig' DataObject!");
        }
        FItemConfig local_184;
        return local_184.ItemType;
    }
    return DataObject.Get().ItemType;
}
UFUNCTION()
EItemTrunk __FItemConfig_GetItemTrunk(const TDataObjectPtr<FItemConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ItemTrunk' from a null 'FItemConfig' DataObject!");
        }
        FItemConfig local_184;
        return local_184.ItemTrunk;
    }
    return DataObject.Get().ItemTrunk;
}
UFUNCTION()
FFilteredGameplayTag __FItemConfig_GetItemCategory(const TDataObjectPtr<FItemConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ItemCategory' from a null 'FItemConfig' DataObject!");
        }
        FItemConfig local_184;
        return local_184.ItemCategory;
    }
    return DataObject.Get().ItemCategory;
}
UFUNCTION()
FGameplayTagContainer __FItemConfig_GetItemTags(const TDataObjectPtr<FItemConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ItemTags' from a null 'FItemConfig' DataObject!");
        }
        FItemConfig local_184;
        return local_184.ItemTags;
    }
    return DataObject.Get().ItemTags;
}
UFUNCTION()
EItemRarity __FItemConfig_GetRarity(const TDataObjectPtr<FItemConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Rarity' from a null 'FItemConfig' DataObject!");
        }
        FItemConfig local_184;
        return local_184.Rarity;
    }
    return DataObject.Get().Rarity;
}
UFUNCTION()
FSoftBrush __FItemConfig_GetItemIcon(const TDataObjectPtr<FItemConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ItemIcon' from a null 'FItemConfig' DataObject!");
        }
        FItemConfig local_184;
        return local_184.ItemIcon;
    }
    return DataObject.Get().ItemIcon;
}
UFUNCTION()
TSoftClassPtr<ACollectionPrefab> __FItemConfig_GetDropPrefab(const TDataObjectPtr<FItemConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DropPrefab' from a null 'FItemConfig' DataObject!");
        }
        FItemConfig local_184;
        return local_184.DropPrefab;
    }
    return DataObject.Get().DropPrefab;
}
UFUNCTION()
EDropItemAllocation __FItemConfig_GetDefaultDropAllocation(const TDataObjectPtr<FItemConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultDropAllocation' from a null 'FItemConfig' DataObject!");
        }
        FItemConfig local_184;
        return local_184.DefaultDropAllocation;
    }
    return DataObject.Get().DefaultDropAllocation;
}
UFUNCTION()
TMap<EItemActionType, TSubclassOf<UItemActionConfigBase>> __FItemConfig_GetItemActions(const TDataObjectPtr<FItemConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ItemActions' from a null 'FItemConfig' DataObject!");
        }
        FItemConfig local_184;
        return local_184.ItemActions;
    }
    return DataObject.Get().ItemActions;
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
    return DataObject.Get().GetDecomposeConfig();
}
UFUNCTION()
bool __FItemConfig_GetbAllowDestroy(const TDataObjectPtr<FItemConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bAllowDestroy' from a null 'FItemConfig' DataObject!");
        }
        FItemConfig local_184;
        return local_184.bAllowDestroy;
    }
    return DataObject.Get().bAllowDestroy;
}
UFUNCTION()
TArray<FItemGainWayConfig> __FItemConfig_GetGainWays(const TDataObjectPtr<FItemConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GainWays' from a null 'FItemConfig' DataObject!");
        }
        FItemConfig local_184;
        return local_184.GainWays;
    }
    return DataObject.Get().GainWays;
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
    return DataObject.Get().GetItemShortageTips();
}
UFUNCTION()
FItemConfig CastToFItemConfig(const TDataObjectPtr<FItemConfig> &inout DataObject)
{
    FItemConfig __r;
    return __r;
}
}
