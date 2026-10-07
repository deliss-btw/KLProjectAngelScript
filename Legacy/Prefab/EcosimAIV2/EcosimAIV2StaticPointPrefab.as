

UCLASS(Abstract)
class AEcosimAIV2StaticPointPrefab : AKLLevelPrefabBase
{
    UPROPERTY()
    FT_EcosimAIV2StaticPoint EcosimAIV2StaticPoint;
    UPROPERTY()
    FT_GameplayTags GameplayTags;

    default SetEntityType(EEntityType(10));

    AEcosimAIV2StaticPointPrefab()
    {
        return;
    }
}

