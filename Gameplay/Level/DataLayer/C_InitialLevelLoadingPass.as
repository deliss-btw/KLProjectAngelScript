
enum EPassLoadingStatus
{
    NotStarted,
    Loading,
    Loaded,
}

namespace __INTENRAL_FCS_InitialLevelLoadingData_NS
{
    const TECSComponentDerivedPtr<FCS_InitialLevelLoadingData> DerivedPtr = TECSComponentDerivedPtr<FCS_InitialLevelLoadingData>();
    const FCS_InitialLevelLoadingData DefaultValue = FCS_InitialLevelLoadingData();
}
namespace __INTENRAL_FC_LevelGroupCheckReadyTime_NS
{
    const TECSComponentDerivedPtr<FC_LevelGroupCheckReadyTime> DerivedPtr = TECSComponentDerivedPtr<FC_LevelGroupCheckReadyTime>();
    const FC_LevelGroupCheckReadyTime DefaultValue = FC_LevelGroupCheckReadyTime();
}
namespace __INTENRAL_FCS_LevelGroupOccupyData_NS
{
    const TECSComponentDerivedPtr<FCS_LevelGroupOccupyData> DerivedPtr = TECSComponentDerivedPtr<FCS_LevelGroupOccupyData>();
    const FCS_LevelGroupOccupyData DefaultValue = FCS_LevelGroupOccupyData();

}
struct FLevelGroupLoadingStatus
{
    UPROPERTY()
    FConfigGUID GroupGUID;
    UPROPERTY()
    FECSEntity GroupEntity = ENTITY_NULL;
    UPROPERTY()
    FName GroupName;

    FLevelGroupLoadingStatus()
    {
        return;
    }
    bool IsLoadingComplete() const
    {
        bool local_1;
        if (!(this.GroupEntity.IsValid()))
        {
            local_1 = false;
        }
        else
        {
            Has local_6;
            local_1 = local_6.opCall();
        }
        return local_1;
    }
}

struct FPerPassLoadingGroups
{
    UPROPERTY()
    TArray<FLevelGroupLoadingStatus> GroupStatus;
    UPROPERTY()
    TArray<FName> NewlyAddedGroupNamesDuringLoading;
    UPROPERTY()
    EPassLoadingStatus Status = EPassLoadingStatus(0);


    int GetLevelGroupStatusIndex(const FName &inout GroupName) const
    {
        int local_1 = 0;
        for (; local_1 < this.Num(); ++local_1)
        {
            if ((FName(this[local_1].GroupName) == GroupName))
            {
                return local_1;
            }
        }
        return -1;
    }
}

struct FCS_InitialLevelLoadingData : FECSSingleton
{
    UPROPERTY()
    FLevelGroupLoadingStatus DefaultGroupStatus;
    UPROPERTY()
    TArray<FName> LoadingPassNames;
    UPROPERTY()
    TMap<FName, FPerPassLoadingGroups> LoadingGroupsPerPass;

    FCS_InitialLevelLoadingData()
    {
        return;
    }
    void ResetLoadingPassOrder()
    {
        bool local_1 = false;
        ULevelGlobalSettings local_6 = ::ULevelGlobalSettings::Get();
        if (local_6 != nullptr && (local_6.LevelGroupLoadingPassConfigTable != nullptr))
        {
            ELevelType local_11 = ::FLevelUtils::GetCurrentLevelType();
            TArray<FLevelGroupLoadingPassConfig> local_16;
            local_6.LevelGroupLoadingPassConfigTable.GetAllRows(local_16);
            for (auto& local_30 : local_16)
            {
                if (int(local_30.LevelType) == int(local_11))
                {
                    this.LoadingPassNames = local_30.LoadingPassOrder;
                    int local_34 = this.LoadingPassNames.Num() - 1;
                    for (; local_34 >= 0; --local_34)
                    {
                        if (!(FLevelGroupLoadingPassNames::AllAvailableLoadingPassNames.Contains(this.LoadingPassNames[local_34])))
                        {
                            XWarning(ELog(22), FString().Append("ResetLoadingPassOrder: unknown pass name '").Append(this.LoadingPassNames[local_34]).Append("' in config for LevelType ").Append(local_11).Append(", removed"));
                            this.LoadingPassNames.RemoveAt(local_34);
                        }
                    }
                    local_1 = (this.LoadingPassNames.Num() > 0);
                    break;
                }
            }
        }
        if (!(local_1))
        {
            this.LoadingPassNames = FLevelGroupLoadingPassNames::DefaultLoadingPassOrder;
        }
        int local_32 = this.LoadingPassNames.Num();
        return;
    }
    FName GetFallbackPass() const
    {
        if (this.LoadingPassNames.Contains(FLevelGroupLoadingPassNames::DefaultLoadingPassName))
        {
            return FLevelGroupLoadingPassNames::DefaultLoadingPassName;
        }
        if (this.LoadingPassNames.Num() > 0)
        {
            return this.LoadingPassNames[0];
        }
        return FLevelGroupLoadingPassNames::DefaultLoadingPassName;
    }
    FName TryGetNextAvailablePass(const FName &inout CurrentPass, const bool bIncludeCurrentPass) const
    {
        int local_5;
        int local_2 = this.LoadingPassNames.IndexOfByKey(CurrentPass);
        int local_3 = 0;
        if (local_2 != -1)
        {
            if (bIncludeCurrentPass)
            {
                local_5 = local_2;
            }
            else
            {
                local_5 = local_2 + 1;
            }
            local_3 = local_5;
        }
        int local_6 = local_3;
        for (; local_6 < this.LoadingPassNames.Num(); ++local_6)
        {
            if (this.LoadingGroupsPerPass.Contains(this.LoadingPassNames[local_6]))
            {
                return this.LoadingPassNames[local_6];
            }
        }
        return NAME_None;
    }
    bool IsPassBeyond(const FName &inout CurrentPass, const FName &inout TargetPass) const
    {
        return (this.LoadingPassNames.IndexOfByKey(CurrentPass) > this.LoadingPassNames.IndexOfByKey(TargetPass));
    }
}

