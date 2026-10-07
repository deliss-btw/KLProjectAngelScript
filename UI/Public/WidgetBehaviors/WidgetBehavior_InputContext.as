

class UWidgetBehavior_InputContext : UEUIBlueprintWidgetBehaviorBase
{
    UPROPERTY()
    TArray<TDataObjectPtr<FEnhancedInputContextConfig>> EnableContexts;
    UPROPERTY()
    TArray<FGameplayTag> DisableTags;

    UWidgetBehavior_InputContext()
    {
        return;
    }
    UFUNCTION()
    void OnWidgetConstruct_Implementation(const UEUIUserWidget InWidget)
    {
        for (auto& local_16 : this.EnableContexts)
        {
            UKLEnhancedInputManagerSubsystem::Get(InWidget.GetOwningLocalPlayer()).RequireInputContext(local_16.opImplConv());
        }
        for (auto& local_58 : this.DisableTags)
        {
            UKLEnhancedInputManagerSubsystem::Get(InWidget.GetOwningLocalPlayer()).RequireDisableTag(local_58);
        }
        return;
    }
    UFUNCTION()
    void OnWidgetDestruct_Implementation(const UEUIUserWidget InWidget)
    {
        for (auto& local_16 : this.EnableContexts)
        {
            UKLEnhancedInputManagerSubsystem::Get(InWidget.GetOwningLocalPlayer()).ReleaseInputContext(local_16.opImplConv());
        }
        for (auto& local_58 : this.DisableTags)
        {
            UKLEnhancedInputManagerSubsystem::Get(InWidget.GetOwningLocalPlayer()).ResetTagToEnabled(local_58);
        }
        return;
    }
}

