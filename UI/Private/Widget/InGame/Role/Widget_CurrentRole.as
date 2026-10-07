
namespace UWidget_CurrentRole
{
    const int ViewID = 0;

}
class UWidget_CurrentRole : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Page> Page;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MenuPage> MenuPage;
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_CurrentRole> CurrentRole;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_EditAvatarScope> EditAvatarScope;
    UPROPERTY()
    TSoftClassPtr<UWidget_ChangeRole> ChangeRoleWidgetClass;
    UPROPERTY()
    FConfigVM_MenuPage MenuPageConfig;
    FEUIModelWeakRef __CurrentRole;
    UPROPERTY()
    FGetEUIModelRef PageDelegate;
    UPROPERTY()
    FGetEUIModelRef MenuPageDelegate;
    UPROPERTY()
    FGetEUIModelRef EditAvatarScopeDelegate;

    UWidget_CurrentRole()
    {
        return;
    }
    UFUNCTION()
    void OnOpenChangeRole(const bool bChangeRoleClicked)
    {
        if (bChangeRoleClicked && !(this.ChangeRoleWidgetClass.IsNull()))
        {
            this.OpenPage(this.ChangeRoleWidgetClass);
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
    FText CurrentRole_MainAvatarName() const
    {
        FVMS_CurrentRole& local_2;
        FText local_16 = local_2 ? local_2.GetMainAvatarName() : FText();
        return local_16;
    }
    UFUNCTION()
    FSlateBrush CurrentRole_MainAvatarIcon() const
    {
        FVMS_CurrentRole& local_2;
        FSlateBrush local_136 = local_2 ? local_2.GetMainAvatarIcon() : FSlateBrush();
        return local_136;
    }
    UFUNCTION()
    FSlateBrush CurrentRole_MainPlayerPowerIcon() const
    {
        FVMS_CurrentRole& local_2;
        FSlateBrush local_136 = local_2 ? local_2.GetMainPlayerPowerIcon() : FSlateBrush();
        return local_136;
    }
    UFUNCTION()
    FSlateBrush CurrentRole_MainPlayerTachie() const
    {
        FVMS_CurrentRole& local_2;
        FSlateBrush local_136 = local_2 ? local_2.GetMainPlayerTachie() : FSlateBrush();
        return local_136;
    }
    UFUNCTION()
    FSlateBrush CurrentRole_MainPlayerTachieBack() const
    {
        FVMS_CurrentRole& local_2;
        FSlateBrush local_136 = local_2 ? local_2.GetMainPlayerTachieBack() : FSlateBrush();
        return local_136;
    }
    UFUNCTION()
    FSlateBrush CurrentRole_MainPlayerClassIcon() const
    {
        FVMS_CurrentRole& local_2;
        FSlateBrush local_136 = local_2 ? local_2.GetMainPlayerClassIcon() : FSlateBrush();
        return local_136;
    }
    UFUNCTION()
    FText CurrentRole_MainPlayerIllustrate1() const
    {
        FVMS_CurrentRole& local_2;
        FText local_16 = local_2 ? local_2.GetMainPlayerIllustrate1() : FText();
        return local_16;
    }
    UFUNCTION()
    FText CurrentRole_MainPlayerIllustrate2() const
    {
        FVMS_CurrentRole& local_2;
        FText local_16 = local_2 ? local_2.GetMainPlayerIllustrate2() : FText();
        return local_16;
    }
    UFUNCTION()
    FText CurrentRole_SubAvatarName() const
    {
        FVMS_CurrentRole& local_2;
        FText local_16 = local_2 ? local_2.GetSubAvatarName() : FText();
        return local_16;
    }
    UFUNCTION()
    FSlateBrush CurrentRole_SubAvatarIcon() const
    {
        FVMS_CurrentRole& local_2;
        FSlateBrush local_136 = local_2 ? local_2.GetSubAvatarIcon() : FSlateBrush();
        return local_136;
    }
    UFUNCTION()
    FSlateBrush CurrentRole_SubPlayerPowerIcon() const
    {
        FVMS_CurrentRole& local_2;
        FSlateBrush local_136 = local_2 ? local_2.GetSubPlayerPowerIcon() : FSlateBrush();
        return local_136;
    }
    UFUNCTION()
    FSlateBrush CurrentRole_SubPlayerTachie() const
    {
        FVMS_CurrentRole& local_2;
        FSlateBrush local_136 = local_2 ? local_2.GetSubPlayerTachie() : FSlateBrush();
        return local_136;
    }
    UFUNCTION()
    FSlateBrush CurrentRole_SubPlayerTachieBack() const
    {
        FVMS_CurrentRole& local_2;
        FSlateBrush local_136 = local_2 ? local_2.GetSubPlayerTachieBack() : FSlateBrush();
        return local_136;
    }
    UFUNCTION()
    FSlateBrush CurrentRole_SubPlayerClassIcon() const
    {
        FVMS_CurrentRole& local_2;
        FSlateBrush local_136 = local_2 ? local_2.GetSubPlayerClassIcon() : FSlateBrush();
        return local_136;
    }
    UFUNCTION()
    FText CurrentRole_SubPlayerIllustrate1() const
    {
        FVMS_CurrentRole& local_2;
        FText local_16 = local_2 ? local_2.GetSubPlayerIllustrate1() : FText();
        return local_16;
    }
    UFUNCTION()
    FText CurrentRole_SubPlayerIllustrate2() const
    {
        FVMS_CurrentRole& local_2;
        FText local_16 = local_2 ? local_2.GetSubPlayerIllustrate2() : FText();
        return local_16;
    }
    UFUNCTION()
    void CurrentRole_OnSelectMain() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CurrentRole_OnSelectSub() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CurrentRole_GotoAvatarBuildPage() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVMS_CurrentRole& local_6;
        TEUIModelRef<FVMS_CurrentRole> local_2 = this.CurrentRole.AsRef();
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
                    this.CurrentRole.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVMS_CurrentRole::__IndexOf_bChangeRoleClicked());
                    }
                    if (local_6)
                    {
                        this.OnOpenChangeRole(local_6.GetbChangeRoleClicked());
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
                XError(ELog(17), "Remaining observed model change: OnOpenChangeRole");
            }
            return;
        }
        this.__CurrentRole = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Page.Initialize(this, FName("VM_Page"), EEUIWidgetRefModelCreationType(0), false);
        this.MenuPage.Initialize(this, FName("VM_MenuPage"), EEUIWidgetRefModelCreationType(0), false);
        this.CurrentRole.Initialize(this, FName("VMS_CurrentRole"), EEUIWidgetRefModelCreationType(0), false);
        this.EditAvatarScope.Initialize(this, FName("VM_EditAvatarScope"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PageDelegate.IsBound())
        {
            this.Page.SetRef(this.PageDelegate.Execute());
        }
        if (this.MenuPageDelegate.IsBound())
        {
            this.MenuPage.SetRef(this.MenuPageDelegate.Execute());
        }
        if (this.EditAvatarScopeDelegate.IsBound())
        {
            this.EditAvatarScope.SetRef(this.EditAvatarScopeDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CurrentRole
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnOpenChangeRole"));
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
