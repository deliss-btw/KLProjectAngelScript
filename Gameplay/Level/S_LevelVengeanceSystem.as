

class US_LevelVengeanceAS : UECSScriptSystem
{
    US_LevelVengeanceAS()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_UpdatVengenceStart(const FCE_VengeanceStart &inout Event) const
    {
        int local_24 = 0;
        int local_32 = 0;
        FECSWorldPtr local_2 = this.GetECSWorld();
        FCE_ShowSignalHint local_8;
        local_8.SignalType = EPlayerSignalType(3);
        local_8.TargetEntity = Event.Killer;
        local_8.SetbPredictable(false);
        ::FASCommonUtils::GetUniquePlayerEntity(Event.Sender);
        local_24.Killer = Event.Killer;
        if (!((Event.Killer == ENTITY_NULL)) && Event.Killer.IsActive())
        {
            local_32.AddVictim(Event.Sender, Event.Killer);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_UpdateVengenceDeath(const FCE_DeathEvent &inout DeathEvent) const
    {
        FCE_VengeanceSuccess local_52;
        Get local_4;
        const FC_VengeanceKiller& local_6 = local_4.opCall();
        if (local_6)
        {
            FCE_VengeanceSuccess local_28;
            FECSEntity local_16 = FECSEntity(DeathEvent.KilledByEntity);
            UEASAbility::GetContextECSWorld();
            ECS::GetContextTime();
            local_28.Killer = DeathEvent.Sender;
            local_28.KilledByEntity = local_16;
            local_28.bIsSenderKill = true;
            bool local_7 = false;
            local_28.SetbPredictable(local_7);
            for (auto& local_46 : local_6.KillDataMap)
            {
                local_46;
                ::FASCommonUtils::GetUniquePlayerEntity(local_16);
                if (local_7)
                {
                    continue;
                }
                ECS::GetContextTime();
                local_52.Killer = DeathEvent.Sender;
                local_52.KilledByEntity = local_16;
                local_52.bIsSenderKill = false;
                local_52.SetbPredictable(false);
            }
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_UpdatVengenceStart() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_VengeanceStart> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_VengeanceStart& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_UpdatVengenceStart(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_UpdateVengenceDeath() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DeathEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DeathEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_UpdateVengenceDeath(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

