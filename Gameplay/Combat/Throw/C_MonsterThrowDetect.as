
namespace __INTENRAL_FC_MonsterThrowDetect_NS
{
    const TECSComponentDerivedPtr<FC_MonsterThrowDetect> DerivedPtr = TECSComponentDerivedPtr<FC_MonsterThrowDetect>();
    const FC_MonsterThrowDetect DefaultValue = FC_MonsterThrowDetect();

}
struct FC_MonsterThrowDetect : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bHasThrow;
    UPROPERTY()
    FECSEntity m_TargetEntity;
    UPROPERTY()
    FNameHandle_EntityBBVarEntity m_CatchSuccessEntityBBVar;
    UPROPERTY()
    bool m_bCanCatchMonsterPrefab;
    UPROPERTY()
    bool m_bCanCatchAvatarPrefab;

    FC_MonsterThrowDetect()
    {
        this.m_bHasThrow = false;
        this.m_bCanCatchMonsterPrefab = false;
        this.m_bCanCatchAvatarPrefab = false;
        this.__InitDirtyFlags();
        return;
    }
    FC_MonsterThrowDetect(const FC_MonsterThrowDetect &inout Other)
    {
        this.m_bHasThrow = false;
        this.m_bCanCatchMonsterPrefab = false;
        this.m_bCanCatchAvatarPrefab = false;
        this.__InitDirtyFlags();
        this.m_bHasThrow = Other.m_bHasThrow;
        this.m_TargetEntity = Other.m_TargetEntity;
        this.m_CatchSuccessEntityBBVar = Other.m_CatchSuccessEntityBBVar;
        this.m_bCanCatchMonsterPrefab = Other.m_bCanCatchMonsterPrefab;
        this.m_bCanCatchAvatarPrefab = Other.m_bCanCatchAvatarPrefab;
        return;
    }
    FC_MonsterThrowDetect opAssign(const FC_MonsterThrowDetect &inout Other)
    {
        FC_MonsterThrowDetect __r;
        this.SetbHasThrow(Other.GetbHasThrow());
        this.SetTargetEntity(Other.GetTargetEntity());
        this.SetCatchSuccessEntityBBVar(Other.GetCatchSuccessEntityBBVar());
        this.SetbCanCatchMonsterPrefab(Other.GetbCanCatchMonsterPrefab());
        this.SetbCanCatchAvatarPrefab(Other.GetbCanCatchAvatarPrefab());
        return __r;
    }
    bool GetbHasThrow() const property
    {
        return this.m_bHasThrow;
    }
    void SetbHasThrow(const bool __Value) property
    {
        if (!(this.m_bHasThrow) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bHasThrow = __Value;
        return;
    }
    const FECSEntity GetTargetEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_TargetEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetTargetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_TargetEntity = __Value;
        return;
    }
    const FNameHandle_EntityBBVarEntity GetCatchSuccessEntityBBVar() const property
    {
        const FNameHandle_EntityBBVarEntity __r;
        return __r;
    }
    FNameHandle_EntityBBVarEntity GetModify_CatchSuccessEntityBBVar() property
    {
        FNameHandle_EntityBBVarEntity __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetCatchSuccessEntityBBVar(const FNameHandle_EntityBBVarEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_CatchSuccessEntityBBVar = __Value;
        return;
    }
    bool GetbCanCatchMonsterPrefab() const property
    {
        return this.m_bCanCatchMonsterPrefab;
    }
    void SetbCanCatchMonsterPrefab(const bool __Value) property
    {
        if (!(this.m_bCanCatchMonsterPrefab) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_bCanCatchMonsterPrefab = __Value;
        return;
    }
    bool GetbCanCatchAvatarPrefab() const property
    {
        return this.m_bCanCatchAvatarPrefab;
    }
    void SetbCanCatchAvatarPrefab(const bool __Value) property
    {
        if (!(this.m_bCanCatchAvatarPrefab) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_bCanCatchAvatarPrefab = __Value;
        return;
    }
}

namespace ECSFunc_FC_MonsterThrowDetect
{
UFUNCTION()
bool HasMonsterThrowDetect(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_MonsterThrowDetect);
}
FC_MonsterThrowDetect& AssignMonsterThrowDetect(const FECSEntity &inout Entity, const FC_MonsterThrowDetect &inout DefaultValue = FC_MonsterThrowDetect())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_MonsterThrowDetect, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMonsterThrowDetect_BP(const FECSEntity &inout Entity, const FC_MonsterThrowDetect &inout DefaultValue = FC_MonsterThrowDetect())
{
    ECSFunc_FC_MonsterThrowDetect::AssignMonsterThrowDetect(Entity, DefaultValue);
    return;
}
FC_MonsterThrowDetect& ModifyMonsterThrowDetect(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_MonsterThrowDetect));
    return local_12.GetComp();
}
FC_MonsterThrowDetect& ModifyOrAddMonsterThrowDetect(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_MonsterThrowDetect));
    return local_12.GetComp();
}
const FC_MonsterThrowDetect& GetMonsterThrowDetect(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_MonsterThrowDetect));
    return local_12.GetComp();
}
UFUNCTION()
FC_MonsterThrowDetect GetMonsterThrowDetect_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_MonsterThrowDetect& local_4 = ECSFunc_FC_MonsterThrowDetect::GetMonsterThrowDetect(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_MonsterThrowDetect();
}
const FC_MonsterThrowDetect GetDefaultedMonsterThrowDetect(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_MonsterThrowDetect __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_MonsterThrowDetect);
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
FC_MonsterThrowDetect GetDefaultedMonsterThrowDetect_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_MonsterThrowDetect::GetDefaultedMonsterThrowDetect(Entity);
}
UFUNCTION()
bool RemoveMonsterThrowDetect(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_MonsterThrowDetect);
}
}
FECSMonitorRuntimeView __GetMonitorMonsterThrowDetectOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_MonsterThrowDetect, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMonsterThrowDetectOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_MonsterThrowDetect, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMonsterThrowDetectOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_MonsterThrowDetect, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMonsterThrowDetectOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_MonsterThrowDetect, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMonsterThrowDetectOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_MonsterThrowDetect, bFixedFrame, bMustHandleAll);
}
void __MonitorMonsterThrowDetectLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_MonsterThrowDetect, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMonsterThrowDetectActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_MonsterThrowDetect, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMonsterThrowDetectModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_MonsterThrowDetect, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_MonsterThrowDetect &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_MonsterThrowDetect &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_MonsterThrowDetect &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_MonsterThrowDetect
{
int __IndexOf_bHasThrow()
{
    return 0;
}
int __IndexOf_TargetEntity()
{
    return 1;
}
int __IndexOf_CatchSuccessEntityBBVar()
{
    return 2;
}
int __IndexOf_bCanCatchMonsterPrefab()
{
    return 3;
}
int __IndexOf_bCanCatchAvatarPrefab()
{
    return 4;
}
}
