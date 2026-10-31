namespace __INTENRAL_FCS_GameModeTimer_NS
{
    const TECSComponentDerivedPtr<FCS_GameModeTimer> DerivedPtr = TECSComponentDerivedPtr<FCS_GameModeTimer>();
    const FCS_GameModeTimer DefaultValue = FCS_GameModeTimer();
}
namespace __INTENRAL_FCS_GameModeFastTickTag_NS
{
    const TECSComponentDerivedPtr<FCS_GameModeFastTickTag> DerivedPtr = TECSComponentDerivedPtr<FCS_GameModeFastTickTag>();
    const FCS_GameModeFastTickTag DefaultValue = FCS_GameModeFastTickTag();

}
struct FGameModeTimerEntrySetup
{
    UPROPERTY()
    float32 DelaySeconds = 0.0f;
    UPROPERTY()
    float32 IntervalSeconds = 0.0f;
    UPROPERTY()
    int RepeatCount = -1;
    UPROPERTY()
    FInstancedStruct Action;

}

struct FGameModeTimerEntry
{
    UPROPERTY()
    FFPTime TriggerTime;
    UPROPERTY()
    float32 IntervalSeconds = 0.0f;
    UPROPERTY()
    int RemainingCount = 0;
    UPROPERTY()
    FInstancedStruct Action;

}

struct FCS_GameModeTimer : FECSSingleton
{
    UPROPERTY()
    FFPTime NextTriggerTime = FFPTime(-1);
    UPROPERTY()
    TMap<int, FGameModeTimerEntry> TimerEntries;
    UPROPERTY()
    int NextHandleId = 1;
    UPROPERTY()
    FFPTime LastCheckedMatchStartTime = FFPTime(-1);
    UPROPERTY()
    FFPTime LastCheckedMatchEndTime = FFPTime(-1);

    int AllocateHandle()
    {
        ++this.NextHandleId;
        return this.NextHandleId;
    }
    void RefreshNextTriggerTime()
    {
        FFPTime local_4 = FFPTime(-1);
        for (auto& local_26 : this.TimerEntries)
        {
            if (local_4.opCmp(FFPTime(0)) < 0 || (FFPTime(local_26.GetValue().TriggerTime).opCmp(local_4) < 0))
            {
                local_4 = local_26.GetValue().TriggerTime;
            }
        }
        this.NextTriggerTime = local_4;
        return;
    }
}

struct FGMTimerAction_DebugLog : FGameModeTimerActionBase
{
    FGameModeTimerActionBase _base_FGameModeTimerActionBase;
    UPROPERTY()
    FString Message;

    default m_ScriptOverrideMeta = Cast<UASStruct>(FGMTimerAction_DebugLog.Get());

    FGMTimerAction_DebugLog()
    {
        this.Message = "GameModeTimer triggered!";
        this.__InitDefaults();
        return;
    }
    void Execute_Implementation() const
    {
        XLog(ELog(33), FString().Append("[GameModeTimer] ").Append(this.Message));
        return;
    }
}

struct FGMTimerAction_MessageHint : FGameModeTimerActionBase
{
    FGameModeTimerActionBase _base_FGameModeTimerActionBase;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> MessageHintConfig;

    default m_ScriptOverrideMeta = Cast<UASStruct>(FGMTimerAction_MessageHint.Get());

    FGMTimerAction_MessageHint()
    {
        this.__InitDefaults();
        return;
    }
    void Execute_Implementation() const
    {
        if (!(this.MessageHintConfig.IsSet()))
        {
            return;
        }
        FECSRuntimeView local_42 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_46;
        local_46.opCall();
        FECSRuntimeViewIterator local_80 = local_42.Iterator();
        for (; local_80.CanProceed;)
        {
            ::BlueprintFunctions_Level::Level_SendMessageHint(FECSEntityAdapter(local_80.Proceed()), this.MessageHintConfig, TArray<FTextArgument>());
        }
        return;
    }
}

struct FGMTimerAction_OverrideReviveRule : FGameModeTimerActionBase
{
    FGameModeTimerActionBase _base_FGameModeTimerActionBase;
    UPROPERTY()
    TDataObjectPtr<FReviveData> ReviveRule;

    default m_ScriptOverrideMeta = Cast<UASStruct>(FGMTimerAction_OverrideReviveRule.Get());

    FGMTimerAction_OverrideReviveRule()
    {
        this.__InitDefaults();
        return;
    }
    void Execute_Implementation() const
    {
        ::BlueprintFunctions_Common::OverrideLevelReviveRule(this.ReviveRule);
        XLog(ELog(33), FString().Append("[GameModeTimer] Override ReviveRule: ").Append(this.ReviveRule.IsSet()));
        return;
    }
}

struct FGMTimerAction_CustomLevelEvent : FGameModeTimerActionBase
{
    FGameModeTimerActionBase _base_FGameModeTimerActionBase;
    UPROPERTY()
    FName CustomName;
    UPROPERTY()
    bool bIsTutorialEvent;

    default m_ScriptOverrideMeta = Cast<UASStruct>(FGMTimerAction_CustomLevelEvent.Get());

    FGMTimerAction_CustomLevelEvent()
    {
        this.bIsTutorialEvent = false;
        this.__InitDefaults();
        return;
    }
    void Execute_Implementation() const
    {
        FFPTime local_8 = FFPTime(-1);
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        FCE_CustomLevelEvent local_12;
        local_12.CustomName = this.CustomName;
        local_12.bIsTutorialEvent = this.bIsTutorialEvent;
        XLog(ELog(33), FString().Append("[GameModeTimer] SendCustomLevelEvent: ").Append(this.CustomName));
        return;
    }
}

