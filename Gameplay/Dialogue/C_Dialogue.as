
namespace __INTENRAL_FC_PlayerDialogues_NS
{
    const TECSComponentDerivedPtr<FC_PlayerDialogues> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerDialogues>();
    const FC_PlayerDialogues DefaultValue = FC_PlayerDialogues();
}
namespace __INTENRAL_FC_GlobalDialogues_NS
{
    const TECSComponentDerivedPtr<FC_GlobalDialogues> DerivedPtr = TECSComponentDerivedPtr<FC_GlobalDialogues>();
    const FC_GlobalDialogues DefaultValue = FC_GlobalDialogues();
}
namespace __INTENRAL_FCS_DialoguePendingList_NS
{
    const TECSComponentDerivedPtr<FCS_DialoguePendingList> DerivedPtr = TECSComponentDerivedPtr<FCS_DialoguePendingList>();
    const FCS_DialoguePendingList DefaultValue = FCS_DialoguePendingList();
}
namespace __INTENRAL_FC_DialogueAmbientPlaying_NS
{
    const TECSComponentDerivedPtr<FC_DialogueAmbientPlaying> DerivedPtr = TECSComponentDerivedPtr<FC_DialogueAmbientPlaying>();
    const FC_DialogueAmbientPlaying DefaultValue = FC_DialogueAmbientPlaying();
}
namespace __INTENRAL_FC_DialogueSimplePlaying_NS
{
    const TECSComponentDerivedPtr<FC_DialogueSimplePlaying> DerivedPtr = TECSComponentDerivedPtr<FC_DialogueSimplePlaying>();
    const FC_DialogueSimplePlaying DefaultValue = FC_DialogueSimplePlaying();
}
namespace __INTENRAL_FC_DialogueSimpleQuickStart_NS
{
    const TECSComponentDerivedPtr<FC_DialogueSimpleQuickStart> DerivedPtr = TECSComponentDerivedPtr<FC_DialogueSimpleQuickStart>();
    const FC_DialogueSimpleQuickStart DefaultValue = FC_DialogueSimpleQuickStart();
}
namespace __INTENRAL_FC_DialogueStateCache_NS
{
    const TECSComponentDerivedPtr<FC_DialogueStateCache> DerivedPtr = TECSComponentDerivedPtr<FC_DialogueStateCache>();
    const FC_DialogueStateCache DefaultValue = FC_DialogueStateCache();
}
namespace __INTENRAL_FCE_OnDialogueInteraction_NS
{
    const TECSEventDerivedPtr<FCE_OnDialogueInteraction> DerivedPtr = TECSEventDerivedPtr<FCE_OnDialogueInteraction>();
}
namespace __INTENRAL_FCE_NotifyStartAmbientDialogue_NS
{
    const TECSEventDerivedPtr<FCE_NotifyStartAmbientDialogue> DerivedPtr = TECSEventDerivedPtr<FCE_NotifyStartAmbientDialogue>();

}
struct FCE_OnDialogueInteraction : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity PlayerEntity;
    UPROPERTY()
    FECSEntity InteractTarget;

    FCE_OnDialogueInteraction()
    {
        return;
    }
}

struct FCE_NotifyStartAmbientDialogue : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity TriggerPlayer;
    UPROPERTY()
    FECSEntity DialogueEntity;
    UPROPERTY()
    EDialogueScope BroadcastScope;
    UPROPERTY()
    TDataObjectPtr<FAmbientDialogueConfig> DialogueConfig;
    UPROPERTY()
    float32 InterruptDistance;
    UPROPERTY()
    float32 ResumeDistance = -1.0f;


}

