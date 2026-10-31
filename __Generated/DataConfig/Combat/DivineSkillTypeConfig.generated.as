namespace __FDivineSkillTypeConfigFunctions
{
UFUNCTION()
FText __FDivineSkillTypeConfig_GetTypeName(const TDataObjectPtr<FDivineSkillTypeConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TypeName' from a null 'FDivineSkillTypeConfig' DataObject!");
        }
        FDivineSkillTypeConfig local_76;
        return local_76.TypeName;
    }
    return __r;
}
UFUNCTION()
FSoftBrush __FDivineSkillTypeConfig_GetTypeIcon(const TDataObjectPtr<FDivineSkillTypeConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TypeIcon' from a null 'FDivineSkillTypeConfig' DataObject!");
        }
        FDivineSkillTypeConfig local_76;
        return local_76.TypeIcon;
    }
    return __r;
}
UFUNCTION()
FText __FDivineSkillTypeConfig_GetDescription(const TDataObjectPtr<FDivineSkillTypeConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Description' from a null 'FDivineSkillTypeConfig' DataObject!");
        }
        FDivineSkillTypeConfig local_76;
        return local_76.Description;
    }
    return __r;
}
UFUNCTION()
EAvatarIllustrate __FDivineSkillTypeConfig_GetTargetIllustrate(const TDataObjectPtr<FDivineSkillTypeConfig> &inout DataObject)
{
    int local_77 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TargetIllustrate' from a null 'FDivineSkillTypeConfig' DataObject!");
        }
        FDivineSkillTypeConfig local_76;
        local_77 = int(local_76.TargetIllustrate);
        return EAvatarIllustrate(local_77);
    }
    return EAvatarIllustrate(local_77);
}
UFUNCTION()
FString __FDivineSkillTypeConfig_GetRichTextImageName(const TDataObjectPtr<FDivineSkillTypeConfig> &inout DataObject)
{
    FString __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RichTextImageName' from a null 'FDivineSkillTypeConfig' DataObject!");
        }
        FDivineSkillTypeConfig local_76;
        return local_76.RichTextImageName;
    }
    return __r;
}
UFUNCTION()
FDivineSkillTypeConfig CastToFDivineSkillTypeConfig(const TDataObjectPtr<FDivineSkillTypeConfig> &inout DataObject)
{
    FDivineSkillTypeConfig __r;
    return __r;
}
}
