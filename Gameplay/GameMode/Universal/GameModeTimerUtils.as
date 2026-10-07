
namespace FGameModeTimerUtils
{
int AddTimer(const FGameModeTimerEntry &inout InEntry)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    int __r; return __r;
}
void AddTimers(const TArray<FGameModeTimerEntry> &inout Entries)
{
    int local_12 = 0;
    if (Entries.Num() == 0)
    {
        return;
    }
    FECSWorldPtr local_6 = ECS::GetECSWorld();
    FFPTime local_14 = FFPTime(Entries[0].TriggerTime);
    for (auto& local_28 : Entries)
    {
        int local_2 = local_12.AllocateHandle();
        local_12.TimerEntries.Add(local_2, local_28);
        FFPTime local_32 = local_28.TriggerTime;
        if (local_32.opCmp(local_14) < 0)
        {
            local_14 = local_28.TriggerTime;
        }
    }
    FFPTime local_34 = local_12.NextTriggerTime;
    if (local_34.opCmp(FFPTime(0)) < 0 || (local_14.opCmp(local_12.NextTriggerTime) < 0))
    {
        local_12.NextTriggerTime = local_14;
    }
    return;
}
FGameModeTimerEntry ResolveSetup(const FGameModeTimerEntrySetup &inout Setup, const FFPTime &inout BaseTime)
{
    FGameModeTimerEntry local_8;
    FGameModeTimerEntry __r;
    local_8.TriggerTime = (BaseTime + FFPTime(Setup.DelaySeconds));
    local_8.IntervalSeconds = Setup.IntervalSeconds;
    local_8.RemainingCount = Setup.IntervalSeconds > 0.0f ? int(Setup.RepeatCount) : 0;
    local_8.Action = Setup.Action;
    return __r;
}
void AddTimerFromSetup(const FGameModeTimerEntrySetup &inout Setup)
{
    FFPTime local_2 = FFPTime(ECS::GetECSWorld().GetFixedTime().Time);
    FGameModeTimerUtils::AddTimer(FGameModeTimerUtils::ResolveSetup(Setup, local_2));
    return;
}
void AddTimersFromSetup(const TArray<FGameModeTimerEntrySetup> &inout Setups)
{
    if (Setups.Num() == 0)
    {
        return;
    }
    FFPTime local_6 = FFPTime(ECS::GetECSWorld().GetFixedTime().Time);
    TArray<FGameModeTimerEntry> local_12;
    for (auto& local_26 : Setups)
    {
        local_12.Add(FGameModeTimerUtils::ResolveSetup(local_26, local_6));
    }
    FGameModeTimerUtils::AddTimers(local_12);
    return;
}
int AddTimerCallback(const float32 DelaySeconds, const FStructClosure &inout Closure)
{
    FGMTimerAction_Callback local_24;
    int local_52 = 0;
    local_24.Closure = Closure;
    FGameModeTimerEntry local_32;
    local_32.TriggerTime = (FFPTime(ECS::GetECSWorld().GetFixedTime().Time) + FFPTime(DelaySeconds));
    local_32.Action = FInstancedStruct::Make(local_24);
    FECSWorldPtr local_34 = ECS::GetECSWorld();
    int local_54 = local_52.AllocateHandle();
    local_52.TimerEntries.Add(local_54, local_32);
    FFPTime local_36 = local_52.NextTriggerTime;
    if (local_36.opCmp(FFPTime(0)) < 0 || ((local_32.TriggerTime.opCmp(local_52.NextTriggerTime) < 0)))
    {
        local_52.NextTriggerTime = local_32.TriggerTime;
    }
    return local_54;
}
bool RemoveTimer(const int HandleId)
{
    int local_14 = 0;
    if (HandleId <= 1)
    {
        return false;
    }
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    Has local_8;
    if (!(local_8.opCall()))
    {
        return false;
    }
    FECSWorldPtr local_4_2 = ECS::GetECSWorld();
    if (!(local_14.TimerEntries.Contains(HandleId)))
    {
        return false;
    }
    local_14.RefreshNextTriggerTime();
    return true;
}
}
