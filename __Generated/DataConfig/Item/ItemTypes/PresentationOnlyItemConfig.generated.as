namespace __FPresentationOnlyItemConfigFunctions
{
UFUNCTION()
FPresentationOnlyItemConfig CastToFPresentationOnlyItemConfig(const TDataObjectPtr<FPresentationOnlyItemConfig> &inout DataObject)
{
    FPresentationOnlyItemConfig __r;
    return __r;
}
}
namespace __FRemnantItemConfigFunctions
{
UFUNCTION()
USkillConfig __FRemnantItemConfig_GetItemSkillConfig(const TDataObjectPtr<FRemnantItemConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ItemSkillConfig' from a null 'FRemnantItemConfig' DataObject!");
        }
        FRemnantItemConfig local_236;
        return local_236.ItemSkillConfig;
    }
    USkillConfig local_238;
    return local_238;
}
UFUNCTION()
FBuffConfigRef __FRemnantItemConfig_GetItemBuffConfig(const TDataObjectPtr<FRemnantItemConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ItemBuffConfig' from a null 'FRemnantItemConfig' DataObject!");
        }
        FRemnantItemConfig local_236;
        return local_236.ItemBuffConfig;
    }
    return DataObject.Get().ItemBuffConfig;
}
UFUNCTION()
int __FRemnantItemConfig_GetUsableCount(const TDataObjectPtr<FRemnantItemConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'UsableCount' from a null 'FRemnantItemConfig' DataObject!");
        }
        FRemnantItemConfig defaultValue;
        return defaultValue.UsableCount;
    }
    return DataObject.Get().UsableCount;
}
UFUNCTION()
TDataObjectPtr<FMessageHintConfig_LargeHint> __FRemnantItemConfig_GetHint(const TDataObjectPtr<FRemnantItemConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Hint' from a null 'FRemnantItemConfig' DataObject!");
        }
        FRemnantItemConfig local_236;
        return local_236.GetHint();
    }
    return DataObject.Get().GetHint();
}
UFUNCTION()
FRemnantItemConfig CastToFRemnantItemConfig(const TDataObjectPtr<FRemnantItemConfig> &inout DataObject)
{
    FRemnantItemConfig __r;
    return __r;
}
}
