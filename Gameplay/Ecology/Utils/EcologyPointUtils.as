

struct __Lambda_Gameplay_Ecology_Utils_EcologyPointUtils_97
{
    __Lambda_Gameplay_Ecology_Utils_EcologyPointUtils_97()
    {
        return;
    }
    float opCall(const FVector &inout EntityCenter, const int MinPoint, const float CellSize, const int VX, const int VY, const int VZ)
    {
        float local_6 = ((VX << 10) - MinPoint);
        float local_2 = ((VY << 10) - MinPoint);
        float local_8 = ((VZ << 10) - MinPoint);
        float local_10 = local_6 + CellSize;
        float local_12 = local_2 + CellSize;
        float local_14 = local_8 + CellSize;
        float local_18 = 0.0;
        if (EntityCenter.X < local_6)
        {
            local_18 = local_6 - EntityCenter.X;
        }
        else
        {
            if (EntityCenter.X > local_10)
            {
                local_18 = EntityCenter.X - local_10;
            }
        }
        float local_22 = 0.0;
        if (EntityCenter.Y < local_2)
        {
            local_22 = local_2 - EntityCenter.Y;
        }
        else
        {
            if (EntityCenter.Y > local_12)
            {
                local_22 = EntityCenter.Y - local_12;
            }
        }
        float local_24 = 0.0;
        if (EntityCenter.Z < local_8)
        {
            local_24 = local_8 - EntityCenter.Z;
        }
        else
        {
            if (EntityCenter.Z > local_14)
            {
                local_24 = EntityCenter.Z - local_14;
            }
        }
        return (((local_18 * local_18) + (local_22 * local_22)) + (local_24 * local_24));
    }
}

struct __Lambda_Gameplay_Ecology_Utils_EcologyPointUtils_99
{
    __Lambda_Gameplay_Ecology_Utils_EcologyPointUtils_99()
    {
        return;
    }
    void opCall(const FVector &inout EntityCenter, const float RadiusSq, const FEcologyPointQuery &inout PointQuery, FCS_EcologyScriptGlobalContext &inout ECSWorldContext, TSet<FECSEntityId> &inout SearchedSet, FECSEntityId &inout BestEntityId, float &inout BestDistSq, const FVoxelPosition &inout VoxelPos)
    {
        int local_4 = 0;
        int local_44 = 0;
        int local_74 = 0;
        FVoxelRegionIndex local_2 = VoxelPos.ToRegionPos();
        TMap<int64, FEcologyVoxelSceneRegionSlot>& local_8 = local_4.GetCellSlotDataRef(EEcologyVoxelUnitSlot(3));
        int local_12 = VoxelPos.ToCellIndex();
        if (!(local_8.Contains(local_12)))
        {
            return;
        }
        FEcologyVoxelSceneRegionSlot& local_16 = local_8[local_12];
        for (auto& local_34 : local_16.SlotData)
        {
            if (SearchedSet.Contains(local_34.GetKey()))
            {
                continue;
            }
            SearchedSet.Add(local_34.GetKey());
            if (!(FECSEntity(local_34.GetKey()).IsValid()))
            {
                continue;
            }
            if (!(local_44))
            {
                continue;
            }
            if (!(PointQuery.DomainTagQuery.IsEmpty()) && !(PointQuery.DomainTagQuery.Matches(local_44.DomainTag.GetSingleTagContainer())))
            {
                continue;
            }
            if (PointQuery.OwnerGroup.IsValid())
            {
                int local_64;
                if (!(local_64))
                {
                    continue;
                }
                if (!((PointQuery.OwnerGroup == 0)))
                {
                    continue;
                }
            }
            if (!(local_74))
            {
                continue;
            }
            float local_90 = (FVector(local_74.GetPosition()) - EntityCenter).SizeSquared();
            if (RadiusSq >= 0.0 && (local_90 > RadiusSq))
            {
                continue;
            }
            if (BestDistSq < 0.0 || (local_90 < BestDistSq))
            {
                BestDistSq = local_90;
                BestEntityId = local_34.GetKey();
            }
        }
        return;
    }
}

