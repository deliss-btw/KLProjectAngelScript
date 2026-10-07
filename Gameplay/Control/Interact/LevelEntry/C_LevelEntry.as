
namespace __INTENRAL_FC_LevelEntryConfig_NS
{
    const TECSComponentDerivedPtr<FC_LevelEntryConfig> DerivedPtr = TECSComponentDerivedPtr<FC_LevelEntryConfig>();
    const FC_LevelEntryConfig DefaultValue = FC_LevelEntryConfig();
}
namespace __INTENRAL_FC_LevelEntryProcessingTag_NS
{
    const TECSComponentDerivedPtr<FC_LevelEntryProcessingTag> DerivedPtr = TECSComponentDerivedPtr<FC_LevelEntryProcessingTag>();
    const FC_LevelEntryProcessingTag DefaultValue = FC_LevelEntryProcessingTag();
}
namespace __INTENRAL_FC_LevelEntryInteractPresentationTag_NS
{
    const TECSComponentDerivedPtr<FC_LevelEntryInteractPresentationTag> DerivedPtr = TECSComponentDerivedPtr<FC_LevelEntryInteractPresentationTag>();
    const FC_LevelEntryInteractPresentationTag DefaultValue = FC_LevelEntryInteractPresentationTag();
}
namespace __INTENRAL_FCS_LevelScriptActorInfo_NS
{
    const TECSComponentDerivedPtr<FCS_LevelScriptActorInfo> DerivedPtr = TECSComponentDerivedPtr<FCS_LevelScriptActorInfo>();
    const FCS_LevelScriptActorInfo DefaultValue = FCS_LevelScriptActorInfo();
}
namespace __INTENRAL_FCE_LevelEntryInteractSuccess_NS
{
    const TECSEventDerivedPtr<FCE_LevelEntryInteractSuccess> DerivedPtr = TECSEventDerivedPtr<FCE_LevelEntryInteractSuccess>();

}
struct FC_LevelEntryConfig : FECSComponent
{
    UPROPERTY()
    TDataObjectPtr<FDungeonConfig> DungeonConfig;
    UPROPERTY()
    FInteractActionESMBB CutSceneTrigger;
    UPROPERTY()
    float32 EnterLevelDelayFromCutSceneTrigger;
    UPROPERTY()
    TDataObjectPtr<FCutSceneData> CutSceneData;
    UPROPERTY()
    int MinPlayerCount;

    default CutSceneTrigger.TriggerValidateTime = 0.2f;

    FC_LevelEntryConfig()
    {
        this.EnterLevelDelayFromCutSceneTrigger = 1.0f;
        this.CutSceneData = TDataObjectPtr<FCutSceneData>(nullptr);
        this.MinPlayerCount = 1;
        this.__InitDefaults();
        return;
    }
}

struct FCE_LevelEntryInteractSuccess : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TArray<FECSEntity> PlayerEntities;
    UPROPERTY()
    uint LevelKey = 0;


}

struct FC_LevelEntryProcessingTag : FECSComponent
{
    FC_LevelEntryProcessingTag()
    {
        return;
    }
}

struct FC_LevelEntryInteractPresentationTag : FECSComponent
{
    FC_LevelEntryInteractPresentationTag()
    {
        return;
    }
}

struct FCS_LevelScriptActorInfo : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<FECSEntityId, TDataObjectPtr<FDungeonConfig>> m_LeveScriptActorInfo;

    FCS_LevelScriptActorInfo()
    {
        this.__InitDirtyFlags();
        return;
    }
    FCS_LevelScriptActorInfo(const FCS_LevelScriptActorInfo &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_LeveScriptActorInfo = Other.m_LeveScriptActorInfo;
        return;
    }
    FCS_LevelScriptActorInfo opAssign(const FCS_LevelScriptActorInfo &inout Other)
    {
        FCS_LevelScriptActorInfo __r;
        this.SetLeveScriptActorInfo(Other.GetLeveScriptActorInfo());
        return __r;
    }
    const TMap<FECSEntityId, TDataObjectPtr<FDungeonConfig>> GetLeveScriptActorInfo() const property
    {
        const TMap<FECSEntityId, TDataObjectPtr<FDungeonConfig>> __r;
        return __r;
    }
    TMap<FECSEntityId, TDataObjectPtr<FDungeonConfig>> GetModify_LeveScriptActorInfo() property
    {
        TMap<FECSEntityId, TDataObjectPtr<FDungeonConfig>> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetLeveScriptActorInfo(const TMap<FECSEntityId, TDataObjectPtr<FDungeonConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_LeveScriptActorInfo = __Value;
        return;
    }
}

struct FCutScenePawnEntityWithTag
{
    UPROPERTY()
    FName PlayerTag;
    UPROPERTY()
    FECSEntity PlayerPawnEntity;

