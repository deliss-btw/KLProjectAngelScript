namespace __FItemRarityConfigFunctions
{
UFUNCTION()
EItemRarity __FItemRarityConfig_GetRarity(const TDataObjectPtr<FItemRarityConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Rarity' from a null 'FItemRarityConfig' DataObject!");
        }
        FItemRarityConfig local_208;
        return local_208.Rarity;
    }
    return DataObject.Get().Rarity;
}
UFUNCTION()
FText __FItemRarityConfig_GetRarityName(const TDataObjectPtr<FItemRarityConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RarityName' from a null 'FItemRarityConfig' DataObject!");
        }
        FItemRarityConfig local_208;
        return local_208.RarityName;
    }
    return DataObject.Get().RarityName;
}
UFUNCTION()
FLinearColor __FItemRarityConfig_GetDefaultColor(const TDataObjectPtr<FItemRarityConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultColor' from a null 'FItemRarityConfig' DataObject!");
        }
        FItemRarityConfig local_208;
        return local_208.DefaultColor;
    }
    return DataObject.Get().DefaultColor;
}
UFUNCTION()
FSoftBrush __FItemRarityConfig_GetRarityImage(const TDataObjectPtr<FItemRarityConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RarityImage' from a null 'FItemRarityConfig' DataObject!");
        }
        FItemRarityConfig local_208;
        return local_208.RarityImage;
    }
    return DataObject.Get().RarityImage;
}
UFUNCTION()
FSoftBrush __FItemRarityConfig_GetRectangleRarityImage(const TDataObjectPtr<FItemRarityConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RectangleRarityImage' from a null 'FItemRarityConfig' DataObject!");
        }
        FItemRarityConfig local_208;
        return local_208.RectangleRarityImage;
    }
    return DataObject.Get().RectangleRarityImage;
}
UFUNCTION()
FSoftBrush __FItemRarityConfig_GetTipRarityImage(const TDataObjectPtr<FItemRarityConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TipRarityImage' from a null 'FItemRarityConfig' DataObject!");
        }
        FItemRarityConfig local_208;
        return local_208.TipRarityImage;
    }
    return DataObject.Get().TipRarityImage;
}
UFUNCTION()
FSoftBrush __FItemRarityConfig_GetPopupBGRarityImage(const TDataObjectPtr<FItemRarityConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PopupBGRarityImage' from a null 'FItemRarityConfig' DataObject!");
        }
        FItemRarityConfig local_208;
        return local_208.PopupBGRarityImage;
    }
    return DataObject.Get().PopupBGRarityImage;
}
UFUNCTION()
FText __FItemRarityConfig_GetItemNamePrefix(const TDataObjectPtr<FItemRarityConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ItemNamePrefix' from a null 'FItemRarityConfig' DataObject!");
        }
        FItemRarityConfig local_208;
        return local_208.ItemNamePrefix;
    }
    return DataObject.Get().ItemNamePrefix;
}
UFUNCTION()
FItemRarityConfig CastToFItemRarityConfig(const TDataObjectPtr<FItemRarityConfig> &inout DataObject)
{
    FItemRarityConfig __r;
    return __r;
}
}
