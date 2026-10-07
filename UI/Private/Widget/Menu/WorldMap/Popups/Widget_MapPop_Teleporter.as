
namespace UWidget_MapPop_Teleporter
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_MapPop_Teleporter : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Teleporter> Teleporter;
    UPROPERTY()
    FEUIActionBinding Teleport;
    FEUIModelWeakRef __Teleporter;
    UPROPERTY()
    FGetEUIModelRef TeleporterDelegate;

    UWidget_MapPop_Teleporter()
    {
        return;
    }
    UFUNCTION()
    void OnTeleporterStateChanged(const bool bIsActive)
    {
        if (bIsActive)
        {
            this.Teleport.Register(this);
            return;
        }
        this.Teleport.UnRegister();
        return;
    }
    UFUNCTION()
    void Teleporter_Teleport() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_Teleporter& local_6;
        TEUIModelRef<FVM_Teleporter> local_2 = this.Teleporter.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            int local_57 = It.GetIndex();
            if (local_57 <= 0)
            {
                if (local_57 != 0)
                {
                }
                else
                {
                    this.Teleporter.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_Teleporter::__IndexOf_bIsActive());
                    }
                    if (local_6)
                    {
                        this.OnTeleporterStateChanged(local_6.GetbIsActive());
                    }
                }
            }
            It.MarkCurrentClean();
            It.opPreInc();
        }
        if (It.ReachMax())
        {
            XError(ELog(17), "Observed model changes consume max.");
            if (It.IsDirty(0))
            {
                XError(ELog(17), "Remaining observed model change: OnTeleporterStateChanged");
            }
            return;
        }
        this.__Teleporter = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Teleporter.Initialize(this, FName("VM_Teleporter"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TeleporterDelegate.IsBound())
        {
            this.Teleporter.SetRef(this.TeleporterDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_MapPop_Teleporter
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnTeleporterStateChanged"));
    return;
}
FEUIWidgetRef CreateWidget(const APlayerController OwningPlayer, const TSoftClassPtr<UEUIUserWidget> &inout WidgetClass)
{
    return FEUIWidget::CreateWidget(OwningPlayer.GetLocalPlayer(), WidgetClass);
}
FEUIWidgetRef AddWidget(const APlayerController OwningPlayer, const FGameplayTag &inout WidgetTag)
{
    return FEUIWidget::AddWidget(OwningPlayer.GetLocalPlayer(), WidgetTag);
}
}
