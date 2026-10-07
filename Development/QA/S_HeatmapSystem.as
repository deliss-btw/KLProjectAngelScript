

class US_HeatmapSystem : UECSScriptSystem
{
    US_HeatmapSystem()
    {
        return;
    }
    UFUNCTION()
    void ClientJob_(const FECSEntity &inout Entity, const FC_RecordHeatmapData &inout RecordHeatmapData) const
    {
        int local_6 = 0;
        if (!(local_6))
        {
            return;
        }
        if ((!((RecordHeatmapData.LastLocation == FVector::ZeroVector)) && (((FVector(local_6.GetPosition()) - RecordHeatmapData.LastLocation).Size()) < RecordHeatmapData.DistanceThreshold)))
        {
            return;
        }
        FFileHelper::SaveStringToFile(FString().Append(local_6.GetPosition().X).Append(",").Append(local_6.GetPosition().Y).Append(",").Append(local_6.GetPosition().Z).Append("\n"), RecordHeatmapData.SaveFilePath, FFileHelper::EEncodingOptions(0), 8);
        Modify local_42;
        local_42.opCall().LastLocation = local_6.GetPosition();
        PrintToScreen(FString().Append("Heatmap recorded at location: ").Append(local_6.GetPosition()), 2.0f, FLinearColor::LucBlue);
        return;
    }
    UFUNCTION()
    void Run_ClientJob_() const
    {
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_166 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        if (!(this.GetECSRuntime().IsOnInterval(FFPTime(0.5))))
        {
            return;
        }
        int local_9 = 0;
        int local_8 = local_9;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
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
                this.ClientJob_(local_40, local_42);
            }
            local_2.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Exclude(local_84).opCall();
        bool local_7 = local_2.BeginViewCacheBuild();
        int local_18 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_84.Iterator();
        for (; local_128.CanProceed;)
        {
            local_40 = local_128.Proceed();
            ++local_94;
            if (local_7)
            {
                local_2.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ClientJob_(local_166, local_42);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_7)
        {
            local_2.CommitViewCacheBuild(local_18);
        }
        return;
    }
}

