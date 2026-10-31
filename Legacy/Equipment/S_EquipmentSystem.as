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
                FECSEntity local_26 = FECSSpawnUtils::SpawnWeaponForCharacter(Entity, TSubclassOf<AECSPrefab>(local_16.Get()), InitWeaponConfig.WeaponType);
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
        TDataObjectPtr<FAvatarPrefabConfig> local_24 = ::GetAvatarConfig(Entity);
        if ((local_24 == nullptr))
        {
            return;
        }
        Get local_54;
        const FC_DSPlayerAvatarInfo& local_56 = local_54.opCall();
        GetDataObjectByGSDataId<FAvatarPrefabConfig> local_104;
        if (local_56)
        {
            FString local_60;
            for (auto& local_74 : local_56.GetAvatarList())
            {
                local_60 += FString().Append(local_74.GetAvatarId()).Append(", ");
            }
            XLog(ELog(0), FString().Append("WeaponDebug Job_InitNewlyCreatedCharacterEquipment AvatarIdList: ").Append(local_60));
            for (auto& local_74 : local_56.GetAvatarList())
            {
                int local_79 = local_74.GetAvatarId();
                if ((local_104.opImplConv() == local_24.opImplConv()))
                {
                    XLog(ELog(0), FString().Append("WeaponDebug Job_InitNewlyCreatedCharacterEquipment CurAvatarId: ").Append(local_74.GetAvatarId()));
                    if (::FGameModeUtils::ShouldUseModeWeapon(local_56.GetbUseGameModeOverrideEquipment()))
                    {
                        TDataObjectPtr<FWeaponConfig> local_156 = ::FEquipmentUtils::GetGameModeOverrideWeapon(Entity.GetWorld(), local_24);
                        if (local_156)
                        {
                            XLog(ELog(0), FString().Append("WeaponDebug Job_InitNewlyCreatedCharacterEquipment UseGameModeOverrideEquipment."));
                            ::FEquipmentUtils::AddEquipmentByTraits(Entity, local_156.Get(), EEquipSlotType(1), local_156.Get().DefaultTrait);
                        }
                        else
                        {
                            XLog(ELog(0), FString().Append("WeaponDebug Job_InitNewlyCreatedCharacterEquipment UseDefaultWeapon."));
                            ::FEquipmentUtils::AddEquipmentByTraits(Entity, local_24.Get().GetDefaultWeapon().Get(), EEquipSlotType(1), local_24.Get().GetDefaultWeapon().Get().DefaultTrait);
                        }
                    }
                    else
                    {
                        for (auto& local_200 : local_74.GetEquipmentInfos())
                        {
                            if (local_200.GetValue().GetEquipmentData().GetEquipmentConfig())
                            {
                                const FItemConfig& local_202 = local_200.GetValue().GetEquipmentData().GetEquipmentConfig().Get();
                                int local_181 = int(local_200.GetKey());
                                FName local_206 = local_202.GetDataName();
                                XLog(ELog(0), FString().Append("WeaponDebug Job_InitNewlyCreatedCharacterEquipment AddEquipmentByTraits. Slot: ").Append(int(local_200.GetKey())).Append(", WeaponGUID: ").Append(local_200.GetValue().GetGuid()).Append(", WeaponConfigID: ").Append(local_206).Append(", ConfigName: ").Append(local_206).Append("."));
                            }
                        }
                    }
                    break;
                }
            }
            return;
        }
        XLog(ELog(0), FString().Append("WeaponDebug Job_InitNewlyCreatedCharacterEquipment no FC_DSPlayerAvatarInfo Entity: ").Append(Entity.GetEntityName()));
        TDataObjectPtr<FWeaponConfig> local_180 = ::FEquipmentUtils::GetGameModeOverrideWeapon(Entity.GetWorld(), local_24);
        bool local_129 = ::FGameModeUtils::ShouldUseModeWeapon(true);
        if (!(!(local_129)) && local_180)
        {
            XLog(ELog(0), FString().Append("WeaponDebug Job_InitNewlyCreatedCharacterEquipment UseGameModeOverrideEquipment."));
            ::FEquipmentUtils::AddEquipmentByTraits(Entity, local_180.Get(), EEquipSlotType(1), local_180.Get().DefaultTrait);
            return;
        }
        XLog(ELog(0), FString().Append("WeaponDebug Job_InitNewlyCreatedCharacterEquipment UseDefaultWeapon."));
        ::FEquipmentUtils::AddEquipmentByTraits(Entity, local_24.Get().GetDefaultWeapon().Get(), EEquipSlotType(1), local_24.Get().GetDefaultWeapon().Get().DefaultTrait);
        return;
    }
    UFUNCTION()
    void Job_OnWearEquipReq(const FCE_OnWearEquipReq &inout Event) const
    {
        FName local_6;
        int local_122 = 0;
        FDSAvatarEquipmentInfo local_238;
        Get local_362;
        if (Event.EquipmentData.GetEquipmentConfig())
        {
            local_6 = Event.EquipmentData.GetEquipmentConfig().GetDataName();
        }
        else
        {
            local_6 = n"None";
        }
        FName local_3;
        if (Event.SwitchEquipmentData.GetEquipmentConfig())
        {
            local_3 = Event.SwitchEquipmentData.GetEquipmentConfig().GetDataName();
        }
        else
        {
            local_3 = n"None";
        }
        XLog(ELog(0), FString().Append("WeaponDebug Job_OnWearEquipReq Event.AvatarId: ").Append(Event.AvatarId).Append(", Slot:").Append(int(Event.EquipSlot)).Append(", ItemUid: ").Append(Event.ItemUid).Append(", EquipmentData: ").Append(local_6).Append(", SwitchAvatarId: ").Append(Event.SwitchAvatarId).Append(", SwitchEquipSlot: ").Append(int(Event.SwitchEquipSlot)).Append(", SwitchItemUid: ").Append(Event.SwitchItemUid).Append(", SwitchEquipmentData: ").Append(local_3).Append("."));
        bool local_18 = false;
        bool local_1 = (int(Event.SwitchAvatarId) == 0);
        int local_22 = 0;
        FDSAvatarEquipmentInfo local_52;
        int64 local_54 = Event.SwitchItemUid;
        FEquipmentData local_84;
        if (FECSEntity(Event.Sender).IsValid())
        {
            GetDataObjectByGSDataId<FAvatarPrefabConfig> local_286;
            if (local_122)
            {
                FDSAvatarInfo local_172;
                for (auto& local_186 : local_122.GetModify_AvatarList())
                {
                    if (local_186.GetAvatarId() == int(Event.AvatarId))
                    {
                        local_172 = local_186;
                        if (Event.ItemUid != 0)
                        {
                            for (auto& local_206 : local_186.GetEquipmentInfos())
                            {
                                if (int(local_206.GetKey()) != int(Event.EquipSlot) && ((local_206.GetValue().GetGuid() == Event.ItemUid)))
                                {
                                    local_22 = int(local_206.GetKey());
                                    if (local_186.GetEquipmentInfos().Contains(Event.EquipSlot))
                                    {
                                    }
                                    break;
                                }
                            }
                        }
                        local_238.SetGuid(Event.ItemUid);
                        local_238.SetEquipmentData(Event.EquipmentData);
                        local_186.GetModify_EquipmentInfos().Add(Event.EquipSlot, local_238);
                        local_18 = true;
                    }
                }
                if (int(Event.SwitchAvatarId) != 0)
                {
                    for (auto& local_186 : local_122.GetModify_AvatarList())
                    {
                        if (local_186.GetAvatarId() == int(Event.SwitchAvatarId))
                        {
                            if (local_54 == 0)
                            {
                                if (local_172.GetEquipmentInfos().Find(Event.EquipSlot, local_238))
                                {
                                    local_54 = local_238.GetGuid();
                                }
                            }
                            local_238.SetGuid(local_54);
                            local_238.SetEquipmentData(local_84);
                            local_186.GetModify_EquipmentInfos().Add(Event.SwitchEquipSlot, local_238);
                            local_1 = true;
                        }
                    }
                }
            }
            int local_20 = int(Event.AvatarId);
            TDataObjectPtr<FAvatarPrefabConfig> local_262 = local_286.opImplConv();
            int local_21 = int(Event.SwitchAvatarId);
            TDataObjectPtr<FAvatarPrefabConfig> local_358 = local_286.opImplConv();
            const FC_PlayerController& local_364 = local_362.opCall();
            if (local_364)
            {
                for (auto& local_378 : local_364.GetAllPlayerPawnEntities())
                {
                    if ((::GetAvatarConfig(local_378) == local_262.opImplConv()))
                    {
                        if (local_22 != 0)
                        {
                            XLog(ELog(0), FString().Append("WeaponDebug Job_OnWearEquipReq RemoveEquipmentBySlot. Slot: ").Append(local_22).Append("."));
                            ::FEquipmentUtils::RemoveEquipmentBySlot(local_378, EEquipSlotType(local_22));
                            int64 local_56_2 = local_52.GetGuid();
                            if (local_56_2 != 0 && local_52.GetEquipmentData().GetEquipmentConfig().IsSet())
                            {
                                XLog(ELog(0), FString().Append("WeaponDebug Job_OnWearEquipReq AddEquipmentByTraits. Slot: ").Append(local_22).Append(", WeaponGUID: ").Append(local_52.GetGuid()).Append(", WeaponConfigID: ").Append(local_52.GetEquipmentData().GetEquipmentConfig().Get().DataId).Append(", ConfigName: ").Append(local_52.GetEquipmentData().GetEquipmentConfig().Get().GetDataName()).Append("."));
                                ::FEquipmentUtils::AddEquipmentByTraits(local_378, local_52.GetEquipmentData().GetEquipmentConfig().Get(), EEquipSlotType(local_22), local_52.GetEquipmentData().GetTraits());
                            }
                        }
                        XLog(ELog(0), FString().Append("WeaponDebug Job_OnWearEquipReq RemoveEquipmentBySlot. Slot: ").Append(int(Event.EquipSlot)).Append("."));
                        ::FEquipmentUtils::RemoveEquipmentBySlot(local_378, Event.EquipSlot);
                        if (Event.EquipmentData.GetEquipmentConfig().IsSet())
                        {
                            XLog(ELog(0), FString().Append("WeaponDebug Job_OnWearEquipReq AddEquipmentByTraits. Slot: ").Append(int(Event.EquipSlot)).Append(", WeaponGUID: ").Append(Event.ItemUid).Append(", WeaponConfigID: ").Append(Event.EquipmentData.GetEquipmentConfig().Get().DataId).Append(", ConfigName: ").Append(Event.EquipmentData.GetEquipmentConfig().Get().GetDataName()).Append("."));
                            ::FEquipmentUtils::AddEquipmentByTraits(local_378, Event.EquipmentData.GetEquipmentConfig().Get(), Event.EquipSlot, Event.EquipmentData.GetTraits());
                        }
                    }
                    if ((::GetAvatarConfig(local_378) == local_358.opImplConv()))
                    {
                        XLog(ELog(0), FString().Append("WeaponDebug Job_OnWearEquipReq RemoveEquipmentBySlot. Slot: ").Append(int(Event.SwitchEquipSlot)).Append("."));
                        ::FEquipmentUtils::RemoveEquipmentBySlot(local_378, Event.SwitchEquipSlot);
                        if (local_54 != 0 && local_84.GetEquipmentConfig().IsSet())
                        {
                            XLog(ELog(0), FString().Append("WeaponDebug Job_OnWearEquipReq AddEquipmentByTraits. Slot: ").Append(int(Event.SwitchEquipSlot)).Append(", WeaponGUID: ").Append(local_54).Append(", WeaponConfigID: ").Append(local_84.GetEquipmentConfig().Get().DataId).Append(", ConfigName: ").Append(local_84.GetEquipmentConfig().Get().GetDataName()).Append("."));
                            ::FEquipmentUtils::AddEquipmentByTraits(local_378, local_84.GetEquipmentConfig().Get(), Event.SwitchEquipSlot, local_84.GetTraits());
                        }
                    }
                }
            }
        }
        const FC_PlayerController& local_364_2 = local_362.opCall();
        if (local_364_2)
        {
            FProtoWrapper local_408;
            if (int(Event.EquipSlot) == 1)
            {
                FPbWearWeaponRsp local_412;
                local_412.SetAvatarId(int(Event.AvatarId));
                int64 local_188_2 = Event.ItemUid;
                local_412.SetWeaponGuid(local_188_2);
                local_412.SetSwitchedAvatarId(int(Event.SwitchAvatarId));
                if (local_18)
                {
                    local_412.SetRetcode(0);
                }
                local_408 = local_412.ToWrapper();
            }
            else
            {
                if (int(Event.EquipSlot) >= 2 && (int(Event.EquipSlot) <= 5))
                {
                    FPbManageTalismanRsp local_422;
                    FPbManageTalismanInfo local_442 = local_422.GetCurAvatarInfo();
                    local_442.SetAvatarId(int(Event.AvatarId));
                    int64 local_188_3 = Event.ItemUid;
                    local_442.SetTalismanGuid(local_188_3);
                    local_442.SetSlot(int(Event.EquipSlot) - 2);
                    FPbManageTalismanInfo local_432 = local_422.GetSwitchedAvatarInfo();
                    local_432.SetAvatarId(int(Event.SwitchAvatarId));
                    local_188_3 = Event.SwitchItemUid;
                    local_432.SetTalismanGuid(local_188_3);
                    int local_16 = int(Event.SwitchEquipSlot);
                    local_432.SetSlot(local_16 - 2);
                    if (local_18 && local_1)
                    {
                        local_422.SetRetcode(0);
                    }
                    local_408 = local_422.ToWrapper();
                }
            }
            ::UGameDSConnectionSubsystem::Get().SendProtoWrapperByPlayerUid(local_364_2.GetPlayerId(), local_408);
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateEquipment(const FECSEntity &inout Entity, const FC_EquipmentUpdateRequest &inout EquipmentUpdateRequest, FC_EquipmentHolder &inout EquipmentHolder, const FCS_FixedTime &inout FixedTime) const
    {
        int local_19;
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
                        const FItemConfig& local_86 = local_22.GetConfig().Get();
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
            local_202.SetEquipSlot(local_154.GetEquipSlot());
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
                const FItemConfig& local_86_2 = local_22_2.GetConfig().Get();
                XLog(ELog(0), FString().Append("WeaponDebug Job_UpdateEquipment AddEquipment. Id: ").Append(local_22_2.GetId()).Append(", Slot: ").Append(int(local_22_2.GetEquipSlot())).Append(", ConfigName: ").Append(local_86_2.GetDataName()).Append(", DataId: ").Append(local_86_2.DataId).Append(", UniqueId: ").Append(local_86_2.GetUniqueID()).Append(", RootObject: ").Append(local_86_2.GetRoot().GetPathName(nullptr)).Append(", PtrUniqueId: ").Append(local_22_2.GetConfig().GetUniqueID()).Append(", AttributeDatasNum: ").Append(local_86_2.AttributeDatas.Num()).Append("."));
                for (auto& local_110 : local_86_2.AttributeDatas)
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
                if (local_86_2.Is(FWeaponConfig))
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
                int local_94 = local_286.Get().GetLevelLimit();
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

