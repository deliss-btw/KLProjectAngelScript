
enum EAttributeSampleType
{
    None,
    PositionXY,
    PositionZ,
    Position2D = 1,
    Position = 3,
    RotationXY,
    RotationZ = 8,
    RotationAngle = 8,
    Rotation = 12,
    Transform2D = 9,
    Transform = 15,
    HP,
    All = 255,
}

enum EAttributeSampleRequester
{
    LevelSpot,
    Mark,
    Guide,
}

namespace __INTENRAL_FCS_GlobalAttributeSampler_NS
{
    const TECSComponentDerivedPtr<FCS_GlobalAttributeSampler> DerivedPtr = TECSComponentDerivedPtr<FCS_GlobalAttributeSampler>();
    const FCS_GlobalAttributeSampler DefaultValue = FCS_GlobalAttributeSampler();
}
namespace __INTENRAL_FC_AttributeSampler_NS
{
    const TECSComponentDerivedPtr<FC_AttributeSampler> DerivedPtr = TECSComponentDerivedPtr<FC_AttributeSampler>();
    const FC_AttributeSampler DefaultValue = FC_AttributeSampler();
}
namespace __INTENRAL_FC_AttributeSample_NS
{
    const TECSComponentDerivedPtr<FC_AttributeSample> DerivedPtr = TECSComponentDerivedPtr<FC_AttributeSample>();
    const FC_AttributeSample DefaultValue = FC_AttributeSample();
}
namespace __INTENRAL_FC_AttributeSampleSnapshot_NS
{
    const TECSComponentDerivedPtr<FC_AttributeSampleSnapshot> DerivedPtr = TECSComponentDerivedPtr<FC_AttributeSampleSnapshot>();
    const FC_AttributeSampleSnapshot DefaultValue = FC_AttributeSampleSnapshot();
}
namespace __INTENRAL_FC_AttributeSampleModifyDeferTag_NS
{
    const TECSComponentDerivedPtr<FC_AttributeSampleModifyDeferTag> DerivedPtr = TECSComponentDerivedPtr<FC_AttributeSampleModifyDeferTag>();
    const FC_AttributeSampleModifyDeferTag DefaultValue = FC_AttributeSampleModifyDeferTag();
}
namespace __INTENRAL_FCS_Position2DAttributeSample_NS
{
    const TECSComponentDerivedPtr<FCS_Position2DAttributeSample> DerivedPtr = TECSComponentDerivedPtr<FCS_Position2DAttributeSample>();
    const FCS_Position2DAttributeSample DefaultValue = FCS_Position2DAttributeSample();
}
namespace __INTENRAL_FCS_PositionZAttributeSample_NS
{
    const TECSComponentDerivedPtr<FCS_PositionZAttributeSample> DerivedPtr = TECSComponentDerivedPtr<FCS_PositionZAttributeSample>();
    const FCS_PositionZAttributeSample DefaultValue = FCS_PositionZAttributeSample();
}
namespace __INTENRAL_FCS_RotationXYAttributeSample_NS
{
    const TECSComponentDerivedPtr<FCS_RotationXYAttributeSample> DerivedPtr = TECSComponentDerivedPtr<FCS_RotationXYAttributeSample>();
    const FCS_RotationXYAttributeSample DefaultValue = FCS_RotationXYAttributeSample();
}
namespace __INTENRAL_FCS_RotationZAttributeSample_NS
{
    const TECSComponentDerivedPtr<FCS_RotationZAttributeSample> DerivedPtr = TECSComponentDerivedPtr<FCS_RotationZAttributeSample>();
    const FCS_RotationZAttributeSample DefaultValue = FCS_RotationZAttributeSample();
}
namespace __INTENRAL_FCS_PresentationConfigAttributeSample_NS
{
    const TECSComponentDerivedPtr<FCS_PresentationConfigAttributeSample> DerivedPtr = TECSComponentDerivedPtr<FCS_PresentationConfigAttributeSample>();
    const FCS_PresentationConfigAttributeSample DefaultValue = FCS_PresentationConfigAttributeSample();
}
namespace __INTENRAL_FCS_HPAttributeSample_NS
{
    const TECSComponentDerivedPtr<FCS_HPAttributeSample> DerivedPtr = TECSComponentDerivedPtr<FCS_HPAttributeSample>();
    const FCS_HPAttributeSample DefaultValue = FCS_HPAttributeSample();

}
struct FCS_GlobalAttributeSampler : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<FECSEntityId, FBitSet32> m_AttributeSampleEntities;

    FCS_GlobalAttributeSampler()
    {
        this.__InitDirtyFlags();
        return;
    }
    FCS_GlobalAttributeSampler(const FCS_GlobalAttributeSampler &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_AttributeSampleEntities = Other.m_AttributeSampleEntities;
        return;
    }
    FCS_GlobalAttributeSampler opAssign(const FCS_GlobalAttributeSampler &inout Other)
    {
        FCS_GlobalAttributeSampler __r;
        this.SetAttributeSampleEntities(Other.GetAttributeSampleEntities());
        return __r;
    }
    const TMap<FECSEntityId, FBitSet32> GetAttributeSampleEntities() const property
    {
        const TMap<FECSEntityId, FBitSet32> __r;
        return __r;
    }
    TMap<FECSEntityId, FBitSet32> GetModify_AttributeSampleEntities() property
    {
        TMap<FECSEntityId, FBitSet32> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetAttributeSampleEntities(const TMap<FECSEntityId, FBitSet32> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_AttributeSampleEntities = __Value;
        return;
    }
}

