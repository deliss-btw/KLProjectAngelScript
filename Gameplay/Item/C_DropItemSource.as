
enum EDropTriggerType
{
    Death,
    Interact,
    ProjectileDestroy,
    Auto,
    Manual,
}

enum EDropMovementType
{
    NoMoveOnGround,
    Parabolic,
}

enum EMuteDropItemType
{
    None,
    DeathDrop,
    BodyPartDestroyDrop,
    All,
}

namespace __INTENRAL_FC_MuteDropItem_NS
{
    const TECSComponentDerivedPtr<FC_MuteDropItem> DerivedPtr = TECSComponentDerivedPtr<FC_MuteDropItem>();
    const FC_MuteDropItem DefaultValue = FC_MuteDropItem();
}
namespace __INTENRAL_FC_DropItemConfig_NS
{
    const TECSComponentDerivedPtr<FC_DropItemConfig> DerivedPtr = TECSComponentDerivedPtr<FC_DropItemConfig>();
    const FC_DropItemConfig DefaultValue = FC_DropItemConfig();
}
namespace __INTENRAL_FC_DropItemSource_NS
{
    const TECSComponentDerivedPtr<FC_DropItemSource> DerivedPtr = TECSComponentDerivedPtr<FC_DropItemSource>();
    const FC_DropItemSource DefaultValue = FC_DropItemSource();
}
namespace __INTENRAL_FC_DropItemConfigInitOverride_NS
{
    const TECSComponentDerivedPtr<FC_DropItemConfigInitOverride> DerivedPtr = TECSComponentDerivedPtr<FC_DropItemConfigInitOverride>();
    const FC_DropItemConfigInitOverride DefaultValue = FC_DropItemConfigInitOverride();
}
namespace __INTENRAL_FC_AutoDropItem_NS
{
    const TECSComponentDerivedPtr<FC_AutoDropItem> DerivedPtr = TECSComponentDerivedPtr<FC_AutoDropItem>();
    const FC_AutoDropItem DefaultValue = FC_AutoDropItem();
}
namespace __INTENRAL_FC_DropItemWaitingLandTag_NS
{
    const TECSComponentDerivedPtr<FC_DropItemWaitingLandTag> DerivedPtr = TECSComponentDerivedPtr<FC_DropItemWaitingLandTag>();
    const FC_DropItemWaitingLandTag DefaultValue = FC_DropItemWaitingLandTag();
}
namespace __INTENRAL_FC_DropGroundBagInfo_NS
{
    const TECSComponentDerivedPtr<FC_DropGroundBagInfo> DerivedPtr = TECSComponentDerivedPtr<FC_DropGroundBagInfo>();
    const FC_DropGroundBagInfo DefaultValue = FC_DropGroundBagInfo();
}
namespace __INTENRAL_FC_DropItemAutoDestroy_NS
{
    const TECSComponentDerivedPtr<FC_DropItemAutoDestroy> DerivedPtr = TECSComponentDerivedPtr<FC_DropItemAutoDestroy>();
    const FC_DropItemAutoDestroy DefaultValue = FC_DropItemAutoDestroy();
}
namespace __INTENRAL_FC_DropItemExclusivePlayer_NS
{
    const TECSComponentDerivedPtr<FC_DropItemExclusivePlayer> DerivedPtr = TECSComponentDerivedPtr<FC_DropItemExclusivePlayer>();
    const FC_DropItemExclusivePlayer DefaultValue = FC_DropItemExclusivePlayer();
}
namespace __INTENRAL_FCE_InteractDropItem_NS
{
    const TECSEventDerivedPtr<FCE_InteractDropItem> DerivedPtr = TECSEventDerivedPtr<FCE_InteractDropItem>();
}
namespace __INTENRAL_FCE_DropItemLandEvent_NS
{
    const TECSEventDerivedPtr<FCE_DropItemLandEvent> DerivedPtr = TECSEventDerivedPtr<FCE_DropItemLandEvent>();
}
namespace __INTENRAL_FCE_DropManualTrigger_NS
{
    const TECSEventDerivedPtr<FCE_DropManualTrigger> DerivedPtr = TECSEventDerivedPtr<FCE_DropManualTrigger>();
}
namespace __INTENRAL_FCE_RewardPopupNotify_NS
{
    const TECSEventDerivedPtr<FCE_RewardPopupNotify> DerivedPtr = TECSEventDerivedPtr<FCE_RewardPopupNotify>();

}
struct FDropConfigItem
{
    UPROPERTY()
    TDataObjectPtr<FDropItemConfig> Item;
    UPROPERTY()
    EDropTriggerType TriggerType;


}

