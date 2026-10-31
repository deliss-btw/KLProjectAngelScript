class UGOAPAction_EcosimAIV2_DoInteractToBelongingTarget : UGOAP_ActionScriptableBase
{
    UPROPERTY()
    FDataObjectPtr InteractConfig;
    UPROPERTY()
    FString InteractSourceEcosimAIV2EntityMark;
    UPROPERTY()
    FString TargetEcosimAIV2EntityMark;
    FECSEntity InteractSourceEntity;
    FECSEntity BelongingEntity;
    int InteractPointIndex = -1;
    bool bExecutingInteract = false;

    UFUNCTION()
    void WhenActionActivated_Implementation()
    {
        return;
    }
    UFUNCTION()
    void WhenActionTick_Implementation(const float32 DeltaSeconds)
    {
        UECSGOAPEcosimAIV2InstanceBase local_2 = (Cast<UECSGOAPEcosimAIV2InstanceBase>(this.GetOuter()));
        FECSEntity local_10 = local_2.Entity;
        if (this.InteractPointIndex < 0)
        {
            int local_21;
            Get local_18;
            const FC_InteractionTargetConfig& local_20 = local_18.opCall();
            if (local_20)
            {
                local_21 = 0;
                for (; local_21 < local_20.InteractionPoints.Num(); ++local_21)
                {
                    if ((local_20.InteractionPoints[local_21].PointType.GetDataName() == this.InteractConfig.GetDataName()))
                    {
                        this.InteractPointIndex = local_21;
                        break;
                    }
                }
            }
        }
        if (this.InteractPointIndex >= 0)
        {
            int local_21;
            FVector local_32;
            FQuat local_40;
            local_21 = this.InteractPointIndex;
            if (::FInteractUtils::GetInteractTargetLocationAndRotation(this.BelongingEntity, local_21, ECS::GetContextTime(), local_32, local_40, false))
            {
                if (::FEcosimAIV2Utils::IsEntityReachTargetLocation(local_10, local_32, 100.0f))
                {
                    if (!(this.bExecutingInteract))
                    {
                        ::FEcosimAIV2Utils::StopEntityMoveToTargetLocation(local_10);
                        FInteractionPointAndBehaviorIndex local_46;
                        local_46.SetPointIndex(local_21);
                        local_46.SetBehaviorIndex(0);
                        ::FInteractUtils::ExecuteInteractBeginAction(this.InteractSourceEntity, this.BelongingEntity, local_46);
                        this.bExecutingInteract = true;
                        return;
                    }
                    Has local_50;
                    if (!(local_50.opCall()))
                    {
                        this.FinishAction(true);
                    }
                    return;
                }
                ::FEcosimAIV2Utils::SetEntityMoveToTargetLocation(local_10, local_32);
                return;
            }
        }
        this.FinishAction(false);
        return;
    }
    UFUNCTION()
    void WhenActionAborted_Implementation()
    {
        this.FinishAbort();
        return;
    }
    UFUNCTION()
    void WhenActionDeactivated_Implementation()
    {
        return;
    }
}

class UGOAPAction_EcosimAIV2_DoNothing : UGOAP_ActionScriptableBase
{
    UGOAPAction_EcosimAIV2_DoNothing()
    {
        return;
    }
    UFUNCTION()
    void WhenActionActivated_Implementation()
    {
        this.FinishAction(true);
        return;
    }
    UFUNCTION()
    void WhenActionTick_Implementation(const float32 DeltaSeconds)
    {
        this.FinishAction(true);
        return;
    }
    UFUNCTION()
    void WhenActionAborted_Implementation()
    {
        this.FinishAbort();
        return;
    }
    UFUNCTION()
    void WhenActionDeactivated_Implementation()
    {
        return;
    }
}

class UGOAPAction_EcosimAIV2_MoveToTeamTarget : UGOAP_ActionScriptableBase
{
    UGOAPAction_EcosimAIV2_MoveToTeamTarget()
    {
        return;
    }
    UFUNCTION()
    void WhenActionActivated_Implementation()
    {
        UECSGOAPEcosimAIV2InstanceBase local_2 = (Cast<UECSGOAPEcosimAIV2InstanceBase>(this.GetOuter()));
        FECSEntity local_10 = local_2.Entity;
        Get local_14;
        if (local_14.opCall())
        {
            Modify local_22;
            FC_EcosimAIV2Team& local_24 = local_22.opCall();
            if (local_24)
            {
                local_24.RequestMove(local_10);
                return;
            }
        }
        this.FinishAction(false);
        return;
    }
    UFUNCTION()
    void WhenActionTick_Implementation(const float32 DeltaSeconds)
    {
        UECSGOAPEcosimAIV2InstanceBase local_2 = (Cast<UECSGOAPEcosimAIV2InstanceBase>(this.GetOuter()));
        FECSEntity local_10 = local_2.Entity;
        Get local_14;
        if (local_14.opCall())
        {
            Get local_22;
            const FC_EcosimAIV2Team& local_24 = local_22.opCall();
            if (local_24)
            {
                FEcosimaiV2TeamMoveContext local_36;
                if (local_24.GetMoveContext(local_10, local_36))
                {
                    FVector local_42 = local_36.TargetLocation;
                    if (::FEcosimAIV2Utils::IsEntityReachTargetLocation(local_10, local_42, 100.0f))
                    {
                        return;
                    }
                    ::FEcosimAIV2Utils::SetEntityMoveToTargetLocation(local_10, local_42);
                    return;
                }
            }
        }
        this.FinishAction(false);
        return;
    }
    UFUNCTION()
    void WhenActionAborted_Implementation()
    {
        this.FinishAbort();
        return;
    }
    UFUNCTION()
    void WhenActionDeactivated_Implementation()
    {
        UECSGOAPEcosimAIV2InstanceBase local_2 = (Cast<UECSGOAPEcosimAIV2InstanceBase>(this.GetOuter()));
        FECSEntity local_10 = local_2.Entity;
        Get local_14;
        if (local_14.opCall())
        {
            Modify local_22;
            FC_EcosimAIV2Team& local_24 = local_22.opCall();
            if (local_24)
            {
                local_24.QuitMove(local_10);
                return;
            }
        }
        return;
    }
}

