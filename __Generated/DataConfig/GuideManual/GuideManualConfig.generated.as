namespace __FGuidePageConfigFunctions
{
UFUNCTION()
int __FGuidePageConfig_GetPageId(const TDataObjectPtr<FGuidePageConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'PageId' from a null 'FGuidePageConfig' DataObject!");
        }
        FGuidePageConfig defaultValue;
        return defaultValue.PageId;
    }
    return DataObject.Get().PageId;
}
UFUNCTION()
EGuidePageAssetType __FGuidePageConfig_GetAssetType(const TDataObjectPtr<FGuidePageConfig> &inout DataObject)
{
    int local_73 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AssetType' from a null 'FGuidePageConfig' DataObject!");
        }
        FGuidePageConfig local_72;
        local_73 = int(local_72.AssetType);
        return EGuidePageAssetType(local_73);
    }
    return EGuidePageAssetType(local_73);
}
UFUNCTION()
FSoftBrush __FGuidePageConfig_GetAssetImage(const TDataObjectPtr<FGuidePageConfig> &inout DataObject)
{
    FSoftBrush __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AssetImage' from a null 'FGuidePageConfig' DataObject!");
        }
        FGuidePageConfig local_72;
        return local_72.AssetImage;
    }
    return __r;
}
UFUNCTION()
UMediaSource __FGuidePageConfig_GetAssetVideo(const TDataObjectPtr<FGuidePageConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AssetVideo' from a null 'FGuidePageConfig' DataObject!");
        }
        FGuidePageConfig local_72;
        return local_72.AssetVideo;
    }
    UMediaSource local_74;
    return local_74;
}
UFUNCTION()
FText __FGuidePageConfig_GetDesc(const TDataObjectPtr<FGuidePageConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Desc' from a null 'FGuidePageConfig' DataObject!");
        }
        FGuidePageConfig local_72;
        return local_72.Desc;
    }
    return __r;
}
UFUNCTION()
FGuidePageConfig CastToFGuidePageConfig(const TDataObjectPtr<FGuidePageConfig> &inout DataObject)
{
    FGuidePageConfig __r;
    return __r;
}
}
namespace __FGuideGroupConfigFunctions
{
UFUNCTION()
int __FGuideGroupConfig_GetGroupId(const TDataObjectPtr<FGuideGroupConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GroupId' from a null 'FGuideGroupConfig' DataObject!");
        }
        FGuideGroupConfig defaultValue;
        return defaultValue.GroupId;
    }
    return DataObject.Get().GroupId;
}
UFUNCTION()
TArray<TDataObjectPtr<FServerConditionConfigBase>> __FGuideGroupConfig_GetActiveConds(const TDataObjectPtr<FGuideGroupConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ActiveConds' from a null 'FGuideGroupConfig' DataObject!");
        }
        FGuideGroupConfig local_36;
        return local_36.GetActiveConds();
    }
    return GetActiveConds();
}
UFUNCTION()
TArray<FClientConditionGroup> __FGuideGroupConfig_GetClientConditions(const TDataObjectPtr<FGuideGroupConfig> &inout DataObject)
{
    TArray<FClientConditionGroup> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ClientConditions' from a null 'FGuideGroupConfig' DataObject!");
        }
        FGuideGroupConfig local_36;
        return local_36.ClientConditions;
    }
    return __r;
}
UFUNCTION()
EGuideManualType __FGuideGroupConfig_GetIsInManual(const TDataObjectPtr<FGuideGroupConfig> &inout DataObject)
{
    int local_37 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IsInManual' from a null 'FGuideGroupConfig' DataObject!");
        }
        FGuideGroupConfig local_36;
        local_37 = int(local_36.IsInManual);
        return EGuideManualType(local_37);
    }
    return EGuideManualType(local_37);
}
UFUNCTION()
FText __FGuideGroupConfig_GetName(const TDataObjectPtr<FGuideGroupConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Name' from a null 'FGuideGroupConfig' DataObject!");
        }
        FGuideGroupConfig local_36;
        return local_36.Name;
    }
    return __r;
}
UFUNCTION()
EGuideManualTab __FGuideGroupConfig_GetManualTab(const TDataObjectPtr<FGuideGroupConfig> &inout DataObject)
{
    int local_37 = 0;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ManualTab' from a null 'FGuideGroupConfig' DataObject!");
        }
        FGuideGroupConfig local_36;
        local_37 = int(local_36.ManualTab);
        return EGuideManualTab(local_37);
    }
    return EGuideManualTab(local_37);
}
UFUNCTION()
int __FGuideGroupConfig_GetSortOrder(const TDataObjectPtr<FGuideGroupConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SortOrder' from a null 'FGuideGroupConfig' DataObject!");
        }
        FGuideGroupConfig defaultValue;
        return defaultValue.SortOrder;
    }
    return DataObject.Get().SortOrder;
}
UFUNCTION()
TArray<TDataObjectPtr<FGuidePageConfig>> __FGuideGroupConfig_GetGuidePageList(const TDataObjectPtr<FGuideGroupConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'GuidePageList' from a null 'FGuideGroupConfig' DataObject!");
        }
        FGuideGroupConfig local_36;
        return local_36.GetGuidePageList();
    }
    return GetGuidePageList();
}
UFUNCTION()
FGuideGroupConfig CastToFGuideGroupConfig(const TDataObjectPtr<FGuideGroupConfig> &inout DataObject)
{
    FGuideGroupConfig __r;
    return __r;
}
}
namespace __FTutorialInfoConfigFunctions
{
UFUNCTION()
TArray<FTutorialStepInfo> __FTutorialInfoConfig_GetSteps(const TDataObjectPtr<FTutorialInfoConfig> &inout DataObject)
{
    TArray<FTutorialStepInfo> __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Steps' from a null 'FTutorialInfoConfig' DataObject!");
        }
        FTutorialInfoConfig local_22;
        return local_22.Steps;
    }
    return __r;
}
UFUNCTION()
FText __FTutorialInfoConfig_GetExtraDescKey(const TDataObjectPtr<FTutorialInfoConfig> &inout DataObject)
{
    FText __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExtraDescKey' from a null 'FTutorialInfoConfig' DataObject!");
        }
        FTutorialInfoConfig local_22;
        return local_22.ExtraDescKey;
    }
    return __r;
}
UFUNCTION()
FTutorialInfoConfig CastToFTutorialInfoConfig(const TDataObjectPtr<FTutorialInfoConfig> &inout DataObject)
{
    FTutorialInfoConfig __r;
    return __r;
}
}
