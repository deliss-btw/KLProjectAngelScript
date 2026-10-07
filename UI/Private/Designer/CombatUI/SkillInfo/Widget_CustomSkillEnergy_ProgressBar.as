
namespace UWidget_CustomSkillEnergy_ProgressBar
{
    const int ViewID = 0;

}
class UWidget_CustomSkillEnergy_ProgressBar : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_SkillInfo_Avatar_Common> SkillInfo;
    UPROPERTY()
    UEUIHorizontalBox HorizontalBox_CustomSkillEnergy;
    UPROPERTY()
    TSubclassOf<UWidget_CustomSkillEnergy_ProgressBar_Item> UI_CustomSkillEnergy_ProgressBar_Item_BPClass;
    UPROPERTY()
    int EnergyNum = 3;
    UPROPERTY()
    FVector2D IconSize = FVector2D(60.0, 60.0);
    UPROPERTY()
    float32 EnergyItemPadding = 5.0f;
    UPROPERTY()
    UTexture2D Icon;
    UPROPERTY()
    UTexture2D IconHint;
    UPROPERTY()
    FLinearColor ProgressFullColor = FLinearColor(0.46f, 0.0f, 0.6f, 1.0f);
    UPROPERTY()
    FLinearColor ProgressNoFullColor = FLinearColor(0.69f, 0.24f, 1.0f, 1.0f);
    FEUIModelWeakRef __SkillInfo;


    UFUNCTION()
    void Construct_Implementation()
    {
        UCanvasPanelSlot local_4;
        UPanelSlot local_6;
        UCanvasPanelSlot local_8;
        UWidget_CustomSkillEnergy_ProgressBar_Item local_28;
        int local_178 = 0;
        int local_180 = 0;
        UPanelSlot local_188;
        UPanelSlot local_190;
        if (UICommonUtil::CVar_UI_DebugEnableNewSkillBtns.GetBool())
        {
            local_6 = this.HorizontalBox_CustomSkillEnergy.Slot;
            local_4 = Cast<UCanvasPanelSlot>(local_6);
            if (local_4 != nullptr)
            {
                local_4.SetPosition(FVector2D(-70.0, 0.0));
            }
        }
        APlayerController local_18 = this.GetOwningPlayer();
        if ((!(!((this.UI_CustomSkillEnergy_ProgressBar_Item_BPClass == nullptr)))))
        {
            return;
        }
        int local_23 = 0;
        for (; local_23 < this.EnergyNum; ++local_23)
        {
            local_28 = Cast<UWidget_CustomSkillEnergy_ProgressBar_Item>(WidgetBlueprint::CreateWidget(__GetWorldContext(), this.UI_CustomSkillEnergy_ProgressBar_Item_BPClass, local_18));
            if ((!((local_28 != nullptr))))
            {
                continue;
            }
            local_28.AddToViewport(0);
            FProgressBarStyle local_176 = local_28.ProgressBar_EnergyItem.GetWidgetStyle();
            local_178.ResourceObject = this.Icon;
            FProgressBarStyle local_176_2 = local_28.ProgressBar_EnergyItem.GetWidgetStyle();
            local_180.ResourceObject = this.Icon;
            local_28.ProgressFullColor = this.ProgressFullColor;
            local_28.ProgressNoFullColor = this.ProgressNoFullColor;
            local_28.Image_EnergyHint.SetBrushFromTexture(this.IconHint, false);
            local_28.Image_EnergyHint.SetBrushTintColor(FSlateColor(this.ProgressNoFullColor));
            local_188 = local_28.ProgressBar_EnergyItem.Slot;
            local_8 = Cast<UCanvasPanelSlot>(local_188);
            local_8.SetSize(this.IconSize);
            local_190 = local_28.Image_EnergyHint.Slot;
            local_8 = Cast<UCanvasPanelSlot>(local_190);
            local_8.SetSize(this.IconSize);
            UHorizontalBoxSlot local_194 = this.HorizontalBox_CustomSkillEnergy.AddChildToHorizontalBox(local_28);
            local_194.SetPadding(FMargin(this.EnergyItemPadding, 0.0f));
        }
        return;
    }
    UFUNCTION()
    void OnCustomSkillEnergyRatioChanged(const float32 CustomSkillEnergyRatio)
    {
        UWidget_CustomSkillEnergy_ProgressBar_Item local_14;
        int local_1 = 0;
        for (; local_1 < this.EnergyNum; )
        {
            float32 local_6 = (CustomSkillEnergyRatio * this.EnergyNum) - local_1;
            local_14 = Cast<UWidget_CustomSkillEnergy_ProgressBar_Item>(this.HorizontalBox_CustomSkillEnergy.GetChildAt(local_1));
            local_14.SetProgressRatio(local_6);
            ++local_1;
        }
        return;
    }
    UFUNCTION()
    FEUIModelRef SkillInfo_VM_SpecialAttackButton() const
    {
        FVMS_SkillInfo_Avatar_Common& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_SpecialAttackButton() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    FEUIModelRef SkillInfo_VM_SimpleSkillButton() const
    {
        FVMS_SkillInfo_Avatar_Common& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_SimpleSkillButton() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    FEUIModelRef SkillInfo_VM_UltraSkillButton() const
    {
        FVMS_SkillInfo_Avatar_Common& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_UltraSkillButton() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    float32 SkillInfo_CustomSkillEnergyRatio() const
    {
        FVMS_SkillInfo_Avatar_Common& local_2;
        return local_2 ? local_2.GetCustomSkillEnergyRatio() : 0.0f;
    }
    UFUNCTION()
    bool SkillInfo_UltraOn() const
    {
        FVMS_SkillInfo_Avatar_Common& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetUltraOn();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVMS_SkillInfo_Avatar_Common& local_6;
        TEUIModelRef<FVMS_SkillInfo_Avatar_Common> local_2 = this.SkillInfo.AsRef();
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
                    this.SkillInfo.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVMS_SkillInfo_Avatar_Common::__IndexOf_CustomSkillEnergyRatio());
                    }
                    if (local_6)
                    {
                        this.OnCustomSkillEnergyRatioChanged(local_6.GetCustomSkillEnergyRatio());
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
                XError(ELog(17), "Remaining observed model change: OnCustomSkillEnergyRatioChanged");
            }
            return;
        }
        this.__SkillInfo = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SkillInfo.Initialize(this, FName("VMS_SkillInfo_Avatar_Common"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_CustomSkillEnergy_ProgressBar
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnCustomSkillEnergyRatioChanged"));
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
