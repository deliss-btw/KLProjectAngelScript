

struct FErrorCodeConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FString ErrorCodeCategory;
    UPROPERTY()
    FString ErrorCodeComment;
    UPROPERTY()
    FText ErrorCodeText;

    FErrorCodeConfig()
    {
        return;
    }
}