struct FDropItem
{
    UPROPERTY()
    EDropTriggerType TriggerType;
    UPROPERTY()
    TDataObjectPtr<FDropItemConfigBase> Item;


}

struct FDropMovementConfigData
{
    UPROPERTY()
    EDropMovementType Type = EDropMovementType(0);
    UPROPERTY()
    FVector StartLocationOffset = FVector(0.0, 0.0, 0.0);
    UPROPERTY()
    float32 LocationZOffset = 0.0f;
    UPROPERTY()
    float32 RandomYawAngle = 360.0f;
    UPROPERTY()
    float32 RandomPitchMin = 0.0f;
    UPROPERTY()
    float32 RandomPitchMax = 0.0f;
    UPROPERTY()
    float32 InitSpeed = 0.0f;
    UPROPERTY()
    float32 GravityScale = 1.0f;
    UPROPERTY()
    FVector RotationAxis = FVector::UpVector;
    UPROPERTY()
    float32 AngleVelocity = 0.0f;
    UPROPERTY()
    float32 AngleVelocityDecreseAfterLand = 0.0f;
    UPROPERTY()
    float32 DropAreaSize = 50.0f;


    FVector GetRotationAxisNormalized() const property
    {
        return this.RotationAxis.GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector);
    }
}

struct FC_MuteDropItem : FECSComponent
{
    UPROPERTY()
    int MuteDropItemMask = 0;


    bool HasMuteDropItemType(const EMuteDropItemType Type) const
    {
        int local_2 = this.MuteDropItemMask & int(Type);
        return (local_2 != 0);
    }
}

struct FC_DropItemConfig : FECSComponent
{
    UPROPERTY()
    TArray<FDropConfigItem> DropItems;
    UPROPERTY()
    FDropMovementConfigData DropMovement;
    UPROPERTY()
    bool bShowRewardPopup = false;
    UPROPERTY()
    bool HasMonsterSpawn;
    UPROPERTY()
    float32 SpawnProbability = 1.0f;
    UPROPERTY()
    TSubclassOf<AMonsterPrefab> TargetMonster;


    void PostPrefabLoad(const FECSEntity &inout Entity)
    {
        if (ECS::GetRuntimeInfo().IsServer && (this.Num() > 0))
        {
            bool local_12;
            bool local_11;
            FC_DropItemSource local_10;
            if (!(local_10))
            {
                return;
            }
            local_11 = false;
            local_12 = false;
            for (auto& local_26 : this)
            {
                if (!(local_26.Item))
                {
                    continue;
                }
                int local_51 = int(local_26.TriggerType);
                local_10.AddDropItem(EDropTriggerType(local_51), TDataObjectPtr<FDropItemConfigBase>());
                if (int(local_26.TriggerType) == 3)
                {
                    local_11 = true;
                    continue;
                }
                local_12 = true;
            }
            if (local_11)
            {
                ModifyOrAdd local_56;
                local_56.opCall().bHasNonAutoDropItem = local_12;
            }
            local_10.DropMovement = this.DropMovement;
            local_10.bShowRewardPopup = this.bShowRewardPopup;
        }
        return;
    }
}

struct FC_DropItemSource : FECSComponent
{
    UPROPERTY()
    TArray<FDropItem> DropItems;
    UPROPERTY()
    FDropMovementConfigData DropMovement;
    UPROPERTY()
    bool bShowRewardPopup = false;