struct FGMTimerAction_Composite : FGameModeTimerActionBase
{
    FGameModeTimerActionBase _base_FGameModeTimerActionBase;
    UPROPERTY()
    TArray<FInstancedStruct> Actions;

    default m_ScriptOverrideMeta = Cast<UASStruct>(FGMTimerAction_Composite.Get());

    FGMTimerAction_Composite()
    {
        this.__InitDefaults();
        return;
    }
    void Execute_Implementation() const
    {
        for (auto& local_16 : this.Actions)
        {
            TConstRawPtr<FGameModeTimerActionBase> local_22 = FInstancedStruct::GetPtr(local_16).opCall();
            if ((!((local_22 == nullptr))))
            {
                local_22.Get().Execute();
            }
        }
        return;
    }
}

struct FGMTimerAction_Callback : FGameModeTimerActionBase
{
    FGameModeTimerActionBase _base_FGameModeTimerActionBase;
    UPROPERTY()
    FStructClosure Closure;

    default m_ScriptOverrideMeta = Cast<UASStruct>(FGMTimerAction_Callback.Get());

    FGMTimerAction_Callback()
    {
        this.__InitDefaults();
        return;
    }
    void Execute_Implementation() const
    {
        FStructClosure(this.Closure).Execute();
        return;
    }
}

struct FCS_GameModeFastTickTag : FECSSingleton
{
    FCS_GameModeFastTickTag()
    {
        return;
    }
}

namespace ECSFunc_FCS_GameModeTimer
{
UFUNCTION()
bool HasGameModeTimer(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_GameModeTimer);
}
FCS_GameModeTimer& AssignGameModeTimer(const FECSWorldPtr &inout World, const FCS_GameModeTimer &inout DefaultValue = FCS_GameModeTimer())
{
    UScriptStruct local_6 = FCS_GameModeTimer;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignGameModeTimer_BP(const FECSWorldPtr &inout World, const FCS_GameModeTimer &inout DefaultValue = FCS_GameModeTimer())
{
    ECSFunc_FCS_GameModeTimer::AssignGameModeTimer(World, DefaultValue);
    return;
}
FCS_GameModeTimer& ModifyGameModeTimer(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GameModeTimer;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_GameModeTimer& ModifyOrAddGameModeTimer(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GameModeTimer;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_GameModeTimer& GetGameModeTimer(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GameModeTimer;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_GameModeTimer GetGameModeTimer_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_GameModeTimer __r;
    bValid = false;
    bValid = ECSFunc_FCS_GameModeTimer::GetGameModeTimer(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_GameModeTimer GetDefaultedGameModeTimer(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_GameModeTimer __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_GameModeTimer);
    if ((local_6 == nullptr))
    {
    }
    else
    {
        local_10.InternalSet(local_6);
        return local_10.GetComp();
    }
    return __r;
}
UFUNCTION()
FCS_GameModeTimer GetDefaultedGameModeTimer_BP(const FECSWorldPtr &inout World)
{
    FCS_GameModeTimer __r;
    return __r;
}
UFUNCTION()
bool RemoveGameModeTimer(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_GameModeTimer);
}
}
void __MonitorGameModeTimerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_GameModeTimer, EECSRegType(RegType), bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameModeTimerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_GameModeTimer, EECSRegType(RegType), bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameModeTimerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_GameModeTimer, EECSRegType(RegType), bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_GameModeFastTickTag
{
UFUNCTION()
bool HasGameModeFastTickTag(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_GameModeFastTickTag);
}
FCS_GameModeFastTickTag& AssignGameModeFastTickTag(const FECSWorldPtr &inout World, const FCS_GameModeFastTickTag &inout DefaultValue = FCS_GameModeFastTickTag())
{
    UScriptStruct local_6 = FCS_GameModeFastTickTag;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignGameModeFastTickTag_BP(const FECSWorldPtr &inout World, const FCS_GameModeFastTickTag &inout DefaultValue = FCS_GameModeFastTickTag())
{
    ECSFunc_FCS_GameModeFastTickTag::AssignGameModeFastTickTag(World, DefaultValue);
    return;
}
FCS_GameModeFastTickTag& ModifyGameModeFastTickTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GameModeFastTickTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_GameModeFastTickTag& ModifyOrAddGameModeFastTickTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GameModeFastTickTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_GameModeFastTickTag& GetGameModeFastTickTag(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GameModeFastTickTag;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_GameModeFastTickTag GetGameModeFastTickTag_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_GameModeFastTickTag& local_4 = ECSFunc_FCS_GameModeFastTickTag::GetGameModeFastTickTag(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_GameModeFastTickTag();
}
const FCS_GameModeFastTickTag GetDefaultedGameModeFastTickTag(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_GameModeFastTickTag __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_GameModeFastTickTag);
    if ((local_6 == nullptr))
    {
    }
    else
    {
        local_10.InternalSet(local_6);
        return local_10.GetComp();
    }
    return __r;
}
UFUNCTION()
FCS_GameModeFastTickTag GetDefaultedGameModeFastTickTag_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_GameModeFastTickTag::GetDefaultedGameModeFastTickTag(World);
}
UFUNCTION()
bool RemoveGameModeFastTickTag(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_GameModeFastTickTag);
}
}
void __MonitorGameModeFastTickTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_GameModeFastTickTag, EECSRegType(RegType), bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameModeFastTickTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_GameModeFastTickTag, EECSRegType(RegType), bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameModeFastTickTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_GameModeFastTickTag, EECSRegType(RegType), bFixedFrame, Details);
    return;
}
