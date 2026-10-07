

class UStringValidatorConfig : UDataAsset
{
    UPROPERTY()
    TArray<UStringValidatorBase> Validators;

    UStringValidatorConfig()
    {
        return;
    }
}

