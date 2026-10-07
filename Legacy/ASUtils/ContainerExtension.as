
void AppendSet(TArray<FECSEntity> &inout This, const TSet<FECSEntity> &inout Other)
{
    for (auto& local_20 : Other)
    {
        This.Add(local_20);
    }
    return;
}
void AppendSet(TArray<FECSEntityId> &inout This, const TSet<FECSEntityId> &inout Other)
{
    for (auto& local_20 : Other)
    {
        This.Add(local_20);
    }
    return;
}
void AppendSet(TArray<FTargetEntity> &inout This, const TSet<FTargetEntity> &inout Other)
{
    for (auto& local_20 : Other)
    {
        This.Add(local_20);
    }
    return;
}
