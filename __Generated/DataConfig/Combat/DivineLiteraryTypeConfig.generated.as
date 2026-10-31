namespace __FDivineLiteraryTypeConfigFunctions
{
UFUNCTION()
FText __FDivineLiteraryTypeConfig_GetLiteraryName(const TDataObjectPtr<FDivineLiteraryTypeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LiteraryName' from a null 'FDivineLiteraryTypeConfig' DataObject!");
        }
        FDivineLiteraryTypeConfig local_156;
        return local_156.LiteraryName;
    }
    return DataObject.Get().LiteraryName;
}
UFUNCTION()
FSoftBrush __FDivineLiteraryTypeConfig_GetLiteraryImage(const TDataObjectPtr<FDivineLiteraryTypeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LiteraryImage' from a null 'FDivineLiteraryTypeConfig' DataObject!");
        }
        FDivineLiteraryTypeConfig local_156;
        return local_156.LiteraryImage;
    }
    return DataObject.Get().LiteraryImage;
}
UFUNCTION()
FSoftBrush __FDivineLiteraryTypeConfig_GetLiteraryStrengtheningImage(const TDataObjectPtr<FDivineLiteraryTypeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LiteraryStrengtheningImage' from a null 'FDivineLiteraryTypeConfig' DataObject!");
        }
        FDivineLiteraryTypeConfig local_156;
        return local_156.LiteraryStrengtheningImage;
    }
    return DataObject.Get().LiteraryStrengtheningImage;
}
UFUNCTION()
FSoftBrush __FDivineLiteraryTypeConfig_GetLiteraryWeakenImage(const TDataObjectPtr<FDivineLiteraryTypeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'LiteraryWeakenImage' from a null 'FDivineLiteraryTypeConfig' DataObject!");
        }
        FDivineLiteraryTypeConfig local_156;
        return local_156.LiteraryWeakenImage;
    }
    return DataObject.Get().LiteraryWeakenImage;
}
UFUNCTION()
FText __FDivineLiteraryTypeConfig_GetDescription(const TDataObjectPtr<FDivineLiteraryTypeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Description' from a null 'FDivineLiteraryTypeConfig' DataObject!");
        }
        FDivineLiteraryTypeConfig local_156;
        return local_156.Description;
    }
    return DataObject.Get().Description;
}
UFUNCTION()
FDivineLiteraryTypeConfig CastToFDivineLiteraryTypeConfig(const TDataObjectPtr<FDivineLiteraryTypeConfig> &inout DataObject)
{
    FDivineLiteraryTypeConfig __r;
    return __r;
}
}
