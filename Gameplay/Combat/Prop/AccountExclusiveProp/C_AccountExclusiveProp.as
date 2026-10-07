
namespace __INTENRAL_FC_AccountExclusivePropTag_NS
{
    const TECSComponentDerivedPtr<FC_AccountExclusivePropTag> DerivedPtr = TECSComponentDerivedPtr<FC_AccountExclusivePropTag>();
    const FC_AccountExclusivePropTag DefaultValue = FC_AccountExclusivePropTag();
}
namespace __INTENRAL_FC_DefaultToLocal_NS
{
    const TECSComponentDerivedPtr<FC_DefaultToLocal> DerivedPtr = TECSComponentDerivedPtr<FC_DefaultToLocal>();
    const FC_DefaultToLocal DefaultValue = FC_DefaultToLocal();
}
namespace __INTENRAL_FC_DefaultHasCorrespondingLocalTag_NS
{
    const TECSComponentDerivedPtr<FC_DefaultHasCorrespondingLocalTag> DerivedPtr = TECSComponentDerivedPtr<FC_DefaultHasCorrespondingLocalTag>();
    const FC_DefaultHasCorrespondingLocalTag DefaultValue = FC_DefaultHasCorrespondingLocalTag();
}
namespace __INTENRAL_FC_LocalToDefault_NS
{
    const TECSComponentDerivedPtr<FC_LocalToDefault> DerivedPtr = TECSComponentDerivedPtr<FC_LocalToDefault>();
    const FC_LocalToDefault DefaultValue = FC_LocalToDefault();
}
namespace __INTENRAL_FC_AccountExclusivePropConfig_NS
{
    const TECSComponentDerivedPtr<FC_AccountExclusivePropConfig> DerivedPtr = TECSComponentDerivedPtr<FC_AccountExclusivePropConfig>();
    const FC_AccountExclusivePropConfig DefaultValue = FC_AccountExclusivePropConfig();
}
namespace __INTENRAL_FC_AccountExclusivePropClientDisableInteract_NS
{
    const TECSComponentDerivedPtr<FC_AccountExclusivePropClientDisableInteract> DerivedPtr = TECSComponentDerivedPtr<FC_AccountExclusivePropClientDisableInteract>();
    const FC_AccountExclusivePropClientDisableInteract DefaultValue = FC_AccountExclusivePropClientDisableInteract();

}
struct FC_AccountExclusivePropTag : FECSComponent
{
    FC_AccountExclusivePropTag()
    {
        return;
    }
}

struct FC_DefaultToLocal : FECSComponent
{
    UPROPERTY()
    FECSEntityId LocalEntityId;

    FC_DefaultToLocal()
    {
        return;
    }
}

struct FC_DefaultHasCorrespondingLocalTag : FECSComponent
{
    FC_DefaultHasCorrespondingLocalTag()
    {
        return;
    }
}

struct FC_LocalToDefault : FECSComponent
{
    UPROPERTY()
    FECSEntityId DefaultEntityId;

    FC_LocalToDefault()
    {
        return;
    }
}

struct FC_AccountExclusivePropConfig : FECSComponent
{
    UPROPERTY()
    FSoftClassPath LocalRegEntityPrefabClass;

    FC_AccountExclusivePropConfig()
    {
        return;
    }
    void PostPrefabLoad(const FECSEntity &inout Entity)
    {
        if (ECS::GetRuntimeInfo().IsServer)
        {
            FC_DefaultHasCorrespondingLocalTag local_8;
            Assign local_6;
            local_6.opCall(local_8);
        }
        return;
    }
}

struct FC_AccountExclusivePropClientDisableInteract : FECSComponent
{
    UPROPERTY()
    int Count = 0;


}

