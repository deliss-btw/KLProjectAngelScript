
namespace __INTENRAL_FC_FactDataConfig_NS
{
    const TECSComponentDerivedPtr<FC_FactDataConfig> DerivedPtr = TECSComponentDerivedPtr<FC_FactDataConfig>();
    const FC_FactDataConfig DefaultValue = FC_FactDataConfig();
}
namespace __INTENRAL_FC_FactDataInfo_NS
{
    const TECSComponentDerivedPtr<FC_FactDataInfo> DerivedPtr = TECSComponentDerivedPtr<FC_FactDataInfo>();
    const FC_FactDataInfo DefaultValue = FC_FactDataInfo();
}
namespace __INTENRAL_FC_StaticFactInitedTag_NS
{
    const TECSComponentDerivedPtr<FC_StaticFactInitedTag> DerivedPtr = TECSComponentDerivedPtr<FC_StaticFactInitedTag>();
    const FC_StaticFactInitedTag DefaultValue = FC_StaticFactInitedTag();
}
namespace __INTENRAL_FC_StaticFactInvalidTag_NS
{
    const TECSComponentDerivedPtr<FC_StaticFactInvalidTag> DerivedPtr = TECSComponentDerivedPtr<FC_StaticFactInvalidTag>();
    const FC_StaticFactInvalidTag DefaultValue = FC_StaticFactInvalidTag();

}
struct FC_FactDataConfig : FECSComponent
{
    UPROPERTY()
    FDataObjectPtr EntityFactConfigRow;

    FC_FactDataConfig()
    {
        return;
    }
}

struct FEntityFactExtraInfo
{
    UPROPERTY()
    FString ShowName;

    FEntityFactExtraInfo()
    {
        return;
    }
}

struct FC_FactDataInfo : FECSComponent
{
    UPROPERTY()
    FEntityFactExtraInfo EntityFactExtraInfo;
    UPROPERTY()
    FString CurrentActionName;
    UPROPERTY()
    FString LastActionName;

    FC_FactDataInfo()
    {
        return;
    }
}

struct FEntityFactConfig
{
    UPROPERTY()
    TMap<FString, FString> EntityInfo1;
    UPROPERTY()
    FEntityFactExtraInfo EntityFactExtraInfo;

    FEntityFactConfig()
    {
        return;
    }
}

struct FC_StaticFactInitedTag : FECSComponent
{
    FC_StaticFactInitedTag()
    {
        return;
    }
}

struct FC_StaticFactInvalidTag : FECSComponent
{
    FC_StaticFactInvalidTag()
    {
        return;
    }
}

