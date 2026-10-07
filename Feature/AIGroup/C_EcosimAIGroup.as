
enum EGroupCommandType
{
    BeAFreeMan,
    MoveToSpeicificLocation,
}

namespace __INTENRAL_FC_AIGroupData_NS
{
    const TECSComponentDerivedPtr<FC_AIGroupData> DerivedPtr = TECSComponentDerivedPtr<FC_AIGroupData>();
    const FC_AIGroupData DefaultValue = FC_AIGroupData();
}
namespace __INTENRAL_FC_AIGroupFollowCaptain_NS
{
    const TECSComponentDerivedPtr<FC_AIGroupFollowCaptain> DerivedPtr = TECSComponentDerivedPtr<FC_AIGroupFollowCaptain>();
    const FC_AIGroupFollowCaptain DefaultValue = FC_AIGroupFollowCaptain();

}
struct FGroupMemberEntityInfo
{
    UPROPERTY()
    FECSEntity MemberEntity;
    UPROPERTY()
    EGroupCommandType GroupCommand;
    UPROPERTY()
    FVector GroupOffset;
    UPROPERTY()
    FECSEntity GroupSpecifiedTarget;

    FGroupMemberEntityInfo()
    {
        this.GroupCommand = EGroupCommandType(0);
        this.GroupOffset = FVector::ZeroVector;
        this.GroupSpecifiedTarget = ENTITY_NULL;
        return;
    }
    FGroupMemberEntityInfo(const FECSEntity &inout InMemberEntity)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    bool opEquals(const FGroupMemberEntityInfo &inout Other) const
    {
        return (FECSEntity(this) == Other.MemberEntity);
    }
}

struct FGroupTargetEntityInfo
{
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    TArray<FECSEntity> MemberEntityWhoIsTargetingThisEntity;

    FGroupTargetEntityInfo()
    {
        return;
    }
}

struct FC_AIGroupData : FECSComponent
{
    UPROPERTY()
    int GroupID;
    UPROPERTY()
    FName GroupName;
    UPROPERTY()
    int SupposedTeamNumber;
    UPROPERTY()
    int DeadCount;
    UPROPERTY()
    FECSEntity TeamEntity = ENTITY_NULL;
    UPROPERTY()
    TArray<FGroupMemberEntityInfo> MemberEntityInfos;
    UPROPERTY()
    FECSEntity CaptainEntity;


