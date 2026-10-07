
namespace __INTENRAL_FC_DialogueNextSectionTag_NS
{
    const TECSComponentDerivedPtr<FC_DialogueNextSectionTag> DerivedPtr = TECSComponentDerivedPtr<FC_DialogueNextSectionTag>();
    const FC_DialogueNextSectionTag DefaultValue = FC_DialogueNextSectionTag();
}
namespace __INTENRAL_FC_DialogueNextSubtitleTag_NS
{
    const TECSComponentDerivedPtr<FC_DialogueNextSubtitleTag> DerivedPtr = TECSComponentDerivedPtr<FC_DialogueNextSubtitleTag>();
    const FC_DialogueNextSubtitleTag DefaultValue = FC_DialogueNextSubtitleTag();
}
namespace __INTENRAL_FC_DialoguePlayFinishedTag_NS
{
    const TECSComponentDerivedPtr<FC_DialoguePlayFinishedTag> DerivedPtr = TECSComponentDerivedPtr<FC_DialoguePlayFinishedTag>();
    const FC_DialoguePlayFinishedTag DefaultValue = FC_DialoguePlayFinishedTag();
}
namespace __INTENRAL_FC_DialoguePausedTag_NS
{
    const TECSComponentDerivedPtr<FC_DialoguePausedTag> DerivedPtr = TECSComponentDerivedPtr<FC_DialoguePausedTag>();
    const FC_DialoguePausedTag DefaultValue = FC_DialoguePausedTag();
}
namespace __INTENRAL_FC_DialogueEndedTag_NS
{
    const TECSComponentDerivedPtr<FC_DialogueEndedTag> DerivedPtr = TECSComponentDerivedPtr<FC_DialogueEndedTag>();
    const FC_DialogueEndedTag DefaultValue = FC_DialogueEndedTag();
}
namespace __INTENRAL_FC_DialogueExecuteActions_NS
{
    const TECSComponentDerivedPtr<FC_DialogueExecuteActions> DerivedPtr = TECSComponentDerivedPtr<FC_DialogueExecuteActions>();
    const FC_DialogueExecuteActions DefaultValue = FC_DialogueExecuteActions();
}
namespace __INTENRAL_FC_DialogueExecuteActionWaitNotify_NS
{
    const TECSComponentDerivedPtr<FC_DialogueExecuteActionWaitNotify> DerivedPtr = TECSComponentDerivedPtr<FC_DialogueExecuteActionWaitNotify>();
    const FC_DialogueExecuteActionWaitNotify DefaultValue = FC_DialogueExecuteActionWaitNotify();
}
namespace __INTENRAL_FC_DialogueSection_NS
{
    const TECSComponentDerivedPtr<FC_DialogueSection> DerivedPtr = TECSComponentDerivedPtr<FC_DialogueSection>();
    const FC_DialogueSection DefaultValue = FC_DialogueSection();
}
namespace __INTENRAL_FC_DialogueSectionIndex_NS
{
    const TECSComponentDerivedPtr<FC_DialogueSectionIndex> DerivedPtr = TECSComponentDerivedPtr<FC_DialogueSectionIndex>();
    const FC_DialogueSectionIndex DefaultValue = FC_DialogueSectionIndex();
}
namespace __INTENRAL_FC_DialogueSectionIndexByClient_NS
{
    const TECSComponentDerivedPtr<FC_DialogueSectionIndexByClient> DerivedPtr = TECSComponentDerivedPtr<FC_DialogueSectionIndexByClient>();
    const FC_DialogueSectionIndexByClient DefaultValue = FC_DialogueSectionIndexByClient();
}
namespace __INTENRAL_FC_DialogueInterruptRequestedTag_NS
{
    const TECSComponentDerivedPtr<FC_DialogueInterruptRequestedTag> DerivedPtr = TECSComponentDerivedPtr<FC_DialogueInterruptRequestedTag>();
    const FC_DialogueInterruptRequestedTag DefaultValue = FC_DialogueInterruptRequestedTag();
}
namespace __INTENRAL_FCE_DialogueRequestInterrupt_NS
{
    const TECSEventDerivedPtr<FCE_DialogueRequestInterrupt> DerivedPtr = TECSEventDerivedPtr<FCE_DialogueRequestInterrupt>();
}
namespace __INTENRAL_FCE_DialogueOptionSelectClient_NS
{
    const TECSEventDerivedPtr<FCE_DialogueOptionSelectClient> DerivedPtr = TECSEventDerivedPtr<FCE_DialogueOptionSelectClient>();
}
namespace __INTENRAL_FCE_DialogueOptionSelect_NS
{
    const TECSEventDerivedPtr<FCE_DialogueOptionSelect> DerivedPtr = TECSEventDerivedPtr<FCE_DialogueOptionSelect>();
}
namespace __INTENRAL_FCE_DialogueActionNotifyResult_NS
{
    const TECSEventDerivedPtr<FCE_DialogueActionNotifyResult> DerivedPtr = TECSEventDerivedPtr<FCE_DialogueActionNotifyResult>();
}
namespace __INTENRAL_FCE_DialogueRequestEnd_NS
{
    const TECSEventDerivedPtr<FCE_DialogueRequestEnd> DerivedPtr = TECSEventDerivedPtr<FCE_DialogueRequestEnd>();
}
namespace __INTENRAL_FCE_NarrationDialogueStart_NS
{
    const TECSEventDerivedPtr<FCE_NarrationDialogueStart> DerivedPtr = TECSEventDerivedPtr<FCE_NarrationDialogueStart>();
}
namespace __INTENRAL_FCE_DialogueUpdateUI_NS
{
    const TECSEventDerivedPtr<FCE_DialogueUpdateUI> DerivedPtr = TECSEventDerivedPtr<FCE_DialogueUpdateUI>();

}
struct FC_DialogueNextSectionTag : FECSComponent
{
    FC_DialogueNextSectionTag()
    {
        return;
    }
}

