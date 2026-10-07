
enum EPortalState
{
    Unlocked,
    Locked,
}


struct FPortalStateData
{
    UPROPERTY()
    FName StateMachineName;
    UPROPERTY()
    FName StateName;
    UPROPERTY()
    bool bFallBack;
    UPROPERTY()
    EPortalState FallBack;

    FPortalStateData()
    {
        this.bFallBack = false;
        this.FallBack = EPortalState(0);
        FName local_4 = FName("Main");
        this.StateName = FName("Unlocked");
        return;
    }
}

