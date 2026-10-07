

struct FAIHitTestConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FVector3f BoxSize;

    FAIHitTestConfig()
    {
        return;
    }
}

