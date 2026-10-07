
namespace ScriptControlSharedUtils
{
bool CheckAndResolveEntityId(const FECSEntityId &inout EntityId, FECSEntity &out OutEntity)
{
    FECSEntity local_4;
    OutEntity = local_4;
    OutEntity = FECSEntity(EntityId);
    if (!(OutEntity.IsValid()))
    {
        XError(ELog(30), FString().Append("[ScriptControl] CheckAndResolveEntityId failed: EntityId=").Append(EntityId.GetIdValue()).Append(" is not a valid entity"));
        return false;
    }
    return true;
}
void SendBehaviorFinishedEvent(const FECSEntity &inout Entity, const FScriptControlBehaviorEntry &inout Entry, const EScriptControlBehaviorType BehaviorType, const EScriptControlResult Result, const EScriptControlSourceType SourceType)
{
    FFPTime local_6 = FFPTime(-1);
    FCE_ScriptControlBehaviorFinished local_10;
    local_10.EntityId = Entity.GetId();
    local_10.BehaviorName = Entry.BehaviorName;
    local_10.BehaviorType = BehaviorType;
    local_10.Result = Result;
    local_10.Tag = Entry.Params.Tag;
    local_10.EntryId = int(Entry.EntryId);
    local_10.SourceType = SourceType;
    return;
}
bool CalcIfNeedInterruptBehavior(const EScriptControlPreferBehavior Prefer, const EScriptControlCurrentBehavior Current)
{
    if (int(Prefer) == 0 && (int(Current) == 0))
    {
        return false;
    }
    if (int(Prefer) == 1 && (int(Current) == 1))
    {
        return false;
    }
    if (int(Prefer) == 2 && (int(Current) == 2))
    {
        return false;
    }
    if (int(Prefer) == 1 && (int(Current) == 2))
    {
        return false;
    }
    return true;
}
bool IsAnyScriptControlActive(const FECSEntity &inout Entity)
{
    Has local_4;
    bool local_5 = local_4.opCall();
    if (!(local_5))
    {
        local_5 = false;
    }
    else
    {
        Get local_10;
        local_5 = local_10.opCall().bEnabled;
    }
    if (local_5)
    {
        return true;
    }
    Has local_16;
    bool local_5_2 = local_16.opCall();
    if (!(local_5_2))
    {
        local_5_2 = false;
    }
    else
    {
        Get local_20;
        local_5_2 = local_20.opCall().bEnabled;
    }
    if (local_5_2)
    {
        return true;
    }
    return false;
}
void PreloadBehaviorAssets(const EScriptControlBehaviorName BehaviorName, const FScriptControlBehaviorParams &inout Params)
{
    if (int(BehaviorName) != 2)
    {
        return;
    }
    if (!(Params.ESMSkillConfig.IsSet()))
    {
        return;
    }
    return;
}
void SetScriptControlStateIfNeeded(const FECSEntity &inout Entity, const bool bEnable)
{
    if (bEnable)
    {
        FAIKnowledgeUtils::SetScriptControlState(Entity, true);
        return;
    }
    if (!(ScriptControlSharedUtils::IsAnyScriptControlActive(Entity)))
    {
        FAIKnowledgeUtils::SetScriptControlState(Entity, false);
    }
    return;
}
}
