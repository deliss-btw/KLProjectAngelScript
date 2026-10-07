

// NOTE: class defaults are not authored in this module: UESMAction_ShowMessageHint (default scalar field UESMAction.NetTriggerMode has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class UESMAction_ShowMessageHint : UESMBPBaseInstantAction
{
    UPROPERTY()
    EESMActionTargetType TargetType = EESMActionTargetType(0);
    UPROPERTY()
    FNameHandle_EntityBBVarEntity TargetEntityBBVar;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> MessageHintConfig;
    UPROPERTY()
    TArray<FTextArgument> TextArguments;


    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        FECSEntity local_4;
        if (int(this.TargetType) == 0)
        {
            local_4 = Context.GetEntity();
        }
        else
        {
            if (int(this.TargetType) == 1)
            {
                Get local_12;
                const FC_InteractionInfoForESM& local_14 = local_12.opCall();
                if (local_14)
                {
                    if (local_14.GetTargetEntity().IsValid())
                    {
                        local_4 = local_14.GetTargetEntity();
                    }
                }
            }
            else
            {
                if (int(this.TargetType) == 2)
                {
                    Get local_18;
                    const FC_LockTarget& local_20 = local_18.opCall();
                    if (local_20)
                    {
                        local_4 = local_20.GetTargetEntity();
                    }
                }
                else
                {
                    if (int(this.TargetType) == 3)
                    {
                        FNameHandle_EntityBBVarEntity local_24;
                        local_24;
                        local_4 = Context.GetEntity().GetBB_Entity(local_24);
                    }
                }
            }
        }
        if (local_4.IsValid())
        {
            ::MessageHintUtils::ShowMessageHint(local_4, this.MessageHintConfig, this.TextArguments);
        }
        return;
    }
}

