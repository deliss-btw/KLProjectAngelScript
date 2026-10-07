
namespace UWidget_GiveEcho
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_GiveEcho : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_GiveEcho> GiveEcho;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_PlayerInfo> PlayerInfo;
    FEUIModelWeakRef __GiveEcho;
    UPROPERTY()
    FGetEUIModelRef GiveEchoDelegate;
    UPROPERTY()
    FGetEUIModelRef PlayerInfoDelegate;

    UWidget_GiveEcho()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.PlayerInfo.SetRef(TEUIModelRef<FVM_PlayerInfo>(::FVM_PlayerInfo::Create(this, ::FMS_PlayerData::Get(this).GetLocalPlayerData())));
        return;
    }
    UFUNCTION()
    void OnShouldClose(const bool bShouldClose)
    {
        if (bShouldClose)
        {
            this.RemoveFromLayout();
        }
        return;
    }
    UFUNCTION()
    void GiveEcho_SetContent(const FString &inout InName) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(InName);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void GiveEcho_ConfirmContent() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void GiveEcho_CancelRename() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void PlayerInfo_CopyUidToClipboard() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_GiveEcho& local_6;
        TEUIModelRef<FVM_GiveEcho> local_2 = this.GiveEcho.AsRef();
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
                    this.GiveEcho.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_GiveEcho::__IndexOf_bShouldClose());
                    }
                    if (local_6)
                    {
                        this.OnShouldClose(local_6.GetbShouldClose());
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
                XError(ELog(17), "Remaining observed model change: OnShouldClose");
            }
            return;
        }
        this.__GiveEcho = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.GiveEcho.Initialize(this, FName("VM_GiveEcho"), EEUIWidgetRefModelCreationType(0), false);
        this.PlayerInfo.Initialize(this, FName("VM_PlayerInfo"), EEUIWidgetRefModelCreationType(0), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.GiveEchoDelegate.IsBound())
        {
            this.GiveEcho.SetRef(this.GiveEchoDelegate.Execute());
        }
        if (this.PlayerInfoDelegate.IsBound())
        {
            this.PlayerInfo.SetRef(this.PlayerInfoDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_GiveEcho
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnShouldClose"));
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