    void AddDropItem(const EDropTriggerType TriggerType, const TDataObjectPtr<FDropItemConfigBase> &inout Config)
    {
        FDropItem local_26;
        local_26.Item = Config;
        local_26.TriggerType = TriggerType;
        this.Add(local_26);
        return;
    }
    void AddDropItemAutoGetTriggerType(const TDataObjectPtr<FDropItemConfigBase> &inout Config)
    {
        EDropTriggerType local_2 = EDropTriggerType(0);
        EDropTriggerType local_1 = local_2;
        FDataObjectPtr local_50 = Config.opImplConv();
        if (TDataObjectPtr<FDropItemGroupConfig>(local_50))
        {
            local_1 = local_2;
        }
        this.AddDropItem(EDropTriggerType(local_1), Config);
        return;
    }
    void RemoveDropItem(const EDropTriggerType TriggerType, const TDataObjectPtr<FDropItemConfigBase> &inout Config)
    {
        bool local_5;
        int local_4 = this.Num() - 1;
        for (; local_4 >= 0; --local_4)
        {
            if (int(this[local_4].TriggerType) != int(TriggerType))
            {
                local_5 = false;
            }
            else
            {
                TDataObjectPtr<FDropItemConfigBase> local_32;
                local_32 = this[local_4].Item;
                local_5 = (local_32 == Config.opImplConv());
            }
            if (local_5)
            {
                this.RemoveAt(local_4);
            }
        }
        return;
    }
}

struct FC_DropItemConfigInitOverride : FECSComponent
{
    UPROPERTY()
    TArray<FDropConfigItem> DropItems;

    FC_DropItemConfigInitOverride()
    {
        return;
    }
}

struct FCE_InteractDropItem : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntityId InteractByEntity;

    FCE_InteractDropItem()
    {
        return;
    }
}

struct FC_AutoDropItem : FECSComponent
{
    UPROPERTY()
    bool bHasNonAutoDropItem = false;


}

struct FC_DropItemWaitingLandTag : FECSComponent
{
    FC_DropItemWaitingLandTag()
    {
        return;
    }
}

struct FCE_DropItemLandEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_DropItemLandEvent()
    {
        return;
    }
}

struct FC_DropGroundBagInfo : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TDataObjectPtr<FDropItemGroundBagConfig> m_GroundBagConfig;

    FC_DropGroundBagInfo()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_DropGroundBagInfo(const FC_DropGroundBagInfo &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_GroundBagConfig = Other.m_GroundBagConfig;
        return;
    }
    FC_DropGroundBagInfo opAssign(const FC_DropGroundBagInfo &inout Other)
    {
        FC_DropGroundBagInfo __r;
        this.SetGroundBagConfig(Other.GetGroundBagConfig());
        return __r;
    }
    const TDataObjectPtr<FDropItemGroundBagConfig> GetGroundBagConfig() const property
    {
        const TDataObjectPtr<FDropItemGroundBagConfig> __r;
        return __r;
    }
    TDataObjectPtr<FDropItemGroundBagConfig> GetModify_GroundBagConfig() property
    {
        TDataObjectPtr<FDropItemGroundBagConfig> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetGroundBagConfig(const TDataObjectPtr<FDropItemGroundBagConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_GroundBagConfig = __Value;
        return;
    }
}

struct FCE_DropManualTrigger : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity DropTriggerBy;
    UPROPERTY()
    bool bHasOverridePosition;
    UPROPERTY()
    FVector OverridePosition;


}

struct FC_DropItemAutoDestroy : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FFPTime m_DestroyTimer;

    FC_DropItemAutoDestroy()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_DropItemAutoDestroy(const FC_DropItemAutoDestroy &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_DestroyTimer = Other.m_DestroyTimer;
        return;
    }
    FC_DropItemAutoDestroy opAssign(const FC_DropItemAutoDestroy &inout Other)
    {
        FC_DropItemAutoDestroy __r;
        this.SetDestroyTimer(Other.GetDestroyTimer());
        return __r;
    }
    const FFPTime GetDestroyTimer() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_DestroyTimer() property
    {
        FFPTime __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetDestroyTimer(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_DestroyTimer = __Value;
        return;
    }
}

struct FC_DropItemExclusivePlayer : FECSComponent
{
    UPROPERTY()
    int PlayerId;


}

