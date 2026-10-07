
enum ENextEntityType
{
    NextCharacter,
    EntityBB,
}


class UESMAction_PlayerSwitchIn : UESMBPBaseInstantAction
{
    UPROPERTY()
    ENextEntityType NextEntityType = ENextEntityType(0);
    UPROPERTY()
    FNameHandle_EntityBBVarEntity NextCharacterEntityBBVar;
    UPROPERTY()
    FName SwitchInStateMachineName;
    UPROPERTY()
    FName SwitchInStateName;


    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Combat;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_30 = 0;
        const FECSEntity& local_2 = Context.GetEntity();
        Has local_6;
        bool local_7 = local_6.opCall();
        if (local_7)
        {
            return;
        }
        FECSEntity local_12;
        if (int(this.NextEntityType) == 0)
        {
            local_12 = ::FSwitchPlayerUtils::SwitchToNextCharacter(local_2, Time.WorldTime);
        }
        else
        {
            if (int(this.NextEntityType) == 1)
            {
                FNameHandle_EntityBBVarEntity local_24;
                local_24;
                local_12 = Context.GetEntity().GetBB_Entity(local_24);
            }
        }
        if (!(local_12.IsValid()))
        {
            return;
        }
        local_12.MoveTo(local_30.GetPosition(), local_30.GetRotation(), FFPTime(-1));
        FESMExternalTransitHandle local_40 = local_12.ESMExternalTransit(this.SwitchInStateMachineName, this.SwitchInStateName, NAME_None);
        local_40.RequireInactiveExternalTick(Time.WorldTime);
        if (!(::FASCommonUtils::GetUniquePlayerEntity(local_2).IsValid()))
        {
            return;
        }
        Get local_56;
        const FC_SwitchPlayerConfig& local_58 = local_56.opCall();
        if (local_58)
        {
            ::FSwitchPlayerUtils::StartSwitchPlayerCD(local_12, Time.WorldTime, local_58.SwitchPlayerActionCD);
        }
        return;
    }
}

class UESMAction_SuperSwitchModeIn : UESMBPBaseInstantAction
{
    UESMAction_SuperSwitchModeIn()
    {
        return;
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        const FECSEntity& local_2 = Context.GetEntity();
        FECSEntity local_10 = ::FSwitchPlayerUtils::GetSwitchPlayerNextEntity(local_2);
        FGameAttributeUtils::Consume(local_2, Attribute::SwitchPlayerEnergy, local_2.GetWorld().GetFixedTime().Time, 100.0f);
        Get local_18;
        FGameAttributeUtils::Recover(local_2, Attribute::Stamina, local_2.GetWorld().GetFixedTime().Time, local_18.opCall().GetAttributeValue(Attribute::StaminaMax, local_10.GetWorld().GetFixedTime().Time) * 0.5f, -1.0f);
        return;
    }
}

