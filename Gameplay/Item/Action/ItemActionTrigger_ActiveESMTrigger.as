

class UItemActionTrigger_ActiveESMTrigger : UItemActionTriggerBase
{
    UPROPERTY()
    FNameHandle_ESMBBTrigger TriggerToActivate;
    UPROPERTY()
    FFPTime ValidateTime = 1.0;
    UPROPERTY()
    int ConsumeKey = 0;


    void Execute(const FItemActionSource &inout ActionSource) const
    {
        FFPTime local_4 = FFPTime(ECS::GetECSWorld().GetFixedTime().Time);
        FESMTriggerUtils::ActivateESMTrigger(ActionSource.GetItemOwner(), this.TriggerToActivate.Name, local_4, this.ValidateTime, this.ConsumeKey);
        return;
    }
}

