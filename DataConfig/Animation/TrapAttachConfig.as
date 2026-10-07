

struct FTrapAttachOffsetRow : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FName RootBoneName = n"Root";
    UPROPERTY()
    FName PelvisBoneName = n"pelvis";
    UPROPERTY()
    FVector TopMOffset;
    UPROPERTY()
    FVector BaseOffset;
    UPROPERTY()
    float32 OuterRadius = 100.0f;
    UPROPERTY()
    float32 OuterHeight = 0.0f;
    UPROPERTY()
    float32 AngleOffset = 0.0f;
    UPROPERTY()
    FVector FrontLOffset;
    UPROPERTY()
    FVector FrontMOffset;
    UPROPERTY()
    FVector FrontROffset;
    UPROPERTY()
    FVector BackLOffset;
    UPROPERTY()
    FVector BackMOffset;
    UPROPERTY()
    FVector BackROffset;
    UPROPERTY()
    float32 UpperLayerBlendRatio = 0.65f;
    UPROPERTY()
    float32 HalfLayerRadiusScale = 1.0f;


}