struct FC_LevelGroupCheckReadyTime : FECSComponent
{
    UPROPERTY()
    FFPTime BeginTime;

    FC_LevelGroupCheckReadyTime()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

struct FCS_LevelGroupOccupyData : FECSSingleton
{
    UPROPERTY()
    TArray<FKLGameplayTagQuery> OccupyRules;

    FCS_LevelGroupOccupyData()
    {
        return;
    }
    void AddOccupyRule(const FKLGameplayTagQuery &inout Rule)
    {
        if (!(Rule.IsEmpty()))
        {
            this.Add(Rule);
        }
        return;
    }
    void AddOccupyRules(const TArray<FKLGameplayTagQuery> &inout Rules)
    {
        for (auto& local_16 : Rules)
        {
            this.AddOccupyRule(local_16);
        }
        return;
    }
    void ClearOccupyRules()
    {
        this.Empty(0);
        return;
    }
    bool IsGroupOccupied(const FLevelGroupConfig &inout GroupConfig) const
    {
        if (!(GroupConfig.bCanBeOccupied))
        {
            return false;
        }
        if (GroupConfig.GroupTags.Num() == 0)
        {
            return false;
        }
        for (auto& local_18 : this)
        {
            if (!(local_18.IsEmpty()) && local_18.Matches(GroupConfig.GroupTags))
            {
                return true;
            }
        }
        return false;
    }
}

namespace ECSFunc_FCS_InitialLevelLoadingData
{
UFUNCTION()
bool HasInitialLevelLoadingData(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_InitialLevelLoadingData);
}
FCS_InitialLevelLoadingData& AssignInitialLevelLoadingData(const FECSWorldPtr &inout World, const FCS_InitialLevelLoadingData &inout DefaultValue = FCS_InitialLevelLoadingData())
{
    UScriptStruct local_6 = FCS_InitialLevelLoadingData;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignInitialLevelLoadingData_BP(const FECSWorldPtr &inout World, const FCS_InitialLevelLoadingData &inout DefaultValue = FCS_InitialLevelLoadingData())
{
    ECSFunc_FCS_InitialLevelLoadingData::AssignInitialLevelLoadingData(World, DefaultValue);
    return;
}
FCS_InitialLevelLoadingData& ModifyInitialLevelLoadingData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_InitialLevelLoadingData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_InitialLevelLoadingData& ModifyOrAddInitialLevelLoadingData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_InitialLevelLoadingData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_InitialLevelLoadingData& GetInitialLevelLoadingData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_InitialLevelLoadingData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_InitialLevelLoadingData GetInitialLevelLoadingData_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_InitialLevelLoadingData __r;
    bValid = false;
    bValid = ECSFunc_FCS_InitialLevelLoadingData::GetInitialLevelLoadingData(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_InitialLevelLoadingData GetDefaultedInitialLevelLoadingData(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_InitialLevelLoadingData __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_InitialLevelLoadingData);
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
FCS_InitialLevelLoadingData GetDefaultedInitialLevelLoadingData_BP(const FECSWorldPtr &inout World)
{
    FCS_InitialLevelLoadingData __r;
    return __r;
}
UFUNCTION()
bool RemoveInitialLevelLoadingData(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_InitialLevelLoadingData);
}
}
void __MonitorInitialLevelLoadingDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_InitialLevelLoadingData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInitialLevelLoadingDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_InitialLevelLoadingData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorInitialLevelLoadingDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_InitialLevelLoadingData, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_LevelGroupCheckReadyTime
{
UFUNCTION()
bool HasLevelGroupCheckReadyTime(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LevelGroupCheckReadyTime);
}
FC_LevelGroupCheckReadyTime& AssignLevelGroupCheckReadyTime(const FECSEntity &inout Entity, const FC_LevelGroupCheckReadyTime &inout DefaultValue = FC_LevelGroupCheckReadyTime())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LevelGroupCheckReadyTime, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLevelGroupCheckReadyTime_BP(const FECSEntity &inout Entity, const FC_LevelGroupCheckReadyTime &inout DefaultValue = FC_LevelGroupCheckReadyTime())
{
    ECSFunc_FC_LevelGroupCheckReadyTime::AssignLevelGroupCheckReadyTime(Entity, DefaultValue);
    return;
}
FC_LevelGroupCheckReadyTime& ModifyLevelGroupCheckReadyTime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LevelGroupCheckReadyTime));
    return local_12.GetComp();
}
FC_LevelGroupCheckReadyTime& ModifyOrAddLevelGroupCheckReadyTime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LevelGroupCheckReadyTime));
    return local_12.GetComp();
}
const FC_LevelGroupCheckReadyTime& GetLevelGroupCheckReadyTime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LevelGroupCheckReadyTime));
    return local_12.GetComp();
}
UFUNCTION()
FC_LevelGroupCheckReadyTime GetLevelGroupCheckReadyTime_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_LevelGroupCheckReadyTime __r;
    bValid = false;
    bValid = ECSFunc_FC_LevelGroupCheckReadyTime::GetLevelGroupCheckReadyTime(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_LevelGroupCheckReadyTime GetDefaultedLevelGroupCheckReadyTime(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LevelGroupCheckReadyTime __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LevelGroupCheckReadyTime);
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
FC_LevelGroupCheckReadyTime GetDefaultedLevelGroupCheckReadyTime_BP(const FECSEntity &inout Entity)
{
    FC_LevelGroupCheckReadyTime __r;
    return __r;
}
UFUNCTION()
bool RemoveLevelGroupCheckReadyTime(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LevelGroupCheckReadyTime);
}
}
FECSMonitorRuntimeView __GetMonitorLevelGroupCheckReadyTimeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LevelGroupCheckReadyTime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelGroupCheckReadyTimeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LevelGroupCheckReadyTime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelGroupCheckReadyTimeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LevelGroupCheckReadyTime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelGroupCheckReadyTimeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LevelGroupCheckReadyTime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelGroupCheckReadyTimeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LevelGroupCheckReadyTime, bFixedFrame, bMustHandleAll);
}
void __MonitorLevelGroupCheckReadyTimeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LevelGroupCheckReadyTime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelGroupCheckReadyTimeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LevelGroupCheckReadyTime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelGroupCheckReadyTimeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LevelGroupCheckReadyTime, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_LevelGroupOccupyData
{
UFUNCTION()
bool HasLevelGroupOccupyData(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_LevelGroupOccupyData);
}
FCS_LevelGroupOccupyData& AssignLevelGroupOccupyData(const FECSWorldPtr &inout World, const FCS_LevelGroupOccupyData &inout DefaultValue = FCS_LevelGroupOccupyData())
{
    UScriptStruct local_6 = FCS_LevelGroupOccupyData;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignLevelGroupOccupyData_BP(const FECSWorldPtr &inout World, const FCS_LevelGroupOccupyData &inout DefaultValue = FCS_LevelGroupOccupyData())
{
    ECSFunc_FCS_LevelGroupOccupyData::AssignLevelGroupOccupyData(World, DefaultValue);
    return;
}
FCS_LevelGroupOccupyData& ModifyLevelGroupOccupyData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LevelGroupOccupyData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_LevelGroupOccupyData& ModifyOrAddLevelGroupOccupyData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LevelGroupOccupyData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_LevelGroupOccupyData& GetLevelGroupOccupyData(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LevelGroupOccupyData;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_LevelGroupOccupyData GetLevelGroupOccupyData_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    FCS_LevelGroupOccupyData __r;
    bValid = false;
    bValid = ECSFunc_FCS_LevelGroupOccupyData::GetLevelGroupOccupyData(World);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FCS_LevelGroupOccupyData GetDefaultedLevelGroupOccupyData(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_LevelGroupOccupyData __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_LevelGroupOccupyData);
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
FCS_LevelGroupOccupyData GetDefaultedLevelGroupOccupyData_BP(const FECSWorldPtr &inout World)
{
    FCS_LevelGroupOccupyData __r;
    return __r;
}
UFUNCTION()
bool RemoveLevelGroupOccupyData(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_LevelGroupOccupyData);
}
}
void __MonitorLevelGroupOccupyDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_LevelGroupOccupyData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelGroupOccupyDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_LevelGroupOccupyData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelGroupOccupyDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_LevelGroupOccupyData, bFixedFrame, Details);
    return;
}
