

class UWidget_InteractTarget : UASUserWidget
{
    UPROPERTY()
    UTextBlock AS_Text_InteractType;
    UPROPERTY()
    UWidgetSwitcher AS_InteractActionSwitch;
    UPROPERTY()
    UEUIButton w_btn_touch_trigger;
    EInteractMode CachedInteractMode = EInteractMode(0);
    bool bTouchBound = false;


    UFUNCTION()
    void SetInputActionType(const EInteractMode InActionType)
    {
        this.CachedInteractMode = InActionType;
        if (this.AS_InteractActionSwitch != nullptr)
        {
            int local_6 = int(InActionType) == 1 ? 1 : 0;
            this.AS_InteractActionSwitch.SetActiveWidgetIndex(local_6);
        }
        if ((!(this.bTouchBound) && ((this.w_btn_touch_trigger != nullptr))))
        {
            this.w_btn_touch_trigger.OnClicked.AddUFunction(this, n"OnTouchInteractClicked");
            this.bTouchBound = true;
        }
        return;
    }
    UFUNCTION()
    void OnTouchInteractClicked()
    {
        if ((FECSEntity(UECSFunctionLibraryExtension::GetLocalPlayerPawnEntity(__GetWorldContext())) == ENTITY_NULL))
        {
            return;
        }
        if (int(this.CachedInteractMode) == 1)
        {
            FCE_BeginInteractEvent local_28;
            Get local_18;
            const FC_BestInteractionTargetInfoModeZ& local_20 = local_18.opCall();
            if (local_20)
            {
                FFPTime local_26 = FFPTime(-1);
                local_28.TargetEntity = local_20.TargetEntity;
                local_28.InteractTargetPointAndBehaviorIndex = local_20.InteractTargetPointAndBehaviorIndex;
                local_28.InteractMode = EInteractMode(1);
            }
        }
        else
        {
            FCE_BeginInteractEvent local_28;
            Get local_32;
            const FC_BestInteractionTargetInfo& local_34 = local_32.opCall();
            if (local_34)
            {
                FFPTime local_26_2 = FFPTime(-1);
                local_28.TargetEntity = local_34.TargetEntity;
                local_28.InteractTargetPointAndBehaviorIndex = local_34.InteractTargetPointAndBehaviorIndex;
                local_28.bIsSecondaryInteract = local_34.bIsSecondaryTarget;
                local_28.InteractMode = EInteractMode(0);
            }
        }
        return;
    }
}

