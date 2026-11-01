namespace UWidget_Setting
{
    const int ViewID = 0;

}
class UWidget_Setting : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MenuPage> MenuPage;
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_Setting> Setting;
    UPROPERTY()
    URichTextBlock ShowTextContent;
    UPROPERTY()
    UEUIButton Exit;
    UPROPERTY()
    UEUIButton Button_Exit;
    UPROPERTY()
    FConfigVM_MenuPage MenuPageConfig;
    UPROPERTY()
    FGetEUIModelRef MenuPageDelegate;

    UWidget_Setting()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        this.Exit.OnClicked.AddUFunction(this, n"HidePanel");
        this.Button_Exit.OnClicked.AddUFunction(this, n"HidePanel");
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        if ((int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer()))) == 1)
        {
            this.Setting_ShowInfoContent(n"Controller");
            return;
        }
        this.Setting_ShowInfoContent(n"Keyboard");
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        this.ShowTextContent.SetText(this.Setting.Get().GetShowText());
        return;
    }
    UFUNCTION()
    void HidePanel()
    {
        this.SetVisibility(ESlateVisibility(2));
        return;
    }
    UFUNCTION()
    UTexture2D Setting_ShowImage() const
    {
        UTexture2D local_8;
        FVMS_Setting& local_2 = this.Setting.Get();
        if (local_2)
        {
            local_8 = local_2.GetShowImage();
        }
        else
        {
        }
        return local_8;
    }
    UFUNCTION()
    FText Setting_ShowText() const
    {
        FVMS_Setting& local_2 = this.Setting.Get();
        FText local_12 = local_2 ? local_2.GetShowText() : FText();
        return local_12;
    }
    UFUNCTION()
    void Setting_ShowInfoContent(const FName &inout HintName) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(HintName);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.MenuPage.Initialize(this, FName("VM_MenuPage"), EEUIWidgetRefModelCreationType(0), false);
        this.Setting.Initialize(this, FName("VMS_Setting"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MenuPageDelegate.IsBound())
        {
            this.MenuPage.SetRef(this.MenuPageDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_Setting
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.WidgetType = UWidget_Setting;
    Result.ObservedModelChangesSubscriberCount = 0;
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
