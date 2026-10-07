

class UItemActionTrigger_ClosePage : UItemActionTriggerBase
{
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> PageWidget;

    UItemActionTrigger_ClosePage()
    {
        super();
        return;
    }
    void Execute(const FItemActionSource &inout ActionSource) const
    {
        if (!(ECS::GetRuntimeInfo().IsClient))
        {
            return;
        }
        APlayerController local_6 = ::FASCommonUtils::GetLocalPlayerController();
        if ((!((local_6 != nullptr))))
        {
            XWarning(ELog(47), "Failed to close page, can not find LocalPlayerController.");
        }
        FEUIWidget::RemoveWidgetByClass(local_6.GetLocalPlayer(), this.PageWidget);
        return;
    }
}

