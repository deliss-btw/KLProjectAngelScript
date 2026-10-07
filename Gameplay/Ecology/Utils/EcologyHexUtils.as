
namespace FEcologyHexUtils
{
void IndexToRingOffsetDetailed(const int Index, int &inout OutRing, int &inout OutOffset)
{
    if (Index <= 0)
    {
        OutRing = 0;
        OutOffset = 0;
        return;
    }
    OutRing = 1;
    int local_3 = 1;
    while ((local_3 + (OutRing * 6)) <= Index)
    {
        local_3 = local_3 + (OutRing * 6);
        ++OutRing;
    }
    OutOffset = (Index - local_3);
    return;
}
FHexCoord GetCoordinateInRingSimplified(const int Ring, const int InOffset)
{
    int local_10 = 0;
    int local_11 = 0;
    int local_12 = 0;
    if (Ring <= 0)
    {
        return FHexCoord();
    }
    int local_1 = Ring * 6;
    int local_7 = InOffset % local_1;
    if (local_7 < 0)
    {
        local_7 = local_7 + local_1;
    }
    int local_6 = FMath::IntegerDivisionTrunc(local_7, Ring);
    int local_8 = local_7 % Ring;
    switch (local_6)
    {
    case 0:
    {
        local_10 = local_8;
        local_11 = Ring - local_8;
        int local_9 = -Ring;
        local_12 = local_9;
        break;
    }
    case 1:
    {
        local_10 = Ring;
        int local_9_2 = -local_8;
        local_11 = local_9_2;
        local_9_2 = Ring;
        local_9_2 = -local_9_2;
        local_12 = local_9_2 + local_8;
        break;
    }
    case 2:
    {
        local_10 = Ring - local_8;
        int local_9_3 = -Ring;
        local_11 = local_9_3;
        local_12 = local_8;
        break;
    }
    case 3:
    {
        int local_9_4 = -local_8;
        local_10 = local_9_4;
        local_9_4 = Ring;
        local_9_4 = -local_9_4;
        local_11 = local_9_4 + local_8;
        local_12 = Ring;
        break;
    }
    case 4:
    {
        int local_9_5 = -Ring;
        local_10 = local_9_5;
        local_11 = local_8;
        local_12 = Ring - local_8;
        break;
    }
    case 5:
    {
        int local_9_6 = -Ring;
        local_10 = local_9_6 + local_8;
        local_11 = Ring;
        local_9_6 = local_8;
        local_9_6 = -local_9_6;
        local_12 = local_9_6;
        break;
    }
    default:
    {
        local_10 = 0;
        local_11 = Ring;
        local_12 = -Ring;
    }
    }
    return FHexCoord(local_10, local_11, local_12);
}
FHexCoord GetHexCoordAtIndex(const int Index)
{
    int local_1 = 0;
    int local_3 = 0;
    FEcologyHexUtils::IndexToRingOffsetDetailed(Index, local_1, local_3);
    return FEcologyHexUtils::GetCoordinateInRingSimplified(local_1, local_3);
}
}
