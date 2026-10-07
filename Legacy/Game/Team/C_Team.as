
namespace EntityBB
{
    const FEntityNativeBBName _TeamInfo_fGetTeamLinkEnergy = FEntityNativeBBName();
}
namespace __INTENRAL_FCS_TeamManager_NS
{
    const TECSComponentDerivedPtr<FCS_TeamManager> DerivedPtr = TECSComponentDerivedPtr<FCS_TeamManager>();
    const FCS_TeamManager DefaultValue = FCS_TeamManager();
}
namespace __INTENRAL_FC_TeamInfo_NS
{
    const TECSComponentDerivedPtr<FC_TeamInfo> DerivedPtr = TECSComponentDerivedPtr<FC_TeamInfo>();
    const FC_TeamInfo DefaultValue = FC_TeamInfo();
}
namespace __INTENRAL_FC_PlayerInTeam_NS
{
    const TECSComponentDerivedPtr<FC_PlayerInTeam> DerivedPtr = TECSComponentDerivedPtr<FC_PlayerInTeam>();
    const FC_PlayerInTeam DefaultValue = FC_PlayerInTeam();
}
namespace __INTENRAL_FCE_TeamJoin_NS
{
    const TECSEventDerivedPtr<FCE_TeamJoin> DerivedPtr = TECSEventDerivedPtr<FCE_TeamJoin>();
}
namespace __INTENRAL_FCE_ServerToClientTeamJoin_NS
{
    const TECSEventDerivedPtr<FCE_ServerToClientTeamJoin> DerivedPtr = TECSEventDerivedPtr<FCE_ServerToClientTeamJoin>();
}
namespace __INTENRAL_FCE_ClientToServerNearbyPlayerList_NS
{
    const TECSEventDerivedPtr<FCE_ClientToServerNearbyPlayerList> DerivedPtr = TECSEventDerivedPtr<FCE_ClientToServerNearbyPlayerList>();
}
namespace __INTENRAL_FCE_S2CNearbyrPlayerListRsp_NS
{
    const TECSEventDerivedPtr<FCE_S2CNearbyrPlayerListRsp> DerivedPtr = TECSEventDerivedPtr<FCE_S2CNearbyrPlayerListRsp>();
}
namespace __INTENRAL_FCE_ClientToServerTeamUp_NS
{
    const TECSEventDerivedPtr<FCE_ClientToServerTeamUp> DerivedPtr = TECSEventDerivedPtr<FCE_ClientToServerTeamUp>();
}
namespace __INTENRAL_FCE_ClientToServerLeaveTeam_NS
{
    const TECSEventDerivedPtr<FCE_ClientToServerLeaveTeam> DerivedPtr = TECSEventDerivedPtr<FCE_ClientToServerLeaveTeam>();
}
namespace __INTENRAL_FCE_ClientToServerKickTeammate_NS
{
    const TECSEventDerivedPtr<FCE_ClientToServerKickTeammate> DerivedPtr = TECSEventDerivedPtr<FCE_ClientToServerKickTeammate>();
}
namespace __INTENRAL_FCE_ClientToServerTransferCaptain_NS
{
    const TECSEventDerivedPtr<FCE_ClientToServerTransferCaptain> DerivedPtr = TECSEventDerivedPtr<FCE_ClientToServerTransferCaptain>();
}
namespace __INTENRAL_FCE_ClientToServerTeamInviteReply_NS
{
    const TECSEventDerivedPtr<FCE_ClientToServerTeamInviteReply> DerivedPtr = TECSEventDerivedPtr<FCE_ClientToServerTeamInviteReply>();
}
namespace __INTENRAL_FCE_ClientToServerTeamApplyReply_NS
{
    const TECSEventDerivedPtr<FCE_ClientToServerTeamApplyReply> DerivedPtr = TECSEventDerivedPtr<FCE_ClientToServerTeamApplyReply>();
}
namespace __INTENRAL_FCE_RescuedByTeammate_NS
{
    const TECSEventDerivedPtr<FCE_RescuedByTeammate> DerivedPtr = TECSEventDerivedPtr<FCE_RescuedByTeammate>();

}
struct FCS_TeamManager : FECSSingleton
{
    UPROPERTY()
    TArray<FECSEntity> AllTeams;

    FCS_TeamManager()
    {
        return;
    }
}

