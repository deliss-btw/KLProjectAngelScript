
namespace UWidget_MailDetail
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_MailDetail : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MailDetail> MailDetail;
    UPROPERTY()
    UEUITextBlock w_txt_content;
    UPROPERTY()
    UEUICommonListView w_list_reward;
    UPROPERTY()
    FGetEUIModelRef MailDetailDelegate;

    UWidget_MailDetail()
    {
        return;
    }
    UEUITextBlock GetContentTextBlock() const
    {
        return this.w_txt_content;
    }
    UEUICommonListView GetRewardListView() const
    {
        return this.w_list_reward;
    }
    UFUNCTION()
    void MailDetail_ClaimAttachment() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void MailDetail_DeleteMail() const
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
        this.MailDetail.Initialize(this, FName("VM_MailDetail"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MailDetailDelegate.IsBound())
        {
            this.MailDetail.SetRef(this.MailDetailDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_MailDetail
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
