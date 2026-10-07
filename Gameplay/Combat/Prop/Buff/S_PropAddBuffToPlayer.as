

struct FBuffConfigRefSet
{
    UPROPERTY()
    TSet<FBuffConfigRef> BuffConfigRefSet;

    FBuffConfigRefSet()
    {
        return;
    }
}

class US_PropAddBuffToPlayer : UECSScriptSystem
{
    US_PropAddBuffToPlayer()
    {
        return;
    }
    void AddBuffToPlayers(const FVector &inout Position, const float32 PlayerDetectSphereRadius, const TArray<FPropAddBuffConfigItem> &inout AddBuffConfigs, const FECSEntity &inout TriggerPlayer, const FECSEntity &inout BuffConfigSourceEntity, const FFPTime &inout FixedTime) const
    {
        int local_84 = 0;
        TArray<FECSEntity> local_6 = ::FASCommonUtils::GetAllPlayerPawnEntitiesInRange(Position, PlayerDetectSphereRadius, false);
        for (auto& local_44 : AddBuffConfigs)
        {
            TArray<FECSEntity> local_48;
            for (auto& local_62 : local_6)
            {
                if (local_44.bOnlyToSelf)
                {
                    if ((int(::FASCommonUtils::GetEntityFactionRelationSplitSelf(TriggerPlayer, local_62))) == 8)
                    {
                        local_48.Add(local_62);
                    }
                    continue;
                }
                if (local_44.bToSelfAndTeammates)
                {
                    if (::FTeamUtils::IsInSameTeam(TriggerPlayer, local_62))
                    {
                        local_48.Add(local_62);
                    }
                    continue;
                }
                if (local_44.bToSelfAndFriendFaction)
                {
                    if (int(::FASCommonUtils::GetEntityFactionRelation(TriggerPlayer, local_62)) == 4)
                    {
                        local_48.Add(local_62);
                    }
                }
            }
            for (auto& local_62 : local_48)
            {
                for (auto& local_80 : local_44.BuffConfigs)
                {
                    FECSEntityId local_81 = local_62.GetId();
                    if (!(local_84.Contains(local_80.BuffConfig)))
                    {
                        FBuffUtils::AddBuff(local_62, local_80.BuffConfig, FixedTime, BuffConfigSourceEntity, false, local_80.OverrideDuration, int(local_80.AddStackNum), false);
                        local_84.Add(local_80.BuffConfig);
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandlePropAddBuffToPlayerEvent(const FCE_PropAddBuffToPlayerEvent &inout Event, const FCS_FixedTime &inout FixedTime) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    UFUNCTION()
    void Run_ServerJob_HandlePropAddBuffToPlayerEvent() const
    {
        int local_6 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PropAddBuffToPlayerEvent> local_40 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_40.CanProceed;)
        {
            const FCE_PropAddBuffToPlayerEvent& local_64 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_65 = FECSEntityScopeCycleCounter(local_64.Sender);
            ECSInternal::PushContextTime(local_64.GetHandleTime());
            this.ServerJob_HandlePropAddBuffToPlayerEvent(local_64, local_6);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

