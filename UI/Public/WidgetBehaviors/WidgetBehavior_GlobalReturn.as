

class UWidgetBehavior_GlobalReturn : UEUIBlueprintWidgetBehavior_ToEventBase
{
    UPROPERTY()
    bool bShouldDisplayInActionBar = true;
    FEUIActionBindingHandle Handle;


    UFUNCTION()
    void OnWidgetConstruct_Implementation(const UEUIUserWidget InWidget)
    {
        const UUtilitySettings local_10;
        UEnhancedInputSettings local_4 = Cast<UEnhancedInputSettings>(System::LoadAsset_Blocking(UGameplayConfigsManager::GetEnhancedInputSettings()));
        if (local_4 != nullptr)
        {
            this.Handle = CommonUI::RegisterUIActionBinding(InWidget, local_4.GlobalReturnAction, this.bShouldDisplayInActionBar, this, n"InputTriggerReturn");
        }
        GetGameplaySettings<UUtilitySettings> local_12;
        local_10 = local_12;
        FDataObjectPtr local_42;
        local_42;
        UKLEnhancedInputManagerSubsystem::Get(InWidget.GetOwningLocalPlayer()).RequireInputContext(local_42);
        return;
    }
    UFUNCTION()
    void OnWidgetDestruct_Implementation(const UEUIUserWidget InWidget)
    {
        const UUtilitySettings local_6;
        this.Handle.Reset();
        if (ECS::GetECSWorld().IsValid())
        {
            FDataObjectPtr local_38;
            GetGameplaySettings<UUtilitySettings> local_8;
            local_6 = local_8;
            local_38;
            UKLEnhancedInputManagerSubsystem::Get(InWidget.GetOwningLocalPlayer()).ReleaseInputContext(local_38);
        }
        return;
    }
    UFUNCTION()
    void InputTriggerReturn()
    {
        if (!(this.InvokeEventIfBound()))
        {
            UEUIUserWidget local_6 = this.GetWidget();
            if (local_6 != nullptr)
            {
                local_6.ClosePage(false);
            }
            else
            {
                FString local_12 = this.GetWidget().GetName();
                XWarning(ELog(16), FString().Append("Widget ").Append(local_12).Append(" is not page and no specific event bound to Global Return"));
            }
        }
        return;
    }
}

