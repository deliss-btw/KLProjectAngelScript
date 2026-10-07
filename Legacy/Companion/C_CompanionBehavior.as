
namespace __INTENRAL_FC_CompanionBehaviorConfigTag_NS
{
    const TECSComponentDerivedPtr<FC_CompanionBehaviorConfigTag> DerivedPtr = TECSComponentDerivedPtr<FC_CompanionBehaviorConfigTag>();
    const FC_CompanionBehaviorConfigTag DefaultValue = FC_CompanionBehaviorConfigTag();
}
namespace __INTENRAL_FC_CompanionBehaviorInfo_NS
{
    const TECSComponentDerivedPtr<FC_CompanionBehaviorInfo> DerivedPtr = TECSComponentDerivedPtr<FC_CompanionBehaviorInfo>();
    const FC_CompanionBehaviorInfo DefaultValue = FC_CompanionBehaviorInfo();
}
namespace __INTENRAL_FC_CompanionSpeakingInfo_NS
{
    const TECSComponentDerivedPtr<FC_CompanionSpeakingInfo> DerivedPtr = TECSComponentDerivedPtr<FC_CompanionSpeakingInfo>();
    const FC_CompanionSpeakingInfo DefaultValue = FC_CompanionSpeakingInfo();
}
namespace __INTENRAL_FC_BehaviorSpeakingTag_NS
{
    const TECSComponentDerivedPtr<FC_BehaviorSpeakingTag> DerivedPtr = TECSComponentDerivedPtr<FC_BehaviorSpeakingTag>();
    const FC_BehaviorSpeakingTag DefaultValue = FC_BehaviorSpeakingTag();
}
namespace __INTENRAL_FCE_CompanionSpeakingDelayEvent_NS
{
    const TECSEventDerivedPtr<FCE_CompanionSpeakingDelayEvent> DerivedPtr = TECSEventDerivedPtr<FCE_CompanionSpeakingDelayEvent>();
}
namespace __INTENRAL_FCE_EntityActorSpeakEvent_NS
{
    const TECSEventDerivedPtr<FCE_EntityActorSpeakEvent> DerivedPtr = TECSEventDerivedPtr<FCE_EntityActorSpeakEvent>();
}
namespace __INTENRAL_FCE_TriggerCompanionBehavior_NS
{
    const TECSEventDerivedPtr<FCE_TriggerCompanionBehavior> DerivedPtr = TECSEventDerivedPtr<FCE_TriggerCompanionBehavior>();
}
namespace __INTENRAL_FCE_ClearCompanionBehaviorString_NS
{
    const TECSEventDerivedPtr<FCE_ClearCompanionBehaviorString> DerivedPtr = TECSEventDerivedPtr<FCE_ClearCompanionBehaviorString>();

}
struct FC_CompanionBehaviorConfigTag : FECSComponent
{
    FC_CompanionBehaviorConfigTag()
    {
        return;
    }
}

