
namespace UPage_StoryDialog
{
    const int ViewID = 0;

}
class UPage_StoryDialog : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Page> Page;
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_StoryDialog> StoryDialog;
    UPROPERTY()
    FGetEUIModelRef PageDelegate;

    UPage_StoryDialog()
    {
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
    FText StoryDialog_CurrentSpeaker() const
    {
        FVMS_StoryDialog& local_2;
        FText local_12 = local_2 ? local_2.GetCurrentSpeaker() : FText();
        return local_12;
    }
    UFUNCTION()
    FText StoryDialog_CurrentContent() const
    {
        FVMS_StoryDialog& local_2;
        FText local_12 = local_2 ? local_2.GetCurrentContent() : FText();
        return local_12;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> StoryDialog_CurrentOptions() const
    {
        FVMS_StoryDialog& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetCurrentOptions());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    bool StoryDialog_HasNextSection() const
    {
        FVMS_StoryDialog& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.HasNextSection();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    void StoryDialog_NextSection() const
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
        this.StoryDialog.Initialize(this, FName("VMS_StoryDialog"), EEUIWidgetRefModelCreationType(0), false);
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

namespace UPage_StoryDialog
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
