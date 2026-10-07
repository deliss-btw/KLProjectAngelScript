
enum EOculusState
{
    Consumed,
    Ready,
}


struct FOculusStateData
{
    UPROPERTY()
    FName StateMachineName;
    UPROPERTY()
    FName StateName;
    UPROPERTY()
    bool bFallBack;
    UPROPERTY()
    EOculusState FallBack;

    FOculusStateData()
    {
        this.bFallBack = false;
        this.FallBack = EOculusState(0);
        FName local_4 = FName("Main");
        this.StateName = FName("Consumed");
        return;
    }
}

