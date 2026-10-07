

class US_UIAsyncSystem : UECSScriptSystem
{
    US_UIAsyncSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_CacheUIViewProjection() const
    {
        ::FMS_UIViewProjection::GetByManager(Cast<UEUIManagerSubsystem>(UGameSubSystemBase::GetSubsystem(ECS::GetUEWorld(), UEUIManagerSubsystem))).RefreshSnapshot();
        return;
    }
    UFUNCTION()
    void Job_ManualAsyncTick() const
    {
        UEUIManagerSubsystem local_2 = Cast<UEUIManagerSubsystem>(UGameSubSystemBase::GetSubsystem(ECS::GetUEWorld(), UEUIManagerSubsystem));
        FEUIScopedExclusiveAccess local_12 = FEUIScopedExclusiveAccess(local_2);
        ::FMS_LevelSpotManager::GetByManager(local_2).ManualAsyncTick();
        UEUIManagerSubsystem::GetStorageModelList local_16;
        TEUIStorageModeList<FM_ActiveEntityLevelSpotUpdater> local_22 = local_16.opCall(FM_ActiveEntityLevelSpotUpdater::ModelId);
        int local_27 = 0;
        for (; local_27 < local_22.Num(); ++local_27)
        {
            FM_ActiveEntityLevelSpotUpdater& local_32 = local_22[local_27];
            if (local_32)
            {
                local_32.ManualAsyncTick();
            }
        }
        UEUIManagerSubsystem::GetStorageModelList local_36;
        TEUIStorageModeList<FM_SpotFilter> local_40 = local_36.opCall(FM_SpotFilter::ModelId);
        int local_27_2 = 0;
        for (; local_27_2 < local_40.Num(); ++local_27_2)
        {
            FM_SpotFilter& local_46 = local_40[local_27_2];
            if (local_46)
            {
                local_46.ManualAsyncTick();
            }
        }
        UEUIManagerSubsystem::GetStorageModelList local_50;
        TEUIStorageModeList<FVM_PresentationDisplayRule> local_54 = local_50.opCall(FVM_PresentationDisplayRule::ModelId);
        int local_27_3 = 0;
        for (; local_27_3 < local_54.Num(); ++local_27_3)
        {
            FVM_PresentationDisplayRule& local_60 = local_54[local_27_3];
            if (local_60)
            {
                local_60.ManualAsyncTick();
            }
        }
        UEUIManagerSubsystem::GetStorageModelList local_64;
        TEUIStorageModeList<FVM_NavigationBar> local_68 = local_64.opCall(FVM_NavigationBar::ModelId);
        int local_27_4 = 0;
        for (; local_27_4 < local_68.Num(); ++local_27_4)
        {
            FVM_NavigationBar& local_74 = local_68[local_27_4];
            if (local_74)
            {
                local_74.ManualAsyncTick();
            }
        }
        UEUIManagerSubsystem::GetStorageModelList local_78;
        TEUIStorageModeList<FVM_IndicatorList> local_82 = local_78.opCall(FVM_IndicatorList::ModelId);
        int local_27_5 = 0;
        for (; local_27_5 < local_82.Num(); ++local_27_5)
        {
            FVM_IndicatorList& local_88 = local_82[local_27_5];
            if (local_88)
            {
                local_88.ManualAsyncTick();
            }
        }
        UEUIManagerSubsystem::GetStorageModelList local_92;
        TEUIStorageModeList<FVM_HeadsUpDisplayList> local_96 = local_92.opCall(FVM_HeadsUpDisplayList::ModelId);
        int local_27_6 = 0;
        for (; local_27_6 < local_96.Num(); ++local_27_6)
        {
            FVM_HeadsUpDisplayList& local_102 = local_96[local_27_6];
            if (local_102)
            {
                local_102.ManualAsyncTick();
            }
        }
        ::FMS_HeadsUpDisplay3DManager::GetByManager(local_2).ManualAsyncTick();
        return;
    }
    UFUNCTION()
    void Run_Job_CacheUIViewProjection() const
    {
        ECS::GetContextJob();
        this.Job_CacheUIViewProjection();
        return;
    }
    UFUNCTION()
    void Run_Job_ManualAsyncTick() const
    {
        ECS::GetContextJob();
        this.Job_ManualAsyncTick();
        return;
    }
}

