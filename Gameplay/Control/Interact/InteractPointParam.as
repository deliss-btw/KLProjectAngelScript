
enum EInteractSelectType
{
    CloseInteractLow,
    CloseInteract,
    FarInteract,
    CloseInteractHigh,
}

namespace FInteractCompareUtils
{
    const FInteractTipParam DummyInteractTipParam = FInteractTipParam();

}
struct FInteractPointParam
{
    UPROPERTY()
    EInteractSelectType SelectType = EInteractSelectType(1);
    UPROPERTY()
    float32 DistanceMax = -1.0f;
    UPROPERTY()
    float32 DistanceMin = -1.0f;
    UPROPERTY()
    float32 AngleToSource = -1.0f;
    UPROPERTY()
    float32 FaceYawAngle = -1.0f;
    UPROPERTY()
    float32 AngleToViewDir = -1.0f;
    UPROPERTY()
    float32 ViewOffsetRangeRatioX = -1.0f;
    UPROPERTY()
    float32 ViewOffsetRangeRatioY = -1.0f;


    bool opEquals(const FInteractPointParam &inout Other) const
    {
        return (int(this.SelectType) == int(Other.SelectType) && (this.DistanceMax == Other.DistanceMax) && (this.DistanceMin == Other.DistanceMin) && (this.AngleToSource == Other.AngleToSource) && (this.FaceYawAngle == Other.FaceYawAngle) && (this.AngleToViewDir == Other.AngleToViewDir) && (this.ViewOffsetRangeRatioX == Other.ViewOffsetRangeRatioX) && (this.ViewOffsetRangeRatioY == Other.ViewOffsetRangeRatioY));
    }
}

namespace FInteractCompareUtils
{
bool UseViewOffsetRatio(const EInteractSelectType InteractSelectType)
{
    return (int(InteractSelectType) == 2);
}
int GetPriority(const EInteractSelectType InteractSelectType)
{
    switch (int(InteractSelectType))
    {
    case 0:
    {
        return -1;
    }
    case 1:
    case 2:
    {
        return 0;
    }
    case 3:
    {
        return 1;
    }
    default:
    {
    }
    }
    return -1;
}
const FInteractPointParam& GetInteractPointParam(const FInteractionPoint &inout InteractionPoint, const UInteractionBehaviorBase BehaviorConfig)
{
    bool local_1 = BehaviorConfig.bOverrideInteractPointParam;
    if (local_1)
    {
    }
    else
    {
    }
    return local_1;
}
}
