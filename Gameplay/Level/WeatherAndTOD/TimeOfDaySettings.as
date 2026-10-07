

struct FTimeOfDayDefine
{
    UPROPERTY()
    int StartTime;
    UPROPERTY()
    TDataObjectPtr<FTODStageConfig> StageConfig;


}

struct FTimeOfDaySettingsCache
{
    UPROPERTY()
    TMap<TDataObjectPtr<FTODStageConfig>, int> TimeOfDayIndex;

    FTimeOfDaySettingsCache()
    {
        return;
    }
}

class UTimeOfDaySettings : UGameplaySettingsBase
{
    UPROPERTY()
    TArray<FTimeOfDayDefine> TimeOfDayDefines;

    UTimeOfDaySettings()
    {
        return;
    }
    UFUNCTION()
    FInstancedStruct ComputeCacheData_Implementation() const
    {
        FTimeOfDaySettingsCache local_20;
        int local_21 = 0;
        for (; local_21 < this.TimeOfDayDefines.Num(); )
        {
            local_20.TimeOfDayIndex.FindOrAdd(this.TimeOfDayDefines[local_21].StageConfig) = local_21;
            ++local_21;
        }
        return FInstancedStruct::Make(local_20);
    }
    TDataObjectPtr<FTODStageConfig> GetTODByHours(const float32 HoursInDay) const
    {
        float32 local_2 = HoursInDay % 24.0f;
        TDataObjectPtr<FTODStageConfig> local_26 = this.TimeOfDayDefines.Last(0).StageConfig;
        for (auto& local_68 : this.TimeOfDayDefines)
        {
            if (local_2 < int(local_68.StartTime))
            {
                break;
            }
            local_26 = local_68.StageConfig;
        }
        return local_26;
    }
    TDataObjectPtr<FTODStageConfig> GetPrevTODStage(const TDataObjectPtr<FTODStageConfig> &inout CurrentStage) const
    {
        if (!(CurrentStage))
        {
            return TDataObjectPtr<FTODStageConfig>(nullptr);
        }
        return this.TimeOfDayDefines[(((this.GetTimeOfDayIndex(CurrentStage) - 1) + this.TimeOfDayDefines.Num()) % this.TimeOfDayDefines.Num())].StageConfig;
    }
    TDataObjectPtr<FTODStageConfig> GetNextTODStage(const TDataObjectPtr<FTODStageConfig> &inout CurrentStage) const
    {
        if (!(CurrentStage))
        {
            return TDataObjectPtr<FTODStageConfig>(nullptr);
        }
        return this.TimeOfDayDefines[((this.GetTimeOfDayIndex(CurrentStage) + 1) % this.TimeOfDayDefines.Num())].StageConfig;
    }
    int GetStageStartTimeInHours(const TDataObjectPtr<FTODStageConfig> &inout Stage) const
    {
        if (!(Stage))
        {
            return 0;
        }
        return this.TimeOfDayDefines[this.GetTimeOfDayIndex(Stage)].StartTime;
    }
    int GetStageEndTimeInHours(const TDataObjectPtr<FTODStageConfig> &inout Stage) const
    {
        if (!(Stage))
        {
            return 0;
        }
        return this.GetStageStartTimeInHours(this.GetNextTODStage(Stage));
    }
    int GetTimeOfDayIndex(const TDataObjectPtr<FTODStageConfig> &inout Stage) const
    {
        return FInstancedStruct::GetPtr(this.GetCacheData()).opCall().opArrow().TimeOfDayIndex[Stage];
    }
}