struct __Lambda_Gameplay_Ecology_Utils_EcologyPointUtils_101
{
    __Lambda_Gameplay_Ecology_Utils_EcologyPointUtils_101()
    {
        return;
    }
    float opCall(const FVector &inout EntityCenter, const int MinPoint, const float CellSize, const FVoxelPosition &inout CenterVoxel, const int Ring)
    {
        float local_38;
        if (Ring <= 0)
        {
            return 0.0;
        }
        float local_6 = -1.0;
        int local_1 = -Ring;
        for (; local_1 <= Ring; ++local_1)
        {
            int local_7 = -Ring;
            for (; local_7 <= Ring; ++local_7)
            {
                int local_8 = -Ring;
                for (; local_8 <= Ring; ++local_8)
                {
                    int local_9 = FMath::Abs(local_8);
                    if (FMath::Max(FMath::Max(FMath::Abs(local_1), FMath::Abs(local_7)), local_9) != Ring)
                    {
                        continue;
                    }
                    int local_10;
                    int local_12 = CenterVoxel.X + local_1;
                    int local_14 = CenterVoxel.Y + local_7;
                    int local_15 = CenterVoxel.Z + local_8;
                    local_10 = local_12 << 10;
                    local_9 = local_10 - MinPoint;
                    float local_4 = local_9;
                    local_9 = local_14 << 10;
                    local_10 = local_9 - MinPoint;
                    float local_18 = local_10;
                    local_10 = local_15 << 10;
                    local_9 = local_10 - MinPoint;
                    float local_22 = local_9;
                    float local_24 = local_4 + CellSize;
                    float local_26 = local_18 + CellSize;
                    float local_28 = local_22 + CellSize;
                    float local_32 = 0.0;
                    if (EntityCenter.X < local_4)
                    {
                        local_32 = local_4 - EntityCenter.X;
                    }
                    else
                    {
                        if (EntityCenter.X > local_24)
                        {
                            local_32 = EntityCenter.X - local_24;
                        }
                    }
                    float local_34 = 0.0;
                    if (EntityCenter.Y < local_18)
                    {
                        local_34 = local_18 - EntityCenter.Y;
                    }
                    else
                    {
                        if (EntityCenter.Y > local_26)
                        {
                            local_34 = EntityCenter.Y - local_26;
                        }
                    }
                    float local_36 = 0.0;
                    if (EntityCenter.Z < local_22)
                    {
                        local_36 = local_22 - EntityCenter.Z;
                    }
                    else
                    {
                        if (EntityCenter.Z > local_28)
                        {
                            local_36 = EntityCenter.Z - local_28;
                        }
                    }
                    float local_30 = local_32 * local_32;
                    float local_40 = local_34 * local_34;
                    local_30 = local_30 + local_40;
                    local_40 = local_36 * local_36;
                    local_30 = local_30 + local_40;
                    if ((local_6 < 0.0 || (local_30 < local_6)))
                    {
                        local_6 = local_30;
                    }
                }
            }
        }
        if (local_6 < 0.0)
        {
            local_38 = 0.0;
        }
        else
        {
            local_38 = local_6;
        }
        return local_38;
    }
}