struct FC_PlayerDialogues : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<TDataObjectPtr<FNPCMainConfig>, FDialogueInfoList> m_NPCDialogueMap;

    FC_PlayerDialogues()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_PlayerDialogues(const FC_PlayerDialogues &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_NPCDialogueMap = Other.m_NPCDialogueMap;
        return;
    }
    FC_PlayerDialogues opAssign(const FC_PlayerDialogues &inout Other)
    {
        FC_PlayerDialogues __r;
        this.SetNPCDialogueMap(Other.GetNPCDialogueMap());
        return __r;
    }
    const TMap<TDataObjectPtr<FNPCMainConfig>, FDialogueInfoList> GetNPCDialogueMap() const property
    {
        const TMap<TDataObjectPtr<FNPCMainConfig>, FDialogueInfoList> __r;
        return __r;
    }
    TMap<TDataObjectPtr<FNPCMainConfig>, FDialogueInfoList> GetModify_NPCDialogueMap() property
    {
        TMap<TDataObjectPtr<FNPCMainConfig>, FDialogueInfoList> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetNPCDialogueMap(const TMap<TDataObjectPtr<FNPCMainConfig>, FDialogueInfoList> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_NPCDialogueMap = __Value;
        return;
    }
}

struct FC_GlobalDialogues : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<FName, FDialogueInfo> m_DialogueInfos;

    FC_GlobalDialogues()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_GlobalDialogues(const FC_GlobalDialogues &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_DialogueInfos = Other.m_DialogueInfos;
        return;
    }
    FC_GlobalDialogues opAssign(const FC_GlobalDialogues &inout Other)
    {
        FC_GlobalDialogues __r;
        this.SetDialogueInfos(Other.GetDialogueInfos());
        return __r;
    }
    const TMap<FName, FDialogueInfo> GetDialogueInfos() const property
    {
        const TMap<FName, FDialogueInfo> __r;
        return __r;
    }
    TMap<FName, FDialogueInfo> GetModify_DialogueInfos() property
    {
        TMap<FName, FDialogueInfo> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetDialogueInfos(const TMap<FName, FDialogueInfo> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_DialogueInfos = __Value;
        return;
    }
}

struct FCS_DialoguePendingList : FECSSingleton
{
    UPROPERTY()
    TMap<TDataObjectPtr<FNPCMainConfig>, FDialogueInfoList> NPCDialogueMap;

    FCS_DialoguePendingList()
    {
        return;
    }
}

