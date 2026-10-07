
namespace __INTENRAL_FC_LogicVisualComponentToggleDelayHidden_NS
{
    const TECSComponentDerivedPtr<FC_LogicVisualComponentToggleDelayHidden> DerivedPtr = TECSComponentDerivedPtr<FC_LogicVisualComponentToggleDelayHidden>();
    const FC_LogicVisualComponentToggleDelayHidden DefaultValue = FC_LogicVisualComponentToggleDelayHidden();
}
namespace __INTENRAL_FC_PresentationVisualComponentToggleDelayHidden_NS
{
    const TECSComponentDerivedPtr<FC_PresentationVisualComponentToggleDelayHidden> DerivedPtr = TECSComponentDerivedPtr<FC_PresentationVisualComponentToggleDelayHidden>();
    const FC_PresentationVisualComponentToggleDelayHidden DefaultValue = FC_PresentationVisualComponentToggleDelayHidden();
}
namespace __INTENRAL_FC_LogicVisualComponentToggleDitherStarted_NS
{
    const TECSComponentDerivedPtr<FC_LogicVisualComponentToggleDitherStarted> DerivedPtr = TECSComponentDerivedPtr<FC_LogicVisualComponentToggleDitherStarted>();
    const FC_LogicVisualComponentToggleDitherStarted DefaultValue = FC_LogicVisualComponentToggleDitherStarted();
}
namespace __INTENRAL_FC_PresentationVisualComponentToggleDitherStarted_NS
{
    const TECSComponentDerivedPtr<FC_PresentationVisualComponentToggleDitherStarted> DerivedPtr = TECSComponentDerivedPtr<FC_PresentationVisualComponentToggleDitherStarted>();
    const FC_PresentationVisualComponentToggleDitherStarted DefaultValue = FC_PresentationVisualComponentToggleDitherStarted();
}
namespace __INTENRAL_FCE_StartPresentationVisualComponentToggleDelayHidden_NS
{
    const TECSEventDerivedPtr<FCE_StartPresentationVisualComponentToggleDelayHidden> DerivedPtr = TECSEventDerivedPtr<FCE_StartPresentationVisualComponentToggleDelayHidden>();

}
struct FDelayHiddenTaskItem
{
    UPROPERTY()
    FName m_LogicName;
    UPROPERTY()
    FFPTime m_TargetTime;

    FDelayHiddenTaskItem()
    {
        return;
    }
    FName GetLogicName() const property
    {
        return this;
    }
    void SetLogicName(const FName &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    const FFPTime GetTargetTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetTargetTime() property
    {
        FFPTime __r;
        return __r;
    }
    void SetTargetTime(const FFPTime &inout __Value) property
    {
        this.m_TargetTime = __Value;
        return;
    }
}

struct FC_LogicVisualComponentToggleDelayHidden : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FFPTime m_NextTargetTime;
    UPROPERTY()
    TArray<FDelayHiddenTaskItem> m_DelayTaskItems;

