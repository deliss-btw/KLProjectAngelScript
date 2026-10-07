

class UESMAction_AnimKeepExitSnapshot : UESMBPBaseSpanAction
{
    UESMAction_AnimKeepExitSnapshot()
    {
        return;
    }
    UFUNCTION()
    EESMActionExclusiveType GetExclusiveType_Implementation() const
    {
        return EESMActionExclusiveType(2);
    }
    UFUNCTION()
    void GetRestriction_Implementation(FESMNotifyRestriction &inout OutParam) const
    {
        OutParam.IdentifyName = UESMAction_AnimKeepExitSnapshot.opArrow().GetFName();
        OutParam.bExclusive = true;
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        int local_12 = 0;
        FESMAnimState& local_20;
        if (!(!(local_6)) && local_12)
        {
            int local_15 = 0;
            for (; local_15 < local_12.GetLayerNum(); )
            {
                local_20.SetRawPlaySpeed(0.0f);
                local_20.SetNormalizedPlaySpeed(0.0f);
                ++local_15;
            }
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        FESMAnimState& local_12;
        Modify local_4;
        FC_AnimState& local_6 = local_4.opCall();
        if (local_6)
        {
            int local_8 = 0;
            for (; local_8 < local_6.GetLayerNum(); )
            {
                local_12.SetState(NAME_None);
                local_12.SetOverrideAnimKey(NAME_None);
                local_12.SetOverrideAnimAsset(TSoftObjectPtr<UAnimationAsset>(nullptr));
                local_12.SetOverrideShouldLoop(false);
                local_12.SetbMirror(false);
                local_12.SetWorldEnterTime(FFPTime(-1));
                local_12.SetWorldExitTime(Time.WorldTime);
                ++local_8;
            }
        }
        return;
    }
}