struct FC_CompanionBehaviorInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FECSEntity> m_DistCloseEntities;
    UPROPERTY()
    FString m_ShowBehaviorStringOnHead;

    FC_CompanionBehaviorInfo()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_CompanionBehaviorInfo(const FC_CompanionBehaviorInfo &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_DistCloseEntities = Other.m_DistCloseEntities;
        this.m_ShowBehaviorStringOnHead = Other.m_ShowBehaviorStringOnHead;
        return;
    }
    FC_CompanionBehaviorInfo opAssign(const FC_CompanionBehaviorInfo &inout Other)
    {
        FC_CompanionBehaviorInfo __r;
        this.SetDistCloseEntities(Other.GetDistCloseEntities());
        this.SetShowBehaviorStringOnHead(Other.GetShowBehaviorStringOnHead());
        return __r;
    }
    const TArray<FECSEntity> GetDistCloseEntities() const property
    {
        const TArray<FECSEntity> __r;
        return __r;
    }
    TArray<FECSEntity> GetModify_DistCloseEntities() property
    {
        TArray<FECSEntity> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetDistCloseEntities(const TArray<FECSEntity> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_DistCloseEntities = __Value;
        return;
    }
    FString GetShowBehaviorStringOnHead() const property
    {
        return this.m_ShowBehaviorStringOnHead;
    }
    void SetShowBehaviorStringOnHead(const FString &inout __Value) property
    {
        if ((this.m_ShowBehaviorStringOnHead == __Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_ShowBehaviorStringOnHead = __Value;
        return;
    }
}

struct FC_CompanionSpeakingInfo : FECSComponent
{
    UPROPERTY()
    FString SpeakingInfo;

    FC_CompanionSpeakingInfo()
    {
        return;
    }
}

struct FC_BehaviorSpeakingTag : FECSComponent
{
    FC_BehaviorSpeakingTag()
    {
        return;
    }
}

struct FCE_CompanionSpeakingDelayEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_CompanionSpeakingDelayEvent()
    {
        return;
    }
}

struct FCE_EntityActorSpeakEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity SpeakPawnEntity;
    UPROPERTY()
    FString SpeakContent;

    FCE_EntityActorSpeakEvent()
    {
        return;
    }
}

struct FCE_TriggerCompanionBehavior : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity TargetPawnEntity;

    FCE_TriggerCompanionBehavior()
    {
        return;
    }
}

struct FCE_ClearCompanionBehaviorString : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_ClearCompanionBehaviorString()
    {
        return;
    }
}

