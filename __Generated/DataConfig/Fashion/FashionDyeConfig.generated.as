namespace __FFashionHairDyeConfigFunctions
{
UFUNCTION()
FLinearColor __FFashionHairDyeConfig_GetBaseColor(const TDataObjectPtr<FFashionHairDyeConfig> &inout DataObject)
{
    FLinearColor __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BaseColor' from a null 'FFashionHairDyeConfig' DataObject!");
        }
        FFashionHairDyeConfig local_60;
        return local_60.BaseColor;
    }
    return __r;
}
UFUNCTION()
FLinearColor __FFashionHairDyeConfig_GetRootColor(const TDataObjectPtr<FFashionHairDyeConfig> &inout DataObject)
{
    FLinearColor __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RootColor' from a null 'FFashionHairDyeConfig' DataObject!");
        }
        FFashionHairDyeConfig local_60;
        return local_60.RootColor;
    }
    return __r;
}
UFUNCTION()
FLinearColor __FFashionHairDyeConfig_GetTipColor(const TDataObjectPtr<FFashionHairDyeConfig> &inout DataObject)
{
    FLinearColor __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TipColor' from a null 'FFashionHairDyeConfig' DataObject!");
        }
        FFashionHairDyeConfig local_60;
        return local_60.TipColor;
    }
    return __r;
}
UFUNCTION()
FLinearColor __FFashionHairDyeConfig_GetIDColor(const TDataObjectPtr<FFashionHairDyeConfig> &inout DataObject)
{
    FLinearColor __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IDColor' from a null 'FFashionHairDyeConfig' DataObject!");
        }
        FFashionHairDyeConfig local_60;
        return local_60.IDColor;
    }
    return __r;
}
UFUNCTION()
float32 __FFashionHairDyeConfig_GetScatter(const TDataObjectPtr<FFashionHairDyeConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Scatter' from a null 'FFashionHairDyeConfig' DataObject!");
        }
        FFashionHairDyeConfig defaultValue;
        return defaultValue.Scatter;
    }
    return DataObject.Get().Scatter;
}
UFUNCTION()
float32 __FFashionHairDyeConfig_GetBrightness(const TDataObjectPtr<FFashionHairDyeConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Brightness' from a null 'FFashionHairDyeConfig' DataObject!");
        }
        FFashionHairDyeConfig defaultValue;
        return defaultValue.Brightness;
    }
    return DataObject.Get().Brightness;
}
UFUNCTION()
TArray<FName> __FFashionHairDyeConfig_GetSlotNames(const TDataObjectPtr<FFashionHairDyeConfig> &inout DataObject)
{
    TArray<FName> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SlotNames' from a null 'FFashionHairDyeConfig' DataObject!");
        }
        FFashionHairDyeConfig local_60;
        return local_60.SlotNames;
    }
    return __r;
}
UFUNCTION()
FLinearColor __FFashionHairDyeConfig_GetDecoColor1(const TDataObjectPtr<FFashionHairDyeConfig> &inout DataObject)
{
    FLinearColor __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DecoColor1' from a null 'FFashionHairDyeConfig' DataObject!");
        }
        FFashionHairDyeConfig local_60;
        return local_60.DecoColor1;
    }
    return __r;
}
UFUNCTION()
float32 __FFashionHairDyeConfig_GetDecoDye1(const TDataObjectPtr<FFashionHairDyeConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DecoDye1' from a null 'FFashionHairDyeConfig' DataObject!");
        }
        FFashionHairDyeConfig defaultValue;
        return defaultValue.DecoDye1;
    }
    return DataObject.Get().DecoDye1;
}
UFUNCTION()
FLinearColor __FFashionHairDyeConfig_GetDecoColor2(const TDataObjectPtr<FFashionHairDyeConfig> &inout DataObject)
{
    FLinearColor __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DecoColor2' from a null 'FFashionHairDyeConfig' DataObject!");
        }
        FFashionHairDyeConfig local_60;
        return local_60.DecoColor2;
    }
    return __r;
}
UFUNCTION()
float32 __FFashionHairDyeConfig_GetDecoDye2(const TDataObjectPtr<FFashionHairDyeConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DecoDye2' from a null 'FFashionHairDyeConfig' DataObject!");
        }
        FFashionHairDyeConfig defaultValue;
        return defaultValue.DecoDye2;
    }
    return DataObject.Get().DecoDye2;
}
UFUNCTION()
FLinearColor __FFashionHairDyeConfig_GetDecoColor3(const TDataObjectPtr<FFashionHairDyeConfig> &inout DataObject)
{
    FLinearColor __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DecoColor3' from a null 'FFashionHairDyeConfig' DataObject!");
        }
        FFashionHairDyeConfig local_60;
        return local_60.DecoColor3;
    }
    return __r;
}
UFUNCTION()
float32 __FFashionHairDyeConfig_GetDecoDye3(const TDataObjectPtr<FFashionHairDyeConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DecoDye3' from a null 'FFashionHairDyeConfig' DataObject!");
        }
        FFashionHairDyeConfig defaultValue;
        return defaultValue.DecoDye3;
    }
    return DataObject.Get().DecoDye3;
}
UFUNCTION()
FLinearColor __FFashionHairDyeConfig_GetDecoColor4(const TDataObjectPtr<FFashionHairDyeConfig> &inout DataObject)
{
    FLinearColor __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DecoColor4' from a null 'FFashionHairDyeConfig' DataObject!");
        }
        FFashionHairDyeConfig local_60;
        return local_60.DecoColor4;
    }
    return __r;
}
UFUNCTION()
float32 __FFashionHairDyeConfig_GetDecoDye4(const TDataObjectPtr<FFashionHairDyeConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DecoDye4' from a null 'FFashionHairDyeConfig' DataObject!");
        }
        FFashionHairDyeConfig defaultValue;
        return defaultValue.DecoDye4;
    }
    return DataObject.Get().DecoDye4;
}
UFUNCTION()
TArray<FName> __FFashionHairDyeConfig_GetDecoSlotNames(const TDataObjectPtr<FFashionHairDyeConfig> &inout DataObject)
{
    TArray<FName> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DecoSlotNames' from a null 'FFashionHairDyeConfig' DataObject!");
        }
        FFashionHairDyeConfig local_60;
        return local_60.DecoSlotNames;
    }
    return __r;
}
UFUNCTION()
FFashionHairDyeConfig CastToFFashionHairDyeConfig(const TDataObjectPtr<FFashionHairDyeConfig> &inout DataObject)
{
    FFashionHairDyeConfig __r;
    return __r;
}
}
namespace __FFashionClothDyeConfigFunctions
{
UFUNCTION()
float32 __FFashionClothDyeConfig_GetDye1(const TDataObjectPtr<FFashionClothDyeConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Dye1' from a null 'FFashionClothDyeConfig' DataObject!");
        }
        FFashionClothDyeConfig defaultValue;
        return defaultValue.Dye1;
    }
    return DataObject.Get().Dye1;
}
UFUNCTION()
FLinearColor __FFashionClothDyeConfig_GetDyeColor1(const TDataObjectPtr<FFashionClothDyeConfig> &inout DataObject)
{
    FLinearColor __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DyeColor1' from a null 'FFashionClothDyeConfig' DataObject!");
        }
        FFashionClothDyeConfig local_38;
        return local_38.DyeColor1;
    }
    return __r;
}
UFUNCTION()
float32 __FFashionClothDyeConfig_GetDye2(const TDataObjectPtr<FFashionClothDyeConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Dye2' from a null 'FFashionClothDyeConfig' DataObject!");
        }
        FFashionClothDyeConfig defaultValue;
        return defaultValue.Dye2;
    }
    return DataObject.Get().Dye2;
}
UFUNCTION()
FLinearColor __FFashionClothDyeConfig_GetDyeColor2(const TDataObjectPtr<FFashionClothDyeConfig> &inout DataObject)
{
    FLinearColor __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DyeColor2' from a null 'FFashionClothDyeConfig' DataObject!");
        }
        FFashionClothDyeConfig local_38;
        return local_38.DyeColor2;
    }
    return __r;
}
UFUNCTION()
float32 __FFashionClothDyeConfig_GetDye3(const TDataObjectPtr<FFashionClothDyeConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Dye3' from a null 'FFashionClothDyeConfig' DataObject!");
        }
        FFashionClothDyeConfig defaultValue;
        return defaultValue.Dye3;
    }
    return DataObject.Get().Dye3;
}
UFUNCTION()
FLinearColor __FFashionClothDyeConfig_GetDyeColor3(const TDataObjectPtr<FFashionClothDyeConfig> &inout DataObject)
{
    FLinearColor __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DyeColor3' from a null 'FFashionClothDyeConfig' DataObject!");
        }
        FFashionClothDyeConfig local_38;
        return local_38.DyeColor3;
    }
    return __r;
}
UFUNCTION()
float32 __FFashionClothDyeConfig_GetDye4(const TDataObjectPtr<FFashionClothDyeConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Dye4' from a null 'FFashionClothDyeConfig' DataObject!");
        }
        FFashionClothDyeConfig defaultValue;
        return defaultValue.Dye4;
    }
    return DataObject.Get().Dye4;
}
UFUNCTION()
FLinearColor __FFashionClothDyeConfig_GetDyeColor4(const TDataObjectPtr<FFashionClothDyeConfig> &inout DataObject)
{
    FLinearColor __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'DyeColor4' from a null 'FFashionClothDyeConfig' DataObject!");
        }
        FFashionClothDyeConfig local_38;
        return local_38.DyeColor4;
    }
    return __r;
}
UFUNCTION()
TArray<FName> __FFashionClothDyeConfig_GetSlotNames(const TDataObjectPtr<FFashionClothDyeConfig> &inout DataObject)
{
    TArray<FName> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SlotNames' from a null 'FFashionClothDyeConfig' DataObject!");
        }
        FFashionClothDyeConfig local_38;
        return local_38.SlotNames;
    }
    return __r;
}
UFUNCTION()
FFashionClothDyeConfig CastToFFashionClothDyeConfig(const TDataObjectPtr<FFashionClothDyeConfig> &inout DataObject)
{
    FFashionClothDyeConfig __r;
    return __r;
}
}
namespace __FFashionUpperClothDyeConfigFunctions
{
UFUNCTION()
FFashionUpperClothDyeConfig CastToFFashionUpperClothDyeConfig(const TDataObjectPtr<FFashionUpperClothDyeConfig> &inout DataObject)
{
    FFashionUpperClothDyeConfig __r;
    return __r;
}
}
namespace __FFashionLowerClothDyeConfigFunctions
{
UFUNCTION()
FFashionLowerClothDyeConfig CastToFFashionLowerClothDyeConfig(const TDataObjectPtr<FFashionLowerClothDyeConfig> &inout DataObject)
{
    FFashionLowerClothDyeConfig __r;
    return __r;
}
}
