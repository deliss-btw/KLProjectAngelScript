class US_EcosimLevelSystem : UECSScriptSystem
{
    US_EcosimLevelSystem()
    {
        return;
    }
    UFUNCTION()
    void Monitor_InitLevelSpawner(const FECSEntity &inout Entity, const FC_EcosimLevelSpawnerConfig &inout EcosimLevelSpawnerConfig) const
    {
        int local_6 = 0;
        const TSubclassOf<AECSPrefab>& local_140;
        int local_141;
        int local_220 = 0;
        int local_224 = 0;
        bool local_7 = false;
        FECSRuntimeQuery local_52 = FECSRuntimeQueryHelper::RuntimeQueryInSphere(Entity, local_6.GetPosition(), EcosimLevelSpawnerConfig.SpawnRange, EECSQueryRegsitryType(2), local_7);
        Include local_96;
        local_96.opCall();
        TMap<TSubclassOf<AECSPrefab>, int> local_116;
        for (auto& local_130 : EcosimLevelSpawnerConfig.SpawnStrategies)
        {
            if (local_130.PrefabDataList.Num() > 0)
            {
                int local_134 = FMath::RandRange(int(local_130.SpawnTotalNumMin), int(local_130.SpawnTotalNumMax));
                int local_135 = 0;
                for (; local_135 < local_134; ++local_135)
                {
                    int local_137 = FMath::RandRange(0, (local_130.PrefabDataList.Num() - 1));
                    if (local_116.Find(local_140, local_141))
                    {
                        local_116.Add(local_140, local_141 + 1);
                        continue;
                    }
                    local_116.Add(local_140, 1);
                }
            }
        }
        TArray<FECSEntity> local_146;
        FECSRuntimeQueryIterator local_168 = local_52.Iterator();
        for (; local_168.CanProceed;)
        {
            local_146.Add(local_168.Proceed());
        }
        for (auto& local_210 : local_116)
        {
            TArray<FECSEntity> local_214;
            local_141 = 0;
            for (; local_141 < local_146.Num(); ++local_141)
            {
                FECSEntity local_192 = local_146[local_141];
                local_140 = local_210.GetKey();
                if (local_220.SpawnPointData.SpawnList.Contains(local_140))
                {
                    local_214.Insert(local_192, FMath::RandRange(0, local_214.Num()));
                }
            }
            int local_135_2 = 0;
            while (local_7)
            {
                FECSEntity local_192_2 = local_214[local_135_2];
                FVector local_230 = local_224.GetPosition();
                FRotator local_242 = FRotator(local_224.GetRotation());
                FVector local_256 = (local_230 + (local_242.GetUpVector() * (FMath::RandRange(60, 100))));
                FHitResult local_330;
                FCollisionQueryParams local_368;
                local_368.bTraceComplex = false;
                FCollisionResponseParams local_383;
                bool local_221 = FPhysicsUtils::SweepSingle(local_192_2, false, EPhysicsTraceTag(17), local_330, local_256, local_256, FQuat::Identity, FPhysicsUtils::ConvertToCollisionChannel(ETraceTypeQuery(5)), FCollisionShape::MakeSphere(50.0f), local_368, local_383);
                if (!(local_221))
                {
                    FRotator local_236 = FRotator(0.0, FMath::RandRange(0, 360), 0.0);
                    ECS::RequestEntityByPrefabDeferred(local_210.GetKey(), local_256, local_236, EPrefabCollisionAlignment(2), EECSRegType(0), false);
                }
                ++local_135_2;
                int local_136 = local_214.Num();
                if (local_135_2 >= local_136)
                {
                    local_7 = false;
                    continue;
                }
                local_7 = (local_135_2 < local_136);
            }
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_InitLevelSpawner() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = ::__GetMonitorEcosimLevelSpawnerConfigOnAssignView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_InitLevelSpawner(local_46, local_52);
        }
        return;
    }
}

