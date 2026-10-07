

struct FItemRarityConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    EItemRarity Rarity;
    UPROPERTY()
    FText RarityName;
    UPROPERTY()
    FLinearColor DefaultColor;
    UPROPERTY()
    FSoftBrush RarityImage;
    UPROPERTY()
    FSoftBrush RectangleRarityImage;
    UPROPERTY()
    FSoftBrush TipRarityImage;
    UPROPERTY()
    FSoftBrush PopupBGRarityImage;
    UPROPERTY()
    FText ItemNamePrefix;


}

