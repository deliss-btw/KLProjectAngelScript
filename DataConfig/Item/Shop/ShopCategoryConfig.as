

struct FShopCategoryConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FSoftBrush DisplayIcon;
    UPROPERTY()
    FText DisplayName;
    UPROPERTY()
    int DisplayPriority;


}

