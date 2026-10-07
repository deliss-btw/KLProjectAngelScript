
namespace UWidget_LoginGamma
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_LoginGamma : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_GammaSlider> GammaSliderVM;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonSlider> CommonSliderVM;
    UPROPERTY()
    FText RequireCloseTitle;
    UPROPERTY()
    TArray<FCommonDialogOption> RequireCloseOptions;
    UPROPERTY()
    float32 DeadZone = 0.1f;
    UPROPERTY()
    FEUIActionBinding Esc_AB;
    UPROPERTY()
    FEUIActionBinding Save_AB;
    UPROPERTY()
    FEUIActionBinding Close_AB;
    UPROPERTY()
    FConfigVM_GammaSlider GammaSliderVMConfig;
    FEUIModelWeakRef __CommonSliderVM;
    UPROPERTY()
    FGetEUIModelRef GammaSliderVMDelegate;
    UPROPERTY()
    FGetEUIModelRef CommonSliderVMDelegate;


    UFUNCTION()
    void OnViewBind_Implementation()
    {
        if (this.GammaSliderVM.IsValid())
        {
            this.DeadZone = GetDeadZone();
            if (GetbNotLoginPage())
            {
                this.Esc_AB.Register(this);
                this.Save_AB.Register(this);
                return;
            }
            this.Close_AB.Register(this);
        }
        return;
    }
    UFUNCTION()
    FEventReply OnAnalogValueChanged_Implementation(const FGeometry &inout MyGeometry, const FAnalogInputEvent &inout Event)
    {
        if ((int(this.GetCurrentInputType())) != 1)
        {
            return FEventReply::Unhandled();
        }
        FKey local_62 = Event.GetKey();
        float32 local_64 = Event.GetAnalogValue();
        if ((local_62 == EKeys::Gamepad_RightX))
        {
            if (!(local_64 >= this.DeadZone) && (local_64 > -this.DeadZone))
            {
                return FEventReply::Unhandled();
            }
            local_64.StepCurrentRatio();
            return FEventReply::Handled();
        }
        return FEventReply::Unhandled();
    }
    UFUNCTION()
    void OnCommonSliderRatioChanged(const float32 Ratio)
    {
        if (this.GammaSliderVM.IsValid())
        {
            Ratio.SetSliderValue();
        }
        return;
    }
    UFUNCTION()
    void OnSettingFinish()
    {
        if (this.GammaSliderVM.IsValid())
        {
            if (!(GetbNotLoginPage()))
            {
                SettingFinish();
                this.ClosePage(false);
                ULocalPlayer local_10 = this.GetOwningLocalPlayer();
                FEUIMessageBus::Publish(EUIMessageBus);
                FMsg_LoginNextPhase local_4;
                local_4.NextPhase = ELoginShowPhase(3);
                return;
            }
            this.RequireClose();
        }
        return;
    }
    UFUNCTION()
    void SaveSettingAndFinish()
    {
        if (this.GammaSliderVM.IsValid())
        {
            SettingFinish();
            this.ClosePage(false);
        }
        return;
    }
    UFUNCTION()
    void ResetToDefault()
    {
        if (this.CommonSliderVM.IsValid())
        {
            1056964608.SetCurrentRatio();
        }
        return;
    }
    UFUNCTION()
    void RequireClose()
    {
        if (HasChanged())
        {
            FDialogDynamicCallback local_6;
            local_6.BindUFunction(this, n"HandleRequireCloseAnswer");
            NSLOCTEXT("PlayerSettings", "RequireCloseTitle", "зЎ®и®¤йЂЂе‡є");
            return;
        }
        this.ClosePage(false);
        return;
    }
    UFUNCTION()
    bool HandleRequireCloseAnswer(const FCommonDialogAnswer &inout Answer) const
    {
        if (int(Answer.AnswerType) == 1)
        {
            SettingFinish();
            this.ClosePage(false);
        }
        else
        {
            if (int(Answer.AnswerType) == 2)
            {
                ResetGammaValue();
                SettingFinish();
                this.ClosePage(false);
            }
        }
        return true;
    }
    UFUNCTION()
    void OnIncrease()
    {
        if (this.CommonSliderVM.IsValid())
        {
            1065353216.StepCurrentRatio();
        }
        return;
    }
    UFUNCTION()
    void OnDecrease()
    {
        if (this.CommonSliderVM.IsValid())
        {
            -1082130432.StepCurrentRatio();
        }
        return;
    }
    UFUNCTION()
    void CommonSliderVM_SetCurrentRatio(const float32 NewRatio) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(NewRatio);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CommonSliderVM_SetCurrentStep(const float32 NewStep) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(NewStep);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_CommonSlider& local_6;
        TEUIModelRef<FVM_CommonSlider> local_2 = this.CommonSliderVM.AsRef();
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
                    this.CommonSliderVM.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_CommonSlider::__IndexOf_Ratio());
                    }
                    if (local_6)
                    {
                        this.OnCommonSliderRatioChanged(local_6.GetRatio());
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
                XError(ELog(17), "Remaining observed model change: OnCommonSliderRatioChanged");
            }
            return;
        }
        this.__CommonSliderVM = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.GammaSliderVM.Initialize(this, FName("VM_GammaSlider"), EEUIWidgetRefModelCreationType(0), false);
        this.CommonSliderVM.Initialize(this, FName("VM_CommonSlider"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.GammaSliderVMDelegate.IsBound())
        {
            this.GammaSliderVM.SetRef(this.GammaSliderVMDelegate.Execute());
        }
        if (this.CommonSliderVMDelegate.IsBound())
        {
            this.CommonSliderVM.SetRef(this.CommonSliderVMDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_LoginGamma
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnCommonSliderRatioChanged"));
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
