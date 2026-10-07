

struct FMenuConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FText MenuName;
    UPROPERTY()
    FSoftBrush MenuIcon;
    UPROPERTY()
    FDataObjectPtr m_SystemControlConfig;
    UPROPERTY()
    FEUIWidgetTag MenuWidget;
    UPROPERTY()
    FRedDotNodeData EntranceRedDot;
    UPROPERTY()
    FEUIInputAction EntryAction;

    FMenuConfig()
    {
        return;
    }
    FEUIWidgetTag GetEntranceWidget() const property
    {
        if (this.GetSystemControlConfig())
        {
            return this.GetSystemControlConfig().opArrow().EntranceWidget;
        }
        return this.MenuWidget;
    }
    const TDataObjectPtr<FSystemControlConfig> GetSystemControlConfig() const property
    {
        const TDataObjectPtr<FSystemControlConfig> __r;
        return __r;
    }
    void SetSystemControlConfig(const TDataObjectPtr<FSystemControlConfig> &inout __Value) property
    {
        _AsTDataObjectPtrView<FDataObjectPtr, TDataObjectPtr<FSystemControlConfig>> local_2;
        this.m_SystemControlConfig = local_2;
        return;
    }
}

