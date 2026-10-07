

struct FSimpleTriggerUnitConfig : FSceneUnitConfigWithJsonData
{
    FSceneUnitConfigWithJsonData _base_FSceneUnitConfigWithJsonData;

    FSimpleTriggerUnitConfig()
    {
        return;
    }
    void SetupByActor(const AEntityTriggerSimpleShape Actor)
    {
        this.GUID = Actor.ConfigGUID;
        this.Transform = (Actor.GetRootComponent() != nullptr ? Actor.GetRootComponent().GetWorldTransform() : FTransform());
        return;
    }
}

UCLASS(Abstract)
class AEntityTriggerSimpleShape : AECSTriggerBase
{
    UPROPERTY()
    EESMBlackboardConditionTagQueryType CheckTagCondition = EESMBlackboardConditionTagQueryType(0);
    UPROPERTY()
    FGameplayTagContainer CheckTags;


    UFUNCTION()
    bool CheckShouldOverlapEntity_Implementation(const FECSContext &inout Context, const FECSEntity &inout Entity) const
    {
        if (!(this.CheckTags.IsEmpty()))
        {
            if (int(this.CheckTagCondition) == 0)
            {
                return Entity.MatchAnyGameplayTags(this.CheckTags);
            }
            if (int(this.CheckTagCondition) == 2)
            {
                return !(Entity.MatchAnyGameplayTags(this.CheckTags));
            }
        }
        return true;
    }
}

