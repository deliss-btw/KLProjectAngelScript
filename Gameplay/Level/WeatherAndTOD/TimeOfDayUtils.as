
namespace FTimeOfDayUtils
{
int GetCurrentTimeOfDayInSeconds()
{
    int local_8 = 0;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    if (!(local_8))
    {
        return 0;
    }
    return local_8.GetTimeOfDaySeconds();
}
UFUNCTION()
float32 GetCurrentTimeOfDayInHours()
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    return FTimeOfDayUtils::GetTimeOfDayInHours(0.GetTimeOfDaySeconds());
}
UFUNCTION()
void SetCurrentTimeOfDayInHours(const float32 TimeOfDayHours)
{
    FFPTime local_8 = FFPTime(-1);
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    FCE_SetCurrentTimeOfDay local_12;
    local_12.TimeOfDayInHours = TimeOfDayHours;
    return;
}
float32 GetTimeOfDayInHours(const int TimeOfDaySeconds)
{
    return (TimeOfDaySeconds / 3600.0f);
}
float32 GetTimeOfDayInHoursClamp24(const int TimeOfDaySeconds)
{
    return ((TimeOfDaySeconds % 86400) / 3600.0f);
}
int GetTimeOfDayInSeconds(const float32 TimeOfDayHours)
{
    return uint((TimeOfDayHours * 3600.0f));
}
void GetTimeOfDayHourAndMinute(const int TimeOfDaySeconds, int &out Day, int &out Hour, int &out Minute)
{
    Day = 0;
    Hour = 0;
    Minute = 0;
    int local_4 = FTimeOfDayUtils::GetTimeOfDayInHours(TimeOfDaySeconds);
    float local_3 = local_4 / 24.0f;
    Day = uint(local_3);
    Hour = uint(local_4);
    Minute = uint(((local_4 - Hour) * 60.0f));
    int local_5 = Hour % 24;
    Hour = local_5;
    return;
}
UFUNCTION()
void SetTimePaused(const bool bPaused)
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Modify local_6;
    FCS_TimeOfDay& local_8 = local_6.opCall();
    if (local_8)
    {
        local_8.SetbPaused(bPaused);
    }
    return;
}
float32 GetTimeSpeed()
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Get local_6;
    const FCS_TimeOfDay& local_8 = local_6.opCall();
    if (local_8)
    {
        return local_8.GetTimeSpeed();
    }
    return 0.0f;
}
void SetTimeSpeed(const float32 InTimeSpeed)
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Modify local_6;
    FCS_TimeOfDay& local_8 = local_6.opCall();
    if (local_8)
    {
        local_8.SetTimeSpeed(InTimeSpeed);
    }
    return;
}
UFUNCTION()
void ForwardTimeOfDayTo(const float32 TargetTimeOfDayHours, const float32 BlendDuration = 0.f)
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    if (local_2.IsValid())
    {
        float32 local_7 = FTimeOfDayUtils::GetCurrentTimeOfDayInHours();
        float32 local_8 = TargetTimeOfDayHours;
        while (local_8 < local_7)
        {
            local_8 = local_8 + 24.0f;
        }
        float32 local_6 = FTimeOfDayUtils::GetTimeSpeed();
        Get local_14;
        const FCS_FastForwardTODInfo& local_16 = local_14.opCall();
        if (local_16)
        {
            local_6 = local_16.OriginTimeSpeed;
        }
        local_16.OriginTimeSpeed = local_6;
        int local_21 = FTimeOfDayUtils::GetTimeOfDayInSeconds(local_8);
        local_16.TargetTimeOfDaySeconds = local_21;
        local_16.BlendDuration = BlendDuration;
        local_16.RemainBlendTime = BlendDuration;
        int local_21_2 = FTimeOfDayUtils::GetCurrentTimeOfDayInSeconds();
        if (BlendDuration > 0.0f)
        {
            local_16.TimeSpeed = ((int(local_16.TargetTimeOfDaySeconds) - local_21_2) / BlendDuration);
        }
    }
    return;
}
TDataObjectPtr<FTODStageConfig> GetTODStage(const float32 TimeOfDayHours)
{
    const UTimeOfDaySettings local_2;
    GetGameplaySettings<UTimeOfDaySettings> local_4;
    local_2 = local_4;
    return local_2.GetTODByHours(TimeOfDayHours);
}
TDataObjectPtr<FTODStageConfig> GetNextTODStage(const TDataObjectPtr<FTODStageConfig> &inout CurrentStage)
{
    const UTimeOfDaySettings local_2;
    GetGameplaySettings<UTimeOfDaySettings> local_4;
    local_2 = local_4;
    return local_2.GetNextTODStage(CurrentStage);
}
FName GetTODStageName(const float32 TimeOfDayHours)
{
    TDataObjectPtr<FTODStageConfig> local_24 = FTimeOfDayUtils::GetTODStage(TimeOfDayHours);
    if (local_24)
    {
        return local_24.GetDataName();
    }
    return NAME_None;
}
FName GetCurrentTODStageName()
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    Get local_6;
    const FCS_TimeOfDay& local_8 = local_6.opCall();
    if (local_8)
    {
        return local_8.GetTODStageName();
    }
    return NAME_None;
}
}
