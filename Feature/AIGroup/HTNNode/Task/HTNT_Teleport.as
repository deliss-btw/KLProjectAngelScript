

class UHTNT_Teleport : UHTNTask_ECSScriptBase
{
    UPROPERTY()
    bool bUseTargetEntityAsLocation;
    UPROPERTY()
    FAISmart_EntityId TeleportTargetEntity;
    UPROPERTY()
    FAISmart_Vector TargetLocation;
    UPROPERTY()
    FGameplayTagContainer TeleportBlockedTags;
    UPROPERTY()
    bool bTurnToSpecifiedLocationAfterTeleport;
    UPROPERTY()
    bool bTurnToEntity;
    UPROPERTY()
    FAISmart_EntityId TargetEntity;
    UPROPERTY()
    FAISmart_Vector TurnToLocation;

    default SetNodeName("Teleport");

    UHTNT_Teleport()
    {
        return;
    }
    UFUNCTION()
    void Execute_Implementation(const FHTNContext &inout Context)
    {
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        if (!(local_4.IsValid()))
        {
            this.FinishExecuteWithContext(Context, false);
            return;
        }
        FECSEntity local_14 = this.GetTeleportExecutionEntity(local_4);
        if (this.IsCurrentlyTeleporting(local_4) || (!((local_14 == local_4)) && this.IsCurrentlyTeleporting(local_14)))
        {
            this.FinishExecuteWithContext(Context, true);
            return;
        }
        if (this.IsTeleportBlocked(local_4) || (!((local_14 == local_4)) && this.IsTeleportBlocked(local_14)))
        {
            return;
        }
        this.TryTeleportAndFinish(Context, local_4);
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FHTNContext &inout Context, const float32 DeltaSeconds)
    {
        FECSEntity local_4 = FECSEntity(Context.PawnEntity);
        if (!(local_4.IsValid()))
        {
            this.FinishExecuteWithContext(Context, false);
            return;
        }
        FECSEntity local_14 = this.GetTeleportExecutionEntity(local_4);
        if (this.IsCurrentlyTeleporting(local_4) || (!((local_14 == local_4)) && this.IsCurrentlyTeleporting(local_14)))
        {
            this.FinishExecuteWithContext(Context, true);
            return;
        }
        if (this.IsTeleportBlocked(local_4) || (!((local_14 == local_4)) && this.IsTeleportBlocked(local_14)))
        {
            return;
        }
        this.TryTeleportAndFinish(Context, local_4);
        return;
    }
    void TryTeleportAndFinish(const FHTNContext &inout Context, const FECSEntity &inout SelfEntity)
    {
        this.PerformTeleport(Context, SelfEntity);
        this.FinishExecuteWithContext(Context, true);
        return;
    }
    bool IsCurrentlyTeleporting(const FECSEntity &inout Entity) const
    {
        int local_6 = 0;
        int local_12 = 0;
        int local_2 = this.GetMainStateMachineIndex(Entity);
        if (local_2 < 0)
        {
            return false;
        }
        if (local_2 >= local_6.Player.GetSMRuntime().Num())
        {
            return false;
        }
        UESMStateMachine local_20 = local_12.Asset.GetStateMachine(local_2);
        if (local_20 == nullptr)
        {
            return false;
        }
        UESMBaseState local_24 = local_20.GetBaseState(local_6.Player.GetSMRuntime()[].GetStateIndex());
        return local_24 != nullptr && (local_24.GetDataName() == n"TeleportArea");
    }
    bool IsTeleportBlocked(const FECSEntity &inout Entity) const
    {
        return !(this.TeleportBlockedTags.IsEmpty()) && Entity.MatchAnyGameplayTags(this.TeleportBlockedTags);
    }
    FECSEntity GetTeleportExecutionEntity(const FECSEntity &inout SelfEntity) const
    {
        Get local_4;
        const FC_PawnRiddingMount& local_6 = local_4.opCall();
        if (local_6)
        {
            if (local_6.IsDriver() && local_6.GetMountEntity().IsValid())
            {
                return local_6.GetMountEntity();
            }
        }
        Get local_12;
        const FC_MountMoveAgentData& local_14 = local_12.opCall();
        if (local_14)
        {
            if (local_14.GetbIsDriver() && local_14.GetMountEntity().IsValid())
            {
                return local_14.GetMountEntity();
            }
        }
        return SelfEntity;
    }
    void KickPassengersOffMount(const FECSEntity &inout MountEntity) const
    {
        Get local_4;
        const FC_RuntimeMountSeatInfo& local_6 = local_4.opCall();
        if (local_6)
        {
            TArray<FECSEntity> local_12;
            int local_13 = 1;
            for (; local_13 < local_6.GetRiddenByEntities().Num(); ++local_13)
            {
                FECSEntity local_20 = FECSEntity(local_6.GetRiddenByEntities()[local_13]);
                if (local_20.IsValid())
                {
                    local_12.Add(local_20);
                }
            }
            for (auto& local_34 : local_12)
            {
                ::FMountUtils::EndMountAsPassenger(local_34, ECS::GetContextTime());
            }
        }
        return;
    }
    void TeleportMountEntityDirectly(const FECSEntity &inout MountEntity, const FVector &inout Location, const FRotator &inout Rotation) const
    {
        MountEntity.TeleportTo(Location, Rotation.Quaternion(), FFPTime(-1));
        Modify local_16;
        FC_CharacterMovementControl& local_18 = local_16.opCall();
        if (local_18)
        {
            local_18.SetDesiredRotation(Rotation);
        }
        return;
    }
    void PerformTeleport(const FHTNContext &inout Context, const FECSEntity &inout SelfEntity)
    {
        GetDefaulted local_24;
        FVector local_6;
        if (this.bUseTargetEntityAsLocation)
        {
            if (FECSEntity(this.TeleportTargetEntity.GetValue(Context.opImplConv())).IsValid())
            {
                local_6 = local_24.opCall().GetPosition();
            }
            else
            {
                local_6 = local_24.opCall().GetPosition();
            }
        }
        else
        {
            local_6 = this.TargetLocation.GetValue(Context.opImplConv());
        }
        FRotator local_42 = local_24.opCall().GetRotation().Rotator();
        if (this.bTurnToSpecifiedLocationAfterTeleport)
        {
            FVector local_48 = local_6;
            if (this.bTurnToEntity)
            {
                if (FECSEntity(this.TargetEntity.GetValue(Context.opImplConv())).IsValid())
                {
                    local_48 = local_24.opCall().GetPosition();
                }
            }
            else
            {
                local_48 = this.TurnToLocation.GetValue(Context.opImplConv());
            }
            FVector local_30 = (local_48 - local_6);
            local_30.Z = 0.0;
            if (!(local_30.IsNearlyZero(9.999999747378752e-5)))
            {
                local_42 = local_30.Rotation();
            }
        }
        FECSEntity local_20 = this.GetTeleportExecutionEntity(SelfEntity);
        if ((!((local_20 == SelfEntity))))
        {
            this.KickPassengersOffMount(local_20);
            this.TeleportMountEntityDirectly(local_20, local_6, local_42);
        }
        else
        {
            ::FASCommonUtils::TeleportEntityToTransform(local_20, local_6, local_42);
        }
        FName local_58(n"TeleportArea");
        if (this.MainSMHasState(local_20, local_58))
        {
            FESMExternalTransitHandle local_68 = local_20.ESMExternalTransitMainSM(local_58, n"HTNT_Teleport");
        }
        return;
    }
    bool MainSMHasState(const FECSEntity &inout Entity, const FName &inout StateName) const
    {
        int local_6 = 0;
        int local_2 = this.GetMainStateMachineIndex(Entity);
        if (local_2 < 0)
        {
            return false;
        }
        UESMStateMachine local_14 = local_6.Asset.GetStateMachine(local_2);
        return local_14 != nullptr && (local_14.GetBaseStateByName(StateName) != nullptr);
    }
    int GetMainStateMachineIndex(const FECSEntity &inout Entity) const
    {
        int local_2 = 0;
        UESMAsset local_8 = local_2.Asset;
        if (local_8 == nullptr)
        {
            return -1;
        }
        int local_11 = 0;
        while (true)
        {
            UESMStateMachine local_16 = local_2.Asset.GetStateMachine(local_11);
            if (local_16 == nullptr)
            {
                break;
            }
            if ((local_16.GetDataName() == n"MainSM"))
            {
                return local_11;
            }
            local_11 = local_11 + 1;
        }
        return -1;
    }
}

