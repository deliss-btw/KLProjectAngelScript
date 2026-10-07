

struct FInteractTipPreset : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    FSoftBrush InteractTipHUDIcon;
    UPROPERTY()
    FVector2D InteractTipHUDIconUIOffset;
    UPROPERTY()
    FInteractTipParam InteractTipParam;

    FInteractTipPreset()
    {
        return;
    }
}

