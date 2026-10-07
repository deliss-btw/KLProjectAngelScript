

UCLASS(Abstract)
class AMarkPrefab : AKLLevelPrefabBase
{
    UPROPERTY()
    FT_Mark MarkTrait;

    default SetEntityType(EEntityType(8));

    AMarkPrefab()
    {
        return;
    }
}

