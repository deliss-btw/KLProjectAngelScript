
namespace __INTENRAL_FC_ReactionInfo_NS
{
    const TECSComponentDerivedPtr<FC_ReactionInfo> DerivedPtr = TECSComponentDerivedPtr<FC_ReactionInfo>();
    const FC_ReactionInfo DefaultValue = FC_ReactionInfo();
}
namespace __INTENRAL_FC_AIGeneratingReactionTag_NS
{
    const TECSComponentDerivedPtr<FC_AIGeneratingReactionTag> DerivedPtr = TECSComponentDerivedPtr<FC_AIGeneratingReactionTag>();
    const FC_AIGeneratingReactionTag DefaultValue = FC_AIGeneratingReactionTag();
}
namespace __INTENRAL_FCE_ClearReactionInfoOnHead_NS
{
    const TECSEventDerivedPtr<FCE_ClearReactionInfoOnHead> DerivedPtr = TECSEventDerivedPtr<FCE_ClearReactionInfoOnHead>();
}
namespace __INTENRAL_FCE_ClearAIGeneratingReactionTag_NS
{
    const TECSEventDerivedPtr<FCE_ClearAIGeneratingReactionTag> DerivedPtr = TECSEventDerivedPtr<FCE_ClearAIGeneratingReactionTag>();

}
struct FC_ReactionInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FString m_InfoOnHead;

    FC_ReactionInfo()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_ReactionInfo(const FC_ReactionInfo &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_InfoOnHead = Other.m_InfoOnHead;
        return;
    }
    FC_ReactionInfo opAssign(const FC_ReactionInfo &inout Other)
    {
        FC_ReactionInfo __r;
        this.SetInfoOnHead(Other.GetInfoOnHead());
        return __r;
    }
    FString GetInfoOnHead() const property
    {
        return this.m_InfoOnHead;
    }
    void SetInfoOnHead(const FString &inout __Value) property
    {
        if ((this.m_InfoOnHead == __Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_InfoOnHead = __Value;
        return;
    }
}

struct FGeneratedReactionData
{
    UPROPERTY()
    FString PromptKeyContent;
    UPROPERTY()
    FString PlayerIntension;
    UPROPERTY()
    FString TraderEmotion;
    UPROPERTY()
    FString ReactionSpeakingContent;
    UPROPERTY()
    FString ReactionAnim;
    UPROPERTY()
    FString ReactionFace;
    UPROPERTY()
    FString ReactionSummary;

    FGeneratedReactionData()
    {
        return;
    }
}

struct FC_AIGeneratingReactionTag : FECSComponent
{
    FC_AIGeneratingReactionTag()
    {
        return;
    }
}

struct FCE_ClearReactionInfoOnHead : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_ClearReactionInfoOnHead()
    {
        return;
    }
}

struct FCE_ClearAIGeneratingReactionTag : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_ClearAIGeneratingReactionTag()
    {
        return;
    }
}

namespace ECSFunc_FC_ReactionInfo
{
UFUNCTION()
bool HasReactionInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ReactionInfo);
}
FC_ReactionInfo& AssignReactionInfo(const FECSEntity &inout Entity, const FC_ReactionInfo &inout DefaultValue = FC_ReactionInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ReactionInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignReactionInfo_BP(const FECSEntity &inout Entity, const FC_ReactionInfo &inout DefaultValue = FC_ReactionInfo())
{
    ECSFunc_FC_ReactionInfo::AssignReactionInfo(Entity, DefaultValue);
    return;
}
FC_ReactionInfo& ModifyReactionInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ReactionInfo));
    return local_12.GetComp();
}
FC_ReactionInfo& ModifyOrAddReactionInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ReactionInfo));
    return local_12.GetComp();
}
const FC_ReactionInfo& GetReactionInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ReactionInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_ReactionInfo GetReactionInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ReactionInfo& local_4 = ECSFunc_FC_ReactionInfo::GetReactionInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ReactionInfo();
}
const FC_ReactionInfo GetDefaultedReactionInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ReactionInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ReactionInfo);
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
FC_ReactionInfo GetDefaultedReactionInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ReactionInfo::GetDefaultedReactionInfo(Entity);
}
UFUNCTION()
bool RemoveReactionInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ReactionInfo);
}
}
FECSMonitorRuntimeView __GetMonitorReactionInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ReactionInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorReactionInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ReactionInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorReactionInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ReactionInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorReactionInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ReactionInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorReactionInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ReactionInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorReactionInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ReactionInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorReactionInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ReactionInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorReactionInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ReactionInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AIGeneratingReactionTag
{
UFUNCTION()
bool HasAIGeneratingReactionTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AIGeneratingReactionTag);
}
FC_AIGeneratingReactionTag& AssignAIGeneratingReactionTag(const FECSEntity &inout Entity, const FC_AIGeneratingReactionTag &inout DefaultValue = FC_AIGeneratingReactionTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AIGeneratingReactionTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAIGeneratingReactionTag_BP(const FECSEntity &inout Entity, const FC_AIGeneratingReactionTag &inout DefaultValue = FC_AIGeneratingReactionTag())
{
    ECSFunc_FC_AIGeneratingReactionTag::AssignAIGeneratingReactionTag(Entity, DefaultValue);
    return;
}
FC_AIGeneratingReactionTag& ModifyAIGeneratingReactionTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AIGeneratingReactionTag));
    return local_12.GetComp();
}
FC_AIGeneratingReactionTag& ModifyOrAddAIGeneratingReactionTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AIGeneratingReactionTag));
    return local_12.GetComp();
}
const FC_AIGeneratingReactionTag& GetAIGeneratingReactionTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AIGeneratingReactionTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_AIGeneratingReactionTag GetAIGeneratingReactionTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AIGeneratingReactionTag& local_4 = ECSFunc_FC_AIGeneratingReactionTag::GetAIGeneratingReactionTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AIGeneratingReactionTag();
}
const FC_AIGeneratingReactionTag GetDefaultedAIGeneratingReactionTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AIGeneratingReactionTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AIGeneratingReactionTag);
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
FC_AIGeneratingReactionTag GetDefaultedAIGeneratingReactionTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AIGeneratingReactionTag::GetDefaultedAIGeneratingReactionTag(Entity);
}
UFUNCTION()
bool RemoveAIGeneratingReactionTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AIGeneratingReactionTag);
}
}
FECSMonitorRuntimeView __GetMonitorAIGeneratingReactionTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AIGeneratingReactionTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIGeneratingReactionTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AIGeneratingReactionTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIGeneratingReactionTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AIGeneratingReactionTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIGeneratingReactionTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AIGeneratingReactionTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIGeneratingReactionTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AIGeneratingReactionTag, bFixedFrame, bMustHandleAll);
}
void __MonitorAIGeneratingReactionTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AIGeneratingReactionTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIGeneratingReactionTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AIGeneratingReactionTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIGeneratingReactionTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AIGeneratingReactionTag, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_ReactionInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_ReactionInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_ReactionInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_ReactionInfo
{
int __IndexOf_InfoOnHead()
{
    return 0;
}
}
