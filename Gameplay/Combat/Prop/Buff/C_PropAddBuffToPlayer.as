
namespace __INTENRAL_FC_PropAddBuffConfig_NS
{
    const TECSComponentDerivedPtr<FC_PropAddBuffConfig> DerivedPtr = TECSComponentDerivedPtr<FC_PropAddBuffConfig>();
    const FC_PropAddBuffConfig DefaultValue = FC_PropAddBuffConfig();
}
namespace __INTENRAL_FCE_PropAddBuffToPlayerEvent_NS
{
    const TECSEventDerivedPtr<FCE_PropAddBuffToPlayerEvent> DerivedPtr = TECSEventDerivedPtr<FCE_PropAddBuffToPlayerEvent>();

}
struct FPropBuffConfigItem
{
    UPROPERTY()
    FBuffConfigRef BuffConfig;
    UPROPERTY()
    float32 OverrideDuration = -1.0f;
    UPROPERTY()
    int AddStackNum = 1;


}

struct FPropAddBuffConfigItem
{
    UPROPERTY()
    bool bOnlyToSelf = false;
    UPROPERTY()
    bool bToSelfAndTeammates = true;
    UPROPERTY()
    bool bToSelfAndFriendFaction = false;
    UPROPERTY()
    TArray<FPropBuffConfigItem> BuffConfigs;


}

struct FTagNameToBuffConfigList
{
    UPROPERTY()
    FName TagName;
    UPROPERTY()
    TArray<FPropAddBuffConfigItem> AddBuffConfigs;

    FTagNameToBuffConfigList()
    {
        return;
    }
}

struct FC_PropAddBuffConfig : FECSComponent
{
    UPROPERTY()
    float32 PlayerDetectSphereRadius = 1000.0f;
    UPROPERTY()
    TArray<FPropAddBuffConfigItem> AddBuffConfigs;
    UPROPERTY()
    TArray<FTagNameToBuffConfigList> TagNameToBuffConfigList;


    FString ValidateConfig(const AECSPrefab Prefab) const
    {
        FString local_4 = FString().Append("Prefab [").Append(Prefab.GetPathName(nullptr)).Append("] ValidateConfig Fail: ");
        if (this.AddBuffConfigs.IsEmpty())
        {
            return (local_4 + FString().Append("Enables EcoCollectableAddBuffConfig but has empty AddBuffConfigs."));
        }
        int local_14 = 0;
        for (; local_14 < this.AddBuffConfigs.Num(); ++local_14)
        {
            const FPropAddBuffConfigItem& local_18 = this.AddBuffConfigs[local_14];
            if (local_18.BuffConfigs.IsEmpty())
            {
                return (local_4 + FString().Append("AddBuffConfigs indexed [").Append(local_14).Append("] is empty."));
            }
            int local_19 = 0;
            for (; local_19 < local_18.BuffConfigs.Num(); ++local_19)
            {
                if (!(local_18.BuffConfigs[local_19].BuffConfig.IsValid()))
                {
                    return (local_4 + FString().Append("BuffItem indexed [").Append(local_19).Append("] of AddBuffConfig indexed [").Append(local_14).Append("] is invalid."));
                }
            }
        }
        TSet<FName> local_42;
        int local_19_2 = 0;
        for (; local_19_2 < this.TagNameToBuffConfigList.Num(); )
        {
            const FTagNameToBuffConfigList& local_44 = this.TagNameToBuffConfigList[local_19_2];
            if (local_44.TagName.IsNone())
            {
                return (local_4 + FString().Append("TaggedAddBuffList item indexed [").Append(local_19_2).Append("] has None TagName."));
            }
            if (local_42.Contains(local_44.TagName))
            {
                return (local_4 + FString().Append("TaggedAddBuffList has repeated TagName [").Append(local_44.TagName).Append("]."));
            }
            local_42.Add(local_44.TagName);
            ++local_19_2;
        }
        return FString();
    }
}

struct FCE_PropAddBuffToPlayerEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity TriggerPlayer;
    UPROPERTY()
    FECSEntity BuffConfigSourceEntity;
    UPROPERTY()
    bool bIncludeDefault;
    UPROPERTY()
    TArray<FName> BuffTagNames;


}

namespace ECSFunc_FC_PropAddBuffConfig
{
UFUNCTION()
bool HasPropAddBuffConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PropAddBuffConfig);
}
FC_PropAddBuffConfig& AssignPropAddBuffConfig(const FECSEntity &inout Entity, const FC_PropAddBuffConfig &inout DefaultValue = FC_PropAddBuffConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PropAddBuffConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPropAddBuffConfig_BP(const FECSEntity &inout Entity, const FC_PropAddBuffConfig &inout DefaultValue = FC_PropAddBuffConfig())
{
    ECSFunc_FC_PropAddBuffConfig::AssignPropAddBuffConfig(Entity, DefaultValue);
    return;
}
FC_PropAddBuffConfig& ModifyPropAddBuffConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PropAddBuffConfig));
    return local_12.GetComp();
}
FC_PropAddBuffConfig& ModifyOrAddPropAddBuffConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PropAddBuffConfig));
    return local_12.GetComp();
}
const FC_PropAddBuffConfig& GetPropAddBuffConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PropAddBuffConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_PropAddBuffConfig GetPropAddBuffConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_PropAddBuffConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_PropAddBuffConfig::GetPropAddBuffConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_PropAddBuffConfig GetDefaultedPropAddBuffConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PropAddBuffConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PropAddBuffConfig);
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
FC_PropAddBuffConfig GetDefaultedPropAddBuffConfig_BP(const FECSEntity &inout Entity)
{
    FC_PropAddBuffConfig __r;
    return __r;
}
UFUNCTION()
bool RemovePropAddBuffConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PropAddBuffConfig);
}
}
FECSMonitorRuntimeView __GetMonitorPropAddBuffConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PropAddBuffConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropAddBuffConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PropAddBuffConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropAddBuffConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PropAddBuffConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropAddBuffConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PropAddBuffConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropAddBuffConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PropAddBuffConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorPropAddBuffConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PropAddBuffConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPropAddBuffConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PropAddBuffConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPropAddBuffConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PropAddBuffConfig, bFixedFrame, Details);
    return;
}