    void Initialize(const FECSEntity &inout InTeamEntity)
    {
        this.TeamEntity = InTeamEntity;
        return;
    }
    void SetSupposedTeamNumber(const int InSupposedTeamNumber)
    {
        this.SupposedTeamNumber = InSupposedTeamNumber;
        return;
    }
    FGroupMemberEntityInfo GetGroupMemberEntityInfo(const FECSEntity &inout InMemberEntity) const
    {
        FGroupMemberEntityInfo __r;
        for (auto& local_16 : this.MemberEntityInfos)
        {
            if ((local_16.MemberEntity == InMemberEntity))
            {
                return __r;
            }
        }
        FGroupMemberEntityInfo local_36 = FGroupMemberEntityInfo(ENTITY_NULL);
        return __r;
    }
    EGroupCommandType GetGroupCommandType(const FECSEntity &inout InMemberEntity) const
    {
        FGroupMemberEntityInfo local_32 = this.GetGroupMemberEntityInfo(InMemberEntity);
        if ((local_32.MemberEntity == ENTITY_NULL))
        {
            return EGroupCommandType(0);
        }
        return local_32.GroupCommand;
    }
    int FindMemberIndex(const FECSEntity &inout InMemberEntity) const
    {
        int local_1 = 0;
        for (; local_1 < this.MemberEntityInfos.Num(); ++local_1)
        {
            if ((FECSEntity(this.MemberEntityInfos[local_1].MemberEntity) == InMemberEntity))
            {
                return local_1;
            }
        }
        return -1;
    }
    void RegisterMember(const FECSEntity &inout InMemberEntity)
    {
        int local_24 = 0;
        if (this.TeamEntity.IsValid() && InMemberEntity.IsValid())
        {
            this.MemberEntityInfos.AddUnique(FGroupMemberEntityInfo(InMemberEntity));
            local_24.TeamEntity = this.TeamEntity;
        }
        return;
    }
    void UnregisterMember(const FECSEntity &inout InMemberEntity)
    {
        bool local_3;
        int local_2 = this.FindMemberIndex(InMemberEntity);
        if (local_2 >= 0)
        {
            this.MemberEntityInfos.RemoveAt(local_2);
        }
        if (!(this.TeamEntity.IsValid()))
        {
            local_3 = false;
        }
        else
        {
            Has local_8;
            local_3 = local_8.opCall();
        }
        if (local_3)
        {
            Modify local_14;
            FC_AIGroupFollowCaptain& local_16 = local_14.opCall();
            if (local_16)
            {
                FECSEntity local_17;
                if (local_16.MemberSlotMap.Find(InMemberEntity, local_17))
                {
                    if (local_17 >= 0 && (local_17 < local_16.SlotStates.Num()))
                    {
                        local_16.SlotStates[local_17] = 0;
                    }
                }
            }
        }
        return;
    }
    void SetMemberCommand(const FECSEntity &inout InMemberEntity, const EGroupCommandType InGroupCommand, const FECSEntity &inout InGroupSpecifiedTarget, const FVector &inout InGroupOffset = FVector::ZeroVector)
    {
        int local_2 = this.FindMemberIndex(InMemberEntity);
        if (local_2 < 0)
        {
            return;
        }
        if (int(this.MemberEntityInfos[local_2].GroupCommand) == int(InGroupCommand))
        {
            if ((!((InGroupSpecifiedTarget == ENTITY_NULL))))
            {
                if ((FECSEntity(this.MemberEntityInfos[local_2].GroupSpecifiedTarget) == InGroupSpecifiedTarget))
                {
                    return;
                }
            }
            else
            {
                if (int(InGroupCommand) == 1)
                {
                    if ((FECSEntity(this.MemberEntityInfos[local_2].GroupSpecifiedTarget) == ENTITY_NULL) && this.MemberEntityInfos[local_2].GroupOffset.Equals(InGroupOffset, 9.999999747378752e-5))
                    {
                        return;
                    }
                }
                else
                {
                    return;
                }
            }
        }
        this.MemberEntityInfos[local_2].GroupCommand = InGroupCommand;
        if (!((InGroupSpecifiedTarget == ENTITY_NULL)))
        {
            this.MemberEntityInfos[local_2].GroupSpecifiedTarget = InGroupSpecifiedTarget;
            this.MemberEntityInfos[local_2].GroupOffset = FVector::ZeroVector;
            return;
        }
        this.MemberEntityInfos[local_2].GroupSpecifiedTarget = ENTITY_NULL;
        this.MemberEntityInfos[local_2].GroupOffset = InGroupOffset;
        return;
    }
}

struct FC_AIGroupFollowCaptain : FECSComponent
{
    UPROPERTY()
    float32 TickInterval = 0.5f;
    UPROPERTY()
    TArray<int> SlotStates;
    UPROPERTY()
    TMap<FECSEntity, int> MemberSlotMap;
    UPROPERTY()
    float32 AccumulatedTime = 0.0f;


}