namespace ECSFunc_FC_FactDataConfig
{
UFUNCTION()
bool HasFactDataConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_FactDataConfig);
}
FC_FactDataConfig& AssignFactDataConfig(const FECSEntity &inout Entity, const FC_FactDataConfig &inout DefaultValue = FC_FactDataConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_FactDataConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignFactDataConfig_BP(const FECSEntity &inout Entity, const FC_FactDataConfig &inout DefaultValue = FC_FactDataConfig())
{
    ECSFunc_FC_FactDataConfig::AssignFactDataConfig(Entity, DefaultValue);
    return;
}
FC_FactDataConfig& ModifyFactDataConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_FactDataConfig));
    return local_12.GetComp();
}
FC_FactDataConfig& ModifyOrAddFactDataConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_FactDataConfig));
    return local_12.GetComp();
}
const FC_FactDataConfig& GetFactDataConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_FactDataConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_FactDataConfig GetFactDataConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_FactDataConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_FactDataConfig::GetFactDataConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_FactDataConfig GetDefaultedFactDataConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_FactDataConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_FactDataConfig);
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
FC_FactDataConfig GetDefaultedFactDataConfig_BP(const FECSEntity &inout Entity)
{
    FC_FactDataConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveFactDataConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_FactDataConfig);
}
}
FECSMonitorRuntimeView __GetMonitorFactDataConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_FactDataConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFactDataConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_FactDataConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFactDataConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_FactDataConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFactDataConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_FactDataConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFactDataConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_FactDataConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorFactDataConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_FactDataConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFactDataConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_FactDataConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFactDataConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_FactDataConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_FactDataInfo
{
UFUNCTION()
bool HasFactDataInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_FactDataInfo);
}
FC_FactDataInfo& AssignFactDataInfo(const FECSEntity &inout Entity, const FC_FactDataInfo &inout DefaultValue = FC_FactDataInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_FactDataInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignFactDataInfo_BP(const FECSEntity &inout Entity, const FC_FactDataInfo &inout DefaultValue = FC_FactDataInfo())
{
    ECSFunc_FC_FactDataInfo::AssignFactDataInfo(Entity, DefaultValue);
    return;
}
FC_FactDataInfo& ModifyFactDataInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_FactDataInfo));
    return local_12.GetComp();
}
FC_FactDataInfo& ModifyOrAddFactDataInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_FactDataInfo));
    return local_12.GetComp();
}
const FC_FactDataInfo& GetFactDataInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_FactDataInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_FactDataInfo GetFactDataInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_FactDataInfo __r;
    bValid = false;
    bValid = ECSFunc_FC_FactDataInfo::GetFactDataInfo(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_FactDataInfo GetDefaultedFactDataInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_FactDataInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_FactDataInfo);
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
FC_FactDataInfo GetDefaultedFactDataInfo_BP(const FECSEntity &inout Entity)
{
    FC_FactDataInfo __r;
    return __r;
}
UFUNCTION()
bool RemoveFactDataInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_FactDataInfo);
}
}
FECSMonitorRuntimeView __GetMonitorFactDataInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_FactDataInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFactDataInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_FactDataInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFactDataInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_FactDataInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFactDataInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_FactDataInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorFactDataInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_FactDataInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorFactDataInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_FactDataInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFactDataInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_FactDataInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorFactDataInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_FactDataInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_StaticFactInitedTag
{
UFUNCTION()
bool HasStaticFactInitedTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_StaticFactInitedTag);
}
FC_StaticFactInitedTag& AssignStaticFactInitedTag(const FECSEntity &inout Entity, const FC_StaticFactInitedTag &inout DefaultValue = FC_StaticFactInitedTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_StaticFactInitedTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignStaticFactInitedTag_BP(const FECSEntity &inout Entity, const FC_StaticFactInitedTag &inout DefaultValue = FC_StaticFactInitedTag())
{
    ECSFunc_FC_StaticFactInitedTag::AssignStaticFactInitedTag(Entity, DefaultValue);
    return;
}
FC_StaticFactInitedTag& ModifyStaticFactInitedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_StaticFactInitedTag));
    return local_12.GetComp();
}
FC_StaticFactInitedTag& ModifyOrAddStaticFactInitedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_StaticFactInitedTag));
    return local_12.GetComp();
}
const FC_StaticFactInitedTag& GetStaticFactInitedTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_StaticFactInitedTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_StaticFactInitedTag GetStaticFactInitedTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_StaticFactInitedTag& local_4 = ECSFunc_FC_StaticFactInitedTag::GetStaticFactInitedTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_StaticFactInitedTag();
}
const FC_StaticFactInitedTag GetDefaultedStaticFactInitedTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_StaticFactInitedTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_StaticFactInitedTag);
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
FC_StaticFactInitedTag GetDefaultedStaticFactInitedTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_StaticFactInitedTag::GetDefaultedStaticFactInitedTag(Entity);
}
UFUNCTION()
bool RemoveStaticFactInitedTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_StaticFactInitedTag);
}
}
FECSMonitorRuntimeView __GetMonitorStaticFactInitedTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_StaticFactInitedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorStaticFactInitedTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_StaticFactInitedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorStaticFactInitedTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_StaticFactInitedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorStaticFactInitedTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_StaticFactInitedTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorStaticFactInitedTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_StaticFactInitedTag, bFixedFrame, bMustHandleAll);
}
void __MonitorStaticFactInitedTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_StaticFactInitedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorStaticFactInitedTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_StaticFactInitedTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorStaticFactInitedTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_StaticFactInitedTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_StaticFactInvalidTag
{
UFUNCTION()
bool HasStaticFactInvalidTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_StaticFactInvalidTag);
}
FC_StaticFactInvalidTag& AssignStaticFactInvalidTag(const FECSEntity &inout Entity, const FC_StaticFactInvalidTag &inout DefaultValue = FC_StaticFactInvalidTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_StaticFactInvalidTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignStaticFactInvalidTag_BP(const FECSEntity &inout Entity, const FC_StaticFactInvalidTag &inout DefaultValue = FC_StaticFactInvalidTag())
{
    ECSFunc_FC_StaticFactInvalidTag::AssignStaticFactInvalidTag(Entity, DefaultValue);
    return;
}
FC_StaticFactInvalidTag& ModifyStaticFactInvalidTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_StaticFactInvalidTag));
    return local_12.GetComp();
}
FC_StaticFactInvalidTag& ModifyOrAddStaticFactInvalidTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_StaticFactInvalidTag));
    return local_12.GetComp();
}
const FC_StaticFactInvalidTag& GetStaticFactInvalidTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_StaticFactInvalidTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_StaticFactInvalidTag GetStaticFactInvalidTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_StaticFactInvalidTag& local_4 = ECSFunc_FC_StaticFactInvalidTag::GetStaticFactInvalidTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_StaticFactInvalidTag();
}
const FC_StaticFactInvalidTag GetDefaultedStaticFactInvalidTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_StaticFactInvalidTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_StaticFactInvalidTag);
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
FC_StaticFactInvalidTag GetDefaultedStaticFactInvalidTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_StaticFactInvalidTag::GetDefaultedStaticFactInvalidTag(Entity);
}
UFUNCTION()
bool RemoveStaticFactInvalidTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_StaticFactInvalidTag);
}
}
FECSMonitorRuntimeView __GetMonitorStaticFactInvalidTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_StaticFactInvalidTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorStaticFactInvalidTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_StaticFactInvalidTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorStaticFactInvalidTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_StaticFactInvalidTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorStaticFactInvalidTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_StaticFactInvalidTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorStaticFactInvalidTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_StaticFactInvalidTag, bFixedFrame, bMustHandleAll);
}
void __MonitorStaticFactInvalidTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_StaticFactInvalidTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorStaticFactInvalidTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_StaticFactInvalidTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorStaticFactInvalidTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_StaticFactInvalidTag, bFixedFrame, Details);
    return;
}