struct FC_AttributeSampler : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<FECSEntityId, FBitSet32> m_AttributeSampleEntities;

    FC_AttributeSampler()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_AttributeSampler(const FC_AttributeSampler &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_AttributeSampleEntities = Other.m_AttributeSampleEntities;
        return;
    }
    FC_AttributeSampler opAssign(const FC_AttributeSampler &inout Other)
    {
        FC_AttributeSampler __r;
        this.SetAttributeSampleEntities(Other.GetAttributeSampleEntities());
        return __r;
    }
    const TMap<FECSEntityId, FBitSet32> GetAttributeSampleEntities() const property
    {
        const TMap<FECSEntityId, FBitSet32> __r;
        return __r;
    }
    TMap<FECSEntityId, FBitSet32> GetModify_AttributeSampleEntities() property
    {
        TMap<FECSEntityId, FBitSet32> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetAttributeSampleEntities(const TMap<FECSEntityId, FBitSet32> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_AttributeSampleEntities = __Value;
        return;
    }
}

struct FAttributeSampleInfo
{
    UPROPERTY()
    TMap<FECSEntity, FBitSet32> SamplerRequesters;
    UPROPERTY()
    FBitSet32 GlobalRequesters;

    FAttributeSampleInfo()
    {
        return;
    }
    bool IsEmpty() const
    {
        return this.IsEmpty() && this.GlobalRequesters.IsEmpty();
    }
    void AddSample(const EAttributeSampleRequester Requester, const FECSEntity &inout Sampler = ENTITY_NULL)
    {
        if ((Sampler == ENTITY_NULL))
        {
            this.GlobalRequesters.SetBit(int(Requester), true);
            return;
        }
        int local_1 = 1;
        int local_2 = int(Requester);
        this.FindOrAdd(Sampler).SetBit(local_1);
        return;
    }
    void RemoveSample(const EAttributeSampleRequester Requester, const FECSEntity &inout Sampler = ENTITY_NULL)
    {
        if ((Sampler == ENTITY_NULL))
        {
            this.GlobalRequesters.SetBit(int(Requester), false);
            return;
        }
        TRawPtr<FBitSet32> local_4 = this.Find(Sampler);
        if (local_4)
        {
            local_4.opArrow().SetBit(int(Requester), false);
            if (local_4.opArrow().IsEmpty())
            {
            }
        }
        return;
    }
    bool HasSample(const EAttributeSampleRequester Requester, const FECSEntity &inout Sampler = ENTITY_NULL) const
    {
        if ((Sampler == ENTITY_NULL))
        {
            return this.GlobalRequesters.GetBit(int(Requester));
        }
        TConstRawPtr<FBitSet32> local_4 = this.Find(Sampler);
        if (local_4)
        {
            int local_2 = int(Requester);
            return local_4.opArrow().GetBit(local_2);
        }
        return false;
    }
    bool HasAnySample(const FECSEntity &inout Sampler = ENTITY_NULL) const
    {
        if ((Sampler == ENTITY_NULL))
        {
            return !(this.GlobalRequesters.IsEmpty());
        }
        return this.Contains(Sampler);
    }
    TArray<FECSEntity> GetAllSamplers() const
    {
        TArray<FECSEntity> local_4;
        if (this.GlobalRequesters.IsEmpty())
        {
            this.GetKeys(local_4);
        }
        else
        {
            local_4.Add(ENTITY_NULL);
        }
        return local_4;
    }
    bool DiffSamplers(const FAttributeSampleInfo &inout Other, TArray<FECSEntity> &out AddedSamplers, TArray<FECSEntity> &out RemovedSamplers) const
    {
        TArray<FECSEntity> local_4;
        AddedSamplers = local_4;
        RemovedSamplers = local_4;
        if (!(this.GlobalRequesters.IsEmpty()) != !(Other.GlobalRequesters.IsEmpty()))
        {
            if (this.GlobalRequesters.IsEmpty())
            {
                AddedSamplers.Add(ENTITY_NULL);
            }
            else
            {
                RemovedSamplers.Add(ENTITY_NULL);
            }
        }
        for (auto& local_30 : Other.SamplerRequesters)
        {
            if (!(this.Contains(local_30.GetKey())))
            {
                AddedSamplers.Add(local_30.GetKey());
            }
        }
        for (auto& local_30_2 : this)
        {
            if (!(Other.SamplerRequesters.Contains(local_30_2.GetKey())))
            {
                RemovedSamplers.Add(local_30_2.GetKey());
            }
        }
        return !(AddedSamplers.IsEmpty()) || !(RemovedSamplers.IsEmpty());
    }
}

struct FC_AttributeSample : FECSComponent
{
    UPROPERTY()
    TMap<EAttributeSampleType, FAttributeSampleInfo> AttributeSamples;

    FC_AttributeSample()
    {
        return;
    }
}

struct FC_AttributeSampleSnapshot : FECSComponent
{
    UPROPERTY()
    TMap<EAttributeSampleType, FAttributeSampleInfo> AttributeSamples;

    FC_AttributeSampleSnapshot()
    {
        return;
    }
}

struct FC_AttributeSampleModifyDeferTag : FECSComponent
{
    FC_AttributeSampleModifyDeferTag()
    {
        return;
    }
}

