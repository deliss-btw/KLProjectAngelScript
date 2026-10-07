
namespace VisualComponentToggleUtils
{
void SetLogicVisualComponentHiddenWithDelay(const FECSEntity &inout Entity, const FC_VisualComponentToggleConfig &inout VisualComponentToggleConfig, const TArray<FName> &inout LogicNames, const bool bHidden, const FFPTime &inout CurrentTime, const FName &inout InstigatorName)
{
    for (auto& local_16 : LogicNames)
    {
        int local_18 = VisualComponentToggleConfig.Names.IndexOfByKey(local_16);
        if (local_18 >= 0 && (local_18 < VisualComponentToggleConfig.DelayHiddenTimes.Num()))
        {
            float32 local_20;
            local_20 = VisualComponentToggleConfig.DelayHiddenTimes[local_18];
            if ((bHidden && (local_20 > 0.0f)))
            {
                ModifyOrAdd local_26;
                FC_LogicVisualComponentToggleDelayHidden& local_28 = local_26.opCall();
                if (local_28)
                {
                    local_28.AddDelayTaskItem(local_16, FFPTime((CurrentTime.ToSeconds() + local_20)));
                }
                continue;
            }
            if (!(bHidden))
            {
                Modify local_38;
                FC_LogicVisualComponentToggleDelayHidden& local_28_2 = local_38.opCall();
                if (local_28_2)
                {
                    if (local_28_2.TryCancelDelayHiddenTaskByLogicNameAndUpdateNextTargetTime(local_16))
                    {
                        Remove local_42;
                        local_42.opCall();
                    }
                }
            }
            FVisualComponentToggleUtils::SetVisualComponentHidden(Entity, local_16, bHidden, InstigatorName);
        }
    }
    return;
}
void SetPresentationVisualComponentHiddenWithDelay(const FECSEntity &inout Entity, const FC_VisualComponentToggleConfig &inout VisualComponentToggleConfig, const TArray<FName> &inout LogicNames, const bool bHidden, const FFPTime &inout CurrentTime, const FName &inout InstigatorName)
{
    for (auto& local_16 : LogicNames)
    {
        int local_18 = VisualComponentToggleConfig.Names.IndexOfByKey(local_16);
        if (local_18 >= 0 && (local_18 < VisualComponentToggleConfig.DelayHiddenTimes.Num()))
        {
            float32 local_20;
            local_20 = VisualComponentToggleConfig.DelayHiddenTimes[local_18];
            if ((bHidden && (local_20 > 0.0f)))
            {
                ModifyOrAdd local_26;
                FC_PresentationVisualComponentToggleDelayHidden& local_28 = local_26.opCall();
                if (local_28)
                {
                    local_28.AddDelayTaskItem(local_16, FFPTime((CurrentTime.ToSeconds() + local_20)));
                }
                continue;
            }
            if (!(bHidden))
            {
                Modify local_38;
                FC_PresentationVisualComponentToggleDelayHidden& local_28_2 = local_38.opCall();
                if (local_28_2)
                {
                    if (local_28_2.TryCancelDelayHiddenTaskByLogicNameAndUpdateNextTargetTime(local_16))
                    {
                        Remove local_42;
                        local_42.opCall();
                    }
                }
            }
            FVisualComponentToggleUtils::SetVisualComponentHidden(Entity, local_16, bHidden, InstigatorName);
        }
    }
    return;
}
UFUNCTION()
void SetVisualComponentHiddenWithPotentialDelay(const FECSEntity &inout Entity, const FC_VisualComponentToggleConfig &inout VisualComponentToggleConfig, const TArray<FName> &inout LogicNames, const bool bHidden, const FFPTime &inout CurrentTime, const FName &inout InstigatorName, const bool bUnhideReinitializeNS = true)
{
    if ((int(Entity.GetRegistryType())) == 2 || (int(Entity.GetRegistryType()) == 1) || VisualComponentToggleConfig.bForcePresentationMode)
    {
        VisualComponentToggleUtils::SetPresentationVisualComponentHiddenWithDelay(Entity, VisualComponentToggleConfig, LogicNames, bHidden, CurrentTime, InstigatorName);
        if (!(bHidden) && bUnhideReinitializeNS)
        {
            FFXUtils::ReinitializeNiagaraComponent(Entity, VisualComponentToggleConfig, LogicNames);
        }
        return;
    }
    VisualComponentToggleUtils::SetLogicVisualComponentHiddenWithDelay(Entity, VisualComponentToggleConfig, LogicNames, bHidden, CurrentTime, InstigatorName);
    if (!(bHidden) && bUnhideReinitializeNS)
    {
        FFPTime local_14 = FFPTime(-1);
        SendEvent local_12;
        FCE_ReinitializeNiagaraComponent& local_16 = local_12.opCall(local_14);
        if (local_16)
        {
            local_16.LogicNames = LogicNames;
        }
    }
    return;
}
void ApplyMeshMaterialOverride(const FECSEntity &inout Entity, const FC_VisualComponentToggleConfig &inout Config, const TArray<FName> &inout LogicNames, const bool bDither)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
void ApplyViewToggle(const FECSEntity &inout Entity, const FC_VisualComponentToggleConfig &inout Config, const TArray<FName> &inout LogicNames, const bool bHiding, const FFPTime &inout WorldTime)
{
    if (bHiding)
    {
        FFXUtils::SetNiagaraComponentDitherOverrideParam(Entity, Config, WorldTime, LogicNames);
        VisualComponentToggleUtils::ApplyMeshMaterialOverride(Entity, Config, LogicNames, true);
        return;
    }
    VisualComponentToggleUtils::ApplyMeshMaterialOverride(Entity, Config, LogicNames, false);
    return;
}
}
