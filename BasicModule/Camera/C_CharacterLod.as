
namespace __INTENRAL_FC_CharacterLodOverride_NS
{
    const TECSComponentDerivedPtr<FC_CharacterLodOverride> DerivedPtr = TECSComponentDerivedPtr<FC_CharacterLodOverride>();
    const FC_CharacterLodOverride DefaultValue = FC_CharacterLodOverride();

}
struct FC_CharacterLodOverride : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bOtherPlayerUseBetterLOD;

    FC_CharacterLodOverride()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_CharacterLodOverride(const FC_CharacterLodOverride &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_CharacterLodOverride opAssign(const FC_CharacterLodOverride &inout Other)
    {
        FC_CharacterLodOverride __r;
        this.SetbOtherPlayerUseBetterLOD(Other.GetbOtherPlayerUseBetterLOD());
        return __r;
    }
    bool GetbOtherPlayerUseBetterLOD() const property
    {
        return this.m_bOtherPlayerUseBetterLOD;
    }
    void SetbOtherPlayerUseBetterLOD(const bool __Value) property
    {
        if (!(this.m_bOtherPlayerUseBetterLOD) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bOtherPlayerUseBetterLOD = __Value;
        return;
    }
}

namespace ECSFunc_FC_CharacterLodOverride
{
UFUNCTION()
bool HasCharacterLodOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CharacterLodOverride);
}
FC_CharacterLodOverride& AssignCharacterLodOverride(const FECSEntity &inout Entity, const FC_CharacterLodOverride &inout DefaultValue = FC_CharacterLodOverride())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CharacterLodOverride, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCharacterLodOverride_BP(const FECSEntity &inout Entity, const FC_CharacterLodOverride &inout DefaultValue = FC_CharacterLodOverride())
{
    ECSFunc_FC_CharacterLodOverride::AssignCharacterLodOverride(Entity, DefaultValue);
    return;
}
FC_CharacterLodOverride& ModifyCharacterLodOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CharacterLodOverride));
    return local_12.GetComp();
}
FC_CharacterLodOverride& ModifyOrAddCharacterLodOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CharacterLodOverride));
    return local_12.GetComp();
}
const FC_CharacterLodOverride& GetCharacterLodOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CharacterLodOverride));
    return local_12.GetComp();
}
UFUNCTION()
FC_CharacterLodOverride GetCharacterLodOverride_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CharacterLodOverride& local_4 = ECSFunc_FC_CharacterLodOverride::GetCharacterLodOverride(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CharacterLodOverride();
}
const FC_CharacterLodOverride GetDefaultedCharacterLodOverride(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CharacterLodOverride __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CharacterLodOverride);
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
FC_CharacterLodOverride GetDefaultedCharacterLodOverride_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CharacterLodOverride::GetDefaultedCharacterLodOverride(Entity);
}
UFUNCTION()
bool RemoveCharacterLodOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CharacterLodOverride);
}
}
FECSMonitorRuntimeView __GetMonitorCharacterLodOverrideOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CharacterLodOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterLodOverrideOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CharacterLodOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterLodOverrideOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CharacterLodOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterLodOverrideOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CharacterLodOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCharacterLodOverrideOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CharacterLodOverride, bFixedFrame, bMustHandleAll);
}
void __MonitorCharacterLodOverrideLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CharacterLodOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCharacterLodOverrideActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CharacterLodOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCharacterLodOverrideModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CharacterLodOverride, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_CharacterLodOverride &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_CharacterLodOverride &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_CharacterLodOverride &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_CharacterLodOverride
{
int __IndexOf_bOtherPlayerUseBetterLOD()
{
    return 0;
}
}
