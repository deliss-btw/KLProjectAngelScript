

UCLASS(Abstract)
class UKLImGuiLocalPanelManagerBase : UImGuiLocalPanelManagerWidget
{
    default Title = "KL Debug Panel";

    UKLImGuiLocalPanelManagerBase()
    {
        return;
    }
    UFUNCTION()
    void DrawContent_Implementation()
    {
        return;
    }
}

