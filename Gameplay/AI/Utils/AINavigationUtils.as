
namespace FAINavigationUtils
{
bool IsInAirNavigationVolume(const FECSEntity &inout Entity)
{
    Get local_4;
    const FC_AirNavigable& local_6 = local_4.opCall();
    if (local_6)
    {
        Get local_12;
        const FC_Transform& local_14 = local_12.opCall();
        if (local_14)
        {
            return local_6.IsInNavigationVolume(local_14.GetPosition());
        }
    }
    return false;
}
bool IsTargetLocationFlyReachable(const FECSEntity &inout Entity, const FVector &inout Dest)
{
    const FC_AirNavigable& local_26;
    FECSWorldPtr local_2 = Entity.GetWorld();
    Get local_6;
    const FCS_AirNavigationManager& local_8 = local_6.opCall();
    if (local_8)
    {
        Get local_14;
        const FC_Transform& local_16 = local_14.opCall();
        if (local_16)
        {
            Has local_20;
            if (!(local_20.opCall()))
            {
                if (!(local_26.IsInNavigationVolume(local_16.GetPosition())))
                {
                    local_26.CurrentVolume = local_8.GetAirNavigationVolume(local_16.GetPosition());
                }
            }
            Get local_32;
            local_26 = local_32.opCall();
            if (local_26)
            {
                if (local_26.IsInNavigationVolume(local_16.GetPosition()))
                {
                    return local_8.IsTargetReachable(local_26, Dest);
                }
            }
        }
    }
    return false;
}
float32 GetToleranceDistance()
{
    if (UGameplayConfigsManager::GetAIMoveSettings().IsValid())
    {
        UAIMoveSettings local_4;
        return local_4.DistanceToleranceToPathPoints;
    }
    return 10.0f;
}
void ChangeMoveStance(const FECSEntity &inout Entity, const FFPTime &inout WorldTime, const ECharacterMoveStance NewStance, const ECharacterMoveStanceLayer MoveStanceLayer, const bool bClear)
{
    if (bClear)
    {
        FCE_AIMoveStanceClearRequest local_6;
        local_6.Entity = Entity;
        local_6.MoveStanceLayer = MoveStanceLayer;
        local_6.bClear = bClear;
        return;
    }
    FCE_AIMoveStanceChangeRequest local_12;
    local_12.Entity = Entity;
    local_12.NewStance = NewStance;
    local_12.MoveStanceLayer = MoveStanceLayer;
    local_12.bClear = bClear;
    return;
}
FName GetAIJumpTriggerV2()
{
    return n"EcosimAIJumpTrigger";
}
FName GetAIMoveAbilityTrigger()
{
    return n"MoveAbilityTrigger";
}
FName GetGroundToAirTrigger()
{
    return n"GroundToAirTrigger";
}
FName GetAirToGroundTrigger()
{
    return n"AirToGroundTrigger";
}
}
