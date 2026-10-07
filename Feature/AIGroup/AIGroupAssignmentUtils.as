

struct FCostMatrixRow
{
    UPROPERTY()
    TArray<int> Costs;

    FCostMatrixRow()
    {
        return;
    }
}

namespace FAIGroupAssignmentUtils
{
TArray<int> SolveHungarianAssignment(const TArray<FCostMatrixRow> &inout CostMatrix)
{
    int local_37;
    int local_39;
    int local_41;
    int local_2 = CostMatrix.Num();
    if (local_2 == 0)
    {
        return TArray<int>();
    }
    TArray<int> local_12;
    TArray<int> local_16;
    TArray<int> local_20;
    TArray<int> local_24;
    local_12.SetNum(local_2 + 1);
    local_16.SetNum(local_2 + 1);
    local_20.SetNum(local_2 + 1);
    local_24.SetNum(local_2 + 1);
    int local_25 = 0;
    for (; local_25 <= local_2; )
    {
        local_12[local_25] = 0;
        local_16[local_25] = 0;
        local_20[local_25] = 0;
        local_24[local_25] = 0;
        ++local_25;
    }
    int local_25_2 = 1;
    for (; local_25_2 <= local_2; ++local_25_2)
    {
        local_20[0] = local_25_2;
        int local_27 = 0;
        TArray<int> local_32;
        TArray<bool> local_36;
        local_32.SetNum(local_2 + 1);
        local_36.SetNum(local_2 + 1);
        local_37 = 0;
        for (; local_37 <= local_2; )
        {
            local_32[local_37] = 2147483647;
            local_36[local_37] = false;
            ++local_37;
        }
        local_36[local_27] = true;
        int local_38_2 = local_20[local_27];
        local_37 = local_38_2;
        local_39 = 2147483647;
        int local_40 = -1;
        local_41 = 1;
        for (; local_41 <= local_2; ++local_41)
        {
            if (!(local_36[local_41]))
            {
                int local_43 = local_41 - 1;
                local_38_2 = local_37 - 1;
                local_38_2 = CostMatrix[local_38_2].Costs[local_43];
                int local_44 = (local_38_2 - local_12[local_37]) - local_16[local_41];
                if (local_44 < local_32[local_41])
                {
                    local_32[local_41] = local_44;
                    local_24[local_41] = local_27;
                }
                if (local_32[local_41] < local_39)
                {
                    local_39 = local_32[local_41];
                    local_40 = local_41;
                }
            }
        }
        int local_44_2 = 0;
        for (; local_44_2 <= local_2; ++local_44_2)
        {
            if (local_36[local_44_2])
            {
                local_38_2 = local_12[local_20[local_44_2]];
                int local_1 = local_38_2 + local_39;
                local_38_2 = local_16[local_44_2];
                local_1 = local_38_2 - local_39;
                continue;
            }
            local_38_2 = local_32[local_44_2];
            int local_1_2 = local_38_2 - local_39;
        }
        while (local_38_2 != 0)
        {
            local_27 = local_40;
            local_38_2 = local_20[local_27];
        }
        while (local_27 != 0)
        {
            local_41 = local_24[local_27];
            local_20[local_27] = local_20[local_41];
            local_27 = local_41;
        }
    }
    TArray<int> local_32;
    local_32.SetNum(local_2);
    local_41 = 1;
    for (; local_41 <= local_2; )
    {
        local_32[(local_20[local_41] - 1)] = (local_41 - 1);
        ++local_41;
    }
    return local_32;
}
TArray<FCostMatrixRow> PadCostMatrixToSquare(const TArray<FCostMatrixRow> &inout CostMatrix)
{
    int local_2 = CostMatrix.Num();
    if (local_2 == 0)
    {
        return TArray<FCostMatrixRow>();
    }
    int local_1 = CostMatrix[0].Costs.Num();
    if (local_2 == local_1)
    {
        return CostMatrix;
    }
    int local_9 = FMath::Max(local_2, local_1);
    TArray<FCostMatrixRow> local_14;
    local_14.SetNum(local_9);
    int local_15 = 0;
    for (; local_15 < local_9; ++local_15)
    {
        local_14[local_15].Costs.SetNum(local_9);
        int local_17 = 0;
        for (; local_17 < local_9; ++local_17)
        {
            if ((local_15 < local_2 && (local_17 < local_1)))
            {
                local_14[local_15].Costs[local_17] = CostMatrix[local_15].Costs[local_17];
                continue;
            }
            local_14[local_15].Costs[local_17] = 0;
        }
    }
    return local_14;
}
TArray<int> SolveAssignmentNonSquare(const TArray<FCostMatrixRow> &inout CostMatrix)
{
    int local_29;
    int local_2 = CostMatrix.Num();
    if (local_2 == 0)
    {
        return TArray<int>();
    }
    int local_1 = CostMatrix[0].Costs.Num();
    if (local_1 == 0)
    {
        return TArray<int>();
    }
    TArray<int> local_8 = FAIGroupAssignmentUtils::SolveHungarianAssignment(FAIGroupAssignmentUtils::PadCostMatrixToSquare(CostMatrix));
    TArray<int> local_26;
    local_26.SetNum(local_2);
    int local_27 = 0;
    for (; local_27 < local_2; ++local_27)
    {
        local_29 = local_8[local_27];
        if (local_29 < local_1)
        {
            local_26[local_27] = local_29;
            continue;
        }
        int local_28 = -1;
        local_26[local_27] = local_28;
    }
    return local_26;
}
TArray<FCostMatrixRow> ComputeDistanceCostMatrix(const TArray<FECSEntity> &inout Entities, const TArray<FVector> &inout TargetPoints)
{
    int local_2 = Entities.Num();
    int local_1 = TargetPoints.Num();
    TArray<FCostMatrixRow> local_8;
    local_8.SetNum(local_2);
    int local_9 = 0;
    for (; local_9 < local_2; ++local_9)
    {
        local_8[local_9].Costs.SetNum(local_1);
        FVector local_18(FVector::ZeroVector);
        Get local_22;
        const FC_Transform& local_24 = local_22.opCall();
        if (local_24)
        {
            local_18 = local_24.GetPosition();
        }
        int local_25 = 0;
        for (; local_25 < local_1; )
        {
            local_8[local_9].Costs[local_25] = uint(float32(local_18.Distance(TargetPoints[local_25])));
            ++local_25;
        }
    }
    return local_8;
}
TArray<int> AssignEntitiesToTargets(const TArray<FECSEntity> &inout Entities, const TArray<FVector> &inout TargetPoints)
{
    if (Entities.Num() == 0 || (TargetPoints.Num() == 0))
    {
        return TArray<int>();
    }
    TArray<FCostMatrixRow> local_16 = FAIGroupAssignmentUtils::ComputeDistanceCostMatrix(Entities, TargetPoints);
    return FAIGroupAssignmentUtils::SolveAssignmentNonSquare(local_16);
}
}