namespace ECSFunc_FC_CompanionBehaviorConfigTag
{
UFUNCTION()
bool HasCompanionBehaviorConfigTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CompanionBehaviorConfigTag);
}
FC_CompanionBehaviorConfigTag& AssignCompanionBehaviorConfigTag(const FECSEntity &inout Entity, const FC_CompanionBehaviorConfigTag &inout DefaultValue = FC_CompanionBehaviorConfigTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CompanionBehaviorConfigTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCompanionBehaviorConfigTag_BP(const FECSEntity &inout Entity, const FC_CompanionBehaviorConfigTag &inout DefaultValue = FC_CompanionBehaviorConfigTag())
{
    ECSFunc_FC_CompanionBehaviorConfigTag::AssignCompanionBehaviorConfigTag(Entity, DefaultValue);
    return;
}
FC_CompanionBehaviorConfigTag& ModifyCompanionBehaviorConfigTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CompanionBehaviorConfigTag));
    return local_12.GetComp();
}
FC_CompanionBehaviorConfigTag& ModifyOrAddCompanionBehaviorConfigTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CompanionBehaviorConfigTag));
    return local_12.GetComp();
}
const FC_CompanionBehaviorConfigTag& GetCompanionBehaviorConfigTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CompanionBehaviorConfigTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_CompanionBehaviorConfigTag GetCompanionBehaviorConfigTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CompanionBehaviorConfigTag& local_4 = ECSFunc_FC_CompanionBehaviorConfigTag::GetCompanionBehaviorConfigTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CompanionBehaviorConfigTag();
}
const FC_CompanionBehaviorConfigTag GetDefaultedCompanionBehaviorConfigTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CompanionBehaviorConfigTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CompanionBehaviorConfigTag);
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
FC_CompanionBehaviorConfigTag GetDefaultedCompanionBehaviorConfigTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CompanionBehaviorConfigTag::GetDefaultedCompanionBehaviorConfigTag(Entity);
}
UFUNCTION()
bool RemoveCompanionBehaviorConfigTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CompanionBehaviorConfigTag);
}
}
FECSMonitorRuntimeView __GetMonitorCompanionBehaviorConfigTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CompanionBehaviorConfigTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCompanionBehaviorConfigTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CompanionBehaviorConfigTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCompanionBehaviorConfigTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CompanionBehaviorConfigTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCompanionBehaviorConfigTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CompanionBehaviorConfigTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCompanionBehaviorConfigTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CompanionBehaviorConfigTag, bFixedFrame, bMustHandleAll);
}
void __MonitorCompanionBehaviorConfigTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CompanionBehaviorConfigTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCompanionBehaviorConfigTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CompanionBehaviorConfigTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCompanionBehaviorConfigTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CompanionBehaviorConfigTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CompanionBehaviorInfo
{
UFUNCTION()
bool HasCompanionBehaviorInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CompanionBehaviorInfo);
}
FC_CompanionBehaviorInfo& AssignCompanionBehaviorInfo(const FECSEntity &inout Entity, const FC_CompanionBehaviorInfo &inout DefaultValue = FC_CompanionBehaviorInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CompanionBehaviorInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCompanionBehaviorInfo_BP(const FECSEntity &inout Entity, const FC_CompanionBehaviorInfo &inout DefaultValue = FC_CompanionBehaviorInfo())
{
    ECSFunc_FC_CompanionBehaviorInfo::AssignCompanionBehaviorInfo(Entity, DefaultValue);
    return;
}
FC_CompanionBehaviorInfo& ModifyCompanionBehaviorInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CompanionBehaviorInfo));
    return local_12.GetComp();
}
FC_CompanionBehaviorInfo& ModifyOrAddCompanionBehaviorInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CompanionBehaviorInfo));
    return local_12.GetComp();
}
const FC_CompanionBehaviorInfo& GetCompanionBehaviorInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CompanionBehaviorInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_CompanionBehaviorInfo GetCompanionBehaviorInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CompanionBehaviorInfo& local_4 = ECSFunc_FC_CompanionBehaviorInfo::GetCompanionBehaviorInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CompanionBehaviorInfo();
}
const FC_CompanionBehaviorInfo GetDefaultedCompanionBehaviorInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CompanionBehaviorInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CompanionBehaviorInfo);
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
FC_CompanionBehaviorInfo GetDefaultedCompanionBehaviorInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CompanionBehaviorInfo::GetDefaultedCompanionBehaviorInfo(Entity);
}
UFUNCTION()
bool RemoveCompanionBehaviorInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CompanionBehaviorInfo);
}
}
FECSMonitorRuntimeView __GetMonitorCompanionBehaviorInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CompanionBehaviorInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCompanionBehaviorInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CompanionBehaviorInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCompanionBehaviorInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CompanionBehaviorInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCompanionBehaviorInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CompanionBehaviorInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCompanionBehaviorInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CompanionBehaviorInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorCompanionBehaviorInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CompanionBehaviorInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCompanionBehaviorInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CompanionBehaviorInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCompanionBehaviorInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CompanionBehaviorInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CompanionSpeakingInfo
{
UFUNCTION()
bool HasCompanionSpeakingInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CompanionSpeakingInfo);
}
FC_CompanionSpeakingInfo& AssignCompanionSpeakingInfo(const FECSEntity &inout Entity, const FC_CompanionSpeakingInfo &inout DefaultValue = FC_CompanionSpeakingInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CompanionSpeakingInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCompanionSpeakingInfo_BP(const FECSEntity &inout Entity, const FC_CompanionSpeakingInfo &inout DefaultValue = FC_CompanionSpeakingInfo())
{
    ECSFunc_FC_CompanionSpeakingInfo::AssignCompanionSpeakingInfo(Entity, DefaultValue);
    return;
}
FC_CompanionSpeakingInfo& ModifyCompanionSpeakingInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CompanionSpeakingInfo));
    return local_12.GetComp();
}
FC_CompanionSpeakingInfo& ModifyOrAddCompanionSpeakingInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CompanionSpeakingInfo));
    return local_12.GetComp();
}
const FC_CompanionSpeakingInfo& GetCompanionSpeakingInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CompanionSpeakingInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_CompanionSpeakingInfo GetCompanionSpeakingInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CompanionSpeakingInfo __r;
    bValid = false;
    bValid = ECSFunc_FC_CompanionSpeakingInfo::GetCompanionSpeakingInfo(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CompanionSpeakingInfo GetDefaultedCompanionSpeakingInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CompanionSpeakingInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CompanionSpeakingInfo);
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
FC_CompanionSpeakingInfo GetDefaultedCompanionSpeakingInfo_BP(const FECSEntity &inout Entity)
{
    FC_CompanionSpeakingInfo __r;
    return __r;
}
UFUNCTION()
bool RemoveCompanionSpeakingInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CompanionSpeakingInfo);
}
}
FECSMonitorRuntimeView __GetMonitorCompanionSpeakingInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CompanionSpeakingInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCompanionSpeakingInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CompanionSpeakingInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCompanionSpeakingInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CompanionSpeakingInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCompanionSpeakingInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CompanionSpeakingInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCompanionSpeakingInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CompanionSpeakingInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorCompanionSpeakingInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CompanionSpeakingInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCompanionSpeakingInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CompanionSpeakingInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCompanionSpeakingInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CompanionSpeakingInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_BehaviorSpeakingTag
{
UFUNCTION()
bool HasBehaviorSpeakingTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_BehaviorSpeakingTag);
}
FC_BehaviorSpeakingTag& AssignBehaviorSpeakingTag(const FECSEntity &inout Entity, const FC_BehaviorSpeakingTag &inout DefaultValue = FC_BehaviorSpeakingTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_BehaviorSpeakingTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignBehaviorSpeakingTag_BP(const FECSEntity &inout Entity, const FC_BehaviorSpeakingTag &inout DefaultValue = FC_BehaviorSpeakingTag())
{
    ECSFunc_FC_BehaviorSpeakingTag::AssignBehaviorSpeakingTag(Entity, DefaultValue);
    return;
}
FC_BehaviorSpeakingTag& ModifyBehaviorSpeakingTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_BehaviorSpeakingTag));
    return local_12.GetComp();
}
FC_BehaviorSpeakingTag& ModifyOrAddBehaviorSpeakingTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_BehaviorSpeakingTag));
    return local_12.GetComp();
}
const FC_BehaviorSpeakingTag& GetBehaviorSpeakingTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_BehaviorSpeakingTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_BehaviorSpeakingTag GetBehaviorSpeakingTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_BehaviorSpeakingTag& local_4 = ECSFunc_FC_BehaviorSpeakingTag::GetBehaviorSpeakingTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_BehaviorSpeakingTag();
}
const FC_BehaviorSpeakingTag GetDefaultedBehaviorSpeakingTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_BehaviorSpeakingTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_BehaviorSpeakingTag);
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
FC_BehaviorSpeakingTag GetDefaultedBehaviorSpeakingTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_BehaviorSpeakingTag::GetDefaultedBehaviorSpeakingTag(Entity);
}
UFUNCTION()
bool RemoveBehaviorSpeakingTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_BehaviorSpeakingTag);
}
}
FECSMonitorRuntimeView __GetMonitorBehaviorSpeakingTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_BehaviorSpeakingTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBehaviorSpeakingTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_BehaviorSpeakingTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBehaviorSpeakingTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_BehaviorSpeakingTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBehaviorSpeakingTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_BehaviorSpeakingTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBehaviorSpeakingTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_BehaviorSpeakingTag, bFixedFrame, bMustHandleAll);
}
void __MonitorBehaviorSpeakingTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_BehaviorSpeakingTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBehaviorSpeakingTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_BehaviorSpeakingTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBehaviorSpeakingTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_BehaviorSpeakingTag, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_CompanionBehaviorInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_CompanionBehaviorInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_CompanionBehaviorInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_CompanionBehaviorInfo
{
int __IndexOf_DistCloseEntities()
{
    return 0;
}
int __IndexOf_ShowBehaviorStringOnHead()
{
    return 1;
}
}