struct FTeamMemberInfo
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_Entity;
    UPROPERTY()
    FVector m_Position;
    UPROPERTY()
    float32 m_HealthRation;
    UPROPERTY()
    TDataObjectPtr<FAvatarPrefabConfig> m_AvatarConfig;

    FTeamMemberInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FTeamMemberInfo(const FTeamMemberInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FTeamMemberInfo opAssign(const FTeamMemberInfo &inout Other)
    {
        FTeamMemberInfo __r;
        this.SetEntity(Other.GetEntity());
        this.SetPosition(Other.GetPosition());
        this.SetHealthRation(Other.GetHealthRation());
        this.SetAvatarConfig(Other.GetAvatarConfig());
        return __r;
    }
    FECSEntity GetEntity() const property
    {
        FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_Entity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Entity = __Value;
        return;
    }
    FVector GetPosition() const property
    {
        FVector __r;
        return __r;
    }
    FVector GetModify_Position() property
    {
        FVector __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetPosition(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_Position = __Value;
        return;
    }
    float32 GetHealthRation() const property
    {
        return this.m_HealthRation;
    }
    void SetHealthRation(const float32 __Value) property
    {
        if (this.m_HealthRation == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_HealthRation = __Value;
        return;
    }
    TDataObjectPtr<FAvatarPrefabConfig> GetAvatarConfig() const property
    {
        TDataObjectPtr<FAvatarPrefabConfig> __r;
        return __r;
    }
    TDataObjectPtr<FAvatarPrefabConfig> GetModify_AvatarConfig() property
    {
        TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetAvatarConfig(const TDataObjectPtr<FAvatarPrefabConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_AvatarConfig = __Value;
        return;
    }
}

struct FC_TeamInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    uint64 m_SocialTeamId;
    UPROPERTY()
    int m_TeamID;
    UPROPERTY()
    TArray<FTeamMemberInfo> m_Members;
    UPROPERTY()
    float32 m_TeamLinkEnergy;

    FC_TeamInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_TeamInfo(const FC_TeamInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_TeamInfo opAssign(const FC_TeamInfo &inout Other)
    {
        FC_TeamInfo __r;
        this.SetSocialTeamId(Other.GetSocialTeamId());
        this.SetTeamID(Other.GetTeamID());
        this.SetMembers(Other.GetMembers());
        this.SetTeamLinkEnergy(Other.GetTeamLinkEnergy());
        return __r;
    }
    bool HasMember(const FECSEntity &inout MemberEntity) const
    {
        for (auto& local_16 : this.GetMembers())
        {
            if ((FECSEntity(local_16.GetEntity()) == MemberEntity))
            {
                return true;
            }
        }
        return false;
    }
    void AddMember(const FECSEntity &inout MemberEntity)
    {
        FTeamMemberInfo local_38;
        local_38.SetEntity(MemberEntity);
        this.GetModify_Members().Add(local_38);
        return;
    }
    void RemoveMember(const FECSEntity &inout MemberEntity)
    {
        int local_1 = 0;
        for (; local_1 < this.GetMembers().Num(); ++local_1)
        {
            if ((FECSEntity(this.GetMembers()[local_1].GetEntity()) == MemberEntity))
            {
                this.GetModify_Members().RemoveAt(local_1);
                break;
            }
        }
        return;
    }
    uint64 GetSocialTeamId() const property
    {
        return this.m_SocialTeamId;
    }
    void SetSocialTeamId(const uint64 __Value) property
    {
        if (this.m_SocialTeamId == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_SocialTeamId = __Value;
        return;
    }
    int GetTeamID() const property
    {
        return this.m_TeamID;
    }
    void SetTeamID(const int __Value) property
    {
        if (this.m_TeamID == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_TeamID = __Value;
        return;
    }
    const TArray<FTeamMemberInfo> GetMembers() const property
    {
        const TArray<FTeamMemberInfo> __r;
        return __r;
    }
    TArray<FTeamMemberInfo> GetModify_Members() property
    {
        TArray<FTeamMemberInfo> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetMembers(const TArray<FTeamMemberInfo> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_Members = __Value;
        return;
    }
    float32 GetTeamLinkEnergy() const property
    {
        return this.m_TeamLinkEnergy;
    }
    void SetTeamLinkEnergy(const float32 __Value) property
    {
        if (this.m_TeamLinkEnergy == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_TeamLinkEnergy = __Value;
        return;
    }
}

struct FC_PlayerInTeam : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_TeamEntity;

    FC_PlayerInTeam()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_PlayerInTeam(const FC_PlayerInTeam &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_TeamEntity = Other.m_TeamEntity;
        return;
    }
    FC_PlayerInTeam opAssign(const FC_PlayerInTeam &inout Other)
    {
        FC_PlayerInTeam __r;
        this.SetTeamEntity(Other.GetTeamEntity());
        return __r;
    }
    int GetTeamMemberCount() const
    {
        int local_14 = 0;
        Has local_6;
        if (!(this.GetTeamEntity().IsValid()) || !(local_6.opCall()))
        {
            return 1;
        }
        return local_14.GetMembers().IsEmpty() ? 1 : local_14.GetMembers().Num();
    }
    const FECSEntity GetTeamEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_TeamEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetTeamEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_TeamEntity = __Value;
        return;
    }
}

struct FCE_TeamJoin : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity Inviter;
    UPROPERTY()
    bool bAccept;


}

struct FCE_ServerToClientTeamJoin : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity Inviter;
    UPROPERTY()
    FECSEntity Invitee;

    FCE_ServerToClientTeamJoin()
    {
        return;
    }
}

struct FCE_ClientToServerNearbyPlayerList : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_ClientToServerNearbyPlayerList()
    {
        return;
    }
}

struct FCE_S2CNearbyrPlayerListRsp : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TArray<FPlayerBriefInfo> NearbyPlayerList;
    UPROPERTY()
    TMap<uint, float32> PlayerDistanceMap;

    FCE_S2CNearbyrPlayerListRsp()
    {
        return;
    }
}

struct FCE_ClientToServerTeamUp : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    uint TargetUid;


}

