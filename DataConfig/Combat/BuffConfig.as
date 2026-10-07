
enum EBuffGoodOrBad
{
    Good,
    Bad,
    Neutral,
}


struct FBuffPresentationConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FSoftBrush IconBrush;
    UPROPERTY()
    FText BuffName;
    UPROPERTY()
    EBuffGoodOrBad BuffGoodOrBad = EBuffGoodOrBad(2);
    UPROPERTY()
    bool bLargeSideHint;
    UPROPERTY()
    bool bSmallSideHint = true;
    UPROPERTY()
    bool bTipsHint;
    UPROPERTY()
    bool bNeedHover = true;
    UPROPERTY()
    bool bNeedIcon = true;
    UPROPERTY()
    FText HintDescAdditional;
    UPROPERTY()
    FSoftBrush HintDescAdditionalIcon;
    UPROPERTY()
    FArgText DefaultAttributeDesc;
    UPROPERTY()
    FArgText ShortAttributeDesc;
    UPROPERTY()
    FArgText DefaultLargeHintTile;
    UPROPERTY()
    FArgText DefaultSmallHintTile;
    UPROPERTY()
    float32 HintLifeTimeOverride;


}

