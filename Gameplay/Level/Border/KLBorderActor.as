

class AKLBorderActor : AKLBorder
{
    UPROPERTY()
    EBorderType BorderType = EBorderType(0);
    UPROPERTY()
    EKLBorderAcrossTeleportMode AcrossTeleportMode = EKLBorderAcrossTeleportMode(0);
    UPROPERTY()
    EBorderWarningType WarningType = EBorderWarningType(0);
    UPROPERTY()
    float32 WarningInterval = 5.0f;
    UPROPERTY()
    float32 BlockMaterialEffectDuration = 1.0f;
    UPROPERTY()
    FDataObjectPtr SoundVO;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> MessageHint;
    UPROPERTY()
    FFXConfig WarningFX;
    UPROPERTY()
    bool bInstantFX = false;
    UPROPERTY()
    bool bDisplayOnMiniMap = false;
    UPROPERTY()
    TSoftObjectPtr<UTexture2D> BorderMaskTexture;
    UPROPERTY()
    TArray<FSingleMaterialParamRequestData> FadingInMaterial;
    UPROPERTY()
    TArray<FSingleMaterialParamRequestData> FadingOutMaterial;


    FMinimapBorderInfo GetBorderMinimapInfo() const
    {
        FMinimapBorderInfo local_14;
        local_14.BorderType = this.BorderType;
        local_14.BorderMask = (Cast<UTexture2D>(this.BorderMaskTexture.ToSoftObjectPath().TryLoad()));
        FVector local_78 = this.Spline.GetWorldTransform().TransformPosition(FVector(this.Spline.RegionBox.Min.X, this.Spline.RegionBox.Min.Y, 0.0));
        FVector local_66 = this.Spline.GetWorldTransform().TransformPosition(FVector(this.Spline.RegionBox.Max.X, this.Spline.RegionBox.Max.Y, 0.0));
        FBox2D local_94;
        local_94.Min = FVector2D(local_78.X, local_78.Y);
        local_94.Max = FVector2D(local_66.X, local_66.Y);
        local_94.bIsValid = true;
        local_14.BorderWorldPosition = local_94;
        return local_14;
    }
}

