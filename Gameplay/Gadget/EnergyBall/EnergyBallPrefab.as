

UCLASS(Abstract)
class AEnergyBallPrefab : AKLLevelPrefabBase
{
    UPROPERTY()
    FT_EnergyBallTrait EnergyBall;

    default SetEntityType(EEntityType(6));

    AEnergyBallPrefab()
    {
        return;
    }
}

