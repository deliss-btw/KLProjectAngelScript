

struct FNavigationBarIconConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FPresentationDisplayRule DisplayRule;
    UPROPERTY()
    FPresentationIcon Icon;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> CustomIconWidget;
    UPROPERTY()
    bool bResident = false;


}

