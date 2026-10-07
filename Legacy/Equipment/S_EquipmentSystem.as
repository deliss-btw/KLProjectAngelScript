

class US_EquipmentSystem : UECSScriptSystem
{
    US_EquipmentSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_InitNonPlayerCharacterEquipment(const FECSEntity &inout Entity, const FC_InitWeaponConfig &inout InitWeaponConfig) const
    {
        for (auto& local_16 : InitWeaponConfig.WepaonPrefabs)
        {
            if (local_16.IsValid())
            {
                UClass local_18;
                FECSEntity local_26 = FECSSpawnUtils::SpawnWeaponForCharacter(Entity, TSubclassOf<AECSPrefab>(local_18), InitWeaponConfig.WeaponType);
                FWeaponUtils::SwitchWeapon(Entity, 0);
                if (!(Entity.IsActive()))
                {
                    local_26.SetActive(false, FFPTime(-1));
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_InitNewlyCreatedCharacterEquipment(const FECSEntity &inout Entity, const FC_ControlledByPlayer &inout ControlledByPlayer, const FC_EquipmentHolder &inout EquipmentHolder) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argint]
    }
    UFUNCTION()
    void Job_OnWearEquipReq(const FCE_OnWearEquipReq &inout Event) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_UpdateEquipment(const FECSEntity &inout Entity, const FC_EquipmentUpdateRequest &inout EquipmentUpdateRequest, FC_EquipmentHolder &inout EquipmentHolder, const FCS_FixedTime &inout FixedTime) const
    {
        int local_19;
        const FItemConfig& local_86;
        Has local_122;
        TArray<TDataObjectPtr<FCapabilityConfig>> local_4;
        for (auto local_18 : EquipmentUpdateRequest.RemoveEquipmentIds)
        {
            int local_20 = 0;
            for (; local_20 < EquipmentHolder.GetEquipmentInfos().Num(); ++local_20)
            {
                FEquipmentRuntimeInfo local_22 = EquipmentHolder.GetEquipmentInfos()[local_20];
                if (local_22.GetId() == local_18)
                {
                    for (auto& local_36 : local_22.GetCapabilities())
                    {
                        if (local_36.GetCapabilityConfig())
                        {
                            local_4.AddUnique(local_36.GetCapabilityConfig());
                        }
                    }
                    TDataObjectPtr<FEquipmentConfig> local_60;
                    local_60 = local_22.GetConfig();
                    if ((!((local_60 == nullptr))))
                    {
                        XLog(ELog(0), FString().Append("WeaponDebug Job_UpdateEquipment RemoveEquipment. Id: ").Append(local_18).Append(", Slot: ").Append(int(local_22.GetEquipSlot())).Append(", ConfigName: ").Append(local_86.GetDataName()).Append(", AttributeDatasNum: ").Append(local_86.AttributeDatas.Num()).Append("."));
                        for (auto& local_110 : local_86.AttributeDatas)
                        {
                            XLog(ELog(0), FString().Append("WeaponDebug Job_UpdateEquipment RemoveModify. AttributeClass: ").Append(local_110.AttributeClass.ToString()).Append(", Value: ").Append(local_110.Value).Append("."));
                            FGameAttributeUtils::RemoveModify(Entity, local_110.AttributeClass, EGameAttributeModifyType(local_110.ModifyType), local_110.Value, FixedTime.Time, false, false);
                        }
                        bool local_17 = local_122.opCall();
                        if (local_17)
                        {
                            for (auto local_130 : local_22.GetModifierInstanceIds())
                            {
                                FGameplayModifierUtils::RemoveGameplayModifier(Entity, int(local_130));
                            }
                        }
                        if (local_86.Is(FWeaponConfig))
                        {
                            Modify local_136;
                            FC_CharacterWeapon local_138 = local_136.opCall();
                            if (local_138)
                            {
                                FWeaponUtils::RemoveWeapon(Entity, local_138, local_22.GetEntity().GetId());
                            }
                        }
                        if (local_22.GetEntity().IsValid())
                        {
                            local_22.GetEntity().DestroyDeferred();
                        }
                    }
                    EquipmentHolder.GetModify_EquipmentInfos().RemoveAtSwap(local_20);
                    --local_20;
                }
            }
        }
        for (auto& local_154 : EquipmentUpdateRequest.AddEquipmentInfos)
        {
            FEquipmentRuntimeInfo local_202;
            local_202.SetId(local_154.GetId());
            local_202.SetConfig(local_154.GetConfig());
            local_202.SetEquipSlot(EEquipSlotType(local_154.GetEquipSlot()));
            local_202.SetModifierConfigs(local_154.GetModifierConfigs());
            local_202.SetCapabilities(local_154.GetCapabilities());
            for (auto& local_36 : local_202.GetCapabilities())
            {
                if (local_36.GetCapabilityConfig())
                {
                    local_4.AddUnique(local_36.GetCapabilityConfig());
                }
            }
            FEquipmentRuntimeInfo local_22_2 = EquipmentHolder.GetModify_EquipmentInfos()[EquipmentHolder.GetModify_EquipmentInfos().Add(local_202)];
            TDataObjectPtr<FEquipmentConfig> local_84;
            local_84 = local_22_2.GetConfig();
            if ((!((local_84 == nullptr))))
            {
                XLog(ELog(0), FString().Append("WeaponDebug Job_UpdateEquipment AddEquipment. Id: ").Append(local_22_2.GetId()).Append(", Slot: ").Append(int(local_22_2.GetEquipSlot())).Append(", ConfigName: ").Append(local_86.GetDataName()).Append(", DataId: ").Append(local_86.DataId).Append(", UniqueId: ").Append(local_86.GetUniqueID()).Append(", RootObject: ").Append(local_86.GetRoot().GetPathName(nullptr)).Append(", PtrUniqueId: ").Append(local_22_2.GetConfig().GetUniqueID()).Append(", AttributeDatasNum: ").Append(local_86.AttributeDatas.Num()).Append("."));
                for (auto& local_110 : local_86.AttributeDatas)
                {
                    XLog(ELog(0), FString().Append("WeaponDebug Job_UpdateEquipment AddModify. AttributeClass: ").Append(local_110.AttributeClass.ToString()).Append(", Value: ").Append(local_110.Value).Append("."));
                    FGameAttributeUtils::AddModify(Entity, local_110.AttributeClass, EGameAttributeModifyType(local_110.ModifyType), local_110.Value, FixedTime.Time, false, false);
                }
                bool local_115 = local_122.opCall();
                if (local_115)
                {
                    for (auto& local_224 : local_22_2.GetModifierConfigs())
                    {
                        local_22_2.GetModify_ModifierInstanceIds().Add(FGameplayModifierUtils::AddGameplayModifier(Entity, local_224, FFPTime(-1), false));
                    }
                }
                if (local_86.Is(FWeaponConfig))
                {
                    CastTo local_230;
                    TDataObjectPtr<FWeaponConfig> local_254 = local_230.opCall();
                    Get local_260;
                    if (local_260.opCall())
                    {
                        FWeaponConfig local_256;
                        FECSEntity local_268 = FECSSpawnUtils::SpawnWeaponForCharacter(Entity, local_256.WeaponPrefab.Get(), EWeaponType(local_256.WeaponType));
                        if (int(local_22_2.GetEquipSlot()) == 1)
                        {
                            FWeaponUtils::SwitchWeapon(Entity, 0);
                        }
                        if (!(Entity.IsActive()))
                        {
                            local_268.SetActive(false, FFPTime(-1));
                        }
                        local_22_2.SetEntity(local_268);
                    }
                }
            }
        }
        bool local_115_2 = local_122.opCall();
        if (local_115_2)
        {
            for (auto& local_286 : local_4)
            {
                int local_20_2 = 0;
                auto local_292 = EquipmentHolder.GetEquipmentInfos().Iterator();
                for (; local_292.CanProceed;)
                {
                    FEquipmentRuntimeInfo local_22_3 = local_292.Proceed();
                    if (!(local_22_3.GetConfig()))
                    {
                        continue;
                    }
                    for (auto& local_36 : local_22_3.GetCapabilities())
                    {
                        TDataObjectPtr<FCapabilityConfig> local_322;
                        local_322 = local_36.GetCapabilityConfig();
                        if ((local_322 == local_286.opImplConv()))
                        {
                            local_20_2 = local_20_2 + local_36.GetLevel();
                        }
                    }
                }
                int local_94 = GetLevelLimit();
                if (local_94 > 0)
                {
                    local_19 = FMath::Min(local_20_2, local_94);
                }
                else
                {
                    local_19 = local_20_2;
                }
                TArray<FCapabilityInstanceId> local_376;
                Get local_380;
                const FC_Capability& local_382 = local_380.opCall();
                if (local_382)
                {
                    for (auto& local_396 : local_382.GetCapabilityRuntime().CapabilityInstances)
                    {
                        if ((local_286 == local_396.Config))
                        {
                            local_376.Add(local_396.InstanceId);
                        }
                    }
                }
                for (auto& local_410 : local_376)
                {
                    FCapabilityUtils::RemoveCapabilityByInstanceId(Entity, local_410);
                }
                if (local_19 > 0)
                {
                    FName local_412(local_286.GetDataName());
                    XLog(ELog(0), FString().Append("WeaponDebug Job_UpdateEquipment RebuildCapability. CapabilityConfig: ").Append(local_412).Append(", MergedLevel: ").Append(local_20_2).Append(", LevelLimit: ").Append(local_94).Append(", TargetLevel: ").Append(local_19).Append("."));
                    FCapabilityUtils::AddCapability(Entity, TDataObjectPtr<FCapabilityConfig>(), local_19);
                }
            }
        }
        Remove local_418;
        local_418.opCall();
        return;
    }
    UFUNCTION()
    void Run_Job_InitNonPlayerCharacterEquipment() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_166 = 0;
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
                this.Job_InitNonPlayerCharacterEquipment(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Include local_88;
        local_88.opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_80.Iterator();
        for (; local_128.CanProceed;)
        {
            local_36 = local_128.Proceed();
            ++local_94;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_InitNonPlayerCharacterEquipment(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_InitNewlyCreatedCharacterEquipment() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_176 = 0;
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
                this.Job_InitNewlyCreatedCharacterEquipment(local_36, local_38, local_44);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_86 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_90;
        local_90.opCall();
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_104 = 0;
        FECSRuntimeViewIterator local_138 = local_86.Iterator();
        for (; local_138.CanProceed;)
        {
            local_36 = local_138.Proceed();
            ++local_104;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_InitNewlyCreatedCharacterEquipment(local_176, local_38, local_44);
        }
        local_2.UpdateCachedEntityCount(local_104);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_OnWearEquipReq() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_OnWearEquipReq> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_OnWearEquipReq& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_OnWearEquipReq(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateEquipment() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_180 = 0;
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
                this.Job_UpdateEquipment(local_40, local_42, local_48, local_6);
                FECSEntity::MarkModifiedIfDirty<FC_EquipmentHolder> local_56;
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
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_94.Iterator();
        for (; local_142.CanProceed;)
        {
            local_40 = local_142.Proceed();
            ++local_108;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_UpdateEquipment(local_180, local_42, local_48, local_6);
            FECSEntity::MarkModifiedIfDirty<FC_EquipmentHolder>(local_40).opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_108);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
}