struct FC_DialogueNextSubtitleTag : FECSComponent
{
    FC_DialogueNextSubtitleTag()
    {
        return;
    }
}

struct FC_DialoguePlayFinishedTag : FECSComponent
{
    FC_DialoguePlayFinishedTag()
    {
        return;
    }
}

struct FC_DialoguePausedTag : FECSComponent
{
    FC_DialoguePausedTag()
    {
        return;
    }
}

struct FC_DialogueEndedTag : FECSComponent
{
    FC_DialogueEndedTag()
    {
        return;
    }
}

struct FCE_DialogueRequestInterrupt : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity PlayerEntity;
    UPROPERTY()
    FECSEntity InteractTarget;

    FCE_DialogueRequestInterrupt()
    {
        return;
    }
}

struct FCE_DialogueOptionSelectClient : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    uint OptionNodeId;
    UPROPERTY()
    TDataObjectPtr<FDialogueConfig> AttachedDialogueConfig;


}

struct FCE_DialogueOptionSelect : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    uint OptionNodeId;
    UPROPERTY()
    TDataObjectPtr<FDialogueConfig> AttachedDialogueConfig;


    bool Validate() const
    {
        return this.OptionNodeId != 0 || this.AttachedDialogueConfig.IsSet();
    }
}

struct FC_DialogueExecuteActions : FECSComponent
{
    UPROPERTY()
    uint OptionNodeId;
    UPROPERTY()
    TArray<uint> ActionNodeIds;
    UPROPERTY()
    FDialogueSection Section;
    UPROPERTY()
    bool bActionFailed;
    UPROPERTY()
    bool bDeferredActionsExecuted = false;


}

struct FC_DialogueExecuteActionWaitNotify : FECSComponent
{
    UPROPERTY()
    uint ActionNodeId;
    UPROPERTY()
    bool bActionNodeFinished = true;
    UPROPERTY()
    int EntryID = -1;
    UPROPERTY()
    bool bExecutionEntryCompleted = true;
    UPROPERTY()
    FFPTime TimeoutTime;


}

struct FCE_DialogueActionNotifyResult : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    bool bSuccess;


}

struct FCE_DialogueRequestEnd : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FName DialogueName;
    UPROPERTY()
    FECSEntity PlayerEntity;
    UPROPERTY()
    FECSEntity DialogueContextEntity;
    UPROPERTY()
    bool bInterrupted;


    bool Validate() const
    {
        return true;
    }
}

struct FC_DialogueSection : FECSComponent
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FDialogueSection m_Section;

    FC_DialogueSection()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_DialogueSection(const FC_DialogueSection &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_Section = Other.m_Section;
        return;
    }
    FC_DialogueSection opAssign(const FC_DialogueSection &inout Other)
    {
        FC_DialogueSection __r;
        this.SetSection(Other.GetSection());
        return __r;
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
}

