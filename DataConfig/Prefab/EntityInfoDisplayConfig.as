

struct FEntityInfoDisplayCondition
{
    UPROPERTY()
    float32 MaxShowDistance = 0.0f;
    UPROPERTY()
    float32 MinShowDistance = 0.0f;


}

struct FEntityInfoDisplayConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FEntityInfoDisplayCondition Default;
    UPROPERTY()
    TMap<EFactionRelation, FEntityInfoDisplayCondition> OverrideByRelation;

    FEntityInfoDisplayConfig()
    {
        return;
    }
}

