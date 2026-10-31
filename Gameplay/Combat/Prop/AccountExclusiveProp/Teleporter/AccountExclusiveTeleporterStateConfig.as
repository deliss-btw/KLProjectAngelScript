enum ETeleporterState
{
    Locked,
    Unlocked,
    Active,
    Activating,
}

struct FAccountExclusiveTeleporterStateData
{
    UPROPERTY()
    FName StateMachineName = FName("Main");
    UPROPERTY()
    FName StateName = FName("Deactivated");
    UPROPERTY()
    bool bFallBack;
    UPROPERTY()
    ETeleporterState FallBack;

}

