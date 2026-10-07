
enum EEntityMinimapIconType
{
    Common,
    Player,
    Custom,
}


struct FMinimapIconSimplifiedDisplayRule : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    float32 DisplayMapScale;
    UPROPERTY()
    FSoftBrush DisplayIcon;
    UPROPERTY()
    EStretch ScaleType;
    UPROPERTY()
    EStretchDirection StretchDirection;
    UPROPERTY()
    UCurveFloat UserSpecifiedScaleByMapScale = nullptr;


}

struct FMinimapIconConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    EEntityMinimapIconType IconType;
    UPROPERTY()
    FVector2D IconSize = FVector2D(32.0, 32.0);
    UPROPERTY()
    FMinimapIconDisplaySettings DisplaySettings;
    UPROPERTY()
    int ZOrder;
    UPROPERTY()
    bool bEnableSimplifiedDisplay;
    UPROPERTY()
    FDataObjectPtr m_CustomSimplifiedDisplayRule;


    const TDataObjectPtr<FMinimapIconSimplifiedDisplayRule> GetCustomSimplifiedDisplayRule() const property
    {
        const TDataObjectPtr<FMinimapIconSimplifiedDisplayRule> __r;
        return __r;
    }
    void SetCustomSimplifiedDisplayRule(const TDataObjectPtr<FMinimapIconSimplifiedDisplayRule> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FMinimapIconSimplifiedDisplayRule>> local_2;
        this.m_CustomSimplifiedDisplayRule = local_2;
        return;
    }
}

struct FMinimapIconConfig_Common : FMinimapIconConfig
{
    FMinimapIconConfig _base_FMinimapIconConfig;
    UPROPERTY()
    FPresentationIcon Icon;
    UPROPERTY()
    bool bCanSetGuideTarget;
    UPROPERTY()
    bool bShowTooltip;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> CustomTooltipWidget;
    UPROPERTY()
    bool bNeverHittestable;

    default IconType = EEntityMinimapIconType(0);
    default bEnableSimplifiedDisplay = true;

    FMinimapIconConfig_Common()
    {
        super();
        this.bNeverHittestable = false;
        this.bCanSetGuideTarget = true;
        this.bShowTooltip = true;
        this.__InitDefaults();
        return;
    }
}

struct FMinimapIconConfig_Player : FMinimapIconConfig
{
    FMinimapIconConfig _base_FMinimapIconConfig;
    UPROPERTY()
    FLinearColor IconColor;

    default IconType = EEntityMinimapIconType(1);

    FMinimapIconConfig_Player()
    {
        super();
        this.__InitDefaults();
        return;
    }
}

struct FMinimapIconConfig_Custom : FMinimapIconConfig
{
    FMinimapIconConfig _base_FMinimapIconConfig;
    UPROPERTY()
    TSoftClassPtr<UUserWidget> IconWidget;

    default IconType = EEntityMinimapIconType(2);

    FMinimapIconConfig_Custom()
    {
        super();
        this.__InitDefaults();
        return;
    }
}

