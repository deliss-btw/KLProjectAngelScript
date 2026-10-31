namespace __FMessageHintConfigFunctions
{
UFUNCTION()
FGameplayTag __FMessageHintConfig_GetHintType(const TDataObjectPtr<FMessageHintConfig> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'HintType' from a null 'FMessageHintConfig' DataObject!");
        }
        FMessageHintConfig local_18;
        return local_18.HintType;
    }
    return DataObject.Get().HintType;
}
UFUNCTION()
int __FMessageHintConfig_GetPriority(const TDataObjectPtr<FMessageHintConfig> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Priority' from a null 'FMessageHintConfig' DataObject!");
        }
        FMessageHintConfig defaultValue;
        return defaultValue.Priority;
    }
    return DataObject.Get().Priority;
}
UFUNCTION()
FMessageHintConfig CastToFMessageHintConfig(const TDataObjectPtr<FMessageHintConfig> &inout DataObject)
{
    FMessageHintConfig __r;
    return __r;
}
}
namespace __FMessageHintConfig_SimpleTipsFunctions
{
UFUNCTION()
FArgText __FMessageHintConfig_SimpleTips_GetContent(const TDataObjectPtr<FMessageHintConfig_SimpleTips> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Content' from a null 'FMessageHintConfig_SimpleTips' DataObject!");
        }
        FMessageHintConfig_SimpleTips local_30;
        return local_30.Content;
    }
    return DataObject.Get().Content;
}
UFUNCTION()
FCommonTipsParam __FMessageHintConfig_SimpleTips_GetExtraParam(const TDataObjectPtr<FMessageHintConfig_SimpleTips> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExtraParam' from a null 'FMessageHintConfig_SimpleTips' DataObject!");
        }
        FMessageHintConfig_SimpleTips local_30;
        return local_30.ExtraParam;
    }
    return DataObject.Get().ExtraParam;
}
UFUNCTION()
FMessageHintConfig_SimpleTips CastToFMessageHintConfig_SimpleTips(const TDataObjectPtr<FMessageHintConfig_SimpleTips> &inout DataObject)
{
    FMessageHintConfig_SimpleTips __r;
    return __r;
}
}
namespace __FMessageHintConfig_DialogFunctions
{
UFUNCTION()
FText __FMessageHintConfig_Dialog_GetTitle(const TDataObjectPtr<FMessageHintConfig_Dialog> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Title' from a null 'FMessageHintConfig_Dialog' DataObject!");
        }
        FMessageHintConfig_Dialog local_34;
        return local_34.Title;
    }
    return DataObject.Get().Title;
}
UFUNCTION()
FArgText __FMessageHintConfig_Dialog_GetContent(const TDataObjectPtr<FMessageHintConfig_Dialog> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Content' from a null 'FMessageHintConfig_Dialog' DataObject!");
        }
        FMessageHintConfig_Dialog local_34;
        return local_34.Content;
    }
    return DataObject.Get().Content;
}
UFUNCTION()
FText __FMessageHintConfig_Dialog_GetButtonText(const TDataObjectPtr<FMessageHintConfig_Dialog> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ButtonText' from a null 'FMessageHintConfig_Dialog' DataObject!");
        }
        FMessageHintConfig_Dialog local_34;
        return local_34.ButtonText;
    }
    return DataObject.Get().ButtonText;
}
UFUNCTION()
FMessageHintConfig_Dialog CastToFMessageHintConfig_Dialog(const TDataObjectPtr<FMessageHintConfig_Dialog> &inout DataObject)
{
    FMessageHintConfig_Dialog __r;
    return __r;
}
}
namespace __FMessageHintConfig_LargeHintFunctions
{
UFUNCTION()
FMessageHintIcon __FMessageHintConfig_LargeHint_GetIcon(const TDataObjectPtr<FMessageHintConfig_LargeHint> &inout DataObject)
{
    FMessageHintIcon __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Icon' from a null 'FMessageHintConfig_LargeHint' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
FArgText __FMessageHintConfig_LargeHint_GetTitle(const TDataObjectPtr<FMessageHintConfig_LargeHint> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Title' from a null 'FMessageHintConfig_LargeHint' DataObject!");
        }
        FMessageHintConfig_LargeHint local_92;
        return local_92.Title;
    }
    return DataObject.Get().Title;
}
UFUNCTION()
FArgText __FMessageHintConfig_LargeHint_GetContent(const TDataObjectPtr<FMessageHintConfig_LargeHint> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Content' from a null 'FMessageHintConfig_LargeHint' DataObject!");
        }
        FMessageHintConfig_LargeHint local_92;
        return local_92.Content;
    }
    return DataObject.Get().Content;
}
UFUNCTION()
FCommonHintParam __FMessageHintConfig_LargeHint_GetExtraParam(const TDataObjectPtr<FMessageHintConfig_LargeHint> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExtraParam' from a null 'FMessageHintConfig_LargeHint' DataObject!");
        }
        FMessageHintConfig_LargeHint local_92;
        return local_92.ExtraParam;
    }
    return DataObject.Get().ExtraParam;
}
UFUNCTION()
FMessageHintConfig_LargeHint CastToFMessageHintConfig_LargeHint(const TDataObjectPtr<FMessageHintConfig_LargeHint> &inout DataObject)
{
    FMessageHintConfig_LargeHint __r;
    return __r;
}
}
namespace __FMessageHintConfig_SmallHintFunctions
{
UFUNCTION()
FMessageHintIcon __FMessageHintConfig_SmallHint_GetIcon(const TDataObjectPtr<FMessageHintConfig_SmallHint> &inout DataObject)
{
    FMessageHintIcon __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Icon' from a null 'FMessageHintConfig_SmallHint' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
FArgText __FMessageHintConfig_SmallHint_GetContent(const TDataObjectPtr<FMessageHintConfig_SmallHint> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Content' from a null 'FMessageHintConfig_SmallHint' DataObject!");
        }
        FMessageHintConfig_SmallHint local_84;
        return local_84.Content;
    }
    return DataObject.Get().Content;
}
UFUNCTION()
FCommonHintParam __FMessageHintConfig_SmallHint_GetExtraParam(const TDataObjectPtr<FMessageHintConfig_SmallHint> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExtraParam' from a null 'FMessageHintConfig_SmallHint' DataObject!");
        }
        FMessageHintConfig_SmallHint local_84;
        return local_84.ExtraParam;
    }
    return DataObject.Get().ExtraParam;
}
UFUNCTION()
FMessageHintConfig_SmallHint CastToFMessageHintConfig_SmallHint(const TDataObjectPtr<FMessageHintConfig_SmallHint> &inout DataObject)
{
    FMessageHintConfig_SmallHint __r;
    return __r;
}
}
namespace __FMessageHintConfig_BannerFunctions
{
UFUNCTION()
FArgText __FMessageHintConfig_Banner_GetTitle(const TDataObjectPtr<FMessageHintConfig_Banner> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Title' from a null 'FMessageHintConfig_Banner' DataObject!");
        }
        FMessageHintConfig_Banner local_96;
        return local_96.Title;
    }
    return DataObject.Get().Title;
}
UFUNCTION()
FArgText __FMessageHintConfig_Banner_GetContent(const TDataObjectPtr<FMessageHintConfig_Banner> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Content' from a null 'FMessageHintConfig_Banner' DataObject!");
        }
        FMessageHintConfig_Banner local_96;
        return local_96.Content;
    }
    return DataObject.Get().Content;
}
UFUNCTION()
EBannerBGType __FMessageHintConfig_Banner_GetBGType(const TDataObjectPtr<FMessageHintConfig_Banner> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'BGType' from a null 'FMessageHintConfig_Banner' DataObject!");
        }
        FMessageHintConfig_Banner local_96;
        return local_96.BGType;
    }
    return DataObject.Get().BGType;
}
UFUNCTION()
FMessageHintIcon __FMessageHintConfig_Banner_GetIcon(const TDataObjectPtr<FMessageHintConfig_Banner> &inout DataObject)
{
    FMessageHintIcon __r;
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Icon' from a null 'FMessageHintConfig_Banner' DataObject!");
        }
    }
    else
    {
    }
    return __r;
}
UFUNCTION()
EBannerWidgetType __FMessageHintConfig_Banner_GetSpecialWidgetType(const TDataObjectPtr<FMessageHintConfig_Banner> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SpecialWidgetType' from a null 'FMessageHintConfig_Banner' DataObject!");
        }
        FMessageHintConfig_Banner local_96;
        return local_96.SpecialWidgetType;
    }
    return DataObject.Get().SpecialWidgetType;
}
UFUNCTION()
FCommonHintParam __FMessageHintConfig_Banner_GetExtraParam(const TDataObjectPtr<FMessageHintConfig_Banner> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExtraParam' from a null 'FMessageHintConfig_Banner' DataObject!");
        }
        FMessageHintConfig_Banner local_96;
        return local_96.ExtraParam;
    }
    return DataObject.Get().ExtraParam;
}
UFUNCTION()
FMessageHintConfig_Banner CastToFMessageHintConfig_Banner(const TDataObjectPtr<FMessageHintConfig_Banner> &inout DataObject)
{
    FMessageHintConfig_Banner __r;
    return __r;
}
}
namespace __FMessageHintConfig_Banner_MissionChapterFunctions
{
UFUNCTION()
FArgText __FMessageHintConfig_Banner_MissionChapter_GetTitle(const TDataObjectPtr<FMessageHintConfig_Banner_MissionChapter> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Title' from a null 'FMessageHintConfig_Banner_MissionChapter' DataObject!");
        }
        FMessageHintConfig_Banner_MissionChapter local_38;
        return local_38.Title;
    }
    return DataObject.Get().Title;
}
UFUNCTION()
FArgText __FMessageHintConfig_Banner_MissionChapter_GetSubTitle(const TDataObjectPtr<FMessageHintConfig_Banner_MissionChapter> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'SubTitle' from a null 'FMessageHintConfig_Banner_MissionChapter' DataObject!");
        }
        FMessageHintConfig_Banner_MissionChapter local_38;
        return local_38.SubTitle;
    }
    return DataObject.Get().SubTitle;
}
UFUNCTION()
bool __FMessageHintConfig_Banner_MissionChapter_GetbEnd(const TDataObjectPtr<FMessageHintConfig_Banner_MissionChapter> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'bEnd' from a null 'FMessageHintConfig_Banner_MissionChapter' DataObject!");
        }
        FMessageHintConfig_Banner_MissionChapter local_38;
        return local_38.bEnd;
    }
    return DataObject.Get().bEnd;
}
UFUNCTION()
FCommonHintParam __FMessageHintConfig_Banner_MissionChapter_GetExtraParam(const TDataObjectPtr<FMessageHintConfig_Banner_MissionChapter> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExtraParam' from a null 'FMessageHintConfig_Banner_MissionChapter' DataObject!");
        }
        FMessageHintConfig_Banner_MissionChapter local_38;
        return local_38.ExtraParam;
    }
    return DataObject.Get().ExtraParam;
}
UFUNCTION()
FMessageHintConfig_Banner_MissionChapter CastToFMessageHintConfig_Banner_MissionChapter(const TDataObjectPtr<FMessageHintConfig_Banner_MissionChapter> &inout DataObject)
{
    FMessageHintConfig_Banner_MissionChapter __r;
    return __r;
}
}
namespace __FMessageHintConfig_NewsTickerFunctions
{
UFUNCTION()
FArgText __FMessageHintConfig_NewsTicker_GetContent(const TDataObjectPtr<FMessageHintConfig_NewsTicker> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Content' from a null 'FMessageHintConfig_NewsTicker' DataObject!");
        }
        FMessageHintConfig_NewsTicker local_30;
        return local_30.Content;
    }
    return DataObject.Get().Content;
}
UFUNCTION()
int __FMessageHintConfig_NewsTicker_GetRepeatCount(const TDataObjectPtr<FMessageHintConfig_NewsTicker> &inout DataObject)
{

    if (DataObject == nullptr)
    {
        if (!EUIGlobals::GIsDuringPropertyConversion)
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'RepeatCount' from a null 'FMessageHintConfig_NewsTicker' DataObject!");
        }
        FMessageHintConfig_NewsTicker defaultValue;
        return defaultValue.RepeatCount;
    }
    return DataObject.Get().RepeatCount;
}
UFUNCTION()
FCommonHintParam __FMessageHintConfig_NewsTicker_GetExtraParam(const TDataObjectPtr<FMessageHintConfig_NewsTicker> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'ExtraParam' from a null 'FMessageHintConfig_NewsTicker' DataObject!");
        }
        FMessageHintConfig_NewsTicker local_30;
        return local_30.ExtraParam;
    }
    return DataObject.Get().ExtraParam;
}
UFUNCTION()
FMessageHintConfig_NewsTicker CastToFMessageHintConfig_NewsTicker(const TDataObjectPtr<FMessageHintConfig_NewsTicker> &inout DataObject)
{
    FMessageHintConfig_NewsTicker __r;
    return __r;
}
}
namespace __FMessageHintConfig_WeakTipsFunctions
{
UFUNCTION()
FMessageHintConfig_WeakTips CastToFMessageHintConfig_WeakTips(const TDataObjectPtr<FMessageHintConfig_WeakTips> &inout DataObject)
{
    FMessageHintConfig_WeakTips __r;
    return __r;
}
}
namespace __FMessageHintConfig_ImportantTipsFunctions
{
UFUNCTION()
EImportantTipsStyle __FMessageHintConfig_ImportantTips_GetStyle(const TDataObjectPtr<FMessageHintConfig_ImportantTips> &inout DataObject)
{
    if ((DataObject == nullptr))
    {
        if (!(EUIGlobals::GIsDuringPropertyConversion))
        {
            FBlueprintDebugFunctions::ThrowScriptException("Get 'Style' from a null 'FMessageHintConfig_ImportantTips' DataObject!");
        }
        FMessageHintConfig_ImportantTips local_32;
        return local_32.Style;
    }
    return DataObject.Get().Style;
}
UFUNCTION()
FMessageHintConfig_ImportantTips CastToFMessageHintConfig_ImportantTips(const TDataObjectPtr<FMessageHintConfig_ImportantTips> &inout DataObject)
{
    FMessageHintConfig_ImportantTips __r;
    return __r;
}
}
