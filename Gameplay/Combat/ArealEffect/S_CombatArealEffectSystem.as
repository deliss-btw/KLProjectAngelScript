

class US_CombatArealEffectSystem : UECSScriptSystem
{
    US_CombatArealEffectSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_InitArealEffectFX(const FECSEntity &inout Entity, const FC_CombatArealEffectFXConfig &inout Config, const FC_Owner &inout OwnerComp, const FC_Transform &inout Transform, const FCS_FixedTime &inout FixedTime) const
    {
        int local_256;
        int local_274 = 0;
        FFXConfig local_232 = Config.FXConfig.GetFXConfig();
        local_232.SetbUseWorldOriginAsBaseTransformSource(false);
        local_232.SetLocationOffsetSpace(EFXOffsetSpace(0));
        local_232.SetRotationOffsetSpace(EFXOffsetSpace(0));
        if (Config.FXConfig.bDetach)
        {
            local_232.SetLocationOffset(Transform.GetPosition());
            local_232.SetRotationOffset(Transform.GetRotation().Rotator());
            local_232.SetbUseWorldOriginAsBaseTransformSource(true);
            local_232.SetLocationOffsetSpace(EFXOffsetSpace(2));
            local_232.SetRotationOffsetSpace(EFXOffsetSpace(2));
        }
        FECSEntity local_244 = FECSEntity(OwnerComp.GetOwnerEntity());
        if (!(local_244.IsValid()))
        {
            local_244 = Entity;
        }
        if (int(Config.StopMethodOnActionEnd) == 0)
        {
            int local_257;
            local_257 = 0;
            local_256 = local_257;
        }
        else
        {
            int local_257;
            local_257 = 1;
            local_256 = local_257;
        }
        local_274.SetFXEntity(ECSFX::PlayFXDurationalEx(local_244, local_232, FixedTime.Time, 1.0f, true, Entity, EAttachFXStopMethod(local_256)));
        Get local_278;
        const FC_CombatArealEffectSpawnerConfig& local_280 = local_278.opCall();
        if (local_280)
        {
            local_274.SetbActiveEmitter(!(local_280.bOnlyEmitFXGround));
        }
        return;
    }
    UFUNCTION()
    void Job_InitArealEffectSpawner(const FECSEntity &inout Entity, const FC_CombatArealEffectSpawnerConfig &inout Config, const FC_Transform &inout Transform, const FCS_FixedTime &inout FixedTime) const
    {
        int local_16 = 0;
        local_16.SetLastSpawnPos(Transform.GetPosition());
        local_16.SetNextSpawnTime((FFPTime(FixedTime.Time) + FECSWorld::FixedFrameInterval));
        return;
    }
    UFUNCTION()
    void Job_UpdateArealEffectSpawner(const FECSEntity &inout Entity, const FC_Transform &inout Transform, const FC_CombatArealEffectSpawnerConfig &inout Config, FC_CombatArealEffectSpawnerRuntime &inout Runtime, const FCS_FixedTime &inout FixedTime) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void CheckRangeTarget(FECSRuntimeQuery &inout Query, const FECSEntity &inout Entity, FC_CombatArealEffectRuntime &inout Runtime, const FECSEntity &inout OwnerEntity, const FVector &inout Position, const FCombatArealEffectData &inout AreaData, TArray<FECSEntity> &inout OutLeaveEntities, TArray<FECSEntity> &inout OutEnterEntities) const
    {
        switch (int(AreaData.GetRange()))
        {
        case 0:
        {
            Query.FilterByDistance(Position, AreaData.GetDistance());
            break;
        }
        case 1:
        {
            Query.FilterByDistanceXY(Position, AreaData.GetDistance());
            break;
        }
        case 2:
        {
            Query.FilterByBox(Position, AreaData.GetBoxExtent());
            break;
        }
        }
        Get local_8;
        const FC_Faction& local_10 = local_8.opCall();
        if (local_10)
        {
            FFactionBitMask local_19;
            int local_2 = 1 & AreaData.GetTargetRelation();
            if (local_2 != 0)
            {
                local_19.CombineFactionMask(::FASCommonUtils::GetFactionBitMaskByRelation(local_10.GetFactionId(), EFactionRelation(1)));
            }
            local_2 = 2 & AreaData.GetTargetRelation();
            if (local_2 != 0)
            {
                local_19.CombineFactionMask(::FASCommonUtils::GetFactionBitMaskByRelation(local_10.GetFactionId(), EFactionRelation(2)));
            }
            int local_21 = 4 & AreaData.GetTargetRelation();
            if (local_21 != 0)
            {
                local_19.CombineFactionMask(::FASCommonUtils::GetFactionBitMaskByRelation(local_10.GetFactionId(), EFactionRelation(4)));
                local_2 = 8 & AreaData.GetTargetRelation();
                if (local_2 == 0)
                {
                    Query.AddIgnoreEntityId(Entity.GetId());
                }
            }
            Query.FilterByFactionBitMask(local_19);
        }
        TMap<FECSEntity, FFPTime> local_54 = Runtime.GetEntityLastEffectedTime();
        FECSRuntimeQueryIterator local_76 = Query.Iterator();
        for (; local_76.CanProceed;)
        {
            const FECSEntity& local_100 = local_76.Proceed();
            if ((int(::FASCommonUtils::GetEntityFactionRelationSplitSelf(OwnerEntity, local_100)) & AreaData.GetTargetRelation()) == 0)
            {
                continue;
            }
            if (Runtime.GetEntityLastEffectedTime().Contains(local_100))
            {
                continue;
            }
            OutEnterEntities.Add(local_100);
        }
        for (auto& local_124 : local_54)
        {
            OutLeaveEntities.Add(local_124.GetKey());
        }
        return;
    }
    void CheckRangeTargetByHitTestShape(const FHitTestShape &inout Shape, const FECSEntity &inout Entity, FC_CombatArealEffectRuntime &inout Runtime, const FECSEntity &inout OwnerEntity, const FCombatArealEffectData &inout AreaData, TArray<FECSEntity> &inout OutLeaveEntities, TArray<FECSEntity> &inout OutEnterEntities) const
    {
        TMap<FECSEntity, FFPTime> local_20 = Runtime.GetEntityLastEffectedTime();
        FECSWorldPtr local_24 = this.GetECSWorld();
        TArray<FHitTestResult> local_30;
        GetDefaulted local_36;
        FTransform local_60 = local_36.opCall().ToFTransform();
        UWorld local_64 = this.GetWorld();
        for (auto& local_80 : local_30)
        {
            if (local_80.HitEntity.IsValid())
            {
                Has local_84;
                if (local_84.opCall())
                {
                    if (local_84.opCall())
                    {
                        if (int(::FASCommonUtils::GetEntityFactionRelationSplitSelf(OwnerEntity, local_80.HitEntity)) & AreaData.GetTargetRelation() == 0)
                        {
                            continue;
                        }
                    }
                    else
                    {
                        int local_90 = 1 & AreaData.GetTargetRelation();
                        if (local_90 == 0)
                        {
                            continue;
                        }
                    }
                }
                if (Runtime.GetEntityLastEffectedTime().Contains(local_80.HitEntity))
                {
                    continue;
                }
                OutEnterEntities.Add(local_80.HitEntity);
            }
        }
        for (auto& local_110 : local_20)
        {
            OutLeaveEntities.Add(local_110.GetKey());
        }
        return;
    }
    void InitArealBuff(const FECSEntity &inout Entity, const FCombatArealEffectConfigData_Buff &inout Data) const
    {
        if (Data.AddBuffDatas.IsEmpty())
        {
            XError(ELog(26), FString().Append("InitArealAbilityEffectTrigger AddBuffDatas is empty, Entity: ").Append(Entity.GetEntityName()));
            return;
        }
        FC_CombatArealEffectRuntime local_38;
        Assign local_14;
        local_14.opCall(local_38);
        return;
    }
    void DoUpdateArealBuff(const FECSEntity &inout Entity, FC_CombatArealEffectRuntime &inout Runtime, const FCombatArealEffectConfigData_Buff &inout Data, TArray<FECSEntity> &inout LeaveEntities, TArray<FECSEntity> &inout EnterEntities, const FFPTime &inout Time) const
    {
        int local_22 = 0;
        int local_114 = 0;
        if ((EnterEntities.IsEmpty() && (!(Data.bRemoveBuffOnLeaveArea) || LeaveEntities.IsEmpty())) && (!(Data.bAddRepeatedlyEntityInnerRange) || Runtime.GetEntityLastEffectedTime().IsEmpty()))
        {
            return;
        }
        Get local_12;
        FECSEntity local_8 = FECSEntity(local_12.opCall().GetOwnerEntity());
        if (!(local_8.IsValid()))
        {
            return;
        }
        bool local_1 = Data.bRemoveBuffOnLeaveArea;
        if (local_1)
        {
            for (auto& local_36 : LeaveEntities)
            {
                if (!(local_36.IsValid()))
                {
                    local_1 = false;
                }
                else
                {
                    Has local_40;
                    local_1 = local_40.opCall();
                }
                if (local_1)
                {
                    FCombatArealEffectBuffAddedData local_44;
                    if (local_22.GetDataByOwnerEntity().Find(local_36.GetId(), local_44))
                    {
                        for (auto& local_60 : local_44.GetBuffEntityIds())
                        {
                            FECSEntity local_64 = FECSEntity(local_60);
                            if (local_64.IsValid() && local_64.IsActive())
                            {
                                FBuffUtils::RemoveBuff(local_36, local_64, Time, EBuffEndType(0));
                            }
                        }
                        FECSEntityId local_45 = local_36.GetId();
                    }
                }
            }
        }
        FFPTime local_86;
        if (Data.bAddRepeatedlyEntityInnerRange)
        {
            for (auto& local_84 : Runtime.GetEntityLastEffectedTime())
            {
                if ((local_86 + Data.AddAgainInnerRangeInterval).opCmp(Time) <= 0)
                {
                    TArray<FECSEntityId> local_94;
                    bool local_1_2 = (local_8 == local_84.GetKey());
                    for (auto& local_110 : Data.AddBuffDatas)
                    {
                        FECSEntity local_16 = FBuffUtils::AddBuff(local_84.GetKey(), local_110.BuffConfig, Time, local_8, local_1_2, local_110.OverrideDuration, int(local_110.AddBuffStackNum), false);
                        if (local_16.IsValid())
                        {
                            local_94.Add(local_16.GetId());
                        }
                    }
                    if (Data.bRemoveBuffOnLeaveArea)
                    {
                        FECSEntityId local_45_2 = local_84.GetKey().GetId();
                        local_114.GetBuffEntityIds().Append(local_94);
                    }
                    Runtime.GetModify_EntityLastEffectedTime()[local_84.GetKey()] = Time;
                }
            }
        }
        for (auto& local_36 : EnterEntities)
        {
            TArray<FECSEntityId> local_94;
            bool local_95 = (local_8 == local_36);
            for (auto& local_110 : Data.AddBuffDatas)
            {
                FECSEntity local_64_2 = FBuffUtils::AddBuff(local_36, local_110.BuffConfig, Time, local_8, local_95, local_110.OverrideDuration, int(local_110.AddBuffStackNum), false);
                if (local_64_2.IsValid())
                {
                    local_94.Add(local_64_2.GetId());
                }
            }
            if (Data.bRemoveBuffOnLeaveArea)
            {
                FECSEntityId local_45_3 = local_36.GetId();
                local_114.GetBuffEntityIds().Append(local_94);
            }
            Runtime.GetModify_EntityLastEffectedTime().Add(local_36, Time);
        }
        return;
    }
    UFUNCTION()
    void Job_InitArealEffectBuffByConfig(const FECSEntity &inout Entity, const FC_CombatArealEffectBuffConfig &inout Config) const
    {
        this.InitArealBuff(Entity, Config.ConfigData);
        return;
    }
    UFUNCTION()
    void Job_InitArealEffectBuffOverride(const FECSEntity &inout Entity, const FC_CombatArealEffectBuffOverride &inout Override) const
    {
        TDataObjectPtr<FCombatArealEffectConfigDataObject_Buff> local_24;
        local_24 = Override.GetDataObject();
        if ((!((local_24 == nullptr))))
        {
            return;
        }
        XError(ELog(8), FString().Append("FC_CombatArealEffectBuffOverride DataObject invalid, entity: ").Append(Entity.GetEntityName()));
        Remove local_62;
        local_62.opCall();
        return;
    }
    void UpdateArealBuffByConfigData(const FECSEntity &inout Entity, const FCombatArealEffectConfigData_Buff &inout ConfigData, FC_CombatArealEffectRuntime &inout Runtime, const FC_Owner &inout OwnerComp, const FC_Transform &inout Transform, const FCS_FixedTime &inout FixedTime) const
    {
        FFPTime local_2 = FFPTime(Runtime.GetNextCheckTime());
        if (local_2.opCmp(FixedTime.Time) <= 0)
        {
            TArray<FECSEntity> local_8;
            TArray<FECSEntity> local_12;
            Get local_16;
            const FC_CombatArealEffectTestShape& local_18 = local_16.opCall();
            if (local_18)
            {
                this.CheckRangeTargetByHitTestShape(local_18.GetShape(), Entity, Runtime, OwnerComp.GetOwnerEntity(), ConfigData.AreaData, local_8, local_12);
            }
            else
            {
                FECSRuntimeQuery local_64 = FECSRuntimeQueryHelper::MakeRuntimeQuery(Entity, EECSQueryRegsitryType(1), false);
                Include local_108;
                local_108.opCall();
                this.CheckRangeTarget(local_64, Entity, Runtime, OwnerComp.GetOwnerEntity(), Transform.GetPosition(), ConfigData.AreaData, local_8, local_12);
            }
            this.DoUpdateArealBuff(Entity, Runtime, ConfigData, local_8, local_12, FixedTime.Time);
            FFPTime local_2_2 = FFPTime(Runtime.GetNextCheckTime());
            if (local_2_2.opCmp(0.0) <= 0)
            {
                Runtime.SetNextCheckTime((FFPTime(FixedTime.Time) + FFPTime(ConfigData.AreaData.GetRangeCheckInterval())));
            }
            else
            {
                FFPTime local_114 = (Runtime.GetNextCheckTime() + FFPTime(ConfigData.AreaData.GetRangeCheckInterval()));
                Runtime.SetNextCheckTime(local_114);
            }
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateArealEffectBuffByConfig(const FECSEntity &inout Entity, const FC_CombatArealEffectBuffConfig &inout Config, FC_CombatArealEffectRuntime &inout Runtime, const FC_Owner &inout OwnerComp, const FC_Transform &inout Transform, const FCS_FixedTime &inout FixedTime) const
    {
        if ((!(Config) || !(OwnerComp) || !(Transform)))
        {
            return;
        }
        this.UpdateArealBuffByConfigData(Entity, Config.ConfigData, Runtime, OwnerComp, Transform, FixedTime);
        return;
    }
    UFUNCTION()
    void Job_UpdateArealEffectBuffOverride(const FECSEntity &inout Entity, const FC_CombatArealEffectBuffOverride &inout Override, FC_CombatArealEffectRuntime &inout Runtime, const FC_Owner &inout OwnerComp, const FC_Transform &inout Transform, const FCS_FixedTime &inout FixedTime) const
    {
        if ((!(Override) || !(OwnerComp) || !(Transform)))
        {
            return;
        }
        return;
    }
    UFUNCTION()
    void Monitor_OnArealEffectBuffRemove(const FECSEntity &inout Entity, const FC_CombatArealEffectBuffAddedData &inout CombatArealEffectBuffAddedData) const
    {
        bool local_1;
        if (!(CombatArealEffectBuffAddedData.GetDataByOwnerEntity().IsEmpty()))
        {
            FECSWorldPtr local_6 = Entity.GetWorld();
            Get local_10;
            FFPTime local_4 = FFPTime(local_10.opCall().Time);
            for (auto& local_28 : CombatArealEffectBuffAddedData.GetDataByOwnerEntity())
            {
                FECSEntity local_32 = FECSEntity(local_28.GetKey());
                if (!(local_32.IsValid()))
                {
                    local_1 = false;
                }
                else
                {
                    Has local_36;
                    local_1 = local_36.opCall();
                }
                if (local_1)
                {
                    for (auto& local_52 : GetBuffEntityIds())
                    {
                        FECSEntity local_56 = FECSEntity(local_52);
                        if (local_56.IsValid() && local_56.IsActive())
                        {
                            FBuffUtils::RemoveBuff(local_32, local_56, local_4, EBuffEndType(0));
                        }
                    }
                }
            }
        }
        return;
    }
    void InitArealAbilityEffectTrigger(const FECSEntity &inout Entity, const FC_Owner &inout OwnerComp, const FCombatArealEffectConfigData_AbilityEffectTrigger &inout Data) const
    {
        int local_76 = 0;
        if (!(Data.bTriggerOnEntityOutOfRange) && !(Data.bTriggerOnEntityOutOfRange))
        {
            XError(ELog(8), FString().Append("ArealEffectAbilityEffectTriggerConfig (!bTriggerOnEntityOutOfRange && !bTriggerOnEntityOutOfRange) casue nothing todo! Entity: ").Append(Entity.GetEntityName()));
            return;
        }
        FECSEntity local_14 = FECSEntity(OwnerComp.GetOwnerEntity());
        Has local_22;
        while (local_14.IsValid() && !(local_22.opCall()))
        {
            Get local_26;
            const FC_Owner& local_28 = local_26.opCall();
            if (local_28)
            {
                local_14 = local_28.GetOwnerEntity();
            }
            else
            {
                return;
            }
        }
        if (!(local_14.IsValid()))
        {
            return;
        }
        Get local_32;
        if ((local_32.opCall().GetInstanceEntityId(FSoftClassPath(Data.AbilityClass)) == ENTITY_ID_NULL))
        {
            return;
        }
        local_76.SetAbilityOwner(local_14);
        if (Data.bTriggerOnEntityOutOfRange)
        {
            local_76.RegisterEvent(EAbilityEffectEvent(7), Data.AbilityClass, Data.EventName);
        }
        if (Data.bTriggerOnEntityOutOfRange)
        {
            local_76.RegisterEvent(EAbilityEffectEvent(8), Data.AbilityClass, Data.EventName);
        }
        FC_CombatArealEffectRuntime local_106;
        Assign local_82;
        local_82.opCall(local_106);
        return;
    }
    void DoUpdateArealAbilityEffectTrigger(const FECSEntity &inout Entity, FC_CombatArealEffectRuntime &inout Runtime, const FCombatArealEffectConfigData_AbilityEffectTrigger &inout Data, TArray<FECSEntity> &inout LeaveEntities, TArray<FECSEntity> &inout EnterEntities, const FFPTime &inout Time) const
    {
        if ((Data.AbilityClass == nullptr))
        {
            XError(ELog(26), FString().Append("CombatArealEffect AbilityEffectTrigger AbilityClass is empty, Entity: ").Append(Entity.GetEntityName()));
            return;
        }
        if ((EnterEntities.IsEmpty() && (!(Data.bTriggerOnEntityOutOfRange) || LeaveEntities.IsEmpty())) && (!(Data.bTriggerRepeatedlyEntityInnerRange) || Runtime.GetEntityLastEffectedTime().IsEmpty()))
        {
            return;
        }
        Get local_22;
        if (!(FECSEntity(local_22.opCall().GetOwnerEntity()).IsValid()))
        {
            return;
        }
        bool local_3 = Data.bTriggerOnEntityOutOfRange;
        if (local_3)
        {
            for (auto& local_40 : LeaveEntities)
            {
                if (!(local_40.IsValid()))
                {
                    local_3 = false;
                }
                else
                {
                    Has local_44;
                    local_3 = local_44.opCall();
                }
                if (local_3)
                {
                    FAbilityEffectEventData_ArealEffect local_48;
                    local_48.SetTargetEntity(local_40);
                }
            }
        }
        FFPTime local_72;
        if (Data.bTriggerRepeatedlyEntityInnerRange)
        {
            for (auto& local_70 : Runtime.GetEntityLastEffectedTime())
            {
                if ((local_72 + Data.TriggerAgainInnerRangeInterval).opCmp(Time) <= 0)
                {
                    FAbilityEffectEventData_ArealEffect local_48;
                    local_48.SetTargetEntity(local_70.GetKey());
                    Runtime.GetModify_EntityLastEffectedTime()[local_70.GetKey()] = Time;
                }
            }
        }
        for (auto& local_40 : EnterEntities)
        {
            FAbilityEffectEventData_ArealEffect local_48;
            local_48.SetTargetEntity(local_40);
            Runtime.GetModify_EntityLastEffectedTime().Add(local_40, Time);
        }
        return;
    }
    UFUNCTION()
    void Job_InitArealAbilityEffectTriggerByConfig(const FECSEntity &inout Entity, const FC_CombatArealEffectAbilityEffectTriggerConfig &inout Config, const FC_Owner &inout OwnerComp) const
    {
        this.InitArealAbilityEffectTrigger(Entity, OwnerComp, Config.ConfigData);
        return;
    }
    UFUNCTION()
    void Job_InitArealAbilityEffectTriggerByOverride(const FECSEntity &inout Entity, const FC_CombatArealEffectAbilityEffectTriggerOverride &inout Override, const FC_Owner &inout OwnerComp) const
    {
        TDataObjectPtr<FCombatArealEffectConfigDataObject_AbilityEffectTrigger> local_24;
        local_24 = Override.GetDataObject();
        if ((!((local_24 == nullptr))))
        {
            return;
        }
        XError(ELog(8), FString().Append("FC_CombatArealEffectAbilityEffectTriggerOverride DataObject invalid, entity: ").Append(Entity.GetEntityName()));
        Remove local_62;
        local_62.opCall();
        return;
    }
    void UpdateArealAbilityEffectTriggerByConfigData(const FECSEntity &inout Entity, const FCombatArealEffectConfigData_AbilityEffectTrigger &inout ConfigData, FC_CombatArealEffectRuntime &inout Runtime, const FC_Owner &inout OwnerComp, const FC_Transform &inout Transform, const FCS_FixedTime &inout FixedTime) const
    {
        FFPTime local_2 = FFPTime(Runtime.GetNextCheckTime());
        if (local_2.opCmp(FixedTime.Time) <= 0)
        {
            TArray<FECSEntity> local_8;
            TArray<FECSEntity> local_12;
            Get local_16;
            const FC_CombatArealEffectTestShape& local_18 = local_16.opCall();
            if (local_18)
            {
                this.CheckRangeTargetByHitTestShape(local_18.GetShape(), Entity, Runtime, OwnerComp.GetOwnerEntity(), ConfigData.AreaData, local_8, local_12);
            }
            else
            {
                FECSRuntimeQuery local_64 = FECSRuntimeQueryHelper::MakeRuntimeQuery(Entity, EECSQueryRegsitryType(1), false);
                this.CheckRangeTarget(local_64, Entity, Runtime, OwnerComp.GetOwnerEntity(), Transform.GetPosition(), ConfigData.AreaData, local_8, local_12);
            }
            this.DoUpdateArealAbilityEffectTrigger(Entity, Runtime, ConfigData, local_8, local_12, FixedTime.Time);
            FFPTime local_2_2 = FFPTime(Runtime.GetNextCheckTime());
            if (local_2_2.opCmp(0.0) <= 0)
            {
                Runtime.SetNextCheckTime((FFPTime(FixedTime.Time) + FFPTime(ConfigData.AreaData.GetRangeCheckInterval())));
            }
            else
            {
                FFPTime local_110 = (Runtime.GetNextCheckTime() + FFPTime(ConfigData.AreaData.GetRangeCheckInterval()));
                Runtime.SetNextCheckTime(local_110);
            }
        }
        return;
    }
    UFUNCTION()
    void Job_UpdateArealAbilityEffectTriggerByConfig(const FECSEntity &inout Entity, const FC_CombatArealEffectAbilityEffectTriggerConfig &inout Config, FC_CombatArealEffectRuntime &inout Runtime, const FC_Owner &inout OwnerComp, const FC_Transform &inout Transform, const FCS_FixedTime &inout FixedTime) const
    {
        if ((!(Config) || !(OwnerComp) || !(Transform)))
        {
            return;
        }
        this.UpdateArealAbilityEffectTriggerByConfigData(Entity, Config.ConfigData, Runtime, OwnerComp, Transform, FixedTime);
        return;
    }
    UFUNCTION()
    void Job_UpdateArealAbilityEffectTriggerOverride(const FECSEntity &inout Entity, const FC_CombatArealEffectAbilityEffectTriggerOverride &inout Override, FC_CombatArealEffectRuntime &inout Runtime, const FC_Owner &inout OwnerComp, const FC_Transform &inout Transform, const FCS_FixedTime &inout FixedTime) const
    {
        if ((!(Override) || !(OwnerComp) || !(Transform)))
        {
            return;
        }
        return;
    }
    void InitArealHitTest(const FECSEntity &inout Entity, const FCombatArealEffectConfigData_HitTest &inout ConfigData) const
    {
        if (!(ConfigData.AttackData.IsValid()))
        {
            XError(ELog(26), FString().Append("InitArealEffectHitTest AttackData is empty, Entity: ").Append(Entity.GetEntityName()));
            return;
        }
        FC_CombatArealEffectRuntime local_38;
        Assign local_14;
        local_14.opCall(local_38);
        return;
    }
    void UpdateArealHitTest(const FECSEntity &inout Entity, const FCombatArealEffectConfigData_HitTest &inout ConfigData, FC_CombatArealEffectRuntime &inout Runtime, const FC_Owner &inout OwnerComp, const FC_Transform &inout Transform, const FCS_FixedTime &inout FixedTime) const
    {
        float local_60;
        FFPTime local_2 = FFPTime(Runtime.GetNextCheckTime());
        if (local_2.opCmp(FixedTime.Time) <= 0)
        {
            FCE_ArealStrikeRequestEvent local_48;
            FHitTestShape local_28;
            const FC_CombatArealEffectTestShape& local_34 = FECSEntity::Get<FC_CombatArealEffectTestShape>(Entity).opCall();
            if (local_34)
            {
                local_28 = local_34.GetShape();
            }
            else
            {
                if (int(ConfigData.AreaData.GetRange()) == 0)
                {
                    local_28.SetShapeType(EHitTestShapeType(EHitTestShapeType(3)));
                    local_28.SetSphereRadius(ConfigData.AreaData.GetDistance());
                }
                else
                {
                    if (int(ConfigData.AreaData.GetRange()) == 1)
                    {
                        local_28.SetShapeType(EHitTestShapeType(EHitTestShapeType(4)));
                        local_28.SetSphereRadius(ConfigData.AreaData.GetDistance());
                        local_28.SetHalfHeight(1000.0f);
                    }
                    else
                    {
                        if (int(ConfigData.AreaData.GetRange()) == 2)
                        {
                            local_28.SetShapeType(EHitTestShapeType(EHitTestShapeType(1)));
                            local_28.SetBoxHalfExtend(ConfigData.AreaData.GetBoxExtent());
                        }
                    }
                }
            }
            FECSEntity local_42 = OwnerComp.GetOwnerEntity();
            local_48.Shape = local_28;
            local_48.AttackInfo.AttackData = ConfigData.AttackData;
            local_48.StrikeKey = ConfigData.StrikeKey;
            local_48.HitInterval = ConfigData.HitInterval;
            local_48.TransformPos = Transform.GetPosition();
            local_48.TransformRot = FQuat4f(Transform.GetRotation());
            local_48.StrikeEventData.StrikeDirection = Transform.GetRotation().GetUpVector();
            local_48.StrikeEventData.StrikeShape.Angle = 180.0f;
            local_48.StrikeEventData.StrikeShape.InnerRadius = 0.0f;
            if (int(local_28.GetShapeType()) == 1)
            {
                local_60 = local_28.GetBoxHalfExtend().Z;
            }
            else
            {
                local_60 = ConfigData.AreaData.GetDistance();
            }
            local_48.StrikeEventData.StrikeShape.OuterRadius = float32(local_60);
            local_48.StrikeEventData.StrikeShape.NumDivision = 8;
            local_48.StrikeEventData.StrikeShape.PreferDivisionIndex = 4;
            local_48.StrikeEventData.StrikeShape.Rotation = Transform.GetRotation().GetUpVector().Rotation();
            local_48.StrikeEventData.bUseHitTestPosStrikeOrigin = (1 != 0);
            local_48.HitDecalConfig = ConfigData.HitDecalConfig;
            FFPTime local_2_2 = FFPTime(Runtime.GetNextCheckTime());
            if (local_2_2.opCmp(0.0) <= 0)
            {
                FFPTime local_2_3 = FFPTime(FixedTime.Time);
                local_60 = ConfigData.AreaData.GetRangeCheckInterval();
                Runtime.SetNextCheckTime((local_2_3 + FFPTime(local_60)));
            }
            else
            {
                float local_62 = ConfigData.AreaData.GetRangeCheckInterval();
                FFPTime local_70 = (Runtime.GetNextCheckTime() + FFPTime(local_62));
                Runtime.SetNextCheckTime(local_70);
            }
        }
        return;
    }
    UFUNCTION()
    void Job_InitArealEffectHitTestByConfig(const FECSEntity &inout Entity, const FC_CombatArealEffectHitTestConfig &inout Config) const
    {
        this.InitArealHitTest(Entity, Config.ConfigData);
        return;
    }
    UFUNCTION()
    void Job_InitArealEffectHitTestOverride(const FECSEntity &inout Entity, const FC_CombatArealEffectHitTestOverride &inout Override) const
    {
        TDataObjectPtr<FCombatArealEffectConfigData_HitTest> local_24;
        local_24 = Override.GetDataObject();
        if ((!((local_24 == nullptr))))
        {
            this.InitArealHitTest(Entity);
            return;
        }
        XError(ELog(8), FString().Append("FC_CombatArealEffectHitTestOverride DataObject invalid, entity: ").Append(Entity.GetEntityName()));
        Remove local_62;
        local_62.opCall();
        return;
    }
    UFUNCTION()
    void Job_UpdateArealHitTestByConfig(const FECSEntity &inout Entity, const FC_CombatArealEffectHitTestConfig &inout Config, FC_CombatArealEffectRuntime &inout Runtime, const FC_Owner &inout OwnerComp, const FC_Transform &inout Transform, const FCS_FixedTime &inout FixedTime) const
    {
        if ((!(Config) || !(OwnerComp) || !(Transform)))
        {
            return;
        }
        this.UpdateArealHitTest(Entity, Config.ConfigData, Runtime, OwnerComp, Transform, FixedTime);
        return;
    }
    UFUNCTION()
    void Job_UpdateArealHitTestOverride(const FECSEntity &inout Entity, const FC_CombatArealEffectHitTestOverride &inout Override, FC_CombatArealEffectRuntime &inout Runtime, const FC_Owner &inout OwnerComp, const FC_Transform &inout Transform, const FCS_FixedTime &inout FixedTime) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    void Monitor_OnArealHitTestInactive(const FECSEntity &inout Entity, const FC_CombatArealEffectHitTestConfig &inout Config) const
    {
        Has local_10;
        int local_30 = 0;
        if (!(Entity.IsValid()))
        {
            return;
        }
        if (Config.ConfigData.StrikeKey.IsNone())
        {
            return;
        }
        while (FECSEntity(Entity).IsValid() && !(local_10.opCall()))
        {
            Get local_16;
            const FC_Owner& local_18 = local_16.opCall();
            if (local_18)
            {
                FECSEntity local_6 = local_18.GetOwnerEntity();
            }
            else
            {
                break;
            }
        }
        bool local_1 = local_10.opCall();
        if (local_1)
        {
            FECSWorldPtr local_28 = this.GetECSWorld();
            local_30.StrikeKey = Config.ConfigData.StrikeKey;
            local_30.EndTime = this.GetECSWorld().GetFixedTime().Time;
        }
        return;
    }
    UFUNCTION()
    void Monitor_ArealEffectFXEmitterOnActive(const FECSEntity &inout Entity, const FC_CombatArealEffectFXRuntime &inout FXRuntime) const
    {
        if (FXRuntime.GetFXEntity().IsValid())
        {
            if (FXRuntime.GetbActiveEmitter())
            {
                Remove local_6;
                local_6.opCall();
                return;
            }
            Assign local_10;
            local_10.opCall(FC_ViewEntityFXInactiveTag());
        }
        return;
    }
    UFUNCTION()
    void Monitor_UpdateArealEffectFXEmitter(const FC_CombatArealEffectFXRuntime &inout FXRuntime) const
    {
        if (FXRuntime.GetFXEntity().IsValid())
        {
            if (FXRuntime.GetbActiveEmitter())
            {
                Remove local_6;
                local_6.opCall();
                return;
            }
            Assign local_10;
            local_10.opCall(FC_ViewEntityFXInactiveTag());
        }
        return;
    }
    UFUNCTION()
    void Run_Job_InitArealEffectFX() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        int local_194 = 0;
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
                this.Job_InitArealEffectFX(local_40, local_42, local_48, local_54, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_96 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_100;
        local_100.opCall();
        Include local_104;
        local_104.opCall();
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Exclude(local_96).opCall();
        Exclude(local_96).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_122 = 0;
        FECSRuntimeViewIterator local_156 = local_96.Iterator();
        for (; local_156.CanProceed;)
        {
            local_40 = local_156.Proceed();
            ++local_122;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_InitArealEffectFX(local_194, local_42, local_48, local_54, local_6);
        }
        local_4.UpdateCachedEntityCount(local_122);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_InitArealEffectSpawner() const
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
                this.Job_InitArealEffectSpawner(local_40, local_42, local_48, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_90 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_94;
        local_94.opCall();
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Exclude(local_90).opCall();
        Exclude(local_90).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_112 = 0;
        FECSRuntimeViewIterator local_146 = local_90.Iterator();
        for (; local_146.CanProceed;)
        {
            local_40 = local_146.Proceed();
            ++local_112;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.Job_InitArealEffectSpawner(local_184, local_42, local_48, local_6);
        }
        local_4.UpdateCachedEntityCount(local_112);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    void Monitor___JobTimer_Pre___Job_UpdateArealEffectSpawner(const FC_CombatArealEffectSpawnerRuntime &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetNextSpawnTime());
        FName local_8 = FName("S_CombatArealEffectSystem::Job_UpdateArealEffectSpawner");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___Job_UpdateArealEffectSpawner(const FC_CombatArealEffectSpawnerRuntime &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetNextSpawnTime());
        FName local_8 = FName("S_CombatArealEffectSystem::Job_UpdateArealEffectSpawner");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    void Monitor___JobTimer_OnSync___Job_UpdateArealEffectSpawner(const FC_CombatArealEffectSpawnerRuntime &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetNextSpawnTime());
        FName local_8 = FName("S_CombatArealEffectSystem::Job_UpdateArealEffectSpawner");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___Job_UpdateArealEffectSpawner() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorCombatArealEffectSpawnerRuntimeOnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___Job_UpdateArealEffectSpawner(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorCombatArealEffectSpawnerRuntimeOnActiveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___Job_UpdateArealEffectSpawner(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___Job_UpdateArealEffectSpawner() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorCombatArealEffectSpawnerRuntimeOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___Job_UpdateArealEffectSpawner(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorCombatArealEffectSpawnerRuntimeOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___Job_UpdateArealEffectSpawner(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_OnSync___Job_UpdateArealEffectSpawner() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorCombatArealEffectSpawnerRuntimeOnModifyView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_OnSync___Job_UpdateArealEffectSpawner(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorCombatArealEffectSpawnerRuntimeOnActiveView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_OnSync___Job_UpdateArealEffectSpawner(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateArealEffectSpawner() const
    {
        int local_6 = 0;
        bool local_34;
        int local_42 = 0;
        int local_68 = 0;
        int local_70 = 0;
        int local_76 = 0;
        int local_82 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        local_4.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_14 = local_4.GetExternalEntityList();
        FECSEntity local_32;
        Has local_52;
        for (auto& local_28 : local_14)
        {
            local_28;
            FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
            local_34 = false;
            bool local_35 = !(false);
            if (!(local_32.IsActive()) == local_35)
            {
                continue;
            }
            if (!(local_42))
            {
                continue;
            }
            FFPTime local_44 = FFPTime(local_42.GetNextSpawnTime());
            if (local_44.opCmp(0.0) < 0 || (FFPTime(local_42.GetNextSpawnTime()) == FPTIME_MAX))
            {
                continue;
            }
            if (!(local_52.opCall()) == !(false))
            {
                FString local_56 = "Timer job error: 'FC_LocalTag' included by job but not exist on ";
                FString local_60 = local_32.ToString();
                local_34 = true;
            }
            if (local_34)
            {
                continue;
            }
            this.Job_UpdateArealEffectSpawner(local_68, local_70, local_76, local_82, local_6);
            MarkModifiedIfDirty local_90;
            local_90.opCall(local_82);
        }
        local_4.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    UFUNCTION()
    void Run_Job_InitArealEffectBuffByConfig() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_170 = 0;
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
                this.Job_InitArealEffectBuffByConfig(local_36, local_38);
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
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_80.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_InitArealEffectBuffByConfig(local_170, local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_InitArealEffectBuffOverride() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_170 = 0;
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
                this.Job_InitArealEffectBuffOverride(local_36, local_38);
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
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_80.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_InitArealEffectBuffOverride(local_170, local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    void Monitor___JobTimer_Pre___Job_UpdateArealEffectBuffByConfig(const FC_CombatArealEffectRuntime &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetNextCheckTime());
        FName local_8 = FName("S_CombatArealEffectSystem::Job_UpdateArealEffectBuffByConfig");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___Job_UpdateArealEffectBuffByConfig(const FC_CombatArealEffectRuntime &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetNextCheckTime());
        FName local_8 = FName("S_CombatArealEffectSystem::Job_UpdateArealEffectBuffByConfig");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    void Monitor___JobTimer_OnSync___Job_UpdateArealEffectBuffByConfig(const FC_CombatArealEffectRuntime &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetNextCheckTime());
        FName local_8 = FName("S_CombatArealEffectSystem::Job_UpdateArealEffectBuffByConfig");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___Job_UpdateArealEffectBuffByConfig() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorCombatArealEffectRuntimeOnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___Job_UpdateArealEffectBuffByConfig(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorCombatArealEffectRuntimeOnActiveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___Job_UpdateArealEffectBuffByConfig(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___Job_UpdateArealEffectBuffByConfig() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorCombatArealEffectRuntimeOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___Job_UpdateArealEffectBuffByConfig(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorCombatArealEffectRuntimeOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___Job_UpdateArealEffectBuffByConfig(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_OnSync___Job_UpdateArealEffectBuffByConfig() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorCombatArealEffectRuntimeOnModifyView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_OnSync___Job_UpdateArealEffectBuffByConfig(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorCombatArealEffectRuntimeOnActiveView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_OnSync___Job_UpdateArealEffectBuffByConfig(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateArealEffectBuffByConfig() const
    {
        int local_6 = 0;
        bool local_34;
        int local_42 = 0;
        int local_72 = 0;
        int local_74 = 0;
        int local_80 = 0;
        int local_86 = 0;
        int local_92 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        local_4.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_14 = local_4.GetExternalEntityList();
        FECSEntity local_32;
        Has local_52;
        for (auto& local_28 : local_14)
        {
            local_28;
            FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
            local_34 = false;
            bool local_35 = !(false);
            if (!(local_32.IsActive()) == local_35)
            {
                continue;
            }
            if (!(local_42))
            {
                continue;
            }
            FFPTime local_44 = FFPTime(local_42.GetNextCheckTime());
            if (local_44.opCmp(0.0) < 0 || (FFPTime(local_42.GetNextCheckTime()) == FPTIME_MAX))
            {
                continue;
            }
            if (!(local_52.opCall()) == !(false))
            {
                XLog(ELog(2), (FString("Timer job error: 'FC_LocalTag' included by job but not exist on ") + local_32.ToString()));
                local_34 = true;
            }
            Has local_70;
            local_35 = local_70.opCall();
            if (local_35)
            {
                XLog(ELog(2), (FString("Timer job error: 'FC_CombatArealEffectBuffOverride' excluded by job but exist on ") + local_32.ToString()));
                local_34 = true;
            }
            if (local_34)
            {
                continue;
            }
            this.Job_UpdateArealEffectBuffByConfig(local_72, local_74, local_80, local_86, local_92, local_6);
            MarkModifiedIfDirty local_100;
            local_100.opCall(local_80);
        }
        local_4.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    void Monitor___JobTimer_Pre___Job_UpdateArealEffectBuffOverride(const FC_CombatArealEffectRuntime &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetNextCheckTime());
        FName local_8 = FName("S_CombatArealEffectSystem::Job_UpdateArealEffectBuffOverride");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___Job_UpdateArealEffectBuffOverride(const FC_CombatArealEffectRuntime &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetNextCheckTime());
        FName local_8 = FName("S_CombatArealEffectSystem::Job_UpdateArealEffectBuffOverride");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    void Monitor___JobTimer_OnSync___Job_UpdateArealEffectBuffOverride(const FC_CombatArealEffectRuntime &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetNextCheckTime());
        FName local_8 = FName("S_CombatArealEffectSystem::Job_UpdateArealEffectBuffOverride");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___Job_UpdateArealEffectBuffOverride() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorCombatArealEffectRuntimeOnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___Job_UpdateArealEffectBuffOverride(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorCombatArealEffectRuntimeOnActiveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___Job_UpdateArealEffectBuffOverride(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___Job_UpdateArealEffectBuffOverride() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorCombatArealEffectRuntimeOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___Job_UpdateArealEffectBuffOverride(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorCombatArealEffectRuntimeOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___Job_UpdateArealEffectBuffOverride(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_OnSync___Job_UpdateArealEffectBuffOverride() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorCombatArealEffectRuntimeOnModifyView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_OnSync___Job_UpdateArealEffectBuffOverride(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorCombatArealEffectRuntimeOnActiveView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_OnSync___Job_UpdateArealEffectBuffOverride(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateArealEffectBuffOverride() const
    {
        int local_6 = 0;
        bool local_34;
        int local_42 = 0;
        int local_68 = 0;
        int local_70 = 0;
        int local_76 = 0;
        int local_82 = 0;
        int local_88 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        local_4.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_14 = local_4.GetExternalEntityList();
        FECSEntity local_32;
        Has local_52;
        for (auto& local_28 : local_14)
        {
            local_28;
            FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
            local_34 = false;
            bool local_35 = !(false);
            if (!(local_32.IsActive()) == local_35)
            {
                continue;
            }
            if (!(local_42))
            {
                continue;
            }
            FFPTime local_44 = FFPTime(local_42.GetNextCheckTime());
            if (local_44.opCmp(0.0) < 0 || (FFPTime(local_42.GetNextCheckTime()) == FPTIME_MAX))
            {
                continue;
            }
            if (!(local_52.opCall()) == !(false))
            {
                FString local_56 = "Timer job error: 'FC_LocalTag' included by job but not exist on ";
                FString local_60 = local_32.ToString();
                local_34 = true;
            }
            if (local_34)
            {
                continue;
            }
            this.Job_UpdateArealEffectBuffOverride(local_68, local_70, local_76, local_82, local_88, local_6);
            MarkModifiedIfDirty local_96;
            local_96.opCall(local_76);
        }
        local_4.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnArealEffectBuffRemove() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorCombatArealEffectBuffAddedDataOnInactiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnArealEffectBuffRemove(local_46, local_52);
        }
        FECSMonitorRuntimeView local_16 = ::__GetMonitorCombatArealEffectBuffAddedDataOnRemoveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_40 = local_16.Iterator();
        for (; local_40.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42_2 = local_40.Proceed();
            FECSEntityScopeCycleCounter local_43_2 = FECSEntityScopeCycleCounter(local_42_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_42_2);
            this.Monitor_OnArealEffectBuffRemove(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_InitArealAbilityEffectTriggerByConfig() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_180 = 0;
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
                this.Job_InitArealAbilityEffectTriggerByConfig(local_36, local_38, local_44);
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
        Exclude(local_86).opCall();
        Exclude(local_86).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_86.Iterator();
        for (; local_142.CanProceed;)
        {
            local_36 = local_142.Proceed();
            ++local_108;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_InitArealAbilityEffectTriggerByConfig(local_180, local_38, local_44);
        }
        local_2.UpdateCachedEntityCount(local_108);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_InitArealAbilityEffectTriggerByOverride() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_44 = 0;
        int local_180 = 0;
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
                this.Job_InitArealAbilityEffectTriggerByOverride(local_36, local_38, local_44);
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
        Exclude(local_86).opCall();
        Exclude(local_86).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_86.Iterator();
        for (; local_142.CanProceed;)
        {
            local_36 = local_142.Proceed();
            ++local_108;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_InitArealAbilityEffectTriggerByOverride(local_180, local_38, local_44);
        }
        local_2.UpdateCachedEntityCount(local_108);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    void Monitor___JobTimer_Pre___Job_UpdateArealAbilityEffectTriggerByConfig(const FC_CombatArealEffectRuntime &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetNextCheckTime());
        FName local_8 = FName("S_CombatArealEffectSystem::Job_UpdateArealAbilityEffectTriggerByConfig");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___Job_UpdateArealAbilityEffectTriggerByConfig(const FC_CombatArealEffectRuntime &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetNextCheckTime());
        FName local_8 = FName("S_CombatArealEffectSystem::Job_UpdateArealAbilityEffectTriggerByConfig");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    void Monitor___JobTimer_OnSync___Job_UpdateArealAbilityEffectTriggerByConfig(const FC_CombatArealEffectRuntime &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetNextCheckTime());
        FName local_8 = FName("S_CombatArealEffectSystem::Job_UpdateArealAbilityEffectTriggerByConfig");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___Job_UpdateArealAbilityEffectTriggerByConfig() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorCombatArealEffectRuntimeOnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___Job_UpdateArealAbilityEffectTriggerByConfig(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorCombatArealEffectRuntimeOnActiveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___Job_UpdateArealAbilityEffectTriggerByConfig(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___Job_UpdateArealAbilityEffectTriggerByConfig() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorCombatArealEffectRuntimeOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___Job_UpdateArealAbilityEffectTriggerByConfig(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorCombatArealEffectRuntimeOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___Job_UpdateArealAbilityEffectTriggerByConfig(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_OnSync___Job_UpdateArealAbilityEffectTriggerByConfig() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorCombatArealEffectRuntimeOnModifyView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_OnSync___Job_UpdateArealAbilityEffectTriggerByConfig(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorCombatArealEffectRuntimeOnActiveView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_OnSync___Job_UpdateArealAbilityEffectTriggerByConfig(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateArealAbilityEffectTriggerByConfig() const
    {
        int local_6 = 0;
        bool local_34;
        int local_42 = 0;
        int local_72 = 0;
        int local_74 = 0;
        int local_80 = 0;
        int local_86 = 0;
        int local_92 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        local_4.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_14 = local_4.GetExternalEntityList();
        FECSEntity local_32;
        Has local_52;
        for (auto& local_28 : local_14)
        {
            local_28;
            FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
            local_34 = false;
            bool local_35 = !(false);
            if (!(local_32.IsActive()) == local_35)
            {
                continue;
            }
            if (!(local_42))
            {
                continue;
            }
            FFPTime local_44 = FFPTime(local_42.GetNextCheckTime());
            if (local_44.opCmp(0.0) < 0 || (FFPTime(local_42.GetNextCheckTime()) == FPTIME_MAX))
            {
                continue;
            }
            if (!(local_52.opCall()) == !(false))
            {
                XLog(ELog(2), (FString("Timer job error: 'FC_LocalTag' included by job but not exist on ") + local_32.ToString()));
                local_34 = true;
            }
            Has local_70;
            local_35 = local_70.opCall();
            if (local_35)
            {
                XLog(ELog(2), (FString("Timer job error: 'FC_CombatArealEffectBuffOverride' excluded by job but exist on ") + local_32.ToString()));
                local_34 = true;
            }
            if (local_34)
            {
                continue;
            }
            this.Job_UpdateArealAbilityEffectTriggerByConfig(local_72, local_74, local_80, local_86, local_92, local_6);
            MarkModifiedIfDirty local_100;
            local_100.opCall(local_80);
        }
        local_4.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    void Monitor___JobTimer_Pre___Job_UpdateArealAbilityEffectTriggerOverride(const FC_CombatArealEffectRuntime &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetNextCheckTime());
        FName local_8 = FName("S_CombatArealEffectSystem::Job_UpdateArealAbilityEffectTriggerOverride");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___Job_UpdateArealAbilityEffectTriggerOverride(const FC_CombatArealEffectRuntime &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetNextCheckTime());
        FName local_8 = FName("S_CombatArealEffectSystem::Job_UpdateArealAbilityEffectTriggerOverride");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    void Monitor___JobTimer_OnSync___Job_UpdateArealAbilityEffectTriggerOverride(const FC_CombatArealEffectRuntime &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetNextCheckTime());
        FName local_8 = FName("S_CombatArealEffectSystem::Job_UpdateArealAbilityEffectTriggerOverride");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___Job_UpdateArealAbilityEffectTriggerOverride() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorCombatArealEffectRuntimeOnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___Job_UpdateArealAbilityEffectTriggerOverride(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorCombatArealEffectRuntimeOnActiveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___Job_UpdateArealAbilityEffectTriggerOverride(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___Job_UpdateArealAbilityEffectTriggerOverride() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorCombatArealEffectRuntimeOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___Job_UpdateArealAbilityEffectTriggerOverride(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorCombatArealEffectRuntimeOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___Job_UpdateArealAbilityEffectTriggerOverride(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_OnSync___Job_UpdateArealAbilityEffectTriggerOverride() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorCombatArealEffectRuntimeOnModifyView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_OnSync___Job_UpdateArealAbilityEffectTriggerOverride(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorCombatArealEffectRuntimeOnActiveView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_OnSync___Job_UpdateArealAbilityEffectTriggerOverride(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateArealAbilityEffectTriggerOverride() const
    {
        int local_6 = 0;
        bool local_34;
        int local_42 = 0;
        int local_68 = 0;
        int local_70 = 0;
        int local_76 = 0;
        int local_82 = 0;
        int local_88 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        local_4.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_14 = local_4.GetExternalEntityList();
        FECSEntity local_32;
        Has local_52;
        for (auto& local_28 : local_14)
        {
            local_28;
            FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
            local_34 = false;
            bool local_35 = !(false);
            if (!(local_32.IsActive()) == local_35)
            {
                continue;
            }
            if (!(local_42))
            {
                continue;
            }
            FFPTime local_44 = FFPTime(local_42.GetNextCheckTime());
            if (local_44.opCmp(0.0) < 0 || (FFPTime(local_42.GetNextCheckTime()) == FPTIME_MAX))
            {
                continue;
            }
            if (!(local_52.opCall()) == !(false))
            {
                FString local_56 = "Timer job error: 'FC_LocalTag' included by job but not exist on ";
                FString local_60 = local_32.ToString();
                local_34 = true;
            }
            if (local_34)
            {
                continue;
            }
            this.Job_UpdateArealAbilityEffectTriggerOverride(local_68, local_70, local_76, local_82, local_88, local_6);
            MarkModifiedIfDirty local_96;
            local_96.opCall(local_76);
        }
        local_4.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    UFUNCTION()
    void Run_Job_InitArealEffectHitTestByConfig() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_170 = 0;
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
                this.Job_InitArealEffectHitTestByConfig(local_36, local_38);
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
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_80.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_InitArealEffectHitTestByConfig(local_170, local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_InitArealEffectHitTestOverride() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_170 = 0;
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
                this.Job_InitArealEffectHitTestOverride(local_36, local_38);
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
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_80.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.Job_InitArealEffectHitTestOverride(local_170, local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    void Monitor___JobTimer_Pre___Job_UpdateArealHitTestByConfig(const FC_CombatArealEffectRuntime &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetNextCheckTime());
        FName local_8 = FName("S_CombatArealEffectSystem::Job_UpdateArealHitTestByConfig");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___Job_UpdateArealHitTestByConfig(const FC_CombatArealEffectRuntime &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetNextCheckTime());
        FName local_8 = FName("S_CombatArealEffectSystem::Job_UpdateArealHitTestByConfig");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    void Monitor___JobTimer_OnSync___Job_UpdateArealHitTestByConfig(const FC_CombatArealEffectRuntime &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetNextCheckTime());
        FName local_8 = FName("S_CombatArealEffectSystem::Job_UpdateArealHitTestByConfig");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___Job_UpdateArealHitTestByConfig() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorCombatArealEffectRuntimeOnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___Job_UpdateArealHitTestByConfig(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorCombatArealEffectRuntimeOnActiveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___Job_UpdateArealHitTestByConfig(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___Job_UpdateArealHitTestByConfig() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorCombatArealEffectRuntimeOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___Job_UpdateArealHitTestByConfig(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorCombatArealEffectRuntimeOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___Job_UpdateArealHitTestByConfig(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_OnSync___Job_UpdateArealHitTestByConfig() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorCombatArealEffectRuntimeOnModifyView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_OnSync___Job_UpdateArealHitTestByConfig(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorCombatArealEffectRuntimeOnActiveView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_OnSync___Job_UpdateArealHitTestByConfig(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateArealHitTestByConfig() const
    {
        int local_6 = 0;
        bool local_34;
        int local_42 = 0;
        int local_72 = 0;
        int local_74 = 0;
        int local_80 = 0;
        int local_86 = 0;
        int local_92 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        local_4.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_14 = local_4.GetExternalEntityList();
        FECSEntity local_32;
        Has local_52;
        for (auto& local_28 : local_14)
        {
            local_28;
            FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
            local_34 = false;
            bool local_35 = !(false);
            if (!(local_32.IsActive()) == local_35)
            {
                continue;
            }
            if (!(local_42))
            {
                continue;
            }
            FFPTime local_44 = FFPTime(local_42.GetNextCheckTime());
            if (local_44.opCmp(0.0) < 0 || (FFPTime(local_42.GetNextCheckTime()) == FPTIME_MAX))
            {
                continue;
            }
            if (!(local_52.opCall()) == !(false))
            {
                XLog(ELog(2), (FString("Timer job error: 'FC_LocalTag' included by job but not exist on ") + local_32.ToString()));
                local_34 = true;
            }
            Has local_70;
            local_35 = local_70.opCall();
            if (local_35)
            {
                XLog(ELog(2), (FString("Timer job error: 'FC_CombatArealEffectHitTestOverride' excluded by job but exist on ") + local_32.ToString()));
                local_34 = true;
            }
            if (local_34)
            {
                continue;
            }
            this.Job_UpdateArealHitTestByConfig(local_72, local_74, local_80, local_86, local_92, local_6);
            MarkModifiedIfDirty local_100;
            local_100.opCall(local_80);
        }
        local_4.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    void Monitor___JobTimer_Pre___Job_UpdateArealHitTestOverride(const FC_CombatArealEffectRuntime &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetNextCheckTime());
        FName local_8 = FName("S_CombatArealEffectSystem::Job_UpdateArealHitTestOverride");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___Job_UpdateArealHitTestOverride(const FC_CombatArealEffectRuntime &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetNextCheckTime());
        FName local_8 = FName("S_CombatArealEffectSystem::Job_UpdateArealHitTestOverride");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    void Monitor___JobTimer_OnSync___Job_UpdateArealHitTestOverride(const FC_CombatArealEffectRuntime &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetNextCheckTime());
        FName local_8 = FName("S_CombatArealEffectSystem::Job_UpdateArealHitTestOverride");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___Job_UpdateArealHitTestOverride() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorCombatArealEffectRuntimeOnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___Job_UpdateArealHitTestOverride(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorCombatArealEffectRuntimeOnActiveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___Job_UpdateArealHitTestOverride(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___Job_UpdateArealHitTestOverride() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorCombatArealEffectRuntimeOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___Job_UpdateArealHitTestOverride(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorCombatArealEffectRuntimeOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___Job_UpdateArealHitTestOverride(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_OnSync___Job_UpdateArealHitTestOverride() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorCombatArealEffectRuntimeOnModifyView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_OnSync___Job_UpdateArealHitTestOverride(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorCombatArealEffectRuntimeOnActiveView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_OnSync___Job_UpdateArealHitTestOverride(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_UpdateArealHitTestOverride() const
    {
        int local_6 = 0;
        bool local_34;
        int local_42 = 0;
        int local_68 = 0;
        int local_70 = 0;
        int local_76 = 0;
        int local_82 = 0;
        int local_88 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        local_4.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_14 = local_4.GetExternalEntityList();
        FECSEntity local_32;
        Has local_52;
        for (auto& local_28 : local_14)
        {
            local_28;
            FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
            local_34 = false;
            bool local_35 = !(false);
            if (!(local_32.IsActive()) == local_35)
            {
                continue;
            }
            if (!(local_42))
            {
                continue;
            }
            FFPTime local_44 = FFPTime(local_42.GetNextCheckTime());
            if (local_44.opCmp(0.0) < 0 || (FFPTime(local_42.GetNextCheckTime()) == FPTIME_MAX))
            {
                continue;
            }
            if (!(local_52.opCall()) == !(false))
            {
                FString local_56 = "Timer job error: 'FC_LocalTag' included by job but not exist on ";
                FString local_60 = local_32.ToString();
                local_34 = true;
            }
            if (local_34)
            {
                continue;
            }
            this.Job_UpdateArealHitTestOverride(local_68, local_70, local_76, local_82, local_88, local_6);
            MarkModifiedIfDirty local_96;
            local_96.opCall(local_76);
        }
        local_4.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    UFUNCTION()
    void Run_Monitor_OnArealHitTestInactive() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorCombatArealEffectHitTestConfigOnInactiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_OnArealHitTestInactive(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ArealEffectFXEmitterOnActive() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorCombatArealEffectFXRuntimeOnActiveView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ArealEffectFXEmitterOnActive(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_UpdateArealEffectFXEmitter() const
    {
        int local_50 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorCombatArealEffectFXRuntimeOnModifyView(this.GetECSWorld(), EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_48 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_UpdateArealEffectFXEmitter(local_50);
        }
        return;
    }
}

