
enum ECharacterBodyPartType
{
    None,
    Head,
    Body,
    NATIVE_MAX = 2,
    Max,
}

namespace __INTENRAL_FC_BodyPartsConfig_NS
{
    const TECSComponentDerivedPtr<FC_BodyPartsConfig> DerivedPtr = TECSComponentDerivedPtr<FC_BodyPartsConfig>();
    const FC_BodyPartsConfig DefaultValue = FC_BodyPartsConfig();
}
namespace __INTENRAL_FC_BodyParts_NS
{
    const TECSComponentDerivedPtr<FC_BodyParts> DerivedPtr = TECSComponentDerivedPtr<FC_BodyParts>();
    const FC_BodyParts DefaultValue = FC_BodyParts();
}
namespace __INTENRAL_FCE_BodyPartDestroyEvent_NS
{
    const TECSEventDerivedPtr<FCE_BodyPartDestroyEvent> DerivedPtr = TECSEventDerivedPtr<FCE_BodyPartDestroyEvent>();
}
namespace __INTENRAL_FCE_BodyPartRecoverEvent_NS
{
    const TECSEventDerivedPtr<FCE_BodyPartRecoverEvent> DerivedPtr = TECSEventDerivedPtr<FCE_BodyPartRecoverEvent>();

}
struct FCharacterBodyPartConfig
{
    UPROPERTY()
    bool bCanDestroy = false;
    UPROPERTY()
    bool bCanBeDestroyedWithoutInterrupt = false;
    UPROPERTY()
    bool IsWeakness = false;
    UPROPERTY()
    float32 DamageRatio = 1.0f;
    UPROPERTY()
    float32 FreezeDurationRatio = 1.0f;
    UPROPERTY()
    float32 BeHitFreezeDurationRatio = 1.0f;
    UPROPERTY()
    float32 BeHitWeight = 1.0f;
    UPROPERTY()
    ECharacterBodyPartType Type = ECharacterBodyPartType(0);
    UPROPERTY()
    FDamageTypeRatios DamageTypeRatio;
    UPROPERTY()
    bool bUseEnvBreakDamage = false;
    UPROPERTY()
    float32 EnvBreakBodyPartHP;
    UPROPERTY()
    float32 DestroyHpRatio = 0.2f;
    UPROPERTY()
    FName DestroyHitState = n"None";
    UPROPERTY()
    float32 EnergyBallDetectRadius = 5000.0f;
    UPROPERTY()
    TArray<FDropEnergyBallData> DestroyEnergyBallDrops;
    UPROPERTY()
    TDataObjectPtr<FDropItemConfig> DestroyDropItem;
    UPROPERTY()
    FName DestroyDropItemAttachmentSocket;
    UPROPERTY()
    FDropMovementConfigData DropMovement;
    UPROPERTY()
    FFXConfig DestroyFX;
    UPROPERTY()
    FName FXAttachmentSocket;


}

struct FCharacterBodyPartRuntimeData
{
    UPROPERTY()
    bool m_bCanDestroy = false;
    UPROPERTY()
    float32 m_AccumulatedDamage = 0.0f;


    bool GetbCanDestroy() const property
    {
        return this.m_bCanDestroy;
    }
    void SetbCanDestroy(const bool __Value) property
    {
        this.m_bCanDestroy = __Value;
        return;
    }
    float32 GetAccumulatedDamage() const property
    {
        return this.m_AccumulatedDamage;
    }
    void SetAccumulatedDamage(const float32 __Value) property
    {
        this.m_AccumulatedDamage = __Value;
        return;
    }
}

class UCharacterBodyPartDataAsset : UDataAsset
{
    UPROPERTY()
    TMap<FName, FCharacterBodyPartConfig> BodyParts;

    UCharacterBodyPartDataAsset()
    {
        return;
    }
}

struct FC_BodyPartsConfig : FECSComponent
{
    UPROPERTY()
    UCharacterBodyPartDataAsset BodyPartData;

    FC_BodyPartsConfig()
    {
        return;
    }
}

struct FC_BodyParts : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<FName, FCharacterBodyPartRuntimeData> m_BodyPartDatas;
    UPROPERTY()
    TArray<FName> m_LockOneMutedBodyParts;
    UPROPERTY()
    TArray<FName> m_FullMutedBodyParts;

    FC_BodyParts()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_BodyParts(const FC_BodyParts &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_BodyPartDatas = Other.m_BodyPartDatas;
        this.m_LockOneMutedBodyParts = Other.m_LockOneMutedBodyParts;
        this.m_FullMutedBodyParts = Other.m_FullMutedBodyParts;
        return;
    }
    FC_BodyParts opAssign(const FC_BodyParts &inout Other)
    {
        FC_BodyParts __r;
        this.SetBodyPartDatas(Other.GetBodyPartDatas());
        this.SetLockOneMutedBodyParts(Other.GetLockOneMutedBodyParts());
        this.SetFullMutedBodyParts(Other.GetFullMutedBodyParts());
        return __r;
    }
    const TMap<FName, FCharacterBodyPartRuntimeData> GetBodyPartDatas() const property
    {
        const TMap<FName, FCharacterBodyPartRuntimeData> __r;
        return __r;
    }
    TMap<FName, FCharacterBodyPartRuntimeData> GetModify_BodyPartDatas() property
    {
        TMap<FName, FCharacterBodyPartRuntimeData> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetBodyPartDatas(const TMap<FName, FCharacterBodyPartRuntimeData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_BodyPartDatas = __Value;
        return;
    }
    const TArray<FName> GetLockOneMutedBodyParts() const property
    {
        const TArray<FName> __r;
        return __r;
    }
    TArray<FName> GetModify_LockOneMutedBodyParts() property
    {
        TArray<FName> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetLockOneMutedBodyParts(const TArray<FName> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_LockOneMutedBodyParts = __Value;
        return;
    }
    const TArray<FName> GetFullMutedBodyParts() const property
    {
        const TArray<FName> __r;
        return __r;
    }
    TArray<FName> GetModify_FullMutedBodyParts() property
    {
        TArray<FName> __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetFullMutedBodyParts(const TArray<FName> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_FullMutedBodyParts = __Value;
        return;
    }
}

struct FCE_BodyPartDestroyEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FName BodyPart;
    UPROPERTY()
    TDataObjectPtr<FAttackData> AttackData;
    UPROPERTY()
    FECSEntity DestroyedByEntity;

    FCE_BodyPartDestroyEvent()
    {
        return;
    }
}

struct FCE_BodyPartRecoverEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FName BodyPartKey;
    UPROPERTY()
    float32 RecoverHPRatio;


}

