
enum ECombatArealEffectSpawnShapeMode
{
    Capsule,
    Box,
}

namespace __INTENRAL_FC_CombatArealEffectRuntime_NS
{
    const TECSComponentDerivedPtr<FC_CombatArealEffectRuntime> DerivedPtr = TECSComponentDerivedPtr<FC_CombatArealEffectRuntime>();
    const FC_CombatArealEffectRuntime DefaultValue = FC_CombatArealEffectRuntime();
}
namespace __INTENRAL_FC_CombatArealEffectTestShape_NS
{
    const TECSComponentDerivedPtr<FC_CombatArealEffectTestShape> DerivedPtr = TECSComponentDerivedPtr<FC_CombatArealEffectTestShape>();
    const FC_CombatArealEffectTestShape DefaultValue = FC_CombatArealEffectTestShape();
}
namespace __INTENRAL_FC_CombatArealEffectFXConfig_NS
{
    const TECSComponentDerivedPtr<FC_CombatArealEffectFXConfig> DerivedPtr = TECSComponentDerivedPtr<FC_CombatArealEffectFXConfig>();
    const FC_CombatArealEffectFXConfig DefaultValue = FC_CombatArealEffectFXConfig();
}
namespace __INTENRAL_FC_CombatArealEffectFXRuntime_NS
{
    const TECSComponentDerivedPtr<FC_CombatArealEffectFXRuntime> DerivedPtr = TECSComponentDerivedPtr<FC_CombatArealEffectFXRuntime>();
    const FC_CombatArealEffectFXRuntime DefaultValue = FC_CombatArealEffectFXRuntime();
}
namespace __INTENRAL_FC_CombatArealEffectBuffConfig_NS
{
    const TECSComponentDerivedPtr<FC_CombatArealEffectBuffConfig> DerivedPtr = TECSComponentDerivedPtr<FC_CombatArealEffectBuffConfig>();
    const FC_CombatArealEffectBuffConfig DefaultValue = FC_CombatArealEffectBuffConfig();
}
namespace __INTENRAL_FC_CombatArealEffectBuffOverride_NS
{
    const TECSComponentDerivedPtr<FC_CombatArealEffectBuffOverride> DerivedPtr = TECSComponentDerivedPtr<FC_CombatArealEffectBuffOverride>();
    const FC_CombatArealEffectBuffOverride DefaultValue = FC_CombatArealEffectBuffOverride();
}
namespace __INTENRAL_FC_CombatArealEffectBuffAddedData_NS
{
    const TECSComponentDerivedPtr<FC_CombatArealEffectBuffAddedData> DerivedPtr = TECSComponentDerivedPtr<FC_CombatArealEffectBuffAddedData>();
    const FC_CombatArealEffectBuffAddedData DefaultValue = FC_CombatArealEffectBuffAddedData();
}
namespace __INTENRAL_FC_CombatArealEffectAbilityEffectTriggerConfig_NS
{
    const TECSComponentDerivedPtr<FC_CombatArealEffectAbilityEffectTriggerConfig> DerivedPtr = TECSComponentDerivedPtr<FC_CombatArealEffectAbilityEffectTriggerConfig>();
    const FC_CombatArealEffectAbilityEffectTriggerConfig DefaultValue = FC_CombatArealEffectAbilityEffectTriggerConfig();
}
namespace __INTENRAL_FC_CombatArealEffectAbilityEffectTriggerOverride_NS
{
    const TECSComponentDerivedPtr<FC_CombatArealEffectAbilityEffectTriggerOverride> DerivedPtr = TECSComponentDerivedPtr<FC_CombatArealEffectAbilityEffectTriggerOverride>();
    const FC_CombatArealEffectAbilityEffectTriggerOverride DefaultValue = FC_CombatArealEffectAbilityEffectTriggerOverride();
}
namespace __INTENRAL_FC_CombatArealEffectHitTestConfig_NS
{
    const TECSComponentDerivedPtr<FC_CombatArealEffectHitTestConfig> DerivedPtr = TECSComponentDerivedPtr<FC_CombatArealEffectHitTestConfig>();
    const FC_CombatArealEffectHitTestConfig DefaultValue = FC_CombatArealEffectHitTestConfig();
}
namespace __INTENRAL_FC_CombatArealEffectHitTestOverride_NS
{
    const TECSComponentDerivedPtr<FC_CombatArealEffectHitTestOverride> DerivedPtr = TECSComponentDerivedPtr<FC_CombatArealEffectHitTestOverride>();
    const FC_CombatArealEffectHitTestOverride DefaultValue = FC_CombatArealEffectHitTestOverride();
}
namespace __INTENRAL_FC_CombatArealEffectSpawnerConfig_NS
{
    const TECSComponentDerivedPtr<FC_CombatArealEffectSpawnerConfig> DerivedPtr = TECSComponentDerivedPtr<FC_CombatArealEffectSpawnerConfig>();
    const FC_CombatArealEffectSpawnerConfig DefaultValue = FC_CombatArealEffectSpawnerConfig();
}
namespace __INTENRAL_FC_CombatArealEffectSpawnerRuntime_NS
{
    const TECSComponentDerivedPtr<FC_CombatArealEffectSpawnerRuntime> DerivedPtr = TECSComponentDerivedPtr<FC_CombatArealEffectSpawnerRuntime>();
    const FC_CombatArealEffectSpawnerRuntime DefaultValue = FC_CombatArealEffectSpawnerRuntime();

}
struct FC_CombatArealEffectRuntime : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    ECombatArealEffectType m_Type;
    UPROPERTY()
    TMap<FECSEntity, FFPTime> m_EntityLastEffectedTime;
    UPROPERTY()
    FFPTime m_NextCheckTime;

    FC_CombatArealEffectRuntime()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_CombatArealEffectRuntime(const FC_CombatArealEffectRuntime &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_CombatArealEffectRuntime opAssign(const FC_CombatArealEffectRuntime &inout Other)
    {
        FC_CombatArealEffectRuntime __r;
        this.SetType(Other.GetType());
        this.SetEntityLastEffectedTime(Other.GetEntityLastEffectedTime());
        this.SetNextCheckTime(Other.GetNextCheckTime());
        return __r;
    }
    ECombatArealEffectType GetType() const property
    {
        return this.m_Type;
    }
    void SetType(const ECombatArealEffectType __Value) property
    {
        if (int(this.m_Type) == int(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Type = __Value;
        return;
    }
    const TMap<FECSEntity, FFPTime> GetEntityLastEffectedTime() const property
    {
        const TMap<FECSEntity, FFPTime> __r;
        return __r;
    }
    TMap<FECSEntity, FFPTime> GetModify_EntityLastEffectedTime() property
    {
        TMap<FECSEntity, FFPTime> __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetEntityLastEffectedTime(const TMap<FECSEntity, FFPTime> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_EntityLastEffectedTime = __Value;
        return;
    }
    const FFPTime GetNextCheckTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_NextCheckTime() property
    {
        FFPTime __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetNextCheckTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_NextCheckTime = __Value;
        return;
    }
}

struct FC_CombatArealEffectTestShape : FECSComponent
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FHitTestShape m_Shape;

    FC_CombatArealEffectTestShape()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_CombatArealEffectTestShape(const FC_CombatArealEffectTestShape &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_Shape = Other.m_Shape;
        return;
    }
    FC_CombatArealEffectTestShape opAssign(const FC_CombatArealEffectTestShape &inout Other)
    {
        FC_CombatArealEffectTestShape __r;
        this.SetShape(Other.GetShape());
        return __r;
    }
    const FHitTestShape GetShape() const property
    {
        const FHitTestShape __r;
        return __r;
    }
    FHitTestShape GetShape() property
    {
        FHitTestShape __r;
        return __r;
    }
    void SetShape(const FHitTestShape &inout __Value) property
    {
        this.m_Shape = __Value;
        return;
    }
}

struct FArealEffectFXConfig
{
    UPROPERTY()
    bool bDetach = false;
    UPROPERTY()
    bool bUseAbsoluteRotation = false;
    UPROPERTY()
    FVector LocationOffset = FVector::ZeroVector;
    UPROPERTY()
    FRotator RotationOffset = FRotator::ZeroRotator;
    UPROPERTY()
    FVector Scale = FVector::OneVector;
    UPROPERTY()
    FSoftClassPath Asset;
    UPROPERTY()
    TArray<FFXOverrideParam> OverrideParams;
    UPROPERTY()
    FFXSurfaceTraceParam SurfaceTraceParam;


    FFXConfig GetFXConfig() const
    {
        FFXConfig local_116;
        local_116.SetAsset(this.Asset);
        local_116.SetScale(this.Scale);
        local_116.SetbDetach(this.bDetach);
        local_116.SetbUseAbsoluteRotation(this.bUseAbsoluteRotation);
        local_116.SetLocationOffset(this.LocationOffset);
        local_116.SetRotationOffset(this.RotationOffset);
        local_116.SetOverrideParams(this.OverrideParams);
        local_116.SetSurfaceTraceParam(this.SurfaceTraceParam);
        return local_116;
    }
}

struct FC_CombatArealEffectFXConfig : FECSComponent
{
    UPROPERTY()
    EFXStopMethod StopMethodOnActionEnd = EFXStopMethod(0);
    UPROPERTY()
    FArealEffectFXConfig FXConfig;


}

struct FC_CombatArealEffectFXRuntime : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_FXEntity;
    UPROPERTY()
    bool m_bActiveEmitter;

    FC_CombatArealEffectFXRuntime()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_CombatArealEffectFXRuntime(const FC_CombatArealEffectFXRuntime &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_CombatArealEffectFXRuntime opAssign(const FC_CombatArealEffectFXRuntime &inout Other)
    {
        FC_CombatArealEffectFXRuntime __r;
        this.SetFXEntity(Other.GetFXEntity());
        this.SetbActiveEmitter(Other.GetbActiveEmitter());
        return __r;
    }
    const FECSEntity GetFXEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_FXEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetFXEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_FXEntity = __Value;
        return;
    }
    bool GetbActiveEmitter() const property
    {
        return this.m_bActiveEmitter;
    }
    void SetbActiveEmitter(const bool __Value) property
    {
        if (!(this.m_bActiveEmitter) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bActiveEmitter = __Value;
        return;
    }
}

struct FC_CombatArealEffectBuffConfig : FECSComponent
{
    UPROPERTY()
    FCombatArealEffectConfigData_Buff ConfigData;

    FC_CombatArealEffectBuffConfig()
    {
        return;
    }
}

struct FC_CombatArealEffectBuffOverride : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TDataObjectPtr<FCombatArealEffectConfigDataObject_Buff> m_DataObject;

    FC_CombatArealEffectBuffOverride()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_CombatArealEffectBuffOverride(const FC_CombatArealEffectBuffOverride &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_DataObject = Other.m_DataObject;
        return;
    }
    FC_CombatArealEffectBuffOverride opAssign(const FC_CombatArealEffectBuffOverride &inout Other)
    {
        FC_CombatArealEffectBuffOverride __r;
        this.SetDataObject(Other.GetDataObject());
        return __r;
    }
    const TDataObjectPtr<FCombatArealEffectConfigDataObject_Buff> GetDataObject() const property
    {
        const TDataObjectPtr<FCombatArealEffectConfigDataObject_Buff> __r;
        return __r;
    }
    TDataObjectPtr<FCombatArealEffectConfigDataObject_Buff> GetModify_DataObject() property
    {
        TDataObjectPtr<FCombatArealEffectConfigDataObject_Buff> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetDataObject(const TDataObjectPtr<FCombatArealEffectConfigDataObject_Buff> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_DataObject = __Value;
        return;
    }
}

struct FCombatArealEffectBuffAddedData
{
    UPROPERTY()
    TArray<FECSEntityId> m_BuffEntityIds;

    FCombatArealEffectBuffAddedData()
    {
        return;
    }
    const TArray<FECSEntityId> GetBuffEntityIds() const property
    {
        const TArray<FECSEntityId> __r;
        return __r;
    }
    TArray<FECSEntityId> GetBuffEntityIds() property
    {
        TArray<FECSEntityId> __r;
        return __r;
    }
    void SetBuffEntityIds(const TArray<FECSEntityId> &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

struct FC_CombatArealEffectBuffAddedData : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TMap<FECSEntityId, FCombatArealEffectBuffAddedData> m_DataByOwnerEntity;

    FC_CombatArealEffectBuffAddedData()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_CombatArealEffectBuffAddedData(const FC_CombatArealEffectBuffAddedData &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_DataByOwnerEntity = Other.m_DataByOwnerEntity;
        return;
    }
    FC_CombatArealEffectBuffAddedData opAssign(const FC_CombatArealEffectBuffAddedData &inout Other)
    {
        FC_CombatArealEffectBuffAddedData __r;
        this.SetDataByOwnerEntity(Other.GetDataByOwnerEntity());
        return __r;
    }
    const TMap<FECSEntityId, FCombatArealEffectBuffAddedData> GetDataByOwnerEntity() const property
    {
        const TMap<FECSEntityId, FCombatArealEffectBuffAddedData> __r;
        return __r;
    }
    TMap<FECSEntityId, FCombatArealEffectBuffAddedData> GetModify_DataByOwnerEntity() property
    {
        TMap<FECSEntityId, FCombatArealEffectBuffAddedData> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetDataByOwnerEntity(const TMap<FECSEntityId, FCombatArealEffectBuffAddedData> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_DataByOwnerEntity = __Value;
        return;
    }
}

struct FC_CombatArealEffectAbilityEffectTriggerConfig : FECSComponent
{
    UPROPERTY()
    FCombatArealEffectConfigData_AbilityEffectTrigger ConfigData;

    FC_CombatArealEffectAbilityEffectTriggerConfig()
    {
        return;
    }
}

struct FC_CombatArealEffectAbilityEffectTriggerOverride : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TDataObjectPtr<FCombatArealEffectConfigDataObject_AbilityEffectTrigger> m_DataObject;

    FC_CombatArealEffectAbilityEffectTriggerOverride()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_CombatArealEffectAbilityEffectTriggerOverride(const FC_CombatArealEffectAbilityEffectTriggerOverride &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_DataObject = Other.m_DataObject;
        return;
    }
    FC_CombatArealEffectAbilityEffectTriggerOverride opAssign(const FC_CombatArealEffectAbilityEffectTriggerOverride &inout Other)
    {
        FC_CombatArealEffectAbilityEffectTriggerOverride __r;
        this.SetDataObject(Other.GetDataObject());
        return __r;
    }
    const TDataObjectPtr<FCombatArealEffectConfigDataObject_AbilityEffectTrigger> GetDataObject() const property
    {
        const TDataObjectPtr<FCombatArealEffectConfigDataObject_AbilityEffectTrigger> __r;
        return __r;
    }
    TDataObjectPtr<FCombatArealEffectConfigDataObject_AbilityEffectTrigger> GetModify_DataObject() property
    {
        TDataObjectPtr<FCombatArealEffectConfigDataObject_AbilityEffectTrigger> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetDataObject(const TDataObjectPtr<FCombatArealEffectConfigDataObject_AbilityEffectTrigger> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_DataObject = __Value;
        return;
    }
}

struct FC_CombatArealEffectHitTestConfig : FECSComponent
{
    UPROPERTY()
    FCombatArealEffectConfigData_HitTest ConfigData;

    FC_CombatArealEffectHitTestConfig()
    {
        return;
    }
}

struct FC_CombatArealEffectHitTestOverride : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    TDataObjectPtr<FCombatArealEffectConfigData_HitTest> m_DataObject;

    FC_CombatArealEffectHitTestOverride()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_CombatArealEffectHitTestOverride(const FC_CombatArealEffectHitTestOverride &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_DataObject = Other.m_DataObject;
        return;
    }
    FC_CombatArealEffectHitTestOverride opAssign(const FC_CombatArealEffectHitTestOverride &inout Other)
    {
        FC_CombatArealEffectHitTestOverride __r;
        this.SetDataObject(Other.GetDataObject());
        return __r;
    }
    const TDataObjectPtr<FCombatArealEffectConfigData_HitTest> GetDataObject() const property
    {
        const TDataObjectPtr<FCombatArealEffectConfigData_HitTest> __r;
        return __r;
    }
    TDataObjectPtr<FCombatArealEffectConfigData_HitTest> GetModify_DataObject() property
    {
        TDataObjectPtr<FCombatArealEffectConfigData_HitTest> __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetDataObject(const TDataObjectPtr<FCombatArealEffectConfigData_HitTest> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_DataObject = __Value;
        return;
    }
}

struct FC_CombatArealEffectSpawnerConfig : FECSComponent
{
    UPROPERTY()
    TSubclassOf<ACombatArealEffectPrefab> ArealEffectPrefab;
    UPROPERTY()
    FFPTime SpawnInterval = 0.1;
    UPROPERTY()
    FFPTime ArealEffectDuration = 1.0;
    UPROPERTY()
    bool bGenArealEffectShapeByMovement = true;
    UPROPERTY()
    bool bOnlySpawnOnGround = false;
    UPROPERTY()
    bool bOnlyEmitFXGround = false;
    UPROPERTY()
    float32 TestGroundTraceDownDist = 20.0f;
    UPROPERTY()
    ECombatArealEffectSpawnShapeMode ShapeMode = ECombatArealEffectSpawnShapeMode(0);
    UPROPERTY()
    float32 Radius = 50.0f;
    UPROPERTY()
    float32 Width = 100.0f;
    UPROPERTY()
    float32 Height = 100.0f;


}

struct FC_CombatArealEffectSpawnerRuntime : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    bool m_bLastSpawnSuccess;
    UPROPERTY()
    FFPTime m_NextSpawnTime;
    UPROPERTY()
    FVector m_LastSpawnPos;

    FC_CombatArealEffectSpawnerRuntime()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_CombatArealEffectSpawnerRuntime(const FC_CombatArealEffectSpawnerRuntime &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FC_CombatArealEffectSpawnerRuntime opAssign(const FC_CombatArealEffectSpawnerRuntime &inout Other)
    {
        FC_CombatArealEffectSpawnerRuntime __r;
        this.SetbLastSpawnSuccess(Other.GetbLastSpawnSuccess());
        this.SetNextSpawnTime(Other.GetNextSpawnTime());
        this.SetLastSpawnPos(Other.GetLastSpawnPos());
        return __r;
    }
    bool GetbLastSpawnSuccess() const property
    {
        return this.m_bLastSpawnSuccess;
    }
    void SetbLastSpawnSuccess(const bool __Value) property
    {
        if (!(this.m_bLastSpawnSuccess) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_bLastSpawnSuccess = __Value;
        return;
    }
    const FFPTime GetNextSpawnTime() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_NextSpawnTime() property
    {
        FFPTime __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetNextSpawnTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_NextSpawnTime = __Value;
        return;
    }
    const FVector GetLastSpawnPos() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_LastSpawnPos() property
    {
        FVector __r;
        this.__MarkDirty(2);
        return __r;
    }
    void SetLastSpawnPos(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_LastSpawnPos = __Value;
        return;
    }
}

namespace ECSFunc_FC_CombatArealEffectRuntime
{
UFUNCTION()
bool HasCombatArealEffectRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectRuntime);
}
FC_CombatArealEffectRuntime& AssignCombatArealEffectRuntime(const FECSEntity &inout Entity, const FC_CombatArealEffectRuntime &inout DefaultValue = FC_CombatArealEffectRuntime())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectRuntime, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCombatArealEffectRuntime_BP(const FECSEntity &inout Entity, const FC_CombatArealEffectRuntime &inout DefaultValue = FC_CombatArealEffectRuntime())
{
    ECSFunc_FC_CombatArealEffectRuntime::AssignCombatArealEffectRuntime(Entity, DefaultValue);
    return;
}
FC_CombatArealEffectRuntime& ModifyCombatArealEffectRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectRuntime));
    return local_12.GetComp();
}
FC_CombatArealEffectRuntime& ModifyOrAddCombatArealEffectRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectRuntime));
    return local_12.GetComp();
}
const FC_CombatArealEffectRuntime& GetCombatArealEffectRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectRuntime));
    return local_12.GetComp();
}
UFUNCTION()
FC_CombatArealEffectRuntime GetCombatArealEffectRuntime_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CombatArealEffectRuntime& local_4 = ECSFunc_FC_CombatArealEffectRuntime::GetCombatArealEffectRuntime(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CombatArealEffectRuntime();
}
const FC_CombatArealEffectRuntime GetDefaultedCombatArealEffectRuntime(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CombatArealEffectRuntime __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectRuntime);
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
FC_CombatArealEffectRuntime GetDefaultedCombatArealEffectRuntime_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CombatArealEffectRuntime::GetDefaultedCombatArealEffectRuntime(Entity);
}
UFUNCTION()
bool RemoveCombatArealEffectRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectRuntime);
}
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectRuntimeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CombatArealEffectRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectRuntimeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CombatArealEffectRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectRuntimeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CombatArealEffectRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectRuntimeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CombatArealEffectRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectRuntimeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CombatArealEffectRuntime, bFixedFrame, bMustHandleAll);
}
void __MonitorCombatArealEffectRuntimeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CombatArealEffectRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatArealEffectRuntimeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CombatArealEffectRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatArealEffectRuntimeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CombatArealEffectRuntime, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CombatArealEffectTestShape
{
UFUNCTION()
bool HasCombatArealEffectTestShape(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectTestShape);
}
FC_CombatArealEffectTestShape& AssignCombatArealEffectTestShape(const FECSEntity &inout Entity, const FC_CombatArealEffectTestShape &inout DefaultValue = FC_CombatArealEffectTestShape())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectTestShape, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCombatArealEffectTestShape_BP(const FECSEntity &inout Entity, const FC_CombatArealEffectTestShape &inout DefaultValue = FC_CombatArealEffectTestShape())
{
    ECSFunc_FC_CombatArealEffectTestShape::AssignCombatArealEffectTestShape(Entity, DefaultValue);
    return;
}
FC_CombatArealEffectTestShape& ModifyCombatArealEffectTestShape(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectTestShape));
    return local_12.GetComp();
}
FC_CombatArealEffectTestShape& ModifyOrAddCombatArealEffectTestShape(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectTestShape));
    return local_12.GetComp();
}
const FC_CombatArealEffectTestShape& GetCombatArealEffectTestShape(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectTestShape));
    return local_12.GetComp();
}
UFUNCTION()
FC_CombatArealEffectTestShape GetCombatArealEffectTestShape_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CombatArealEffectTestShape& local_4 = ECSFunc_FC_CombatArealEffectTestShape::GetCombatArealEffectTestShape(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CombatArealEffectTestShape();
}
const FC_CombatArealEffectTestShape GetDefaultedCombatArealEffectTestShape(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CombatArealEffectTestShape __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectTestShape);
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
FC_CombatArealEffectTestShape GetDefaultedCombatArealEffectTestShape_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CombatArealEffectTestShape::GetDefaultedCombatArealEffectTestShape(Entity);
}
UFUNCTION()
bool RemoveCombatArealEffectTestShape(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectTestShape);
}
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectTestShapeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CombatArealEffectTestShape, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectTestShapeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CombatArealEffectTestShape, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectTestShapeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CombatArealEffectTestShape, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectTestShapeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CombatArealEffectTestShape, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectTestShapeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CombatArealEffectTestShape, bFixedFrame, bMustHandleAll);
}
void __MonitorCombatArealEffectTestShapeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CombatArealEffectTestShape, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatArealEffectTestShapeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CombatArealEffectTestShape, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatArealEffectTestShapeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CombatArealEffectTestShape, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CombatArealEffectFXConfig
{
UFUNCTION()
bool HasCombatArealEffectFXConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectFXConfig);
}
FC_CombatArealEffectFXConfig& AssignCombatArealEffectFXConfig(const FECSEntity &inout Entity, const FC_CombatArealEffectFXConfig &inout DefaultValue = FC_CombatArealEffectFXConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectFXConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCombatArealEffectFXConfig_BP(const FECSEntity &inout Entity, const FC_CombatArealEffectFXConfig &inout DefaultValue = FC_CombatArealEffectFXConfig())
{
    ECSFunc_FC_CombatArealEffectFXConfig::AssignCombatArealEffectFXConfig(Entity, DefaultValue);
    return;
}
FC_CombatArealEffectFXConfig& ModifyCombatArealEffectFXConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectFXConfig));
    return local_12.GetComp();
}
FC_CombatArealEffectFXConfig& ModifyOrAddCombatArealEffectFXConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectFXConfig));
    return local_12.GetComp();
}
const FC_CombatArealEffectFXConfig& GetCombatArealEffectFXConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectFXConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_CombatArealEffectFXConfig GetCombatArealEffectFXConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CombatArealEffectFXConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_CombatArealEffectFXConfig::GetCombatArealEffectFXConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CombatArealEffectFXConfig GetDefaultedCombatArealEffectFXConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CombatArealEffectFXConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectFXConfig);
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
FC_CombatArealEffectFXConfig GetDefaultedCombatArealEffectFXConfig_BP(const FECSEntity &inout Entity)
{
    FC_CombatArealEffectFXConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveCombatArealEffectFXConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectFXConfig);
}
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectFXConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CombatArealEffectFXConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectFXConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CombatArealEffectFXConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectFXConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CombatArealEffectFXConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectFXConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CombatArealEffectFXConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectFXConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CombatArealEffectFXConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorCombatArealEffectFXConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CombatArealEffectFXConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatArealEffectFXConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CombatArealEffectFXConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatArealEffectFXConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CombatArealEffectFXConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CombatArealEffectFXRuntime
{
UFUNCTION()
bool HasCombatArealEffectFXRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectFXRuntime);
}
FC_CombatArealEffectFXRuntime& AssignCombatArealEffectFXRuntime(const FECSEntity &inout Entity, const FC_CombatArealEffectFXRuntime &inout DefaultValue = FC_CombatArealEffectFXRuntime())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectFXRuntime, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCombatArealEffectFXRuntime_BP(const FECSEntity &inout Entity, const FC_CombatArealEffectFXRuntime &inout DefaultValue = FC_CombatArealEffectFXRuntime())
{
    ECSFunc_FC_CombatArealEffectFXRuntime::AssignCombatArealEffectFXRuntime(Entity, DefaultValue);
    return;
}
FC_CombatArealEffectFXRuntime& ModifyCombatArealEffectFXRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectFXRuntime));
    return local_12.GetComp();
}
FC_CombatArealEffectFXRuntime& ModifyOrAddCombatArealEffectFXRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectFXRuntime));
    return local_12.GetComp();
}
const FC_CombatArealEffectFXRuntime& GetCombatArealEffectFXRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectFXRuntime));
    return local_12.GetComp();
}
UFUNCTION()
FC_CombatArealEffectFXRuntime GetCombatArealEffectFXRuntime_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CombatArealEffectFXRuntime& local_4 = ECSFunc_FC_CombatArealEffectFXRuntime::GetCombatArealEffectFXRuntime(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CombatArealEffectFXRuntime();
}
const FC_CombatArealEffectFXRuntime GetDefaultedCombatArealEffectFXRuntime(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CombatArealEffectFXRuntime __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectFXRuntime);
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
FC_CombatArealEffectFXRuntime GetDefaultedCombatArealEffectFXRuntime_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CombatArealEffectFXRuntime::GetDefaultedCombatArealEffectFXRuntime(Entity);
}
UFUNCTION()
bool RemoveCombatArealEffectFXRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectFXRuntime);
}
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectFXRuntimeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CombatArealEffectFXRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectFXRuntimeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CombatArealEffectFXRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectFXRuntimeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CombatArealEffectFXRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectFXRuntimeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CombatArealEffectFXRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectFXRuntimeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CombatArealEffectFXRuntime, bFixedFrame, bMustHandleAll);
}
void __MonitorCombatArealEffectFXRuntimeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CombatArealEffectFXRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatArealEffectFXRuntimeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CombatArealEffectFXRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatArealEffectFXRuntimeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CombatArealEffectFXRuntime, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CombatArealEffectBuffConfig
{
UFUNCTION()
bool HasCombatArealEffectBuffConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectBuffConfig);
}
FC_CombatArealEffectBuffConfig& AssignCombatArealEffectBuffConfig(const FECSEntity &inout Entity, const FC_CombatArealEffectBuffConfig &inout DefaultValue = FC_CombatArealEffectBuffConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectBuffConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCombatArealEffectBuffConfig_BP(const FECSEntity &inout Entity, const FC_CombatArealEffectBuffConfig &inout DefaultValue = FC_CombatArealEffectBuffConfig())
{
    ECSFunc_FC_CombatArealEffectBuffConfig::AssignCombatArealEffectBuffConfig(Entity, DefaultValue);
    return;
}
FC_CombatArealEffectBuffConfig& ModifyCombatArealEffectBuffConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectBuffConfig));
    return local_12.GetComp();
}
FC_CombatArealEffectBuffConfig& ModifyOrAddCombatArealEffectBuffConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectBuffConfig));
    return local_12.GetComp();
}
const FC_CombatArealEffectBuffConfig& GetCombatArealEffectBuffConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectBuffConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_CombatArealEffectBuffConfig GetCombatArealEffectBuffConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CombatArealEffectBuffConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_CombatArealEffectBuffConfig::GetCombatArealEffectBuffConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CombatArealEffectBuffConfig GetDefaultedCombatArealEffectBuffConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CombatArealEffectBuffConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectBuffConfig);
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
FC_CombatArealEffectBuffConfig GetDefaultedCombatArealEffectBuffConfig_BP(const FECSEntity &inout Entity)
{
    FC_CombatArealEffectBuffConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveCombatArealEffectBuffConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectBuffConfig);
}
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectBuffConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CombatArealEffectBuffConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectBuffConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CombatArealEffectBuffConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectBuffConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CombatArealEffectBuffConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectBuffConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CombatArealEffectBuffConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectBuffConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CombatArealEffectBuffConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorCombatArealEffectBuffConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CombatArealEffectBuffConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatArealEffectBuffConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CombatArealEffectBuffConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatArealEffectBuffConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CombatArealEffectBuffConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CombatArealEffectBuffOverride
{
UFUNCTION()
bool HasCombatArealEffectBuffOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectBuffOverride);
}
FC_CombatArealEffectBuffOverride& AssignCombatArealEffectBuffOverride(const FECSEntity &inout Entity, const FC_CombatArealEffectBuffOverride &inout DefaultValue = FC_CombatArealEffectBuffOverride())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectBuffOverride, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCombatArealEffectBuffOverride_BP(const FECSEntity &inout Entity, const FC_CombatArealEffectBuffOverride &inout DefaultValue = FC_CombatArealEffectBuffOverride())
{
    ECSFunc_FC_CombatArealEffectBuffOverride::AssignCombatArealEffectBuffOverride(Entity, DefaultValue);
    return;
}
FC_CombatArealEffectBuffOverride& ModifyCombatArealEffectBuffOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectBuffOverride));
    return local_12.GetComp();
}
FC_CombatArealEffectBuffOverride& ModifyOrAddCombatArealEffectBuffOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectBuffOverride));
    return local_12.GetComp();
}
const FC_CombatArealEffectBuffOverride& GetCombatArealEffectBuffOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectBuffOverride));
    return local_12.GetComp();
}
UFUNCTION()
FC_CombatArealEffectBuffOverride GetCombatArealEffectBuffOverride_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CombatArealEffectBuffOverride& local_4 = ECSFunc_FC_CombatArealEffectBuffOverride::GetCombatArealEffectBuffOverride(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CombatArealEffectBuffOverride();
}
const FC_CombatArealEffectBuffOverride GetDefaultedCombatArealEffectBuffOverride(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CombatArealEffectBuffOverride __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectBuffOverride);
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
FC_CombatArealEffectBuffOverride GetDefaultedCombatArealEffectBuffOverride_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CombatArealEffectBuffOverride::GetDefaultedCombatArealEffectBuffOverride(Entity);
}
UFUNCTION()
bool RemoveCombatArealEffectBuffOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectBuffOverride);
}
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectBuffOverrideOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CombatArealEffectBuffOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectBuffOverrideOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CombatArealEffectBuffOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectBuffOverrideOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CombatArealEffectBuffOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectBuffOverrideOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CombatArealEffectBuffOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectBuffOverrideOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CombatArealEffectBuffOverride, bFixedFrame, bMustHandleAll);
}
void __MonitorCombatArealEffectBuffOverrideLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CombatArealEffectBuffOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatArealEffectBuffOverrideActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CombatArealEffectBuffOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatArealEffectBuffOverrideModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CombatArealEffectBuffOverride, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CombatArealEffectBuffAddedData
{
UFUNCTION()
bool HasCombatArealEffectBuffAddedData(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectBuffAddedData);
}
FC_CombatArealEffectBuffAddedData& AssignCombatArealEffectBuffAddedData(const FECSEntity &inout Entity, const FC_CombatArealEffectBuffAddedData &inout DefaultValue = FC_CombatArealEffectBuffAddedData())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectBuffAddedData, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCombatArealEffectBuffAddedData_BP(const FECSEntity &inout Entity, const FC_CombatArealEffectBuffAddedData &inout DefaultValue = FC_CombatArealEffectBuffAddedData())
{
    ECSFunc_FC_CombatArealEffectBuffAddedData::AssignCombatArealEffectBuffAddedData(Entity, DefaultValue);
    return;
}
FC_CombatArealEffectBuffAddedData& ModifyCombatArealEffectBuffAddedData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectBuffAddedData));
    return local_12.GetComp();
}
FC_CombatArealEffectBuffAddedData& ModifyOrAddCombatArealEffectBuffAddedData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectBuffAddedData));
    return local_12.GetComp();
}
const FC_CombatArealEffectBuffAddedData& GetCombatArealEffectBuffAddedData(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectBuffAddedData));
    return local_12.GetComp();
}
UFUNCTION()
FC_CombatArealEffectBuffAddedData GetCombatArealEffectBuffAddedData_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CombatArealEffectBuffAddedData& local_4 = ECSFunc_FC_CombatArealEffectBuffAddedData::GetCombatArealEffectBuffAddedData(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CombatArealEffectBuffAddedData();
}
const FC_CombatArealEffectBuffAddedData GetDefaultedCombatArealEffectBuffAddedData(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CombatArealEffectBuffAddedData __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectBuffAddedData);
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
FC_CombatArealEffectBuffAddedData GetDefaultedCombatArealEffectBuffAddedData_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CombatArealEffectBuffAddedData::GetDefaultedCombatArealEffectBuffAddedData(Entity);
}
UFUNCTION()
bool RemoveCombatArealEffectBuffAddedData(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectBuffAddedData);
}
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectBuffAddedDataOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CombatArealEffectBuffAddedData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectBuffAddedDataOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CombatArealEffectBuffAddedData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectBuffAddedDataOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CombatArealEffectBuffAddedData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectBuffAddedDataOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CombatArealEffectBuffAddedData, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectBuffAddedDataOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CombatArealEffectBuffAddedData, bFixedFrame, bMustHandleAll);
}
void __MonitorCombatArealEffectBuffAddedDataLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CombatArealEffectBuffAddedData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatArealEffectBuffAddedDataActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CombatArealEffectBuffAddedData, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatArealEffectBuffAddedDataModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CombatArealEffectBuffAddedData, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CombatArealEffectAbilityEffectTriggerConfig
{
UFUNCTION()
bool HasCombatArealEffectAbilityEffectTriggerConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectAbilityEffectTriggerConfig);
}
FC_CombatArealEffectAbilityEffectTriggerConfig& AssignCombatArealEffectAbilityEffectTriggerConfig(const FECSEntity &inout Entity, const FC_CombatArealEffectAbilityEffectTriggerConfig &inout DefaultValue = FC_CombatArealEffectAbilityEffectTriggerConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectAbilityEffectTriggerConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCombatArealEffectAbilityEffectTriggerConfig_BP(const FECSEntity &inout Entity, const FC_CombatArealEffectAbilityEffectTriggerConfig &inout DefaultValue = FC_CombatArealEffectAbilityEffectTriggerConfig())
{
    ECSFunc_FC_CombatArealEffectAbilityEffectTriggerConfig::AssignCombatArealEffectAbilityEffectTriggerConfig(Entity, DefaultValue);
    return;
}
FC_CombatArealEffectAbilityEffectTriggerConfig& ModifyCombatArealEffectAbilityEffectTriggerConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectAbilityEffectTriggerConfig));
    return local_12.GetComp();
}
FC_CombatArealEffectAbilityEffectTriggerConfig& ModifyOrAddCombatArealEffectAbilityEffectTriggerConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectAbilityEffectTriggerConfig));
    return local_12.GetComp();
}
const FC_CombatArealEffectAbilityEffectTriggerConfig& GetCombatArealEffectAbilityEffectTriggerConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectAbilityEffectTriggerConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_CombatArealEffectAbilityEffectTriggerConfig GetCombatArealEffectAbilityEffectTriggerConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CombatArealEffectAbilityEffectTriggerConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_CombatArealEffectAbilityEffectTriggerConfig::GetCombatArealEffectAbilityEffectTriggerConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CombatArealEffectAbilityEffectTriggerConfig GetDefaultedCombatArealEffectAbilityEffectTriggerConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CombatArealEffectAbilityEffectTriggerConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectAbilityEffectTriggerConfig);
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
FC_CombatArealEffectAbilityEffectTriggerConfig GetDefaultedCombatArealEffectAbilityEffectTriggerConfig_BP(const FECSEntity &inout Entity)
{
    FC_CombatArealEffectAbilityEffectTriggerConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveCombatArealEffectAbilityEffectTriggerConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectAbilityEffectTriggerConfig);
}
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectAbilityEffectTriggerConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CombatArealEffectAbilityEffectTriggerConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectAbilityEffectTriggerConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CombatArealEffectAbilityEffectTriggerConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectAbilityEffectTriggerConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CombatArealEffectAbilityEffectTriggerConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectAbilityEffectTriggerConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CombatArealEffectAbilityEffectTriggerConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectAbilityEffectTriggerConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CombatArealEffectAbilityEffectTriggerConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorCombatArealEffectAbilityEffectTriggerConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CombatArealEffectAbilityEffectTriggerConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatArealEffectAbilityEffectTriggerConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CombatArealEffectAbilityEffectTriggerConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatArealEffectAbilityEffectTriggerConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CombatArealEffectAbilityEffectTriggerConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CombatArealEffectAbilityEffectTriggerOverride
{
UFUNCTION()
bool HasCombatArealEffectAbilityEffectTriggerOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectAbilityEffectTriggerOverride);
}
FC_CombatArealEffectAbilityEffectTriggerOverride& AssignCombatArealEffectAbilityEffectTriggerOverride(const FECSEntity &inout Entity, const FC_CombatArealEffectAbilityEffectTriggerOverride &inout DefaultValue = FC_CombatArealEffectAbilityEffectTriggerOverride())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectAbilityEffectTriggerOverride, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCombatArealEffectAbilityEffectTriggerOverride_BP(const FECSEntity &inout Entity, const FC_CombatArealEffectAbilityEffectTriggerOverride &inout DefaultValue = FC_CombatArealEffectAbilityEffectTriggerOverride())
{
    ECSFunc_FC_CombatArealEffectAbilityEffectTriggerOverride::AssignCombatArealEffectAbilityEffectTriggerOverride(Entity, DefaultValue);
    return;
}
FC_CombatArealEffectAbilityEffectTriggerOverride& ModifyCombatArealEffectAbilityEffectTriggerOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectAbilityEffectTriggerOverride));
    return local_12.GetComp();
}
FC_CombatArealEffectAbilityEffectTriggerOverride& ModifyOrAddCombatArealEffectAbilityEffectTriggerOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectAbilityEffectTriggerOverride));
    return local_12.GetComp();
}
const FC_CombatArealEffectAbilityEffectTriggerOverride& GetCombatArealEffectAbilityEffectTriggerOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectAbilityEffectTriggerOverride));
    return local_12.GetComp();
}
UFUNCTION()
FC_CombatArealEffectAbilityEffectTriggerOverride GetCombatArealEffectAbilityEffectTriggerOverride_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CombatArealEffectAbilityEffectTriggerOverride& local_4 = ECSFunc_FC_CombatArealEffectAbilityEffectTriggerOverride::GetCombatArealEffectAbilityEffectTriggerOverride(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CombatArealEffectAbilityEffectTriggerOverride();
}
const FC_CombatArealEffectAbilityEffectTriggerOverride GetDefaultedCombatArealEffectAbilityEffectTriggerOverride(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CombatArealEffectAbilityEffectTriggerOverride __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectAbilityEffectTriggerOverride);
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
FC_CombatArealEffectAbilityEffectTriggerOverride GetDefaultedCombatArealEffectAbilityEffectTriggerOverride_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CombatArealEffectAbilityEffectTriggerOverride::GetDefaultedCombatArealEffectAbilityEffectTriggerOverride(Entity);
}
UFUNCTION()
bool RemoveCombatArealEffectAbilityEffectTriggerOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectAbilityEffectTriggerOverride);
}
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectAbilityEffectTriggerOverrideOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CombatArealEffectAbilityEffectTriggerOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectAbilityEffectTriggerOverrideOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CombatArealEffectAbilityEffectTriggerOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectAbilityEffectTriggerOverrideOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CombatArealEffectAbilityEffectTriggerOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectAbilityEffectTriggerOverrideOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CombatArealEffectAbilityEffectTriggerOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectAbilityEffectTriggerOverrideOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CombatArealEffectAbilityEffectTriggerOverride, bFixedFrame, bMustHandleAll);
}
void __MonitorCombatArealEffectAbilityEffectTriggerOverrideLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CombatArealEffectAbilityEffectTriggerOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatArealEffectAbilityEffectTriggerOverrideActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CombatArealEffectAbilityEffectTriggerOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatArealEffectAbilityEffectTriggerOverrideModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CombatArealEffectAbilityEffectTriggerOverride, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CombatArealEffectHitTestConfig
{
UFUNCTION()
bool HasCombatArealEffectHitTestConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectHitTestConfig);
}
FC_CombatArealEffectHitTestConfig& AssignCombatArealEffectHitTestConfig(const FECSEntity &inout Entity, const FC_CombatArealEffectHitTestConfig &inout DefaultValue = FC_CombatArealEffectHitTestConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectHitTestConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCombatArealEffectHitTestConfig_BP(const FECSEntity &inout Entity, const FC_CombatArealEffectHitTestConfig &inout DefaultValue = FC_CombatArealEffectHitTestConfig())
{
    ECSFunc_FC_CombatArealEffectHitTestConfig::AssignCombatArealEffectHitTestConfig(Entity, DefaultValue);
    return;
}
FC_CombatArealEffectHitTestConfig& ModifyCombatArealEffectHitTestConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectHitTestConfig));
    return local_12.GetComp();
}
FC_CombatArealEffectHitTestConfig& ModifyOrAddCombatArealEffectHitTestConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectHitTestConfig));
    return local_12.GetComp();
}
const FC_CombatArealEffectHitTestConfig& GetCombatArealEffectHitTestConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectHitTestConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_CombatArealEffectHitTestConfig GetCombatArealEffectHitTestConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CombatArealEffectHitTestConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_CombatArealEffectHitTestConfig::GetCombatArealEffectHitTestConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CombatArealEffectHitTestConfig GetDefaultedCombatArealEffectHitTestConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CombatArealEffectHitTestConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectHitTestConfig);
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
FC_CombatArealEffectHitTestConfig GetDefaultedCombatArealEffectHitTestConfig_BP(const FECSEntity &inout Entity)
{
    FC_CombatArealEffectHitTestConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveCombatArealEffectHitTestConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectHitTestConfig);
}
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectHitTestConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CombatArealEffectHitTestConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectHitTestConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CombatArealEffectHitTestConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectHitTestConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CombatArealEffectHitTestConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectHitTestConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CombatArealEffectHitTestConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectHitTestConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CombatArealEffectHitTestConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorCombatArealEffectHitTestConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CombatArealEffectHitTestConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatArealEffectHitTestConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CombatArealEffectHitTestConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatArealEffectHitTestConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CombatArealEffectHitTestConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CombatArealEffectHitTestOverride
{
UFUNCTION()
bool HasCombatArealEffectHitTestOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectHitTestOverride);
}
FC_CombatArealEffectHitTestOverride& AssignCombatArealEffectHitTestOverride(const FECSEntity &inout Entity, const FC_CombatArealEffectHitTestOverride &inout DefaultValue = FC_CombatArealEffectHitTestOverride())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectHitTestOverride, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCombatArealEffectHitTestOverride_BP(const FECSEntity &inout Entity, const FC_CombatArealEffectHitTestOverride &inout DefaultValue = FC_CombatArealEffectHitTestOverride())
{
    ECSFunc_FC_CombatArealEffectHitTestOverride::AssignCombatArealEffectHitTestOverride(Entity, DefaultValue);
    return;
}
FC_CombatArealEffectHitTestOverride& ModifyCombatArealEffectHitTestOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectHitTestOverride));
    return local_12.GetComp();
}
FC_CombatArealEffectHitTestOverride& ModifyOrAddCombatArealEffectHitTestOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectHitTestOverride));
    return local_12.GetComp();
}
const FC_CombatArealEffectHitTestOverride& GetCombatArealEffectHitTestOverride(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectHitTestOverride));
    return local_12.GetComp();
}
UFUNCTION()
FC_CombatArealEffectHitTestOverride GetCombatArealEffectHitTestOverride_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CombatArealEffectHitTestOverride& local_4 = ECSFunc_FC_CombatArealEffectHitTestOverride::GetCombatArealEffectHitTestOverride(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CombatArealEffectHitTestOverride();
}
const FC_CombatArealEffectHitTestOverride GetDefaultedCombatArealEffectHitTestOverride(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CombatArealEffectHitTestOverride __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectHitTestOverride);
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
FC_CombatArealEffectHitTestOverride GetDefaultedCombatArealEffectHitTestOverride_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CombatArealEffectHitTestOverride::GetDefaultedCombatArealEffectHitTestOverride(Entity);
}
UFUNCTION()
bool RemoveCombatArealEffectHitTestOverride(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectHitTestOverride);
}
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectHitTestOverrideOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CombatArealEffectHitTestOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectHitTestOverrideOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CombatArealEffectHitTestOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectHitTestOverrideOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CombatArealEffectHitTestOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectHitTestOverrideOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CombatArealEffectHitTestOverride, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectHitTestOverrideOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CombatArealEffectHitTestOverride, bFixedFrame, bMustHandleAll);
}
void __MonitorCombatArealEffectHitTestOverrideLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CombatArealEffectHitTestOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatArealEffectHitTestOverrideActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CombatArealEffectHitTestOverride, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatArealEffectHitTestOverrideModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CombatArealEffectHitTestOverride, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CombatArealEffectSpawnerConfig
{
UFUNCTION()
bool HasCombatArealEffectSpawnerConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectSpawnerConfig);
}
FC_CombatArealEffectSpawnerConfig& AssignCombatArealEffectSpawnerConfig(const FECSEntity &inout Entity, const FC_CombatArealEffectSpawnerConfig &inout DefaultValue = FC_CombatArealEffectSpawnerConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectSpawnerConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCombatArealEffectSpawnerConfig_BP(const FECSEntity &inout Entity, const FC_CombatArealEffectSpawnerConfig &inout DefaultValue = FC_CombatArealEffectSpawnerConfig())
{
    ECSFunc_FC_CombatArealEffectSpawnerConfig::AssignCombatArealEffectSpawnerConfig(Entity, DefaultValue);
    return;
}
FC_CombatArealEffectSpawnerConfig& ModifyCombatArealEffectSpawnerConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectSpawnerConfig));
    return local_12.GetComp();
}
FC_CombatArealEffectSpawnerConfig& ModifyOrAddCombatArealEffectSpawnerConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectSpawnerConfig));
    return local_12.GetComp();
}
const FC_CombatArealEffectSpawnerConfig& GetCombatArealEffectSpawnerConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectSpawnerConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_CombatArealEffectSpawnerConfig GetCombatArealEffectSpawnerConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_CombatArealEffectSpawnerConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_CombatArealEffectSpawnerConfig::GetCombatArealEffectSpawnerConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_CombatArealEffectSpawnerConfig GetDefaultedCombatArealEffectSpawnerConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CombatArealEffectSpawnerConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectSpawnerConfig);
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
FC_CombatArealEffectSpawnerConfig GetDefaultedCombatArealEffectSpawnerConfig_BP(const FECSEntity &inout Entity)
{
    FC_CombatArealEffectSpawnerConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveCombatArealEffectSpawnerConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectSpawnerConfig);
}
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectSpawnerConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CombatArealEffectSpawnerConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectSpawnerConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CombatArealEffectSpawnerConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectSpawnerConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CombatArealEffectSpawnerConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectSpawnerConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CombatArealEffectSpawnerConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectSpawnerConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CombatArealEffectSpawnerConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorCombatArealEffectSpawnerConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CombatArealEffectSpawnerConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatArealEffectSpawnerConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CombatArealEffectSpawnerConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatArealEffectSpawnerConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CombatArealEffectSpawnerConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CombatArealEffectSpawnerRuntime
{
UFUNCTION()
bool HasCombatArealEffectSpawnerRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectSpawnerRuntime);
}
FC_CombatArealEffectSpawnerRuntime& AssignCombatArealEffectSpawnerRuntime(const FECSEntity &inout Entity, const FC_CombatArealEffectSpawnerRuntime &inout DefaultValue = FC_CombatArealEffectSpawnerRuntime())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectSpawnerRuntime, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCombatArealEffectSpawnerRuntime_BP(const FECSEntity &inout Entity, const FC_CombatArealEffectSpawnerRuntime &inout DefaultValue = FC_CombatArealEffectSpawnerRuntime())
{
    ECSFunc_FC_CombatArealEffectSpawnerRuntime::AssignCombatArealEffectSpawnerRuntime(Entity, DefaultValue);
    return;
}
FC_CombatArealEffectSpawnerRuntime& ModifyCombatArealEffectSpawnerRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectSpawnerRuntime));
    return local_12.GetComp();
}
FC_CombatArealEffectSpawnerRuntime& ModifyOrAddCombatArealEffectSpawnerRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectSpawnerRuntime));
    return local_12.GetComp();
}
const FC_CombatArealEffectSpawnerRuntime& GetCombatArealEffectSpawnerRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectSpawnerRuntime));
    return local_12.GetComp();
}
UFUNCTION()
FC_CombatArealEffectSpawnerRuntime GetCombatArealEffectSpawnerRuntime_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CombatArealEffectSpawnerRuntime& local_4 = ECSFunc_FC_CombatArealEffectSpawnerRuntime::GetCombatArealEffectSpawnerRuntime(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CombatArealEffectSpawnerRuntime();
}
const FC_CombatArealEffectSpawnerRuntime GetDefaultedCombatArealEffectSpawnerRuntime(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CombatArealEffectSpawnerRuntime __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectSpawnerRuntime);
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
FC_CombatArealEffectSpawnerRuntime GetDefaultedCombatArealEffectSpawnerRuntime_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CombatArealEffectSpawnerRuntime::GetDefaultedCombatArealEffectSpawnerRuntime(Entity);
}
UFUNCTION()
bool RemoveCombatArealEffectSpawnerRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CombatArealEffectSpawnerRuntime);
}
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectSpawnerRuntimeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CombatArealEffectSpawnerRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectSpawnerRuntimeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CombatArealEffectSpawnerRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectSpawnerRuntimeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CombatArealEffectSpawnerRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectSpawnerRuntimeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CombatArealEffectSpawnerRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCombatArealEffectSpawnerRuntimeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CombatArealEffectSpawnerRuntime, bFixedFrame, bMustHandleAll);
}
void __MonitorCombatArealEffectSpawnerRuntimeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CombatArealEffectSpawnerRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatArealEffectSpawnerRuntimeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CombatArealEffectSpawnerRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCombatArealEffectSpawnerRuntimeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CombatArealEffectSpawnerRuntime, bFixedFrame, Details);
    return;
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_CombatArealEffectRuntime &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_CombatArealEffectRuntime &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_CombatArealEffectRuntime &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_CombatArealEffectRuntime
{
int __IndexOf_Type()
{
    return 0;
}
int __IndexOf_EntityLastEffectedTime()
{
    return 1;
}
int __IndexOf_NextCheckTime()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FC_CombatArealEffectTestShape &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FC_CombatArealEffectTestShape &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_CombatArealEffectTestShape &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_CombatArealEffectTestShape
{
int __IndexOf_Shape()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_CombatArealEffectFXRuntime &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_CombatArealEffectFXRuntime &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_CombatArealEffectFXRuntime &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_CombatArealEffectFXRuntime
{
int __IndexOf_FXEntity()
{
    return 0;
}
int __IndexOf_bActiveEmitter()
{
    return 1;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_CombatArealEffectBuffOverride &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_CombatArealEffectBuffOverride &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_CombatArealEffectBuffOverride &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_CombatArealEffectBuffOverride
{
int __IndexOf_DataObject()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_CombatArealEffectBuffAddedData &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_CombatArealEffectBuffAddedData &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_CombatArealEffectBuffAddedData &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_CombatArealEffectBuffAddedData
{
int __IndexOf_DataByOwnerEntity()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_CombatArealEffectAbilityEffectTriggerOverride &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_CombatArealEffectAbilityEffectTriggerOverride &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_CombatArealEffectAbilityEffectTriggerOverride &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_CombatArealEffectAbilityEffectTriggerOverride
{
int __IndexOf_DataObject()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_CombatArealEffectHitTestOverride &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_CombatArealEffectHitTestOverride &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_CombatArealEffectHitTestOverride &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_CombatArealEffectHitTestOverride
{
int __IndexOf_DataObject()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_CombatArealEffectSpawnerRuntime &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_CombatArealEffectSpawnerRuntime &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_CombatArealEffectSpawnerRuntime &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_CombatArealEffectSpawnerRuntime
{
int __IndexOf_bLastSpawnSuccess()
{
    return 0;
}
int __IndexOf_NextSpawnTime()
{
    return 1;
}
int __IndexOf_LastSpawnPos()
{
    return 2;
}
}
