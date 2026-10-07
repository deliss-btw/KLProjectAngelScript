
namespace UWidget_DebugCombatState
{
    const int ViewID = 0;

}
class UWidget_DebugCombatState : UEUIUserWidget
{
    UPROPERTY()
    UTextBlock CombatState;

    UWidget_DebugCombatState()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        FECSEntity local_8 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
        bool local_10 = false;
        int local_9 = local_10;
        FNameHandle_EntityBBVar local_16;
        local_16;
        if (local_8.HasEntityBB(local_16))
        {
            FNameHandle_EntityBBVarBool local_20;
            local_20;
            if (local_8.GetBB_Bool(local_20))
            {
                this.CombatState.SetColorAndOpacity(FSlateColor(FLinearColor(1.0f, 1.0f, 1.0f, 0.25f)));
            }
            else
            {
                this.CombatState.SetColorAndOpacity(FSlateColor(FLinearColor(1.0f, 1.0f, 1.0f, 0.0f)));
            }
        }
        return;
    }
}

namespace UWidget_DebugCombatState
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
