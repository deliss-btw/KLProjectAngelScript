

class US_CutScene : UECSScriptSystem
{
    US_CutScene()
    {
        return;
    }
    void ApplyEndEntityInfo(const FECSEntity &inout Entity, const FCutSceneEntityInfo &inout EntityInfo) const
    {
        if (::UTagTargetPointManager::Get().GetTagTransform(EntityInfo.EndLocationTag).IsSet())
        {
            FVector local_74;
            FRotator local_68;
            local_68.Rotator();
            local_74.GetLocation();
            ::BlueprintFunctions_Common::TeleportEntityToLocation(FECSEntityAdapter(Entity), ::CutSceneUtils::GetOffsetFloorLocation(Entity, local_74), local_68, true, EntityInfo.EndCameraRotation, true, true, ELoadingScreenAction(0), true);
        }
        if ((!((EntityInfo.ESMStateName == NAME_None))))
        {
            FESMExternalTransitHandle local_102 = Entity.ESMExternalTransitMainSM(EntityInfo.ESMStateName, n"CutScene");
            local_102.SetToStateTimeOffset(EntityInfo.ESMStateTime);
        }
        else
        {
            FESMExternalTransitHandle local_110 = Entity.ESMExternalTransitMainSM(n"Default", n"CutScene");
        }
        XLog(ELog(5), FString().Append("CutScene ApplyEndEntityInfo ESMExternalTransitMainSM: ").Append(EntityInfo.ESMStateName));
        return;
    }
    void ForceToEndState(const FECSEntity &inout PlayerEntity, FC_CutSceneLogicData &inout CutSceneLogicData) const
    {
        const FCutSceneData& local_2;
        FECSEntity local_14;
        if (local_2.EntityInfos.Find(CutSceneLogicData.GetPlayerTag()))
        {
            local_14 = ::FASCommonUtils::GetUniqueAvatarPawnEntity(PlayerEntity);
            if (local_14)
            {
                this.ApplyEndEntityInfo(local_14);
            }
        }
        for (auto& local_36 : CutSceneLogicData.GetEntities())
        {
            TConstRawPtr<FCutSceneEntityInfo> local_8 = local_2.EntityInfos.Find(local_36.GetKey());
            if (!(!(local_14)) && local_8)
            {
                this.ApplyEndEntityInfo(local_14);
            }
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateCutScene(const FECSEntity &inout Entity, FC_CutSceneLogicData &inout CutSceneLogicData, const FCS_FixedTime &inout FixedTime) const
    {
        bool local_1 = !(CutSceneLogicData.GetbPrevTeleported());
        bool local_2 = !(false);
        local_1 = local_1 == local_2 && ((FFPTime(FixedTime.Time).opCmp((FFPTime(CutSceneLogicData.GetStartTime()) + ((FFPTime(CutSceneLogicData.GetDuration()) / 2.0)))) > 0));
        if (local_1)
        {
            bool local_2_2 = !(CutSceneLogicData.GetbPrevTeleported());
            local_1 = !(false);
            CutSceneLogicData.SetbPrevTeleported(true);
            FECSEntity local_20 = ::FASCommonUtils::GetUniqueAvatarPawnEntity(Entity);
            FCutSceneData local_16;
            TConstRawPtr<FCutSceneEntityInfo> local_28 = local_16.EntityInfos.Find(CutSceneLogicData.GetPlayerTag());
            if (local_28)
            {
                if (::UTagTargetPointManager::Get().GetTagTransform(local_28.opArrow().EndLocationTag).IsSet())
                {
                    FVector local_100;
                    FRotator local_94;
                    local_94.Rotator();
                    local_100.GetLocation();
                    ::BlueprintFunctions_Common::TeleportEntityToLocation(FECSEntityAdapter(local_20), ::CutSceneUtils::GetOffsetFloorLocation(local_20, local_100), local_94, true, local_28.opArrow().EndCameraRotation, true, true, ELoadingScreenAction(0), true);
                }
            }
        }
        FFPTime local_12 = FFPTime(FixedTime.Time);
        if (local_12.opCmp((FFPTime(CutSceneLogicData.GetStartTime()) + CutSceneLogicData.GetDuration())) < 0)
        {
            return;
        }
        this.ForceToEndState(Entity, CutSceneLogicData);
        Remove local_120;
        local_120.opCall();
        return;
    }
    UFUNCTION()
    void ClientJob_PlayCutScene(const FECSEntity &inout PlayerEntity, const FC_CutSceneLogicData &inout CutSceneLogicData) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    UFUNCTION()
    void ClientJob_StopCutScene(const FECSEntity &inout PlayerEntity, FCS_CutSceneViewData &inout CutSceneViewData) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Job_OnCrossServerCutScenePlayerSpawned(const FCE_CrossServerCutScenePlayerSpawned &inout CrossServerCutScenePlayerSpawned) const
    {
        Modify local_4;
        FC_CutSceneLogicData& local_6 = local_4.opCall();
        if (local_6)
        {
            local_6.SetbSupportSkip(true);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_SkipCutScene(const FCE_SkipCutScene &inout SkipCutScene) const
    {
        Modify local_4;
        FC_CutSceneLogicData& local_6 = local_4.opCall();
        if (local_6)
        {
            if (local_6.GetbSupportSkip())
            {
                this.ForceToEndState(SkipCutScene.Sender, local_6);
                Remove local_12;
                local_12.opCall();
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_PostPlayCutSceneFinished(const FCE_PostPlayCutSceneFinished &inout PostPlayCutSceneFinished) const
    {
        PostPlayCutSceneFinished.LatentAction.Execute();
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateCutScene() const
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
                this.Job_UpdateCutScene(local_40, local_42, local_6);
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
            this.Job_UpdateCutScene(local_174, local_42, local_6);
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
    void Run_ClientJob_PlayCutScene() const
    {
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_174 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(!(local_8.opCall())) == !(false))
        {
            return;
        }
        int local_12 = 0;
        int local_11 = local_12;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_4_2 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_2.GetViewCacheEntities();
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
                this.ClientJob_PlayCutScene(local_40, local_42);
            }
            local_2.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Exclude(local_84).opCall();
        bool local_10 = local_2.BeginViewCacheBuild();
        int local_18 = local_2.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_84.Iterator();
        for (; local_136.CanProceed;)
        {
            local_40 = local_136.Proceed();
            ++local_102;
            if (local_10)
            {
                local_2.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ClientJob_PlayCutScene(local_174, local_42);
        }
        local_2.UpdateCachedEntityCount(local_102);
        if (local_10)
        {
            local_2.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_StopCutScene() const
    {
        int local_12 = 0;
        int local_174 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        int local_18 = 0;
        int local_17 = local_18;
        if (local_2.IsViewCacheUsable())
        {
            const FECSEntity& local_46;
            FECSWorldPtr local_4_3 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_22 = local_2.GetViewCacheEntities();
            int local_23 = 0;
            for (auto& local_38 : local_22)
            {
                local_38;
                FECSEntity local_42;
                if (!(local_42.IsValid()))
                {
                    continue;
                }
                ++local_23;
                FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42);
                this.ClientJob_StopCutScene(local_46, local_12);
            }
            local_2.UpdateCachedEntityCount(local_23);
        }
        else
        {
            const FECSEntity& local_46;
            FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
            Include local_88;
            local_88.opCall();
            Include local_92;
            local_92.opCall();
            Exclude(local_84).opCall();
            Exclude(local_84).opCall();
            bool local_9 = local_2.BeginViewCacheBuild();
            int local_24 = local_2.GetViewCacheEpoch();
            int local_102 = 0;
            FECSRuntimeViewIterator local_136 = local_84.Iterator();
            for (; local_136.CanProceed;)
            {
                local_46 = local_136.Proceed();
                ++local_102;
                if (local_9)
                {
                    local_2.AddViewCacheEntity(local_46.GetId());
                }
                FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_46);
                this.ClientJob_StopCutScene(local_174, local_12);
            }
            local_2.UpdateCachedEntityCount(local_102);
            if (local_9)
            {
                local_2.CommitViewCacheBuild(local_24);
            }
        }
        FECSWorldPtr local_20 = this.GetECSWorld();
        MarkModifiedIfDirty local_178;
        local_178.opCall(local_12);
        return;
    }
    UFUNCTION()
    void Run_Job_OnCrossServerCutScenePlayerSpawned() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_CrossServerCutScenePlayerSpawned> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_CrossServerCutScenePlayerSpawned& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_OnCrossServerCutScenePlayerSpawned(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_SkipCutScene() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_SkipCutScene> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_SkipCutScene& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_SkipCutScene(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_PostPlayCutSceneFinished() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PostPlayCutSceneFinished> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PostPlayCutSceneFinished& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_PostPlayCutSceneFinished(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

