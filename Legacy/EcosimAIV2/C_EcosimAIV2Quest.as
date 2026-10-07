

struct FEcsoimAIV2QuestData
{
    UPROPERTY()
    TSoftObjectPtr<UHTN> QuestHTNAsset;
    UPROPERTY()
    TSoftObjectPtr<UBlackboardData> QuestBlackboardAsset;

    FEcsoimAIV2QuestData()
    {
        return;
    }
}

