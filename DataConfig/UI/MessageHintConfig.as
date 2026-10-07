
enum EImportantTipsStyle
{
    Red,
    Blue,
}


struct FMessageHintConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FGameplayTag HintType;
    UPROPERTY()
    int Priority;


}

struct FMessageHintConfig_SimpleTips : FMessageHintConfig
{
    FMessageHintConfig _base_FMessageHintConfig;
    UPROPERTY()
    FArgText Content;
    UPROPERTY()
    FCommonTipsParam ExtraParam;

    default HintType = GameplayTags::UI_Type_Commonpupop_SideHint_SimpleTips;

    FMessageHintConfig_SimpleTips()
    {
        super();
        this.__InitDefaults();
        return;
    }
}

struct FMessageHintConfig_Dialog : FMessageHintConfig
{
    FMessageHintConfig _base_FMessageHintConfig;
    UPROPERTY()
    FText Title;
    UPROPERTY()
    FArgText Content;
    UPROPERTY()
    FText ButtonText;

    default HintType = GameplayTags::UI_Type_Commonpupop_SideHint_Dialog;

    FMessageHintConfig_Dialog()
    {
        super();
        this.__InitDefaults();
        return;
    }
}

struct FMessageHintConfig_LargeHint : FMessageHintConfig
{
    FMessageHintConfig _base_FMessageHintConfig;
    UPROPERTY()
    FMessageHintIcon Icon;
    UPROPERTY()
    FArgText Title;
    UPROPERTY()
    FArgText Content;
    UPROPERTY()
    FCommonHintParam ExtraParam;

    default HintType = GameplayTags::UI_Type_Commonpupop_SideHint_LargeHint;

    FMessageHintConfig_LargeHint()
    {
        super();
        this.__InitDefaults();
        return;
    }
}

struct FMessageHintConfig_SmallHint : FMessageHintConfig
{
    FMessageHintConfig _base_FMessageHintConfig;
    UPROPERTY()
    FMessageHintIcon Icon;
    UPROPERTY()
    FArgText Content;
    UPROPERTY()
    FCommonHintParam ExtraParam;

    default HintType = GameplayTags::UI_Type_Commonpupop_SideHint_SmallHint;

    FMessageHintConfig_SmallHint()
    {
        super();
        this.__InitDefaults();
        return;
    }
}

struct FMessageHintConfig_Banner : FMessageHintConfig
{
    FMessageHintConfig _base_FMessageHintConfig;
    UPROPERTY()
    FArgText Title;
    UPROPERTY()
    FArgText Content;
    UPROPERTY()
    EBannerBGType BGType;
    UPROPERTY()
    FMessageHintIcon Icon;
    UPROPERTY()
    EBannerWidgetType SpecialWidgetType;
    UPROPERTY()
    FCommonHintParam ExtraParam;

    default HintType = GameplayTags::UI_Type_Commonpupop_Banner_Banner;

    FMessageHintConfig_Banner()
    {
        super();
        this.BGType = EBannerBGType(0);
        this.SpecialWidgetType = EBannerWidgetType(0);
        this.__InitDefaults();
        return;
    }
}

struct FMessageHintConfig_Banner_MissionChapter : FMessageHintConfig
{
    FMessageHintConfig _base_FMessageHintConfig;
    UPROPERTY()
    FArgText Title;
    UPROPERTY()
    FArgText SubTitle;
    UPROPERTY()
    bool bEnd;
    UPROPERTY()
    FCommonHintParam ExtraParam;

    default HintType = GameplayTags::UI_Type_Commonpupop_Banner_MissionChapter;

    FMessageHintConfig_Banner_MissionChapter()
    {
        super();
        this.bEnd = false;
        this.__InitDefaults();
        return;
    }
}

struct FMessageHintConfig_NewsTicker : FMessageHintConfig
{
    FMessageHintConfig _base_FMessageHintConfig;
    UPROPERTY()
    FArgText Content;
    UPROPERTY()
    int RepeatCount;
    UPROPERTY()
    FCommonHintParam ExtraParam;

    default HintType = GameplayTags::UI_Type_Commonpupop_NewsTicker;

    FMessageHintConfig_NewsTicker()
    {
        super();
        this.RepeatCount = 1;
        this.__InitDefaults();
        return;
    }
}

struct FMessageHintConfig_WeakTips : FMessageHintConfig_SimpleTips
{
    FMessageHintConfig_SimpleTips _base_FMessageHintConfig_SimpleTips;

    default HintType = GameplayTags::UI_Type_Commonpupop_SideHint_WeakTips;

    FMessageHintConfig_WeakTips()
    {
        super();
        this.__InitDefaults();
        return;
    }
}

struct FMessageHintConfig_ImportantTips : FMessageHintConfig_SimpleTips
{
    FMessageHintConfig_SimpleTips _base_FMessageHintConfig_SimpleTips;
    UPROPERTY()
    EImportantTipsStyle Style;

    default HintType = GameplayTags::UI_Type_Commonpupop_SideHint_ImportantTips;

    FMessageHintConfig_ImportantTips()
    {
        super();
        this.Style = EImportantTipsStyle(0);
        this.__InitDefaults();
        return;
    }
}

