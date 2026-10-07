

class US_TalentSystem : UECSScriptSystem
{
    US_TalentSystem()
    {
        return;
    }
    void CalcActiveTalentList(const FECSEntity &inout AvatarEntity, const uint FoundationTalentId, const TArray<TDataObjectPtr<FTalentConfig>> &inout UnlockTalentList, const TArray<uint> &inout ChooseTalentIdList, TArray<TDataObjectPtr<FTalentConfig>> &inout OutAllActiveTalentConfigs) const
    {
        int local_171 = 0;
        OutAllActiveTalentConfigs.Reset(0);
        TDataObjectPtr<FAvatarMappingConfig> local_26;
        TDataObjectPtr<FAvatarPrefabConfig> local_74 = ::GetAvatarConfig(AvatarEntity);
        if (local_74)
        {
            local_26 = ::UAvatarMappingSettings::Get().GetMappingConfigOfAvatar(local_74);
        }
        TArray<TDataObjectPtr<FTalentConfig>> local_130;
        for (auto local_144 : UnlockTalentList)
        {
            if (local_144.IsSet())
            {
                const FTalentConfig& local_146;
                if (!((local_146.GetAvatar() == local_26.opImplConv())))
                {
                    continue;
                }
                local_171 = int(local_146.DataId);
                if (local_171 == FoundationTalentId)
                {
                    local_130.Add(local_144);
                    continue;
                }
                if ((int(local_146.TalentType) != 1 && !(local_146.GetFoundationTalent())) || (local_146.GetFoundationTalent() && (local_171 == FoundationTalentId)))
                {
                    local_130.Add(local_144);
                }
            }
        }
        TMap<TDataObjectPtr<FTalentConfig>, TDataObjectPtr<FTalentConfig>> local_196;
        for (auto local_144 : local_130)
        {
            FTalentConfig local_568;
            if (local_568.GetChooseTalent())
            {
                if (!(ChooseTalentIdList.Contains(local_568.DataId)))
                {
                    continue;
                }
            }
            TDataObjectPtr<FTalentConfig> local_952;
            if (local_568.GetBaseTalent())
            {
                local_952 = local_568.GetBaseTalent();
            }
            else
            {
                local_952 = local_144;
            }
            TDataObjectPtr<FTalentConfig> local_1048;
            if (local_196.Find(local_952, local_1048))
            {
                if ((!(local_1048)) || (local_171 < int(local_568.TalentLevel)))
                {
                    local_196.Add(local_952, local_144);
                }
            }
            else
            {
                local_196.Add(local_952, local_144);
            }
        }
        local_196.GetValues(OutAllActiveTalentConfigs);
        return;
    }
    void CalcNewlyAddRemoveTalent(const TArray<TDataObjectPtr<FTalentConfig>> &inout OldAllActiveTalents, const TArray<TDataObjectPtr<FTalentConfig>> &inout NewAllActiveTalents, TArray<TDataObjectPtr<FTalentConfig>> &inout AddedTalents, TArray<TDataObjectPtr<FTalentConfig>> &inout RemovedTalents) const
    {
        TSet<uint> local_20;
        TSet<uint> local_40;
        for (auto& local_56 : OldAllActiveTalents)
        {
            FTalentConfig local_416;
            local_20.Add(local_416.DataId);
        }
        for (auto& local_56 : NewAllActiveTalents)
        {
            FTalentConfig local_416;
            local_40.Add(local_416.DataId);
            if (!(local_20.Contains(local_416.DataId)))
            {
                AddedTalents.Add(local_56);
            }
        }
        for (auto& local_56 : OldAllActiveTalents)
        {
            FTalentConfig local_416;
            if (!(local_40.Contains(local_416.DataId)))
            {
                RemovedTalents.Add(local_56);
            }
        }
        return;
    }
    void ApplyAddTalent(const FECSEntity &inout Entity, FC_CharacterTalent &inout CharacterTalent, const TDataObjectPtr<FTalentConfig> &inout TalentConfigPtr) const
    {
        FTalentConfig local_360;
        if (int(local_360.TalentType) == 1)
        {
            Entity.SetBB_Int(local_360.FoundationTalentBBKey, int(local_360.FoundationTalentBBValue));
        }
        TMap<uint, FCapabilityInstanceId>& local_726 = CharacterTalent.GetModify_AddedCapabilityInstanceIdByTalentId();
        if (local_360.GetCapabilityConfig())
        {
            FCapabilityInstanceId local_751 = FCapabilityUtils::AddCapability(Entity, TDataObjectPtr<FCapabilityConfig>(), int(local_360.CapabilityLevel));
            local_726.Add(local_751, local_751);
        }
        return;
    }
    void ApplyRemoveTalent(const FECSEntity &inout Entity, FC_CharacterTalent &inout CharacterTalent, const TDataObjectPtr<FTalentConfig> &inout TalentConfigPtr) const
    {
        FTalentConfig local_360;
        TMap<uint, FCapabilityInstanceId>& local_722 = CharacterTalent.GetModify_AddedCapabilityInstanceIdByTalentId();
        if (local_722.Contains(local_360.DataId))
        {
            FCapabilityUtils::RemoveCapabilityByInstanceId(Entity, local_722[local_360.DataId]);
        }
        return;
    }
    void UpdateTalentEffect(const FECSEntity &inout Entity, FC_CharacterTalent &inout CharacterTalent, const TArray<TDataObjectPtr<FTalentConfig>> &inout AddedTalents, const TArray<TDataObjectPtr<FTalentConfig>> &inout RemovedTalents, const TArray<TDataObjectPtr<FTalentConfig>> &inout NewAllActiveTalents) const
    {
        for (auto& local_16 : RemovedTalents)
        {
            this.ApplyRemoveTalent(Entity, CharacterTalent, local_16);
        }
        for (auto& local_16 : AddedTalents)
        {
            this.ApplyAddTalent(Entity, CharacterTalent, local_16);
        }
        CharacterTalent.SetAllActiveTalentConfigs(NewAllActiveTalents);
        TArray<FCapabilityParamModifier> local_20;
        for (auto& local_16 : CharacterTalent.GetAllActiveTalentConfigs())
        {
            local_16;
        }
        FCapabilityUtils::UpdateCapabilityParamModifiers(Entity, local_20);
        return;
    }
    UFUNCTION()
    void Job_InitCharacterTalent(const FECSEntity &inout Entity, const FC_ControlledByPlayer &inout ControlledByPlayer) const
    {
        int local_12 = 0;
        int local_18 = 0;
        int local_24 = 0;
        int local_74 = 0;
        int local_124 = 0;
        if (!(FECSEntity(ControlledByPlayer.GetPlayerEntity()).IsValid()))
        {
            return;
        }
        if (!(local_12))
        {
            return;
        }
        if (!(local_18))
        {
            return;
        }
        if (!(local_24))
        {
            return;
        }
        if (!(::GetAvatarConfig(Entity)))
        {
            return;
        }
        int local_73 = local_74;
        for (auto& local_88 : local_18.GetAvatarList())
        {
            if (local_88.GetAvatarId() != local_73)
            {
                continue;
            }
            this.CalcActiveTalentList(Entity, local_88.GetAvatarTalentEquipList().GetOnEquipFoundationId(), local_24.GetUnlockTalentList(), local_88.GetAvatarTalentEquipList().GetOnEquipChooseTalentIdList(), local_124.GetModify_AllActiveTalentConfigs());
            local_124.SetFoundationTalentId(local_88.GetAvatarTalentEquipList().GetOnEquipFoundationId());
            local_124.SetChooseTalentIdList(local_88.GetAvatarTalentEquipList().GetOnEquipChooseTalentIdList());
            this.UpdateTalentEffect(Entity, local_124, local_124.GetAllActiveTalentConfigs(), TArray<TDataObjectPtr<FTalentConfig>>(), local_124.GetAllActiveTalentConfigs());
            break;
        }
        return;
    }
    UFUNCTION()
    void ServerJob_OnUnlockTalent(const FCE_UpdateTalentUnlockInfo &inout Event) const
    {
        int local_6 = 0;
        int local_14 = 0;
        GetDataObjectByGSDataId<FTalentConfig> local_76;
        int local_168 = 0;
        bool local_7 = !(local_6);
        if (local_7)
        {
            return;
        }
        for (auto local_28 : Event.NewUnlockTalentIdList)
        {
            int local_77 = int(local_28);
            TDataObjectPtr<FTalentConfig> local_52 = local_76.opImplConv();
            if (local_52)
            {
                local_14.GetModify_UnlockTalentList().Add(local_52);
            }
        }
        for (auto& local_142 : local_6.GetAllPlayerPawnEntities())
        {
            ModifyOrAdd local_146;
            FC_CharacterTalent& local_148 = local_146.opCall();
            if (local_148)
            {
                TArray<TDataObjectPtr<FTalentConfig>> local_152;
                int local_77_2 = local_148.GetFoundationTalentId();
                this.CalcActiveTalentList(local_142, local_77_2, local_14.GetUnlockTalentList(), local_148.GetChooseTalentIdList(), local_152);
                TArray<TDataObjectPtr<FTalentConfig>> local_156;
                TArray<TDataObjectPtr<FTalentConfig>> local_160;
                this.CalcNewlyAddRemoveTalent(local_148.GetAllActiveTalentConfigs(), local_152, local_156, local_160);
                this.UpdateTalentEffect(local_142, local_148, local_156, local_160, local_152);
                if ((local_156.Num()) > 0)
                {
                    TDataObjectPtr<FAvatarPrefabConfig> local_192 = ::GetAvatarConfig(local_142);
                    if (!(local_168))
                    {
                        local_7 = false;
                    }
                    else
                    {
                        local_7 = local_192;
                    }
                    if (local_7)
                    {
                        int local_218;
                        local_218 = local_77_2;
                        for (auto& local_232 : local_168.GetAvatarList())
                        {
                            local_77_2 = local_232.GetAvatarId();
                            if (local_77_2 != local_218)
                            {
                                continue;
                            }
                            for (auto& local_250 : local_232.GetAvatarTalentEquipList().GetTalentIdBySkillSlot())
                            {
                                TDataObjectPtr<FTalentConfig> local_52_2 = local_76.opImplConv();
                                if (!(local_52_2))
                                {
                                    continue;
                                }
                                TDataObjectPtr<FTalentConfig> local_102 = GetBaseTalent() ? GetBaseTalent() : local_52_2;
                                for (auto& local_312 : local_156)
                                {
                                    TDataObjectPtr<FTalentConfig> local_298;
                                    if (GetBaseTalent())
                                    {
                                        local_298 = GetBaseTalent();
                                    }
                                    else
                                    {
                                        local_298 = local_312;
                                    }
                                    if ((!((local_298 == local_102.opImplConv()))))
                                    {
                                        continue;
                                    }
                                    if (::FTalentUtils::GetSkillInitConfigByTalentId(local_77_2))
                                    {
                                        local_7 = false;
                                        ESkillSlot local_457 = local_250.GetKey();
                                        FECSWorldPtr local_460 = ECS::GetECSWorld();
                                    }
                                    break;
                                }
                            }
                            break;
                        }
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_DebugUpdateUnlockTalent(const FCE_DebugUpdateTalentUnlockInfo &inout Event) const
    {
        int local_6 = 0;
        int local_14 = 0;
        if (!(local_6))
        {
            return;
        }
        local_14.GetModify_UnlockTalentList().Reset(0);
        for (auto local_30 : Event.NewAllUnlockTalentIdList)
        {
            int local_79 = int(local_30);
            GetDataObjectByGSDataId<FTalentConfig> local_78;
            TDataObjectPtr<FTalentConfig> local_54 = local_78.opImplConv();
            if (local_54)
            {
                local_14.GetModify_UnlockTalentList().Add(local_54);
            }
        }
        for (auto& local_142 : local_6.GetAllPlayerPawnEntities())
        {
            ModifyOrAdd local_146;
            FC_CharacterTalent& local_148 = local_146.opCall();
            if (local_148)
            {
                TArray<TDataObjectPtr<FTalentConfig>> local_152;
                this.CalcActiveTalentList(local_142, local_148.GetFoundationTalentId(), local_14.GetUnlockTalentList(), local_148.GetChooseTalentIdList(), local_152);
                TArray<TDataObjectPtr<FTalentConfig>> local_156;
                TArray<TDataObjectPtr<FTalentConfig>> local_160;
                this.CalcNewlyAddRemoveTalent(local_148.GetAllActiveTalentConfigs(), local_152, local_156, local_160);
                this.UpdateTalentEffect(local_142, local_148, local_156, local_160, local_152);
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_OnChangeAvatarTalent(const FCE_ChangeAvatarTalentEquipInfo &inout Event) const
    {
        int local_6 = 0;
        int local_52 = 0;
        bool local_53;
        bool local_54;
        int local_136 = 0;
        int local_314 = 0;
        if (!(local_6))
        {
            return;
        }
        FECSEntity local_12 = FECSEntity(ENTITY_NULL);
        for (auto& local_26 : local_6.GetAllPlayerPawnEntities())
        {
            TDataObjectPtr<FAvatarPrefabConfig> local_50 = ::GetAvatarConfig(local_26);
            if (0 == int(Event.AvatarId))
            {
                local_12 = local_26;
                break;
            }
        }
        local_53 = false;
        local_54 = false;
        TMap<ESkillSlot, uint> local_74;
        Modify local_78;
        FC_DSPlayerAvatarInfo& local_80 = local_78.opCall();
        if (local_80)
        {
            int local_81 = 0;
            for (; local_81 < local_80.GetAvatarList().Num(); ++local_81)
            {
                if (local_80.GetAvatarList()[local_81].GetAvatarId() != int(Event.AvatarId))
                {
                    continue;
                }
                FDSAvatarTalentEquipInfo& local_86 = local_80.GetModify_AvatarList()[local_81].GetAvatarTalentEquipList();
                local_52 = local_86.GetOnEquipFoundationId();
                if (local_52 != int(Event.NewFoundationId))
                {
                    local_53 = true;
                    local_86.SetOnEquipFoundationId(int(Event.NewFoundationId));
                }
                TArray<uint> local_90;
                local_90 = local_86.GetOnEquipChooseTalentIdList();
                if (!((local_90 == Event.NewChooseTalentIdList)))
                {
                    local_54 = true;
                    local_86.SetOnEquipChooseTalentIdList(Event.NewChooseTalentIdList);
                }
                TMap<ESkillSlot, uint> local_110 = local_86.GetTalentIdBySkillSlot();
                local_86.SetTalentIdBySkillSlot(Event.NewTalentIdBySkillSlot);
                for (auto& local_128 : Event.NewTalentIdBySkillSlot)
                {
                    if (!(local_110.Contains(local_128.GetKey())) || (local_110[local_128.GetKey()] != local_52))
                    {
                        local_74.Add(local_128.GetKey());
                    }
                }
                break;
            }
        }
        else
        {
            local_52 = int(Event.NewFoundationId);
            local_53 = (local_136.GetFoundationTalentId() != local_52);
            TArray<uint> local_90;
            local_90 = local_136.GetChooseTalentIdList();
            local_54 = !((local_90 == Event.NewChooseTalentIdList));
            local_74 = Event.NewTalentIdBySkillSlot;
        }
        if (local_12.IsValid())
        {
            if ((local_74.Num()) > 0)
            {
                for (auto& local_154 : local_74)
                {
                    GetDataObjectByGSDataId<FTalentConfig> local_202;
                    TDataObjectPtr<FTalentConfig> local_178 = local_202.opImplConv();
                    if (local_178)
                    {
                        if (::FTalentUtils::GetSkillInitConfigByTalentId(local_52))
                        {
                            ESkillSlot local_301 = local_154.GetKey();
                            FECSWorldPtr local_304 = ECS::GetECSWorld();
                        }
                    }
                }
            }
            if (local_53 || local_54)
            {
                TArray<TDataObjectPtr<FTalentConfig>> local_318;
                this.CalcActiveTalentList(local_12, int(Event.NewFoundationId), local_314.GetUnlockTalentList(), Event.NewChooseTalentIdList, local_318);
                local_136.SetFoundationTalentId(int(Event.NewFoundationId));
                local_136.SetChooseTalentIdList(Event.NewChooseTalentIdList);
                TArray<TDataObjectPtr<FTalentConfig>> local_326;
                TArray<TDataObjectPtr<FTalentConfig>> local_330;
                this.CalcNewlyAddRemoveTalent(local_136.GetAllActiveTalentConfigs(), local_318, local_326, local_330);
                this.UpdateTalentEffect(local_12, local_136, local_326, local_330, local_318);
                FFPTime local_336 = FFPTime(-1);
                FCE_ChangeAvatarTalentPassiveEffectChange local_338;
                local_338.AvatarId = int(Event.AvatarId);
            }
        }
        return;
    }
    UFUNCTION()
    void Run_Job_InitCharacterTalent() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_162 = 0;
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
                this.Job_InitCharacterTalent(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Include local_88;
        local_88.opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_90 = 0;
        FECSRuntimeViewIterator local_124 = local_80.Iterator();
        for (; local_124.CanProceed;)
        {
            local_36 = local_124.Proceed();
            ++local_90;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_InitCharacterTalent(local_162, local_38);
        }
        local_2.UpdateCachedEntityCount(local_90);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_OnUnlockTalent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_UpdateTalentUnlockInfo> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_UpdateTalentUnlockInfo& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_OnUnlockTalent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_DebugUpdateUnlockTalent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_DebugUpdateTalentUnlockInfo> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_DebugUpdateTalentUnlockInfo& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_DebugUpdateUnlockTalent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_OnChangeAvatarTalent() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_ChangeAvatarTalentEquipInfo> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_ChangeAvatarTalentEquipInfo& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_OnChangeAvatarTalent(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

