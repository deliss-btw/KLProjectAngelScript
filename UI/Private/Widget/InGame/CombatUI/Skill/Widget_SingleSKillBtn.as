
enum ENormalSkillBtnAnimState
{
    PressIdle,
    Pressed,
    EnhanceIdle = 10,
    Enhanced,
}

namespace UWidget_SingleSkillBtn
{
    const int ViewID = 0;
}
namespace UWidget_NormalSkillBtn
{
    const int ViewID = 0;
}
namespace UWidget_UltraSkillBtn
{
    const int ViewID = 0;
}
namespace UWidget_SpecialSkillBtn
{
    const int ViewID = 0;
}
namespace UWidget_CommonSkillBtn
{
    const int ViewID = 0;
}
namespace UWidget_TSkillBtn
{
    const int ViewID = 0;
}
namespace UWidget_SkillBtnSpecialCountItem
{
    const int ViewID = 0;
}
namespace UWidget_SkillBtnSpecialCounts
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_SingleSkillBtn : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SingleSkillBtn> SkillBtn;
    UPROPERTY()
    FGetEUIModelRef SkillBtnDelegate;

    UWidget_SingleSkillBtn()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SkillBtn.Initialize(this, FName("VM_SingleSkillBtn"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SkillBtnDelegate.IsBound())
        {
            this.SkillBtn.SetRef(this.SkillBtnDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_NormalSkillBtn : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_NormalSkillBtn> SkillBtn;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_BattleBuildEntry> ConfigEntry;
    UPROPERTY()
    UWidgetAnimation Anim_Enhance_In_Loop;
    UPROPERTY()
    UWidgetAnimation Anim_Enhance_Out;
    UPROPERTY()
    UWidgetAnimation Anim_Click;
    UPROPERTY()
    UWidgetAnimation Anim_Click_Loop;
    UPROPERTY()
    UWidgetAnimation Anim_Click_Loop_Out;
    UPROPERTY()
    UWidgetAnimation Anim_BuildUp;
    UPROPERTY()
    UEUIButton w_btn_touch_trigger;
    FEUIActionBinding AbilityPressBinding;
    FEUIActionBinding AbilityReleaseBinding;
    FEUIWidgetAnimDriver AnimDriver;
    bool bInjecting = false;
    UPROPERTY()
    FConfigVM_BattleBuildEntry ConfigEntryConfig;
    FEUIModelWeakRef __SkillBtn;
    UPROPERTY()
    FGetEUIModelRef SkillBtnDelegate;
    UPROPERTY()
    FGetEUIModelRef ConfigEntryDelegate;


    UFUNCTION()
    void Destruct_Implementation()
    {
        this.AnimDriver.StopAll();
        this.StopInjectionIfNeeded();
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        this.InitAnimDriver();
        if (this.w_btn_touch_trigger != nullptr)
        {
            this.w_btn_touch_trigger.OnPressed.AddUFunction(this, n"OnTouchTriggerPressed");
            this.w_btn_touch_trigger.OnReleased.AddUFunction(this, n"OnTouchTriggerReleased");
            UEUIInputSubsystem::Get(this.GetOwningLocalPlayer()).OnInputMethodChanged.AddUFunction(this, n"OnInputMethodChanged");
        }
        return;
    }
    UFUNCTION()
    void OnInputMethodChanged(const EEUIInputType NewInputType)
    {
        this.StopInjectionIfNeeded();
        return;
    }
    UFUNCTION()
    void OnSkillBtnInputActionChange(const FEUIInputAction &inout SkillBtnInputAction)
    {
        this.StopInjectionIfNeeded();
        this.AbilityPressBinding.UnRegister();
        this.AbilityPressBinding.SetInputAction(SkillBtnInputAction.EnhancedAction);
        this.AbilityPressBinding.SetInputEvent(EInputEvent(0));
        this.AbilityPressBinding.Register(this, n"OnTriggerAbilityPress");
        this.AbilityPressBinding.SetConsumesInput(false);
        this.AbilityPressBinding.SetReachableEvenInvisible(true);
        this.AbilityReleaseBinding.UnRegister();
        this.AbilityReleaseBinding.SetInputAction(SkillBtnInputAction.EnhancedAction);
        this.AbilityReleaseBinding.SetInputEvent(EInputEvent(1));
        this.AbilityReleaseBinding.Register(this, n"OnTriggerAbilityRelease");
        this.AbilityReleaseBinding.SetConsumesInput(false);
        this.AbilityReleaseBinding.SetReachableEvenInvisible(true);
        return;
    }
    void StopInjectionIfNeeded()
    {
        UInputAction local_4;
        if (!(this.bInjecting))
        {
            return;
        }
        if (local_4 != nullptr)
        {
            CommonUI::StopContinuousInputInjection(this.GetOwningLocalPlayer(), local_4);
        }
        this.bInjecting = false;
        return;
    }
    void InitAnimDriver()
    {
        if (this.AnimDriver.Init(this))
        {
            int local_2 = 0;
            int local_4 = 1;
            this.AnimDriver.DefineState(0, 0, nullptr, nullptr, nullptr);
            this.AnimDriver.DefineState(1, 0, this.Anim_Click_Loop, nullptr, this.Anim_Click_Loop_Out);
            this.AnimDriver.DefineState(10, 1, nullptr, nullptr, nullptr);
            this.AnimDriver.DefineState(11, 1, this.Anim_Enhance_In_Loop, nullptr, this.Anim_Enhance_Out);
            this.SetPressAnimState(false);
            this.RefreshEnhanceAnimState();
        }
        return;
    }
    void RefreshEnhanceAnimState()
    {
        int local_4;
        if (!(this.SkillBtn.IsValid()))
        {
            return;
        }
        if (GetbReleaseFree() || GetbReleasePersistent())
        {
            int local_5;
            local_5 = 11;
            local_4 = local_5;
        }
        else
        {
            int local_5;
            local_5 = 10;
            local_4 = local_5;
        }
        this.AnimDriver.SetState(local_4, false);
        return;
    }
    void SetPressAnimState(const bool bPressed)
    {
        int local_1;
        if (bPressed)
        {
            int local_2;
            local_2 = 1;
            local_1 = local_2;
        }
        else
        {
            int local_2;
            local_2 = 0;
            local_1 = local_2;
        }
        this.AnimDriver.SetState(local_1);
        return;
    }
    UFUNCTION()
    void OnTriggerAbilityPress()
    {
        if (!(this.SkillBtn.IsValid()))
        {
            return;
        }
        if (GetbSkillUsable())
        {
            this.SetPressAnimState(true);
        }
        return;
    }
    UFUNCTION()
    void OnTriggerAbilityRelease()
    {
        this.SetPressAnimState(false);
        return;
    }
    UFUNCTION()
    void OnTouchTriggerPressed()
    {
        UInputAction local_4;
        if (!(this.SkillBtn.IsValid()))
        {
            return;
        }
        if (GetbToggleMode())
        {
            if (this.bInjecting)
            {
                this.StopInjectionIfNeeded();
                this.OnTriggerAbilityRelease();
            }
            else
            {
                if (local_4 != nullptr)
                {
                    CommonUI::StartContinuousInputInjection(this.GetOwningLocalPlayer(), local_4, true);
                    this.bInjecting = true;
                }
                this.OnTriggerAbilityPress();
            }
            return;
        }
        if (local_4 != nullptr)
        {
            CommonUI::StartContinuousInputInjection(this.GetOwningLocalPlayer(), local_4, true);
            this.bInjecting = true;
        }
        this.OnTriggerAbilityPress();
        return;
    }
    UFUNCTION()
    void OnTouchTriggerReleased()
    {
        if (GetbToggleMode())
        {
            return;
        }
        this.StopInjectionIfNeeded();
        this.OnTriggerAbilityRelease();
        return;
    }
    UFUNCTION()
    void OnHover()
    {
        this.SetBtnHover(true);
        return;
    }
    UFUNCTION()
    void OnUnhover()
    {
        this.SetBtnHover(false);
        return;
    }
    UFUNCTION()
    void OnSkillReleaseFree(const bool bReleaseFree)
    {
        this.RefreshEnhanceAnimState();
        return;
    }
    UFUNCTION()
    void OnSkillReleasePersistent(const bool bReleasePersistent)
    {
        this.RefreshEnhanceAnimState();
        return;
    }
    UFUNCTION()
    void OnSkillCanBeUsed(const bool bSkillUsable)
    {
        if (bSkillUsable)
        {
            this.AnimDriver.PlayOnce(this.Anim_BuildUp);
        }
        if (!(bSkillUsable))
        {
            this.SetPressAnimState(false);
        }
        return;
    }
    UFUNCTION()
    void OnRemnantSlotChanged(const int RemnantSlotChangedCounter)
    {
        this.AnimDriver.PlayOnce(this.Anim_Click);
        return;
    }
    void SetBtnHover(const bool bHover)
    {
        if (this.SkillBtn.IsValid())
        {
            if (bHover)
            {
                TEUIModelRef<FVM_BattleBuildEntry> local_4;
                local_4;
                local_4.SetConfigEntry();
                return;
            }
            TEUIModelRef<FVM_BattleBuildEntry>(nullptr).SetConfigEntry();
        }
        return;
    }
    UFUNCTION()
    ESlateVisibility SkillBtn_BtnVisibility() const
    {
        FVM_NormalSkillBtn& local_2;
        int local_5;
        if (local_2)
        {
            local_5 = int(local_2.BtnVisibility());
        }
        else
        {
            local_5 = 0;
        }
        return ESlateVisibility(local_5);
    }
    UFUNCTION()
    void ConfigEntry_OpenBattleBuild() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_NormalSkillBtn& local_6;
        TEUIModelRef<FVM_NormalSkillBtn> local_2 = this.SkillBtn.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            switch (It.GetIndex())
            {
            case 0:
            {
                this.SkillBtn.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_NormalSkillBtn::__IndexOf_InputAction());
                }
                if (local_6)
                {
                    this.OnSkillBtnInputActionChange(local_6.GetInputAction());
                }
                break;
            }
            case 1:
            {
                this.SkillBtn.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_NormalSkillBtn::__IndexOf_bReleaseFree());
                }
                if (local_6)
                {
                    this.OnSkillReleaseFree(local_6.GetbReleaseFree());
                }
                break;
            }
            case 2:
            {
                this.SkillBtn.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_NormalSkillBtn::__IndexOf_bReleasePersistent());
                }
                if (local_6)
                {
                    this.OnSkillReleasePersistent(local_6.GetbReleasePersistent());
                }
                break;
            }
            case 3:
            {
                this.SkillBtn.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_NormalSkillBtn::__IndexOf_bSkillUsable());
                }
                if (local_6)
                {
                    this.OnSkillCanBeUsed(local_6.GetbSkillUsable());
                }
                break;
            }
            case 4:
            {
                this.SkillBtn.TrackRead();
                if (local_6)
                {
                    local_6.TrackPropertyRead(::FVM_NormalSkillBtn::__IndexOf_RemnantSlotChangedCounter());
                }
                if (local_6)
                {
                    this.OnRemnantSlotChanged(local_6.GetRemnantSlotChangedCounter());
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
                XError(ELog(17), "Remaining observed model change: OnSkillBtnInputActionChange");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnSkillReleaseFree");
            }
            if (It.IsDirty(2))
            {
                XError(ELog(17), "Remaining observed model change: OnSkillReleasePersistent");
            }
            if (It.IsDirty(3))
            {
                XError(ELog(17), "Remaining observed model change: OnSkillCanBeUsed");
            }
            if (It.IsDirty(4))
            {
                XError(ELog(17), "Remaining observed model change: OnRemnantSlotChanged");
            }
            return;
        }
        this.__SkillBtn = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SkillBtn.Initialize(this, FName("VM_NormalSkillBtn"), EEUIWidgetRefModelCreationType(0), false);
        this.ConfigEntry.Initialize(this, FName("VM_BattleBuildEntry"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SkillBtnDelegate.IsBound())
        {
            this.SkillBtn.SetRef(this.SkillBtnDelegate.Execute());
        }
        if (this.ConfigEntryDelegate.IsBound())
        {
            this.ConfigEntry.SetRef(this.ConfigEntryDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_UltraSkillBtn : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_NormalSkillBtn> SkillBtn;
    UPROPERTY()
    FGetEUIModelRef SkillBtnDelegate;

    UWidget_UltraSkillBtn()
    {
        return;
    }
    UFUNCTION()
    ESlateVisibility SkillBtn_BtnVisibility() const
    {
        FVM_NormalSkillBtn& local_2;
        int local_5;
        if (local_2)
        {
            local_5 = int(local_2.BtnVisibility());
        }
        else
        {
            local_5 = 0;
        }
        return ESlateVisibility(local_5);
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SkillBtn.Initialize(this, FName("VM_NormalSkillBtn"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SkillBtnDelegate.IsBound())
        {
            this.SkillBtn.SetRef(this.SkillBtnDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_SpecialSkillBtn : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SpecialSkillBtn> SkillBtn;
    UPROPERTY()
    FGetEUIModelRef SkillBtnDelegate;

    UWidget_SpecialSkillBtn()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SkillBtn.Initialize(this, FName("VM_SpecialSkillBtn"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SkillBtnDelegate.IsBound())
        {
            this.SkillBtn.SetRef(this.SkillBtnDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_CommonSkillBtn : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonSkillBtn> SkillBtn;
    UPROPERTY()
    FGetEUIModelRef SkillBtnDelegate;

    UWidget_CommonSkillBtn()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SkillBtn.Initialize(this, FName("VM_CommonSkillBtn"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SkillBtnDelegate.IsBound())
        {
            this.SkillBtn.SetRef(this.SkillBtnDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_TSkillBtn : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TSkillBtn> SkillBtn;
    UPROPERTY()
    FGetEUIModelRef SkillBtnDelegate;

    UWidget_TSkillBtn()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SkillBtn.Initialize(this, FName("VM_TSkillBtn"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SkillBtnDelegate.IsBound())
        {
            this.SkillBtn.SetRef(this.SkillBtnDelegate.Execute());
        }
        return;
    }
}

class UWidget_SkillBtnSpecialCountItem : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SkillBtnSpecialCountItem> SpecialCountItem;
    UPROPERTY()
    FGetEUIModelRef SpecialCountItemDelegate;

    UWidget_SkillBtnSpecialCountItem()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SpecialCountItem.Initialize(this, FName("VM_SkillBtnSpecialCountItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SpecialCountItemDelegate.IsBound())
        {
            this.SpecialCountItem.SetRef(this.SpecialCountItemDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_SkillBtnSpecialCounts : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SkillBtnSpecialCounts> SpecialCounts;
    UPROPERTY()
    FGetEUIModelRef SpecialCountsDelegate;

    UWidget_SkillBtnSpecialCounts()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SpecialCounts.Initialize(this, FName("VM_SkillBtnSpecialCounts"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SpecialCountsDelegate.IsBound())
        {
            this.SpecialCounts.SetRef(this.SpecialCountsDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_SkillBtn_ProgressMat : UUserWidget
{
    UPROPERTY()
    UMaterialInstance MatInstance;
    UPROPERTY()
    UImage ProgressImg;
    UPROPERTY()
    UMaterialInstanceDynamic MatInstanceDynamic;
    UPROPERTY()
    FMaterialParameterInfo ProgressParameter;
    UPROPERTY()
    FMaterialParameterInfo Progress2Parameter;
    UPROPERTY()
    float32 CurProgress;

    UWidget_SkillBtn_ProgressMat()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        this.MatInstanceDynamic = Material::CreateDynamicMaterialInstance(__GetWorldContext(), this.MatInstance, NAME_None, EMIDCreationFlags(0));
        this.ProgressParameter = this.MatInstanceDynamic.GetParameterInfo(EMaterialParameterAssociation(2), n"Progress ValueV", nullptr);
        this.Progress2Parameter = this.MatInstanceDynamic.GetParameterInfo(EMaterialParameterAssociation(2), n"Progress Value", nullptr);
        this.ProgressImg.SetBrushFromMaterial(this.MatInstanceDynamic);
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        this.MatInstanceDynamic.SetScalarParameterValueByInfo(this.ProgressParameter, this.CurProgress);
        this.MatInstanceDynamic.SetScalarParameterValueByInfo(this.Progress2Parameter, this.CurProgress);
        return;
    }
}

namespace UWidget_SingleSkillBtn
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
namespace UWidget_NormalSkillBtn
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSkillBtnInputActionChange"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSkillReleaseFree"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSkillReleasePersistent"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSkillCanBeUsed"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnRemnantSlotChanged"));
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
namespace UWidget_UltraSkillBtn
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
namespace UWidget_SpecialSkillBtn
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
namespace UWidget_CommonSkillBtn
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
namespace UWidget_TSkillBtn
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
namespace UWidget_SkillBtnSpecialCountItem
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
namespace UWidget_SkillBtnSpecialCounts
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
