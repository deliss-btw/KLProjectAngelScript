

struct FHitDecalConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    int DecalTextureID = 0;
    UPROPERTY()
    FVector Size = FVector(50.0, 50.0, 25.0);
    UPROPERTY()
    float32 Duration = 3.0f;
    UPROPERTY()
    float32 InitOpacity = 1.0f;
    UPROPERTY()
    bool bFadeOutByTime = true;
    UPROPERTY()
    float32 FadeStartTime = 2.0f;
    UPROPERTY()
    float32 Emissive = 0.0f;


}

