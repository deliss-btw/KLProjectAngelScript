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
    int local_2;
    FName local_28;
    int local_40 = 0;
    if (bDither)
    {
        local_2 = EGameActorConfigSingleMaterialParamRequestTrigger(0);
    }
    else
    {
        local_2 = EGameActorConfigSingleMaterialParamRequestTrigger(1);
    }
    for (auto& local_20 : LogicNames)
    {
        FName local_32;
        if (bDither)
        {
            local_32 = FName(FString().Append("DitherMeshOfLogicName[").Append(local_20).Append("]"));
        }
        else
        {
            local_32 = FName(FString().Append("ShowMeshOfLogicName[").Append(local_20).Append("]"));
        }
        if (bDither)
        {
            local_28 = FName(FString().Append("ShowMeshOfLogicName[").Append(local_20).Append("]"));
        }
        else
        {
            local_28 = FName(FString().Append("DitherMeshOfLogicName[").Append(local_20).Append("]"));
        }
        int local_36 = Config.Names.IndexOfByKey(local_20);
        if (local_36 != INDEX_NONE && Config.MeshDitherOverrideMaterialParamConfigs.IsValidIndex(local_36))
        {
            if (local_40.IsEmpty())
            {
                continue;
            }
            TArray<FSingleMaterialParamRequestData> local_44;
            for (auto& local_58 : local_40)
            {
                if (int(local_58.GetTrigger()) != local_2)
                {
                    continue;
                }
                FSingleMaterialParamRequestData local_92;
                local_92.SetbUseLogicName(true);
                local_92.SetMeshName(local_20);
                local_92.SetbIsOverlayMaterial(local_58.GetbIsOverlayMaterial());
                local_92.SetbApplyToAllSlot(local_58.GetbApplyToAllSlot());
                local_92.SetbUseSlotName(local_58.GetbUseSlotName());
                local_92.SetMaterialIndex(local_58.GetMaterialIndex());
                local_92.SetMaterialSlotName(local_58.GetMaterialSlotName());
                local_92.SetOverrideMaterialPath(local_58.GetOverrideMaterialPath());
                local_92.SetFloatParams(local_58.GetFloatParams());
                local_92.SetVectorParams(local_58.GetVectorParams());
                local_92.SetTextureParams(local_58.GetTextureParams());
                local_44.Add(local_92);
            }
            FMaterialUtils::LocalOnlyRemoveChangeMaterialRequest(Entity, local_28, 0.0f, FSoftObjectPath());
            FMaterialUtils::LocalOnlyRequestChangeMaterialParam(Entity, local_32, local_44);
        }
    }
    return;
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