    FC_LogicVisualComponentToggleDelayHidden()
    {
        this.m_NextTargetTime = -1;
        this.__InitDirtyFlags();
        return;
    }
    FC_LogicVisualComponentToggleDelayHidden(const FC_LogicVisualComponentToggleDelayHidden &inout Other)
    {
        this.m_NextTargetTime = -1;
        this.__InitDirtyFlags();
        this.m_NextTargetTime = Other.m_NextTargetTime;
        this.m_DelayTaskItems = Other.m_DelayTaskItems;
        return;
    }
    FC_LogicVisualComponentToggleDelayHidden opAssign(const FC_LogicVisualComponentToggleDelayHidden &inout Other)
    {
        FC_LogicVisualComponentToggleDelayHidden __r;
        this.SetNextTargetTime(Other.GetNextTargetTime());
        this.SetDelayTaskItems(Other.GetDelayTaskItems());
        return __r;
    }
    void AddDelayTaskItem(const FName &inout LogicName, const FFPTime &inout TargetTime)
    {
        int local_1 = -1;
        int local_3 = 0;
        for (; local_3 < this.GetDelayTaskItems().Num(); ++local_3)
        {
            if ((this.GetDelayTaskItems()[local_3].GetLogicName() == LogicName))
            {
                local_1 = local_3;
                break;
            }
        }
        if (local_1 == -1)
        {
            FDelayHiddenTaskItem local_12;
            local_12.SetLogicName(LogicName);
            local_12.SetTargetTime(TargetTime);
            local_1 = this.GetModify_DelayTaskItems().Add(local_12);
        }
        else
        {
            this.GetModify_DelayTaskItems()[local_1].SetTargetTime(TargetTime);
        }
        if ((FFPTime(this.GetNextTargetTime()) == -1.0) || (TargetTime.opCmp(this.GetNextTargetTime()) < 0))
        {
            this.SetNextTargetTime(TargetTime);
        }
        return;
    }
    bool ExecuteTaskAndUpdateNextTargetTime(const FFPTime &inout CurrentTime, const FECSEntity &inout Entity, const FName &inout InstigatorName)
    {
        int local_1 = 0;
        while (local_1 >= 0 && (local_1 < this.GetDelayTaskItems().Num()))
        {
            while (local_1 >= 0 && (local_1 < this.GetDelayTaskItems().Num()) && ((FFPTime(this.GetDelayTaskItems()[local_1].GetTargetTime()).opCmp(CurrentTime) <= 0)))
            {
                FVisualComponentToggleUtils::SetVisualComponentHidden(Entity, this.GetDelayTaskItems()[local_1].GetLogicName(), true, InstigatorName);
                this.GetModify_DelayTaskItems().RemoveAtSwap(local_1);
            }
            ++local_1;
        }
        if (!(this.GetDelayTaskItems().IsEmpty()))
        {
            FFPTime local_10 = FFPTime();
            FFPTime local_10_2 = -1;
            for (auto& local_24 : this.GetDelayTaskItems())
            {
                if ((local_10_2 == -1.0) || ((FFPTime(local_24.GetTargetTime()).opCmp(local_10_2) < 0)))
                {
                    local_10_2 = local_24.GetTargetTime();
                }
            }
            this.SetNextTargetTime(local_10_2);
            return false;
        }
        return true;
    }
    bool TryCancelDelayHiddenTaskByLogicNameAndUpdateNextTargetTime(const FName &inout LogicName)
    {
        int local_1 = -1;
        FFPTime local_4 = FFPTime();
        FFPTime local_4_2 = -1;
        int local_5 = 0;
        for (; local_5 < this.GetDelayTaskItems().Num(); ++local_5)
        {
            const FDelayHiddenTaskItem& local_10 = this.GetDelayTaskItems()[local_5];
            if ((local_10.GetLogicName() == LogicName) && (local_1 == -1))
            {
                local_1 = local_5;
                continue;
            }
            if ((local_4_2 == -1.0) || (FFPTime(local_10.GetTargetTime()).opCmp(local_4_2) < 0))
            {
                local_4_2 = local_10.GetTargetTime();
            }
        }
        if (local_1 != -1)
        {
            this.GetModify_DelayTaskItems().RemoveAtSwap(local_1);
        }
        if ((local_4_2 == -1.0))
        {
            return true;
        }
        else
        {
            this.SetNextTargetTime(local_4_2);
            return false;
        }
    }
    const FFPTime GetNextTargetTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_NextTargetTime() property
    {
        FFPTime __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetNextTargetTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_NextTargetTime = __Value;
        return;
    }
    const TArray<FDelayHiddenTaskItem> GetDelayTaskItems() const property
    {
        const TArray<FDelayHiddenTaskItem> __r;
        return __r;
    }
    TArray<FDelayHiddenTaskItem> GetModify_DelayTaskItems() property
    {
        TArray<FDelayHiddenTaskItem> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetDelayTaskItems(const TArray<FDelayHiddenTaskItem> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_DelayTaskItems = __Value;
        return;
    }
}

struct FC_PresentationVisualComponentToggleDelayHidden : FECSComponent
{
    UPROPERTY()
    FFPTime NextTargetTime;
    UPROPERTY()
    TArray<FDelayHiddenTaskItem> DelayTaskItems;

