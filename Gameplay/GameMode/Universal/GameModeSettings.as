
enum EGameModeEntryMode
{
    Match,
    Room,
}


struct FCombatRestrictionSettings
{
    UPROPERTY()
    int Flags = 0;
    UPROPERTY()
    int PotionMaxCount = 0;
    UPROPERTY()
    FName DivineSkillFilterTag = NAME_None;


    bool HasFlag(const ECombatRestrictionFlags Flag) const
    {
        int local_2 = this.Flags & int(Flag);
        return (local_2 != 0);
    }
}

struct FGameModeFlowSettings
{
    UPROPERTY()
    TSubclassOf<UGameModeFlow> FlowClass;
    UPROPERTY()
    EGameModeEntryMode EntryMode = EGameModeEntryMode(1);
    UPROPERTY()
    int MaxTeamCount = 2;
    UPROPERTY()
    int MaxPlayersPerTeam = 3;
    UPROPERTY()
    TDataObjectPtr<FReviveData> ReviveRule;
    UPROPERTY()
    bool bEnableManualRevive = true;
    UPROPERTY()
    int FairModeFlags = 63;
    UPROPERTY()
    FCombatRestrictionSettings CombatRestriction;
    UPROPERTY()
    FDataTablePtr DamageCoefficientDataTable;
    UPROPERTY()
    int MatchFinishDelaySeconds = 60;
    UPROPERTY()
    int PostShutdownDelaySeconds = 5;


    bool IsValid() const
    {
        TSubclassOf<UGameModeFlow> local_2;
        local_2 = this;
        return (!((local_2 == nullptr)));
    }
}

struct FGameModeBehaviorSettings
{
    UPROPERTY()
    TSubclassOf<UGameModeBehavior> BehaviorClass;

    FGameModeBehaviorSettings()
    {
        return;
    }
    bool IsValid() const
    {
        TSubclassOf<UGameModeBehavior> local_2;
        local_2 = this;
        return (!((local_2 == nullptr)));
    }
}

