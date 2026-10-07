
enum EChangeRoleFailReason
{
    None,
    ControllerInvalid,
    ConditionNotMet,
    AvatarNotOwned,
    InvalidSlot,
    ActivePawnMismatch,
    ConfigInvalid,
    FakeControl,
    SpawnFailed,
}

namespace __INTENRAL_FCS_AvatarConfigTable_NS
{
    const TECSComponentDerivedPtr<FCS_AvatarConfigTable> DerivedPtr = TECSComponentDerivedPtr<FCS_AvatarConfigTable>();
    const FCS_AvatarConfigTable DefaultValue = FCS_AvatarConfigTable();
}
namespace __INTENRAL_FCE_ClientToServerChangeRole_NS
{
    const TECSEventDerivedPtr<FCE_ClientToServerChangeRole> DerivedPtr = TECSEventDerivedPtr<FCE_ClientToServerChangeRole>();
}
namespace __INTENRAL_FCE_ClientChangeSpecialty_NS
{
    const TECSEventDerivedPtr<FCE_ClientChangeSpecialty> DerivedPtr = TECSEventDerivedPtr<FCE_ClientChangeSpecialty>();
}
namespace __INTENRAL_FCE_ServerToClientChangeRole_NS
{
    const TECSEventDerivedPtr<FCE_ServerToClientChangeRole> DerivedPtr = TECSEventDerivedPtr<FCE_ServerToClientChangeRole>();
}
namespace __INTENRAL_FCE_ServerToClientChangeRoleResult_NS
{
    const TECSEventDerivedPtr<FCE_ServerToClientChangeRoleResult> DerivedPtr = TECSEventDerivedPtr<FCE_ServerToClientChangeRoleResult>();
}
namespace __INTENRAL_FCE_SwitchMainAvatarGender_NS
{
    const TECSEventDerivedPtr<FCE_SwitchMainAvatarGender> DerivedPtr = TECSEventDerivedPtr<FCE_SwitchMainAvatarGender>();
}
namespace __INTENRAL_FCE_ClientToServerChangeName_NS
{
    const TECSEventDerivedPtr<FCE_ClientToServerChangeName> DerivedPtr = TECSEventDerivedPtr<FCE_ClientToServerChangeName>();
}
namespace __INTENRAL_FCE_ServerToClientChangeName_NS
{
    const TECSEventDerivedPtr<FCE_ServerToClientChangeName> DerivedPtr = TECSEventDerivedPtr<FCE_ServerToClientChangeName>();

}
struct FCS_AvatarConfigTable : FECSSingleton
{
    UPROPERTY()
    TWeakObjectPtr<UDataTable> DTRoles;

    FCS_AvatarConfigTable()
    {
        return;
    }
}

struct FCE_ClientToServerChangeRole : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    int SlotIndex;
    UPROPERTY()
    uint AvatarId;
    UPROPERTY()
    bool bForceChangeRole = false;


    bool Validate() const
    {
        Has local_4;
        return local_4.opCall();
    }
}

struct FCE_ClientChangeSpecialty : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    uint FromAvatarId;
    UPROPERTY()
    uint ToAvatarId;


    bool Validate() const
    {
        Has local_4;
        return local_4.opCall();
    }
}

struct FCE_ServerToClientChangeRole : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    int SlotIndex;
    UPROPERTY()
    FECSEntity OldPawnEntity;
    UPROPERTY()
    FECSEntity NewPawnEntity;


}

struct FCE_ServerToClientChangeRoleResult : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    int SlotIndex;
    UPROPERTY()
    uint AvatarId;
    UPROPERTY()
    bool bAccepted = false;
    UPROPERTY()
    EChangeRoleFailReason Reason = EChangeRoleFailReason(0);
    UPROPERTY()
    ESwitchPlayerBlockReason BlockReason = ESwitchPlayerBlockReason(0);


}

struct FCE_SwitchMainAvatarGender : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    uint CurAvatarId;
    UPROPERTY()
    uint SwitchAvatarId;


}

struct FCE_ClientToServerChangeName : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FString PlayerName;

    FCE_ClientToServerChangeName()
    {
        return;
    }
}

struct FCE_ServerToClientChangeName : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_ServerToClientChangeName()
    {
        return;
    }
}

namespace ECSFunc_FCS_AvatarConfigTable
{
UFUNCTION()
bool HasAvatarConfigTable(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_AvatarConfigTable);
}
FCS_AvatarConfigTable& AssignAvatarConfigTable(const FECSWorldPtr &inout World, const FCS_AvatarConfigTable &inout DefaultValue = FCS_AvatarConfigTable())
{
    UScriptStruct local_6 = FCS_AvatarConfigTable;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignAvatarConfigTable_BP(const FECSWorldPtr &inout World, const FCS_AvatarConfigTable &inout DefaultValue = FCS_AvatarConfigTable())
{
    ECSFunc_FCS_AvatarConfigTable::AssignAvatarConfigTable(World, DefaultValue);
    return;
}
FCS_AvatarConfigTable& ModifyAvatarConfigTable(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_AvatarConfigTable;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_AvatarConfigTable& ModifyOrAddAvatarConfigTable(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_AvatarConfigTable;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_AvatarConfigTable& GetAvatarConfigTable(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_AvatarConfigTable;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_AvatarConfigTable GetAvatarConfigTable_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_AvatarConfigTable __r;
    bValid = false;
    bValid = ECSFunc_FCS_AvatarConfigTable::GetAvatarConfigTable(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_AvatarConfigTable GetDefaultedAvatarConfigTable(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_AvatarConfigTable __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_AvatarConfigTable);
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
FCS_AvatarConfigTable GetDefaultedAvatarConfigTable_BP(const FECSWorldPtr &inout World)
{
    FCS_AvatarConfigTable __r;
    return __r;
}
UFUNCTION()
bool RemoveAvatarConfigTable(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_AvatarConfigTable);
}
}
void __MonitorAvatarConfigTableLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_AvatarConfigTable, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAvatarConfigTableActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_AvatarConfigTable, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAvatarConfigTableModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_AvatarConfigTable, bFixedFrame, Details);
    return;
}
