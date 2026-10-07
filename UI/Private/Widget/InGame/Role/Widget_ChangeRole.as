
namespace UWidget_ChangeRole
{
    const int ViewID = 0;

}
class UWidget_ChangeRole : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Page> Page;
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_ChangeRole> ChangeRole;
    UPROPERTY()
    UEUITileView RoleList;
    FEUIModelWeakRef __ChangeRole;
    UPROPERTY()
    FGetEUIModelRef PageDelegate;

    UWidget_ChangeRole()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.RoleList.SetSelectedIndex(GetCurrentSelectedRoleIndex());
        return;
    }
    UFUNCTION()
    void OnViewUnbind_Implementation()
    {
        ::FVMS_CurrentRole::Get(this).SetbChangeRoleClicked(false);
        return;
    }
    UFUNCTION()
    void OnCloseByVM(const bool bShouldClose)
    {
        if (bShouldClose)
        {
            this.ClosePage(false);
        }
        return;
    }
    UFUNCTION()
    void Page_ClosePage() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Page_CloseGroup() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> ChangeRole_AllRoles() const
    {
        FVMS_ChangeRole& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetAllRoles());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    FEUIModelRef ChangeRole_SelectedAvatar() const
    {
        FVMS_ChangeRole& local_2;
        FEUIModelRef local_8;
        if (local_2)
        {
            local_8 = local_2.GetSelectedAvatar();
        }
        else
        {
            local_8 = FEUIModelRef();
        }
        return local_8;
    }
    UFUNCTION()
    FEUIModelRef ChangeRole_AvatarEquipment() const
    {
        FVMS_ChangeRole& local_2;
        FEUIModelRef local_8;
        if (local_2)
        {
            local_8 = local_2.GetAvatarEquipment();
        }
        else
        {
            local_8 = FEUIModelRef();
        }
        return local_8;
    }
    UFUNCTION()
    FSlateBrush ChangeRole_SelectAvatarBrush() const
    {
        FVMS_ChangeRole& local_2;
        FSlateBrush local_92 = local_2 ? local_2.GetSelectAvatarBrush() : FSlateBrush();
        return local_92;
    }
    UFUNCTION()
    FText ChangeRole_SelectAvatarClass() const
    {
        FVMS_ChangeRole& local_2;
        FText local_12 = local_2 ? local_2.GetSelectAvatarClass() : FText();
        return local_12;
    }
    UFUNCTION()
    FText ChangeRole_SelectAvatarIllustrate() const
    {
        FVMS_ChangeRole& local_2;
        FText local_12 = local_2 ? local_2.GetSelectAvatarIllustrate() : FText();
        return local_12;
    }
    UFUNCTION()
    FText ChangeRole_SelectAvatarAttack() const
    {
        FVMS_ChangeRole& local_2;
        FText local_12 = local_2 ? local_2.GetSelectAvatarAttack() : FText();
        return local_12;
    }
    UFUNCTION()
    FText ChangeRole_SelectAvatarPostureAttack() const
    {
        FVMS_ChangeRole& local_2;
        FText local_12 = local_2 ? local_2.GetSelectAvatarPostureAttack() : FText();
        return local_12;
    }
    UFUNCTION()
    FSlateBrush ChangeRole_OtherAvatarBrush() const
    {
        FVMS_ChangeRole& local_2;
        FSlateBrush local_92 = local_2 ? local_2.GetOtherAvatarBrush() : FSlateBrush();
        return local_92;
    }
    UFUNCTION()
    void ChangeRole_OnCancel() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void ChangeRole_OnConfirm() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void ChangeRole_GotoAvatarBuildPage() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVMS_ChangeRole& local_6;
        TEUIModelRef<FVMS_ChangeRole> local_2 = this.ChangeRole.AsRef();
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
                    this.ChangeRole.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVMS_ChangeRole::__IndexOf_bShouldClose());
                    }
                    if (local_6)
                    {
                        this.OnCloseByVM(local_6.GetbShouldClose());
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
                XError(ELog(17), "Remaining observed model change: OnCloseByVM");
            }
            return;
        }
        this.__ChangeRole = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Page.Initialize(this, FName("VM_Page"), EEUIWidgetRefModelCreationType(0), false);
        this.ChangeRole.Initialize(this, FName("VMS_ChangeRole"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PageDelegate.IsBound())
        {
            this.Page.SetRef(this.PageDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_ChangeRole
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnCloseByVM"));
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
