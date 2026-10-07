

class UESMAction_OverrideVelocity : UESMBPBaseInstantAction
{
    UPROPERTY()
    bool bIsLocalSpace = true;
    UPROPERTY()
    bool bOverrideX = false;
    UPROPERTY()
    bool bIsAbsoluteValueX = false;
    UPROPERTY()
    FESMBBVar_Float XValue = 1.0f;
    UPROPERTY()
    bool bOverrideY = false;
    UPROPERTY()
    bool bIsAbsoluteValueY = false;
    UPROPERTY()
    FESMBBVar_Float YValue = 1.0f;
    UPROPERTY()
    bool bOverrideZ = false;
    UPROPERTY()
    bool bIsAbsoluteValueZ = false;
    UPROPERTY()
    FESMBBVar_Float ZValue = 1.0f;
    UPROPERTY()
    bool bDeferred = false;


    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Movement;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        float32 local_19 = 0.0f;
        int local_22 = 0;
        int local_28 = 0;
        float32 local_51 = 0.0f;
        float local_60;
        if (!((this.bOverrideX || this.bOverrideY) || this.bOverrideZ))
        {
            return;
        }
        const FECSEntity& local_6 = Context.GetEntity();
        if (this.bDeferred)
        {
            FC_OverrideVelocityDeferred local_16;
            Assign local_10;
            FC_OverrideVelocityDeferred& local_18 = local_10.opCall(local_16);
            if (local_18)
            {
                local_18.SetbIsLocalSpace(this.bIsLocalSpace);
                local_18.SetbOverrideX(this.bOverrideX);
                local_18.SetbOverrideY(this.bOverrideY);
                local_18.SetbOverrideZ(this.bOverrideZ);
                local_18.SetbIsAbsoluteValueX(this.bIsAbsoluteValueX);
                local_18.SetbIsAbsoluteValueY(this.bIsAbsoluteValueY);
                local_18.SetbIsAbsoluteValueZ(this.bIsAbsoluteValueZ);
                if (this.bOverrideX)
                {
                    local_18.GetModify_Velocity().X = local_19;
                }
                if (this.bOverrideY)
                {
                    local_18.GetModify_Velocity().Y = local_19;
                }
                if (this.bOverrideZ)
                {
                    local_18.GetModify_Velocity().Z = local_19;
                }
            }
            return;
        }
        if (!(local_22))
        {
            return;
        }
        if (!(local_28))
        {
            return;
        }
        FVector local_50;
        if (this.bIsLocalSpace)
        {
            local_50 = local_28.GetRotation().UnrotateVector(local_22.GetVelocity());
        }
        else
        {
            local_50 = local_22.GetVelocity();
        }
        if (this.bOverrideX)
        {
            float local_58;
            if (this.bIsAbsoluteValueX)
            {
                local_58 = local_19;
            }
            else
            {
                local_58 = local_50.X * local_51;
            }
            local_50.X = local_58;
        }
        if (this.bOverrideY)
        {
            if (this.bIsAbsoluteValueY)
            {
                local_60 = local_51;
            }
            else
            {
                local_60 = local_50.Y * local_19;
            }
            local_50.Y = local_60;
        }
        if (this.bOverrideZ)
        {
            float local_58;
            if (this.bIsAbsoluteValueZ)
            {
                local_58 = local_19;
            }
            else
            {
                local_58 = local_50.Z * local_51;
            }
            local_50.Z = local_58;
        }
        FVector local_44;
        if (this.bIsLocalSpace)
        {
            local_44 = local_28.GetRotation().RotateVector(local_50);
        }
        else
        {
            local_44 = local_50;
        }
        local_22.SetVelocity(local_44);
        Modify local_64;
        FC_CharacterMovementControl& local_66 = local_64.opCall();
        if (local_66)
        {
            local_66.SetInternalVelocity(local_22.GetVelocity());
        }
        return;
    }
}

