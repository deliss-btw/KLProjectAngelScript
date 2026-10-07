
enum EGameStartSequenceState
{
    Idle,
    FadeIn,
    Hold,
    FadeOut,
    Done,
}

namespace UWidget_GameStart
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_GameStart : UEUIUserWidget
{
    UPROPERTY()
    UWidgetSwitcher w_switcher_state;
    UPROPERTY()
    UCanvasPanel Company;
    UPROPERTY()
    UCanvasPanel Project;
    UPROPERTY()
    UCanvasPanel Health;
    UPROPERTY()
    ULoginSettings LoginSettings;
    EGameStartSequenceState SequenceState = EGameStartSequenceState(0);
    int CurrentSlotIndex = -1;
    float32 StateElapsed = 0.0f;
    float32 CurrentFadeInSeconds = 0.0f;
    float32 CurrentHoldSeconds = 0.0f;
    float32 CurrentFadeOutSeconds = 0.0f;
    TArray<int> ActiveSlotOrder;
    int OrderCursor = 0;


    UFUNCTION()
    void Construct_Implementation()
    {
        this.ResetAllPanelsOpacity(0.0f);
        this.SequenceState = EGameStartSequenceState(0);
        this.CurrentSlotIndex = -1;
        this.StateElapsed = 0.0f;
        this.OrderCursor = 0;
        this.ActiveSlotOrder.Reset(0);
        GetGameplaySettings<ULoginSettings> local_6;
        this.LoginSettings = local_6;
        if (this.LoginSettings == nullptr)
        {
            XWarning(ELog(16), "UWidget_GameStart: ULoginSettings missing, sequence skipped.");
            this.SequenceState = EGameStartSequenceState(4);
            return;
        }
        this.BuildActiveSlotOrder();
        if (this.ActiveSlotOrder.Num() == 0)
        {
            this.SequenceState = EGameStartSequenceState(4);
            return;
        }
        this.OrderCursor = 0;
        this.BeginSlot(this.ActiveSlotOrder[this.OrderCursor]);
        return;
    }
    UFUNCTION()
    void Destruct_Implementation()
    {
        this.SequenceState = EGameStartSequenceState(4);
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        float32 local_15;
        float32 local_16;
        if ((int(this.SequenceState) == 4 || (int(this.SequenceState) == 0)))
        {
            return;
        }
        if (this.LoginSettings == nullptr)
        {
            this.SequenceState = EGameStartSequenceState(4);
            return;
        }
        this.StateElapsed += InDeltaTime;
        if (int(this.SequenceState) == 1)
        {
            float32 local_10;
            local_10 = this.CurrentFadeInSeconds;
            if (local_10 > 0.0001f)
            {
                local_15 = FMath::Clamp((this.StateElapsed / local_10), 0.0f, 1.0f);
            }
            else
            {
                local_15 = 1.0f;
            }
            this.SetPanelOpacity(this.CurrentSlotIndex, local_15);
            if (local_15 >= 0.9999f)
            {
                this.SetPanelOpacity(this.CurrentSlotIndex, 1.0f);
                this.SequenceState = EGameStartSequenceState(2);
                this.StateElapsed = 0.0f;
            }
            return;
        }
        if (int(this.SequenceState) == 2)
        {
            if (this.StateElapsed >= this.CurrentHoldSeconds)
            {
                this.SequenceState = EGameStartSequenceState(3);
                this.StateElapsed = 0.0f;
            }
            return;
        }
        if (int(this.SequenceState) == 3)
        {
            float32 local_10;
            local_10 = this.CurrentFadeOutSeconds;
            if (local_10 > 0.0001f)
            {
                local_16 = FMath::Clamp((1.0f - (this.StateElapsed / local_10)), 0.0f, 1.0f);
            }
            else
            {
                local_16 = 1.0f;
            }
            this.SetPanelOpacity(this.CurrentSlotIndex, local_16);
            if (local_16 <= 0.0001f)
            {
                this.SetPanelOpacity(this.CurrentSlotIndex, 0.0f);
                ++this.OrderCursor;
                if (this.OrderCursor >= this.ActiveSlotOrder.Num())
                {
                    this.SequenceState = EGameStartSequenceState(4);
                    this.OnFinish();
                    return;
                }
                this.BeginSlot(this.ActiveSlotOrder[this.OrderCursor]);
            }
        }
        return;
    }
    void BuildActiveSlotOrder()
    {
        this.AppendSlotIfActive(EGameStartPhase(0));
        this.AppendSlotIfActive(EGameStartPhase(1));
        this.AppendSlotIfActive(EGameStartPhase(2));
        return;
    }
    void AppendSlotIfActive(const EGameStartPhase Phase)
    {
        FGameStartPhaseInfo local_4;
        if (this.LoginSettings.GameStartPhaseControl.Find(Phase, local_4) && local_4.bIsSkip)
        {
            return;
        }
        this.ActiveSlotOrder.Add(int(Phase));
        return;
    }
    void BeginSlot(const int SlotIndex)
    {
        this.CurrentSlotIndex = SlotIndex;
        FGameStartPhaseInfo local_6;
        if (!(this.LoginSettings.GameStartPhaseControl.Find(EGameStartPhase(SlotIndex), local_6)))
        {
            FGameStartPhaseInfo local_12;
            local_6 = local_12;
        }
        this.CurrentFadeInSeconds = FMath::Max(0.0f, local_6.FadeInTime);
        this.CurrentHoldSeconds = FMath::Max(0.0f, local_6.Time);
        this.CurrentFadeOutSeconds = FMath::Max(0.0f, local_6.FadeOutTime);
        if (((this.CurrentFadeInSeconds + this.CurrentHoldSeconds) + this.CurrentFadeOutSeconds) <= 0.0001f)
        {
            ++this.OrderCursor;
            if (this.OrderCursor >= this.ActiveSlotOrder.Num())
            {
                this.SequenceState = EGameStartSequenceState(4);
                this.OnFinish();
                return;
            }
            this.BeginSlot(this.ActiveSlotOrder[this.OrderCursor]);
            return;
        }
        if (this.w_switcher_state != nullptr)
        {
            this.w_switcher_state.SetActiveWidgetIndex(SlotIndex);
        }
        this.SetPanelOpacity(SlotIndex, 0.0f);
        this.SequenceState = EGameStartSequenceState(1);
        this.StateElapsed = 0.0f;
        return;
    }
    void ResetAllPanelsOpacity(const float32 Opacity)
    {
        this.SetPanelOpacity(0, Opacity);
        this.SetPanelOpacity(1, Opacity);
        this.SetPanelOpacity(2, Opacity);
        return;
    }
    void SetPanelOpacity(const int SlotIndex, const float32 Opacity)
    {
        UCanvasPanel local_2 = this.GetPanelBySlot(SlotIndex);
        if (local_2 != nullptr)
        {
            local_2.SetRenderOpacity(Opacity);
        }
        return;
    }
    UCanvasPanel GetPanelBySlot(const int SlotIndex) const
    {
        if (SlotIndex == 0)
        {
            return this.Company;
        }
        if (SlotIndex == 1)
        {
            return this.Project;
        }
        return this.Health;
    }
    void OnFinish()
    {
        this.ClosePage(false);
        ULocalPlayer local_10 = this.GetOwningLocalPlayer();
        FEUIMessageBus::Publish(EUIMessageBus);
        FMsg_LoginNextPhase local_4;
        local_4.NextPhase = ELoginShowPhase(1);
        return;
    }
}

namespace UWidget_GameStart
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
