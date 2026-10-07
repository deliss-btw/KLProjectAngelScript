
enum EHUDSideHintType
{
    Default,
    Important,
}

enum ECombinedTextType
{
    Text,
    EntityName,
    ShowCustomContent,
}

enum EHUDHintType
{
    CombatHint,
    SideHint,
}

enum ECombineTextEntitySelector
{
    ShowEntity,
    CustomEntity_1,
    CustomEntity_2,
}


struct FCombinedText
{
    UPROPERTY()
    ECombinedTextType CombinedTextType = ECombinedTextType(0);
    UPROPERTY()
    FText Text;
    UPROPERTY()
    ECombineTextEntitySelector CombineTextEntitySelector = ECombineTextEntitySelector(0);


}

struct FSideHintConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    EHUDSideHintType HUDSideHintType = EHUDSideHintType(0);
    UPROPERTY()
    UTexture2D Icon = nullptr;
    UPROPERTY()
    FText Title;
    UPROPERTY()
    TArray<FCombinedText> CombineText;
    UPROPERTY()
    float32 ShowHintTime = 3.0f;


}

