enum EOculusState
{
    Consumed,
    Ready,
}

struct FOculusStateData
{
    UPROPERTY()
    FName StateMachineName = FName("Main");
    UPROPERTY()
    FName StateName = FName("Consumed");
    UPROPERTY()
    bool bFallBack;
    UPROPERTY()
    EOculusState FallBack;

}

