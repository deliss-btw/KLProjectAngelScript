

struct FAttributePresentationConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FText DisplayName;
    UPROPERTY()
    FText Description;
    UPROPERTY()
    FSoftBrush Icon;
    UPROPERTY()
    FLinearColor ThemeColor = FLinearColor(1.0f, 1.0f, 1.0f, 1.0f);

    FAttributePresentationConfig()
    {
        return;
    }
}

