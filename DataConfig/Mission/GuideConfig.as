
enum EGuideRegionStyleType
{
    Normal,
    NoIcon,
}


struct FGuidePresentationConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FDataObjectPtr m_PresentationConfig;
    UPROPERTY()
    FDataObjectPtr m_PresentationRule;
    UPROPERTY()
    FLinearColor GuideColor;
    UPROPERTY()
    EGuideRegionStyleType RegionStyleType;


    FSoftBrush GetGuideIcon() const
    {
        if (this.GetPresentationConfig().IsSet())
        {
            FSoftBrush local_92;
            local_92.GetDefaultIcon();
            if (local_92.IsSet())
            {
                return local_92;
            }
        }
        return local_92;
    }
    TDataObjectPtr<FPresentationConfig> GetPresentationConfig() const property
    {
        TDataObjectPtr<FPresentationConfig> __r;
        return __r;
    }
    void SetPresentationConfig(const TDataObjectPtr<FPresentationConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FPresentationConfig>> local_2;
        this.m_PresentationConfig = local_2;
        return;
    }
    const TDataObjectPtr<FPresentationRuleConfig> GetPresentationRule() const property
    {
        const TDataObjectPtr<FPresentationRuleConfig> __r;
        return __r;
    }
    void SetPresentationRule(const TDataObjectPtr<FPresentationRuleConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FPresentationRuleConfig>> local_2;
        this.m_PresentationRule = local_2;
        return;
    }
}

