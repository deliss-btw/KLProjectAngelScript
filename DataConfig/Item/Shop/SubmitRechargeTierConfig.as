

struct FSubmitRechargeTierConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    int TierId;
    UPROPERTY()
    int CurrencyAmount;
    UPROPERTY()
    int PriceAmount;
    UPROPERTY()
    FSoftBrush Icon;


}

