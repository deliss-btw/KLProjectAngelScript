

struct FIndicatorConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FPresentationDisplayRule DisplayRule;
    UPROPERTY()
    FPresentationIcon Icon;
    UPROPERTY()
    FPresentationDisplayRule DistanceTextDisplayRule;
    UPROPERTY()
    FLinearColor ArrowColor;

    FIndicatorConfig()
    {
        return;
    }
}

