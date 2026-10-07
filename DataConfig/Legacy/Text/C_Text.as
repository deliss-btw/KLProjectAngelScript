
enum ETextArgType_DEPRECATED
{
    Default,
    Attribute,
}


struct FAttributeTextData : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FGameAttributeRef Attribute;
    UPROPERTY()
    FText Text;

    FAttributeTextData()
    {
        return;
    }
}

struct FKLTextData : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FText Text;

    FKLTextData()
    {
        return;
    }
}

