

class US_ConditionPublicEventCompleteSystem : UECSScriptSystem
{
    US_ConditionPublicEventCompleteSystem()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_HandlePublicEventCompleted(const FCE_LevelPublicEventCompleted &inout Event, const FCS_LocalConditionSubscriptionManager &inout SubscriptionManager) const
    {
        int local_10 = 0;
        const FLocalConditionInstanceData& local_134;
        if (Event.TriggeredPlayers.IsEmpty())
        {
            return;
        }
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        bool local_1 = !(local_10);
        if (local_1)
        {
            return;
        }
        TSet<FECSEntity> local_30;
        for (auto& local_44 : Event.TriggeredPlayers)
        {
            local_1 = !(local_44.IsValid());
            if (local_1)
            {
                continue;
            }
            local_30.Add(local_44);
        }
        for (auto& local_58 : SubscriptionManager.GetHandleList(UConditionPublicEventComplete, NAME_None).ConditionInstances)
        {
            TDataObjectPtr<FLevelPublicEventInfoConfig> local_82 = this.GetEventInfoFilter(local_58);
            if (!(local_82.IsSet()))
            {
                local_1 = false;
            }
            else
            {
                FDataObjectPtr local_130;
                local_130;
                local_1 = !((local_82 == local_130));
            }
            if (local_1)
            {
                continue;
            }
            int local_132 = local_58.GetLocalConditionInstanceID();
            if (!(local_134.IsValid()))
            {
                continue;
            }
            if (!(local_30.Contains(local_134.GetContextEntity())))
            {
                continue;
            }
            ::ConditionUtils::SetLocalConditionValueForInstance(local_58, (::ConditionUtils::GetCurrentValue(local_58) + 1));
        }
        return;
    }
    TDataObjectPtr<FLevelPublicEventInfoConfig> GetEventInfoFilter(const FConditionInstanceHandle &inout Handle) const
    {
        if ((int(Handle.GetLocalConditionType())) != 1)
        {
            XError(ELog(58), FString().Append("GetEventInfoFilter: condition handle is not a Single local condition, LocalConditionType=").Append(Handle.GetLocalConditionType()));
            return TDataObjectPtr<FLevelPublicEventInfoConfig>();
        }
        TDataObjectPtr<FConditionConfigBase> local_82 = Handle.GetConditionConfig();
        CastTo local_86;
        TDataObjectPtr<FLocalConditionConfig> local_110 = local_86.opCall();
        if (local_110)
        {
            if (FInstancedStruct::GetPtr(local_110.opArrow().ConditionTypeDefineConfig).opCall())
            {
            }
            else
            {
            }
        }
        return TDataObjectPtr<FLevelPublicEventInfoConfig>();
    }
    UFUNCTION()
    void Run_ServerJob_HandlePublicEventCompleted() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        TECSEventConstIterator<FCE_LevelPublicEventCompleted> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_LevelPublicEventCompleted& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.ServerJob_HandlePublicEventCompleted(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