struct FC_DialogueSectionIndex : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_SubtitleIndex;
    UPROPERTY()
    bool m_bOutofDialogueRange;

    FC_DialogueSectionIndex()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_DialogueSectionIndex(const FC_DialogueSectionIndex &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_DialogueSectionIndex opAssign(const FC_DialogueSectionIndex &inout Other)
    {
        FC_DialogueSectionIndex __r;
        this.SetSubtitleIndex(Other.GetSubtitleIndex());
        this.SetbOutofDialogueRange(Other.GetbOutofDialogueRange());
        return __r;
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
        this.__MarkDirty(0);
        this.m_SubtitleIndex = __Value;
        return;
    }
    bool GetbOutofDialogueRange() const property
    {
        return this.m_bOutofDialogueRange;
    }
    void SetbOutofDialogueRange(const bool __Value) property
    {
        if (!(this.m_bOutofDialogueRange) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bOutofDialogueRange = __Value;
        return;
    }
}

struct FC_DialogueSectionIndexByClient : FECSComponent
{
    UPROPERTY()
    int SubtitleIndex = -1;


}

struct FC_DialogueInterruptRequestedTag : FECSComponent
{
    FC_DialogueInterruptRequestedTag()
    {
        return;
    }
}

struct FCE_NarrationDialogueStart : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TDataObjectPtr<FNarrationDialogueConfig> DialogueConfig;

    FCE_NarrationDialogueStart()
    {
        return;
    }
}

struct FCE_DialogueUpdateUI : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    bool bUpdateSubtitle = false;
    UPROPERTY()
    FDialogueSubtitle Subtitle;
    UPROPERTY()
    bool bUpdateOptions = false;
    UPROPERTY()
    TArray<FDialogueOptionInfo> Options;


}