struct FCE_RewardPopupNotify : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TArray<FGameplayInventoryBatchAddItemData> Items;
    UPROPERTY()
    float32 DelaySeconds = 0.0f;


}

namespace ECSFunc_FC_MuteDropItem
{
UFUNCTION()
bool HasMuteDropItem(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_MuteDropItem);
}
FC_MuteDropItem& AssignMuteDropItem(const FECSEntity &inout Entity, const FC_MuteDropItem &inout DefaultValue = FC_MuteDropItem())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_MuteDropItem, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMuteDropItem_BP(const FECSEntity &inout Entity, const FC_MuteDropItem &inout DefaultValue = FC_MuteDropItem())
{
    ECSFunc_FC_MuteDropItem::AssignMuteDropItem(Entity, DefaultValue);
    return;
}
FC_MuteDropItem& ModifyMuteDropItem(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_MuteDropItem));
    return local_12.GetComp();
}
FC_MuteDropItem& ModifyOrAddMuteDropItem(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_MuteDropItem));
    return local_12.GetComp();
}
const FC_MuteDropItem& GetMuteDropItem(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_MuteDropItem));
    return local_12.GetComp();
}
UFUNCTION()
FC_MuteDropItem GetMuteDropItem_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_MuteDropItem& local_4 = ECSFunc_FC_MuteDropItem::GetMuteDropItem(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_MuteDropItem();
}
const FC_MuteDropItem GetDefaultedMuteDropItem(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_MuteDropItem __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_MuteDropItem);
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
FC_MuteDropItem GetDefaultedMuteDropItem_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_MuteDropItem::GetDefaultedMuteDropItem(Entity);
}
UFUNCTION()
bool RemoveMuteDropItem(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_MuteDropItem);
}
}
FECSMonitorRuntimeView __GetMonitorMuteDropItemOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_MuteDropItem, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMuteDropItemOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_MuteDropItem, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMuteDropItemOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_MuteDropItem, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMuteDropItemOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_MuteDropItem, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMuteDropItemOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_MuteDropItem, bFixedFrame, bMustHandleAll);
}
void __MonitorMuteDropItemLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_MuteDropItem, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMuteDropItemActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_MuteDropItem, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMuteDropItemModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_MuteDropItem, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DropItemConfig
{
UFUNCTION()
bool HasDropItemConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DropItemConfig);
}
FC_DropItemConfig& AssignDropItemConfig(const FECSEntity &inout Entity, const FC_DropItemConfig &inout DefaultValue = FC_DropItemConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DropItemConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDropItemConfig_BP(const FECSEntity &inout Entity, const FC_DropItemConfig &inout DefaultValue = FC_DropItemConfig())
{
    ECSFunc_FC_DropItemConfig::AssignDropItemConfig(Entity, DefaultValue);
    return;
}
FC_DropItemConfig& ModifyDropItemConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DropItemConfig));
    return local_12.GetComp();
}
FC_DropItemConfig& ModifyOrAddDropItemConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DropItemConfig));
    return local_12.GetComp();
}
const FC_DropItemConfig& GetDropItemConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DropItemConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_DropItemConfig GetDropItemConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_DropItemConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_DropItemConfig::GetDropItemConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_DropItemConfig GetDefaultedDropItemConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DropItemConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DropItemConfig);
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
FC_DropItemConfig GetDefaultedDropItemConfig_BP(const FECSEntity &inout Entity)
{
    FC_DropItemConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveDropItemConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DropItemConfig);
}
}
FECSMonitorRuntimeView __GetMonitorDropItemConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DropItemConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDropItemConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DropItemConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDropItemConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DropItemConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDropItemConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DropItemConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDropItemConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DropItemConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorDropItemConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DropItemConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDropItemConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DropItemConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDropItemConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DropItemConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DropItemSource
{
UFUNCTION()
bool HasDropItemSource(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DropItemSource);
}
FC_DropItemSource& AssignDropItemSource(const FECSEntity &inout Entity, const FC_DropItemSource &inout DefaultValue = FC_DropItemSource())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DropItemSource, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDropItemSource_BP(const FECSEntity &inout Entity, const FC_DropItemSource &inout DefaultValue = FC_DropItemSource())
{
    ECSFunc_FC_DropItemSource::AssignDropItemSource(Entity, DefaultValue);
    return;
}
FC_DropItemSource& ModifyDropItemSource(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DropItemSource));
    return local_12.GetComp();
}
FC_DropItemSource& ModifyOrAddDropItemSource(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DropItemSource));
    return local_12.GetComp();
}
const FC_DropItemSource& GetDropItemSource(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DropItemSource));
    return local_12.GetComp();
}
UFUNCTION()
FC_DropItemSource GetDropItemSource_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_DropItemSource __r;
    bValid = false;
    bValid = ECSFunc_FC_DropItemSource::GetDropItemSource(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_DropItemSource GetDefaultedDropItemSource(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DropItemSource __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DropItemSource);
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
FC_DropItemSource GetDefaultedDropItemSource_BP(const FECSEntity &inout Entity)
{
    FC_DropItemSource __r;
    return __r;
}
UFUNCTION()
bool RemoveDropItemSource(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DropItemSource);
}
}
FECSMonitorRuntimeView __GetMonitorDropItemSourceOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DropItemSource, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDropItemSourceOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DropItemSource, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDropItemSourceOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DropItemSource, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDropItemSourceOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DropItemSource, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDropItemSourceOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DropItemSource, bFixedFrame, bMustHandleAll);
}
void __MonitorDropItemSourceLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DropItemSource, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDropItemSourceActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DropItemSource, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDropItemSourceModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DropItemSource, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DropItemConfigInitOverride
{
UFUNCTION()
bool HasDropItemConfigInitOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DropItemConfigInitOverride);
}
FC_DropItemConfigInitOverride& AssignDropItemConfigInitOverride(const FECSEntity &inout Entity, const FC_DropItemConfigInitOverride &inout DefaultValue = FC_DropItemConfigInitOverride())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DropItemConfigInitOverride, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDropItemConfigInitOverride_BP(const FECSEntity &inout Entity, const FC_DropItemConfigInitOverride &inout DefaultValue = FC_DropItemConfigInitOverride())
{
    ECSFunc_FC_DropItemConfigInitOverride::AssignDropItemConfigInitOverride(Entity, DefaultValue);
    return;
}
FC_DropItemConfigInitOverride& ModifyDropItemConfigInitOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DropItemConfigInitOverride));
    return local_12.GetComp();
}
FC_DropItemConfigInitOverride& ModifyOrAddDropItemConfigInitOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DropItemConfigInitOverride));
    return local_12.GetComp();
}
const FC_DropItemConfigInitOverride& GetDropItemConfigInitOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DropItemConfigInitOverride));
    return local_12.GetComp();
}
UFUNCTION()
FC_DropItemConfigInitOverride GetDropItemConfigInitOverride_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_DropItemConfigInitOverride __r;
    bValid = false;
    bValid = ECSFunc_FC_DropItemConfigInitOverride::GetDropItemConfigInitOverride(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_DropItemConfigInitOverride GetDefaultedDropItemConfigInitOverride(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DropItemConfigInitOverride __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DropItemConfigInitOverride);
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
FC_DropItemConfigInitOverride GetDefaultedDropItemConfigInitOverride_BP(const FECSEntity &inout Entity)
{
    FC_DropItemConfigInitOverride __r;
    return __r;
}
UFUNCTION()
bool RemoveDropItemConfigInitOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DropItemConfigInitOverride);
}
}
FECSMonitorRuntimeView __GetMonitorDropItemConfigInitOverrideOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DropItemConfigInitOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDropItemConfigInitOverrideOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DropItemConfigInitOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDropItemConfigInitOverrideOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DropItemConfigInitOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDropItemConfigInitOverrideOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DropItemConfigInitOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDropItemConfigInitOverrideOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DropItemConfigInitOverride, bFixedFrame, bMustHandleAll);
}
void __MonitorDropItemConfigInitOverrideLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DropItemConfigInitOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDropItemConfigInitOverrideActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DropItemConfigInitOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDropItemConfigInitOverrideModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DropItemConfigInitOverride, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AutoDropItem
{
UFUNCTION()
bool HasAutoDropItem(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AutoDropItem);
}
FC_AutoDropItem& AssignAutoDropItem(const FECSEntity &inout Entity, const FC_AutoDropItem &inout DefaultValue = FC_AutoDropItem())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AutoDropItem, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAutoDropItem_BP(const FECSEntity &inout Entity, const FC_AutoDropItem &inout DefaultValue = FC_AutoDropItem())
{
    ECSFunc_FC_AutoDropItem::AssignAutoDropItem(Entity, DefaultValue);
    return;
}
FC_AutoDropItem& ModifyAutoDropItem(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AutoDropItem));
    return local_12.GetComp();
}
FC_AutoDropItem& ModifyOrAddAutoDropItem(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AutoDropItem));
    return local_12.GetComp();
}
const FC_AutoDropItem& GetAutoDropItem(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AutoDropItem));
    return local_12.GetComp();
}
UFUNCTION()
FC_AutoDropItem GetAutoDropItem_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AutoDropItem& local_4 = ECSFunc_FC_AutoDropItem::GetAutoDropItem(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AutoDropItem();
}
const FC_AutoDropItem GetDefaultedAutoDropItem(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AutoDropItem __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AutoDropItem);
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
FC_AutoDropItem GetDefaultedAutoDropItem_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AutoDropItem::GetDefaultedAutoDropItem(Entity);
}
UFUNCTION()
bool RemoveAutoDropItem(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AutoDropItem);
}
}
FECSMonitorRuntimeView __GetMonitorAutoDropItemOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AutoDropItem, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoDropItemOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AutoDropItem, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoDropItemOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AutoDropItem, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoDropItemOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AutoDropItem, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAutoDropItemOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AutoDropItem, bFixedFrame, bMustHandleAll);
}
void __MonitorAutoDropItemLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AutoDropItem, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAutoDropItemActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AutoDropItem, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAutoDropItemModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AutoDropItem, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DropItemWaitingLandTag
{
UFUNCTION()
bool HasDropItemWaitingLandTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DropItemWaitingLandTag);
}
FC_DropItemWaitingLandTag& AssignDropItemWaitingLandTag(const FECSEntity &inout Entity, const FC_DropItemWaitingLandTag &inout DefaultValue = FC_DropItemWaitingLandTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DropItemWaitingLandTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDropItemWaitingLandTag_BP(const FECSEntity &inout Entity, const FC_DropItemWaitingLandTag &inout DefaultValue = FC_DropItemWaitingLandTag())
{
    ECSFunc_FC_DropItemWaitingLandTag::AssignDropItemWaitingLandTag(Entity, DefaultValue);
    return;
}
FC_DropItemWaitingLandTag& ModifyDropItemWaitingLandTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DropItemWaitingLandTag));
    return local_12.GetComp();
}
FC_DropItemWaitingLandTag& ModifyOrAddDropItemWaitingLandTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DropItemWaitingLandTag));
    return local_12.GetComp();
}
const FC_DropItemWaitingLandTag& GetDropItemWaitingLandTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DropItemWaitingLandTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_DropItemWaitingLandTag GetDropItemWaitingLandTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DropItemWaitingLandTag& local_4 = ECSFunc_FC_DropItemWaitingLandTag::GetDropItemWaitingLandTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DropItemWaitingLandTag();
}
const FC_DropItemWaitingLandTag GetDefaultedDropItemWaitingLandTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DropItemWaitingLandTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DropItemWaitingLandTag);
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
FC_DropItemWaitingLandTag GetDefaultedDropItemWaitingLandTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DropItemWaitingLandTag::GetDefaultedDropItemWaitingLandTag(Entity);
}
UFUNCTION()
bool RemoveDropItemWaitingLandTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DropItemWaitingLandTag);
}
}
FECSMonitorRuntimeView __GetMonitorDropItemWaitingLandTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DropItemWaitingLandTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDropItemWaitingLandTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DropItemWaitingLandTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDropItemWaitingLandTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DropItemWaitingLandTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDropItemWaitingLandTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DropItemWaitingLandTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDropItemWaitingLandTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DropItemWaitingLandTag, bFixedFrame, bMustHandleAll);
}
void __MonitorDropItemWaitingLandTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DropItemWaitingLandTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDropItemWaitingLandTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DropItemWaitingLandTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDropItemWaitingLandTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DropItemWaitingLandTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DropGroundBagInfo
{
UFUNCTION()
bool HasDropGroundBagInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DropGroundBagInfo);
}
FC_DropGroundBagInfo& AssignDropGroundBagInfo(const FECSEntity &inout Entity, const FC_DropGroundBagInfo &inout DefaultValue = FC_DropGroundBagInfo())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DropGroundBagInfo, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDropGroundBagInfo_BP(const FECSEntity &inout Entity, const FC_DropGroundBagInfo &inout DefaultValue = FC_DropGroundBagInfo())
{
    ECSFunc_FC_DropGroundBagInfo::AssignDropGroundBagInfo(Entity, DefaultValue);
    return;
}
FC_DropGroundBagInfo& ModifyDropGroundBagInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DropGroundBagInfo));
    return local_12.GetComp();
}
FC_DropGroundBagInfo& ModifyOrAddDropGroundBagInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DropGroundBagInfo));
    return local_12.GetComp();
}
const FC_DropGroundBagInfo& GetDropGroundBagInfo(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DropGroundBagInfo));
    return local_12.GetComp();
}
UFUNCTION()
FC_DropGroundBagInfo GetDropGroundBagInfo_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DropGroundBagInfo& local_4 = ECSFunc_FC_DropGroundBagInfo::GetDropGroundBagInfo(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DropGroundBagInfo();
}
const FC_DropGroundBagInfo GetDefaultedDropGroundBagInfo(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DropGroundBagInfo __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DropGroundBagInfo);
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
FC_DropGroundBagInfo GetDefaultedDropGroundBagInfo_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DropGroundBagInfo::GetDefaultedDropGroundBagInfo(Entity);
}
UFUNCTION()
bool RemoveDropGroundBagInfo(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DropGroundBagInfo);
}
}
FECSMonitorRuntimeView __GetMonitorDropGroundBagInfoOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DropGroundBagInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDropGroundBagInfoOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DropGroundBagInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDropGroundBagInfoOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DropGroundBagInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDropGroundBagInfoOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DropGroundBagInfo, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDropGroundBagInfoOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DropGroundBagInfo, bFixedFrame, bMustHandleAll);
}
void __MonitorDropGroundBagInfoLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DropGroundBagInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDropGroundBagInfoActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DropGroundBagInfo, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDropGroundBagInfoModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DropGroundBagInfo, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DropItemAutoDestroy
{
UFUNCTION()
bool HasDropItemAutoDestroy(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DropItemAutoDestroy);
}
FC_DropItemAutoDestroy& AssignDropItemAutoDestroy(const FECSEntity &inout Entity, const FC_DropItemAutoDestroy &inout DefaultValue = FC_DropItemAutoDestroy())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DropItemAutoDestroy, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDropItemAutoDestroy_BP(const FECSEntity &inout Entity, const FC_DropItemAutoDestroy &inout DefaultValue = FC_DropItemAutoDestroy())
{
    ECSFunc_FC_DropItemAutoDestroy::AssignDropItemAutoDestroy(Entity, DefaultValue);
    return;
}
FC_DropItemAutoDestroy& ModifyDropItemAutoDestroy(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DropItemAutoDestroy));
    return local_12.GetComp();
}
FC_DropItemAutoDestroy& ModifyOrAddDropItemAutoDestroy(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DropItemAutoDestroy));
    return local_12.GetComp();
}
const FC_DropItemAutoDestroy& GetDropItemAutoDestroy(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DropItemAutoDestroy));
    return local_12.GetComp();
}
UFUNCTION()
FC_DropItemAutoDestroy GetDropItemAutoDestroy_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DropItemAutoDestroy& local_4 = ECSFunc_FC_DropItemAutoDestroy::GetDropItemAutoDestroy(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DropItemAutoDestroy();
}
const FC_DropItemAutoDestroy GetDefaultedDropItemAutoDestroy(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DropItemAutoDestroy __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DropItemAutoDestroy);
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
FC_DropItemAutoDestroy GetDefaultedDropItemAutoDestroy_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DropItemAutoDestroy::GetDefaultedDropItemAutoDestroy(Entity);
}
UFUNCTION()
bool RemoveDropItemAutoDestroy(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DropItemAutoDestroy);
}
}
FECSMonitorRuntimeView __GetMonitorDropItemAutoDestroyOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DropItemAutoDestroy, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDropItemAutoDestroyOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DropItemAutoDestroy, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDropItemAutoDestroyOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DropItemAutoDestroy, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDropItemAutoDestroyOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DropItemAutoDestroy, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDropItemAutoDestroyOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DropItemAutoDestroy, bFixedFrame, bMustHandleAll);
}
void __MonitorDropItemAutoDestroyLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DropItemAutoDestroy, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDropItemAutoDestroyActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DropItemAutoDestroy, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDropItemAutoDestroyModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DropItemAutoDestroy, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DropItemExclusivePlayer
{
UFUNCTION()
bool HasDropItemExclusivePlayer(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DropItemExclusivePlayer);
}
FC_DropItemExclusivePlayer& AssignDropItemExclusivePlayer(const FECSEntity &inout Entity, const FC_DropItemExclusivePlayer &inout DefaultValue = FC_DropItemExclusivePlayer())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DropItemExclusivePlayer, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDropItemExclusivePlayer_BP(const FECSEntity &inout Entity, const FC_DropItemExclusivePlayer &inout DefaultValue = FC_DropItemExclusivePlayer())
{
    ECSFunc_FC_DropItemExclusivePlayer::AssignDropItemExclusivePlayer(Entity, DefaultValue);
    return;
}
FC_DropItemExclusivePlayer& ModifyDropItemExclusivePlayer(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DropItemExclusivePlayer));
    return local_12.GetComp();
}
FC_DropItemExclusivePlayer& ModifyOrAddDropItemExclusivePlayer(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DropItemExclusivePlayer));
    return local_12.GetComp();
}
const FC_DropItemExclusivePlayer& GetDropItemExclusivePlayer(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DropItemExclusivePlayer));
    return local_12.GetComp();
}
UFUNCTION()
FC_DropItemExclusivePlayer GetDropItemExclusivePlayer_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DropItemExclusivePlayer& local_4 = ECSFunc_FC_DropItemExclusivePlayer::GetDropItemExclusivePlayer(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DropItemExclusivePlayer();
}
const FC_DropItemExclusivePlayer GetDefaultedDropItemExclusivePlayer(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DropItemExclusivePlayer __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DropItemExclusivePlayer);
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
FC_DropItemExclusivePlayer GetDefaultedDropItemExclusivePlayer_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DropItemExclusivePlayer::GetDefaultedDropItemExclusivePlayer(Entity);
}
UFUNCTION()
bool RemoveDropItemExclusivePlayer(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DropItemExclusivePlayer);
}
}
FECSMonitorRuntimeView __GetMonitorDropItemExclusivePlayerOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DropItemExclusivePlayer, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDropItemExclusivePlayerOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DropItemExclusivePlayer, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDropItemExclusivePlayerOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DropItemExclusivePlayer, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDropItemExclusivePlayerOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DropItemExclusivePlayer, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDropItemExclusivePlayerOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DropItemExclusivePlayer, bFixedFrame, bMustHandleAll);
}
void __MonitorDropItemExclusivePlayerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DropItemExclusivePlayer, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDropItemExclusivePlayerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DropItemExclusivePlayer, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDropItemExclusivePlayerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DropItemExclusivePlayer, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_DropGroundBagInfo &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_DropGroundBagInfo &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_DropGroundBagInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_DropGroundBagInfo
{
int __IndexOf_GroundBagConfig()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_DropItemAutoDestroy &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_DropItemAutoDestroy &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_DropItemAutoDestroy &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_DropItemAutoDestroy
{
int __IndexOf_DestroyTimer()
{
    return 0;
}
}