namespace ECSFunc_FC_BodyPartsConfig
{
UFUNCTION()
bool HasBodyPartsConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_BodyPartsConfig);
}
FC_BodyPartsConfig& AssignBodyPartsConfig(const FECSEntity &inout Entity, const FC_BodyPartsConfig &inout DefaultValue = FC_BodyPartsConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_BodyPartsConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignBodyPartsConfig_BP(const FECSEntity &inout Entity, const FC_BodyPartsConfig &inout DefaultValue = FC_BodyPartsConfig())
{
    ECSFunc_FC_BodyPartsConfig::AssignBodyPartsConfig(Entity, DefaultValue);
    return;
}
FC_BodyPartsConfig& ModifyBodyPartsConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_BodyPartsConfig));
    return local_12.GetComp();
}
FC_BodyPartsConfig& ModifyOrAddBodyPartsConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_BodyPartsConfig));
    return local_12.GetComp();
}
const FC_BodyPartsConfig& GetBodyPartsConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_BodyPartsConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_BodyPartsConfig GetBodyPartsConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_BodyPartsConfig& local_4 = ECSFunc_FC_BodyPartsConfig::GetBodyPartsConfig(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_BodyPartsConfig();
}
const FC_BodyPartsConfig GetDefaultedBodyPartsConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_BodyPartsConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_BodyPartsConfig);
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
FC_BodyPartsConfig GetDefaultedBodyPartsConfig_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_BodyPartsConfig::GetDefaultedBodyPartsConfig(Entity);
}
UFUNCTION()
bool RemoveBodyPartsConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_BodyPartsConfig);
}
}
FECSMonitorRuntimeView __GetMonitorBodyPartsConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_BodyPartsConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBodyPartsConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_BodyPartsConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBodyPartsConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_BodyPartsConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBodyPartsConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_BodyPartsConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBodyPartsConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_BodyPartsConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorBodyPartsConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_BodyPartsConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBodyPartsConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_BodyPartsConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBodyPartsConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_BodyPartsConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_BodyParts
{
UFUNCTION()
bool HasBodyParts(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_BodyParts);
}
FC_BodyParts& AssignBodyParts(const FECSEntity &inout Entity, const FC_BodyParts &inout DefaultValue = FC_BodyParts())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_BodyParts, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignBodyParts_BP(const FECSEntity &inout Entity, const FC_BodyParts &inout DefaultValue = FC_BodyParts())
{
    ECSFunc_FC_BodyParts::AssignBodyParts(Entity, DefaultValue);
    return;
}
FC_BodyParts& ModifyBodyParts(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_BodyParts));
    return local_12.GetComp();
}
FC_BodyParts& ModifyOrAddBodyParts(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_BodyParts));
    return local_12.GetComp();
}
const FC_BodyParts& GetBodyParts(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_BodyParts));
    return local_12.GetComp();
}
UFUNCTION()
FC_BodyParts GetBodyParts_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_BodyParts& local_4 = ECSFunc_FC_BodyParts::GetBodyParts(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_BodyParts();
}
const FC_BodyParts GetDefaultedBodyParts(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_BodyParts __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_BodyParts);
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
FC_BodyParts GetDefaultedBodyParts_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_BodyParts::GetDefaultedBodyParts(Entity);
}
UFUNCTION()
bool RemoveBodyParts(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_BodyParts);
}
}
FECSMonitorRuntimeView __GetMonitorBodyPartsOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_BodyParts, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBodyPartsOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_BodyParts, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBodyPartsOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_BodyParts, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBodyPartsOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_BodyParts, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBodyPartsOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_BodyParts, bFixedFrame, bMustHandleAll);
}
void __MonitorBodyPartsLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_BodyParts, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBodyPartsActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_BodyParts, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBodyPartsModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_BodyParts, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_BodyParts &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_BodyParts &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_BodyParts &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_BodyParts
{
int __IndexOf_BodyPartDatas()
{
    return 0;
}
int __IndexOf_LockOneMutedBodyParts()
{
    return 1;
}
int __IndexOf_FullMutedBodyParts()
{
    return 2;
}
}
