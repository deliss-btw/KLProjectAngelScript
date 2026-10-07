

struct FT_EcologySpawnerTrait : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_EcologySpawnerConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_EcologySpawnerConfig, NAME_None);
    UPROPERTY()
    FC_EcologySpawnerConfig Config_FC_EcologySpawnerConfig;

    FT_EcologySpawnerTrait()
    {
        return;
    }
}

UCLASS(Abstract)
class AEcologySpawnerPrefabBase : AEcologyUnitECSPrefab
{
    UPROPERTY()
    FOnNewMonsterReady OnNewMonsterReady;
    UPROPERTY()
    FOnSpawnerReady OnSpawnerReady;
    UPROPERTY()
    FOnMonsterDeath OnMonsterDeath;

    AEcologySpawnerPrefabBase()
    {
        super();
        return;
    }
}

UCLASS(Abstract)
class AEcologySpawnerECSPrefab : AEcologySpawnerPrefabBase
{
    UPROPERTY()
    FT_EcologySpawnerTrait SpawnerConfig;

    default SetEntityType(EEntityType(10));

    AEcologySpawnerECSPrefab()
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
                local_8.EcologySpawners.Add(this);
            }
        }
        return;
    }
}

struct FT_SimpleMonsterSpawnerTrait : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_ConstMonsterSpawnerConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_ConstMonsterSpawnerConfig, NAME_None);
    UPROPERTY()
    FC_ConstMonsterSpawnerConfig Config_FC_ConstMonsterSpawnerConfig;

    FT_SimpleMonsterSpawnerTrait()
    {
        return;
    }
}

UCLASS(Abstract)
class AConstMonsterSpawnPrefab : AEcologyUnitECSPrefab
{
    UPROPERTY()
    FT_SimpleMonsterSpawnerTrait SpawnerConfig;

    AConstMonsterSpawnPrefab()
    {
        super();
        return;
    }
}

class AGenericSpawnerECSPrefab : AEcologySpawnerPrefabBase
{
    UPROPERTY()
    FVirtualConfigData Config;

    AGenericSpawnerECSPrefab()
    {
        super();
        return;
    }
}

event void FOnNewMonsterReady(const FECSEntityId &inout EntityId);

event void FOnSpawnerReady(const FECSEntityId &inout EntityId);

event void FOnMonsterDeath(const FECSEntityId &inout EntityId);

