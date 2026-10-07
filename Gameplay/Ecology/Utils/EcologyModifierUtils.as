
namespace FEcologyModifierConst
{
    const FEcologyResourceModifierConfig EmptyEcologyModiferConfig = FEcologyResourceModifierConfig();

}
namespace FEcologyModifierUtils
{
void UpdateModifiersForRegion(AECSRegionVolume &inout Region, const FEcologyModifierSummary &inout Summary, const FC_EcologyResourceModifierConfig &inout Config, const bool bAdd)
{
    int local_54 = 0;
    TMapIterator<FECSEntityId, FEcologyVoxelSceneUnitSummary> local_112;
    FVoxelRegionScope local_32 = FVoxelRegionScope(Region.GetVolumeBoundsWithCache().GetBox());
    FECSWorldPtr local_52 = ECS::GetECSWorld();
    FVoxelRegionIterator local_64 = local_32.Iterator();
    for (; local_64.CanProceed;)
    {
        FEcologyVoxelSceneRegion& local_80 = local_54.VoxelScene.FindOrAddRegion(local_64.Proceed().Current);
        FECSEntityId local_81 = Region.GetRegionEntity().GetId();
        FRegionVolumeSummary local_84;
        local_84.bHasEcologyModifier = true;
        for (auto& local_104 : local_80.GetCellSlotDataRef(EEcologyVoxelUnitSlot(0)))
        {
            local_104;
            for (; local_112.CanProceed;)
            {
                auto local_122 = local_112.Proceed();
                if (bAdd)
                {
                    FEcologyModifierUtils::TryAddModifierToEntity(Config, Summary, FECSEntity(local_122.GetKey()));
                    continue;
                }
                FEcologyModifierUtils::TryRemoveModifierToEntity(Summary.ConfigRef, FECSEntity(local_122.GetKey()));
            }
        }
    }
    return;
}
void TryAddModifierToEntity(const FEcologyModifierSummary &inout Summary, const FECSEntity &inout Target)
{
    int local_16 = 0;
    if (!(Target.IsValid()))
    {
        return;
    }
    FECSEntity local_6;
    if (!(local_6.IsValid()))
    {
        return;
    }
    FEcologyModifierUtils::TryAddModifierToEntity(local_16, Summary, Target);
    return;
}
void TryAddModifierToEntity(const FC_EcologyResourceModifierConfig &inout Config, const FEcologyModifierSummary &inout Summary, const FECSEntity &inout Target)
{
    int local_8 = 0;
    if (!(Target.IsValid()))
    {
        return;
    }
    if (!(Config.Filter.CheckTargetEntity(Target)))
    {
        return;
    }
    FECSEntityId local_2 = Summary.ConfigRef;
    if (!(local_8.Modifiers.Contains(local_2)))
    {
        local_8.Modifiers.Add(local_2, Summary);
    }
    return;
}
void TryRemoveModifierToEntity(const FECSEntityId &inout ModifierId, const FECSEntity &inout Target)
{
    int local_8 = 0;
    if (!(Target.IsValid()))
    {
        return;
    }
    if (!(local_8.Modifiers.Contains(ModifierId)))
    {
    }
    return;
}
}