struct FCS_Position2DAttributeSample : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<FECSEntityId, FVector2D> m_Position2DMap;

    FCS_Position2DAttributeSample()
    {
        this.__InitDirtyFlags();
        return;
    }
    FCS_Position2DAttributeSample(const FCS_Position2DAttributeSample &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_Position2DMap = Other.m_Position2DMap;
        return;
    }
    FCS_Position2DAttributeSample opAssign(const FCS_Position2DAttributeSample &inout Other)
    {
        FCS_Position2DAttributeSample __r;
        this.SetPosition2DMap(Other.GetPosition2DMap());
        return __r;
    }
    const TMap<FECSEntityId, FVector2D> GetPosition2DMap() const property
    {
        const TMap<FECSEntityId, FVector2D> __r;
        return __r;
    }
    TMap<FECSEntityId, FVector2D> GetModify_Position2DMap() property
    {
        TMap<FECSEntityId, FVector2D> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetPosition2DMap(const TMap<FECSEntityId, FVector2D> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Position2DMap = __Value;
        return;
    }
}

struct FCS_PositionZAttributeSample : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<FECSEntityId, float32> m_PositionZMap;

    FCS_PositionZAttributeSample()
    {
        this.__InitDirtyFlags();
        return;
    }
    FCS_PositionZAttributeSample(const FCS_PositionZAttributeSample &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_PositionZMap = Other.m_PositionZMap;
        return;
    }
    FCS_PositionZAttributeSample opAssign(const FCS_PositionZAttributeSample &inout Other)
    {
        FCS_PositionZAttributeSample __r;
        this.SetPositionZMap(Other.GetPositionZMap());
        return __r;
    }
    const TMap<FECSEntityId, float32> GetPositionZMap() const property
    {
        const TMap<FECSEntityId, float32> __r;
        return __r;
    }
    TMap<FECSEntityId, float32> GetModify_PositionZMap() property
    {
        TMap<FECSEntityId, float32> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetPositionZMap(const TMap<FECSEntityId, float32> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_PositionZMap = __Value;
        return;
    }
}

struct FCS_RotationXYAttributeSample : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<FECSEntityId, FVector2f> m_RotationXYMap;

    FCS_RotationXYAttributeSample()
    {
        this.__InitDirtyFlags();
        return;
    }
    FCS_RotationXYAttributeSample(const FCS_RotationXYAttributeSample &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_RotationXYMap = Other.m_RotationXYMap;
        return;
    }
    FCS_RotationXYAttributeSample opAssign(const FCS_RotationXYAttributeSample &inout Other)
    {
        FCS_RotationXYAttributeSample __r;
        this.SetRotationXYMap(Other.GetRotationXYMap());
        return __r;
    }
    const TMap<FECSEntityId, FVector2f> GetRotationXYMap() const property
    {
        const TMap<FECSEntityId, FVector2f> __r;
        return __r;
    }
    TMap<FECSEntityId, FVector2f> GetModify_RotationXYMap() property
    {
        TMap<FECSEntityId, FVector2f> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetRotationXYMap(const TMap<FECSEntityId, FVector2f> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_RotationXYMap = __Value;
        return;
    }
}

struct FCS_RotationZAttributeSample : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<FECSEntityId, float32> m_RotationZMap;

    FCS_RotationZAttributeSample()
    {
        this.__InitDirtyFlags();
        return;
    }
    FCS_RotationZAttributeSample(const FCS_RotationZAttributeSample &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_RotationZMap = Other.m_RotationZMap;
        return;
    }
    FCS_RotationZAttributeSample opAssign(const FCS_RotationZAttributeSample &inout Other)
    {
        FCS_RotationZAttributeSample __r;
        this.SetRotationZMap(Other.GetRotationZMap());
        return __r;
    }
    const TMap<FECSEntityId, float32> GetRotationZMap() const property
    {
        const TMap<FECSEntityId, float32> __r;
        return __r;
    }
    TMap<FECSEntityId, float32> GetModify_RotationZMap() property
    {
        TMap<FECSEntityId, float32> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetRotationZMap(const TMap<FECSEntityId, float32> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_RotationZMap = __Value;
        return;
    }
}

struct FCS_PresentationConfigAttributeSample : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<FECSEntityId, TDataObjectPtr<FPresentationConfig>> m_PresentationConfigMap;

    FCS_PresentationConfigAttributeSample()
    {
        this.__InitDirtyFlags();
        return;
    }
    FCS_PresentationConfigAttributeSample(const FCS_PresentationConfigAttributeSample &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_PresentationConfigMap = Other.m_PresentationConfigMap;
        return;
    }
    FCS_PresentationConfigAttributeSample opAssign(const FCS_PresentationConfigAttributeSample &inout Other)
    {
        FCS_PresentationConfigAttributeSample __r;
        this.SetPresentationConfigMap(Other.GetPresentationConfigMap());
        return __r;
    }
    const TMap<FECSEntityId, TDataObjectPtr<FPresentationConfig>> GetPresentationConfigMap() const property
    {
        const TMap<FECSEntityId, TDataObjectPtr<FPresentationConfig>> __r;
        return __r;
    }
    TMap<FECSEntityId, TDataObjectPtr<FPresentationConfig>> GetModify_PresentationConfigMap() property
    {
        TMap<FECSEntityId, TDataObjectPtr<FPresentationConfig>> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetPresentationConfigMap(const TMap<FECSEntityId, TDataObjectPtr<FPresentationConfig>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_PresentationConfigMap = __Value;
        return;
    }
}

