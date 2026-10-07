

struct FInteractTipParam
{
    UPROPERTY()
    float32 DistanceMax = -1.0f;
    UPROPERTY()
    float32 DistanceMin = -1.0f;
    UPROPERTY()
    float32 AngleToSource = -1.0f;
    UPROPERTY()
    float32 FaceYawAngle = -1.0f;


}

struct FInteractTipTargetInfo
{
    UPROPERTY()
    FECSEntityId EntityId;
    UPROPERTY()
    int InteractPointIndex;
    UPROPERTY()
    int BehaviorIndex;


}

struct FInteractTipTargetHUDRenderInfo
{
    UPROPERTY()
    FSoftBrush HUDIcon;
    UPROPERTY()
    FVector HUDIconDisplayLocation;
    UPROPERTY()
    FVector2D HUDIconDisplayUIOffset;

    FInteractTipTargetHUDRenderInfo()
    {
        return;
    }
}