namespace ECSFunc_FC_DialogueNextSectionTag
{
UFUNCTION()
bool HasDialogueNextSectionTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DialogueNextSectionTag);
}
FC_DialogueNextSectionTag& AssignDialogueNextSectionTag(const FECSEntity &inout Entity, const FC_DialogueNextSectionTag &inout DefaultValue = FC_DialogueNextSectionTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DialogueNextSectionTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDialogueNextSectionTag_BP(const FECSEntity &inout Entity, const FC_DialogueNextSectionTag &inout DefaultValue = FC_DialogueNextSectionTag())
{
    ECSFunc_FC_DialogueNextSectionTag::AssignDialogueNextSectionTag(Entity, DefaultValue);
    return;
}
FC_DialogueNextSectionTag& ModifyDialogueNextSectionTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DialogueNextSectionTag));
    return local_12.GetComp();
}
FC_DialogueNextSectionTag& ModifyOrAddDialogueNextSectionTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DialogueNextSectionTag));
    return local_12.GetComp();
}
const FC_DialogueNextSectionTag& GetDialogueNextSectionTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DialogueNextSectionTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_DialogueNextSectionTag GetDialogueNextSectionTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DialogueNextSectionTag& local_4 = ECSFunc_FC_DialogueNextSectionTag::GetDialogueNextSectionTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DialogueNextSectionTag();
}
const FC_DialogueNextSectionTag GetDefaultedDialogueNextSectionTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DialogueNextSectionTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DialogueNextSectionTag);
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
FC_DialogueNextSectionTag GetDefaultedDialogueNextSectionTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DialogueNextSectionTag::GetDefaultedDialogueNextSectionTag(Entity);
}
UFUNCTION()
bool RemoveDialogueNextSectionTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DialogueNextSectionTag);
}
}
FECSMonitorRuntimeView __GetMonitorDialogueNextSectionTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DialogueNextSectionTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueNextSectionTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DialogueNextSectionTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueNextSectionTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DialogueNextSectionTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueNextSectionTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DialogueNextSectionTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueNextSectionTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DialogueNextSectionTag, bFixedFrame, bMustHandleAll);
}
void __MonitorDialogueNextSectionTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DialogueNextSectionTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDialogueNextSectionTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DialogueNextSectionTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDialogueNextSectionTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DialogueNextSectionTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DialogueNextSubtitleTag
{
UFUNCTION()
bool HasDialogueNextSubtitleTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DialogueNextSubtitleTag);
}
FC_DialogueNextSubtitleTag& AssignDialogueNextSubtitleTag(const FECSEntity &inout Entity, const FC_DialogueNextSubtitleTag &inout DefaultValue = FC_DialogueNextSubtitleTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DialogueNextSubtitleTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDialogueNextSubtitleTag_BP(const FECSEntity &inout Entity, const FC_DialogueNextSubtitleTag &inout DefaultValue = FC_DialogueNextSubtitleTag())
{
    ECSFunc_FC_DialogueNextSubtitleTag::AssignDialogueNextSubtitleTag(Entity, DefaultValue);
    return;
}
FC_DialogueNextSubtitleTag& ModifyDialogueNextSubtitleTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DialogueNextSubtitleTag));
    return local_12.GetComp();
}
FC_DialogueNextSubtitleTag& ModifyOrAddDialogueNextSubtitleTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DialogueNextSubtitleTag));
    return local_12.GetComp();
}
const FC_DialogueNextSubtitleTag& GetDialogueNextSubtitleTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DialogueNextSubtitleTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_DialogueNextSubtitleTag GetDialogueNextSubtitleTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DialogueNextSubtitleTag& local_4 = ECSFunc_FC_DialogueNextSubtitleTag::GetDialogueNextSubtitleTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DialogueNextSubtitleTag();
}
const FC_DialogueNextSubtitleTag GetDefaultedDialogueNextSubtitleTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DialogueNextSubtitleTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DialogueNextSubtitleTag);
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
FC_DialogueNextSubtitleTag GetDefaultedDialogueNextSubtitleTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DialogueNextSubtitleTag::GetDefaultedDialogueNextSubtitleTag(Entity);
}
UFUNCTION()
bool RemoveDialogueNextSubtitleTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DialogueNextSubtitleTag);
}
}
FECSMonitorRuntimeView __GetMonitorDialogueNextSubtitleTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DialogueNextSubtitleTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueNextSubtitleTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DialogueNextSubtitleTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueNextSubtitleTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DialogueNextSubtitleTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueNextSubtitleTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DialogueNextSubtitleTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueNextSubtitleTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DialogueNextSubtitleTag, bFixedFrame, bMustHandleAll);
}
void __MonitorDialogueNextSubtitleTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DialogueNextSubtitleTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDialogueNextSubtitleTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DialogueNextSubtitleTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDialogueNextSubtitleTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DialogueNextSubtitleTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DialoguePlayFinishedTag
{
UFUNCTION()
bool HasDialoguePlayFinishedTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DialoguePlayFinishedTag);
}
FC_DialoguePlayFinishedTag& AssignDialoguePlayFinishedTag(const FECSEntity &inout Entity, const FC_DialoguePlayFinishedTag &inout DefaultValue = FC_DialoguePlayFinishedTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DialoguePlayFinishedTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDialoguePlayFinishedTag_BP(const FECSEntity &inout Entity, const FC_DialoguePlayFinishedTag &inout DefaultValue = FC_DialoguePlayFinishedTag())
{
    ECSFunc_FC_DialoguePlayFinishedTag::AssignDialoguePlayFinishedTag(Entity, DefaultValue);
    return;
}
FC_DialoguePlayFinishedTag& ModifyDialoguePlayFinishedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DialoguePlayFinishedTag));
    return local_12.GetComp();
}
FC_DialoguePlayFinishedTag& ModifyOrAddDialoguePlayFinishedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DialoguePlayFinishedTag));
    return local_12.GetComp();
}
const FC_DialoguePlayFinishedTag& GetDialoguePlayFinishedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DialoguePlayFinishedTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_DialoguePlayFinishedTag GetDialoguePlayFinishedTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DialoguePlayFinishedTag& local_4 = ECSFunc_FC_DialoguePlayFinishedTag::GetDialoguePlayFinishedTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DialoguePlayFinishedTag();
}
const FC_DialoguePlayFinishedTag GetDefaultedDialoguePlayFinishedTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DialoguePlayFinishedTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DialoguePlayFinishedTag);
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
FC_DialoguePlayFinishedTag GetDefaultedDialoguePlayFinishedTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DialoguePlayFinishedTag::GetDefaultedDialoguePlayFinishedTag(Entity);
}
UFUNCTION()
bool RemoveDialoguePlayFinishedTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DialoguePlayFinishedTag);
}
}
FECSMonitorRuntimeView __GetMonitorDialoguePlayFinishedTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DialoguePlayFinishedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialoguePlayFinishedTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DialoguePlayFinishedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialoguePlayFinishedTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DialoguePlayFinishedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialoguePlayFinishedTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DialoguePlayFinishedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialoguePlayFinishedTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DialoguePlayFinishedTag, bFixedFrame, bMustHandleAll);
}
void __MonitorDialoguePlayFinishedTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DialoguePlayFinishedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDialoguePlayFinishedTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DialoguePlayFinishedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDialoguePlayFinishedTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DialoguePlayFinishedTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DialoguePausedTag
{
UFUNCTION()
bool HasDialoguePausedTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DialoguePausedTag);
}
FC_DialoguePausedTag& AssignDialoguePausedTag(const FECSEntity &inout Entity, const FC_DialoguePausedTag &inout DefaultValue = FC_DialoguePausedTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DialoguePausedTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDialoguePausedTag_BP(const FECSEntity &inout Entity, const FC_DialoguePausedTag &inout DefaultValue = FC_DialoguePausedTag())
{
    ECSFunc_FC_DialoguePausedTag::AssignDialoguePausedTag(Entity, DefaultValue);
    return;
}
FC_DialoguePausedTag& ModifyDialoguePausedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DialoguePausedTag));
    return local_12.GetComp();
}
FC_DialoguePausedTag& ModifyOrAddDialoguePausedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DialoguePausedTag));
    return local_12.GetComp();
}
const FC_DialoguePausedTag& GetDialoguePausedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DialoguePausedTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_DialoguePausedTag GetDialoguePausedTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DialoguePausedTag& local_4 = ECSFunc_FC_DialoguePausedTag::GetDialoguePausedTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DialoguePausedTag();
}
const FC_DialoguePausedTag GetDefaultedDialoguePausedTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DialoguePausedTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DialoguePausedTag);
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
FC_DialoguePausedTag GetDefaultedDialoguePausedTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DialoguePausedTag::GetDefaultedDialoguePausedTag(Entity);
}
UFUNCTION()
bool RemoveDialoguePausedTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DialoguePausedTag);
}
}
FECSMonitorRuntimeView __GetMonitorDialoguePausedTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DialoguePausedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialoguePausedTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DialoguePausedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialoguePausedTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DialoguePausedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialoguePausedTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DialoguePausedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialoguePausedTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DialoguePausedTag, bFixedFrame, bMustHandleAll);
}
void __MonitorDialoguePausedTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DialoguePausedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDialoguePausedTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DialoguePausedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDialoguePausedTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DialoguePausedTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DialogueEndedTag
{
UFUNCTION()
bool HasDialogueEndedTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DialogueEndedTag);
}
FC_DialogueEndedTag& AssignDialogueEndedTag(const FECSEntity &inout Entity, const FC_DialogueEndedTag &inout DefaultValue = FC_DialogueEndedTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DialogueEndedTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDialogueEndedTag_BP(const FECSEntity &inout Entity, const FC_DialogueEndedTag &inout DefaultValue = FC_DialogueEndedTag())
{
    ECSFunc_FC_DialogueEndedTag::AssignDialogueEndedTag(Entity, DefaultValue);
    return;
}
FC_DialogueEndedTag& ModifyDialogueEndedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DialogueEndedTag));
    return local_12.GetComp();
}
FC_DialogueEndedTag& ModifyOrAddDialogueEndedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DialogueEndedTag));
    return local_12.GetComp();
}
const FC_DialogueEndedTag& GetDialogueEndedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DialogueEndedTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_DialogueEndedTag GetDialogueEndedTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DialogueEndedTag& local_4 = ECSFunc_FC_DialogueEndedTag::GetDialogueEndedTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DialogueEndedTag();
}
const FC_DialogueEndedTag GetDefaultedDialogueEndedTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DialogueEndedTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DialogueEndedTag);
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
FC_DialogueEndedTag GetDefaultedDialogueEndedTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DialogueEndedTag::GetDefaultedDialogueEndedTag(Entity);
}
UFUNCTION()
bool RemoveDialogueEndedTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DialogueEndedTag);
}
}
FECSMonitorRuntimeView __GetMonitorDialogueEndedTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DialogueEndedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueEndedTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DialogueEndedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueEndedTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DialogueEndedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueEndedTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DialogueEndedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueEndedTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DialogueEndedTag, bFixedFrame, bMustHandleAll);
}
void __MonitorDialogueEndedTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DialogueEndedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDialogueEndedTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DialogueEndedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDialogueEndedTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DialogueEndedTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DialogueExecuteActions
{
UFUNCTION()
bool HasDialogueExecuteActions(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DialogueExecuteActions);
}
FC_DialogueExecuteActions& AssignDialogueExecuteActions(const FECSEntity &inout Entity, const FC_DialogueExecuteActions &inout DefaultValue = FC_DialogueExecuteActions())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DialogueExecuteActions, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDialogueExecuteActions_BP(const FECSEntity &inout Entity, const FC_DialogueExecuteActions &inout DefaultValue = FC_DialogueExecuteActions())
{
    ECSFunc_FC_DialogueExecuteActions::AssignDialogueExecuteActions(Entity, DefaultValue);
    return;
}
FC_DialogueExecuteActions& ModifyDialogueExecuteActions(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DialogueExecuteActions));
    return local_12.GetComp();
}
FC_DialogueExecuteActions& ModifyOrAddDialogueExecuteActions(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DialogueExecuteActions));
    return local_12.GetComp();
}
const FC_DialogueExecuteActions& GetDialogueExecuteActions(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DialogueExecuteActions));
    return local_12.GetComp();
}
UFUNCTION()
FC_DialogueExecuteActions GetDialogueExecuteActions_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_DialogueExecuteActions __r;
    bValid = false;
    bValid = ECSFunc_FC_DialogueExecuteActions::GetDialogueExecuteActions(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_DialogueExecuteActions GetDefaultedDialogueExecuteActions(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DialogueExecuteActions __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DialogueExecuteActions);
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
FC_DialogueExecuteActions GetDefaultedDialogueExecuteActions_BP(const FECSEntity &inout Entity)
{
    FC_DialogueExecuteActions __r;
    return __r;
}
UFUNCTION()
bool RemoveDialogueExecuteActions(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DialogueExecuteActions);
}
}
FECSMonitorRuntimeView __GetMonitorDialogueExecuteActionsOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DialogueExecuteActions, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueExecuteActionsOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DialogueExecuteActions, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueExecuteActionsOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DialogueExecuteActions, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueExecuteActionsOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DialogueExecuteActions, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueExecuteActionsOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DialogueExecuteActions, bFixedFrame, bMustHandleAll);
}
void __MonitorDialogueExecuteActionsLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DialogueExecuteActions, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDialogueExecuteActionsActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DialogueExecuteActions, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDialogueExecuteActionsModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DialogueExecuteActions, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DialogueExecuteActionWaitNotify
{
UFUNCTION()
bool HasDialogueExecuteActionWaitNotify(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DialogueExecuteActionWaitNotify);
}
FC_DialogueExecuteActionWaitNotify& AssignDialogueExecuteActionWaitNotify(const FECSEntity &inout Entity, const FC_DialogueExecuteActionWaitNotify &inout DefaultValue = FC_DialogueExecuteActionWaitNotify())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DialogueExecuteActionWaitNotify, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDialogueExecuteActionWaitNotify_BP(const FECSEntity &inout Entity, const FC_DialogueExecuteActionWaitNotify &inout DefaultValue = FC_DialogueExecuteActionWaitNotify())
{
    ECSFunc_FC_DialogueExecuteActionWaitNotify::AssignDialogueExecuteActionWaitNotify(Entity, DefaultValue);
    return;
}
FC_DialogueExecuteActionWaitNotify& ModifyDialogueExecuteActionWaitNotify(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DialogueExecuteActionWaitNotify));
    return local_12.GetComp();
}
FC_DialogueExecuteActionWaitNotify& ModifyOrAddDialogueExecuteActionWaitNotify(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DialogueExecuteActionWaitNotify));
    return local_12.GetComp();
}
const FC_DialogueExecuteActionWaitNotify& GetDialogueExecuteActionWaitNotify(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DialogueExecuteActionWaitNotify));
    return local_12.GetComp();
}
UFUNCTION()
FC_DialogueExecuteActionWaitNotify GetDialogueExecuteActionWaitNotify_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_DialogueExecuteActionWaitNotify __r;
    bValid = false;
    bValid = ECSFunc_FC_DialogueExecuteActionWaitNotify::GetDialogueExecuteActionWaitNotify(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_DialogueExecuteActionWaitNotify GetDefaultedDialogueExecuteActionWaitNotify(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DialogueExecuteActionWaitNotify __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DialogueExecuteActionWaitNotify);
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
FC_DialogueExecuteActionWaitNotify GetDefaultedDialogueExecuteActionWaitNotify_BP(const FECSEntity &inout Entity)
{
    FC_DialogueExecuteActionWaitNotify __r;
    return __r;
}
UFUNCTION()
bool RemoveDialogueExecuteActionWaitNotify(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DialogueExecuteActionWaitNotify);
}
}
FECSMonitorRuntimeView __GetMonitorDialogueExecuteActionWaitNotifyOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DialogueExecuteActionWaitNotify, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueExecuteActionWaitNotifyOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DialogueExecuteActionWaitNotify, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueExecuteActionWaitNotifyOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DialogueExecuteActionWaitNotify, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueExecuteActionWaitNotifyOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DialogueExecuteActionWaitNotify, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueExecuteActionWaitNotifyOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DialogueExecuteActionWaitNotify, bFixedFrame, bMustHandleAll);
}
void __MonitorDialogueExecuteActionWaitNotifyLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DialogueExecuteActionWaitNotify, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDialogueExecuteActionWaitNotifyActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DialogueExecuteActionWaitNotify, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDialogueExecuteActionWaitNotifyModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DialogueExecuteActionWaitNotify, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DialogueSection
{
UFUNCTION()
bool HasDialogueSection(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DialogueSection);
}
FC_DialogueSection& AssignDialogueSection(const FECSEntity &inout Entity, const FC_DialogueSection &inout DefaultValue = FC_DialogueSection())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DialogueSection, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDialogueSection_BP(const FECSEntity &inout Entity, const FC_DialogueSection &inout DefaultValue = FC_DialogueSection())
{
    ECSFunc_FC_DialogueSection::AssignDialogueSection(Entity, DefaultValue);
    return;
}
FC_DialogueSection& ModifyDialogueSection(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DialogueSection));
    return local_12.GetComp();
}
FC_DialogueSection& ModifyOrAddDialogueSection(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DialogueSection));
    return local_12.GetComp();
}
const FC_DialogueSection& GetDialogueSection(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DialogueSection));
    return local_12.GetComp();
}
UFUNCTION()
FC_DialogueSection GetDialogueSection_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DialogueSection& local_4 = ECSFunc_FC_DialogueSection::GetDialogueSection(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DialogueSection();
}
const FC_DialogueSection GetDefaultedDialogueSection(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DialogueSection __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DialogueSection);
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
FC_DialogueSection GetDefaultedDialogueSection_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DialogueSection::GetDefaultedDialogueSection(Entity);
}
UFUNCTION()
bool RemoveDialogueSection(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DialogueSection);
}
}
FECSMonitorRuntimeView __GetMonitorDialogueSectionOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DialogueSection, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueSectionOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DialogueSection, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueSectionOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DialogueSection, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueSectionOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DialogueSection, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueSectionOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DialogueSection, bFixedFrame, bMustHandleAll);
}
void __MonitorDialogueSectionLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DialogueSection, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDialogueSectionActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DialogueSection, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDialogueSectionModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DialogueSection, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DialogueSectionIndex
{
UFUNCTION()
bool HasDialogueSectionIndex(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DialogueSectionIndex);
}
FC_DialogueSectionIndex& AssignDialogueSectionIndex(const FECSEntity &inout Entity, const FC_DialogueSectionIndex &inout DefaultValue = FC_DialogueSectionIndex())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DialogueSectionIndex, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDialogueSectionIndex_BP(const FECSEntity &inout Entity, const FC_DialogueSectionIndex &inout DefaultValue = FC_DialogueSectionIndex())
{
    ECSFunc_FC_DialogueSectionIndex::AssignDialogueSectionIndex(Entity, DefaultValue);
    return;
}
FC_DialogueSectionIndex& ModifyDialogueSectionIndex(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DialogueSectionIndex));
    return local_12.GetComp();
}
FC_DialogueSectionIndex& ModifyOrAddDialogueSectionIndex(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DialogueSectionIndex));
    return local_12.GetComp();
}
const FC_DialogueSectionIndex& GetDialogueSectionIndex(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DialogueSectionIndex));
    return local_12.GetComp();
}
UFUNCTION()
FC_DialogueSectionIndex GetDialogueSectionIndex_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DialogueSectionIndex& local_4 = ECSFunc_FC_DialogueSectionIndex::GetDialogueSectionIndex(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DialogueSectionIndex();
}
const FC_DialogueSectionIndex GetDefaultedDialogueSectionIndex(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DialogueSectionIndex __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DialogueSectionIndex);
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
FC_DialogueSectionIndex GetDefaultedDialogueSectionIndex_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DialogueSectionIndex::GetDefaultedDialogueSectionIndex(Entity);
}
UFUNCTION()
bool RemoveDialogueSectionIndex(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DialogueSectionIndex);
}
}
FECSMonitorRuntimeView __GetMonitorDialogueSectionIndexOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DialogueSectionIndex, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueSectionIndexOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DialogueSectionIndex, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueSectionIndexOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DialogueSectionIndex, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueSectionIndexOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DialogueSectionIndex, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueSectionIndexOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DialogueSectionIndex, bFixedFrame, bMustHandleAll);
}
void __MonitorDialogueSectionIndexLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DialogueSectionIndex, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDialogueSectionIndexActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DialogueSectionIndex, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDialogueSectionIndexModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DialogueSectionIndex, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DialogueSectionIndexByClient
{
UFUNCTION()
bool HasDialogueSectionIndexByClient(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DialogueSectionIndexByClient);
}
FC_DialogueSectionIndexByClient& AssignDialogueSectionIndexByClient(const FECSEntity &inout Entity, const FC_DialogueSectionIndexByClient &inout DefaultValue = FC_DialogueSectionIndexByClient())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DialogueSectionIndexByClient, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDialogueSectionIndexByClient_BP(const FECSEntity &inout Entity, const FC_DialogueSectionIndexByClient &inout DefaultValue = FC_DialogueSectionIndexByClient())
{
    ECSFunc_FC_DialogueSectionIndexByClient::AssignDialogueSectionIndexByClient(Entity, DefaultValue);
    return;
}
FC_DialogueSectionIndexByClient& ModifyDialogueSectionIndexByClient(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DialogueSectionIndexByClient));
    return local_12.GetComp();
}
FC_DialogueSectionIndexByClient& ModifyOrAddDialogueSectionIndexByClient(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DialogueSectionIndexByClient));
    return local_12.GetComp();
}
const FC_DialogueSectionIndexByClient& GetDialogueSectionIndexByClient(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DialogueSectionIndexByClient));
    return local_12.GetComp();
}
UFUNCTION()
FC_DialogueSectionIndexByClient GetDialogueSectionIndexByClient_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DialogueSectionIndexByClient& local_4 = ECSFunc_FC_DialogueSectionIndexByClient::GetDialogueSectionIndexByClient(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DialogueSectionIndexByClient();
}
const FC_DialogueSectionIndexByClient GetDefaultedDialogueSectionIndexByClient(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DialogueSectionIndexByClient __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DialogueSectionIndexByClient);
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
FC_DialogueSectionIndexByClient GetDefaultedDialogueSectionIndexByClient_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DialogueSectionIndexByClient::GetDefaultedDialogueSectionIndexByClient(Entity);
}
UFUNCTION()
bool RemoveDialogueSectionIndexByClient(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DialogueSectionIndexByClient);
}
}
FECSMonitorRuntimeView __GetMonitorDialogueSectionIndexByClientOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DialogueSectionIndexByClient, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueSectionIndexByClientOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DialogueSectionIndexByClient, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueSectionIndexByClientOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DialogueSectionIndexByClient, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueSectionIndexByClientOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DialogueSectionIndexByClient, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueSectionIndexByClientOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DialogueSectionIndexByClient, bFixedFrame, bMustHandleAll);
}
void __MonitorDialogueSectionIndexByClientLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DialogueSectionIndexByClient, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDialogueSectionIndexByClientActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DialogueSectionIndexByClient, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDialogueSectionIndexByClientModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DialogueSectionIndexByClient, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DialogueInterruptRequestedTag
{
UFUNCTION()
bool HasDialogueInterruptRequestedTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DialogueInterruptRequestedTag);
}
FC_DialogueInterruptRequestedTag& AssignDialogueInterruptRequestedTag(const FECSEntity &inout Entity, const FC_DialogueInterruptRequestedTag &inout DefaultValue = FC_DialogueInterruptRequestedTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DialogueInterruptRequestedTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDialogueInterruptRequestedTag_BP(const FECSEntity &inout Entity, const FC_DialogueInterruptRequestedTag &inout DefaultValue = FC_DialogueInterruptRequestedTag())
{
    ECSFunc_FC_DialogueInterruptRequestedTag::AssignDialogueInterruptRequestedTag(Entity, DefaultValue);
    return;
}
FC_DialogueInterruptRequestedTag& ModifyDialogueInterruptRequestedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DialogueInterruptRequestedTag));
    return local_12.GetComp();
}
FC_DialogueInterruptRequestedTag& ModifyOrAddDialogueInterruptRequestedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DialogueInterruptRequestedTag));
    return local_12.GetComp();
}
const FC_DialogueInterruptRequestedTag& GetDialogueInterruptRequestedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DialogueInterruptRequestedTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_DialogueInterruptRequestedTag GetDialogueInterruptRequestedTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DialogueInterruptRequestedTag& local_4 = ECSFunc_FC_DialogueInterruptRequestedTag::GetDialogueInterruptRequestedTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DialogueInterruptRequestedTag();
}
const FC_DialogueInterruptRequestedTag GetDefaultedDialogueInterruptRequestedTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DialogueInterruptRequestedTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DialogueInterruptRequestedTag);
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
FC_DialogueInterruptRequestedTag GetDefaultedDialogueInterruptRequestedTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DialogueInterruptRequestedTag::GetDefaultedDialogueInterruptRequestedTag(Entity);
}
UFUNCTION()
bool RemoveDialogueInterruptRequestedTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DialogueInterruptRequestedTag);
}
}
FECSMonitorRuntimeView __GetMonitorDialogueInterruptRequestedTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DialogueInterruptRequestedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueInterruptRequestedTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DialogueInterruptRequestedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueInterruptRequestedTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DialogueInterruptRequestedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueInterruptRequestedTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DialogueInterruptRequestedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDialogueInterruptRequestedTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DialogueInterruptRequestedTag, bFixedFrame, bMustHandleAll);
}
void __MonitorDialogueInterruptRequestedTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DialogueInterruptRequestedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDialogueInterruptRequestedTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DialogueInterruptRequestedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDialogueInterruptRequestedTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DialogueInterruptRequestedTag, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FC_DialogueSection &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FC_DialogueSection &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_DialogueSection &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_DialogueSection
{
int __IndexOf_Section()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_DialogueSectionIndex &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_DialogueSectionIndex &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_DialogueSectionIndex &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_DialogueSectionIndex
{
int __IndexOf_SubtitleIndex()
{
    return 0;
}
int __IndexOf_bOutofDialogueRange()
{
    return 1;
}
}
