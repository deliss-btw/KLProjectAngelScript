
namespace __INTENRAL_FC_EntityDialog_NS
{
    const TECSComponentDerivedPtr<FC_EntityDialog> DerivedPtr = TECSComponentDerivedPtr<FC_EntityDialog>();
    const FC_EntityDialog DefaultValue = FC_EntityDialog();
}
namespace __INTENRAL_FCS_EntityDialogSpeakers_NS
{
    const TECSComponentDerivedPtr<FCS_EntityDialogSpeakers> DerivedPtr = TECSComponentDerivedPtr<FCS_EntityDialogSpeakers>();
    const FCS_EntityDialogSpeakers DefaultValue = FCS_EntityDialogSpeakers();

}
struct FC_EntityDialog : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FString m_DialogText;

    FC_EntityDialog()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_EntityDialog(const FC_EntityDialog &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_DialogText = Other.m_DialogText;
        return;
    }
    FC_EntityDialog opAssign(const FC_EntityDialog &inout Other)
    {
        FC_EntityDialog __r;
        this.SetDialogText(Other.GetDialogText());
        return __r;
    }
    FString GetDialogText() const property
    {
        return this.m_DialogText;
    }
    void SetDialogText(const FString &inout __Value) property
    {
        if ((this.m_DialogText == __Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_DialogText = __Value;
        return;
    }
}

struct FCS_EntityDialogSpeakers : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TArray<FECSEntity> m_Entities;
    UPROPERTY()
    TArray<FECSEntity> m_InRangeEntities;

    FCS_EntityDialogSpeakers()
    {
        this.__InitDirtyFlags();
        return;
    }
    FCS_EntityDialogSpeakers(const FCS_EntityDialogSpeakers &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_Entities = Other.m_Entities;
        this.m_InRangeEntities = Other.m_InRangeEntities;
        return;
    }
    FCS_EntityDialogSpeakers opAssign(const FCS_EntityDialogSpeakers &inout Other)
    {
        FCS_EntityDialogSpeakers __r;
        this.SetEntities(Other.GetEntities());
        this.SetInRangeEntities(Other.GetInRangeEntities());
        return __r;
    }
    const TArray<FECSEntity> GetEntities() const property
    {
        const TArray<FECSEntity> __r;
        return __r;
    }
    TArray<FECSEntity> GetModify_Entities() property
    {
        TArray<FECSEntity> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetEntities(const TArray<FECSEntity> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Entities = __Value;
        return;
    }
    const TArray<FECSEntity> GetInRangeEntities() const property
    {
        const TArray<FECSEntity> __r;
        return __r;
    }
    TArray<FECSEntity> GetModify_InRangeEntities() property
    {
        TArray<FECSEntity> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetInRangeEntities(const TArray<FECSEntity> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_InRangeEntities = __Value;
        return;
    }
}

namespace ECSFunc_FC_EntityDialog
{
UFUNCTION()
bool HasEntityDialog(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EntityDialog);
}
FC_EntityDialog& AssignEntityDialog(const FECSEntity &inout Entity, const FC_EntityDialog &inout DefaultValue = FC_EntityDialog())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EntityDialog, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEntityDialog_BP(const FECSEntity &inout Entity, const FC_EntityDialog &inout DefaultValue = FC_EntityDialog())
{
    ECSFunc_FC_EntityDialog::AssignEntityDialog(Entity, DefaultValue);
    return;
}
FC_EntityDialog& ModifyEntityDialog(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EntityDialog));
    return local_12.GetComp();
}
FC_EntityDialog& ModifyOrAddEntityDialog(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EntityDialog));
    return local_12.GetComp();
}
const FC_EntityDialog& GetEntityDialog(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EntityDialog));
    return local_12.GetComp();
}
UFUNCTION()
FC_EntityDialog GetEntityDialog_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_EntityDialog& local_4 = ECSFunc_FC_EntityDialog::GetEntityDialog(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_EntityDialog();
}
const FC_EntityDialog GetDefaultedEntityDialog(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EntityDialog __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EntityDialog);
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
FC_EntityDialog GetDefaultedEntityDialog_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_EntityDialog::GetDefaultedEntityDialog(Entity);
}
UFUNCTION()
bool RemoveEntityDialog(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EntityDialog);
}
}
FECSMonitorRuntimeView __GetMonitorEntityDialogOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EntityDialog, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntityDialogOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EntityDialog, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntityDialogOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EntityDialog, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntityDialogOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EntityDialog, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEntityDialogOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EntityDialog, bFixedFrame, bMustHandleAll);
}
void __MonitorEntityDialogLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EntityDialog, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEntityDialogActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EntityDialog, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEntityDialogModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EntityDialog, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_EntityDialogSpeakers
{
UFUNCTION()
bool HasEntityDialogSpeakers(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_EntityDialogSpeakers);
}
FCS_EntityDialogSpeakers& AssignEntityDialogSpeakers(const FECSWorldPtr &inout World, const FCS_EntityDialogSpeakers &inout DefaultValue = FCS_EntityDialogSpeakers())
{
    UScriptStruct local_6 = FCS_EntityDialogSpeakers;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignEntityDialogSpeakers_BP(const FECSWorldPtr &inout World, const FCS_EntityDialogSpeakers &inout DefaultValue = FCS_EntityDialogSpeakers())
{
    ECSFunc_FCS_EntityDialogSpeakers::AssignEntityDialogSpeakers(World, DefaultValue);
    return;
}
FCS_EntityDialogSpeakers& ModifyEntityDialogSpeakers(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EntityDialogSpeakers;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_EntityDialogSpeakers& ModifyOrAddEntityDialogSpeakers(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EntityDialogSpeakers;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_EntityDialogSpeakers& GetEntityDialogSpeakers(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_EntityDialogSpeakers;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_EntityDialogSpeakers GetEntityDialogSpeakers_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_EntityDialogSpeakers& local_4 = ECSFunc_FCS_EntityDialogSpeakers::GetEntityDialogSpeakers(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_EntityDialogSpeakers();
}
const FCS_EntityDialogSpeakers GetDefaultedEntityDialogSpeakers(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_EntityDialogSpeakers __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_EntityDialogSpeakers);
    if ((local_6 == nullptr))
    {
    }
    else
    {
        local_10.InternalSet(local_6);
        return local_10.GetComp();
    }
    return __r;
}
UFUNCTION()
FCS_EntityDialogSpeakers GetDefaultedEntityDialogSpeakers_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_EntityDialogSpeakers::GetDefaultedEntityDialogSpeakers(World);
}
UFUNCTION()
bool RemoveEntityDialogSpeakers(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_EntityDialogSpeakers);
}
}
void __MonitorEntityDialogSpeakersLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_EntityDialogSpeakers, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEntityDialogSpeakersActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_EntityDialogSpeakers, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEntityDialogSpeakersModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_EntityDialogSpeakers, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_EntityDialog &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_EntityDialog &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_EntityDialog &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_EntityDialog
{
int __IndexOf_DialogText()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCS_EntityDialogSpeakers &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_EntityDialogSpeakers &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_EntityDialogSpeakers &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_EntityDialogSpeakers
{
int __IndexOf_Entities()
{
    return 0;
}
int __IndexOf_InRangeEntities()
{
    return 1;
}
}
