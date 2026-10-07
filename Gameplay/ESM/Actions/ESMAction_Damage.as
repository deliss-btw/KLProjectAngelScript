

class UESMAction_DirectDamage : UESMBPBaseInstantAction
{
    UPROPERTY()
    FDataObjectPtr AttackDataConfig;
    UPROPERTY()
    EESMActionTargetType TargetType = EESMActionTargetType(2);
    UPROPERTY()
    FNameHandle_EntityBBVarEntity TargetEntityBBVar;


    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        FString local_4 = "Unknown";
        if (int(this.TargetType) == 0)
        {
            local_4 = "Self";
        }
        else
        {
            if (int(this.TargetType) == 1)
            {
                local_4 = "InteractTarget";
            }
            else
            {
                if (int(this.TargetType) == 2)
                {
                    local_4 = "LockTarget";
                }
                else
                {
                    if (int(this.TargetType) == 3)
                    {
                        local_4 = FString().Append("BB:").Append(this.TargetEntityBBVar.Name);
                    }
                }
            }
        }
        return FString().Append("Direct Damage -> ").Append(local_4);
    }
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
        if (!(local_4.IsValid()) || !(ECS::IsAuthorityOrPrediction(local_4)))
        {
            return;
        }
        if (::FCombatUtils::GetAttackDataPtrFromDataTable(this.AttackDataConfig, Context.GetEntity()))
        {
            ::FDamageUtils::AddDirectDamageByAttackData(Context.GetEntity(), Context.GetEntity(), local_4, Time.WorldTime);
        }
        return;
    }
}

