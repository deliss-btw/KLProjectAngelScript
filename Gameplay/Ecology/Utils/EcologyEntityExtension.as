
void SetEcologyBlob(const FECSEntity &inout Entity, const FName &inout Key, const FInstancedStruct &inout Value)
{
    0.SetBlob(FEcologyKnowledgeKey(Key), Value);
    return;
}
const FInstancedStruct GetEcologyBlob(const FECSEntity &inout Entity, const FName &inout Key)
{
    int local_6 = 0;
    const FInstancedStruct __r;
    local_6.GetBlob(FEcologyKnowledgeKey(Key));
    return __r;
}
void InitEcologyGameplayTagComponent(const FECSEntity &inout Entity, const TArray<FGameplayTag> &inout Tags)
{
    0.AddAll(Tags);
    return;
}
bool HasEcologyGameplayTag(const FECSEntity &inout Entity, const FGameplayTag &inout Tag)
{
    return 0.Match(Tag);
}
void AddEcologyGameplayTag(const FECSEntity &inout Entity, const FGameplayTag &inout Tag)
{
    0.Add(Tag);
    return;
}
void AddEcologyGameplayTags(const FECSEntity &inout Entity, const TArray<FGameplayTag> &inout Tags)
{
    0.AddAll(Tags);
    return;
}
bool MatchEcologyTags(const FECSEntity &inout Entity, const FGameplayTagQuery &inout Query)
{
    Get local_4;
    const FC_EcologyGameplayTags& local_6 = local_4.opCall();
    if (local_6)
    {
        return local_6.Query(Query);
    }
    return Query.IsEmpty();
}
