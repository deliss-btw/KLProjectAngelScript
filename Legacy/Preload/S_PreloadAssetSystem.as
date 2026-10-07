

class US_PrelodAssetSystem : UECSScriptSystem
{
    US_PrelodAssetSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_InitPreloadAsset() const
    {
        XLogIf(FPreloadAssetUtils::CVar_PreloadAssetDebug.GetBool(), ELog(0), " Job_InitPreloadAsset, Remove FCS_AssetPreloadManagerTag ");
        return;
    }
    UFUNCTION()
    void Job_DestroyPreloadAsset() const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        Has local_6;
        if (!(local_6.opCall()))
        {
            return;
        }
        XLogIf(FPreloadAssetUtils::CVar_PreloadAssetDebug.GetBool(), ELog(0), " Job_DestroyPreloadAsset, Remove AssetPreloadManager ");
        return;
    }
    UFUNCTION()
    void Job_PreloadAssetFromTables() const
    {
        XLogIf(FPreloadAssetUtils::CVar_PreloadAssetDebug.GetBool(), ELog(0), " Job_PreloadAssetFromTables, PreloadAudioFromTables and PreloadVfxFromTables. ");
        ::FPreloadAssetUtils::PreloadAudioFromTables();
        ::FPreloadAssetUtils::PreloadVfxFromTables();
        ::FPreloadAssetUtils::PreloadDefaultResidentAudioAssets();
        return;
    }
    UFUNCTION()
    void Monitor_ESMAssetPreload(const FECSEntity &inout Entity, const FC_ESM &inout ESM) const
    {
        if ((!(ESM) || (!((ESM.Asset != nullptr)))))
        {
            return;
        }
        FString local_12 = ((FString(" FC_ESM Monitor_ESMAssetPreload, Entity: ") + Entity.GetEntityName()) + " Asset: ");
        XLogIf(FPreloadAssetUtils::CVar_PreloadAssetDebug.GetBool(), ELog(0), (local_12 + ESM.AssetPath));
        XLog(ELog(1), FString().Append("[ESMAssetPreload.Trigger] Reason:FC_ESM.OnAssign, Entity:").Append(Entity.GetEntityName()).Append(", ESM:").Append(ESM.AssetPath).Append(", HasRequest:").Append(::FPreloadAssetUtils::RequestESMAssetPreload(ESM)));
        return;
    }
    UFUNCTION()
    void Monitor_ESMAssetPreloadOnPrefabLoaded(const FECSEntity &inout Entity, const FC_PrefabLoaded &inout PrefabLoaded) const
    {
        Has local_4;
        int local_12 = 0;
        if (!(local_4.opCall()))
        {
            return;
        }
        if ((!(local_12) || (!((local_12.Asset != nullptr)))))
        {
            return;
        }
        XLog(ELog(1), FString().Append("[ESMAssetPreload.Trigger] Reason:PrefabLoaded, Entity:").Append(Entity.GetEntityName()).Append(", Prefab:").Append(PrefabLoaded.PrefabClass.ToSoftObjectPath().ToString()).Append(", ESM:").Append(local_12.AssetPath).Append(", HasRequest:").Append(::FPreloadAssetUtils::RequestESMAssetPreload(local_12)));
        return;
    }
    UFUNCTION()
    void Job_HandlePreloadAudioResource(const FCS_AssetPreloadRequest &inout PreloadRequest) const
    {
        for (auto& local_20 : PreloadRequest.RequestEvents)
        {
            ::FPreloadAssetUtils::LoadAkEvent(local_20);
        }
        for (auto& local_38 : PreloadRequest.RequestStates)
        {
            ::FPreloadAssetUtils::LoadAkState(local_38);
        }
        for (auto& local_56 : PreloadRequest.RequestSwitches)
        {
            ::FPreloadAssetUtils::LoadAkSwitch(local_56);
        }
        for (auto& local_74 : PreloadRequest.RequestRtpcs)
        {
            ::FPreloadAssetUtils::LoadAkRtpc(local_74);
        }
        for (auto& local_92 : PreloadRequest.RequestFxActors)
        {
            ::FPreloadAssetUtils::LoadFXActor(local_92);
        }
        FECSWorldPtr local_94 = ECS::GetECSWorld();
        Remove local_98;
        local_98.opCall();
        return;
    }
    UFUNCTION()
    void Job_HandlePreloadAudioBank(const FCS_AudioBankPreloadRequest &inout AudioPreloadRequest) const
    {
        for (auto& local_20 : AudioPreloadRequest.RequestBanks)
        {
            ::FPreloadAssetUtils::LoadAkBank(local_20);
        }
        for (auto& local_38 : AudioPreloadRequest.RequestBankNames)
        {
            local_38;
        }
        FECSWorldPtr local_40 = ECS::GetECSWorld();
        Remove local_44;
        local_44.opCall();
        return;
    }
    UFUNCTION()
    void Run_Job_InitPreloadAsset() const
    {
        ECS::GetContextJob();
        this.Job_InitPreloadAsset();
        return;
    }
    UFUNCTION()
    void Run_Job_DestroyPreloadAsset() const
    {
        ECS::GetContextJob();
        this.Job_DestroyPreloadAsset();
        return;
    }
    UFUNCTION()
    void Run_Job_PreloadAssetFromTables() const
    {
        ECS::GetContextJob();
        this.Job_PreloadAssetFromTables();
        return;
    }
    UFUNCTION()
    void Run_Monitor_ESMAssetPreload() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorESMOnAssignView(EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ESMAssetPreload(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor_ESMAssetPreloadOnPrefabLoaded() const
    {
        int local_46 = 0;
        int local_52 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_12 = this.GetECSWorld().__GetMonitorPrefabLoadedOnAssignView(EECSRegType(0), false, true);
        FECSMonitorRuntimeViewIterator local_28 = local_12.Iterator();
        for (; local_28.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_42 = local_28.Proceed();
            FECSEntityScopeCycleCounter local_43 = FECSEntityScopeCycleCounter(local_42.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_42);
            this.Monitor_ESMAssetPreloadOnPrefabLoaded(local_46, local_52);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_HandlePreloadAudioResource() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        this.Job_HandlePreloadAudioResource(local_12);
        return;
    }
    UFUNCTION()
    void Run_Job_HandlePreloadAudioBank() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        this.Job_HandlePreloadAudioBank(local_12);
        return;
    }
}

