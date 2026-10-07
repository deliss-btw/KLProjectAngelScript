

struct FScriptControlESMSkillConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    TSoftObjectPtr<UBehaviorTree> BehaviorTreeAsset;

    FScriptControlESMSkillConfig()
    {
        return;
    }
}

