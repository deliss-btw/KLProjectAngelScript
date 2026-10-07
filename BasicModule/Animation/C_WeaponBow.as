
namespace __INTENRAL_FC_WeaponBowLine_NS
{
    const TECSComponentDerivedPtr<FC_WeaponBowLine> DerivedPtr = TECSComponentDerivedPtr<FC_WeaponBowLine>();
    const FC_WeaponBowLine DefaultValue = FC_WeaponBowLine();

}
struct FC_WeaponBowLine : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FName m_TargetSocketName;
    UPROPERTY()
    FName m_ControlName;
    UPROPERTY()
    bool m_AttachBowLine;

    FC_WeaponBowLine()
    {
        this.m_TargetSocketName = n"S_BowLineControl";
        this.m_ControlName = n"Ctrl_BowLine";
        this.m_AttachBowLine = false;
        this.__InitDirtyFlags();
        return;
    }
    FC_WeaponBowLine(const FC_WeaponBowLine &inout Other)
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
    FC_WeaponBowLine opAssign(const FC_WeaponBowLine &inout Other)
    {
        FC_WeaponBowLine __r;
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

struct FT_WeaponBow : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_WeaponBowLine_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_WeaponBowLine, NAME_None);
    UPROPERTY()
    FC_WeaponBowLine Config_FC_WeaponBowLine;

    FT_WeaponBow()
    {
        return;
    }
}

namespace ECSFunc_FC_WeaponBowLine
{
UFUNCTION()
bool HasWeaponBowLine(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_WeaponBowLine);
}
FC_WeaponBowLine& AssignWeaponBowLine(const FECSEntity &inout Entity, const FC_WeaponBowLine &inout DefaultValue = FC_WeaponBowLine())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_WeaponBowLine, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignWeaponBowLine_BP(const FECSEntity &inout Entity, const FC_WeaponBowLine &inout DefaultValue = FC_WeaponBowLine())
{
    ECSFunc_FC_WeaponBowLine::AssignWeaponBowLine(Entity, DefaultValue);
    return;
}
FC_WeaponBowLine& ModifyWeaponBowLine(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_WeaponBowLine));
    return local_12.GetComp();
}
FC_WeaponBowLine& ModifyOrAddWeaponBowLine(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_WeaponBowLine));
    return local_12.GetComp();
}
const FC_WeaponBowLine& GetWeaponBowLine(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_WeaponBowLine));
    return local_12.GetComp();
}
UFUNCTION()
FC_WeaponBowLine GetWeaponBowLine_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_WeaponBowLine& local_4 = ECSFunc_FC_WeaponBowLine::GetWeaponBowLine(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_WeaponBowLine();
}
const FC_WeaponBowLine GetDefaultedWeaponBowLine(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_WeaponBowLine __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_WeaponBowLine);
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
FC_WeaponBowLine GetDefaultedWeaponBowLine_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_WeaponBowLine::GetDefaultedWeaponBowLine(Entity);
}
UFUNCTION()
bool RemoveWeaponBowLine(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_WeaponBowLine);
}
}
FECSMonitorRuntimeView __GetMonitorWeaponBowLineOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_WeaponBowLine, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWeaponBowLineOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_WeaponBowLine, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWeaponBowLineOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_WeaponBowLine, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWeaponBowLineOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_WeaponBowLine, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorWeaponBowLineOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_WeaponBowLine, bFixedFrame, bMustHandleAll);
}
void __MonitorWeaponBowLineLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_WeaponBowLine, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorWeaponBowLineActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_WeaponBowLine, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorWeaponBowLineModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_WeaponBowLine, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_WeaponBowLine &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_WeaponBowLine &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_WeaponBowLine &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_WeaponBowLine
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
