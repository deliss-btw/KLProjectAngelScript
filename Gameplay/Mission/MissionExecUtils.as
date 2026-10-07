
namespace MissionExecUtils
{
EMissionActionType GetActionType(const FInstancedStruct &inout ActionData)
{
    int local_10 = 0;
    if (FInstancedStruct::GetPtr(ActionData).opCall())
    {
        return EMissionActionType(local_10);
    }
    return EMissionActionType(0);
}
FMissionExecutionEntry CreateExecutionEntry(const int InEntryId)
{
    return FMissionExecutionEntry::Create(InEntryId);
}
FMissionExecutionEntry CreateExecutionEntry()
{
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    FCS_MissionExecutionManager local_8;
    int local_9 = int(local_8.NextEntryId);
    ++local_8.NextEntryId;
    return FMissionExecutionEntry::Create(local_9);
}
FMissionExecutionEntry CreateExecutionEntry(const FInstancedStruct &inout ActionData)
{
    FMissionExecutionEntry local_6 = MissionExecUtils::CreateExecutionEntry();
    local_6.AddAction(ActionData);
    return local_6;
}
FMissionExecutionEntry CreateExecutionEntry(const TArray<FInstancedStruct> &inout ActionDatas)
{
    FMissionExecutionEntry local_6 = MissionExecUtils::CreateExecutionEntry();
    for (auto& local_28 : ActionDatas)
    {
        local_6.AddAction(local_28);
    }
    return local_6;
}
bool RequestStartExecution(const FECSEntity &inout Entity, FMissionExecutionEntry &inout ExecutionEntry, const EMissionActionType ActionType)
{
    int local_12 = 0;
    int local_18 = 0;
    if ((int(ActionType) == 2 && (int(ExecutionEntry.EntryId) <= 0)))
    {
        XError(ELog(63), "ExecutionEntry is invalid");
        return false;
    }
    if (int(ActionType) == 1)
    {
        local_12.ExecutionEntries.Add(ExecutionEntry);
    }
    else
    {
        if (int(ActionType) == 2)
        {
            if (local_18.ExecutionEntries.Contains(ExecutionEntry.EntryId))
            {
                XError(ELog(63), "ExecutionEntry already exists");
                return false;
            }
            local_18.ExecutionEntries.Add(ExecutionEntry.EntryId, ExecutionEntry);
        }
        else
        {
            XError(ELog(63), FString().Append("Invalid action type: ").Append(ActionType));
            return false;
        }
    }
    return true;
}
}
