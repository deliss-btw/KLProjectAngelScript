

class US_EcosimAIV2WorldCellSystem : UECSScriptSystem
{
    TArray<int> NearbyCellIndexList;

    US_EcosimAIV2WorldCellSystem()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    UFUNCTION()
    void Job_InitRealWorld() const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        ModifyOrAdd local_6;
        local_6.opCall();
        return;
    }
    UFUNCTION()
    void Job_InitPlayerEntityToCell(const FECSEntity &inout Entity, const FC_ControlledByPlayer &inout ControlledByPlayer) const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Modify local_6;
        FCS_EcosimAIV2WorldCell& local_8 = local_6.opCall();
        if (local_8)
        {
            local_8.AllEntityList.Add(FTargetEntity(Entity));
        }
        return;
    }
    UFUNCTION()
    void Job_InitRealWorldEntity(const FECSEntity &inout Entity, const FC_EcosimAIV2EntityInfo &inout EcosimAIV2EntityInfo) const
    {
        float32 local_8 = FECSAIUtils::GetEntityAgentRadius(Entity);
        return;
    }
    UFUNCTION()
    void Job_UpdateWorldCell(FCS_EcosimAIV2WorldCell &inout EcosimAIV2WorldCell) const
    {
        int local_1;
        bool local_31;
        int local_70 = 0;
        int local_138 = 0;
        int local_4 = EcosimAIV2WorldCell.AllEntityList.Num() - 1;
        for (; local_4 >= 0; --local_4)
        {
            if (!(EcosimAIV2WorldCell.AllEntityList[local_4].GetEntity().IsValid()))
            {
                EcosimAIV2WorldCell.AllEntityList.RemoveAt(local_4);
            }
        }
        auto local_16 = EcosimAIV2WorldCell.AllEntityList.Iterator();
        for (; local_16.CanProceed;)
        {
            FTargetEntity& local_24 = local_16.Proceed();
            if (!(local_24.GetEntity().IsValid()))
            {
                continue;
            }
            FECSEntity local_10 = local_24.GetEntity();
            Get local_28;
            const FC_Transform& local_30 = local_28.opCall();
            if (local_30)
            {
                local_31 = false;
                FVector local_38;
                if (!(EcosimAIV2WorldCell.EntityLastPositionMap.Contains(local_24)))
                {
                    local_31 = true;
                }
                else
                {
                    if (EcosimAIV2WorldCell.EntityLastPositionMap.Find(local_24, local_38))
                    {
                        if (local_30.GetPosition().DistSquared2D(local_38) >= EcosimAIV2WorldCell.CheckCellMoveOffsetSquared)
                        {
                            local_31 = true;
                        }
                    }
                }
                if (local_31)
                {
                    local_1 = FMath::FloorToInt((local_30.GetPosition().X / EcosimAIV2WorldCell.CellSize));
                    float local_46 = local_30.GetPosition().Y / EcosimAIV2WorldCell.CellSize;
                    local_46 = local_1;
                    FVector2D local_56 = FVector2D(local_46, FMath::FloorToInt(local_46));
                    FVector2D local_60;
                    if (EcosimAIV2WorldCell.EntityCellIndexMap.Find(local_24, local_60))
                    {
                        if (!((local_56 == local_60)))
                        {
                            EcosimAIV2WorldCell.EntityLastCellIndexMap.Add(local_24, local_60);
                            FEcosimAIV2WorldCellContent& local_62 = EcosimAIV2WorldCell.CellContentMap.FindOrAdd(local_60);
                            if (0 > 0)
                            {
                                local_62.IncreaseCellVersion();
                            }
                            FEcosimAIV2WorldCellContent& local_64 = EcosimAIV2WorldCell.CellContentMap.FindOrAdd(local_56);
                            if (local_64.EntityList.Add(local_24) > 0)
                            {
                                local_64.IncreaseCellVersion();
                            }
                            EcosimAIV2WorldCell.EntityCellIndexMap[local_24] = local_56;
                        }
                    }
                    else
                    {
                        EcosimAIV2WorldCell.EntityCellIndexMap.Add(local_24, local_56);
                        EcosimAIV2WorldCell.EntityLastCellIndexMap.Add(local_24, local_56);
                        FEcosimAIV2WorldCellContent& local_64_2 = EcosimAIV2WorldCell.CellContentMap.FindOrAdd(local_56);
                        if (local_64_2.EntityList.Add(local_24) > 0)
                        {
                            local_64_2.IncreaseCellVersion();
                        }
                    }
                    EcosimAIV2WorldCell.EntityLastPositionMap.Add(local_24, local_30.GetPosition());
                    EcosimAIV2WorldCell.EntityLastCellIndexMap.Add(local_24, local_56);
                }
            }
        }
        auto local_22 = EcosimAIV2WorldCell.AllEntityList.Iterator();
        TArray<FTargetEntity> local_104;
        FVector2D local_98;
        for (; local_22.CanProceed;)
        {
            FTargetEntity& local_24_2 = local_22.Proceed();
            FVector2D local_60;
            if (!(EcosimAIV2WorldCell.EntityCellIndexMap.Find(local_24_2, local_60)))
            {
                continue;
            }
            FECSEntity local_10_2 = local_24_2.GetEntity();
            TArray<uint64> local_74;
            local_74.SetNum(9);
            int local_4_2 = 0;
            auto local_80 = this.NearbyCellIndexList.Iterator();
            for (; local_80.CanProceed;)
            {
                local_1 = local_80.Proceed();
                auto local_86 = this.NearbyCellIndexList.Iterator();
                for (; local_86.CanProceed;)
                {
                    local_98 = (local_60 + FVector2D(local_1, local_86.Proceed()));
                    local_74[local_4_2] = EcosimAIV2WorldCell.CellContentMap.FindOrAdd(local_98).Version;
                    ++local_4_2;
                }
            }
            local_31 = false;
            if (EcosimAIV2WorldCell.EntityLastCellIndexMap.Find(local_24_2, local_98))
            {
                if (!((local_60 == local_98)))
                {
                    local_31 = true;
                }
                else
                {
                    if (local_70.Last9CellVersions.Num() == 9)
                    {
                        bool local_105;
                        local_105 = false;
                        local_1 = 0;
                        for (; local_1 < 9; ++local_1)
                        {
                            if (local_74[local_1] != local_70.Last9CellVersions[local_1])
                            {
                                local_105 = true;
                                break;
                            }
                        }
                        local_31 = local_105;
                    }
                    else
                    {
                    }
                }
            }
            else
            {
                local_31 = true;
            }
            if (local_31)
            {
                for (auto local_93 : this.NearbyCellIndexList)
                {
                    local_80 = this.NearbyCellIndexList.Iterator();
                    for (; local_80.CanProceed;)
                    {
                        float local_46_3 = local_80.Proceed();
                        float local_42_3 = local_93;
                        local_104.Append(EcosimAIV2WorldCell.CellContentMap.FindOrAdd((local_60 + FVector2D(local_42_3, local_46_3))).EntityList);
                    }
                }
                TArray<FTargetEntity> local_116;
                TArray<FTargetEntity> local_120;
                for (auto& local_128 : local_104)
                {
                    if (!(local_70.EngagingTargetEntityList.Contains(local_128)))
                    {
                        local_116.Add(local_128);
                    }
                }
                for (auto& local_128 : local_70.EngagingTargetEntityList)
                {
                    if (!(local_104.Contains(local_128)))
                    {
                        local_120.Add(local_128);
                    }
                }
                local_70.EngagingTargetEntityList = local_104;
                local_70.Last9CellVersions = local_74;
                if (local_116.Num() > 0 || (local_120.Num() > 0))
                {
                    FFPTime local_136 = FFPTime(-1);
                    FECSEntity local_10_3 = local_24_2.GetEntity();
                    local_138.AddedEntities = local_116;
                    local_138.RemovedEntities = local_120;
                }
            }
        }
        return;
    }
    UFUNCTION()
    void Job_HandleEcosimAIV2EntityEngagingTargetChange(const FCE_EcosimAIV2EntityEngagingTargetChange &inout Event) const
    {
        FECSEntity local_4 = FECSEntity(Event.Sender);
        for (auto& local_20 : Event.AddedEntities)
        {
            local_20;
        }
        for (auto& local_20 : Event.RemovedEntities)
        {
            local_20;
        }
        return;
    }
    UFUNCTION()
    void Run_Job_InitRealWorld() const
    {
        ECS::GetContextJob();
        this.Job_InitRealWorld();
        return;
    }
    UFUNCTION()
    void Run_Job_InitPlayerEntityToCell() const
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
                this.Job_InitPlayerEntityToCell(local_36, local_38);
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
            this.Job_InitPlayerEntityToCell(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_InitRealWorldEntity() const
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
                this.Job_InitRealWorldEntity(local_36, local_38);
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
            this.Job_InitRealWorldEntity(local_166, local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateWorldCell() const
    {
        int local_18 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(0.5))))
        {
            return;
        }
        FECSWorldPtr local_12 = this.GetECSWorld();
        Has local_16;
        if (!(local_16.opCall()))
        {
            return;
        }
        FECSWorldPtr local_12_2 = this.GetECSWorld();
        this.Job_UpdateWorldCell(local_18);
        FECSWorldPtr local_12_3 = this.GetECSWorld();
        MarkModifiedIfDirty local_26;
        local_26.opCall(local_18);
        return;
    }
    UFUNCTION()
    void Run_Job_HandleEcosimAIV2EntityEngagingTargetChange() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_EcosimAIV2EntityEngagingTargetChange> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_EcosimAIV2EntityEngagingTargetChange& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.Job_HandleEcosimAIV2EntityEngagingTargetChange(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

