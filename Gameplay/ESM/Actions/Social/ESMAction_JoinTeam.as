

// NOTE: class defaults are not authored in this module: UESMAction_JoinTeam (default scalar field UESMAction.NetTriggerMode has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class UESMAction_JoinTeam : UESMBPBaseInstantAction
{
    UESMAction_JoinTeam()
    {
        return;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        bool local_7;
        Get local_4;
        const FC_InteractionInfoForESM& local_6 = local_4.opCall();
        if (local_6)
        {
            if (local_6.GetTargetEntity().IsValid())
            {
                FECSEntity local_16 = ::FASCommonUtils::GetUniquePlayerEntity(local_6.GetTargetEntity());
                if (!(local_16.IsValid()))
                {
                    local_7 = false;
                }
                else
                {
                    Has local_20;
                    local_7 = local_20.opCall();
                }
                if (local_7)
                {
                    Get local_26;
                    bool local_21 = local_26.opCall().GetIsInteractMaster();
                    if (local_21)
                    {
                        FECSEntity local_12 = ::FASCommonUtils::GetUniquePlayerEntity(Context.GetEntity());
                        if (local_12.IsValid())
                        {
                            ::FSocialTeamUtils::JoinSocialTeam(local_16, local_12);
                        }
                    }
                }
            }
        }
        return;
    }
}

