

struct FCGContextConfig
{
    UPROPERTY()
    FSoftBrush Image;
    UPROPERTY()
    FText Desc;
    UPROPERTY()
    float32 FadeInDuration = 0.0f;
    UPROPERTY()
    float32 FadeOutDuration = 0.0f;
    UPROPERTY()
    float32 NextButtonShowDelay = 0.0f;


}

struct FCGConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    TArray<FCGContextConfig> Pages;

    FCGConfig()
    {
        return;
    }
}