namespace FEcologyPointUtils
{
FEcologyPointQueryResult QueryPoints(const FVector &inout EntityCenter, FCS_EcologyScriptGlobalContext &inout ECSWorldContext, const FEcologyPointQuery &inout PointQuery)
{
    TMapIterator<FECSEntityId, FEcologyVoxelSceneUnitSummary> local_142;
    FEcologyPointQueryResult local_20;
    int local_162 = 0;
    FEcologyPointQueryResult __r;
    FBox local_56 = FBox::BuildAABB(EntityCenter, FVector(PointQuery.Bounds.SphereRadius));
    TSet<FECSEntityId> local_80;
    FVoxelRegionScope local_84 = FVoxelRegionScope(local_56);
    FVoxelRegionIterator local_98 = local_84.Iterator();
    for (; local_98.CanProceed;)
    {
        FEcologyVoxelSceneRegion& local_114 = ECSWorldContext.VoxelScene.FindOrAddRegion(local_98.Proceed().Current);
        for (auto& local_134 : local_114.GetCellSlotDataRef(EEcologyVoxelUnitSlot(3)))
        {
            local_134;
            for (; local_142.CanProceed;)
            {
                auto local_152 = local_142.Proceed();
                if (local_80.Contains(local_152.GetKey()))
                {
                    continue;
                }
                local_80.Add(local_152.GetKey());
                if (!(FECSEntity(local_152.GetKey()).IsValid()))
                {
                    continue;
                }
                if (!(PointQuery.DomainTagQuery.IsEmpty()) && !(PointQuery.DomainTagQuery.Matches(local_162.DomainTag.GetSingleTagContainer())))
                {
                    continue;
                }
                if (PointQuery.OwnerGroup.IsValid())
                {
                    if ((!((PointQuery.OwnerGroup == 0))))
                    {
                        continue;
                    }
                }
                Get local_190;
                const FC_Transform& local_192 = local_190.opCall();
                if (local_192)
                {
                    if (EntityCenter.DistSquaredXY(local_192.GetPosition()) > (PointQuery.Bounds.SphereRadius * PointQuery.Bounds.SphereRadius))
                    {
                        continue;
                    }
                }
                else
                {
                    continue;
                }
                local_20.ActivatePoint.Add(local_152.GetKey());
            }
        }
    }
    return __r;
}
FEcologyPointQueryResult QueryNearestPoint(const FVector &inout EntityCenter, FCS_EcologyScriptGlobalContext &inout ECSWorldContext, const FEcologyPointQuery &inout PointQuery)
{
    float local_30;
    FEcologyPointQueryResult local_20;
    FEcologyPointQueryResult __r;
    float local_24 = PointQuery.Bounds.SphereRadius;
    if (local_24 > 0.0)
    {
        local_30 = local_24 * local_24;
    }
    else
    {
        local_30 = -1.0;
    }
    int local_31 = 10;
    int64 local_34 = 4652218415073722368;
    int local_35 = 33554432;
    int local_36 = 0;
    if (local_24 > 0.0)
    {
        local_36 = FMath::IntegerDivisionTrunc((int(local_24) + 1024) - 1, 1024);
    }
    FVoxelPosition local_50 = FVoxelPosition(EntityCenter);
    TSet<FECSEntityId> local_70;
    FECSEntityId local_71 = FECSEntityId(ENTITY_ID_NULL);
    float local_74 = -1.0;
    __Lambda_Gameplay_Ecology_Utils_EcologyPointUtils_99 local_80;
    __Lambda_Gameplay_Ecology_Utils_EcologyPointUtils_101 local_84;
    int local_87 = 0;
    for (; local_87 <= local_36; ++local_87)
    {
        int local_39 = -local_87;
        for (; local_39 <= local_87; ++local_39)
        {
            int local_32_2 = -local_87;
            for (; local_32_2 <= local_87; ++local_32_2)
            {
                int local_88 = -local_87;
                for (; local_88 <= local_87; ++local_88)
                {
                    if (FMath::Max(FMath::Max(FMath::Abs(local_39), FMath::Abs(local_32_2)), FMath::Abs(local_88)) != local_87)
                    {
                        continue;
                    }
                    FVoxelPosition local_102;
                    local_102.X = (local_50.X + local_39);
                    local_102.Y = (local_50.Y + local_32_2);
                    local_102.Z = (local_50.Z + local_88);
                    local_80.opCall(EntityCenter, local_30, PointQuery, ECSWorldContext, local_70, local_71, local_74, local_102);
                }
            }
        }
        if ((local_74 >= 0.0 && (local_87 < local_36)))
        {
            if (local_84.opCall(EntityCenter, 33554432, 1024.0, local_50, (local_87 + 1)) >= local_74)
            {
                break;
            }
        }
    }
    if ((!((local_71 == ENTITY_ID_NULL))))
    {
        local_20.ActivatePoint.Add(local_71);
    }
    return __r;
}
}
