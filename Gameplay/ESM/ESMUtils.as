
namespace FESMUtils
{
UFUNCTION()
void ActivateESMTrigger(const FECSEntity &inout Entity, const FNameHandle_ESMBBTrigger &inout TriggerName, const float32 ValidTime)
{
    bool local_4;
    if (!(Entity))
    {
        local_4 = false;
    }
    else
    {
        bool local_5 = ECS::GetRuntimeInfo().IsServer || (int(Entity.GetRegistryType()) == 2);
        if (local_5)
        {
            local_5 = true;
        }
        else
        {
            Has local_10;
            local_5 = local_10.opCall();
        }
        local_4 = local_5;
    }
    if (local_4)
    {
        Modify local_18;
        if (local_18.opCall())
        {
            FECSWorldPtr local_22 = Entity.GetWorld();
            GetDefaulted local_26;
            FFPTime local_20 = FFPTime(local_26.opCall().Time);
            FESMTriggerUtils::ActivateESMTrigger(Entity, TriggerName.Name, local_20, FFPTime(ValidTime), 0);
        }
    }
    return;
}
UFUNCTION()
void ClearESMTrigger(const FECSEntity &inout Entity, const FNameHandle_ESMBBTrigger &inout TriggerName)
{
    bool local_4;
    if (!(Entity))
    {
        local_4 = false;
    }
    else
    {
        bool local_5 = ECS::GetRuntimeInfo().IsServer || (int(Entity.GetRegistryType()) == 2);
        if (local_5)
        {
            local_5 = true;
        }
        else
        {
            Has local_10;
            local_5 = local_10.opCall();
        }
        local_4 = local_5;
    }
    if (local_4)
    {
        Modify local_18;
        if (local_18.opCall())
        {
            FESMTriggerUtils::ClearESMTrigger(Entity, TriggerName.Name);
        }
    }
    return;
}
int GetMainStateMachineIndex(const FECSEntity &inout Entity)
{
    int local_2 = 0;
    UESMAsset local_8 = local_2.Asset;
    if (local_8 == nullptr)
    {
        return -1;
    }
    int local_11 = 0;
    while (true)
    {
        UESMStateMachine local_16 = local_2.Asset.GetStateMachine(local_11);
        if (local_16 == nullptr)
        {
            break;
        }
        if ((local_16.GetDataName() == n"MainSM"))
        {
            return local_11;
        }
        local_11 = local_11 + 1;
    }
    return -1;
}
FName GetCurrentMainSMStateName(const FECSEntity &inout Entity)
{
    int local_6 = 0;
    int local_12 = 0;
    int local_2 = FESMUtils::GetMainStateMachineIndex(Entity);
    if (local_2 < 0)
    {
        return NAME_None;
    }
    if (local_2 >= local_6.Player.GetSMRuntime().Num())
    {
        return NAME_None;
    }
    UESMStateMachine local_20 = local_12.Asset.GetStateMachine(local_2);
    if (local_20 == nullptr)
    {
        return NAME_None;
    }
    UESMBaseState local_24 = local_20.GetBaseState(local_6.Player.GetSMRuntime()[].GetStateIndex());
    if (local_24 == nullptr)
    {
        return NAME_None;
    }
    return local_24.GetDataName();
}
bool MainSMHasState(const FECSEntity &inout Entity, const FName &inout StateName)
{
    int local_6 = 0;
    int local_2 = FESMUtils::GetMainStateMachineIndex(Entity);
    if (local_2 < 0)
    {
        return false;
    }
    UESMStateMachine local_14 = local_6.Asset.GetStateMachine(local_2);
    return local_14 != nullptr && (local_14.GetBaseStateByName(StateName) != nullptr);
}
}
