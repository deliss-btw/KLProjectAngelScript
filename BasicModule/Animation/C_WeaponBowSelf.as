
namespace __INTENRAL_FC_WeaponBowLineSelf_NS
{
    const TECSComponentDerivedPtr<FC_WeaponBowLineSelf> DerivedPtr = TECSComponentDerivedPtr<FC_WeaponBowLineSelf>();
    const FC_WeaponBowLineSelf DefaultValue = FC_WeaponBowLineSelf();

}
struct FC_WeaponBowLineSelf : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FName m_TargetSocketName;
    UPROPERTY()
    FName m_ControlName;
    UPROPERTY()
    bool m_AttachBowLine;

    FC_WeaponBowLineSelf()
    {
        this.m_TargetSocketName = n"S_BowLineControl";
        this.m_ControlName = n"Ctrl_BowLine";
        this.m_AttachBowLine = false;
        this.__InitDirtyFlags();
        return;
    }
    FC_WeaponBowLineSelf(const FC_WeaponBowLineSelf &inout Other)
    {
        this.m_TargetSocketName = n"S_BowLineControl";
        this.m_ControlName = n"Ctrl_BowLine";
        this.m_AttachBowLine = false;
        this.__InitDirtyFlags();
        this.m_TargetSocketName = Other.m_TargetSocketName;
        this.m_ControlName = Other.m_ControlName;
        this.m_AttachBowLine = Other.m_AttachBowLine;
        return;
    }
    FC_WeaponBowLineSelf opAssign(const FC_WeaponBowLineSelf &inout Other)
    {
        FC_WeaponBowLineSelf __r;
        this.SetTargetSocketName(Other.GetTargetSocketName());
        this.SetControlName(Other.GetControlName());
        this.SetAttachBowLine(Other.GetAttachBowLine());
        return __r;
    }
    FName GetTargetSocketName() const property
    {
        return this.m_TargetSocketName;
    }
    void SetTargetSocketName(const FName &inout __Value) property
    {
        if ((this.m_TargetSocketName == __Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_TargetSocketName = __Value;
        return;
    }
    FName GetControlName() const property
    {
        return this.m_ControlName;
    }
    void SetControlName(const FName &inout __Value) property
    {
        if ((this.m_ControlName == __Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_ControlName = __Value;
        return;
    }
    bool GetAttachBowLine() const property
    {
        return this.m_AttachBowLine;
    }
    void SetAttachBowLine(const bool __Value) property
    {
        if (!(this.m_AttachBowLine) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_AttachBowLine = __Value;
        return;
    }
}

struct FT_WeaponBowSelf : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_WeaponBowLineSelf_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_WeaponBowLineSelf, NAME_None);
    UPROPERTY()
    FC_WeaponBowLineSelf Config_FC_WeaponBowLineSelf;

    FT_WeaponBowSelf()
    {
        return;
    }
}

namespace ECSFunc_FC_WeaponBowLineSelf
{
UFUNCTION()
bool HasWeaponBowLineSelf(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_WeaponBowLineSelf);
}
FC_WeaponBowLineSelf& AssignWeaponBowLineSelf(const FECSEntity &inout Entity, const FC_WeaponBowLineSelf &inout DefaultValue = FC_WeaponBowLineSelf())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_WeaponBowLineSelf, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignWeaponBowLineSelf_BP(const FECSEntity &inout Entity, const FC_WeaponBowLineSelf &inout DefaultValue = FC_WeaponBowLineSelf())
{
    ECSFunc_FC_WeaponBowLineSelf::AssignWeaponBowLineSelf(Entity, DefaultValue);
    return;
}
FC_WeaponBowLineSelf& ModifyWeaponBowLineSelf(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_WeaponBowLineSelf));
    return local_12.GetComp();
}
FC_WeaponBowLineSelf& ModifyOrAddWeaponBowLineSelf(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_WeaponBowLineSelf));
    return local_12.GetComp();
}
const FC_WeaponBowLineSelf& GetWeaponBowLineSelf(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_WeaponBowLineSelf));
    return local_12.GetComp();
}
UFUNCTION()
FC_WeaponBowLineSelf GetWeaponBowLineSelf_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_WeaponBowLineSelf& local_4 = ECSFunc_FC_WeaponBowLineSelf::GetWeaponBowLineSelf(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_WeaponBowLineSelf();
}
const FC_WeaponBowLineSelf GetDefaultedWeaponBowLineSelf(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_WeaponBowLineSelf __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_WeaponBowLineSelf);
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
FC_WeaponBowLineSelf GetDefaultedWeaponBowLineSelf_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_WeaponBowLineSelf::GetDefaultedWeaponBowLineSelf(Entity);
}
UFUNCTION()
bool RemoveWeaponBowLineSelf(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_WeaponBowLineSelf);
}
}
FECSMonitorRuntimeView __GetMonitorWeaponBowLineSelfOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_WeaponBowLineSelf, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWeaponBowLineSelfOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_WeaponBowLineSelf, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWeaponBowLineSelfOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_WeaponBowLineSelf, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWeaponBowLineSelfOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_WeaponBowLineSelf, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWeaponBowLineSelfOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_WeaponBowLineSelf, bFixedFrame, bMustHandleAll);
}
void __MonitorWeaponBowLineSelfLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_WeaponBowLineSelf, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorWeaponBowLineSelfActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_WeaponBowLineSelf, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorWeaponBowLineSelfModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_WeaponBowLineSelf, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_WeaponBowLineSelf &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_WeaponBowLineSelf &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_WeaponBowLineSelf &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_WeaponBowLineSelf
{
int __IndexOf_TargetSocketName()
{
    return 0;
}
int __IndexOf_ControlName()
{
    return 1;
}
int __IndexOf_AttachBowLine()
{
    return 2;
}
}
