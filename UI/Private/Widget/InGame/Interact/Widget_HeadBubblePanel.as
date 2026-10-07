
namespace UWidget_HeadBubblePanel
{
    const int ViewID = 0;

// NOTE: class defaults are not authored in this module: UWidget_HeadBubblePanel (default scalar field UEUIActivatableWidget.bAutoActivate has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

}
class UWidget_HeadBubblePanel : UEUIActivatableWidget
{
    UPROPERTY()
    TSubclassOf<UWidget_HeadBubble> UI_HeadBubble_WidgetBPClass;
    TMap<FECSEntityId, UWidget_HeadBubble> AllHeadBubbles;

    UWidget_HeadBubblePanel()
    {
        return;
    }
    UFUNCTION()
    void ShowHeadBubble(const FCE_ShowHeadBubble &inout Event, const bool bIsChaos = false)
    {
        this.ShowHeadBubbleInternal(Event.Sender, Event.EmojiData, "", bIsChaos);
        return;
    }
    void ShowHeadBubbleInternal(const FECSEntity &inout Sender, const FName &inout EmojiName, const FString &inout ShowContent, const bool bIsChaos)
    {
        UWidget_HeadBubble local_2;
        if (this.AllHeadBubbles.Find(Sender.GetId(), local_2) && (local_2 != nullptr))
        {
            local_2.Init(Sender, EmojiName, ShowContent, bIsChaos);
            if (!(local_2.IsVisible()) == !(false))
            {
                local_2.SetVisibility(ESlateVisibility(3));
            }
            return;
        }
        local_2 = (Cast<UWidget_HeadBubble>(WidgetBlueprint::CreateWidget(__GetWorldContext(), this.UI_HeadBubble_WidgetBPClass, this.GetOwningPlayer())));
        local_2.Init(Sender, EmojiName, ShowContent, bIsChaos);
        local_2.AddToViewport(0);
        this.AllHeadBubbles.Add(Sender.GetId(), local_2);
        return;
    }
    void ShowSignalInternal(const FECSEntity &inout Sender, const FSignalConfig &inout SignalConfig)
    {
        FFXConfig local_116;
        local_116.SetAsset(FSoftClassPath(SignalConfig.FXActor.ToString()));
        local_116.SetbDetach(false);
        local_116.SetLocationOffset(FVector::ZeroVector);
        local_116.SetRotationOffset(FRotator::ZeroRotator);
        local_116.SetOverrideParams(TArray<FFXOverrideParam>());
        ECSFX::PlayFXInstantEx(Sender, local_116, ECS::GetContextTime(), 1.0f, false, false, FECSEntity());
        return;
    }
    UFUNCTION()
    void ShowCustomWheelOption(const FCE_ShowCustomWheelOption &inout Event)
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
}

namespace UWidget_HeadBubblePanel
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
