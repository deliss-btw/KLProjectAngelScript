

UCLASS(Abstract)
class ADestructiblePrefab : AKLLevelPrefabBase
{
    UPROPERTY()
    FT_Destructible Destructible;
    UPROPERTY()
    FT_Hittable Hittable;
    UPROPERTY()
    FT_Collision Collision;

    default SetEntityType(EEntityType(6));

    ADestructiblePrefab()
    {
        return;
    }
    UFUNCTION()
    float32 GetCollisionHalfHeight_Implementation() const
    {
        if (this.Collision.bTraitEnable)
        {
            return this.Collision.Config_FC_Collision.GetScaledHalfHeight();
        }
        return 0.0f;
    }
}