    FC_PresentationVisualComponentToggleDelayHidden()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    void AddDelayTaskItem(const FName &inout LogicName, const FFPTime &inout TargetTime)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    bool ExecuteTaskAndUpdateNextTargetTime(const FFPTime &inout CurrentTime, const FECSEntity &inout Entity, const FName &inout InstigatorName)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
        bool __r; return __r;
    }
    bool TryCancelDelayHiddenTaskByLogicNameAndUpdateNextTargetTime(const FName &inout LogicName)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
        bool __r; return __r;
    }
}

struct FCE_StartPresentationVisualComponentToggleDelayHidden : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TArray<FName> LogicNames;
    UPROPERTY()
    FName InstigatorName;

    FCE_StartPresentationVisualComponentToggleDelayHidden()
    {
        return;
    }
}

struct FC_LogicVisualComponentToggleDitherStarted : FECSComponent
{
    UPROPERTY()
    TArray<FName> StartedLogicNames;

    FC_LogicVisualComponentToggleDitherStarted()
    {
        return;
    }
}

struct FC_PresentationVisualComponentToggleDitherStarted : FECSComponent
{
    UPROPERTY()
    TArray<FName> StartedLogicNames;

    FC_PresentationVisualComponentToggleDitherStarted()
    {
        return;
    }
}