struct FCE_ClientToServerLeaveTeam : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    uint64 TeamId;


    bool Validate() const
    {
        return true;
    }
}

struct FCE_ClientToServerKickTeammate : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    uint64 TeamId;
    UPROPERTY()
    uint KickUid;


    bool Validate() const
    {
        return true;
    }
}

struct FCE_ClientToServerTransferCaptain : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    uint64 TeamId;
    UPROPERTY()
    uint NewCaptainUid;


    bool Validate() const
    {
        return true;
    }
}

struct FCE_ClientToServerTeamInviteReply : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    uint64 TeamId;
    UPROPERTY()
    uint SourceUid;
    UPROPERTY()
    bool bAccept;


    bool Validate() const
    {
        return true;
    }
}

struct FCE_ClientToServerTeamApplyReply : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    uint64 TeamId;
    UPROPERTY()
    uint SourceUid;
    UPROPERTY()
    bool bAccept;


    bool Validate() const
    {
        return true;
    }
}

struct FCE_RescuedByTeammate : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity RescuedByEntity;

    FCE_RescuedByTeammate()
    {
        return;
    }
}

namespace EntityBB
{
void GetEntityBBVar_TeamInfo_TeamLinkEnergy(const FECSEntity &inout Entity, float32 &inout OutRetValue)
{
    OutRetValue = FTeamUtils::GetTeamLinkEnergy(Entity);
    return;
}
}
namespace ECSFunc_FCS_TeamManager
{
UFUNCTION()
bool HasTeamManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_TeamManager);
}
FCS_TeamManager& AssignTeamManager(const FECSWorldPtr &inout World, const FCS_TeamManager &inout DefaultValue = FCS_TeamManager())
{
    UScriptStruct local_6 = FCS_TeamManager;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignTeamManager_BP(const FECSWorldPtr &inout World, const FCS_TeamManager &inout DefaultValue = FCS_TeamManager())
{
    ECSFunc_FCS_TeamManager::AssignTeamManager(World, DefaultValue);
    return;
}
FCS_TeamManager& ModifyTeamManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TeamManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_TeamManager& ModifyOrAddTeamManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TeamManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_TeamManager& GetTeamManager(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_TeamManager;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_TeamManager GetTeamManager_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_TeamManager __r;
    bValid = false;
    bValid = ECSFunc_FCS_TeamManager::GetTeamManager(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_TeamManager GetDefaultedTeamManager(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_TeamManager __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_TeamManager);
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
FCS_TeamManager GetDefaultedTeamManager_BP(const FECSWorldPtr &inout World)
{
    FCS_TeamManager __r;
    return __r;
}
UFUNCTION()
bool RemoveTeamManager(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_TeamManager);
}
}
void __MonitorTeamManagerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_TeamManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTeamManagerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_TeamManager, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTeamManagerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_TeamManager, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_TeamInfo
{
UFUNCTION()
bool HasTeamInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_TeamInfo);
}
FC_TeamInfo& AssignTeamInfo(const FECSEntity &inout Entity, const FC_TeamInfo &inout DefaultValue = FC_TeamInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_TeamInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignTeamInfo_BP(const FECSEntity &inout Entity, const FC_TeamInfo &inout DefaultValue = FC_TeamInfo())
{
    ECSFunc_FC_TeamInfo::AssignTeamInfo(Entity, DefaultValue);
    return;
}
FC_TeamInfo& ModifyTeamInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_TeamInfo));
    return local_12.GetComp();
}
FC_TeamInfo& ModifyOrAddTeamInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_TeamInfo));
    return local_12.GetComp();
}
const FC_TeamInfo& GetTeamInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_TeamInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_TeamInfo GetTeamInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_TeamInfo& local_4 = ECSFunc_FC_TeamInfo::GetTeamInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_TeamInfo();
}
const FC_TeamInfo GetDefaultedTeamInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_TeamInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_TeamInfo);
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
FC_TeamInfo GetDefaultedTeamInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_TeamInfo::GetDefaultedTeamInfo(Entity);
}
UFUNCTION()
bool RemoveTeamInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_TeamInfo);
}
}
FECSMonitorRuntimeView __GetMonitorTeamInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_TeamInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeamInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_TeamInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeamInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_TeamInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeamInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_TeamInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorTeamInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_TeamInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorTeamInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_TeamInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTeamInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_TeamInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorTeamInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_TeamInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PlayerInTeam
{
UFUNCTION()
bool HasPlayerInTeam(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PlayerInTeam);
}
FC_PlayerInTeam& AssignPlayerInTeam(const FECSEntity &inout Entity, const FC_PlayerInTeam &inout DefaultValue = FC_PlayerInTeam())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PlayerInTeam, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPlayerInTeam_BP(const FECSEntity &inout Entity, const FC_PlayerInTeam &inout DefaultValue = FC_PlayerInTeam())
{
    ECSFunc_FC_PlayerInTeam::AssignPlayerInTeam(Entity, DefaultValue);
    return;
}
FC_PlayerInTeam& ModifyPlayerInTeam(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PlayerInTeam));
    return local_12.GetComp();
}
FC_PlayerInTeam& ModifyOrAddPlayerInTeam(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PlayerInTeam));
    return local_12.GetComp();
}
const FC_PlayerInTeam& GetPlayerInTeam(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PlayerInTeam));
    return local_12.GetComp();
}
UFUNCTION()
FC_PlayerInTeam GetPlayerInTeam_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PlayerInTeam& local_4 = ECSFunc_FC_PlayerInTeam::GetPlayerInTeam(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PlayerInTeam();
}
const FC_PlayerInTeam GetDefaultedPlayerInTeam(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PlayerInTeam __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PlayerInTeam);
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
FC_PlayerInTeam GetDefaultedPlayerInTeam_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PlayerInTeam::GetDefaultedPlayerInTeam(Entity);
}
UFUNCTION()
bool RemovePlayerInTeam(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PlayerInTeam);
}
}
FECSMonitorRuntimeView __GetMonitorPlayerInTeamOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PlayerInTeam, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerInTeamOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PlayerInTeam, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerInTeamOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PlayerInTeam, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerInTeamOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PlayerInTeam, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPlayerInTeamOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PlayerInTeam, bFixedFrame, bMustHandleAll);
}
void __MonitorPlayerInTeamLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PlayerInTeam, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerInTeamActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PlayerInTeam, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPlayerInTeamModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PlayerInTeam, bFixedFrame, Details);
    return;
}
namespace EntityBB
{
void GetEntityBBVar_PlayerInTeam_GetTeamMemberCount(const FECSEntity &inout Entity, int &inout OutRetValue)
{
    GetDefaulted local_4;
    FECSEntity local_10 = local_4.opCall().GetOwnerEntityWithWorld(Entity.GetWorld());
    GetDefaulted local_18;
    OutRetValue = local_18.opCall().GetTeamMemberCount();
    return;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FTeamMemberInfo &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FTeamMemberInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FTeamMemberInfo
{
int __IndexOf_Entity()
{
    return 0;
}
int __IndexOf_Position()
{
    return 1;
}
int __IndexOf_HealthRation()
{
    return 2;
}
int __IndexOf_AvatarConfig()
{
    return 3;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_TeamInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_TeamInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_TeamInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_TeamInfo
{
int __IndexOf_SocialTeamId()
{
    return 0;
}
int __IndexOf_TeamID()
{
    return 1;
}
int __IndexOf_Members()
{
    return 2;
}
int __IndexOf_TeamLinkEnergy()
{
    return 3;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_PlayerInTeam &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_PlayerInTeam &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_PlayerInTeam &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_PlayerInTeam
{
int __IndexOf_TeamEntity()
{
    return 0;
}
}
