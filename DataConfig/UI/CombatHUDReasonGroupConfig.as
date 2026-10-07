
enum EWidgetHideRuleType
{
    ShowWhenAnyActive,
    HideWhenAnyActive,
}


struct FCombatHUDReasonGroupConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    TArray<ECombatHUDReason> Reasons;
    UPROPERTY()
    EWidgetHideRuleType RuleType = EWidgetHideRuleType(1);
    UPROPERTY()
    TArray<FDataObjectPtr> m_HideConfigs;
    UPROPERTY()
    float32 DelaySec = 0.0f;


    const TArray<TDataObjectPtr<FWidgetHiddenConfig>> GetHideConfigs() const property
    {
        const TArray<TDataObjectPtr<FWidgetHiddenConfig>> __r;
        return __r;
    }
    void SetHideConfigs(const TArray<TDataObjectPtr<FWidgetHiddenConfig>> &inout __Value) property
    {
        _AsTDataObjectPtrView<TArray<FDataObjectPtr>, TArray<TDataObjectPtr<FWidgetHiddenConfig>>> local_2;
        this.m_HideConfigs = local_2;
        return;
    }
}

