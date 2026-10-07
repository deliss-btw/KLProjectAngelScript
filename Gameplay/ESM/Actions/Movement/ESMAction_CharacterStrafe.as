

class UESMAction_CharacterStrafe : UESMBPBaseSpanAction
{
    UPROPERTY()
    bool bLimitStrafeTurnSpeed = true;
    UPROPERTY()
    bool bOverrideMaxTurnSpeed = false;
    UPROPERTY()
    float32 MaxTurnSpeed = 180.0f;


    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Movement;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Modify local_4;
        FC_CharacterPoseState& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetStrafeWeightTarget(1.0f);
            local_6.SetbLimitStrafeTurnSpeed(this.bLimitStrafeTurnSpeed);
            local_6.SetStrafeMaxTurnSpeed(this.GetMaxTurnSpeed(Context));
        }
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        Modify local_4;
        FC_CharacterPoseState& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetStrafeWeightTarget(0.0f);
            local_6.SetKeepStrafeRemainTime(0.0f);
            local_6.SetbLimitStrafeTurnSpeed(false);
        }
        return;
    }
    UFUNCTION()
    int GetActionPriority_Implementation() const
    {
        return -1;
    }
    float32 GetMaxTurnSpeed(const FESMContext &inout Context) const
    {
        float32 local_2 = 0.0f;
        if (this.bOverrideMaxTurnSpeed)
        {
            return this.MaxTurnSpeed;
        }
        Get local_6;
        const FC_CharacterMovementConfig& local_8 = local_6.opCall();
        if (local_8)
        {
            if (TDataObjectPtr<FDTCharacterMovementConfig>(local_8.ConfigDataKey).IsSet())
            {
                return local_2;
            }
        }
        XError(ELog(11), FString().Append("No valid MaxTurnSpeed found for entity [").Append(Context.GetEntity().GetIdValue()).Append("], using default value [180.0f]."));
        return 180.0f;
    }
}

