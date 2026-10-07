
namespace AutoTest::BTTaskUtils
{
void SetBTTaskFinishMark(const bool bFinish)
{
    ThrowIf(!(ECS::GetECSWorld().IsValid()), "ECSWorld is null.");
    FCS_AutoTestJobPool local_12;
    bool local_5 = !(local_12);
    ThrowIf(local_5, "FCS_AutoTestJobPool is null.");
    local_12.bBTTaskFinishMark = bFinish;
    XLog(ELog(50), FString().Append("SetBTTaskFinishMark: ").Append(bFinish));
    return;
}
bool GetBTTaskFinishMark()
{
    FCS_AutoTestJobPool local_12;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    ThrowIf(!(local_2.IsValid()), "ECSWorld is null.");
    if (!(local_12))
    {
        return false;
    }
    return local_12.bBTTaskFinishMark;
}
void SetBTTaskShouldStart(const bool bStart)
{
    ThrowIf(!(ECS::GetECSWorld().IsValid()), "ECSWorld is null.");
    FCS_AutoTestJobPool local_12;
    bool local_5 = !(local_12);
    ThrowIf(local_5, "FCS_AutoTestJobPool is null.");
    local_12.bBTTaskShouldStart = bStart;
    return;
}
bool GetBTTaskShouldStart()
{
    FCS_AutoTestJobPool local_12;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    ThrowIf(!(local_2.IsValid()), "ECSWorld is null.");
    if (!(local_12))
    {
        return false;
    }
    return local_12.bBTTaskShouldStart;
}
}
