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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AssetType' from a null 'FGuidePageConfig' DataObject!");
        }
        FGuidePageConfig local_72;
        return local_72.AssetType;
    }
    return DataObject.Get().AssetType;
}
UFUNCTION()
FSoftBrush __FGuidePageConfig_GetAssetImage(const TDataObjectPtr<FGuidePageConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'AssetImage' from a null 'FGuidePageConfig' DataObject!");
        }
        FGuidePageConfig local_72;
        return local_72.AssetImage;
    }
    return DataObject.Get().AssetImage;
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Desc' from a null 'FGuidePageConfig' DataObject!");
        }
        FGuidePageConfig local_72;
        return local_72.Desc;
    }
    return DataObject.Get().Desc;
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
    return DataObject.Get().GetActiveConds();
}
UFUNCTION()
TArray<FClientConditionGroup> __FGuideGroupConfig_GetClientConditions(const TDataObjectPtr<FGuideGroupConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ClientConditions' from a null 'FGuideGroupConfig' DataObject!");
        }
        FGuideGroupConfig local_36;
        return local_36.ClientConditions;
    }
    return DataObject.Get().ClientConditions;
}
UFUNCTION()
EGuideManualType __FGuideGroupConfig_GetIsInManual(const TDataObjectPtr<FGuideGroupConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'IsInManual' from a null 'FGuideGroupConfig' DataObject!");
        }
        FGuideGroupConfig local_36;
        return local_36.IsInManual;
    }
    return DataObject.Get().IsInManual;
}
UFUNCTION()
FText __FGuideGroupConfig_GetName(const TDataObjectPtr<FGuideGroupConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Name' from a null 'FGuideGroupConfig' DataObject!");
        }
        FGuideGroupConfig local_36;
        return local_36.Name;
    }
    return DataObject.Get().Name;
}
UFUNCTION()
EGuideManualTab __FGuideGroupConfig_GetManualTab(const TDataObjectPtr<FGuideGroupConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ManualTab' from a null 'FGuideGroupConfig' DataObject!");
        }
        FGuideGroupConfig local_36;
        return local_36.ManualTab;
    }
    return DataObject.Get().ManualTab;
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
    return DataObject.Get().GetGuidePageList();
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
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Steps' from a null 'FTutorialInfoConfig' DataObject!");
        }
        FTutorialInfoConfig local_22;
        return local_22.Steps;
    }
    return DataObject.Get().Steps;
}
UFUNCTION()
FText __FTutorialInfoConfig_GetExtraDescKey(const TDataObjectPtr<FTutorialInfoConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExtraDescKey' from a null 'FTutorialInfoConfig' DataObject!");
        }
        FTutorialInfoConfig local_22;
        return local_22.ExtraDescKey;
    }
    return DataObject.Get().ExtraDescKey;
}
UFUNCTION()
FTutorialInfoConfig CastToFTutorialInfoConfig(const TDataObjectPtr<FTutorialInfoConfig> &inout DataObject)
{
    FTutorialInfoConfig __r;
    return __r;
}
}
