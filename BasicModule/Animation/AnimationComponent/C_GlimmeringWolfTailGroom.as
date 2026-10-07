
namespace __INTENRAL_FC_GlimmeringWolfTailGroom_NS
{
    const TECSComponentDerivedPtr<FC_GlimmeringWolfTailGroom> DerivedPtr = TECSComponentDerivedPtr<FC_GlimmeringWolfTailGroom>();
    const FC_GlimmeringWolfTailGroom DefaultValue = FC_GlimmeringWolfTailGroom();
}
namespace __InterpoComponentRegister
{
    const FECSInterpoManager::FAngelscriptInterpoComponentRegister FC_GlimmeringWolfTailGroomRegister = FECSInterpoManager::FAngelscriptInterpoComponentRegister();

}
struct FC_GlimmeringWolfTailGroom : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bIsApplyAndDoNotGroom;

    FC_GlimmeringWolfTailGroom()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_GlimmeringWolfTailGroom(const FC_GlimmeringWolfTailGroom &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_GlimmeringWolfTailGroom opAssign(const FC_GlimmeringWolfTailGroom &inout Other)
    {
        FC_GlimmeringWolfTailGroom __r;
        this.SetbIsApplyAndDoNotGroom(Other.GetbIsApplyAndDoNotGroom());
        return __r;
    }
    bool GetbIsApplyAndDoNotGroom() const property
    {
        return this.m_bIsApplyAndDoNotGroom;
    }
    void SetbIsApplyAndDoNotGroom(const bool __Value) property
    {
        if (!(this.m_bIsApplyAndDoNotGroom) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bIsApplyAndDoNotGroom = __Value;
        return;
    }
}

class UESMAction_GlimmeringWolfTailGroom : UESMBPBaseSpanTickAction
{
    UESMAction_GlimmeringWolfTailGroom()
    {
        return;
    }
    UFUNCTION()
    void Enter_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_6 = 0;
        FNameHandle_EntityBBVarBool local_12;
        local_12;
        bool local_13 = (!(Context.GetEntity().GetBB_Bool(local_12)) == !(false));
        local_6.SetbIsApplyAndDoNotGroom(local_13);
        return;
    }
    UFUNCTION()
    void Exit_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        0.SetbIsApplyAndDoNotGroom(false);
        return;
    }
}

namespace FC_GlimmeringWolfTailGroom
{
FC_GlimmeringWolfTailGroom Interpolate(const FC_GlimmeringWolfTailGroom &inout A, const FC_GlimmeringWolfTailGroom &inout B, const float32 T, const float32 DeltaTime)
{
    FC_GlimmeringWolfTailGroom local_2;
    local_2.SetbIsApplyAndDoNotGroom(A.GetbIsApplyAndDoNotGroom());
    return local_2;
}
}
namespace ECSFunc_FC_GlimmeringWolfTailGroom
{
UFUNCTION()
bool HasGlimmeringWolfTailGroom(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_GlimmeringWolfTailGroom);
}
FC_GlimmeringWolfTailGroom& AssignGlimmeringWolfTailGroom(const FECSEntity &inout Entity, const FC_GlimmeringWolfTailGroom &inout DefaultValue = FC_GlimmeringWolfTailGroom())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_GlimmeringWolfTailGroom, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignGlimmeringWolfTailGroom_BP(const FECSEntity &inout Entity, const FC_GlimmeringWolfTailGroom &inout DefaultValue = FC_GlimmeringWolfTailGroom())
{
    ECSFunc_FC_GlimmeringWolfTailGroom::AssignGlimmeringWolfTailGroom(Entity, DefaultValue);
    return;
}
FC_GlimmeringWolfTailGroom& ModifyGlimmeringWolfTailGroom(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_GlimmeringWolfTailGroom));
    return local_12.GetComp();
}
FC_GlimmeringWolfTailGroom& ModifyOrAddGlimmeringWolfTailGroom(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_GlimmeringWolfTailGroom));
    return local_12.GetComp();
}
const FC_GlimmeringWolfTailGroom& GetGlimmeringWolfTailGroom(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_GlimmeringWolfTailGroom));
    return local_12.GetComp();
}
UFUNCTION()
FC_GlimmeringWolfTailGroom GetGlimmeringWolfTailGroom_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_GlimmeringWolfTailGroom& local_4 = ECSFunc_FC_GlimmeringWolfTailGroom::GetGlimmeringWolfTailGroom(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_GlimmeringWolfTailGroom();
}
const FC_GlimmeringWolfTailGroom GetDefaultedGlimmeringWolfTailGroom(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_GlimmeringWolfTailGroom __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_GlimmeringWolfTailGroom);
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
FC_GlimmeringWolfTailGroom GetDefaultedGlimmeringWolfTailGroom_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_GlimmeringWolfTailGroom::GetDefaultedGlimmeringWolfTailGroom(Entity);
}
UFUNCTION()
bool RemoveGlimmeringWolfTailGroom(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_GlimmeringWolfTailGroom);
}
}
FECSMonitorRuntimeView __GetMonitorGlimmeringWolfTailGroomOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_GlimmeringWolfTailGroom, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGlimmeringWolfTailGroomOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_GlimmeringWolfTailGroom, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGlimmeringWolfTailGroomOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_GlimmeringWolfTailGroom, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGlimmeringWolfTailGroomOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_GlimmeringWolfTailGroom, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGlimmeringWolfTailGroomOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_GlimmeringWolfTailGroom, bFixedFrame, bMustHandleAll);
}
void __MonitorGlimmeringWolfTailGroomLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_GlimmeringWolfTailGroom, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGlimmeringWolfTailGroomActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_GlimmeringWolfTailGroom, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGlimmeringWolfTailGroomModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_GlimmeringWolfTailGroom, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_GlimmeringWolfTailGroom &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_GlimmeringWolfTailGroom &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_GlimmeringWolfTailGroom &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_GlimmeringWolfTailGroom
{
int __IndexOf_bIsApplyAndDoNotGroom()
{
    return 0;
}
}
