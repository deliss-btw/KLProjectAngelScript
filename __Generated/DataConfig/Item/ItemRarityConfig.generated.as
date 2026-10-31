namespace __FItemRarityConfigFunctions
{
UFUNCTION()
EItemRarity __FItemRarityConfig_GetRarity(const TDataObjectPtr<FItemRarityConfig> &inout DataObject)
{
    int local_209 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Rarity' from a null 'FItemRarityConfig' DataObject!");
        }
        FItemRarityConfig local_208;
        local_209 = int(local_208.Rarity);
        return EItemRarity(local_209);
    }
    return EItemRarity(local_209);
}
UFUNCTION()
FText __FItemRarityConfig_GetRarityName(const TDataObjectPtr<FItemRarityConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RarityName' from a null 'FItemRarityConfig' DataObject!");
        }
        FItemRarityConfig local_208;
        return local_208.RarityName;
    }
    return __r;
}
UFUNCTION()
FLinearColor __FItemRarityConfig_GetDefaultColor(const TDataObjectPtr<FItemRarityConfig> &inout DataObject)
{
    FLinearColor __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DefaultColor' from a null 'FItemRarityConfig' DataObject!");
        }
        FItemRarityConfig local_208;
        return local_208.DefaultColor;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FItemRarityConfig_GetRarityImage(const TDataObjectPtr<FItemRarityConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RarityImage' from a null 'FItemRarityConfig' DataObject!");
        }
        FItemRarityConfig local_208;
        return local_208.RarityImage;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FItemRarityConfig_GetRectangleRarityImage(const TDataObjectPtr<FItemRarityConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RectangleRarityImage' from a null 'FItemRarityConfig' DataObject!");
        }
        FItemRarityConfig local_208;
        return local_208.RectangleRarityImage;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FItemRarityConfig_GetTipRarityImage(const TDataObjectPtr<FItemRarityConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TipRarityImage' from a null 'FItemRarityConfig' DataObject!");
        }
        FItemRarityConfig local_208;
        return local_208.TipRarityImage;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FItemRarityConfig_GetPopupBGRarityImage(const TDataObjectPtr<FItemRarityConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PopupBGRarityImage' from a null 'FItemRarityConfig' DataObject!");
        }
        FItemRarityConfig local_208;
        return local_208.PopupBGRarityImage;
    }
    return __r;
}
UFUNCTION()
FText __FItemRarityConfig_GetItemNamePrefix(const TDataObjectPtr<FItemRarityConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ItemNamePrefix' from a null 'FItemRarityConfig' DataObject!");
        }
        FItemRarityConfig local_208;
        return local_208.ItemNamePrefix;
    }
    return __r;
}
UFUNCTION()
FItemRarityConfig CastToFItemRarityConfig(const TDataObjectPtr<FItemRarityConfig> &inout DataObject)
{
    FItemRarityConfig __r;
    return __r;
}
}
