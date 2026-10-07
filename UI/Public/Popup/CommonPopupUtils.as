
namespace CommonPopupUtils
{
    const int CommonPopupPriorityUnset = -2000000000;

bool EnsureECSWorldReady(const FString &inout ApiName, const bool bWarnIfInvalid = true)
{
    if (ECS::GetECSWorld().IsValid())
    {
        return true;
    }
    if (bWarnIfInvalid)
    {
        XWarning(ELog(16), FString().Append("[CommonPopup] ").Append(ApiName).Append(" skipped: ECSWorld is invalid"));
    }
    return false;
}
int TryEnqueuePopup(const FGameplayTag &inout PopupType, const int Priority = CommonPopupPriorityUnset)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    int __r; return __r;
}
FString FormatQueueTypeList(const TArray<ECommonPopupQueueType> &inout QueueTypes)
{
    FString local_4;
    UEnum local_6 = UEnum::GetEnumType(n"ECommonPopupQueueType");
    int local_11 = 0;
    for (; local_11 < QueueTypes.Num(); )
    {
        if (local_11 > 0)
        {
            local_4 += ",";
        }
        local_4 += local_6.GetNameStringByValue(int(QueueTypes[local_11]));
        ++local_11;
    }
    return local_4;
}
FString FormatQueueState()
{
    int local_10 = 0;
    if (!(CommonPopupUtils::EnsureECSWorldReady("FormatQueueState", false)))
    {
        return "PopupManager: ECSWorld invalid";
    }
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    local_10.EnsureInitialized();
    TArray<ECommonPopupQueueType> local_14;
    local_10.QueuedPopups.GetKeys(local_14);
    UEnum local_16 = UEnum::GetEnumType(n"ECommonPopupQueueType");
    int local_17 = local_14.Num();
    FString local_28 = ((FString("PopupManager: ") + local_17) + " queues");
    for (auto local_45 : local_14)
    {
        FCommonPopupQueueRuleList& local_48 = local_10.QueuedPopups[local_45];
        FString local_24 = ((FString("\n  Queue[") + local_16.GetNameStringByValue(int(local_45))) + "]: displaying=");
        local_28 += local_24;
        if (local_48.DisplayingPopup.IsValid())
        {
            FString local_32_2 = ((((FString("(Id=") + local_48.DisplayingPopup.PopupId)) + ",Type=") + local_48.DisplayingPopup.PopupType.ToString());
            local_24 = ((local_32_2 + ",Priority=") + local_48.DisplayingPopup.Priority);
            local_32_2 = (local_24 + ")");
            local_28 += local_32_2;
        }
        else
        {
            local_28 += "none";
        }
        int local_17_2 = local_48.QueuedPopups.Num();
        local_24 = (FString(", waiting=") + local_17_2);
        local_28 += local_24;
        int local_55 = 0;
        for (; local_55 < local_48.QueuedPopups.Num(); )
        {
            FCommonPopupInfo& local_58 = local_48.QueuedPopups[local_55];
            FString local_32_3 = (((((((((FString(" (Id=")) + local_58.PopupId)) + ",Type=") + local_58.PopupType.ToString())) + ",Priority=") + local_58.Priority) + ")");
            local_28 += local_32_3;
            ++local_55;
        }
    }
    return local_28;
}
void CheckStuckDisplayingPopups(FCS_CommonPopupManager &inout Manager, const float32 StuckSeconds = 60.0f)
{
    int local_47;
    Manager.EnsureInitialized();
    FFPTime local_4 = ECS::GetContextTime();
    TArray<ECommonPopupQueueType> local_8;
    Manager.QueuedPopups.GetKeys(local_8);
    TSet<int> local_28;
    for (auto local_42 : local_8)
    {
        FCommonPopupQueueRuleList& local_46 = Manager.QueuedPopups[local_42];
        if (!(local_46.DisplayingPopup.IsValid()))
        {
            continue;
        }
        local_47 = local_46.DisplayingPopup.PopupId;
        if (local_28.Contains(local_47))
        {
            continue;
        }
        local_28.Add(local_47);
        if (!(Manager.DisplayingStartTime.Contains(local_47)))
        {
            Manager.DisplayingStartTime.Add(local_47, local_4);
            continue;
        }
        float local_53 = float32(((local_4 - Manager.DisplayingStartTime[local_47]).ToSeconds()));
        if (local_53 < StuckSeconds)
        {
            continue;
        }
        if (Manager.StuckWarnedPopupIds.Contains(local_47))
        {
            continue;
        }
        Manager.StuckWarnedPopupIds.Add(local_47);
        XWarning(ELog(22), FString().Append("[CommonPopup] Queue stuck >").Append(StuckSeconds).Append("s: Displaying PopupId=").Append(local_47).Append(" Type=").Append(local_46.DisplayingPopup.PopupType.ToString()).Append(" Priority=").Append(local_46.DisplayingPopup.Priority).Append(" Elapsed=").Append(local_53).Append("s"));
        XWarning(ELog(22), CommonPopupUtils::FormatQueueState());
    }
    return;
}
void DequeuePopupInternal(const int PopupId)
{
    if (!(CommonPopupUtils::EnsureECSWorldReady("DequeuePopupInternal", false)))
    {
        return;
    }
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    Modify local_8;
    FCS_CommonPopupManager& local_10 = local_8.opCall();
    if (local_10)
    {
        local_10.EnsureInitialized();
        TArray<ECommonPopupQueueType> local_14;
        CommonPopupDisplayingUtils_Internal::RemovePopupFromAllQueues(local_10, PopupId, local_14);
        for (auto local_27 : local_14)
        {
            CommonPopupDisplayingUtils_Internal::TryPromoteQueue(local_10, ECommonPopupQueueType(local_27));
        }
    }
    return;
}
bool HasMatchingPopupType(const TSet<FGameplayTag> &inout AffectedTypes, const FGameplayTag &inout ParentTag)
{
    for (auto& local_20 : AffectedTypes)
    {
        if (local_20.MatchesTag(ParentTag))
        {
            return true;
        }
    }
    return false;
}
ECommonPopupOccupyRule GetOccupyRule(const FGameplayTag &inout PreviousPopupType, const FGameplayTag &inout InPopupType)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    ECommonPopupOccupyRule __r; return __r;
}
int ResolveEffectivePriority(const FGameplayTag &inout PopupType, const int Priority)
{
    if (Priority != -2000000000)
    {
        return Priority;
    }
    UCommonPopupSettings local_6 = CommonPopupSettings::Get();
    FCommonPopupOccupyRuleConfig local_30;
    if (local_6.OccupyRules.Find(PopupType, local_30))
    {
        return int(local_30.DefaultPriority);
    }
    return 0;
}
}
namespace CommonPopupDisplayingUtils_Internal
{
void SaveManagerRecord(const bool bDisplayingPopupChanged, const ECommonPopupQueueType QueueType, const TArray<FCommonPopupInfo> &inout RemovedPopups)
{
    int local_10 = 0;
    if (!(bDisplayingPopupChanged) && RemovedPopups.IsEmpty())
    {
        return;
    }
    if (!(CommonPopupUtils::EnsureECSWorldReady("SaveManagerRecord", false)))
    {
        return;
    }
    FECSWorldPtr local_4 = ECS::GetECSWorld();
    if (bDisplayingPopupChanged)
    {
        local_10.DisplayingChangedQueues.Add(QueueType);
    }
    if (!(RemovedPopups.IsEmpty()))
    {
        if (local_10.RemovedPopups.Contains(QueueType))
        {
            local_10.RemovedPopups[QueueType].QueuedPopups.Append(RemovedPopups);
            return;
        }
        FCommonPopupQueueRuleList local_22;
        local_22.QueuedPopups = RemovedPopups;
    }
    return;
}
void RemovePopupFromAllQueues(FCS_CommonPopupManager &inout Manager, const int PopupId, TArray<ECommonPopupQueueType> &inout OutAffectedQueues)
{
    bool local_6;
    FCommonPopupInfo local_4;
    bool local_5 = false;
    bool local_7 = false;
    TArray<ECommonPopupQueueType> local_12;
    Manager.QueuedPopups.GetKeys(local_12);
    for (auto local_25 : local_12)
    {
        FCommonPopupQueueRuleList& local_28 = Manager.QueuedPopups[local_25];
        if (local_28.DisplayingPopup.IsValid() && (local_28.DisplayingPopup.PopupId == PopupId))
        {
            if (!(local_5))
            {
                local_5 = true;
                local_7 = true;
            }
            OutAffectedQueues.AddUnique(local_25);
            continue;
        }
        int local_35 = 0;
        for (; local_35 < local_28.QueuedPopups.Num(); ++local_35)
        {
            if ((local_28.QueuedPopups[local_35].PopupId) == PopupId)
            {
                if (!(local_5))
                {
                    local_5 = true;
                }
                local_6 = (local_35 == 0);
                local_28.QueuedPopups.RemoveAt(local_35);
                if (local_6)
                {
                    if (local_28.QueuedPopups.IsEmpty())
                    {
                    }
                    else
                    {
                        if (Manager.CollectStartTime.Contains(local_25))
                        {
                            ECS::GetContextTime();
                        }
                    }
                    OutAffectedQueues.AddUnique(local_25);
                }
                break;
            }
        }
    }
    if (local_5)
    {
        FString local_48;
        if (local_7)
        {
            local_48 = "true";
        }
        else
        {
            local_48 = "false";
        }
        XLog(ELog(22), FString().Append("[CommonPopup] Dequeue PopupId=").Append(PopupId).Append(" Type=").Append(local_4.PopupType.ToString()).Append(" Priority=").Append(local_4.Priority).Append(" WasDisplaying=").Append(local_48));
    }
    return;
}
bool CanPromoteWaitingFront(FCS_CommonPopupManager &inout Manager, const int PopupId)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
    bool __r; return __r;
}
void TryPromoteQueue(FCS_CommonPopupManager &inout Manager, const ECommonPopupQueueType QueueType)
{
    if (!(Manager.QueuedPopups.Contains(QueueType)))
    {
        return;
    }
    FCommonPopupQueueRuleList& local_4 = Manager.QueuedPopups[QueueType];
    if (local_4.DisplayingPopup.IsValid() || local_4.QueuedPopups.IsEmpty())
    {
        return;
    }
    int local_6 = local_4.QueuedPopups[0].PopupId;
    if (!(CommonPopupDisplayingUtils_Internal::CanPromoteWaitingFront(Manager, local_6)))
    {
        return;
    }
    FCommonPopupInfo local_12;
    bool local_13 = false;
    TArray<ECommonPopupQueueType> local_18;
    Manager.QueuedPopups.GetKeys(local_18);
    for (auto local_31 : local_18)
    {
        FCommonPopupQueueRuleList& local_34 = Manager.QueuedPopups[local_31];
        int local_35 = 0;
        for (; local_35 < local_34.QueuedPopups.Num(); ++local_35)
        {
            if ((local_34.QueuedPopups[local_35].PopupId) == local_6)
            {
                if (!(local_13))
                {
                    local_13 = true;
                }
                local_34.QueuedPopups.RemoveAt(local_35);
                CommonPopupDisplayingUtils_Internal::SaveManagerRecord(true, ECommonPopupQueueType(local_31), TArray<FCommonPopupInfo>());
                break;
            }
        }
    }
    if (local_13)
    {
        Manager.DisplayingStartTime.Add(local_6, ECS::GetContextTime());
        XLog(ELog(22), FString().Append("[CommonPopup] Promote PopupId=").Append(local_6).Append(" Type=").Append(local_12.PopupType.ToString()).Append(" Priority=").Append(local_12.Priority));
    }
    return;
}
}