struct FCS_HPAttributeSample : FECSSingleton
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<FECSEntityId, float32> m_HPMap;

    FCS_HPAttributeSample()
    {
        this.__InitDirtyFlags();
        return;
    }
    FCS_HPAttributeSample(const FCS_HPAttributeSample &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_HPMap = Other.m_HPMap;
        return;
    }
    FCS_HPAttributeSample opAssign(const FCS_HPAttributeSample &inout Other)
    {
        FCS_HPAttributeSample __r;
        this.SetHPMap(Other.GetHPMap());
        return __r;
    }
    const TMap<FECSEntityId, float32> GetHPMap() const property
    {
        const TMap<FECSEntityId, float32> __r;
        return __r;
    }
    TMap<FECSEntityId, float32> GetModify_HPMap() property
    {
        TMap<FECSEntityId, float32> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetHPMap(const TMap<FECSEntityId, float32> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_HPMap = __Value;
        return;
    }
}

namespace ECSFunc_FCS_GlobalAttributeSampler
{
UFUNCTION()
bool HasGlobalAttributeSampler(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_GlobalAttributeSampler);
}
FCS_GlobalAttributeSampler& AssignGlobalAttributeSampler(const FECSWorldPtr &inout World, const FCS_GlobalAttributeSampler &inout DefaultValue = FCS_GlobalAttributeSampler())
{
    UScriptStruct local_6 = FCS_GlobalAttributeSampler;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignGlobalAttributeSampler_BP(const FECSWorldPtr &inout World, const FCS_GlobalAttributeSampler &inout DefaultValue = FCS_GlobalAttributeSampler())
{
    ECSFunc_FCS_GlobalAttributeSampler::AssignGlobalAttributeSampler(World, DefaultValue);
    return;
}
FCS_GlobalAttributeSampler& ModifyGlobalAttributeSampler(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GlobalAttributeSampler;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_GlobalAttributeSampler& ModifyOrAddGlobalAttributeSampler(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GlobalAttributeSampler;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_GlobalAttributeSampler& GetGlobalAttributeSampler(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_GlobalAttributeSampler;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_GlobalAttributeSampler GetGlobalAttributeSampler_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_GlobalAttributeSampler& local_4 = ECSFunc_FCS_GlobalAttributeSampler::GetGlobalAttributeSampler(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_GlobalAttributeSampler();
}
const FCS_GlobalAttributeSampler GetDefaultedGlobalAttributeSampler(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_GlobalAttributeSampler __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_GlobalAttributeSampler);
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
FCS_GlobalAttributeSampler GetDefaultedGlobalAttributeSampler_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_GlobalAttributeSampler::GetDefaultedGlobalAttributeSampler(World);
}
UFUNCTION()
bool RemoveGlobalAttributeSampler(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_GlobalAttributeSampler);
}
}
void __MonitorGlobalAttributeSamplerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_GlobalAttributeSampler, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGlobalAttributeSamplerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_GlobalAttributeSampler, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGlobalAttributeSamplerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_GlobalAttributeSampler, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AttributeSampler
{
UFUNCTION()
bool HasAttributeSampler(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AttributeSampler);
}
FC_AttributeSampler& AssignAttributeSampler(const FECSEntity &inout Entity, const FC_AttributeSampler &inout DefaultValue = FC_AttributeSampler())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AttributeSampler, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAttributeSampler_BP(const FECSEntity &inout Entity, const FC_AttributeSampler &inout DefaultValue = FC_AttributeSampler())
{
    ECSFunc_FC_AttributeSampler::AssignAttributeSampler(Entity, DefaultValue);
    return;
}
FC_AttributeSampler& ModifyAttributeSampler(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AttributeSampler));
    return local_12.GetComp();
}
FC_AttributeSampler& ModifyOrAddAttributeSampler(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AttributeSampler));
    return local_12.GetComp();
}
const FC_AttributeSampler& GetAttributeSampler(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AttributeSampler));
    return local_12.GetComp();
}
UFUNCTION()
FC_AttributeSampler GetAttributeSampler_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AttributeSampler& local_4 = ECSFunc_FC_AttributeSampler::GetAttributeSampler(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AttributeSampler();
}
const FC_AttributeSampler GetDefaultedAttributeSampler(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AttributeSampler __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AttributeSampler);
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
FC_AttributeSampler GetDefaultedAttributeSampler_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AttributeSampler::GetDefaultedAttributeSampler(Entity);
}
UFUNCTION()
bool RemoveAttributeSampler(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AttributeSampler);
}
}
FECSMonitorRuntimeView __GetMonitorAttributeSamplerOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AttributeSampler, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttributeSamplerOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AttributeSampler, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttributeSamplerOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AttributeSampler, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttributeSamplerOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AttributeSampler, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttributeSamplerOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AttributeSampler, bFixedFrame, bMustHandleAll);
}
void __MonitorAttributeSamplerLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AttributeSampler, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAttributeSamplerActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AttributeSampler, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAttributeSamplerModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AttributeSampler, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AttributeSample
{
UFUNCTION()
bool HasAttributeSample(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AttributeSample);
}
FC_AttributeSample& AssignAttributeSample(const FECSEntity &inout Entity, const FC_AttributeSample &inout DefaultValue = FC_AttributeSample())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AttributeSample, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAttributeSample_BP(const FECSEntity &inout Entity, const FC_AttributeSample &inout DefaultValue = FC_AttributeSample())
{
    ECSFunc_FC_AttributeSample::AssignAttributeSample(Entity, DefaultValue);
    return;
}
FC_AttributeSample& ModifyAttributeSample(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AttributeSample));
    return local_12.GetComp();
}
FC_AttributeSample& ModifyOrAddAttributeSample(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AttributeSample));
    return local_12.GetComp();
}
const FC_AttributeSample& GetAttributeSample(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AttributeSample));
    return local_12.GetComp();
}
UFUNCTION()
FC_AttributeSample GetAttributeSample_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AttributeSample __r;
    bValid = false;
    bValid = ECSFunc_FC_AttributeSample::GetAttributeSample(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AttributeSample GetDefaultedAttributeSample(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AttributeSample __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AttributeSample);
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
FC_AttributeSample GetDefaultedAttributeSample_BP(const FECSEntity &inout Entity)
{
    FC_AttributeSample __r;
    return __r;
}
UFUNCTION()
bool RemoveAttributeSample(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AttributeSample);
}
}
FECSMonitorRuntimeView __GetMonitorAttributeSampleOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AttributeSample, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttributeSampleOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AttributeSample, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttributeSampleOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AttributeSample, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttributeSampleOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AttributeSample, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttributeSampleOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AttributeSample, bFixedFrame, bMustHandleAll);
}
void __MonitorAttributeSampleLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AttributeSample, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAttributeSampleActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AttributeSample, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAttributeSampleModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AttributeSample, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AttributeSampleSnapshot
{
UFUNCTION()
bool HasAttributeSampleSnapshot(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AttributeSampleSnapshot);
}
FC_AttributeSampleSnapshot& AssignAttributeSampleSnapshot(const FECSEntity &inout Entity, const FC_AttributeSampleSnapshot &inout DefaultValue = FC_AttributeSampleSnapshot())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AttributeSampleSnapshot, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAttributeSampleSnapshot_BP(const FECSEntity &inout Entity, const FC_AttributeSampleSnapshot &inout DefaultValue = FC_AttributeSampleSnapshot())
{
    ECSFunc_FC_AttributeSampleSnapshot::AssignAttributeSampleSnapshot(Entity, DefaultValue);
    return;
}
FC_AttributeSampleSnapshot& ModifyAttributeSampleSnapshot(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AttributeSampleSnapshot));
    return local_12.GetComp();
}
FC_AttributeSampleSnapshot& ModifyOrAddAttributeSampleSnapshot(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AttributeSampleSnapshot));
    return local_12.GetComp();
}
const FC_AttributeSampleSnapshot& GetAttributeSampleSnapshot(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AttributeSampleSnapshot));
    return local_12.GetComp();
}
UFUNCTION()
FC_AttributeSampleSnapshot GetAttributeSampleSnapshot_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_AttributeSampleSnapshot __r;
    bValid = false;
    bValid = ECSFunc_FC_AttributeSampleSnapshot::GetAttributeSampleSnapshot(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_AttributeSampleSnapshot GetDefaultedAttributeSampleSnapshot(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AttributeSampleSnapshot __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AttributeSampleSnapshot);
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
FC_AttributeSampleSnapshot GetDefaultedAttributeSampleSnapshot_BP(const FECSEntity &inout Entity)
{
    FC_AttributeSampleSnapshot __r;
    return __r;
}
UFUNCTION()
bool RemoveAttributeSampleSnapshot(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AttributeSampleSnapshot);
}
}
FECSMonitorRuntimeView __GetMonitorAttributeSampleSnapshotOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AttributeSampleSnapshot, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttributeSampleSnapshotOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AttributeSampleSnapshot, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttributeSampleSnapshotOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AttributeSampleSnapshot, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttributeSampleSnapshotOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AttributeSampleSnapshot, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttributeSampleSnapshotOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AttributeSampleSnapshot, bFixedFrame, bMustHandleAll);
}
void __MonitorAttributeSampleSnapshotLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AttributeSampleSnapshot, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAttributeSampleSnapshotActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AttributeSampleSnapshot, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAttributeSampleSnapshotModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AttributeSampleSnapshot, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_AttributeSampleModifyDeferTag
{
UFUNCTION()
bool HasAttributeSampleModifyDeferTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_AttributeSampleModifyDeferTag);
}
FC_AttributeSampleModifyDeferTag& AssignAttributeSampleModifyDeferTag(const FECSEntity &inout Entity, const FC_AttributeSampleModifyDeferTag &inout DefaultValue = FC_AttributeSampleModifyDeferTag())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_AttributeSampleModifyDeferTag, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignAttributeSampleModifyDeferTag_BP(const FECSEntity &inout Entity, const FC_AttributeSampleModifyDeferTag &inout DefaultValue = FC_AttributeSampleModifyDeferTag())
{
    ECSFunc_FC_AttributeSampleModifyDeferTag::AssignAttributeSampleModifyDeferTag(Entity, DefaultValue);
    return;
}
FC_AttributeSampleModifyDeferTag& ModifyAttributeSampleModifyDeferTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_AttributeSampleModifyDeferTag));
    return local_12.GetComp();
}
FC_AttributeSampleModifyDeferTag& ModifyOrAddAttributeSampleModifyDeferTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_AttributeSampleModifyDeferTag));
    return local_12.GetComp();
}
const FC_AttributeSampleModifyDeferTag& GetAttributeSampleModifyDeferTag(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_AttributeSampleModifyDeferTag));
    return local_12.GetComp();
}
UFUNCTION()
FC_AttributeSampleModifyDeferTag GetAttributeSampleModifyDeferTag_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_AttributeSampleModifyDeferTag& local_4 = ECSFunc_FC_AttributeSampleModifyDeferTag::GetAttributeSampleModifyDeferTag(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_AttributeSampleModifyDeferTag();
}
const FC_AttributeSampleModifyDeferTag GetDefaultedAttributeSampleModifyDeferTag(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_AttributeSampleModifyDeferTag __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_AttributeSampleModifyDeferTag);
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
FC_AttributeSampleModifyDeferTag GetDefaultedAttributeSampleModifyDeferTag_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_AttributeSampleModifyDeferTag::GetDefaultedAttributeSampleModifyDeferTag(Entity);
}
UFUNCTION()
bool RemoveAttributeSampleModifyDeferTag(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_AttributeSampleModifyDeferTag);
}
}
FECSMonitorRuntimeView __GetMonitorAttributeSampleModifyDeferTagOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_AttributeSampleModifyDeferTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttributeSampleModifyDeferTagOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_AttributeSampleModifyDeferTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttributeSampleModifyDeferTagOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_AttributeSampleModifyDeferTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttributeSampleModifyDeferTagOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_AttributeSampleModifyDeferTag, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorAttributeSampleModifyDeferTagOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_AttributeSampleModifyDeferTag, bFixedFrame, bMustHandleAll);
}
void __MonitorAttributeSampleModifyDeferTagLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_AttributeSampleModifyDeferTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAttributeSampleModifyDeferTagActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_AttributeSampleModifyDeferTag, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorAttributeSampleModifyDeferTagModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_AttributeSampleModifyDeferTag, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_Position2DAttributeSample
{
UFUNCTION()
bool HasPosition2DAttributeSample(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_Position2DAttributeSample);
}
FCS_Position2DAttributeSample& AssignPosition2DAttributeSample(const FECSWorldPtr &inout World, const FCS_Position2DAttributeSample &inout DefaultValue = FCS_Position2DAttributeSample())
{
    UScriptStruct local_6 = FCS_Position2DAttributeSample;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignPosition2DAttributeSample_BP(const FECSWorldPtr &inout World, const FCS_Position2DAttributeSample &inout DefaultValue = FCS_Position2DAttributeSample())
{
    ECSFunc_FCS_Position2DAttributeSample::AssignPosition2DAttributeSample(World, DefaultValue);
    return;
}
FCS_Position2DAttributeSample& ModifyPosition2DAttributeSample(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_Position2DAttributeSample;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_Position2DAttributeSample& ModifyOrAddPosition2DAttributeSample(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_Position2DAttributeSample;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_Position2DAttributeSample& GetPosition2DAttributeSample(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_Position2DAttributeSample;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_Position2DAttributeSample GetPosition2DAttributeSample_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_Position2DAttributeSample& local_4 = ECSFunc_FCS_Position2DAttributeSample::GetPosition2DAttributeSample(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_Position2DAttributeSample();
}
const FCS_Position2DAttributeSample GetDefaultedPosition2DAttributeSample(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_Position2DAttributeSample __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_Position2DAttributeSample);
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
FCS_Position2DAttributeSample GetDefaultedPosition2DAttributeSample_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_Position2DAttributeSample::GetDefaultedPosition2DAttributeSample(World);
}
UFUNCTION()
bool RemovePosition2DAttributeSample(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_Position2DAttributeSample);
}
}
void __MonitorPosition2DAttributeSampleLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_Position2DAttributeSample, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPosition2DAttributeSampleActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_Position2DAttributeSample, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPosition2DAttributeSampleModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_Position2DAttributeSample, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_PositionZAttributeSample
{
UFUNCTION()
bool HasPositionZAttributeSample(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_PositionZAttributeSample);
}
FCS_PositionZAttributeSample& AssignPositionZAttributeSample(const FECSWorldPtr &inout World, const FCS_PositionZAttributeSample &inout DefaultValue = FCS_PositionZAttributeSample())
{
    UScriptStruct local_6 = FCS_PositionZAttributeSample;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignPositionZAttributeSample_BP(const FECSWorldPtr &inout World, const FCS_PositionZAttributeSample &inout DefaultValue = FCS_PositionZAttributeSample())
{
    ECSFunc_FCS_PositionZAttributeSample::AssignPositionZAttributeSample(World, DefaultValue);
    return;
}
FCS_PositionZAttributeSample& ModifyPositionZAttributeSample(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PositionZAttributeSample;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_PositionZAttributeSample& ModifyOrAddPositionZAttributeSample(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PositionZAttributeSample;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_PositionZAttributeSample& GetPositionZAttributeSample(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PositionZAttributeSample;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_PositionZAttributeSample GetPositionZAttributeSample_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_PositionZAttributeSample& local_4 = ECSFunc_FCS_PositionZAttributeSample::GetPositionZAttributeSample(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_PositionZAttributeSample();
}
const FCS_PositionZAttributeSample GetDefaultedPositionZAttributeSample(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_PositionZAttributeSample __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_PositionZAttributeSample);
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
FCS_PositionZAttributeSample GetDefaultedPositionZAttributeSample_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_PositionZAttributeSample::GetDefaultedPositionZAttributeSample(World);
}
UFUNCTION()
bool RemovePositionZAttributeSample(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_PositionZAttributeSample);
}
}
void __MonitorPositionZAttributeSampleLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_PositionZAttributeSample, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPositionZAttributeSampleActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_PositionZAttributeSample, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPositionZAttributeSampleModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_PositionZAttributeSample, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_RotationXYAttributeSample
{
UFUNCTION()
bool HasRotationXYAttributeSample(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_RotationXYAttributeSample);
}
FCS_RotationXYAttributeSample& AssignRotationXYAttributeSample(const FECSWorldPtr &inout World, const FCS_RotationXYAttributeSample &inout DefaultValue = FCS_RotationXYAttributeSample())
{
    UScriptStruct local_6 = FCS_RotationXYAttributeSample;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignRotationXYAttributeSample_BP(const FECSWorldPtr &inout World, const FCS_RotationXYAttributeSample &inout DefaultValue = FCS_RotationXYAttributeSample())
{
    ECSFunc_FCS_RotationXYAttributeSample::AssignRotationXYAttributeSample(World, DefaultValue);
    return;
}
FCS_RotationXYAttributeSample& ModifyRotationXYAttributeSample(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_RotationXYAttributeSample;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_RotationXYAttributeSample& ModifyOrAddRotationXYAttributeSample(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_RotationXYAttributeSample;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_RotationXYAttributeSample& GetRotationXYAttributeSample(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_RotationXYAttributeSample;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_RotationXYAttributeSample GetRotationXYAttributeSample_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_RotationXYAttributeSample& local_4 = ECSFunc_FCS_RotationXYAttributeSample::GetRotationXYAttributeSample(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_RotationXYAttributeSample();
}
const FCS_RotationXYAttributeSample GetDefaultedRotationXYAttributeSample(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_RotationXYAttributeSample __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_RotationXYAttributeSample);
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
FCS_RotationXYAttributeSample GetDefaultedRotationXYAttributeSample_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_RotationXYAttributeSample::GetDefaultedRotationXYAttributeSample(World);
}
UFUNCTION()
bool RemoveRotationXYAttributeSample(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_RotationXYAttributeSample);
}
}
void __MonitorRotationXYAttributeSampleLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_RotationXYAttributeSample, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRotationXYAttributeSampleActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_RotationXYAttributeSample, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRotationXYAttributeSampleModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_RotationXYAttributeSample, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_RotationZAttributeSample
{
UFUNCTION()
bool HasRotationZAttributeSample(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_RotationZAttributeSample);
}
FCS_RotationZAttributeSample& AssignRotationZAttributeSample(const FECSWorldPtr &inout World, const FCS_RotationZAttributeSample &inout DefaultValue = FCS_RotationZAttributeSample())
{
    UScriptStruct local_6 = FCS_RotationZAttributeSample;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignRotationZAttributeSample_BP(const FECSWorldPtr &inout World, const FCS_RotationZAttributeSample &inout DefaultValue = FCS_RotationZAttributeSample())
{
    ECSFunc_FCS_RotationZAttributeSample::AssignRotationZAttributeSample(World, DefaultValue);
    return;
}
FCS_RotationZAttributeSample& ModifyRotationZAttributeSample(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_RotationZAttributeSample;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_RotationZAttributeSample& ModifyOrAddRotationZAttributeSample(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_RotationZAttributeSample;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_RotationZAttributeSample& GetRotationZAttributeSample(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_RotationZAttributeSample;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_RotationZAttributeSample GetRotationZAttributeSample_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_RotationZAttributeSample& local_4 = ECSFunc_FCS_RotationZAttributeSample::GetRotationZAttributeSample(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_RotationZAttributeSample();
}
const FCS_RotationZAttributeSample GetDefaultedRotationZAttributeSample(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_RotationZAttributeSample __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_RotationZAttributeSample);
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
FCS_RotationZAttributeSample GetDefaultedRotationZAttributeSample_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_RotationZAttributeSample::GetDefaultedRotationZAttributeSample(World);
}
UFUNCTION()
bool RemoveRotationZAttributeSample(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_RotationZAttributeSample);
}
}
void __MonitorRotationZAttributeSampleLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_RotationZAttributeSample, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRotationZAttributeSampleActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_RotationZAttributeSample, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorRotationZAttributeSampleModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_RotationZAttributeSample, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_PresentationConfigAttributeSample
{
UFUNCTION()
bool HasPresentationConfigAttributeSample(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_PresentationConfigAttributeSample);
}
FCS_PresentationConfigAttributeSample& AssignPresentationConfigAttributeSample(const FECSWorldPtr &inout World, const FCS_PresentationConfigAttributeSample &inout DefaultValue = FCS_PresentationConfigAttributeSample())
{
    UScriptStruct local_6 = FCS_PresentationConfigAttributeSample;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignPresentationConfigAttributeSample_BP(const FECSWorldPtr &inout World, const FCS_PresentationConfigAttributeSample &inout DefaultValue = FCS_PresentationConfigAttributeSample())
{
    ECSFunc_FCS_PresentationConfigAttributeSample::AssignPresentationConfigAttributeSample(World, DefaultValue);
    return;
}
FCS_PresentationConfigAttributeSample& ModifyPresentationConfigAttributeSample(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PresentationConfigAttributeSample;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_PresentationConfigAttributeSample& ModifyOrAddPresentationConfigAttributeSample(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PresentationConfigAttributeSample;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_PresentationConfigAttributeSample& GetPresentationConfigAttributeSample(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_PresentationConfigAttributeSample;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_PresentationConfigAttributeSample GetPresentationConfigAttributeSample_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_PresentationConfigAttributeSample& local_4 = ECSFunc_FCS_PresentationConfigAttributeSample::GetPresentationConfigAttributeSample(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_PresentationConfigAttributeSample();
}
const FCS_PresentationConfigAttributeSample GetDefaultedPresentationConfigAttributeSample(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_PresentationConfigAttributeSample __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_PresentationConfigAttributeSample);
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
FCS_PresentationConfigAttributeSample GetDefaultedPresentationConfigAttributeSample_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_PresentationConfigAttributeSample::GetDefaultedPresentationConfigAttributeSample(World);
}
UFUNCTION()
bool RemovePresentationConfigAttributeSample(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_PresentationConfigAttributeSample);
}
}
void __MonitorPresentationConfigAttributeSampleLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_PresentationConfigAttributeSample, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPresentationConfigAttributeSampleActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_PresentationConfigAttributeSample, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPresentationConfigAttributeSampleModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_PresentationConfigAttributeSample, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FCS_HPAttributeSample
{
UFUNCTION()
bool HasHPAttributeSample(const FECSWorldPtr &inout World)
{
    return ECSInternal::Has(World, ENTITY_ID_NULL, FCS_HPAttributeSample);
}
FCS_HPAttributeSample& AssignHPAttributeSample(const FECSWorldPtr &inout World, const FCS_HPAttributeSample &inout DefaultValue = FCS_HPAttributeSample())
{
    UScriptStruct local_6 = FCS_HPAttributeSample;
    FECSComponentPtr local_8;
    int local_10 = local_8 = ECSInternal::Assign(World, ENTITY_ID_NULL, local_6, FECSComponentPtr(DefaultValue));
    local_10.InternalSet(local_8);
    return local_10.GetComp();
}
UFUNCTION()
void AssignHPAttributeSample_BP(const FECSWorldPtr &inout World, const FCS_HPAttributeSample &inout DefaultValue = FCS_HPAttributeSample())
{
    ECSFunc_FCS_HPAttributeSample::AssignHPAttributeSample(World, DefaultValue);
    return;
}
FCS_HPAttributeSample& ModifyHPAttributeSample(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_HPAttributeSample;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Modify(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
FCS_HPAttributeSample& ModifyOrAddHPAttributeSample(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_HPAttributeSample;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::ModifyOrAdd(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
const FCS_HPAttributeSample& GetHPAttributeSample(const FECSWorldPtr &inout World)
{
    UScriptStruct local_4 = FCS_HPAttributeSample;
    FECSComponentPtr local_6;
    int local_8 = local_6 = ECSInternal::Get(World, ENTITY_ID_NULL, local_4);
    local_8.InternalSet(local_6);
    return local_8.GetComp();
}
UFUNCTION()
FCS_HPAttributeSample GetHPAttributeSample_BP(const FECSWorldPtr &inout World, bool &out bValid)
{
    bValid = false;
    const FCS_HPAttributeSample& local_4 = ECSFunc_FCS_HPAttributeSample::GetHPAttributeSample(World);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FCS_HPAttributeSample();
}
const FCS_HPAttributeSample GetDefaultedHPAttributeSample(const FECSWorldPtr &inout World)
{
    int local_10 = 0;
    const FCS_HPAttributeSample __r;
    FECSComponentPtr local_6 = ECSInternal::GetDefaulted(World, ENTITY_ID_NULL, FCS_HPAttributeSample);
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
FCS_HPAttributeSample GetDefaultedHPAttributeSample_BP(const FECSWorldPtr &inout World)
{
    return ECSFunc_FCS_HPAttributeSample::GetDefaultedHPAttributeSample(World);
}
UFUNCTION()
bool RemoveHPAttributeSample(const FECSWorldPtr &inout World)
{
    return ECSInternal::Remove(World, ENTITY_ID_NULL, FCS_HPAttributeSample);
}
}
void __MonitorHPAttributeSampleLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FCS_HPAttributeSample, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHPAttributeSampleActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FCS_HPAttributeSample, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorHPAttributeSampleModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FCS_HPAttributeSample, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCS_GlobalAttributeSampler &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_GlobalAttributeSampler &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_GlobalAttributeSampler &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_GlobalAttributeSampler
{
int __IndexOf_AttributeSampleEntities()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_AttributeSampler &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_AttributeSampler &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_AttributeSampler &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_AttributeSampler
{
int __IndexOf_AttributeSampleEntities()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCS_Position2DAttributeSample &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_Position2DAttributeSample &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_Position2DAttributeSample &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_Position2DAttributeSample
{
int __IndexOf_Position2DMap()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCS_PositionZAttributeSample &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_PositionZAttributeSample &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_PositionZAttributeSample &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_PositionZAttributeSample
{
int __IndexOf_PositionZMap()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCS_RotationXYAttributeSample &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_RotationXYAttributeSample &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_RotationXYAttributeSample &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_RotationXYAttributeSample
{
int __IndexOf_RotationXYMap()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCS_RotationZAttributeSample &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_RotationZAttributeSample &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_RotationZAttributeSample &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_RotationZAttributeSample
{
int __IndexOf_RotationZMap()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCS_PresentationConfigAttributeSample &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_PresentationConfigAttributeSample &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_PresentationConfigAttributeSample &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_PresentationConfigAttributeSample
{
int __IndexOf_PresentationConfigMap()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCS_HPAttributeSample &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCS_HPAttributeSample &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCS_HPAttributeSample &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCS_HPAttributeSample
{
int __IndexOf_HPMap()
{
    return 0;
}
}
