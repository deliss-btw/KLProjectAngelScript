
namespace ScriptControlUtils
{
bool CheckAndResolveEntityId(const FECSEntityId &inout EntityId, FECSEntity &out OutEntity)
{
    FECSEntity local_4;
    OutEntity = local_4;
    return ScriptControlSharedUtils::CheckAndResolveEntityId(EntityId, OutEntity);
}
void EnableScriptControl(const FECSEntityId &inout EntityId, const EScriptControlSourceType SourceType)
{
    FECSEntity local_4;
    if (!(ScriptControlUtils::CheckAndResolveEntityId(EntityId, local_4)))
    {
        return;
    }
    FC_ScriptControl local_12;
    local_12.FindOrCreateSlot(EScriptControlSourceType(SourceType));
    local_12.bEnabled = true;
    ScriptControlSharedUtils::SetScriptControlStateIfNeeded(local_4, true);
    return;
}
void DisableScriptControl(const FECSEntityId &inout EntityId, const EScriptControlSourceType SourceType)
{
    FECSEntity local_4;
    if (!(ScriptControlUtils::CheckAndResolveEntityId(EntityId, local_4)))
    {
        return;
    }
    Modify local_10;
    FC_ScriptControl& local_12 = local_10.opCall();
    if (local_12)
    {
        int local_14 = local_12.FindSlotIndex(EScriptControlSourceType(SourceType));
        if ((local_14 >= 0 && (local_14 == int(local_12.ActiveSlotIndex)) && (int(local_12.CurrentBehavior) != 0)))
        {
            FScriptControlBehaviorEntry local_72;
            if (ScriptControlUtils::GetCurrentEntry(local_12, local_72))
            {
                ScriptControlUtils::SendBehaviorFinishedEvent(local_4, local_72, ScriptControlUtils::GetCurrentBehaviorType(local_12), EScriptControlResult(2));
            }
            local_12.CurrentBehavior = EScriptControlCurrentBehavior(0);
            local_12.CurrentEntryId = 0;
        }
        local_12.RemoveSlot(EScriptControlSourceType(SourceType));
        if (local_12.Slots.Num() == 0)
        {
            local_12.DisableAndClearAll();
            ScriptControlSharedUtils::SetScriptControlStateIfNeeded(local_4, false);
        }
        else
        {
            ScriptControlUtils::RefreshPreferBehavior(local_12);
        }
    }
    return;
}
void DisableAndClearAll(const FECSEntityId &inout EntityId, const EScriptControlSourceType SourceType)
{
    FECSEntity local_4;
    if (!(ScriptControlUtils::CheckAndResolveEntityId(EntityId, local_4)))
    {
        return;
    }
    Modify local_10;
    FC_ScriptControl& local_12 = local_10.opCall();
    if (local_12)
    {
        int local_14 = local_12.FindSlotIndex(EScriptControlSourceType(SourceType));
        if (local_14 >= 0)
        {
            FScriptControlQueueSlot& local_16 = local_12.Slots[local_14];
            if ((local_14 == int(local_12.ActiveSlotIndex) && (int(local_12.CurrentBehavior) != 0)))
            {
                FScriptControlBehaviorEntry local_74;
                if (ScriptControlUtils::GetCurrentEntry(local_12, local_74))
                {
                    ScriptControlUtils::SendBehaviorFinishedEvent(local_4, local_74, ScriptControlUtils::GetCurrentBehaviorType(local_12), EScriptControlResult(2));
                }
                local_12.CurrentBehavior = EScriptControlCurrentBehavior(0);
                local_12.CurrentEntryId = 0;
            }
            local_16.ClearAll();
        }
        local_12.RemoveSlot(EScriptControlSourceType(SourceType));
        if (local_12.Slots.Num() == 0)
        {
            local_12.DisableAndClearAll();
            ScriptControlSharedUtils::SetScriptControlStateIfNeeded(local_4, false);
        }
        else
        {
            ScriptControlUtils::RefreshPreferBehavior(local_12);
        }
    }
    return;
}
int PushScriptControlState(const FECSEntityId &inout EntityId, const EScriptControlSourceType SourceType, const EScriptControlBehaviorName BehaviorName, const FScriptControlBehaviorParams &inout Params)
{
    FC_ScriptControl local_12;
    FECSEntity local_4;
    if (!(ScriptControlUtils::CheckAndResolveEntityId(EntityId, local_4)))
    {
        return -1;
    }
    if ((!(local_12) || !(local_12.bEnabled)))
    {
        return -1;
    }
    ScriptControlSharedUtils::PreloadBehaviorAssets(EScriptControlBehaviorName(BehaviorName), Params);
    FScriptControlQueueSlot& local_16 = local_12.FindOrCreateSlot(EScriptControlSourceType(SourceType));
    int local_6 = local_16.PushState(EScriptControlBehaviorName(BehaviorName), Params, local_12.NextEntryId);
    local_12.RefreshBBBehaviorNames();
    ScriptControlUtils::RefreshPreferBehavior(local_12);
    return local_6;
}
int PushScriptControlAction(const FECSEntityId &inout EntityId, const EScriptControlSourceType SourceType, const EScriptControlBehaviorName BehaviorName, const FScriptControlBehaviorParams &inout Params, const bool bInsertFront = false)
{
    FC_ScriptControl local_12;
    FECSEntity local_4;
    if (!(ScriptControlUtils::CheckAndResolveEntityId(EntityId, local_4)))
    {
        return -1;
    }
    if ((!(local_12) || !(local_12.bEnabled)))
    {
        return -1;
    }
    ScriptControlSharedUtils::PreloadBehaviorAssets(EScriptControlBehaviorName(BehaviorName), Params);
    FScriptControlQueueSlot& local_16 = local_12.FindOrCreateSlot(EScriptControlSourceType(SourceType));
    int local_6 = local_16.PushAction(EScriptControlBehaviorName(BehaviorName), Params, local_12.NextEntryId, bInsertFront);
    ScriptControlUtils::RefreshPreferBehavior(local_12);
    return local_6;
}
void StopAndClearScriptControlStateQueue(const FECSEntityId &inout EntityId, const EScriptControlSourceType SourceType)
{
    FECSEntity local_4;
    if (!(ScriptControlUtils::CheckAndResolveEntityId(EntityId, local_4)))
    {
        return;
    }
    Modify local_10;
    FC_ScriptControl& local_12 = local_10.opCall();
    if (local_12)
    {
        int local_14 = local_12.FindSlotIndex(EScriptControlSourceType(SourceType));
        if (local_14 < 0)
        {
            return;
        }
        if ((local_14 == int(local_12.ActiveSlotIndex) && (int(local_12.CurrentBehavior) == 1)))
        {
            FScriptControlBehaviorEntry local_72;
            if (ScriptControlUtils::GetCurrentEntry(local_12, local_72))
            {
                ScriptControlUtils::SendBehaviorFinishedEvent(local_4, local_72, EScriptControlBehaviorType(0), EScriptControlResult(2), EScriptControlSourceType(SourceType));
            }
            local_12.CurrentBehavior = EScriptControlCurrentBehavior(0);
            local_12.CurrentEntryId = 0;
        }
        local_12.Slots[local_14].ClearStateQueue();
        local_12.RefreshBBBehaviorNames();
        ScriptControlUtils::RefreshPreferBehavior(local_12);
    }
    return;
}
void StopAndClearScriptControlActionQueue(const FECSEntityId &inout EntityId, const EScriptControlSourceType SourceType)
{
    FECSEntity local_4;
    if (!(ScriptControlUtils::CheckAndResolveEntityId(EntityId, local_4)))
    {
        return;
    }
    Modify local_10;
    FC_ScriptControl& local_12 = local_10.opCall();
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
            if (ScriptControlUtils::GetCurrentEntry(local_12, local_72))
            {
                ScriptControlUtils::SendBehaviorFinishedEvent(local_4, local_72, EScriptControlBehaviorType(1), EScriptControlResult(2), EScriptControlSourceType(SourceType));
            }
            local_12.CurrentBehavior = EScriptControlCurrentBehavior(0);
            local_12.CurrentEntryId = 0;
        }
        local_12.Slots[local_14].ClearActionQueue();
        ScriptControlUtils::RefreshPreferBehavior(local_12);
    }
    return;
}
void RestartScriptControlStateQueue(const FECSEntityId &inout EntityId, const EScriptControlSourceType SourceType)
{
    FECSEntity local_4;
    if (!(ScriptControlUtils::CheckAndResolveEntityId(EntityId, local_4)))
    {
        return;
    }
    Modify local_10;
    FC_ScriptControl& local_12 = local_10.opCall();
    if (local_12)
    {
        int local_14 = local_12.FindSlotIndex(EScriptControlSourceType(SourceType));
        if (local_14 < 0)
        {
            return;
        }
        local_12.Slots[local_14].RestartStateQueue();
        local_12.RefreshBBBehaviorNames();
        ScriptControlUtils::RefreshPreferBehavior(local_12);
    }
    return;
}
void FinishCurrentScriptControlState(const FECSEntityId &inout EntityId, const EScriptControlSourceType SourceType)
{
    FC_ScriptControl local_12;
    FECSEntity local_4;
    if (!(ScriptControlUtils::CheckAndResolveEntityId(EntityId, local_4)))
    {
        return;
    }
    if (!(local_12) || !(local_12.HasActiveSlot()))
    {
        return;
    }
    if (int(local_12.ActiveSourceType) != int(SourceType))
    {
        return;
    }
    FScriptControlQueueSlot& local_18 = local_12.Slots[int(local_12.ActiveSlotIndex)];
    FScriptControlBehaviorEntry local_72;
    if (local_18.GetCurrentState(local_72))
    {
        ScriptControlUtils::SendBehaviorFinishedEvent(local_4, local_72, EScriptControlBehaviorType(0), EScriptControlResult(3), EScriptControlSourceType(SourceType));
    }
    local_18.AdvanceStateIndex();
    local_12.RefreshBBBehaviorNames();
    ScriptControlUtils::RefreshPreferBehavior(local_12);
    return;
}
EScriptControlSourceType GetActiveSourceType(const FECSEntityId &inout EntityId)
{
    FC_ScriptControl local_12;
    FECSEntity local_4;
    if (!(ScriptControlUtils::CheckAndResolveEntityId(EntityId, local_4)))
    {
        return EScriptControlSourceType(0);
    }
    if (!(local_12) || !(local_12.HasActiveSlot()))
    {
        return EScriptControlSourceType(0);
    }
    return local_12.ActiveSourceType;
}
bool IsScriptControlledBy(const FECSEntityId &inout EntityId, const EScriptControlSourceType SourceType)
{
    FC_ScriptControl local_12;
    FECSEntity local_4;
    if (!(ScriptControlUtils::CheckAndResolveEntityId(EntityId, local_4)))
    {
        return false;
    }
    return local_12 && local_12.HasActiveSlot() && (int(local_12.ActiveSourceType) == int(SourceType));
}
bool CalcIfNeedInterruptBehavior(const EScriptControlPreferBehavior Prefer, const EScriptControlCurrentBehavior Current)
{
    return ScriptControlSharedUtils::CalcIfNeedInterruptBehavior(EScriptControlPreferBehavior(Prefer), EScriptControlCurrentBehavior(Current));
}
bool GetCurrentEntry(const FC_ScriptControl &inout LC, FScriptControlBehaviorEntry &inout OutEntry)
{
    if (!(LC.HasActiveSlot()))
    {
        return false;
    }
    const FScriptControlQueueSlot& local_4 = LC[int(LC.ActiveSlotIndex)];
    if (int(LC.CurrentBehavior) == 1)
    {
        return local_4.GetCurrentState(OutEntry);
    }
    if (int(LC.CurrentBehavior) == 2)
    {
        if (!(local_4.bHasCurrentAction))
        {
            return false;
        }
        return true;
    }
    return false;
}
EScriptControlBehaviorName GetCurrentBehaviorName(const FC_ScriptControl &inout LC)
{
    if (int(LC.CurrentBehavior) == 1)
    {
        return LC.CurrentScriptControlStateBehavior;
    }
    if (int(LC.CurrentBehavior) == 2)
    {
        return LC.CurrentScriptControlActionBehavior;
    }
    return EScriptControlBehaviorName(0);
}
EScriptControlBehaviorType GetCurrentBehaviorType(const FC_ScriptControl &inout LC)
{
    if (int(LC.CurrentBehavior) == 1)
    {
        return EScriptControlBehaviorType(0);
    }
    if (int(LC.CurrentBehavior) == 2)
    {
        return EScriptControlBehaviorType(1);
    }
    return EScriptControlBehaviorType(0);
}
void SendBehaviorFinishedEvent(const FECSEntity &inout Entity, const FScriptControlBehaviorEntry &inout Entry, const EScriptControlBehaviorType BehaviorType, const EScriptControlResult Result, const EScriptControlSourceType SourceType)
{
    ScriptControlSharedUtils::SendBehaviorFinishedEvent(Entity, Entry, EScriptControlBehaviorType(BehaviorType), EScriptControlResult(Result), EScriptControlSourceType(SourceType));
    return;
}
void FinishCurrentBehavior(const FECSEntity &inout Entity, const EScriptControlResult Result)
{
    FC_ScriptControl local_6;
    FC_ScriptControl local_76;
    int local_88 = 0;
    if ((!(local_6) || (int(local_6.CurrentBehavior) == 0)))
    {
        return;
    }
    if (!(local_6.HasActiveSlot()))
    {
        return;
    }
    FScriptControlBehaviorEntry local_66;
    bool local_7_2 = !(ScriptControlUtils::GetCurrentEntry(local_6, local_66));
    if (local_7_2)
    {
        return;
    }
    EScriptControlBehaviorType local_68 = ScriptControlUtils::GetCurrentBehaviorType(local_6);
    EScriptControlSourceType local_69 = local_6.ActiveSourceType;
    ScriptControlUtils::SendBehaviorFinishedEvent(Entity, local_66, EScriptControlBehaviorType(local_68), EScriptControlResult(Result), EScriptControlSourceType(local_69));
    if (!(local_76.HasActiveSlot()))
    {
        return;
    }
    FScriptControlQueueSlot& local_78 = local_76.Slots[int(local_76.ActiveSlotIndex)];
    if ((int(local_68)) == 0)
    {
        bool local_7_3 = local_78.AdvanceStateIndex();
        if (local_7_3)
        {
            FFPTime local_86 = FFPTime(-1);
            local_88.LastTag = local_66.Params.Tag;
        }
    }
    else
    {
        bool local_79 = local_78.DiscardCurrentAction();
        if (local_79)
        {
            FFPTime local_86_2 = FFPTime(-1);
            SendEvent local_92;
            local_92.opCall(local_86_2);
        }
    }
    local_76.CurrentBehavior = EScriptControlCurrentBehavior(0);
    local_76.CurrentEntryId = 0;
    local_76.RefreshBBBehaviorNames();
    ScriptControlUtils::RefreshPreferBehavior(local_76);
    return;
}
void RefreshPreferBehavior(FC_ScriptControl &inout LC)
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
        if (local_10.HasPendingBehavior())
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
    if (local_10_2.HasPendingAction())
    {
        LC.PreferBehavior = EScriptControlPreferBehavior(2);
        LC.PreferEntryId = local_10_2.CurrentAction.EntryId;
    }
    else
    {
        if (local_10_2.HasPendingState())
        {
            LC.PreferBehavior = EScriptControlPreferBehavior(1);
            LC.PreferEntryId = local_10_2.StateQueue[int(local_10_2.CurrentStateIndex)].EntryId;
        }
    }
    LC.RefreshBBBehaviorNames();
    return;
}
}
