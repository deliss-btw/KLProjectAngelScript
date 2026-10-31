namespace FEcologySchedulerUtils
{
    const int UpdateDurationForHigh = 10;
    const int UpdateDurationForMiddle = 60;

void AddFlockToScheduler(const FECSEntity &inout Entity, FC_EcologyFlockComponent &inout FlockComponent, FCS_EcologyScheduler &inout Scheduler = ECS::ECSWorld.Modify<FCS_EcologyScheduler>())
{
    if (!(Scheduler))
    {
        return;
    }
    FEcologySchedulerUtils::UpdateEntityToScheduler(Entity, EEcologySchedulerLevel(3), Scheduler);
    return;
}
void UpdateEntityToScheduler(const FECSEntity &inout Entity, const EEcologySchedulerLevel NewLevel, FCS_EcologyScheduler &inout Scheduler = ECS::ECSWorld.Modify<FCS_EcologyScheduler>())
{
    FC_EcologySchedulerUnit local_6;
    int local_7 = local_6.CurrentScedulerLevel;
    local_6.CurrentScedulerLevel = NewLevel;
    if (local_7 == int(NewLevel))
    {
        return;
    }
    FECSEntity local_16 = FECSEntity(Entity.GetId());
    Scheduler.UpdateSchedulerUnit(local_16, EEcologySchedulerLevel(NewLevel), EEcologySchedulerLevel(local_7));
    if (local_7 == 4)
    {
        FC_ControlByEcologySchedulerTag local_22;
        Assign local_20;
        local_20.opCall(local_22);
    }
    if (int(NewLevel) == 4)
    {
        Remove local_26;
        local_26.opCall();
    }
    return;
}
void RemoveEntityFromScheduler(const FECSEntity &inout Entity, const EEcologySchedulerLevel ExitLevel, FCS_EcologyScheduler &inout Scheduler = ECS::ECSWorld.Modify<FCS_EcologyScheduler>())
{
    FECSEntity local_6 = FECSEntity(Entity.GetId());
    Scheduler.UpdateSchedulerUnit(local_6, EEcologySchedulerLevel(4), EEcologySchedulerLevel(ExitLevel));
    Remove local_10;
    local_10.opCall();
    return;
}
}
