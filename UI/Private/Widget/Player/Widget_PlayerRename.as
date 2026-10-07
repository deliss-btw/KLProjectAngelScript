
namespace UWidget_PlayerRename
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_PlayerRename : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_PlayerRename> PlayerRename;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_PlayerInfo> PlayerInfo;
    UPROPERTY()
    UEditableTextBox w_editText_rename;
    bool bWasTipsPresent = false;
    FEUIModelWeakRef __PlayerRename;
    UPROPERTY()
    FGetEUIModelRef PlayerRenameDelegate;
    UPROPERTY()
    FGetEUIModelRef PlayerInfoDelegate;


    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.PlayerInfo.SetRef(TEUIModelRef<FVM_PlayerInfo>(::FVM_PlayerInfo::Create(this, ::FMS_PlayerData::Get(this).GetLocalPlayerData())));
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        if (this.w_editText_rename == nullptr)
        {
            return;
        }
        bool local_3 = this.IsCommonTipsPresent();
        if ((this.bWasTipsPresent && !(local_3)))
        {
            this.RestoreEditFocusAfterTipsClosed();
        }
        this.bWasTipsPresent = local_3;
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
    bool IsCommonTipsPresent() const
    {
        FEUIWidgetRef local_4 = FEUIWidget::FindWidget(this.GetOwningLocalPlayer(), GameplayTags::UI_Type_Msg_CommonTips);
        if (local_4)
        {
            return local_4.IsValid();
        }
        return false;
    }
    void RestoreEditFocusAfterTipsClosed()
    {
        if (this.w_editText_rename == nullptr)
        {
            return;
        }
        if (!(this.w_editText_rename.HasKeyboardFocus()) && !(this.w_editText_rename.HasFocusedDescendants()))
        {
            return;
        }
        this.w_editText_rename.SetFocus();
        return;
    }
    UFUNCTION()
    void PlayerRename_SetName(const FString &inout InName) const
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
    void PlayerRename_ConfirmRename() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void PlayerRename_CancelRename() const
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
        FVM_PlayerRename& local_6;
        TEUIModelRef<FVM_PlayerRename> local_2 = this.PlayerRename.AsRef();
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
                    this.PlayerRename.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_PlayerRename::__IndexOf_bShouldClose());
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
        this.__PlayerRename = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.PlayerRename.Initialize(this, FName("VM_PlayerRename"), EEUIWidgetRefModelCreationType(0), false);
        this.PlayerInfo.Initialize(this, FName("VM_PlayerInfo"), EEUIWidgetRefModelCreationType(0), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PlayerRenameDelegate.IsBound())
        {
            this.PlayerRename.SetRef(this.PlayerRenameDelegate.Execute());
        }
        if (this.PlayerInfoDelegate.IsBound())
        {
            this.PlayerInfo.SetRef(this.PlayerInfoDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_PlayerRename
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
