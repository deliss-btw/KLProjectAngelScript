
enum EImpactEventType
{
    Default,
    VFX,
    SFX,
}

enum EImpactFeedbackType
{
    VFX,
    SFX,
}

enum EImpactRotationType
{
    EntityForward,
    SurfaceNormal,
    SurfaceRandomTangent,
}

namespace __INTENRAL_FC_AirborneTag_NS
{
    const TECSComponentDerivedPtr<FC_AirborneTag> DerivedPtr = TECSComponentDerivedPtr<FC_AirborneTag>();
    const FC_AirborneTag DefaultValue = FC_AirborneTag();
}
namespace __INTENRAL_FC_AirborneData_NS
{
    const TECSComponentDerivedPtr<FC_AirborneData> DerivedPtr = TECSComponentDerivedPtr<FC_AirborneData>();
    const FC_AirborneData DefaultValue = FC_AirborneData();
}
namespace __INTENRAL_FC_ImpactFXConfig_NS
{
    const TECSComponentDerivedPtr<FC_ImpactFXConfig> DerivedPtr = TECSComponentDerivedPtr<FC_ImpactFXConfig>();
    const FC_ImpactFXConfig DefaultValue = FC_ImpactFXConfig();
}
namespace __INTENRAL_FCE_EntityLandedEventWithSync_NS
{
    const TECSEventDerivedPtr<FCE_EntityLandedEventWithSync> DerivedPtr = TECSEventDerivedPtr<FCE_EntityLandedEventWithSync>();
}
namespace __INTENRAL_FCE_EntityLandedEvent_NS
{
    const TECSEventDerivedPtr<FCE_EntityLandedEvent> DerivedPtr = TECSEventDerivedPtr<FCE_EntityLandedEvent>();
}
namespace __INTENRAL_FCE_EntityFootStepEvent_NS
{
    const TECSEventDerivedPtr<FCE_EntityFootStepEvent> DerivedPtr = TECSEventDerivedPtr<FCE_EntityFootStepEvent>();

}
struct FEntityLandedInfo
{
    FSubDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    EPrefabSize m_CharacterSize;
    UPROPERTY()
    bool m_bUseLandedStrengthLevelDirectly;
    UPROPERTY()
    ELandedStrength m_LandedStrengthLevel;
    UPROPERTY()
    EActionImpactType m_ActionImpactType;
    UPROPERTY()
    FVector m_LandedStrength;
    UPROPERTY()
    FVector m_Velocity;
    UPROPERTY()
    float32 m_EntityMass;
    UPROPERTY()
    FName m_AttachName;
    UPROPERTY()
    FName m_RootBoneName;
    UPROPERTY()
    FVector m_TraceStartOffset;
    UPROPERTY()
    FVector m_TraceDir;
    UPROPERTY()
    float32 m_TraceLength;
    UPROPERTY()
    bool m_bDurational;
    UPROPERTY()
    EImpactRotationType m_ImpactRotationType;
    UPROPERTY()
    EImpactEventType m_ImpactEventType;

