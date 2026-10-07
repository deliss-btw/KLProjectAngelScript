

UCLASS(Abstract)
class AAccountExclusivePropPrefabBase : AAccountExclusivePropPrefabNativeBase
{
    UPROPERTY()
    FT_AccountExclusiveProp AccountExclusivePropTrait;
    UPROPERTY()
    FT_VisualComponentToggle VisualComponentToggle;

    default SetEntityType(EEntityType(6));

    AAccountExclusivePropPrefabBase()
    {
        this.VisualComponentToggle.Config_FC_VisualComponentToggleConfig.bForcePresentationMode = true;
        return;
    }
}

class AAccountExclusivePropPrefabLocalRegTemplate : AKLECSPrefab
{
    UPROPERTY()
    FT_ESM ESMTrait;

    default SetEntityType(EEntityType(6));

    AAccountExclusivePropPrefabLocalRegTemplate()
    {
        return;
    }
}