struct FC_DialogueAmbientPlaying : FECSComponent
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_TriggerPlayer;
    UPROPERTY()
    FDialogueDeliveryContext m_DialogueContext;
    UPROPERTY()
    EDialogueScope m_BroadcastScope;
    UPROPERTY()
    int m_SubtitleIndex;
    UPROPERTY()
    FFPTime m_NextSubtitleTime;
    UPROPERTY()
    FDialogueSection m_Section;
    UPROPERTY()
    TSet<FECSEntity> m_PlayerEntitiesInRange;
    UPROPERTY()
    TSet<FECSEntity> m_PlayerEntitiesOutRange;

    FC_DialogueAmbientPlaying()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_DialogueAmbientPlaying(const FC_DialogueAmbientPlaying &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_DialogueAmbientPlaying opAssign(const FC_DialogueAmbientPlaying &inout Other)
    {
        FC_DialogueAmbientPlaying __r;
        this.SetTriggerPlayer(Other.GetTriggerPlayer());
        this.SetDialogueContext(Other.GetDialogueContext());
        this.SetBroadcastScope(Other.GetBroadcastScope());
        this.SetSubtitleIndex(Other.GetSubtitleIndex());
        this.SetNextSubtitleTime(Other.GetNextSubtitleTime());
        this.SetSection(Other.GetSection());
        this.SetPlayerEntitiesInRange(Other.GetPlayerEntitiesInRange());
        this.SetPlayerEntitiesOutRange(Other.GetPlayerEntitiesOutRange());
        return __r;
    }
    const FECSEntity GetTriggerPlayer() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_TriggerPlayer() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetTriggerPlayer(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_TriggerPlayer = __Value;
        return;
    }
    const FDialogueDeliveryContext GetDialogueContext() const property
    {
        const FDialogueDeliveryContext __r;
        return __r;
    }
    FDialogueDeliveryContext GetDialogueContext() property
    {
        FDialogueDeliveryContext __r;
        return __r;
    }
    void SetDialogueContext(const FDialogueDeliveryContext &inout __Value) property
    {
        this.m_DialogueContext = __Value;
        return;
    }
    EDialogueScope GetBroadcastScope() const property
    {
        return this.m_BroadcastScope;
    }
    void SetBroadcastScope(const EDialogueScope __Value) property
    {
        if (int(this.m_BroadcastScope) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(11);
        this.m_BroadcastScope = __Value;
        return;
    }
    int GetSubtitleIndex() const property
    {
        return this.m_SubtitleIndex;
    }
    void SetSubtitleIndex(const int __Value) property
    {
        if (this.m_SubtitleIndex == __Value)
        {
            return;
        }
        this.__MarkDirty(12);
        this.m_SubtitleIndex = __Value;
        return;
    }
    const FFPTime GetNextSubtitleTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetNextSubtitleTime() property
    {
        FFPTime __r;
        return __r;
    }
    void SetNextSubtitleTime(const FFPTime &inout __Value) property
    {
        this.m_NextSubtitleTime = __Value;
        return;
    }
    const FDialogueSection GetSection() const property
    {
        const FDialogueSection __r;
        return __r;
    }
    FDialogueSection GetSection() property
    {
        FDialogueSection __r;
        return __r;
    }
    void SetSection(const FDialogueSection &inout __Value) property
    {
        this.m_Section = __Value;
        return;
    }
    const TSet<FECSEntity> GetPlayerEntitiesInRange() const property
    {
        const TSet<FECSEntity> __r;
        return __r;
    }
    TSet<FECSEntity> GetModify_PlayerEntitiesInRange() property
    {
        TSet<FECSEntity> __r;
        this.__MarkDirty(13);
        return __r;
    }
    void SetPlayerEntitiesInRange(const TSet<FECSEntity> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(13);
        this.m_PlayerEntitiesInRange = __Value;
        return;
    }
    const TSet<FECSEntity> GetPlayerEntitiesOutRange() const property
    {
        const TSet<FECSEntity> __r;
        return __r;
    }
    TSet<FECSEntity> GetModify_PlayerEntitiesOutRange() property
    {
        TSet<FECSEntity> __r;
        this.__MarkDirty(14);
        return __r;
    }
    void SetPlayerEntitiesOutRange(const TSet<FECSEntity> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(14);
        this.m_PlayerEntitiesOutRange = __Value;
        return;
    }
}

struct FC_DialogueSimplePlaying : FECSComponent
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FDialogueDeliveryContext m_DialogueContext;
    UPROPERTY()
    TSet<uint> m_ExecutedActionNodeIds;

    FC_DialogueSimplePlaying()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_DialogueSimplePlaying(const FC_DialogueSimplePlaying &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_DialogueContext = Other.m_DialogueContext;
        this.m_ExecutedActionNodeIds = Other.m_ExecutedActionNodeIds;
        return;
    }
    FC_DialogueSimplePlaying opAssign(const FC_DialogueSimplePlaying &inout Other)
    {
        FC_DialogueSimplePlaying __r;
        this.SetDialogueContext(Other.GetDialogueContext());
        this.SetExecutedActionNodeIds(Other.GetExecutedActionNodeIds());
        return __r;
    }
    const FDialogueDeliveryContext GetDialogueContext() const property
    {
        const FDialogueDeliveryContext __r;
        return __r;
    }
    FDialogueDeliveryContext GetDialogueContext() property
    {
        FDialogueDeliveryContext __r;
        return __r;
    }
    void SetDialogueContext(const FDialogueDeliveryContext &inout __Value) property
    {
        this.m_DialogueContext = __Value;
        return;
    }
    const TSet<uint> GetExecutedActionNodeIds() const property
    {
        const TSet<uint> __r;
        return __r;
    }
    TSet<uint> GetModify_ExecutedActionNodeIds() property
    {
        TSet<uint> __r;
        this.__MarkDirty(10);
        return __r;
    }
    void SetExecutedActionNodeIds(const TSet<uint> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_ExecutedActionNodeIds = __Value;
        return;
    }
}