    FEntityLandedInfo()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FEntityLandedInfo(const FEntityLandedInfo &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FEntityLandedInfo opAssign(const FEntityLandedInfo &inout Other)
    {
        FEntityLandedInfo __r;
        this.SetCharacterSize(Other.GetCharacterSize());
        this.SetbUseLandedStrengthLevelDirectly(Other.GetbUseLandedStrengthLevelDirectly());
        this.SetLandedStrengthLevel(Other.GetLandedStrengthLevel());
        this.SetActionImpactType(Other.GetActionImpactType());
        this.SetLandedStrength(Other.GetLandedStrength());
        this.SetVelocity(Other.GetVelocity());
        this.SetEntityMass(Other.GetEntityMass());
        this.SetAttachName(Other.GetAttachName());
        this.SetRootBoneName(Other.GetRootBoneName());
        this.SetTraceStartOffset(Other.GetTraceStartOffset());
        this.SetTraceDir(Other.GetTraceDir());
        this.SetTraceLength(Other.GetTraceLength());
        this.SetbDurational(Other.GetbDurational());
        this.SetImpactRotationType(Other.GetImpactRotationType());
        this.SetImpactEventType(Other.GetImpactEventType());
        return __r;
    }
    EPrefabSize GetCharacterSize() const property
    {
        return this.m_CharacterSize;
    }
    void SetCharacterSize(const EPrefabSize __Value) property
    {
        if (int(this.m_CharacterSize) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_CharacterSize = __Value;
        return;
    }
    bool GetbUseLandedStrengthLevelDirectly() const property
    {
        return this.m_bUseLandedStrengthLevelDirectly;
    }
    void SetbUseLandedStrengthLevelDirectly(const bool __Value) property
    {
        if (!(this.m_bUseLandedStrengthLevelDirectly) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bUseLandedStrengthLevelDirectly = __Value;
        return;
    }
    ELandedStrength GetLandedStrengthLevel() const property
    {
        return this.m_LandedStrengthLevel;
    }
    void SetLandedStrengthLevel(const ELandedStrength __Value) property
    {
        if (int(this.m_LandedStrengthLevel) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_LandedStrengthLevel = __Value;
        return;
    }
    EActionImpactType GetActionImpactType() const property
    {
        return this.m_ActionImpactType;
    }
    void SetActionImpactType(const EActionImpactType __Value) property
    {
        if (int(this.m_ActionImpactType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_ActionImpactType = __Value;
        return;
    }
    const FVector GetLandedStrength() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_LandedStrength() property
    {
        FVector __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetLandedStrength(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_LandedStrength = __Value;
        return;
    }
    FVector GetVelocity() const property
    {
        FVector __r;
        return __r;
    }
    FVector GetModify_Velocity() property
    {
        FVector __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetVelocity(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_Velocity = __Value;
        return;
    }
    float32 GetEntityMass() const property
    {
        return this.m_EntityMass;
    }
    void SetEntityMass(const float32 __Value) property
    {
        if (this.m_EntityMass == __Value)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_EntityMass = __Value;
        return;
    }
    FName GetAttachName() const property
    {
        return this.m_AttachName;
    }
    void SetAttachName(const FName &inout __Value) property
    {
        if ((this.m_AttachName == __Value))
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_AttachName = __Value;
        return;
    }
    FName GetRootBoneName() const property
    {
        return this.m_RootBoneName;
    }
    void SetRootBoneName(const FName &inout __Value) property
    {
        if ((this.m_RootBoneName == __Value))
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_RootBoneName = __Value;
        return;
    }
    const FVector GetTraceStartOffset() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_TraceStartOffset() property
    {
        FVector __r;
        this.__MarkDirty(9);
        return __r;
    }
    void SetTraceStartOffset(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_TraceStartOffset = __Value;
        return;
    }
    const FVector GetTraceDir() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_TraceDir() property
    {
        FVector __r;
        this.__MarkDirty(10);
        return __r;
    }
    void SetTraceDir(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(10);
        this.m_TraceDir = __Value;
        return;
    }
    float32 GetTraceLength() const property
    {
        return this.m_TraceLength;
    }
    void SetTraceLength(const float32 __Value) property
    {
        if (this.m_TraceLength == __Value)
        {
            return;
        }
        this.__MarkDirty(11);
        this.m_TraceLength = __Value;
        return;
    }
    bool GetbDurational() const property
    {
        return this.m_bDurational;
    }
    void SetbDurational(const bool __Value) property
    {
        if (!(this.m_bDurational) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(12);
        this.m_bDurational = __Value;
        return;
    }
    EImpactRotationType GetImpactRotationType() const property
    {
        return this.m_ImpactRotationType;
    }
    void SetImpactRotationType(const EImpactRotationType __Value) property
    {
        if (int(this.m_ImpactRotationType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(13);
        this.m_ImpactRotationType = __Value;
        return;
    }
    EImpactEventType GetImpactEventType() const property
    {
        return this.m_ImpactEventType;
    }
    void SetImpactEventType(const EImpactEventType __Value) property
    {
        if (int(this.m_ImpactEventType) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(14);
        this.m_ImpactEventType = __Value;
        return;
    }
}

struct FCE_EntityLandedEventWithSync : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FEntityLandedInfo EntityLandedInfo;

    FCE_EntityLandedEventWithSync()
    {
        return;
    }
}

struct FCE_EntityLandedEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FEntityLandedInfo EntityLandedInfo;

    FCE_EntityLandedEvent()
    {
        return;
    }
}

struct FCE_EntityFootStepEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FName SurfaceName;

    FCE_EntityFootStepEvent()
    {
        return;
    }
}

struct FC_AirborneTag : FECSComponent
{
    FC_AirborneTag()
    {
        return;
    }
}

struct FC_AirborneData : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FVector m_Velocity;

    FC_AirborneData()
    {
        this.m_Velocity = FVector::ZeroVector;
        this.__InitDirtyFlags();
        return;
    }
    FC_AirborneData(const FC_AirborneData &inout Other)
    {
        this.m_Velocity = FVector::ZeroVector;
        this.__InitDirtyFlags();
        this.m_Velocity = Other.m_Velocity;
        return;
    }
    FC_AirborneData opAssign(const FC_AirborneData &inout Other)
    {
        FC_AirborneData __r;
        this.SetVelocity(Other.GetVelocity());
        return __r;
    }
    FVector GetVelocity() const property
    {
        FVector __r;
        return __r;
    }
    FVector GetModify_Velocity() property
    {
        FVector __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetVelocity(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Velocity = __Value;
        return;
    }
}

struct FC_ImpactFXConfig : FECSComponent
{
    UPROPERTY()
    FName LandImpactConfigRowName;

    FC_ImpactFXConfig()
    {
        return;
    }
}

namespace ECSFunc_FC_AirborneTag
{
UFUNCTION()
bool HasAirborneTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AirborneTag);
}
FC_AirborneTag& AssignAirborneTag(const FECSEntity &inout Entity, const FC_AirborneTag &inout DefaultValue = FC_AirborneTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AirborneTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAirborneTag_BP(const FECSEntity &inout Entity, const FC_AirborneTag &inout DefaultValue = FC_AirborneTag())
{
    ECSFunc_FC_AirborneTag::AssignAirborneTag(Entity, DefaultValue);
    return;
}
FC_AirborneTag& ModifyAirborneTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AirborneTag));
    return local_12.GetComp();
}
FC_AirborneTag& ModifyOrAddAirborneTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AirborneTag));
    return local_12.GetComp();
}
const FC_AirborneTag& GetAirborneTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AirborneTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_AirborneTag GetAirborneTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AirborneTag& local_4 = ECSFunc_FC_AirborneTag::GetAirborneTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AirborneTag();
}
const FC_AirborneTag GetDefaultedAirborneTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AirborneTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AirborneTag);
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
FC_AirborneTag GetDefaultedAirborneTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AirborneTag::GetDefaultedAirborneTag(Entity);
}
UFUNCTION()
bool RemoveAirborneTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AirborneTag);
}
}
FECSMonitorRuntimeView __GetMonitorAirborneTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AirborneTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAirborneTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AirborneTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAirborneTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AirborneTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAirborneTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AirborneTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAirborneTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AirborneTag, bFixedFrame, bMustHandleAll);
}
void __MonitorAirborneTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AirborneTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAirborneTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AirborneTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAirborneTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AirborneTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AirborneData
{
UFUNCTION()
bool HasAirborneData(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AirborneData);
}
FC_AirborneData& AssignAirborneData(const FECSEntity &inout Entity, const FC_AirborneData &inout DefaultValue = FC_AirborneData())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AirborneData, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAirborneData_BP(const FECSEntity &inout Entity, const FC_AirborneData &inout DefaultValue = FC_AirborneData())
{
    ECSFunc_FC_AirborneData::AssignAirborneData(Entity, DefaultValue);
    return;
}
FC_AirborneData& ModifyAirborneData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AirborneData));
    return local_12.GetComp();
}
FC_AirborneData& ModifyOrAddAirborneData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AirborneData));
    return local_12.GetComp();
}
const FC_AirborneData& GetAirborneData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AirborneData));
    return local_12.GetComp();
}
UFUNCTION()
FC_AirborneData GetAirborneData_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AirborneData& local_4 = ECSFunc_FC_AirborneData::GetAirborneData(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AirborneData();
}
const FC_AirborneData GetDefaultedAirborneData(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AirborneData __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AirborneData);
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
FC_AirborneData GetDefaultedAirborneData_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AirborneData::GetDefaultedAirborneData(Entity);
}
UFUNCTION()
bool RemoveAirborneData(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AirborneData);
}
}
FECSMonitorRuntimeView __GetMonitorAirborneDataOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AirborneData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAirborneDataOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AirborneData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAirborneDataOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AirborneData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAirborneDataOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AirborneData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAirborneDataOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AirborneData, bFixedFrame, bMustHandleAll);
}
void __MonitorAirborneDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AirborneData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAirborneDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AirborneData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAirborneDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AirborneData, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_ImpactFXConfig
{
UFUNCTION()
bool HasImpactFXConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_ImpactFXConfig);
}
FC_ImpactFXConfig& AssignImpactFXConfig(const FECSEntity &inout Entity, const FC_ImpactFXConfig &inout DefaultValue = FC_ImpactFXConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_ImpactFXConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignImpactFXConfig_BP(const FECSEntity &inout Entity, const FC_ImpactFXConfig &inout DefaultValue = FC_ImpactFXConfig())
{
    ECSFunc_FC_ImpactFXConfig::AssignImpactFXConfig(Entity, DefaultValue);
    return;
}
FC_ImpactFXConfig& ModifyImpactFXConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_ImpactFXConfig));
    return local_12.GetComp();
}
FC_ImpactFXConfig& ModifyOrAddImpactFXConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_ImpactFXConfig));
    return local_12.GetComp();
}
const FC_ImpactFXConfig& GetImpactFXConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_ImpactFXConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_ImpactFXConfig GetImpactFXConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_ImpactFXConfig& local_4 = ECSFunc_FC_ImpactFXConfig::GetImpactFXConfig(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_ImpactFXConfig();
}
const FC_ImpactFXConfig GetDefaultedImpactFXConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_ImpactFXConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_ImpactFXConfig);
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
FC_ImpactFXConfig GetDefaultedImpactFXConfig_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_ImpactFXConfig::GetDefaultedImpactFXConfig(Entity);
}
UFUNCTION()
bool RemoveImpactFXConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_ImpactFXConfig);
}
}
FECSMonitorRuntimeView __GetMonitorImpactFXConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_ImpactFXConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorImpactFXConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_ImpactFXConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorImpactFXConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_ImpactFXConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorImpactFXConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_ImpactFXConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorImpactFXConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_ImpactFXConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorImpactFXConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_ImpactFXConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorImpactFXConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_ImpactFXConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorImpactFXConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_ImpactFXConfig, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FSubDirtyFlags16 GetDirtyFlags(FEntityLandedInfo &inout Data)
{
    FSubDirtyFlags16 __r;
    return __r;
}
void ClearDirtyFlags(FEntityLandedInfo &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FEntityLandedInfo
{
int __IndexOf_CharacterSize()
{
    return 0;
}
int __IndexOf_bUseLandedStrengthLevelDirectly()
{
    return 1;
}
int __IndexOf_LandedStrengthLevel()
{
    return 2;
}
int __IndexOf_ActionImpactType()
{
    return 3;
}
int __IndexOf_LandedStrength()
{
    return 4;
}
int __IndexOf_Velocity()
{
    return 5;
}
int __IndexOf_EntityMass()
{
    return 6;
}
int __IndexOf_AttachName()
{
    return 7;
}
int __IndexOf_RootBoneName()
{
    return 8;
}
int __IndexOf_TraceStartOffset()
{
    return 9;
}
int __IndexOf_TraceDir()
{
    return 10;
}
int __IndexOf_TraceLength()
{
    return 11;
}
int __IndexOf_bDurational()
{
    return 12;
}
int __IndexOf_ImpactRotationType()
{
    return 13;
}
int __IndexOf_ImpactEventType()
{
    return 14;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_AirborneData &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_AirborneData &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AirborneData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AirborneData
{
int __IndexOf_Velocity()
{
    return 0;
}
}