namespace ECSFunc_FC_LogicVisualComponentToggleDelayHidden
{
UFUNCTION()
bool HasLogicVisualComponentToggleDelayHidden(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LogicVisualComponentToggleDelayHidden);
}
FC_LogicVisualComponentToggleDelayHidden& AssignLogicVisualComponentToggleDelayHidden(const FECSEntity &inout Entity, const FC_LogicVisualComponentToggleDelayHidden &inout DefaultValue = FC_LogicVisualComponentToggleDelayHidden())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LogicVisualComponentToggleDelayHidden, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLogicVisualComponentToggleDelayHidden_BP(const FECSEntity &inout Entity, const FC_LogicVisualComponentToggleDelayHidden &inout DefaultValue = FC_LogicVisualComponentToggleDelayHidden())
{
    ECSFunc_FC_LogicVisualComponentToggleDelayHidden::AssignLogicVisualComponentToggleDelayHidden(Entity, DefaultValue);
    return;
}
FC_LogicVisualComponentToggleDelayHidden& ModifyLogicVisualComponentToggleDelayHidden(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LogicVisualComponentToggleDelayHidden));
    return local_12.GetComp();
}
FC_LogicVisualComponentToggleDelayHidden& ModifyOrAddLogicVisualComponentToggleDelayHidden(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LogicVisualComponentToggleDelayHidden));
    return local_12.GetComp();
}
const FC_LogicVisualComponentToggleDelayHidden& GetLogicVisualComponentToggleDelayHidden(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LogicVisualComponentToggleDelayHidden));
    return local_12.GetComp();
}
UFUNCTION()
FC_LogicVisualComponentToggleDelayHidden GetLogicVisualComponentToggleDelayHidden_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_LogicVisualComponentToggleDelayHidden& local_4 = ECSFunc_FC_LogicVisualComponentToggleDelayHidden::GetLogicVisualComponentToggleDelayHidden(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_LogicVisualComponentToggleDelayHidden();
}
const FC_LogicVisualComponentToggleDelayHidden GetDefaultedLogicVisualComponentToggleDelayHidden(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LogicVisualComponentToggleDelayHidden __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LogicVisualComponentToggleDelayHidden);
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
FC_LogicVisualComponentToggleDelayHidden GetDefaultedLogicVisualComponentToggleDelayHidden_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_LogicVisualComponentToggleDelayHidden::GetDefaultedLogicVisualComponentToggleDelayHidden(Entity);
}
UFUNCTION()
bool RemoveLogicVisualComponentToggleDelayHidden(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LogicVisualComponentToggleDelayHidden);
}
}
FECSMonitorRuntimeView __GetMonitorLogicVisualComponentToggleDelayHiddenOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LogicVisualComponentToggleDelayHidden, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLogicVisualComponentToggleDelayHiddenOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LogicVisualComponentToggleDelayHidden, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLogicVisualComponentToggleDelayHiddenOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LogicVisualComponentToggleDelayHidden, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLogicVisualComponentToggleDelayHiddenOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LogicVisualComponentToggleDelayHidden, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLogicVisualComponentToggleDelayHiddenOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LogicVisualComponentToggleDelayHidden, bFixedFrame, bMustHandleAll);
}
void __MonitorLogicVisualComponentToggleDelayHiddenLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LogicVisualComponentToggleDelayHidden, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLogicVisualComponentToggleDelayHiddenActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LogicVisualComponentToggleDelayHidden, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLogicVisualComponentToggleDelayHiddenModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LogicVisualComponentToggleDelayHidden, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PresentationVisualComponentToggleDelayHidden
{
UFUNCTION()
bool HasPresentationVisualComponentToggleDelayHidden(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PresentationVisualComponentToggleDelayHidden);
}
FC_PresentationVisualComponentToggleDelayHidden& AssignPresentationVisualComponentToggleDelayHidden(const FECSEntity &inout Entity, const FC_PresentationVisualComponentToggleDelayHidden &inout DefaultValue = FC_PresentationVisualComponentToggleDelayHidden())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PresentationVisualComponentToggleDelayHidden, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPresentationVisualComponentToggleDelayHidden_BP(const FECSEntity &inout Entity, const FC_PresentationVisualComponentToggleDelayHidden &inout DefaultValue = FC_PresentationVisualComponentToggleDelayHidden())
{
    ECSFunc_FC_PresentationVisualComponentToggleDelayHidden::AssignPresentationVisualComponentToggleDelayHidden(Entity, DefaultValue);
    return;
}
FC_PresentationVisualComponentToggleDelayHidden& ModifyPresentationVisualComponentToggleDelayHidden(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PresentationVisualComponentToggleDelayHidden));
    return local_12.GetComp();
}
FC_PresentationVisualComponentToggleDelayHidden& ModifyOrAddPresentationVisualComponentToggleDelayHidden(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PresentationVisualComponentToggleDelayHidden));
    return local_12.GetComp();
}
const FC_PresentationVisualComponentToggleDelayHidden& GetPresentationVisualComponentToggleDelayHidden(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PresentationVisualComponentToggleDelayHidden));
    return local_12.GetComp();
}
UFUNCTION()
FC_PresentationVisualComponentToggleDelayHidden GetPresentationVisualComponentToggleDelayHidden_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_PresentationVisualComponentToggleDelayHidden __r;
    bValid = false;
    bValid = ECSFunc_FC_PresentationVisualComponentToggleDelayHidden::GetPresentationVisualComponentToggleDelayHidden(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_PresentationVisualComponentToggleDelayHidden GetDefaultedPresentationVisualComponentToggleDelayHidden(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PresentationVisualComponentToggleDelayHidden __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PresentationVisualComponentToggleDelayHidden);
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
FC_PresentationVisualComponentToggleDelayHidden GetDefaultedPresentationVisualComponentToggleDelayHidden_BP(const FECSEntity &inout Entity)
{
    FC_PresentationVisualComponentToggleDelayHidden __r;
    return __r;
}
UFUNCTION()
bool RemovePresentationVisualComponentToggleDelayHidden(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PresentationVisualComponentToggleDelayHidden);
}
}
FECSMonitorRuntimeView __GetMonitorPresentationVisualComponentToggleDelayHiddenOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PresentationVisualComponentToggleDelayHidden, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationVisualComponentToggleDelayHiddenOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PresentationVisualComponentToggleDelayHidden, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationVisualComponentToggleDelayHiddenOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PresentationVisualComponentToggleDelayHidden, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationVisualComponentToggleDelayHiddenOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PresentationVisualComponentToggleDelayHidden, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationVisualComponentToggleDelayHiddenOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PresentationVisualComponentToggleDelayHidden, bFixedFrame, bMustHandleAll);
}
void __MonitorPresentationVisualComponentToggleDelayHiddenLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PresentationVisualComponentToggleDelayHidden, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPresentationVisualComponentToggleDelayHiddenActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PresentationVisualComponentToggleDelayHidden, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPresentationVisualComponentToggleDelayHiddenModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PresentationVisualComponentToggleDelayHidden, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_LogicVisualComponentToggleDitherStarted
{
UFUNCTION()
bool HasLogicVisualComponentToggleDitherStarted(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LogicVisualComponentToggleDitherStarted);
}
FC_LogicVisualComponentToggleDitherStarted& AssignLogicVisualComponentToggleDitherStarted(const FECSEntity &inout Entity, const FC_LogicVisualComponentToggleDitherStarted &inout DefaultValue = FC_LogicVisualComponentToggleDitherStarted())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LogicVisualComponentToggleDitherStarted, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLogicVisualComponentToggleDitherStarted_BP(const FECSEntity &inout Entity, const FC_LogicVisualComponentToggleDitherStarted &inout DefaultValue = FC_LogicVisualComponentToggleDitherStarted())
{
    ECSFunc_FC_LogicVisualComponentToggleDitherStarted::AssignLogicVisualComponentToggleDitherStarted(Entity, DefaultValue);
    return;
}
FC_LogicVisualComponentToggleDitherStarted& ModifyLogicVisualComponentToggleDitherStarted(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LogicVisualComponentToggleDitherStarted));
    return local_12.GetComp();
}
FC_LogicVisualComponentToggleDitherStarted& ModifyOrAddLogicVisualComponentToggleDitherStarted(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LogicVisualComponentToggleDitherStarted));
    return local_12.GetComp();
}
const FC_LogicVisualComponentToggleDitherStarted& GetLogicVisualComponentToggleDitherStarted(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LogicVisualComponentToggleDitherStarted));
    return local_12.GetComp();
}
UFUNCTION()
FC_LogicVisualComponentToggleDitherStarted GetLogicVisualComponentToggleDitherStarted_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_LogicVisualComponentToggleDitherStarted __r;
    bValid = false;
    bValid = ECSFunc_FC_LogicVisualComponentToggleDitherStarted::GetLogicVisualComponentToggleDitherStarted(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_LogicVisualComponentToggleDitherStarted GetDefaultedLogicVisualComponentToggleDitherStarted(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LogicVisualComponentToggleDitherStarted __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LogicVisualComponentToggleDitherStarted);
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
FC_LogicVisualComponentToggleDitherStarted GetDefaultedLogicVisualComponentToggleDitherStarted_BP(const FECSEntity &inout Entity)
{
    FC_LogicVisualComponentToggleDitherStarted __r;
    return __r;
}
UFUNCTION()
bool RemoveLogicVisualComponentToggleDitherStarted(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LogicVisualComponentToggleDitherStarted);
}
}
FECSMonitorRuntimeView __GetMonitorLogicVisualComponentToggleDitherStartedOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LogicVisualComponentToggleDitherStarted, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLogicVisualComponentToggleDitherStartedOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LogicVisualComponentToggleDitherStarted, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLogicVisualComponentToggleDitherStartedOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LogicVisualComponentToggleDitherStarted, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLogicVisualComponentToggleDitherStartedOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LogicVisualComponentToggleDitherStarted, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLogicVisualComponentToggleDitherStartedOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LogicVisualComponentToggleDitherStarted, bFixedFrame, bMustHandleAll);
}
void __MonitorLogicVisualComponentToggleDitherStartedLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LogicVisualComponentToggleDitherStarted, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLogicVisualComponentToggleDitherStartedActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LogicVisualComponentToggleDitherStarted, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLogicVisualComponentToggleDitherStartedModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LogicVisualComponentToggleDitherStarted, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PresentationVisualComponentToggleDitherStarted
{
UFUNCTION()
bool HasPresentationVisualComponentToggleDitherStarted(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PresentationVisualComponentToggleDitherStarted);
}
FC_PresentationVisualComponentToggleDitherStarted& AssignPresentationVisualComponentToggleDitherStarted(const FECSEntity &inout Entity, const FC_PresentationVisualComponentToggleDitherStarted &inout DefaultValue = FC_PresentationVisualComponentToggleDitherStarted())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PresentationVisualComponentToggleDitherStarted, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPresentationVisualComponentToggleDitherStarted_BP(const FECSEntity &inout Entity, const FC_PresentationVisualComponentToggleDitherStarted &inout DefaultValue = FC_PresentationVisualComponentToggleDitherStarted())
{
    ECSFunc_FC_PresentationVisualComponentToggleDitherStarted::AssignPresentationVisualComponentToggleDitherStarted(Entity, DefaultValue);
    return;
}
FC_PresentationVisualComponentToggleDitherStarted& ModifyPresentationVisualComponentToggleDitherStarted(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PresentationVisualComponentToggleDitherStarted));
    return local_12.GetComp();
}
FC_PresentationVisualComponentToggleDitherStarted& ModifyOrAddPresentationVisualComponentToggleDitherStarted(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PresentationVisualComponentToggleDitherStarted));
    return local_12.GetComp();
}
const FC_PresentationVisualComponentToggleDitherStarted& GetPresentationVisualComponentToggleDitherStarted(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PresentationVisualComponentToggleDitherStarted));
    return local_12.GetComp();
}
UFUNCTION()
FC_PresentationVisualComponentToggleDitherStarted GetPresentationVisualComponentToggleDitherStarted_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_PresentationVisualComponentToggleDitherStarted __r;
    bValid = false;
    bValid = ECSFunc_FC_PresentationVisualComponentToggleDitherStarted::GetPresentationVisualComponentToggleDitherStarted(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_PresentationVisualComponentToggleDitherStarted GetDefaultedPresentationVisualComponentToggleDitherStarted(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PresentationVisualComponentToggleDitherStarted __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PresentationVisualComponentToggleDitherStarted);
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
FC_PresentationVisualComponentToggleDitherStarted GetDefaultedPresentationVisualComponentToggleDitherStarted_BP(const FECSEntity &inout Entity)
{
    FC_PresentationVisualComponentToggleDitherStarted __r;
    return __r;
}
UFUNCTION()
bool RemovePresentationVisualComponentToggleDitherStarted(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PresentationVisualComponentToggleDitherStarted);
}
}
FECSMonitorRuntimeView __GetMonitorPresentationVisualComponentToggleDitherStartedOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PresentationVisualComponentToggleDitherStarted, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationVisualComponentToggleDitherStartedOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PresentationVisualComponentToggleDitherStarted, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationVisualComponentToggleDitherStartedOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PresentationVisualComponentToggleDitherStarted, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationVisualComponentToggleDitherStartedOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PresentationVisualComponentToggleDitherStarted, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPresentationVisualComponentToggleDitherStartedOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PresentationVisualComponentToggleDitherStarted, bFixedFrame, bMustHandleAll);
}
void __MonitorPresentationVisualComponentToggleDitherStartedLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PresentationVisualComponentToggleDitherStarted, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPresentationVisualComponentToggleDitherStartedActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PresentationVisualComponentToggleDitherStarted, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPresentationVisualComponentToggleDitherStartedModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PresentationVisualComponentToggleDitherStarted, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_LogicVisualComponentToggleDelayHidden &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_LogicVisualComponentToggleDelayHidden &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_LogicVisualComponentToggleDelayHidden &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_LogicVisualComponentToggleDelayHidden
{
int __IndexOf_NextTargetTime()
{
    return 0;
}
int __IndexOf_DelayTaskItems()
{
    return 1;
}
}
