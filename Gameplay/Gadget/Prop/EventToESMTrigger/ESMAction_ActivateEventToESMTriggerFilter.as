

// NOTE: class defaults are not authored in this module: UESMAction_ActivateBeginOverlapEventToESMTriggerFilter (default scalar field UESMAction.NetTriggerMode has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class UESMAction_ActivateBeginOverlapEventToESMTriggerFilter : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bAllActivated = true;
    UPROPERTY()
    TArray<int> SpecificIndices;


    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        int local_8 = 0;
        int local_7 = local_8;
        if (local_6)
        {
            if (this.bAllActivated)
            {
                int local_11 = 1 << local_6.BeginOverlapFilter.Num();
                local_7 = (local_11 - 1);
            }
            else
            {
                for (auto local_25 : this.SpecificIndices)
                {
                    if (local_25 >= 0 && (local_25 < 8) && (local_25 < local_6.BeginOverlapFilter.Num()))
                    {
                        int local_27 = local_7;
                        int local_11_2 = 1;
                        local_7 = (local_27 | (local_11_2 << local_25));
                    }
                }
            }
            ModifyOrAdd local_32;
            FC_BeginOverlapEventToESMTriggerFilterRuntime& local_34 = local_32.opCall();
            if (local_34)
            {
                local_34.SetActivatedIndexMask(int8(local_7));
            }
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
}

class UESMAction_ActivateCustomInteractEventToESMTriggerFilter : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bAllActivated = true;
    UPROPERTY()
    TArray<int> SpecificIndices;


    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        int local_8 = 0;
        int local_7 = local_8;
        if (local_6)
        {
            if (this.bAllActivated)
            {
                int local_11 = 1 << local_6.CustomInteractFilter.Num();
                local_7 = (local_11 - 1);
            }
            else
            {
                for (auto local_25 : this.SpecificIndices)
                {
                    if (local_25 >= 0 && (local_25 < 8) && (local_25 < local_6.CustomInteractFilter.Num()))
                    {
                        int local_27 = local_7;
                        int local_11_2 = 1;
                        local_7 = (local_27 | (local_11_2 << local_25));
                    }
                }
            }
            ModifyOrAdd local_32;
            FC_CustomInteractEventToESMTriggerFilterRuntime& local_34 = local_32.opCall();
            if (local_34)
            {
                local_34.SetActivatedIndexMask(int8(local_7));
            }
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
}

class UESMAction_ActivateOnTakeDamageEventToESMTriggerFilter : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bAllActivated = true;
    UPROPERTY()
    TArray<int> SpecificIndices;


    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        int local_8 = 0;
        int local_7 = local_8;
        if (local_6)
        {
            if (this.bAllActivated)
            {
                int local_11 = 1 << local_6.OnTakeDamageFilter.Num();
                local_7 = (local_11 - 1);
            }
            else
            {
                for (auto local_25 : this.SpecificIndices)
                {
                    if (local_25 >= 0 && (local_25 < 8) && (local_25 < local_6.OnTakeDamageFilter.Num()))
                    {
                        int local_27 = local_7;
                        int local_11_2 = 1;
                        local_7 = (local_27 | (local_11_2 << local_25));
                    }
                }
            }
            ModifyOrAdd local_32;
            FC_OnTakeDamageEventToESMTriggerFilterRuntime& local_34 = local_32.opCall();
            if (local_34)
            {
                local_34.SetActivatedIndexMask(int8(local_7));
            }
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
}

class UESMAction_ActivateOnBeingHitEventToESMTriggerFilter : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bAllActivated = true;
    UPROPERTY()
    TArray<int> SpecificIndices;


    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        int local_8 = 0;
        int local_7 = local_8;
        if (local_6)
        {
            if (this.bAllActivated)
            {
                int local_11 = 1 << local_6.OnBeingHitFilter.Num();
                local_7 = (local_11 - 1);
            }
            else
            {
                for (auto local_25 : this.SpecificIndices)
                {
                    if (local_25 >= 0 && (local_25 < 8) && (local_25 < local_6.OnBeingHitFilter.Num()))
                    {
                        int local_27 = local_7;
                        int local_11_2 = 1;
                        local_7 = (local_27 | (local_11_2 << local_25));
                    }
                }
            }
            ModifyOrAdd local_32;
            FC_OnBeingHitEventToESMTriggerFilterRuntime& local_34 = local_32.opCall();
            if (local_34)
            {
                local_34.SetActivatedIndexMask(int8(local_7));
            }
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
}

class UESMAction_ActivatePropEcologyEventToESMTriggerFilter : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bAllActivated = true;
    UPROPERTY()
    TArray<int> SpecificIndices;


    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        int local_8 = 0;
        int local_7 = local_8;
        if (local_6)
        {
            if (this.bAllActivated)
            {
                int local_11 = 1 << local_6.PropEcologyEventFilter.Num();
                local_7 = (local_11 - 1);
            }
            else
            {
                for (auto local_25 : this.SpecificIndices)
                {
                    if (local_25 >= 0 && (local_25 < 8) && (local_25 < local_6.PropEcologyEventFilter.Num()))
                    {
                        int local_27 = local_7;
                        int local_11_2 = 1;
                        local_7 = (local_27 | (local_11_2 << local_25));
                    }
                }
            }
            ModifyOrAdd local_32;
            FC_PropEcologyEventToESMTriggerFilterRuntime& local_34 = local_32.opCall();
            if (local_34)
            {
                local_34.SetActivatedIndexMask(int8(local_7));
            }
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
}

