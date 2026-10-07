

struct FT_EcologyResourceConfigTrait : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_EcologyResourceConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_EcologyResourceConfig, NAME_None);
    UPROPERTY()
    FC_EcologyResourceConfig Config_FC_EcologyResourceConfig;

    FT_EcologyResourceConfigTrait()
    {
        return;
    }
}

UCLASS(Abstract)
class AEcologyResourcePrefab : AEcologyUnitECSPrefab
{
    UPROPERTY()
    FT_EcologyResourceConfigTrait ConfigData;

    AEcologyResourcePrefab()
    {
        super();
        return;
    }
    UFUNCTION()
    void BeginPlay_Implementation()
    {
        AAS_ECSWorldSettings local_8;
        if ((int(this.GetWorld().GetNetMode())) != 3)
        {
            local_8 = (Cast<AAS_ECSWorldSettings>(this.GetWorld().GetWorldSettings()));
            if (local_8 != nullptr)
            {
                local_8.EcologyResources.Add(this);
            }
        }
        return;
    }
    UFUNCTION()
    void EndPlay_Implementation(const EEndPlayReason EndPlayReason)
    {
        AAS_ECSWorldSettings local_8;
        if ((int(this.GetWorld().GetNetMode())) != 3)
        {
            local_8 = (Cast<AAS_ECSWorldSettings>(this.GetWorld().GetWorldSettings()));
            if (local_8 != nullptr)
            {
            }
        }
        return;
    }
}

