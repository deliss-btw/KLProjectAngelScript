

struct FDivineLiteraryTypeConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FText LiteraryName;
    UPROPERTY()
    FSoftBrush LiteraryImage;
    UPROPERTY()
    FSoftBrush LiteraryStrengtheningImage;
    UPROPERTY()
    FSoftBrush LiteraryWeakenImage;
    UPROPERTY()
    FText Description;

    FDivineLiteraryTypeConfig()
    {
        return;
    }
}

