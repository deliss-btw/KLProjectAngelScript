

// NOTE: class defaults are not authored in this module: UESMAction_AddWidgetToLocalPlayer (default scalar field UESMAction.NetSimulateMode has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

struct FESMAddWidgetToLocalPlayerViewInstanceData
{
    UPROPERTY()
    bool bEndTriggerActivated = false;


}

class UESMAction_AddWidgetToLocalPlayer : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FGameplayTag WidgetTag;
    UPROPERTY()
    bool bAutoRemove = true;
    UPROPERTY()
    bool bActivateEndSocialInteractTriggerWhenWidgetClosed = false;
    UPROPERTY()
    FName EndSocialInteractTriggerName = n"EndSocialInteractActionTrigger";


    UFUNCTION()
    FESMInstanceDataInfo GetViewInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMAddWidgetToLocalPlayerViewInstanceData);
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        this.ModifyViewInstanceData(Context).bEndTriggerActivated = false;
        FECSWorldPtr local_4 = Context.GetECSWorld();
        Get local_8;
        if (local_8.opCall())
        {
            ::ECSWorldLifetimePage::Open(this.WidgetTag, FEUIModelContainer());
        }
        return;
    }
    UFUNCTION()
    void ViewTick_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_34 = 0;
        FESMAddWidgetToLocalPlayerViewInstanceData& local_2 = this.ModifyViewInstanceData(Context);
        if (!(this.bActivateEndSocialInteractTriggerWhenWidgetClosed))
        {
            return;
        }
        if (local_2.bEndTriggerActivated)
        {
            return;
        }
        FECSWorldPtr local_6 = Context.GetECSWorld();
        Get local_10;
        const FCS_LocalPlayer& local_12 = local_10.opCall();
        if (local_12)
        {
            if (FEUIWidget::FindWidget(local_12.UEPlayerController.GetLocalPlayer(), this.WidgetTag))
            {
                return;
            }
            FECSEntity local_20 = FECSEntity(local_12.GetPlayerPawnEntity());
            if (local_20.IsValid())
            {
                local_2.bEndTriggerActivated = true;
                FFPTime local_30 = FFPTime(-1);
                local_34.Entity = local_20;
                local_34.TriggerName = this.EndSocialInteractTriggerName;
            }
        }
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (!(this.bAutoRemove))
        {
            return;
        }
        FECSWorldPtr local_4 = Context.GetECSWorld();
        Get local_8;
        const FCS_LocalPlayer& local_10 = local_8.opCall();
        if (local_10)
        {
            FEUIWidgetRef local_14 = FEUIWidget::FindWidget(local_10.UEPlayerController.GetLocalPlayer(), this.WidgetTag);
            if (local_14)
            {
                ::ECSWorldLifetimePage::Close(local_14);
            }
        }
        return;
    }
    const FESMAddWidgetToLocalPlayerViewInstanceData GetViewInstanceData(const FESMViewContext &inout Context) const
    {
        const FESMAddWidgetToLocalPlayerViewInstanceData __r;
        return __r;
    }
    FESMAddWidgetToLocalPlayerViewInstanceData ModifyViewInstanceData(const FESMViewContext &inout Context) const
    {
        FESMAddWidgetToLocalPlayerViewInstanceData __r;
        return __r;
    }
}

