

struct FRichTextImageData : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FSoftBrush Image;

    FRichTextImageData()
    {
        return;
    }
}

