
namespace FNPCComponentSwitchUtils
{
ENPCComponentSwitchAction ResolveAction(const FNPCMainConfig &inout NPCConfig, const ENPCRuntimeComponentFeature Feature)
{
    ENPCComponentSwitchAction local_1 = ENPCComponentSwitchAction(0);
    for (auto& local_18 : NPCConfig.ComponentSwitchOverrides)
    {
        if ((int(local_18.Feature)) == (int(Feature)))
        {
            local_1 = local_18.Action;
        }
    }
    return local_1;
}
bool IsForceDisabled(const FNPCMainConfig &inout NPCConfig, const ENPCRuntimeComponentFeature Feature)
{
    return (int((FNPCComponentSwitchUtils::ResolveAction(NPCConfig, ENPCRuntimeComponentFeature(Feature)))) == 1);
}
void ApplyAfterNPCInfo(const FECSEntity &inout Entity, const FNPCMainConfig &inout NPCConfig)
{
    if (FNPCComponentSwitchUtils::IsForceDisabled(NPCConfig, ENPCRuntimeComponentFeature(2)))
    {
        FNPCComponentSwitchUtils::DisableCombat(Entity);
    }
    return;
}
void DisableCombat(const FECSEntity &inout Entity)
{
    Remove local_4;
    local_4.opCall();
    Remove local_10;
    local_10.opCall();
    Remove local_14;
    local_14.opCall();
    Remove local_18;
    local_18.opCall();
    Remove local_22;
    local_22.opCall();
    Remove local_26;
    local_26.opCall();
    Remove local_30;
    local_30.opCall();
    Remove local_34;
    local_34.opCall();
    Remove local_38;
    local_38.opCall();
    Remove local_42;
    local_42.opCall();
    Remove local_46;
    local_46.opCall();
    Remove local_50;
    local_50.opCall();
    Remove local_54;
    local_54.opCall();
    Remove local_58;
    local_58.opCall();
    Remove local_62;
    local_62.opCall();
    Remove local_66;
    local_66.opCall();
    Remove local_70;
    local_70.opCall();
    Remove local_74;
    local_74.opCall();
    Remove local_78;
    local_78.opCall();
    Remove local_82;
    local_82.opCall();
    Remove local_86;
    local_86.opCall();
    Remove local_90;
    local_90.opCall();
    Remove local_94;
    local_94.opCall();
    Remove local_98;
    local_98.opCall();
    Remove local_102;
    local_102.opCall();
    FAIInputUtils::ClearAllSimulatedActionInputs(Entity);
    Remove local_106;
    local_106.opCall();
    Remove local_110;
    local_110.opCall();
    Remove local_114;
    local_114.opCall();
    Remove local_118;
    local_118.opCall();
    Remove local_122;
    local_122.opCall();
    Remove local_126;
    local_126.opCall();
    Remove local_130;
    local_130.opCall();
    Remove local_134;
    local_134.opCall();
    Remove local_138;
    local_138.opCall();
    return;
}
}
