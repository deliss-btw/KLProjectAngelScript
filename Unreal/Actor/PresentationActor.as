

class APresentationActor : APresentationActorBase
{
    APresentationActor()
    {
        return;
    }
    UFUNCTION()
    void OnPresentationStateChanged_Implementation(const FName &inout StateName)
    {
        this.BP_OnPresentationStateChanged(StateName);
        return;
    }
    UFUNCTION()
    void BP_OnPresentationStateChanged_Implementation(const FName &inout StateName)
    {
        return;
    }
    void BP_OnPresentationStateChanged(const FName &inout StateName)
    {
        __Evt_PushArgument__FName(StateName);
        __Evt_Execute(this, n"BP_OnPresentationStateChanged");
        return;
    }
}

