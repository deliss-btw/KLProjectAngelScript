
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
    FName StateMachineName;
    UPROPERTY()
    FName StateName;
    UPROPERTY()
    bool bFallBack;
    UPROPERTY()
    ETeleporterState FallBack;

    FAccountExclusiveTeleporterStateData()
    {
        this.bFallBack = false;
        this.FallBack = ETeleporterState(0);
        FName local_4 = FName("Main");
        this.StateName = FName("Deactivated");
        return;
    }
}

