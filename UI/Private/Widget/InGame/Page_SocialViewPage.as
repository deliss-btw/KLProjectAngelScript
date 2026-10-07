
namespace UPage_SocialViewPage
{
    const int ViewID = 0;

}
class UPage_SocialViewPage : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Page> Page;
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_SocialViewPage> SocialViewPage;
    UPROPERTY()
    UEUIButton CopyUidBtn;
    UPROPERTY()
    UEUIFormatTextBlock w_txt_uid;
    UPROPERTY()
    FGetEUIModelRef PageDelegate;

    UPage_SocialViewPage()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        this.CopyUidBtn.OnClicked.AddUFunction(this, n"CopyUid");
        return;
    }
    UFUNCTION()
    void CopyUid()
    {
        FPlatformApplicationMisc::ClipboardCopy(this.w_txt_uid.GetText().ToString());
        FCommonTipsParam local_12;
        ::CommonPopup::Tips(NSLOCTEXT("SocialViewPage", "CopyTargetUID", "е·Іе¤Ќе€¶зЋ©е®¶UIDе€°е‰Єиґґжќї"), local_12);
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
    void SocialViewPage_ShowMore() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void SocialViewPage_ShowLess() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void SocialViewPage_CopyUid() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Page.Initialize(this, FName("VM_Page"), EEUIWidgetRefModelCreationType(0), false);
        this.SocialViewPage.Initialize(this, FName("VMS_SocialViewPage"), EEUIWidgetRefModelCreationType(0), false);
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

namespace UPage_SocialViewPage
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
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
