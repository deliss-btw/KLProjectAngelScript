

struct FGameplayTagBitContainer
{
    UPROPERTY()
    FGameplayTagContainer Container;

    FGameplayTagBitContainer()
    {
        return;
    }
    bool MatchesQuery(const FKLGameplayTagQuery &inout Query)
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
        bool __r; return __r;
    }
    void Append(const FGameplayTagContainer &inout Other)
    {
        this.AppendTags(Other);
        return;
    }
}

struct FEcologySpawnerRatioCacheKey
{
    UPROPERTY()
    TDataObjectPtr<FCreatureDefinitionRow> Creature;
    UPROPERTY()
    TDataObjectPtr<FEcologyResourceDefinitionRow> Resource;
    UPROPERTY()
    FName WeatherName;
    UPROPERTY()
    int TimeSegments;

    FEcologySpawnerRatioCacheKey()
    {
        return;
    }
    FEcologySpawnerRatioCacheKey(const TDataObjectPtr<FCreatureDefinitionRow> &inout InCreature, const TDataObjectPtr<FEcologyResourceDefinitionRow> &inout InResource, const FName &inout InWeatherName, const int InTimeSegments)
    {
        this.Resource = InResource;
        this.WeatherName = InWeatherName;
        this.TimeSegments = InTimeSegments;
        return;
    }
    uint Hash() const
    {
        int local_4 = this.GetUniqueID() & 4294967295;
        int local_2 = local_4;
        int local_1 = HashCombine(0, local_2);
        int local_7 = 32;
        int local_2_2 = (this.GetUniqueID() >> local_7 & 4294967295);
        local_1 = HashCombine(local_1, local_2_2);
        local_1 = HashCombine(local_1, (this.Resource.GetUniqueID() & 4294967295));
        int local_2_3 = 32;
        int local_7_3 = (this.Resource.GetUniqueID() >> local_2_3 & 4294967295);
        local_1 = HashCombine(local_1, local_7_3);
        local_1 = HashCombine(local_1, this.WeatherName.GetHash());
        local_1 = HashCombine(local_1, this.TimeSegments);
        return local_1;
    }
}

struct FEcologyDataCache
{
    UPROPERTY()
    TMap<int, FGameplayTagContainer> TimeGameplayTags;
    UPROPERTY()
    TMap<FEcologySpawnerRatioCacheKey, FDataObjectPtr> EcologySpawnerRatioCache;
    UPROPERTY()
    TMap<FName, FGameplayTagBitContainer> DOTTagConatinerCache;

    FEcologyDataCache()
    {
        return;
    }
}

