
namespace __INTENRAL_FC_SubMeshAnim_NS
{
    const TECSComponentDerivedPtr<FC_SubMeshAnim> DerivedPtr = TECSComponentDerivedPtr<FC_SubMeshAnim>();
    const FC_SubMeshAnim DefaultValue = FC_SubMeshAnim();

}
struct FSubMeshSlotAnim
{
    UPROPERTY()
    UAnimSequence Anim;
    UPROPERTY()
    bool bLoop = false;
    UPROPERTY()
    float32 Seconds = 0.0f;


}

struct FC_SubMeshAnim : FECSComponent
{
    UPROPERTY()
    TMap<FName, FSubMeshSlotAnim> SubMeshSlotAnims;

    FC_SubMeshAnim()
    {
        return;
    }
}

namespace SubMeshSlotAnim
{
UFUNCTION()
bool GetSubMeshSlotAnim(const FECSEntity &inout Entity, const FName &inout SlotName, FSubMeshSlotAnim &inout SlotAnim)
{
    bool local_8 = 0.SubMeshSlotAnims.Find(SlotName, SlotAnim);
    if (local_8 == false)
    {
        FSubMeshSlotAnim local_14;
        SlotAnim = local_14;
    }
    return local_8;
}
}
namespace ECSFunc_FC_SubMeshAnim
{
UFUNCTION()
bool HasSubMeshAnim(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_SubMeshAnim);
}
FC_SubMeshAnim& AssignSubMeshAnim(const FECSEntity &inout Entity, const FC_SubMeshAnim &inout DefaultValue = FC_SubMeshAnim())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_SubMeshAnim, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignSubMeshAnim_BP(const FECSEntity &inout Entity, const FC_SubMeshAnim &inout DefaultValue = FC_SubMeshAnim())
{
    ECSFunc_FC_SubMeshAnim::AssignSubMeshAnim(Entity, DefaultValue);
    return;
}
FC_SubMeshAnim& ModifySubMeshAnim(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_SubMeshAnim));
    return local_12.GetComp();
}
FC_SubMeshAnim& ModifyOrAddSubMeshAnim(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_SubMeshAnim));
    return local_12.GetComp();
}
const FC_SubMeshAnim& GetSubMeshAnim(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_SubMeshAnim));
    return local_12.GetComp();
}
UFUNCTION()
FC_SubMeshAnim GetSubMeshAnim_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_SubMeshAnim __r;
    bValid = false;
    bValid = ECSFunc_FC_SubMeshAnim::GetSubMeshAnim(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_SubMeshAnim GetDefaultedSubMeshAnim(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_SubMeshAnim __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_SubMeshAnim);
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
FC_SubMeshAnim GetDefaultedSubMeshAnim_BP(const FECSEntity &inout Entity)
{
    FC_SubMeshAnim __r;
    return __r;
}
UFUNCTION()
bool RemoveSubMeshAnim(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_SubMeshAnim);
}
}
FECSMonitorRuntimeView __GetMonitorSubMeshAnimOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_SubMeshAnim, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSubMeshAnimOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_SubMeshAnim, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSubMeshAnimOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_SubMeshAnim, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSubMeshAnimOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_SubMeshAnim, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorSubMeshAnimOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_SubMeshAnim, bFixedFrame, bMustHandleAll);
}
void __MonitorSubMeshAnimLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_SubMeshAnim, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSubMeshAnimActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_SubMeshAnim, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorSubMeshAnimModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_SubMeshAnim, bFixedFrame, Details);
    return;
}
