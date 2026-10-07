

struct FFixedCameraConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FVector OffsetPosition;
    UPROPERTY()
    FRotator Rotation;
    UPROPERTY()
    bool bAbsoluteRotation;
    UPROPERTY()
    float32 FOV = 75.0f;
    UPROPERTY()
    FCameraBlendConfig BlendConfig;


}

