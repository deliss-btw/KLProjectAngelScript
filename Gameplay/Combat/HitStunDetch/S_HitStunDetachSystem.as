
const FConsoleVariable CVar_Damage_HitStunDetach = FConsoleVariable();

class US_HitStunDetachSystem : US_ECSScriptGameModeSystemBase
{
    US_HitStunDetachSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_ProcessHitStunDetachState(const FECSEntity &inout Entity, FC_HitStunDetach &inout HitStunDetch) const
    {
        bool local_8;
        UDamageSettings local_2 = ::DamageSettings::Get();
        if (local_2 == nullptr)
        {
            return;
        }
        if (HitStunDetch.GetAccumulatedDetachValue() > 0.0f && !(HitStunDetch.GetbInMaxMaintainState()))
        {
            local_8 = FGameplayTagsUtils::MatchAll(Entity, local_2.HitStunTags);
            if (!(local_8))
            {
                HitStunDetch.SetAccumulatedDetachValue(0.0f);
                HitStunDetch.SetbInMaxMaintainState(false);
            }
        }
        if (!(HitStunDetch.GetbInMaxMaintainState()))
        {
            return;
        }
        local_8 = false;
        if (!(local_2.HitTags.IsEmpty()))
        {
            local_8 = FGameplayTagsUtils::MatchAll(Entity, local_2.HitTags);
        }
        if (!(local_8))
        {
            HitStunDetch.SetbInMaxMaintainState(false);
            HitStunDetch.SetAccumulatedDetachValue(0.0f);
        }
        return;
    }
    UFUNCTION()
    void Job_AddDetachOnDamageResolved(FCE_DamageEvent &inout Event) const
    {
        bool local_1;
        int local_18 = 0;
        int local_44 = 0;
        if (!(CVar_Damage_HitStunDetach.GetBool()))
        {
            return;
        }
        FECSEntity local_6 = Event.Receiver;
        FECSWorldPtr local_8 = local_6.GetWorld();
        Has local_12;
        if (!(local_12.opCall()))
        {
            return;
        }
        FECSWorldPtr local_8_2 = local_6.GetWorld();
        if ((int(local_18.GetGameModeType())) == 0)
        {
            return;
        }
        Has local_26;
        if (local_26.opCall())
        {
            local_1 = true;
        }
        else
        {
            Has local_30;
            local_1 = local_30.opCall();
        }
        if (local_1)
        {
            return;
        }
        UDamageSettings local_34 = ::DamageSettings::Get();
        if (local_34.HitStunDetachMax <= 0.0f)
        {
            return;
        }
        if (local_44.GetbInMaxMaintainState())
        {
            return;
        }
        if ((int(Event.DamageProcedureType)) != 0)
        {
            return;
        }
        if (!(Event.AttackData))
        {
            return;
        }
        FAttackData local_48;
        float32 local_49 = local_48.CustomHitStunDetach;
        if (local_49 <= 0.0f)
        {
            local_49 = local_34.GetHitStunDetach(EAttackDataHitState(local_48.HitLevel));
        }
        if (local_49 <= 0.0f)
        {
            return;
        }
        local_44.SetAccumulatedDetachValue((local_44.GetAccumulatedDetachValue() + local_49));
        if (local_44.GetAccumulatedDetachValue() >= local_34.HitStunDetachMax)
        {
            local_44.SetAccumulatedDetachValue(local_34.HitStunDetachMax);
            local_44.SetbInMaxMaintainState(true);
        }
        return;
    }
    void ResetHitStunDetach(const FECSEntity &inout Entity) const
    {
        Modify local_4;
        FC_HitStunDetach& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetAccumulatedDetachValue(0.0f);
            local_6.SetbInMaxMaintainState(false);
        }
        return;
    }
    UFUNCTION()
    void Job_ClearOnDeath(const FCE_DeathEvent &inout Event) const
    {
        this.ResetHitStunDetach(Event.Sender);
        return;
    }
    UFUNCTION()
    void Job_ClearOnNearDeath(const FCE_NearDeathEvent &inout Event) const
    {
        this.ResetHitStunDetach(Event.Sender);
        return;
    }
    UFUNCTION()
    void Run_Job_ProcessHitStunDetachState() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_174 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.Job_ProcessHitStunDetachState(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        local_88.opCall();
        Include local_96;
        local_96.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_84.Iterator();
        for (; local_136.CanProceed;)
        {
            local_36 = local_136.Proceed();
            ++local_102;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_ProcessHitStunDetachState(local_174, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_102);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_AddDetachOnDamageResolved() const
    {
        ECS::GetContextJob();
        TECSEventIterator<FCE_DamageEvent> local_36 = FECSWorldPtr::PatchEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            FCE_DamageEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_AddDetachOnDamageResolved(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ClearOnDeath() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DeathEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DeathEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_ClearOnDeath(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_ClearOnNearDeath() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_NearDeathEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_NearDeathEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_ClearOnNearDeath(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