struct FC_DialogueSimpleQuickStart : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_InteractTarget;
    UPROPERTY()
    TDataObjectPtr<FDialogueConfig> m_DialogueConfig;

    FC_DialogueSimpleQuickStart()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_DialogueSimpleQuickStart(const FC_DialogueSimpleQuickStart &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_InteractTarget = Other.m_InteractTarget;
        this.m_DialogueConfig = Other.m_DialogueConfig;
        return;
    }
    FC_DialogueSimpleQuickStart opAssign(const FC_DialogueSimpleQuickStart &inout Other)
    {
        FC_DialogueSimpleQuickStart __r;
        this.SetInteractTarget(Other.GetInteractTarget());
        this.SetDialogueConfig(Other.GetDialogueConfig());
        return __r;
    }
    const FECSEntity GetInteractTarget() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_InteractTarget() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetInteractTarget(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_InteractTarget = __Value;
        return;
    }
    const TDataObjectPtr<FDialogueConfig> GetDialogueConfig() const property
    {
        const TDataObjectPtr<FDialogueConfig> __r;
        return __r;
    }
    TDataObjectPtr<FDialogueConfig> GetModify_DialogueConfig() property
    {
        TDataObjectPtr<FDialogueConfig> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetDialogueConfig(const TDataObjectPtr<FDialogueConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_DialogueConfig = __Value;
        return;
    }
}

struct FDialogueHistory
{
    UPROPERTY()
    TArray<FName> m_OptionHistory;

