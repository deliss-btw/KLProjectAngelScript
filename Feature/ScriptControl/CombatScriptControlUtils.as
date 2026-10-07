
namespace CombatScriptControlUtils
{
int PushCombatScriptControlAction(const FECSEntityId &inout EntityId, const EScriptControlSourceType SourceType, const EScriptControlBehaviorName BehaviorName, const FScriptControlBehaviorParams &inout Params, const bool bInsertFront = false, const bool bAutoAddHostility = true)
{
    FECSEntity local_4;
    if (!(ScriptControlSharedUtils::CheckAndResolveEntityId(EntityId, local_4)))
    {
        return -1;
    }
    bool local_5 = true;
    ModifyOrAdd local_10;
    local_10.opCall().bEnabled = local_5;
    ScriptControlSharedUtils::SetScriptControlStateIfNeeded(local_4, true);
    if ((bAutoAddHostility && !((Params.TargetEntityId == ENTITY_ID_NULL))))
    {
        FECSEntity local_20 = FECSEntity(Params.TargetEntityId);
        if (local_20.IsValid())
        {
            FAITargetingUtils::AddHostilityByDamage(local_4, FTargetEntity(local_20), 100.0f, 1.0f, 15.0f);
        }
    }
    ScriptControlSharedUtils::PreloadBehaviorAssets(EScriptControlBehaviorName(BehaviorName), Params);
    FC_CombatScriptControl local_32;
    FScriptControlQueueSlot& local_34 = local_32.FindOrCreateSlot(EScriptControlSourceType(SourceType));
    int local_6 = local_34.PushAction(EScriptControlBehaviorName(BehaviorName), Params, local_32.NextEntryId, bInsertFront);
    CombatScriptControlUtils::RefreshCombatPreferBehavior(local_32);
    UBlackboardComponent local_40 = FAIKnowledgeUtils::GetAIBlackboardComponent(local_4);
    if (local_40 != nullptr)
    {
        local_40.SetValueAsBool(n"SCtrlNeedInterrupt", true);
    }
    return local_6;
}
void FinishCurrentCombatBehavior(const FECSEntity &inout Entity, const EScriptControlResult Result)
{
    FC_CombatScriptControl local_6;
    FC_CombatScriptControl local_76;
    if ((!(local_6) || (int(local_6.CurrentBehavior) == 0)))
    {
        return;
    }
    if (!(local_6.HasActiveSlot()))
    {
        return;
    }
    FScriptControlBehaviorEntry local_66;
    if (!(local_6.Slots[int(local_6.ActiveSlotIndex)].bHasCurrentAction))
    {
        return;
    }
    int local_9 = int(local_6.ActiveSlotIndex);
    EScriptControlSourceType local_67 = local_6.ActiveSourceType;
    ScriptControlSharedUtils::SendBehaviorFinishedEvent(Entity, local_66, EScriptControlBehaviorType(1), EScriptControlResult(Result), EScriptControlSourceType(local_67));
    if (!(local_76.HasActiveSlot()))
    {
        return;
    }
    bool local_11 = local_76.Slots[int(local_76.ActiveSlotIndex)].DiscardCurrentAction();
    local_76.CurrentBehavior = EScriptControlCurrentBehavior(0);
    local_76.CurrentEntryId = 0;
    local_76.RefreshBBBehaviorNames();
    CombatScriptControlUtils::RefreshCombatPreferBehavior(local_76);
    if (local_11 && !(CombatScriptControlUtils::HasAnyPendingAction(local_76)))
    {
        SendEvent local_84;
        local_84.opCall(FFPTime(-1));
        Remove local_90;
        local_90.opCall();
        ScriptControlSharedUtils::SetScriptControlStateIfNeeded(Entity, false);
    }
    return;
}
void RefreshCombatPreferBehavior(FC_CombatScriptControl &inout LC)
{
    if (!(LC.bEnabled) || (LC.Num() == 0))
    {
        LC.PreferBehavior = EScriptControlPreferBehavior(0);
        LC.PreferEntryId = 0;
        LC.ActiveSlotIndex = -1;
        return;
    }
    int local_6 = -1;
    int local_7 = 0;
    for (; local_7 < LC.Num(); ++local_7)
    {
        FScriptControlQueueSlot& local_10 = LC[local_7];
        if (!(local_10.bHasCurrentAction) && (local_10.ActionQueue.Num() > 0))
        {
            local_10.DequeueAction();
        }
        if (local_10.HasPendingAction())
        {
            local_6 = local_7;
            break;
        }
    }
    if (local_6 < 0)
    {
        LC.PreferBehavior = EScriptControlPreferBehavior(0);
        LC.PreferEntryId = 0;
        LC.ActiveSlotIndex = -1;
        LC.RefreshBBBehaviorNames();
        return;
    }
    LC.ActiveSlotIndex = local_6;
    LC.ActiveSourceType = LC[local_6].SourceType;
    FScriptControlQueueSlot& local_10_2 = LC[local_6];
    LC.PreferBehavior = EScriptControlPreferBehavior(2);
    LC.PreferEntryId = local_10_2.CurrentAction.EntryId;
    LC.RefreshBBBehaviorNames();
    return;
}
void StopAndClearCombatActionQueue(const FECSEntityId &inout EntityId, const EScriptControlSourceType SourceType)
{
    FECSEntity local_4;
    if (!(ScriptControlSharedUtils::CheckAndResolveEntityId(EntityId, local_4)))
    {
        return;
    }
    Modify local_10;
    FC_CombatScriptControl& local_12 = local_10.opCall();
    if (local_12)
    {
        int local_14 = local_12.FindSlotIndex(EScriptControlSourceType(SourceType));
        if (local_14 < 0)
        {
            return;
        }
        if ((local_14 == int(local_12.ActiveSlotIndex) && (int(local_12.CurrentBehavior) == 2)))
        {
            FScriptControlBehaviorEntry local_72;
            bool local_17 = local_12.Slots[local_14].bHasCurrentAction;
            if (local_17)
            {
                ScriptControlSharedUtils::SendBehaviorFinishedEvent(local_4, local_72, EScriptControlBehaviorType(1), EScriptControlResult(2), EScriptControlSourceType(SourceType));
            }
            local_12.CurrentBehavior = EScriptControlCurrentBehavior(0);
            local_12.CurrentEntryId = 0;
        }
        local_12.Slots[local_14].ClearActionQueue();
        local_12.RemoveSlot(EScriptControlSourceType(SourceType));
        if (local_12.Slots.Num() == 0)
        {
            Remove local_78;
            local_78.opCall();
            ScriptControlSharedUtils::SetScriptControlStateIfNeeded(local_4, false);
        }
        else
        {
            CombatScriptControlUtils::RefreshCombatPreferBehavior(local_12);
        }
    }
    return;
}
bool HasAnyPendingAction(const FC_CombatScriptControl &inout LC)
{
    int local_1 = 0;
    for (; local_1 < LC.Num(); ++local_1)
    {
        if (LC[local_1].HasPendingAction())
        {
            return true;
        }
    }
    return false;
}
}
