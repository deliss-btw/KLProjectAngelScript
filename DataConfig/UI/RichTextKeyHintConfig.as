

struct FRichTextKeyHintData : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FEUIInputAction InputAction;

    FRichTextKeyHintData()
    {
        return;
    }
}

