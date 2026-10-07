

// NOTE: class defaults are not authored in this module: FGameModeBehaviorSettings_Timer (body was stubbed).
// They are carried over byte-exact when this module is recompiled.

UCLASS(Abstract)
class UGameModeBehavior : UObject
{
    UGameModeBehavior()
    {
        return;
    }
    void OnInit(const FCS_GameModeProfile &inout Profile, const FInstancedStruct &inout BehaviorSetting) const
    {
        return;
    }
    void OnFirstTick(const FCS_GameModeProfile &inout Profile, const FInstancedStruct &inout BehaviorSetting) const
    {
        return;
    }
    void OnTickPreparing(const FCS_GameModeProfile &inout Profile, const FInstancedStruct &inout BehaviorSetting) const
    {
        return;
    }
    void OnTickStarting(const FCS_GameModeProfile &inout Profile, const FInstancedStruct &inout BehaviorSetting) const
    {
        return;
    }
    void OnTickPlaying(const FCS_GameModeProfile &inout Profile, const FInstancedStruct &inout BehaviorSetting) const
    {
        return;
    }
    void OnTickFinishing(const FCS_GameModeProfile &inout Profile, const FInstancedStruct &inout BehaviorSetting) const
    {
        return;
    }
    void OnChangeGameState(const FCS_GameModeProfile &inout Profile, const FInstancedStruct &inout BehaviorSetting, const EFCS_GameStageType OldStageType, const EFCS_GameStageType NewStageType) const
    {
        return;
    }
    void OnHandleReviveTeleport(const FCS_GameModeProfile &inout Profile, const FInstancedStruct &inout BehaviorSetting, FCE_Event_ReviveTeleport &inout Event) const
    {
        return;
    }
    void OnHandleDeath(const FCS_GameModeProfile &inout Profile, const FInstancedStruct &inout BehaviorSetting, FCE_DeathEvent &inout Event) const
    {
        return;
    }
    void OnHandleReborn(const FCS_GameModeProfile &inout Profile, const FInstancedStruct &inout BehaviorSetting, FCE_Reborn &inout Event) const
    {
        return;
    }
}

struct FGameModeBehaviorSettings_Timer : FGameModeBehaviorSettings
{
    FGameModeBehaviorSettings _base_FGameModeBehaviorSettings;
    UPROPERTY()
    TArray<FGameModeTimerEntrySetup> TimerEntrySetups;

    FGameModeBehaviorSettings_Timer()
    {
        super();
        this.__InitDefaults();
        return;
    }
}

class UGameModeBehavior_Timer : UGameModeBehavior
{
    UGameModeBehavior_Timer()
    {
        super();
        return;
    }
    void OnChangeGameState(const FCS_GameModeProfile &inout Profile, const FInstancedStruct &inout BehaviorSetting, const EFCS_GameStageType OldStageType, const EFCS_GameStageType NewStageType) const
    {
        int local_10 = 0;
        if (int(NewStageType) != 3)
        {
            return;
        }
        ::FGameModeTimerUtils::AddTimersFromSetup(local_10.TimerEntrySetups);
        XLog(ELog(33), FString().Append("[TimedAction] Registered ").Append(local_10.TimerEntrySetups.Num()).Append(" timer(s) at Playing start"));
        return;
    }
}