namespace ECSFunc_FC_AIGroupData
{
UFUNCTION()
bool HasAIGroupData(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AIGroupData);
}
FC_AIGroupData& AssignAIGroupData(const FECSEntity &inout Entity, const FC_AIGroupData &inout DefaultValue = FC_AIGroupData())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AIGroupData, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAIGroupData_BP(const FECSEntity &inout Entity, const FC_AIGroupData &inout DefaultValue = FC_AIGroupData())
{
    ECSFunc_FC_AIGroupData::AssignAIGroupData(Entity, DefaultValue);
    return;
}
FC_AIGroupData& ModifyAIGroupData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AIGroupData));
    return local_12.GetComp();
}
FC_AIGroupData& ModifyOrAddAIGroupData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AIGroupData));
    return local_12.GetComp();
}
const FC_AIGroupData& GetAIGroupData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AIGroupData));
    return local_12.GetComp();
}
UFUNCTION()
FC_AIGroupData GetAIGroupData_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AIGroupData __r;
    bValid = false;
    bValid = ECSFunc_FC_AIGroupData::GetAIGroupData(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AIGroupData GetDefaultedAIGroupData(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AIGroupData __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AIGroupData);
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
FC_AIGroupData GetDefaultedAIGroupData_BP(const FECSEntity &inout Entity)
{
    FC_AIGroupData __r;
    return __r;
}
UFUNCTION()
bool RemoveAIGroupData(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AIGroupData);
}
}
FECSMonitorRuntimeView __GetMonitorAIGroupDataOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AIGroupData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIGroupDataOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AIGroupData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIGroupDataOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AIGroupData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIGroupDataOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AIGroupData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIGroupDataOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AIGroupData, bFixedFrame, bMustHandleAll);
}
void __MonitorAIGroupDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AIGroupData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIGroupDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AIGroupData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIGroupDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AIGroupData, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AIGroupFollowCaptain
{
UFUNCTION()
bool HasAIGroupFollowCaptain(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AIGroupFollowCaptain);
}
FC_AIGroupFollowCaptain& AssignAIGroupFollowCaptain(const FECSEntity &inout Entity, const FC_AIGroupFollowCaptain &inout DefaultValue = FC_AIGroupFollowCaptain())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AIGroupFollowCaptain, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAIGroupFollowCaptain_BP(const FECSEntity &inout Entity, const FC_AIGroupFollowCaptain &inout DefaultValue = FC_AIGroupFollowCaptain())
{
    ECSFunc_FC_AIGroupFollowCaptain::AssignAIGroupFollowCaptain(Entity, DefaultValue);
    return;
}
FC_AIGroupFollowCaptain& ModifyAIGroupFollowCaptain(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AIGroupFollowCaptain));
    return local_12.GetComp();
}
FC_AIGroupFollowCaptain& ModifyOrAddAIGroupFollowCaptain(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AIGroupFollowCaptain));
    return local_12.GetComp();
}
const FC_AIGroupFollowCaptain& GetAIGroupFollowCaptain(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AIGroupFollowCaptain));
    return local_12.GetComp();
}
UFUNCTION()
FC_AIGroupFollowCaptain GetAIGroupFollowCaptain_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AIGroupFollowCaptain __r;
    bValid = false;
    bValid = ECSFunc_FC_AIGroupFollowCaptain::GetAIGroupFollowCaptain(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AIGroupFollowCaptain GetDefaultedAIGroupFollowCaptain(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AIGroupFollowCaptain __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AIGroupFollowCaptain);
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
FC_AIGroupFollowCaptain GetDefaultedAIGroupFollowCaptain_BP(const FECSEntity &inout Entity)
{
    FC_AIGroupFollowCaptain __r;
    return __r;
}
UFUNCTION()
bool RemoveAIGroupFollowCaptain(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AIGroupFollowCaptain);
}
}
FECSMonitorRuntimeView __GetMonitorAIGroupFollowCaptainOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AIGroupFollowCaptain, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIGroupFollowCaptainOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AIGroupFollowCaptain, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIGroupFollowCaptainOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AIGroupFollowCaptain, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIGroupFollowCaptainOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AIGroupFollowCaptain, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAIGroupFollowCaptainOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AIGroupFollowCaptain, bFixedFrame, bMustHandleAll);
}
void __MonitorAIGroupFollowCaptainLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AIGroupFollowCaptain, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIGroupFollowCaptainActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AIGroupFollowCaptain, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAIGroupFollowCaptainModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AIGroupFollowCaptain, bFixedFrame, Details);
    return;
}
