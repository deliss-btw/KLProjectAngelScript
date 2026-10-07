
namespace FEcologyResourceUtils
{
void PinedResource(const FECSEntity &inout Flock, FC_EcologyFlockComponent &inout FlockComponent, const FECSEntity &inout Resource, const bool bPin)
{
    int local_4 = 0;
    if (!(Resource.IsValid()))
    {
        return;
    }
    if (!(local_4))
    {
        return;
    }
    FEcologyResourceUtils::PinedResource(Flock, FlockComponent, local_4, bPin);
    return;
}
void PinedResource(const FECSEntity &inout Flock, const FC_EcologyFlockComponent &inout FlockComponent, FC_EcologyResourceProviderSummary &inout Resource, const bool bPin)
{
    bool local_3 = Resource.PinedTeams.Contains(Flock.GetId());
    if ((local_3 && !(bPin)))
    {
        --Resource.PinedTeamCount;
        FECSEntityId local_2 = Flock.GetId();
        return;
    }
    if (!(local_3) && bPin)
    {
        ++Resource.PinedTeamCount;
        Resource.PinedTeams.Add(Flock.GetId());
    }
    return;
}
void ProcessResourceConditionChanged(const FECSEntity &inout Entity, const FC_EcologyResourceProviderSummary &inout Summary, const bool bLastState, const bool bNextState)
{
    if (bNextState == false)
    {
        FEcologyResourceUtils::NotifyResourceUserRefresh(Summary);
    }
    return;
}
void NotifyResourceUserRefresh(const FC_EcologyResourceProviderSummary &inout Summary)
{
    if (Summary.PinedTeams.Num() > 0)
    {
        for (auto& local_22 : Summary.PinedTeams)
        {
            if (!(FECSEntity(local_22)))
            {
                continue;
            }
            FC_NeedCheckResourceTag local_36;
            Assign local_34;
            local_34.opCall(local_36);
        }
    }
    return;
}
FECSEntity SpawnDynamicResource(const FECSEntity &inout Outer, const FSingleResourceConfig &inout ResourceConfig, const FVector &inout Position, const FVector &inout Rotation, const FFPTime &inout SpawnTime = ECS::ECSWorld.FixedTime.Time, const float32 Duration = -1.0f)
{
    FEcologyConfigGenerateContext local_32;
    int local_64 = 0;
    local_32.OuterEntity = Outer;
    local_32.bOuterIsConfig = false;
    local_32.SetDefaultedTransform(Position, Rotation.Rotation());
    FECSEntity local_44 = ResourceConfig.GenerateRuntimeEntity(local_32);
    if (!(local_44))
    {
        XError(ELog(30), "SpawnDynamicResource Failed");
        return FECSEntity();
    }
    if (Duration > 0.0f)
    {
        local_64.SetSpawnTime(SpawnTime);
        local_64.SetLifeDuration(FFPTime(Duration));
        Assign local_72;
        local_72.opCall(FC_EcologyLifeTimeCommonControlTag());
    }
    return local_44;
}
bool CheckResourceValid(const FECSEntityId &inout ResourceEntityId)
{
    if (!(FECSEntity(ResourceEntityId).IsValid()))
    {
        return false;
    }
    FECSEntity local_4 = FECSEntity(ResourceEntityId);
    Has local_10;
    if (local_10.opCall())
    {
        return false;
    }
    return true;
}
}
