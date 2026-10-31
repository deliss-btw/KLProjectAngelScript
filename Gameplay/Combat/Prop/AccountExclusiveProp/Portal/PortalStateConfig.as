enum EPortalState
{
    Unlocked,
    Locked,
}

struct FPortalStateData
{
    UPROPERTY()
    FName StateMachineName = FName("Main");
    UPROPERTY()
    FName StateName = FName("Unlocked");
    UPROPERTY()
    bool bFallBack;
    UPROPERTY()
    EPortalState FallBack;

}

