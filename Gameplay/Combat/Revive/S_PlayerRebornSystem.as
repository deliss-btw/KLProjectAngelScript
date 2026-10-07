

class US_PlayerRebornSystem : UECSScriptSystem
{
    US_PlayerRebornSystem()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_PlayerReborn(const FCE_PlayerRebornEvent &inout Event) const
    {
        bool local_5;
        Has local_16;
        int local_24 = 0;
        int local_28 = 0;
        UAS_GameModeSettingsPVP local_108;
        FECSEntity local_4 = FECSEntity(Event.Sender);
        if (!(local_4.IsValid()))
        {
            XWarning(ELog(42), FString().Append("[PlayerReborn][ServerReject] Sender=").Append(Event.Sender).Append(" ReviveType=").Append(Event.ReviveType).Append(" Reason=InvalidSender"));
            return;
        }
        if (!(local_16.opCall()))
        {
            XWarning(ELog(42), FString().Append("[PlayerReborn][ServerReject] Sender=").Append(local_4).Append(" ReviveType=").Append(Event.ReviveType).Append(" Reason=MissingWaitForReborn"));
            return;
        }
        XLog(ELog(42), FString().Append("[PlayerReborn][ServerAccept] Sender=").Append(local_4).Append(" ReviveType=").Append(Event.ReviveType));
        FECSWorldPtr local_18 = ECS::GetECSWorld();
        float32 local_25 = 0.5f;
        if (!(local_24))
        {
            local_5 = false;
        }
        else
        {
            local_5 = local_24.GetReviveData();
        }
        if (local_5)
        {
            local_25 = float32((local_28 / 100.0));
        }
        FFPTime local_40 = ECS::GetContextTime();
        FCE_Reborn local_34;
        local_34.RebornByEntity = local_4;
        local_34.RebornHPRatio = local_25;
        local_34.bRebornWithAnimation = true;
        local_5 = true;
        local_34.bFromPlayerRebornEvent = local_5;
        local_34.ReviveType = Event.ReviveType;
        bool local_27 = local_16.opCall();
        if (local_27)
        {
            Remove local_46;
            local_46.opCall();
        }
        if (!(local_24))
        {
            local_27 = false;
        }
        else
        {
            local_5 = local_24.GetReviveData();
            local_27 = local_5;
        }
        if (local_27)
        {
            if (local_5)
            {
                int local_90;
                int local_61;
                FNameHandle_EntityBBVarInt local_60;
                FECSEntity local_54 = ::FASCommonUtils::GetUniquePlayerEntity(local_4);
                local_60;
                local_28 = local_54.GetBB_Int(local_60);
                XLog(ELog(0), FString().Append("PlayerReborn consume refill timer, Operate resurlt ").Append(local_28));
                UNearDeathSettings local_64 = ::NearDeathSettings::Get();
                int local_55 = ::InventoryUtils::GetInventoryItemNumber(local_54, TDataObjectPtr<FItemConfig>());
                local_60;
                local_61 = local_54.GetBB_Int(local_60);
                if (local_61 <= 0)
                {
                    local_61 = 4;
                }
                int local_89 = ::FGameModeUtils::GetCombatRestrictionPotionMaxCount();
                if (local_89 >= 0)
                {
                    local_61 = local_89;
                }
                else
                {
                    FECSWorldPtr local_18_2 = ECS::GetECSWorld();
                    Has local_94;
                    bool local_27_2 = local_94.opCall();
                    if (!(local_27_2))
                    {
                        local_27_2 = false;
                    }
                    else
                    {
                        FECSWorldPtr local_18_3 = ECS::GetECSWorld();
                        Get local_98;
                        local_27_2 = (int(local_98.opCall().GetGameModeType()) == 2);
                    }
                    if (local_27_2)
                    {
                        local_108 = (Cast<UAS_GameModeSettingsPVP>(UECSGameModeSettingsBase::Get(ECS::GetUEWorld())));
                        if (local_108 != nullptr)
                        {
                            local_61 = local_108.PotionMaxCount;
                        }
                    }
                }
                if (local_28 >= 0)
                {
                    local_61 = FMath::Min(local_61, local_28 + local_55);
                }
                local_90 = local_61 - local_55;
                local_90 = FMath::Max(0, local_90);
                if (local_90 > 0)
                {
                    if (local_28 > 0)
                    {
                        int local_100 = local_28 - local_90;
                        XLog(ELog(0), FString().Append("PlayerReborn consume refill timer, consume: ").Append(local_90).Append(", remaining ").Append(local_100));
                        int local_109 = local_28 - local_90;
                        FFPTime local_40_2 = ECS::GetContextTime();
                        local_60;
                        local_100 = 533;
                        local_60;
                        XLog(ELog(0), FString().Append("PlayerReborn consume refill timer, Operate resurlt ").Append(local_54.GetBB_Int(local_60)));
                    }
                    UNearDeathSettings local_64_2 = ::NearDeathSettings::Get();
                    ::InventoryUtils::AddInventoryItem(local_54, TDataObjectPtr<FItemConfig>(), local_90);
                }
            }
        }
        FFPTime local_40_3 = FFPTime(-1);
        FCE_Event_ReviveTeleport local_116;
        local_116.CustomName = FName("Revive");
        local_116.ReviveType = Event.ReviveType;
        if (int(Event.ReviveType) == 1 || (int(Event.ReviveType) == 3))
        {
            local_116.SpecificPrefabClass.Append(::NearDeathSettings::GetRestPointPrefabClasses());
            if (int(Event.ReviveType) == 3)
            {
                int local_109_2 = 1;
                local_116.SkipNearestCount = local_109_2;
            }
        }
        Has local_126;
        local_5 = local_126.opCall();
        if (local_5)
        {
            Remove local_130;
            local_130.opCall();
        }
        return;
    }
    UFUNCTION()
    void UpdateDeathPunish(const FECSEntity &inout PlayerEntity, FC_PlayerDeathPunish &inout C_PlayerDeathPunish) const
    {
        int local_4 = C_PlayerDeathPunish.GetPunishDeathEndTime().Num() - 1;
        Get local_12;
        for (; local_4 >= 0; --local_4)
        {
            FFPTime local_14 = FFPTime(C_PlayerDeathPunish.GetPunishDeathEndTime()[local_4]);
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            if (local_14.opCmp(local_12.opCall().Time) <= 0)
            {
                C_PlayerDeathPunish.GetModify_PunishDeathEndTime().RemoveAt(local_4);
            }
        }
        if (C_PlayerDeathPunish.GetPunishDeathEndTime().Num() == 0)
        {
            Remove local_18;
            local_18.opCall();
            return;
        }
        return;
    }
    UFUNCTION()
    void ServerJob_PlayerDeath(const FCE_DeathEvent &inout Event) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    UFUNCTION()
    void Run_ServerJob_PlayerReborn() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PlayerRebornEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PlayerRebornEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_PlayerReborn(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_UpdateDeathPunish() const
    {
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_170 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1))))
        {
            return;
        }
        int local_10 = 0;
        int local_9 = local_10;
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
                this.UpdateDeathPunish(local_40, local_42);
                local_50.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Exclude(local_88).opCall();
        bool local_8 = local_4.BeginViewCacheBuild();
        int local_7 = local_4.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_88.Iterator();
        for (; local_132.CanProceed;)
        {
            local_40 = local_132.Proceed();
            ++local_98;
            if (local_8)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.UpdateDeathPunish(local_170, local_42);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_98);
        if (local_8)
        {
            local_4.CommitViewCacheBuild(local_7);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_PlayerDeath() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DeathEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DeathEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_PlayerDeath(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

