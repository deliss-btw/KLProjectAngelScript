

class US_ShieldSystem : UECSScriptSystem
{
    US_ShieldSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_UpdateShield(const FECSEntity &inout Entity, FC_Shield &inout Shield, const FCS_FixedTime &inout FixedTime) const
    {
        float32 local_26;
        if (FFPTime(Shield.GetDestroyTime()).opCmp(0.0) >= 0 && (FFPTime(Shield.GetDestroyTime()).opCmp(FixedTime.Time) <= 0))
        {
            ::FShieldUtils::DestoryShield(Entity, Shield, Shield.GetDestroyTime());
            return;
        }
        FShieldBaseData& local_10 = Shield.GetBaseData();
        if (Shield.GetbBroken() && local_10.GetbDestoryAfterBrokenNonRecoverable())
        {
            if (!(local_10.GetbRecoverAfterBroken()) || (local_10.GetbHasRecoverMaxCountAfterBroken() && (Shield.GetBrokenRecorverCount() == 0)))
            {
                ::FShieldUtils::DestoryShield(Entity, Shield, FixedTime.Time);
                return;
            }
        }
        if ((Shield.GetbShieldActive() && (FFPTime(Shield.GetDeactivateTime()).opCmp(0.0) >= 0)) && (FFPTime(Shield.GetDeactivateTime()).opCmp(FixedTime.Time) <= 0))
        {
            ::FShieldUtils::SetShieldActive(Shield, false, FixedTime.Time);
        }
        if (Shield.GetbShieldActive())
        {
            float32 local_23;
            if (Shield.GetbBroken())
            {
                float32 local_22;
                if ((local_10.GetbRecoverAfterBroken() && ((((FFPTime(Shield.GetLastBreakRecoverTime()) + FFPTime(local_10.GetRecoverCD_Broken()))).opCmp(FixedTime.Time) <= 0))) && (Shield.GetBrokenRecorverCount() != 0))
                {
                    float32 local_13 = Shield.GetShieldHP().Evaluate(FixedTime.Time);
                    float32 local_19 = Shield.GetShieldMaxHP().Evaluate(FixedTime.Time);
                    if (local_13 < local_19)
                    {
                        if (local_10.GetRecoverMaxPercent_Broken() > 0.0f)
                        {
                            local_23 = local_10.GetRecoverMaxPercent_Broken();
                        }
                        else
                        {
                            local_23 = 100.0f;
                        }
                        local_22 = local_23 * local_19;
                        local_23 = local_22 * 0.01f;
                        float32 local_24 = local_10.GetRecoverMaxValue_Broken();
                        if (local_24 > 0.0f && (local_23 > local_10.GetRecoverMaxValue_Broken()))
                        {
                            local_23 = local_10.GetRecoverMaxValue_Broken();
                        }
                        float32 local_21 = local_23 - local_13;
                        if (local_21 > 0.0f)
                        {
                            Shield.GetModify_ShieldHP().SetUpdated(local_13, local_23, FixedTime.Time);
                        }
                        Shield.SetBrokenRecorverCount((Shield.GetBrokenRecorverCount() - 1));
                        Shield.SetLastBreakRecoverTime(FixedTime.Time);
                    }
                    Shield.SetbBroken(false);
                }
            }
            else
            {
                float32 local_22;
                if ((local_10.GetbRecoverWhenActive() && (local_10.GetRecoverValuePerSecond_Active() > 0.0f || ((local_10.GetRecoverPercentPerSecond_Active() > 0.0f)))) && ((((FFPTime(Shield.GetLastTakenDamageTime()) + FFPTime(local_10.GetRecoverDelay_Active()))).opCmp(FixedTime.Time) <= 0)))
                {
                    float32 local_21_2 = Shield.GetShieldHP().Evaluate(FixedTime.Time);
                    float32 local_13_2 = Shield.GetShieldMaxHP().Evaluate(FixedTime.Time);
                    if (local_21_2 < local_13_2)
                    {
                        if (local_10.GetRecoverMaxPercent_Active() > 0.0f)
                        {
                            local_22 = local_10.GetRecoverMaxPercent_Active();
                        }
                        else
                        {
                            local_22 = 100.0f;
                        }
                        float32 local_24_3 = local_22 * local_13_2;
                        local_22 = local_24_3 * 0.01f;
                        if (local_10.GetRecoverMaxValue_Active() > 0.0f && ((local_22 > local_10.GetRecoverMaxValue_Active())))
                        {
                            local_22 = local_10.GetRecoverMaxValue_Active();
                        }
                        float32 local_19_2 = local_22 - local_21_2;
                        if (local_19_2 > 0.0f)
                        {
                            local_24_3 = local_10.GetRecoverValuePerSecond_Active();
                            Shield.GetModify_ShieldHP().SetRecover(FixedTime.Time, local_21_2, 0.0f, (local_19_2 / (local_24_3 + ((local_10.GetRecoverPercentPerSecond_Active() * local_13_2) * 0.01f))), local_22);
                        }
                    }
                }
            }
            return;
        }
        if ((local_10.GetbRecoverWhenDeactive() && (local_10.GetRecoverValuePerSecond_Deactive() > 0.0f || (local_10.GetRecoverPercentPerSecond_Deactive() > 0.0f))) && ((((FFPTime(Shield.GetDeactivateTime()) + FFPTime(local_10.GetRecoverDelay_Deactive()))).opCmp(FixedTime.Time) <= 0)))
        {
            float32 local_23;
            float32 local_22;
            float32 local_24_5 = Shield.GetShieldHP().Evaluate(FixedTime.Time);
            float32 local_19_3 = Shield.GetShieldMaxHP().Evaluate(FixedTime.Time);
            if (local_24_5 < local_19_3)
            {
                if (local_10.GetRecoverMaxPercent_Deactive() > 0.0f)
                {
                    local_26 = local_10.GetRecoverMaxPercent_Deactive();
                }
                else
                {
                    local_26 = 100.0f;
                }
                local_23 = local_26 * local_19_3;
                local_26 = local_23 * 0.01f;
                if (local_10.GetRecoverMaxValue_Deactive() > 0.0f && (local_26 > local_10.GetRecoverMaxValue_Deactive()))
                {
                    local_26 = local_10.GetRecoverMaxValue_Deactive();
                }
                float32 local_21_3 = local_26 - local_24_5;
                if (local_21_3 > 0.0f)
                {
                    local_22 = local_10.GetRecoverValuePerSecond_Deactive();
                    float32 local_13_3 = local_10.GetRecoverPercentPerSecond_Deactive() * local_19_3;
                    local_23 = local_13_3 * 0.01f;
                    local_13_3 = local_22 + local_23;
                    local_23 = local_21_3 / local_13_3;
                    Shield.GetModify_ShieldHP().SetRecover(FixedTime.Time, local_24_5, 0.0f, local_23, local_26);
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateShieldOwner(const FECSEntity &inout Entity, const FC_ShieldOwner &inout ShieldOwner, FC_GameAttribute &inout GameAttribute, const FCS_FixedTime &inout FixedTime) const
    {
        int local_36 = 0;
        float32 local_2 = GameAttribute.GetAttributeValue(Attribute::Shield, FixedTime.Time);
        float32 local_1 = GameAttribute.GetAttributeValue(Attribute::ShieldMax, FixedTime.Time);
        float32 local_4 = 0.0f;
        float32 local_5 = 0.0f;
        for (auto& local_26 : ShieldOwner.GetNamedInherentShields())
        {
            local_26;
            if (local_36)
            {
                local_4 = local_4 + local_36.GetShieldHP().Evaluate(FixedTime.Time);
                local_5 = local_5 + local_36.GetShieldMaxHP().Evaluate(FixedTime.Time);
            }
        }
        if (local_4 > local_5)
        {
            local_4 = local_5;
        }
        if (local_2 != local_4)
        {
            FGameAttributeUtils::ChangeConsumeValue(Entity, Attribute::Shield, FixedTime.Time, local_4, -1.0f);
        }
        if (local_1 != local_5)
        {
            FGameAttributeUtils::ChangeConsumeValue(Entity, Attribute::ShieldMax, FixedTime.Time, local_5, -1.0f);
        }
        if ((local_2 <= 0.0f && (local_4 > 0.0f)))
        {
            Entity.AddGameplayTagDetermined(GameplayTags::CombatState_HasShield, NAME_None);
            return;
        }
        if ((local_2 > 0.0f && (local_4 <= 0.0f)))
        {
            Entity.RemoveGameplayTagDetermined(GameplayTags::CombatState_HasShield, NAME_None);
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnShieldOwnerRemove(const FECSEntity &inout Entity, const FC_ShieldOwner &inout ShieldOwner) const
    {
        bool local_1;
        if (!(Entity.IsValid()))
        {
            local_1 = false;
        }
        else
        {
            Has local_6;
            local_1 = local_6.opCall();
        }
        if (local_1)
        {
            Entity.RemoveGameplayTagDetermined(GameplayTags::CombatState_HasShield, NAME_None);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateShield() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_174 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_UpdateShield(local_40, local_42, local_6);
                local_50.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Exclude(local_88).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_88.Iterator();
        for (; local_136.CanProceed;)
        {
            local_40 = local_136.Proceed();
            ++local_102;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_UpdateShield(local_174, local_42, local_6);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateShieldOwner() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_184 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.Job_UpdateShieldOwner(local_40, local_42, local_48, local_6);
                FECSEntity::MarkModifiedIfDirty<FC_GameAttribute> local_56;
                local_56.opCall(local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_94 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Exclude(local_94).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_112 = 0;
        FECSRuntimeViewIterator local_146 = local_94.Iterator();
        for (; local_146.CanProceed;)
        {
            local_40 = local_146.Proceed();
            ++local_112;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_UpdateShieldOwner(local_184, local_42, local_48, local_6);
            FECSEntity::MarkModifiedIfDirty<FC_GameAttribute>(local_40).opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_112);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnShieldOwnerRemove() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorShieldOwnerOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnShieldOwnerRemove(local_46, local_52);
        }
        return;
    }
}

