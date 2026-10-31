namespace __FTalentLayoutTreeConfigFunctions
{
UFUNCTION()
int __FTalentLayoutTreeConfig_GetPriority(const TDataObjectPtr<FTalentLayoutTreeConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Priority' from a null 'FTalentLayoutTreeConfig' DataObject!");
        }
        FTalentLayoutTreeConfig defaultValue;
        return defaultValue.Priority;
    }
    return DataObject.Get().Priority;
}
UFUNCTION()
TDataObjectPtr<FAvatarMappingConfig> __FTalentLayoutTreeConfig_GetAvatar(const TDataObjectPtr<FTalentLayoutTreeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Avatar' from a null 'FTalentLayoutTreeConfig' DataObject!");
        }
        FTalentLayoutTreeConfig local_120;
        return local_120.GetAvatar();
    }
    return DataObject.Get().GetAvatar();
}
UFUNCTION()
TDataObjectPtr<FTalentConfig> __FTalentLayoutTreeConfig_GetTalentBaseData(const TDataObjectPtr<FTalentLayoutTreeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TalentBaseData' from a null 'FTalentLayoutTreeConfig' DataObject!");
        }
        FTalentLayoutTreeConfig local_120;
        return local_120.GetTalentBaseData();
    }
    return DataObject.Get().GetTalentBaseData();
}
UFUNCTION()
FText __FTalentLayoutTreeConfig_GetTitleName(const TDataObjectPtr<FTalentLayoutTreeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TitleName' from a null 'FTalentLayoutTreeConfig' DataObject!");
        }
        FTalentLayoutTreeConfig local_120;
        return local_120.TitleName;
    }
    return DataObject.Get().TitleName;
}
UFUNCTION()
FSoftBrush __FTalentLayoutTreeConfig_GetTitleImage(const TDataObjectPtr<FTalentLayoutTreeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TitleImage' from a null 'FTalentLayoutTreeConfig' DataObject!");
        }
        FTalentLayoutTreeConfig local_120;
        return local_120.TitleImage;
    }
    return DataObject.Get().TitleImage;
}
UFUNCTION()
TArray<FTalentTreeNode> __FTalentLayoutTreeConfig_GetTalentTreeArray(const TDataObjectPtr<FTalentLayoutTreeConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'TalentTreeArray' from a null 'FTalentLayoutTreeConfig' DataObject!");
        }
        FTalentLayoutTreeConfig local_120;
        return local_120.TalentTreeArray;
    }
    return DataObject.Get().TalentTreeArray;
}
UFUNCTION()
FTalentLayoutTreeConfig CastToFTalentLayoutTreeConfig(const TDataObjectPtr<FTalentLayoutTreeConfig> &inout DataObject)
{
    FTalentLayoutTreeConfig __r;
    return __r;
}
}
