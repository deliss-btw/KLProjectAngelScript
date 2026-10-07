

class AKLLevelScriptMissionBase : AKLLevelScriptBaseActor
{
    UPROPERTY()
    int CommissionProgress = 0;


    UFUNCTION()
    int GetCommissionMissionProgress() const property
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Get local_6;
        const FCS_CommissionDSGlobalInfo& local_8 = local_6.opCall();
        if (local_8)
        {
            return int(local_8.CommissionProgress);
        }
        return 0;
    }
    UFUNCTION()
    void SetCommissionMissionProgress(const int Progress) property
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Modify local_6;
        FCS_CommissionDSGlobalInfo& local_8 = local_6.opCall();
        if (local_8)
        {
            XLog(ELog(22), FString().Append("SetCommissionMissionProgress Progress=").Append(Progress));
            local_8.CommissionProgress = Progress;
            this.CommissionProgress = Progress;
        }
        return;
    }
}