    FCutScenePawnEntityWithTag()
    {
        return;
    }
}

namespace ECSFunc_FC_LevelEntryConfig
{
UFUNCTION()
bool HasLevelEntryConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LevelEntryConfig);
}
FC_LevelEntryConfig& AssignLevelEntryConfig(const FECSEntity &inout Entity, const FC_LevelEntryConfig &inout DefaultValue = FC_LevelEntryConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LevelEntryConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLevelEntryConfig_BP(const FECSEntity &inout Entity, const FC_LevelEntryConfig &inout DefaultValue = FC_LevelEntryConfig())
{
    ECSFunc_FC_LevelEntryConfig::AssignLevelEntryConfig(Entity, DefaultValue);
    return;
}
FC_LevelEntryConfig& ModifyLevelEntryConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LevelEntryConfig));
    return local_12.GetComp();
}
FC_LevelEntryConfig& ModifyOrAddLevelEntryConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LevelEntryConfig));
    return local_12.GetComp();
}
const FC_LevelEntryConfig& GetLevelEntryConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LevelEntryConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_LevelEntryConfig GetLevelEntryConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_LevelEntryConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_LevelEntryConfig::GetLevelEntryConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_LevelEntryConfig GetDefaultedLevelEntryConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LevelEntryConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LevelEntryConfig);
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
FC_LevelEntryConfig GetDefaultedLevelEntryConfig_BP(const FECSEntity &inout Entity)
{
    FC_LevelEntryConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveLevelEntryConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LevelEntryConfig);
}
}
FECSMonitorRuntimeView __GetMonitorLevelEntryConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LevelEntryConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelEntryConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LevelEntryConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelEntryConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LevelEntryConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelEntryConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LevelEntryConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelEntryConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LevelEntryConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorLevelEntryConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LevelEntryConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelEntryConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LevelEntryConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelEntryConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LevelEntryConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_LevelEntryProcessingTag
{
UFUNCTION()
bool HasLevelEntryProcessingTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LevelEntryProcessingTag);
}
FC_LevelEntryProcessingTag& AssignLevelEntryProcessingTag(const FECSEntity &inout Entity, const FC_LevelEntryProcessingTag &inout DefaultValue = FC_LevelEntryProcessingTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LevelEntryProcessingTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLevelEntryProcessingTag_BP(const FECSEntity &inout Entity, const FC_LevelEntryProcessingTag &inout DefaultValue = FC_LevelEntryProcessingTag())
{
    ECSFunc_FC_LevelEntryProcessingTag::AssignLevelEntryProcessingTag(Entity, DefaultValue);
    return;
}
FC_LevelEntryProcessingTag& ModifyLevelEntryProcessingTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LevelEntryProcessingTag));
    return local_12.GetComp();
}
FC_LevelEntryProcessingTag& ModifyOrAddLevelEntryProcessingTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LevelEntryProcessingTag));
    return local_12.GetComp();
}
const FC_LevelEntryProcessingTag& GetLevelEntryProcessingTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LevelEntryProcessingTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_LevelEntryProcessingTag GetLevelEntryProcessingTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_LevelEntryProcessingTag& local_4 = ECSFunc_FC_LevelEntryProcessingTag::GetLevelEntryProcessingTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_LevelEntryProcessingTag();
}
const FC_LevelEntryProcessingTag GetDefaultedLevelEntryProcessingTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LevelEntryProcessingTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LevelEntryProcessingTag);
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
FC_LevelEntryProcessingTag GetDefaultedLevelEntryProcessingTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_LevelEntryProcessingTag::GetDefaultedLevelEntryProcessingTag(Entity);
}
UFUNCTION()
bool RemoveLevelEntryProcessingTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LevelEntryProcessingTag);
}
}
FECSMonitorRuntimeView __GetMonitorLevelEntryProcessingTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LevelEntryProcessingTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelEntryProcessingTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LevelEntryProcessingTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelEntryProcessingTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LevelEntryProcessingTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelEntryProcessingTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LevelEntryProcessingTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelEntryProcessingTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LevelEntryProcessingTag, bFixedFrame, bMustHandleAll);
}
void __MonitorLevelEntryProcessingTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LevelEntryProcessingTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelEntryProcessingTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LevelEntryProcessingTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelEntryProcessingTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LevelEntryProcessingTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_LevelEntryInteractPresentationTag
{
UFUNCTION()
bool HasLevelEntryInteractPresentationTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_LevelEntryInteractPresentationTag);
}
FC_LevelEntryInteractPresentationTag& AssignLevelEntryInteractPresentationTag(const FECSEntity &inout Entity, const FC_LevelEntryInteractPresentationTag &inout DefaultValue = FC_LevelEntryInteractPresentationTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_LevelEntryInteractPresentationTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignLevelEntryInteractPresentationTag_BP(const FECSEntity &inout Entity, const FC_LevelEntryInteractPresentationTag &inout DefaultValue = FC_LevelEntryInteractPresentationTag())
{
    ECSFunc_FC_LevelEntryInteractPresentationTag::AssignLevelEntryInteractPresentationTag(Entity, DefaultValue);
    return;
}
FC_LevelEntryInteractPresentationTag& ModifyLevelEntryInteractPresentationTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_LevelEntryInteractPresentationTag));
    return local_12.GetComp();
}
FC_LevelEntryInteractPresentationTag& ModifyOrAddLevelEntryInteractPresentationTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_LevelEntryInteractPresentationTag));
    return local_12.GetComp();
}
const FC_LevelEntryInteractPresentationTag& GetLevelEntryInteractPresentationTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_LevelEntryInteractPresentationTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_LevelEntryInteractPresentationTag GetLevelEntryInteractPresentationTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_LevelEntryInteractPresentationTag& local_4 = ECSFunc_FC_LevelEntryInteractPresentationTag::GetLevelEntryInteractPresentationTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_LevelEntryInteractPresentationTag();
}
const FC_LevelEntryInteractPresentationTag GetDefaultedLevelEntryInteractPresentationTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_LevelEntryInteractPresentationTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_LevelEntryInteractPresentationTag);
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
FC_LevelEntryInteractPresentationTag GetDefaultedLevelEntryInteractPresentationTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_LevelEntryInteractPresentationTag::GetDefaultedLevelEntryInteractPresentationTag(Entity);
}
UFUNCTION()
bool RemoveLevelEntryInteractPresentationTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_LevelEntryInteractPresentationTag);
}
}
FECSMonitorRuntimeView __GetMonitorLevelEntryInteractPresentationTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_LevelEntryInteractPresentationTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelEntryInteractPresentationTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_LevelEntryInteractPresentationTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelEntryInteractPresentationTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_LevelEntryInteractPresentationTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelEntryInteractPresentationTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_LevelEntryInteractPresentationTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorLevelEntryInteractPresentationTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_LevelEntryInteractPresentationTag, bFixedFrame, bMustHandleAll);
}
void __MonitorLevelEntryInteractPresentationTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_LevelEntryInteractPresentationTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelEntryInteractPresentationTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_LevelEntryInteractPresentationTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelEntryInteractPresentationTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_LevelEntryInteractPresentationTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_LevelScriptActorInfo
{
UFUNCTION()
bool HasLevelScriptActorInfo(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_LevelScriptActorInfo);
}
FCS_LevelScriptActorInfo& AssignLevelScriptActorInfo(const FECSWorldPtr &inout World, const FCS_LevelScriptActorInfo &inout DefaultValue = FCS_LevelScriptActorInfo())
{
    UScriptStruct local_6 = FCS_LevelScriptActorInfo;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignLevelScriptActorInfo_BP(const FECSWorldPtr &inout World, const FCS_LevelScriptActorInfo &inout DefaultValue = FCS_LevelScriptActorInfo())
{
    ECSFunc_FCS_LevelScriptActorInfo::AssignLevelScriptActorInfo(World, DefaultValue);
    return;
}
FCS_LevelScriptActorInfo& ModifyLevelScriptActorInfo(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LevelScriptActorInfo;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_LevelScriptActorInfo& ModifyOrAddLevelScriptActorInfo(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LevelScriptActorInfo;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_LevelScriptActorInfo& GetLevelScriptActorInfo(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_LevelScriptActorInfo;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_LevelScriptActorInfo GetLevelScriptActorInfo_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_LevelScriptActorInfo& local_4 = ECSFunc_FCS_LevelScriptActorInfo::GetLevelScriptActorInfo(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_LevelScriptActorInfo();
}
const FCS_LevelScriptActorInfo GetDefaultedLevelScriptActorInfo(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_LevelScriptActorInfo __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_LevelScriptActorInfo);
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
FCS_LevelScriptActorInfo GetDefaultedLevelScriptActorInfo_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_LevelScriptActorInfo::GetDefaultedLevelScriptActorInfo(World);
}
UFUNCTION()
bool RemoveLevelScriptActorInfo(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_LevelScriptActorInfo);
}
}
void __MonitorLevelScriptActorInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_LevelScriptActorInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelScriptActorInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_LevelScriptActorInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorLevelScriptActorInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_LevelScriptActorInfo, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCS_LevelScriptActorInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_LevelScriptActorInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_LevelScriptActorInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_LevelScriptActorInfo
{
int __IndexOf_LeveScriptActorInfo()
{
    return 0;
}
}