namespace ECSFunc_FC_AccountExclusivePropTag
{
UFUNCTION()
bool HasAccountExclusivePropTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusivePropTag);
}
FC_AccountExclusivePropTag& AssignAccountExclusivePropTag(const FECSEntity &inout Entity, const FC_AccountExclusivePropTag &inout DefaultValue = FC_AccountExclusivePropTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusivePropTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAccountExclusivePropTag_BP(const FECSEntity &inout Entity, const FC_AccountExclusivePropTag &inout DefaultValue = FC_AccountExclusivePropTag())
{
    ECSFunc_FC_AccountExclusivePropTag::AssignAccountExclusivePropTag(Entity, DefaultValue);
    return;
}
FC_AccountExclusivePropTag& ModifyAccountExclusivePropTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusivePropTag));
    return local_12.GetComp();
}
FC_AccountExclusivePropTag& ModifyOrAddAccountExclusivePropTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusivePropTag));
    return local_12.GetComp();
}
const FC_AccountExclusivePropTag& GetAccountExclusivePropTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusivePropTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_AccountExclusivePropTag GetAccountExclusivePropTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AccountExclusivePropTag& local_4 = ECSFunc_FC_AccountExclusivePropTag::GetAccountExclusivePropTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AccountExclusivePropTag();
}
const FC_AccountExclusivePropTag GetDefaultedAccountExclusivePropTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AccountExclusivePropTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusivePropTag);
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
FC_AccountExclusivePropTag GetDefaultedAccountExclusivePropTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AccountExclusivePropTag::GetDefaultedAccountExclusivePropTag(Entity);
}
UFUNCTION()
bool RemoveAccountExclusivePropTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusivePropTag);
}
}
FECSMonitorRuntimeView __GetMonitorAccountExclusivePropTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AccountExclusivePropTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAccountExclusivePropTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AccountExclusivePropTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAccountExclusivePropTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AccountExclusivePropTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAccountExclusivePropTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AccountExclusivePropTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAccountExclusivePropTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AccountExclusivePropTag, bFixedFrame, bMustHandleAll);
}
void __MonitorAccountExclusivePropTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AccountExclusivePropTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAccountExclusivePropTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AccountExclusivePropTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAccountExclusivePropTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AccountExclusivePropTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DefaultToLocal
{
UFUNCTION()
bool HasDefaultToLocal(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DefaultToLocal);
}
FC_DefaultToLocal& AssignDefaultToLocal(const FECSEntity &inout Entity, const FC_DefaultToLocal &inout DefaultValue = FC_DefaultToLocal())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DefaultToLocal, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDefaultToLocal_BP(const FECSEntity &inout Entity, const FC_DefaultToLocal &inout DefaultValue = FC_DefaultToLocal())
{
    ECSFunc_FC_DefaultToLocal::AssignDefaultToLocal(Entity, DefaultValue);
    return;
}
FC_DefaultToLocal& ModifyDefaultToLocal(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DefaultToLocal));
    return local_12.GetComp();
}
FC_DefaultToLocal& ModifyOrAddDefaultToLocal(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DefaultToLocal));
    return local_12.GetComp();
}
const FC_DefaultToLocal& GetDefaultToLocal(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DefaultToLocal));
    return local_12.GetComp();
}
UFUNCTION()
FC_DefaultToLocal GetDefaultToLocal_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_DefaultToLocal __r;
    bValid = false;
    bValid = ECSFunc_FC_DefaultToLocal::GetDefaultToLocal(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_DefaultToLocal GetDefaultedDefaultToLocal(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DefaultToLocal __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DefaultToLocal);
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
FC_DefaultToLocal GetDefaultedDefaultToLocal_BP(const FECSEntity &inout Entity)
{
    FC_DefaultToLocal __r;
    return __r;
}
UFUNCTION()
bool RemoveDefaultToLocal(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DefaultToLocal);
}
}
FECSMonitorRuntimeView __GetMonitorDefaultToLocalOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DefaultToLocal, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDefaultToLocalOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DefaultToLocal, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDefaultToLocalOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DefaultToLocal, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDefaultToLocalOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DefaultToLocal, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDefaultToLocalOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DefaultToLocal, bFixedFrame, bMustHandleAll);
}
void __MonitorDefaultToLocalLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DefaultToLocal, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDefaultToLocalActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DefaultToLocal, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDefaultToLocalModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DefaultToLocal, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DefaultHasCorrespondingLocalTag
{
UFUNCTION()
bool HasDefaultHasCorrespondingLocalTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DefaultHasCorrespondingLocalTag);
}
FC_DefaultHasCorrespondingLocalTag& AssignDefaultHasCorrespondingLocalTag(const FECSEntity &inout Entity, const FC_DefaultHasCorrespondingLocalTag &inout DefaultValue = FC_DefaultHasCorrespondingLocalTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DefaultHasCorrespondingLocalTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDefaultHasCorrespondingLocalTag_BP(const FECSEntity &inout Entity, const FC_DefaultHasCorrespondingLocalTag &inout DefaultValue = FC_DefaultHasCorrespondingLocalTag())
{
    ECSFunc_FC_DefaultHasCorrespondingLocalTag::AssignDefaultHasCorrespondingLocalTag(Entity, DefaultValue);
    return;
}
FC_DefaultHasCorrespondingLocalTag& ModifyDefaultHasCorrespondingLocalTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DefaultHasCorrespondingLocalTag));
    return local_12.GetComp();
}
FC_DefaultHasCorrespondingLocalTag& ModifyOrAddDefaultHasCorrespondingLocalTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DefaultHasCorrespondingLocalTag));
    return local_12.GetComp();
}
const FC_DefaultHasCorrespondingLocalTag& GetDefaultHasCorrespondingLocalTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DefaultHasCorrespondingLocalTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_DefaultHasCorrespondingLocalTag GetDefaultHasCorrespondingLocalTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DefaultHasCorrespondingLocalTag& local_4 = ECSFunc_FC_DefaultHasCorrespondingLocalTag::GetDefaultHasCorrespondingLocalTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DefaultHasCorrespondingLocalTag();
}
const FC_DefaultHasCorrespondingLocalTag GetDefaultedDefaultHasCorrespondingLocalTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DefaultHasCorrespondingLocalTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DefaultHasCorrespondingLocalTag);
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
FC_DefaultHasCorrespondingLocalTag GetDefaultedDefaultHasCorrespondingLocalTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DefaultHasCorrespondingLocalTag::GetDefaultedDefaultHasCorrespondingLocalTag(Entity);
}
UFUNCTION()
bool RemoveDefaultHasCorrespondingLocalTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DefaultHasCorrespondingLocalTag);
}
}
FECSMonitorRuntimeView __GetMonitorDefaultHasCorrespondingLocalTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DefaultHasCorrespondingLocalTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDefaultHasCorrespondingLocalTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DefaultHasCorrespondingLocalTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDefaultHasCorrespondingLocalTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DefaultHasCorrespondingLocalTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDefaultHasCorrespondingLocalTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DefaultHasCorrespondingLocalTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDefaultHasCorrespondingLocalTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DefaultHasCorrespondingLocalTag, bFixedFrame, bMustHandleAll);
}
void __MonitorDefaultHasCorrespondingLocalTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DefaultHasCorrespondingLocalTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDefaultHasCorrespondingLocalTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DefaultHasCorrespondingLocalTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDefaultHasCorrespondingLocalTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DefaultHasCorrespondingLocalTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_LocalToDefault
{
UFUNCTION()
bool HasLocalToDefault(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LocalToDefault);
}
FC_LocalToDefault& AssignLocalToDefault(const FECSEntity &inout Entity, const FC_LocalToDefault &inout DefaultValue = FC_LocalToDefault())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LocalToDefault, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLocalToDefault_BP(const FECSEntity &inout Entity, const FC_LocalToDefault &inout DefaultValue = FC_LocalToDefault())
{
    ECSFunc_FC_LocalToDefault::AssignLocalToDefault(Entity, DefaultValue);
    return;
}
FC_LocalToDefault& ModifyLocalToDefault(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LocalToDefault));
    return local_12.GetComp();
}
FC_LocalToDefault& ModifyOrAddLocalToDefault(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LocalToDefault));
    return local_12.GetComp();
}
const FC_LocalToDefault& GetLocalToDefault(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LocalToDefault));
    return local_12.GetComp();
}
UFUNCTION()
FC_LocalToDefault GetLocalToDefault_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_LocalToDefault __r;
    bValid = false;
    bValid = ECSFunc_FC_LocalToDefault::GetLocalToDefault(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_LocalToDefault GetDefaultedLocalToDefault(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LocalToDefault __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LocalToDefault);
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
FC_LocalToDefault GetDefaultedLocalToDefault_BP(const FECSEntity &inout Entity)
{
    FC_LocalToDefault __r;
    return __r;
}
UFUNCTION()
bool RemoveLocalToDefault(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LocalToDefault);
}
}
FECSMonitorRuntimeView __GetMonitorLocalToDefaultOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LocalToDefault, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLocalToDefaultOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LocalToDefault, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLocalToDefaultOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LocalToDefault, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLocalToDefaultOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LocalToDefault, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLocalToDefaultOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LocalToDefault, bFixedFrame, bMustHandleAll);
}
void __MonitorLocalToDefaultLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LocalToDefault, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLocalToDefaultActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LocalToDefault, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLocalToDefaultModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LocalToDefault, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AccountExclusivePropConfig
{
UFUNCTION()
bool HasAccountExclusivePropConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusivePropConfig);
}
FC_AccountExclusivePropConfig& AssignAccountExclusivePropConfig(const FECSEntity &inout Entity, const FC_AccountExclusivePropConfig &inout DefaultValue = FC_AccountExclusivePropConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusivePropConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAccountExclusivePropConfig_BP(const FECSEntity &inout Entity, const FC_AccountExclusivePropConfig &inout DefaultValue = FC_AccountExclusivePropConfig())
{
    ECSFunc_FC_AccountExclusivePropConfig::AssignAccountExclusivePropConfig(Entity, DefaultValue);
    return;
}
FC_AccountExclusivePropConfig& ModifyAccountExclusivePropConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusivePropConfig));
    return local_12.GetComp();
}
FC_AccountExclusivePropConfig& ModifyOrAddAccountExclusivePropConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusivePropConfig));
    return local_12.GetComp();
}
const FC_AccountExclusivePropConfig& GetAccountExclusivePropConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusivePropConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_AccountExclusivePropConfig GetAccountExclusivePropConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AccountExclusivePropConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_AccountExclusivePropConfig::GetAccountExclusivePropConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AccountExclusivePropConfig GetDefaultedAccountExclusivePropConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AccountExclusivePropConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusivePropConfig);
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
FC_AccountExclusivePropConfig GetDefaultedAccountExclusivePropConfig_BP(const FECSEntity &inout Entity)
{
    FC_AccountExclusivePropConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveAccountExclusivePropConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusivePropConfig);
}
}
FECSMonitorRuntimeView __GetMonitorAccountExclusivePropConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AccountExclusivePropConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAccountExclusivePropConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AccountExclusivePropConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAccountExclusivePropConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AccountExclusivePropConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAccountExclusivePropConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AccountExclusivePropConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAccountExclusivePropConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AccountExclusivePropConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorAccountExclusivePropConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AccountExclusivePropConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAccountExclusivePropConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AccountExclusivePropConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAccountExclusivePropConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AccountExclusivePropConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AccountExclusivePropClientDisableInteract
{
UFUNCTION()
bool HasAccountExclusivePropClientDisableInteract(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusivePropClientDisableInteract);
}
FC_AccountExclusivePropClientDisableInteract& AssignAccountExclusivePropClientDisableInteract(const FECSEntity &inout Entity, const FC_AccountExclusivePropClientDisableInteract &inout DefaultValue = FC_AccountExclusivePropClientDisableInteract())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusivePropClientDisableInteract, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAccountExclusivePropClientDisableInteract_BP(const FECSEntity &inout Entity, const FC_AccountExclusivePropClientDisableInteract &inout DefaultValue = FC_AccountExclusivePropClientDisableInteract())
{
    ECSFunc_FC_AccountExclusivePropClientDisableInteract::AssignAccountExclusivePropClientDisableInteract(Entity, DefaultValue);
    return;
}
FC_AccountExclusivePropClientDisableInteract& ModifyAccountExclusivePropClientDisableInteract(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusivePropClientDisableInteract));
    return local_12.GetComp();
}
FC_AccountExclusivePropClientDisableInteract& ModifyOrAddAccountExclusivePropClientDisableInteract(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusivePropClientDisableInteract));
    return local_12.GetComp();
}
const FC_AccountExclusivePropClientDisableInteract& GetAccountExclusivePropClientDisableInteract(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusivePropClientDisableInteract));
    return local_12.GetComp();
}
UFUNCTION()
FC_AccountExclusivePropClientDisableInteract GetAccountExclusivePropClientDisableInteract_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AccountExclusivePropClientDisableInteract& local_4 = ECSFunc_FC_AccountExclusivePropClientDisableInteract::GetAccountExclusivePropClientDisableInteract(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AccountExclusivePropClientDisableInteract();
}
const FC_AccountExclusivePropClientDisableInteract GetDefaultedAccountExclusivePropClientDisableInteract(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AccountExclusivePropClientDisableInteract __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusivePropClientDisableInteract);
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
FC_AccountExclusivePropClientDisableInteract GetDefaultedAccountExclusivePropClientDisableInteract_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AccountExclusivePropClientDisableInteract::GetDefaultedAccountExclusivePropClientDisableInteract(Entity);
}
UFUNCTION()
bool RemoveAccountExclusivePropClientDisableInteract(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AccountExclusivePropClientDisableInteract);
}
}
FECSMonitorRuntimeView __GetMonitorAccountExclusivePropClientDisableInteractOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AccountExclusivePropClientDisableInteract, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAccountExclusivePropClientDisableInteractOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AccountExclusivePropClientDisableInteract, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAccountExclusivePropClientDisableInteractOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AccountExclusivePropClientDisableInteract, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAccountExclusivePropClientDisableInteractOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AccountExclusivePropClientDisableInteract, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAccountExclusivePropClientDisableInteractOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AccountExclusivePropClientDisableInteract, bFixedFrame, bMustHandleAll);
}
void __MonitorAccountExclusivePropClientDisableInteractLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AccountExclusivePropClientDisableInteract, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAccountExclusivePropClientDisableInteractActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AccountExclusivePropClientDisableInteract, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAccountExclusivePropClientDisableInteractModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AccountExclusivePropClientDisableInteract, bFixedFrame, Details);
    return;
}
