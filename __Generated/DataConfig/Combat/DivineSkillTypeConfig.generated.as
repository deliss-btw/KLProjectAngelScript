namespace __FDivineSkillTypeConfigFunctions
{
UFUNCTION()
FText __FDivineSkillTypeConfig_GetTypeName(const TDataObjectPtr<FDivineSkillTypeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TypeName' from a null 'FDivineSkillTypeConfig' DataObject!");
        }
        FDivineSkillTypeConfig local_76;
        return local_76.TypeName;
    }
    return DataObject.Get().TypeName;
}
UFUNCTION()
FSoftBrush __FDivineSkillTypeConfig_GetTypeIcon(const TDataObjectPtr<FDivineSkillTypeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TypeIcon' from a null 'FDivineSkillTypeConfig' DataObject!");
        }
        FDivineSkillTypeConfig local_76;
        return local_76.TypeIcon;
    }
    return DataObject.Get().TypeIcon;
}
UFUNCTION()
FText __FDivineSkillTypeConfig_GetDescription(const TDataObjectPtr<FDivineSkillTypeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Description' from a null 'FDivineSkillTypeConfig' DataObject!");
        }
        FDivineSkillTypeConfig local_76;
        return local_76.Description;
    }
    return DataObject.Get().Description;
}
UFUNCTION()
EAvatarIllustrate __FDivineSkillTypeConfig_GetTargetIllustrate(const TDataObjectPtr<FDivineSkillTypeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TargetIllustrate' from a null 'FDivineSkillTypeConfig' DataObject!");
        }
        FDivineSkillTypeConfig local_76;
        return local_76.TargetIllustrate;
    }
    return DataObject.Get().TargetIllustrate;
}
UFUNCTION()
FString __FDivineSkillTypeConfig_GetRichTextImageName(const TDataObjectPtr<FDivineSkillTypeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RichTextImageName' from a null 'FDivineSkillTypeConfig' DataObject!");
        }
        FDivineSkillTypeConfig local_76;
        return local_76.RichTextImageName;
    }
    return DataObject.Get().RichTextImageName;
}
UFUNCTION()
FDivineSkillTypeConfig CastToFDivineSkillTypeConfig(const TDataObjectPtr<FDivineSkillTypeConfig> &inout DataObject)
{
    FDivineSkillTypeConfig __r;
    return __r;
}
}