class UESMAction_ActivateGlobalLevelEventToESMTriggerFilter : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bAllActivated = true;
    UPROPERTY()
    TArray<int> SpecificIndices;


    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        int local_8 = 0;
        int local_7 = local_8;
        if (local_6)
        {
            if (this.bAllActivated)
            {
                int local_11 = 1 << local_6.GlobalLevelEventFilter.Num();
                local_7 = (local_11 - 1);
            }
            else
            {
                for (auto local_25 : this.SpecificIndices)
                {
                    if (local_25 >= 0 && (local_25 < 8) && (local_25 < local_6.GlobalLevelEventFilter.Num()))
                    {
                        int local_27 = local_7;
                        int local_11_2 = 1;
                        local_7 = (local_27 | (local_11_2 << local_25));
                    }
                }
            }
            ModifyOrAdd local_32;
            FC_GlobalLevelEventToESMTriggerFilterRuntime& local_34 = local_32.opCall();
            if (local_34)
            {
                local_34.SetActivatedIndexMask(int8(local_7));
            }
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
}

class UESMAction_ActivatePropMovementHitSceneEventToESMTriggerFilter : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bAllActivated = true;
    UPROPERTY()
    TArray<int> SpecificIndices;


    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        int local_8 = 0;
        int local_7 = local_8;
        if (local_6)
        {
            if (this.bAllActivated)
            {
                int local_11 = 1 << local_6.PropMovementHitSceneEventFilter.Num();
                local_7 = (local_11 - 1);
            }
            else
            {
                for (auto local_25 : this.SpecificIndices)
                {
                    if (local_25 >= 0 && (local_25 < 8) && (local_25 < local_6.PropMovementHitSceneEventFilter.Num()))
                    {
                        int local_27 = local_7;
                        int local_11_2 = 1;
                        local_7 = (local_27 | (local_11_2 << local_25));
                    }
                }
            }
            ModifyOrAdd local_32;
            FC_PropMovementHitSceneEventToESMTriggerFilterRuntime& local_34 = local_32.opCall();
            if (local_34)
            {
                local_34.SetActivatedIndexMask(int8(local_7));
            }
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
}

class UESMAction_ActivateDeathEventToESMTriggerFilter : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bAllActivated = true;
    UPROPERTY()
    TArray<int> SpecificIndices;


    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        int local_8 = 0;
        int local_7 = local_8;
        if (local_6)
        {
            if (this.bAllActivated)
            {
                int local_11 = 1 << local_6.DeathEventFilter.Num();
                local_7 = (local_11 - 1);
            }
            else
            {
                for (auto local_25 : this.SpecificIndices)
                {
                    if (local_25 >= 0 && (local_25 < 8) && (local_25 < local_6.DeathEventFilter.Num()))
                    {
                        int local_27 = local_7;
                        int local_11_2 = 1;
                        local_7 = (local_27 | (local_11_2 << local_25));
                    }
                }
            }
            ModifyOrAdd local_32;
            FC_DeathEventToESMTriggerFilterRuntime& local_34 = local_32.opCall();
            if (local_34)
            {
                local_34.SetActivatedIndexMask(int8(local_7));
            }
            return;
        }
        XError(ELog(4), FString("Cannot get FC_EventToESMTriggerFilterConfig but trying to activate DeathEventToESMTriggerFilter. Might not be enabled."));
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
}

class UESMAction_ActivateMovementEndEventToESMTriggerFilter : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bAllActivated = true;
    UPROPERTY()
    TArray<int> SpecificIndices;


    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        int local_8 = 0;
        int local_7 = local_8;
        if (local_6)
        {
            if (this.bAllActivated)
            {
                int local_11 = 1 << local_6.MovementEndEventToESMTriggerFilter.Num();
                local_7 = (local_11 - 1);
            }
            else
            {
                for (auto local_25 : this.SpecificIndices)
                {
                    if (local_25 >= 0 && (local_25 < 8) && (local_25 < local_6.MovementEndEventToESMTriggerFilter.Num()))
                    {
                        int local_27 = local_7;
                        int local_11_2 = 1;
                        local_7 = (local_27 | (local_11_2 << local_25));
                    }
                }
            }
            ModifyOrAdd local_32;
            FC_MovementEndEventToESMTriggerFilterRuntime& local_34 = local_32.opCall();
            if (local_34)
            {
                local_34.SetActivatedIndexMask(int8(local_7));
            }
            return;
        }
        XError(ELog(4), FString("Cannot get FC_EventToESMTriggerFilterConfig but trying to activate MovementEndEventToESMTriggerFilter. Might not be enabled."));
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
}

class UESMAction_ActivateGameAttributeChangedEventToESMTriggerFilter : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bAllActivated = true;
    UPROPERTY()
    TArray<int> SpecificIndices;


    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        int local_8 = 0;
        int local_7 = local_8;
        if (local_6)
        {
            if (this.bAllActivated)
            {
                int local_11 = 1 << local_6.GameAttributeChangedEventToESMTriggerFilter.Num();
                local_7 = (local_11 - 1);
            }
            else
            {
                for (auto local_25 : this.SpecificIndices)
                {
                    if (local_25 >= 0 && (local_25 < 8) && (local_25 < local_6.GameAttributeChangedEventToESMTriggerFilter.Num()))
                    {
                        int local_27 = local_7;
                        int local_11_2 = 1;
                        local_7 = (local_27 | (local_11_2 << local_25));
                    }
                }
            }
            ModifyOrAdd local_32;
            FC_GameAttributeChangedEventToESMTriggerFilterRuntime& local_34 = local_32.opCall();
            if (local_34)
            {
                local_34.SetActivatedIndexMask(int8(local_7));
            }
            return;
        }
        XError(ELog(4), FString("Cannot get FC_EventToESMTriggerFilterConfig but trying to activate GameAttributeChangedEventToESMTriggerFilter. Might not be enabled."));
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Remove local_4;
        local_4.opCall();
        return;
    }
}

