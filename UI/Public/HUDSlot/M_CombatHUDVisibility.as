
const FConsoleVariable CVar_DebugWidgetHide = FConsoleVariable();
const FConsoleCommand CCmd_DebugHUDHide = FConsoleCommand();
const FConsoleVariable CVar_DebugHUDHideVar = FConsoleVariable();
namespace FMS_CombatHUDVisibility
{
    const int ModelId = 0;

}
struct FCombatHUDGroupRuntimeState
{
    UPROPERTY()
    TArray<ECombatHUDReason> ActiveReasons;
    UPROPERTY()
    float32 DelayTimer = 0.0f;
    UPROPERTY()
    ECombatHUDReason LastInstantReason = ECombatHUDReason(0);


}

struct FMS_CombatHUDVisibility : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TArray<FCombatHUDReasonGroupConfig> m_CachedGroups;
    UPROPERTY()
    TArray<FCombatHUDGroupRuntimeState> m_GroupStates;
    UPROPERTY()
    TMap<ECombatHUDReason, int> m_ReasonToGroupIndex;
    UPROPERTY()
    TArray<TDataObjectPtr<FWidgetHiddenConfig>> m_AppliedHideConfigs;
    UPROPERTY()
    bool m_bLastShowMouseCursor;

    FMS_CombatHUDVisibility()
    {
        this.m_bLastShowMouseCursor = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_CombatHUDVisibility(const FMS_CombatHUDVisibility &inout Other)
    {
        this.m_bLastShowMouseCursor = false;
        this.m_CachedGroups = Other.m_CachedGroups;
        this.m_GroupStates = Other.m_GroupStates;
        this.m_ReasonToGroupIndex = Other.m_ReasonToGroupIndex;
        this.m_AppliedHideConfigs = Other.m_AppliedHideConfigs;
        this.m_bLastShowMouseCursor = Other.m_bLastShowMouseCursor;
        return;
    }
    FMS_CombatHUDVisibility opAssign(const FMS_CombatHUDVisibility &inout Other)
    {
        FMS_CombatHUDVisibility __r;
        this.m_CachedGroups = Other.m_CachedGroups;
        this.m_GroupStates = Other.m_GroupStates;
        this.m_ReasonToGroupIndex = Other.m_ReasonToGroupIndex;
        this.m_AppliedHideConfigs = Other.m_AppliedHideConfigs;
        this.m_bLastShowMouseCursor = Other.m_bLastShowMouseCursor;
        return __r;
    }
    void PostConstruct()
    {
        this.GetModify_CachedGroups().Empty(0);
        TDataObjectIterator<FCombatHUDReasonGroupConfig> local_18;
        for (; local_18; )
        {
            this.GetModify_CachedGroups().Add(local_18.GetData());
            local_18.Next();
        }
        this.RebuildGroupRuntime();
        return;
    }
    void BeginDestroy()
    {
        UObject local_2 = Cast<UObject>(this.GetManager());
        if (local_2 != nullptr)
        {
            for (auto& local_20 : this.GetAppliedHideConfigs())
            {
                if ((!((local_20 == nullptr))))
                {
                    FEUIHideConfig::Release(local_2, n"CombatHUD", local_20);
                }
            }
        }
        this.GetModify_AppliedHideConfigs().Empty(0);
        this.GetModify_GroupStates().Empty(0);
        this.GetModify_ReasonToGroupIndex().Empty(0);
        this.GetModify_CachedGroups().Empty(0);
        return;
    }
    void OnECSyncCombatHUDEvent(const FCE_ECSyncCombatHUD &inout Event)
    {
        if (int(Event.CombatHUDReason) == 0)
        {
            return;
        }
        if ((!((FECSEntity(Event.Sender) == this.GetContext().GetLocalPlayerPawn()))))
        {
            if (!(Event.Sender.IsValid()) || !((::FASCommonUtils::GetUniquePlayerEntity(Event.Sender) == this.GetContext().GetLocalPlayer())))
            {
                return;
            }
        }
        this.SetReason(Event.CombatHUDReason, Event.bEnabled);
        return;
    }
    void OnCombatHUDEvent(const FCE_CombatHUD &inout Event)
    {
        if (int(Event.CombatHUDReason) == 0)
        {
            return;
        }
        if ((!((FECSEntity(Event.Sender) == this.GetContext().GetLocalPlayerPawn()))))
        {
            return;
        }
        this.SetReason(Event.CombatHUDReason, Event.bEnabled);
        return;
    }
    void OnLoadingFinished()
    {
        this.SetReason(ECombatHUDReason(5), true);
        return;
    }
    void OnPlayerChangeSkillPanel(const FC_ChangeSkillPanel &inout PlayerChangeSkillPanel)
    {
        bool local_5;
        if (!(this.GetContext().GetLocalPlayerPawn().IsValid()))
        {
            this.SetReason(ECombatHUDReason(14), false);
            return;
        }
        if (!(::FASCommonUtils::GetUniquePlayerEntity(this.GetContext().GetLocalPlayerPawn()).IsValid()))
        {
            local_5 = false;
        }
        else
        {
            Has local_20;
            local_5 = local_20.opCall();
        }
        this.SetReason(ECombatHUDReason(14), local_5);
        return;
    }
    void Tick()
    {
        float32 local_5 = float32(this.GetContext().DeltaTime.ToSeconds());
        bool local_6 = false;
        if (local_5 > 0.0f)
        {
            local_6 = this.TickDelayTimers(local_5);
        }
        this.TickCallMouseReason();
        if (local_6)
        {
            this.EvaluateAndApply();
        }
        if (CVar_DebugWidgetHide.GetBool())
        {
            UObject local_10 = Cast<UObject>(this.GetManager());
            FString local_20 = this.GetDebugString();
            if (local_10 != nullptr)
            {
                local_20 += FEUIHideConfig::GetManagerDebugString(local_10);
            }
            System::PrintString(__GetWorldContext(), local_20, true, false, FLinearColor::Yellow, 0.0f, n"WidgetHideDebug");
        }
        return;
    }
    void RebuildGroupRuntime()
    {
        this.GetModify_ReasonToGroupIndex().Empty(0);
        this.GetModify_GroupStates().Empty(0);
        this.GetModify_GroupStates().SetNum(this.GetCachedGroups().Num());
        int local_2 = 0;
        for (; local_2 < this.GetCachedGroups().Num(); ++local_2)
        {
            for (auto local_17 : this.GetCachedGroups()[local_2].Reasons)
            {
                if ((int(local_17)) != 0)
                {
                    this.GetModify_ReasonToGroupIndex().Add(local_17, local_2);
                }
            }
        }
        return;
    }
    bool IsInstantReason(const ECombatHUDReason Reason) const
    {
        switch (int(Reason))
        {
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
        case 12:
        case 16:
        case 19:
        {
            return true;
        }
        case 13:
        case 14:
        case 15:
        case 17:
        case 18:
        default:
        {
        }
        }
        return false;
    }
    bool IsGroupActive(const int GroupIndex) const
    {
        if (!(this.GetGroupStates().IsValidIndex(GroupIndex)))
        {
            return false;
        }
        return this.GetGroupStates()[GroupIndex].ActiveReasons.Num() > 0 || (this.GetGroupStates()[GroupIndex].DelayTimer > 0.0f);
    }
    void SetReason(const ECombatHUDReason Reason, const bool bEnabled)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void EvaluateAndApply()
    {
        UObject local_2 = Cast<UObject>(this.GetManager());
        if (local_2 == nullptr)
        {
            return;
        }
        TArray<TDataObjectPtr<FWidgetHiddenConfig>> local_10;
        this.CollectDesiredHideConfigs(local_10);
        for (auto local_24 : local_10)
        {
            if (!(this.GetAppliedHideConfigs().Contains(local_24)))
            {
                FEUIHideConfig::Apply(local_2, n"CombatHUD", local_24);
            }
        }
        for (auto local_24 : this.GetAppliedHideConfigs())
        {
            if (!(local_10.Contains(local_24)))
            {
                FEUIHideConfig::Release(local_2, n"CombatHUD", local_24);
            }
        }
        this.GetModify_AppliedHideConfigs().Empty(0);
        for (auto local_24 : local_10)
        {
            this.GetModify_AppliedHideConfigs().Add(local_24);
        }
        return;
    }
    void CollectDesiredHideConfigs(TArray<TDataObjectPtr<FWidgetHiddenConfig>> &inout OutConfigs) const
    {
        bool local_20;
        TArray<TDataObjectPtr<FWidgetHiddenConfig>> local_4;
        TArray<TDataObjectPtr<FWidgetHiddenConfig>> local_8;
        int local_9 = 0;
        for (; local_9 < this.GetCachedGroups().Num(); ++local_9)
        {
            const FCombatHUDReasonGroupConfig& local_14 = this.GetCachedGroups()[local_9];
            bool local_12 = this.IsGroupActive(local_9);
            bool local_15 = (int(local_14.RuleType) == 0);
            if (local_15)
            {
                local_20 = !(local_12);
            }
            else
            {
                local_20 = local_12;
            }
            if (!(local_20))
            {
                if ((local_15 && local_12))
                {
                    this.AddUniqueConfigs(local_14.GetHideConfigs(), local_8);
                }
                continue;
            }
            this.AddUniqueConfigs(local_14.GetHideConfigs(), local_4);
        }
        for (auto& local_34 : local_4)
        {
            if (!(local_8.Contains(local_34)))
            {
                OutConfigs.Add(local_34);
            }
        }
        return;
    }
    void AddUniqueConfigs(const TArray<TDataObjectPtr<FWidgetHiddenConfig>> &inout Source, TArray<TDataObjectPtr<FWidgetHiddenConfig>> &inout Dest) const
    {
        for (auto& local_16 : Source)
        {
            if (!((local_16 == nullptr)) && !(Dest.Contains(local_16)))
            {
                Dest.Add(local_16);
            }
        }
        return;
    }
    bool TickDelayTimers(const float32 Dt)
    {
        bool local_1 = false;
        int local_3 = 0;
        for (; local_3 < this.GetGroupStates().Num(); ++local_3)
        {
            if (this.GetGroupStates()[local_3].DelayTimer <= 0.0f || (this.GetGroupStates()[local_3].ActiveReasons.Num() > 0))
            {
                continue;
            }
            FCombatHUDGroupRuntimeState local_16;
            local_16.DelayTimer = FMath::Max(local_16.DelayTimer - Dt, 0.0f);
            if (local_16.DelayTimer <= 0.0f)
            {
                local_1 = true;
            }
        }
        return local_1;
    }
    void TickCallMouseReason()
    {
        if (!(this.GetReasonToGroupIndex().Contains(ECombatHUDReason(13))))
        {
            return;
        }
        UEUIActionRouter local_8 = UEUIActionRouter::Get(this.GetUELocalPlayer());
        if (local_8 == nullptr)
        {
            return;
        }
        bool local_2 = local_8.ShouldAlwaysShowCursor();
        if (!(local_2) != !(this.GetbLastShowMouseCursor()))
        {
            this.SetbLastShowMouseCursor(local_2);
            this.SetReason(ECombatHUDReason(13), local_2);
        }
        return;
    }
    FString GetDebugString() const
    {
        FString local_26;
        bool local_38;
        FString local_4 = "=== WidgetHide CombatHUD ===\n";
        local_4 += "\n-- ReasonGroups --\n";
        int local_5 = 0;
        for (; local_5 < this.GetGroupStates().Num(); ++local_5)
        {
            if (!(this.GetCachedGroups().IsValidIndex(local_5)))
            {
                continue;
            }
            const FCombatHUDReasonGroupConfig& local_10 = this.GetCachedGroups()[local_5];
            const FCombatHUDGroupRuntimeState& local_12 = this.GetGroupStates()[local_5];
            bool local_8 = this.IsGroupActive(local_5);
            FString local_22;
            if (local_8)
            {
                local_22 = "[ON]";
            }
            else
            {
                local_22 = "[OFF]";
            }
            FString local_18;
            if (int(local_10.RuleType) == 0)
            {
                local_18 = "Show";
            }
            else
            {
                local_18 = "Hide";
            }
            local_4 += FString().Append("  ").Append(local_10.GetDataName()).Append(": ").Append(local_22).Append(" Rule=").Append(local_18).Append(" Cfgs=").Append(local_10.GetHideConfigs().Num());
            if ((local_12.DelayTimer) > 0.0f)
            {
                local_4 += FString().Append(" Delay=").Append(FString::ApplyFormat(local_12.DelayTimer, ".1f")).Append("s");
                if (int(local_12.LastInstantReason) != 0)
                {
                    local_4 += FString().Append("(by ").Append(local_12.LastInstantReason).Append(")");
                }
            }
            if (local_12.ActiveReasons.Num() > 0)
            {
                local_4 += " Reasons={";
                local_38 = true;
                for (auto local_51 : local_12.ActiveReasons)
                {
                    if (!(local_38))
                    {
                        local_4 += ",";
                    }
                    local_4 += FString().Append(local_51);
                }
                local_4 += "}";
            }
            local_4 += "\n";
        }
        local_4 += FString().Append("\n-- State --\n");
        local_4 += FString().Append("  Applied=").Append(this.GetAppliedHideConfigs().Num()).Append(" CallMouse=").Append(this.GetbLastShowMouseCursor()).Append("\n");
        if (this.GetAppliedHideConfigs().Num() > 0)
        {
            local_4 += "  HiddenConfigs={";
            local_38 = true;
            for (auto& local_66 : this.GetAppliedHideConfigs())
            {
                if (!(local_38))
                {
                    local_4 += ",";
                }
                if (!((local_66 == nullptr)))
                {
                    local_26 = FString().Append(local_66.GetDataName());
                }
                else
                {
                    local_26 = "null";
                }
                local_4 += local_26;
                local_38 = false;
            }
            local_4 += "}\n";
        }
        return local_4;
    }
    const TArray<FCombatHUDReasonGroupConfig> GetCachedGroups() const property
    {
        const TArray<FCombatHUDReasonGroupConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<FCombatHUDReasonGroupConfig> GetModify_CachedGroups() property
    {
        TArray<FCombatHUDReasonGroupConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetCachedGroups(const TArray<FCombatHUDReasonGroupConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CachedGroups = __Value;
        return;
    }
    const TArray<FCombatHUDGroupRuntimeState> GetGroupStates() const property
    {
        const TArray<FCombatHUDGroupRuntimeState> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<FCombatHUDGroupRuntimeState> GetModify_GroupStates() property
    {
        TArray<FCombatHUDGroupRuntimeState> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetGroupStates(const TArray<FCombatHUDGroupRuntimeState> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_GroupStates = __Value;
        return;
    }
    const TMap<ECombatHUDReason, int> GetReasonToGroupIndex() const property
    {
        const TMap<ECombatHUDReason, int> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TMap<ECombatHUDReason, int> GetModify_ReasonToGroupIndex() property
    {
        TMap<ECombatHUDReason, int> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetReasonToGroupIndex(const TMap<ECombatHUDReason, int> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ReasonToGroupIndex = __Value;
        return;
    }
    const TArray<TDataObjectPtr<FWidgetHiddenConfig>> GetAppliedHideConfigs() const property
    {
        const TArray<TDataObjectPtr<FWidgetHiddenConfig>> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<TDataObjectPtr<FWidgetHiddenConfig>> GetModify_AppliedHideConfigs() property
    {
        TArray<TDataObjectPtr<FWidgetHiddenConfig>> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetAppliedHideConfigs(const TArray<TDataObjectPtr<FWidgetHiddenConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_AppliedHideConfigs = __Value;
        return;
    }
    bool GetbLastShowMouseCursor() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bLastShowMouseCursor;
    }
    void SetbLastShowMouseCursor(const bool __Value) property
    {
        if (!(this.m_bLastShowMouseCursor) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bLastShowMouseCursor = __Value;
        return;
    }
}

void CMD_DebugHUDHide(const TArray<FString> &inout Arguments)
{
    if (Arguments.Num() < 1)
    {
        return;
    }
    bool local_3 = (String::Conv_StringToInt(Arguments[0]) != 0);
    APlayerController local_10 = FASCommonUtils::GetLocalPlayerController();
    TDataObjectPtr<FWidgetHiddenConfig> local_34;
    TDataObjectIterator<FWidgetHiddenConfig> local_50;
    for (; local_50; )
    {
        if ((local_50.GetDataPtr().GetDataName() == n"HUD"))
        {
            local_34 = local_50.GetDataPtr();
            break;
        }
        local_50.Next();
    }
    if ((local_10 == nullptr || (local_34 == nullptr)))
    {
        return;
    }
    if (!(local_3) == !(CVar_DebugHUDHideVar.GetBool()))
    {
        return;
    }
    CVar_DebugHUDHideVar.SetBool(local_3);
    if (local_3)
    {
        FEUIHideConfig::Apply(local_10, n"AllHUD", local_34);
        return;
    }
    FEUIHideConfig::Release(local_10, n"AllHUD", local_34);
    return;
}
namespace FMS_CombatHUDVisibility
{
FMS_CombatHUDVisibility& Get(const UObject ContextObject)
{
    return FMS_CombatHUDVisibility::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_CombatHUDVisibility GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_CombatHUDVisibility __r;
    TEUIModelRef<FMS_CombatHUDVisibility> local_6 = TEUIModelRef<FMS_CombatHUDVisibility>(EUIInternal::MakeModelWithManager(Manager, FMS_CombatHUDVisibility::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelEventDefine local_10;
    local_10.FunctionName = "__OnECSyncCombatHUDEvent";
    local_10.EventType = FCE_ECSyncCombatHUD;
    Result.EventFunctions.Add(local_10);
    local_10.FunctionName = "__OnCombatHUDEvent";
    local_10.EventType = FCE_CombatHUD;
    Result.EventFunctions.Add(local_10);
    FEUIModelMonitorDefine local_22;
    local_22.FunctionName = "__OnPlayerChangeSkillPanel";
    local_22.ComponentType = FC_ChangeSkillPanel;
    Result.MonitorFunctions.Add(local_22);
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_CombatHUDVisibility;
}
void __OnECSyncCombatHUDEvent(FMS_CombatHUDVisibility &inout Model, const FCE_ECSyncCombatHUD &inout Event)
{
    Model.OnECSyncCombatHUDEvent(Event);
    return;
}
void __OnCombatHUDEvent(FMS_CombatHUDVisibility &inout Model, const FCE_CombatHUD &inout Event)
{
    Model.OnCombatHUDEvent(Event);
    return;
}
void __OnPlayerChangeSkillPanel(FMS_CombatHUDVisibility &inout Model, const FECSEntity &inout Entity, const FC_ChangeSkillPanel &inout Component)
{
    Model.OnPlayerChangeSkillPanel(Component);
    return;
}
void __Tick(FMS_CombatHUDVisibility &inout Model)
{
    Model.Tick();
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
int __IndexOf_CachedGroups()
{
    return 0;
}
int __IndexOf_GroupStates()
{
    return 1;
}
int __IndexOf_ReasonToGroupIndex()
{
    return 2;
}
int __IndexOf_AppliedHideConfigs()
{
    return 3;
}
int __IndexOf_bLastShowMouseCursor()
{
    return 4;
}
}