    FDialogueHistory()
    {
        return;
    }
    const TArray<FName> GetOptionHistory() const property
    {
        const TArray<FName> __r;
        return __r;
    }
    TArray<FName> GetOptionHistory() property
    {
        TArray<FName> __r;
        return __r;
    }
    void SetOptionHistory(const TArray<FName> &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

struct FC_DialogueStateCache : FECSComponent
{
    UPROPERTY()
    TMap<FName, FDialogueHistory> HistoryCache;

    FC_DialogueStateCache()
    {
        return;
    }
}

namespace ECSFunc_FC_PlayerDialogues
{
UFUNCTION()
bool HasPlayerDialogues(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerDialogues);
}
FC_PlayerDialogues& AssignPlayerDialogues(const FECSEntity &inout Entity, const FC_PlayerDialogues &inout DefaultValue = FC_PlayerDialogues())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerDialogues, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerDialogues_BP(const FECSEntity &inout Entity, const FC_PlayerDialogues &inout DefaultValue = FC_PlayerDialogues())
{
    ECSFunc_FC_PlayerDialogues::AssignPlayerDialogues(Entity, DefaultValue);
    return;
}
FC_PlayerDialogues& ModifyPlayerDialogues(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerDialogues));
    return local_12.GetComp();
}
FC_PlayerDialogues& ModifyOrAddPlayerDialogues(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerDialogues));
    return local_12.GetComp();
}
const FC_PlayerDialogues& GetPlayerDialogues(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerDialogues));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerDialogues GetPlayerDialogues_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PlayerDialogues& local_4 = ECSFunc_FC_PlayerDialogues::GetPlayerDialogues(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PlayerDialogues();
}
const FC_PlayerDialogues GetDefaultedPlayerDialogues(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerDialogues __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerDialogues);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_PlayerDialogues GetDefaultedPlayerDialogues_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PlayerDialogues::GetDefaultedPlayerDialogues(Entity);
}
UFUNCTION()
bool RemovePlayerDialogues(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerDialogues);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerDialoguesOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerDialogues, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerDialoguesOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerDialogues, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerDialoguesOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerDialogues, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerDialoguesOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerDialogues, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerDialoguesOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerDialogues, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerDialoguesLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerDialogues, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerDialoguesActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerDialogues, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerDialoguesModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerDialogues, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_GlobalDialogues
{
UFUNCTION()
bool HasGlobalDialogues(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_GlobalDialogues);
}
FC_GlobalDialogues& AssignGlobalDialogues(const FECSEntity &inout Entity, const FC_GlobalDialogues &inout DefaultValue = FC_GlobalDialogues())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_GlobalDialogues, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignGlobalDialogues_BP(const FECSEntity &inout Entity, const FC_GlobalDialogues &inout DefaultValue = FC_GlobalDialogues())
{
    ECSFunc_FC_GlobalDialogues::AssignGlobalDialogues(Entity, DefaultValue);
    return;
}
FC_GlobalDialogues& ModifyGlobalDialogues(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_GlobalDialogues));
    return local_12.GetComp();
}
FC_GlobalDialogues& ModifyOrAddGlobalDialogues(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_GlobalDialogues));
    return local_12.GetComp();
}
const FC_GlobalDialogues& GetGlobalDialogues(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_GlobalDialogues));
    return local_12.GetComp();
}
UFUNCTION()
FC_GlobalDialogues GetGlobalDialogues_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_GlobalDialogues& local_4 = ECSFunc_FC_GlobalDialogues::GetGlobalDialogues(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_GlobalDialogues();
}
const FC_GlobalDialogues GetDefaultedGlobalDialogues(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_GlobalDialogues __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_GlobalDialogues);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_GlobalDialogues GetDefaultedGlobalDialogues_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_GlobalDialogues::GetDefaultedGlobalDialogues(Entity);
}
UFUNCTION()
bool RemoveGlobalDialogues(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_GlobalDialogues);
}
}
FECSMonitorRuntimeView __GetMonitorGlobalDialoguesOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_GlobalDialogues, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGlobalDialoguesOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_GlobalDialogues, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGlobalDialoguesOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_GlobalDialogues, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGlobalDialoguesOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_GlobalDialogues, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGlobalDialoguesOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_GlobalDialogues, bFixedFrame, bMustHandleAll);
}
void __MonitorGlobalDialoguesLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_GlobalDialogues, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGlobalDialoguesActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_GlobalDialogues, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGlobalDialoguesModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_GlobalDialogues, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_DialoguePendingList
{
UFUNCTION()
bool HasDialoguePendingList(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_DialoguePendingList);
}
FCS_DialoguePendingList& AssignDialoguePendingList(const FECSWorldPtr &inout World, const FCS_DialoguePendingList &inout DefaultValue = FCS_DialoguePendingList())
{
    UScriptStruct local_6 = FCS_DialoguePendingList;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignDialoguePendingList_BP(const FECSWorldPtr &inout World, const FCS_DialoguePendingList &inout DefaultValue = FCS_DialoguePendingList())
{
    ECSFunc_FCS_DialoguePendingList::AssignDialoguePendingList(World, DefaultValue);
    return;
}
FCS_DialoguePendingList& ModifyDialoguePendingList(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_DialoguePendingList;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_DialoguePendingList& ModifyOrAddDialoguePendingList(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_DialoguePendingList;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_DialoguePendingList& GetDialoguePendingList(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_DialoguePendingList;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_DialoguePendingList GetDialoguePendingList_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_DialoguePendingList __r;
    bValid = false;
    bValid = ECSFunc_FCS_DialoguePendingList::GetDialoguePendingList(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_DialoguePendingList GetDefaultedDialoguePendingList(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_DialoguePendingList __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_DialoguePendingList);
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
FCS_DialoguePendingList GetDefaultedDialoguePendingList_BP(const FECSWorldPtr &inout World)
{
    FCS_DialoguePendingList __r;
    return __r;
}
UFUNCTION()
bool RemoveDialoguePendingList(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_DialoguePendingList);
}
}
void __MonitorDialoguePendingListLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_DialoguePendingList, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDialoguePendingListActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_DialoguePendingList, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDialoguePendingListModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_DialoguePendingList, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DialogueAmbientPlaying
{
UFUNCTION()
bool HasDialogueAmbientPlaying(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DialogueAmbientPlaying);
}
FC_DialogueAmbientPlaying& AssignDialogueAmbientPlaying(const FECSEntity &inout Entity, const FC_DialogueAmbientPlaying &inout DefaultValue = FC_DialogueAmbientPlaying())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DialogueAmbientPlaying, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDialogueAmbientPlaying_BP(const FECSEntity &inout Entity, const FC_DialogueAmbientPlaying &inout DefaultValue = FC_DialogueAmbientPlaying())
{
    ECSFunc_FC_DialogueAmbientPlaying::AssignDialogueAmbientPlaying(Entity, DefaultValue);
    return;
}
FC_DialogueAmbientPlaying& ModifyDialogueAmbientPlaying(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DialogueAmbientPlaying));
    return local_12.GetComp();
}
FC_DialogueAmbientPlaying& ModifyOrAddDialogueAmbientPlaying(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DialogueAmbientPlaying));
    return local_12.GetComp();
}
const FC_DialogueAmbientPlaying& GetDialogueAmbientPlaying(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DialogueAmbientPlaying));
    return local_12.GetComp();
}
UFUNCTION()
FC_DialogueAmbientPlaying GetDialogueAmbientPlaying_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DialogueAmbientPlaying& local_4 = ECSFunc_FC_DialogueAmbientPlaying::GetDialogueAmbientPlaying(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DialogueAmbientPlaying();
}
const FC_DialogueAmbientPlaying GetDefaultedDialogueAmbientPlaying(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DialogueAmbientPlaying __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DialogueAmbientPlaying);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_DialogueAmbientPlaying GetDefaultedDialogueAmbientPlaying_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DialogueAmbientPlaying::GetDefaultedDialogueAmbientPlaying(Entity);
}
UFUNCTION()
bool RemoveDialogueAmbientPlaying(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DialogueAmbientPlaying);
}
}
FECSMonitorRuntimeView __GetMonitorDialogueAmbientPlayingOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DialogueAmbientPlaying, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueAmbientPlayingOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DialogueAmbientPlaying, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueAmbientPlayingOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DialogueAmbientPlaying, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueAmbientPlayingOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DialogueAmbientPlaying, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueAmbientPlayingOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DialogueAmbientPlaying, bFixedFrame, bMustHandleAll);
}
void __MonitorDialogueAmbientPlayingLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DialogueAmbientPlaying, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDialogueAmbientPlayingActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DialogueAmbientPlaying, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDialogueAmbientPlayingModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DialogueAmbientPlaying, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DialogueSimplePlaying
{
UFUNCTION()
bool HasDialogueSimplePlaying(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DialogueSimplePlaying);
}
FC_DialogueSimplePlaying& AssignDialogueSimplePlaying(const FECSEntity &inout Entity, const FC_DialogueSimplePlaying &inout DefaultValue = FC_DialogueSimplePlaying())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DialogueSimplePlaying, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDialogueSimplePlaying_BP(const FECSEntity &inout Entity, const FC_DialogueSimplePlaying &inout DefaultValue = FC_DialogueSimplePlaying())
{
    ECSFunc_FC_DialogueSimplePlaying::AssignDialogueSimplePlaying(Entity, DefaultValue);
    return;
}
FC_DialogueSimplePlaying& ModifyDialogueSimplePlaying(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DialogueSimplePlaying));
    return local_12.GetComp();
}
FC_DialogueSimplePlaying& ModifyOrAddDialogueSimplePlaying(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DialogueSimplePlaying));
    return local_12.GetComp();
}
const FC_DialogueSimplePlaying& GetDialogueSimplePlaying(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DialogueSimplePlaying));
    return local_12.GetComp();
}
UFUNCTION()
FC_DialogueSimplePlaying GetDialogueSimplePlaying_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DialogueSimplePlaying& local_4 = ECSFunc_FC_DialogueSimplePlaying::GetDialogueSimplePlaying(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DialogueSimplePlaying();
}
const FC_DialogueSimplePlaying GetDefaultedDialogueSimplePlaying(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DialogueSimplePlaying __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DialogueSimplePlaying);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_DialogueSimplePlaying GetDefaultedDialogueSimplePlaying_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DialogueSimplePlaying::GetDefaultedDialogueSimplePlaying(Entity);
}
UFUNCTION()
bool RemoveDialogueSimplePlaying(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DialogueSimplePlaying);
}
}
FECSMonitorRuntimeView __GetMonitorDialogueSimplePlayingOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DialogueSimplePlaying, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueSimplePlayingOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DialogueSimplePlaying, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueSimplePlayingOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DialogueSimplePlaying, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueSimplePlayingOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DialogueSimplePlaying, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueSimplePlayingOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DialogueSimplePlaying, bFixedFrame, bMustHandleAll);
}
void __MonitorDialogueSimplePlayingLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DialogueSimplePlaying, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDialogueSimplePlayingActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DialogueSimplePlaying, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDialogueSimplePlayingModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DialogueSimplePlaying, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DialogueSimpleQuickStart
{
UFUNCTION()
bool HasDialogueSimpleQuickStart(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DialogueSimpleQuickStart);
}
FC_DialogueSimpleQuickStart& AssignDialogueSimpleQuickStart(const FECSEntity &inout Entity, const FC_DialogueSimpleQuickStart &inout DefaultValue = FC_DialogueSimpleQuickStart())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DialogueSimpleQuickStart, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDialogueSimpleQuickStart_BP(const FECSEntity &inout Entity, const FC_DialogueSimpleQuickStart &inout DefaultValue = FC_DialogueSimpleQuickStart())
{
    ECSFunc_FC_DialogueSimpleQuickStart::AssignDialogueSimpleQuickStart(Entity, DefaultValue);
    return;
}
FC_DialogueSimpleQuickStart& ModifyDialogueSimpleQuickStart(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DialogueSimpleQuickStart));
    return local_12.GetComp();
}
FC_DialogueSimpleQuickStart& ModifyOrAddDialogueSimpleQuickStart(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DialogueSimpleQuickStart));
    return local_12.GetComp();
}
const FC_DialogueSimpleQuickStart& GetDialogueSimpleQuickStart(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DialogueSimpleQuickStart));
    return local_12.GetComp();
}
UFUNCTION()
FC_DialogueSimpleQuickStart GetDialogueSimpleQuickStart_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DialogueSimpleQuickStart& local_4 = ECSFunc_FC_DialogueSimpleQuickStart::GetDialogueSimpleQuickStart(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DialogueSimpleQuickStart();
}
const FC_DialogueSimpleQuickStart GetDefaultedDialogueSimpleQuickStart(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DialogueSimpleQuickStart __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DialogueSimpleQuickStart);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_DialogueSimpleQuickStart GetDefaultedDialogueSimpleQuickStart_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DialogueSimpleQuickStart::GetDefaultedDialogueSimpleQuickStart(Entity);
}
UFUNCTION()
bool RemoveDialogueSimpleQuickStart(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DialogueSimpleQuickStart);
}
}
FECSMonitorRuntimeView __GetMonitorDialogueSimpleQuickStartOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DialogueSimpleQuickStart, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueSimpleQuickStartOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DialogueSimpleQuickStart, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueSimpleQuickStartOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DialogueSimpleQuickStart, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueSimpleQuickStartOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DialogueSimpleQuickStart, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueSimpleQuickStartOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DialogueSimpleQuickStart, bFixedFrame, bMustHandleAll);
}
void __MonitorDialogueSimpleQuickStartLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DialogueSimpleQuickStart, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDialogueSimpleQuickStartActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DialogueSimpleQuickStart, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDialogueSimpleQuickStartModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DialogueSimpleQuickStart, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DialogueStateCache
{
UFUNCTION()
bool HasDialogueStateCache(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DialogueStateCache);
}
FC_DialogueStateCache& AssignDialogueStateCache(const FECSEntity &inout Entity, const FC_DialogueStateCache &inout DefaultValue = FC_DialogueStateCache())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DialogueStateCache, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDialogueStateCache_BP(const FECSEntity &inout Entity, const FC_DialogueStateCache &inout DefaultValue = FC_DialogueStateCache())
{
    ECSFunc_FC_DialogueStateCache::AssignDialogueStateCache(Entity, DefaultValue);
    return;
}
FC_DialogueStateCache& ModifyDialogueStateCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DialogueStateCache));
    return local_12.GetComp();
}
FC_DialogueStateCache& ModifyOrAddDialogueStateCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DialogueStateCache));
    return local_12.GetComp();
}
const FC_DialogueStateCache& GetDialogueStateCache(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DialogueStateCache));
    return local_12.GetComp();
}
UFUNCTION()
FC_DialogueStateCache GetDialogueStateCache_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_DialogueStateCache __r;
    bValid = false;
    bValid = ECSFunc_FC_DialogueStateCache::GetDialogueStateCache(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_DialogueStateCache GetDefaultedDialogueStateCache(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DialogueStateCache __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DialogueStateCache);
    if ((local_10 == nullptr))
    {
    }
    else
    {
        local_14.InternalSet(local_10);
        return local_14.GetComp();
    }
    return __r;
}
UFUNCTION()
FC_DialogueStateCache GetDefaultedDialogueStateCache_BP(const FECSEntity &inout Entity)
{
    FC_DialogueStateCache __r;
    return __r;
}
UFUNCTION()
bool RemoveDialogueStateCache(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DialogueStateCache);
}
}
FECSMonitorRuntimeView __GetMonitorDialogueStateCacheOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DialogueStateCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueStateCacheOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DialogueStateCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueStateCacheOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DialogueStateCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueStateCacheOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DialogueStateCache, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueStateCacheOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DialogueStateCache, bFixedFrame, bMustHandleAll);
}
void __MonitorDialogueStateCacheLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DialogueStateCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDialogueStateCacheActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DialogueStateCache, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDialogueStateCacheModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DialogueStateCache, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_PlayerDialogues &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_PlayerDialogues &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_PlayerDialogues &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_PlayerDialogues
{
int __IndexOf_NPCDialogueMap()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_GlobalDialogues &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_GlobalDialogues &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_GlobalDialogues &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_GlobalDialogues
{
int __IndexOf_DialogueInfos()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FC_DialogueAmbientPlaying &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FC_DialogueAmbientPlaying &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_DialogueAmbientPlaying &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_DialogueAmbientPlaying
{
int __IndexOf_TriggerPlayer()
{
    return 0;
}
int __IndexOf_DialogueContext()
{
    return 1;
}
int __IndexOf_BroadcastScope()
{
    return 11;
}
int __IndexOf_SubtitleIndex()
{
    return 12;
}
int __IndexOf_PlayerEntitiesInRange()
{
    return 13;
}
int __IndexOf_PlayerEntitiesOutRange()
{
    return 14;
}
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FC_DialogueSimplePlaying &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FC_DialogueSimplePlaying &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_DialogueSimplePlaying &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_DialogueSimplePlaying
{
int __IndexOf_DialogueContext()
{
    return 0;
}
int __IndexOf_ExecutedActionNodeIds()
{
    return 10;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_DialogueSimpleQuickStart &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_DialogueSimpleQuickStart &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_DialogueSimpleQuickStart &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_DialogueSimpleQuickStart
{
int __IndexOf_InteractTarget()
{
    return 0;
}
int __IndexOf_DialogueConfig()
{
    return 1;
}
}
