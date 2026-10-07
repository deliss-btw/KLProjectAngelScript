
namespace __INTENRAL_FC_BeginOverlapFilterConfig_NS
{
    const TECSComponentDerivedPtr<FC_BeginOverlapFilterConfig> DerivedPtr = TECSComponentDerivedPtr<FC_BeginOverlapFilterConfig>();
    const FC_BeginOverlapFilterConfig DefaultValue = FC_BeginOverlapFilterConfig();
}
namespace __INTENRAL_FC_EventToESMTriggerFilterConfig_NS
{
    const TECSComponentDerivedPtr<FC_EventToESMTriggerFilterConfig> DerivedPtr = TECSComponentDerivedPtr<FC_EventToESMTriggerFilterConfig>();
    const FC_EventToESMTriggerFilterConfig DefaultValue = FC_EventToESMTriggerFilterConfig();
}
namespace __INTENRAL_FC_EventToESMTriggerFilterContext_NS
{
    const TECSComponentDerivedPtr<FC_EventToESMTriggerFilterContext> DerivedPtr = TECSComponentDerivedPtr<FC_EventToESMTriggerFilterContext>();
    const FC_EventToESMTriggerFilterContext DefaultValue = FC_EventToESMTriggerFilterContext();
}
namespace __INTENRAL_FC_BeginOverlapEventToESMTriggerFilterRuntime_NS
{
    const TECSComponentDerivedPtr<FC_BeginOverlapEventToESMTriggerFilterRuntime> DerivedPtr = TECSComponentDerivedPtr<FC_BeginOverlapEventToESMTriggerFilterRuntime>();
    const FC_BeginOverlapEventToESMTriggerFilterRuntime DefaultValue = FC_BeginOverlapEventToESMTriggerFilterRuntime();
}
namespace __INTENRAL_FC_CustomInteractEventToESMTriggerFilterRuntime_NS
{
    const TECSComponentDerivedPtr<FC_CustomInteractEventToESMTriggerFilterRuntime> DerivedPtr = TECSComponentDerivedPtr<FC_CustomInteractEventToESMTriggerFilterRuntime>();
    const FC_CustomInteractEventToESMTriggerFilterRuntime DefaultValue = FC_CustomInteractEventToESMTriggerFilterRuntime();
}
namespace __INTENRAL_FC_OnTakeDamageEventToESMTriggerFilterRuntime_NS
{
    const TECSComponentDerivedPtr<FC_OnTakeDamageEventToESMTriggerFilterRuntime> DerivedPtr = TECSComponentDerivedPtr<FC_OnTakeDamageEventToESMTriggerFilterRuntime>();
    const FC_OnTakeDamageEventToESMTriggerFilterRuntime DefaultValue = FC_OnTakeDamageEventToESMTriggerFilterRuntime();
}
namespace __INTENRAL_FC_OnBeingHitEventToESMTriggerFilterRuntime_NS
{
    const TECSComponentDerivedPtr<FC_OnBeingHitEventToESMTriggerFilterRuntime> DerivedPtr = TECSComponentDerivedPtr<FC_OnBeingHitEventToESMTriggerFilterRuntime>();
    const FC_OnBeingHitEventToESMTriggerFilterRuntime DefaultValue = FC_OnBeingHitEventToESMTriggerFilterRuntime();
}
namespace __INTENRAL_FC_GlobalLevelEventToESMTriggerFilterRuntime_NS
{
    const TECSComponentDerivedPtr<FC_GlobalLevelEventToESMTriggerFilterRuntime> DerivedPtr = TECSComponentDerivedPtr<FC_GlobalLevelEventToESMTriggerFilterRuntime>();
    const FC_GlobalLevelEventToESMTriggerFilterRuntime DefaultValue = FC_GlobalLevelEventToESMTriggerFilterRuntime();
}
namespace __INTENRAL_FC_PropEcologyEventToESMTriggerFilterRuntime_NS
{
    const TECSComponentDerivedPtr<FC_PropEcologyEventToESMTriggerFilterRuntime> DerivedPtr = TECSComponentDerivedPtr<FC_PropEcologyEventToESMTriggerFilterRuntime>();
    const FC_PropEcologyEventToESMTriggerFilterRuntime DefaultValue = FC_PropEcologyEventToESMTriggerFilterRuntime();
}
namespace __INTENRAL_FC_PropMovementHitSceneEventToESMTriggerFilterRuntime_NS
{
    const TECSComponentDerivedPtr<FC_PropMovementHitSceneEventToESMTriggerFilterRuntime> DerivedPtr = TECSComponentDerivedPtr<FC_PropMovementHitSceneEventToESMTriggerFilterRuntime>();
    const FC_PropMovementHitSceneEventToESMTriggerFilterRuntime DefaultValue = FC_PropMovementHitSceneEventToESMTriggerFilterRuntime();
}
namespace __INTENRAL_FC_DeathEventToESMTriggerFilterRuntime_NS
{
    const TECSComponentDerivedPtr<FC_DeathEventToESMTriggerFilterRuntime> DerivedPtr = TECSComponentDerivedPtr<FC_DeathEventToESMTriggerFilterRuntime>();
    const FC_DeathEventToESMTriggerFilterRuntime DefaultValue = FC_DeathEventToESMTriggerFilterRuntime();
}
namespace __INTENRAL_FC_MovementEndEventToESMTriggerFilterRuntime_NS
{
    const TECSComponentDerivedPtr<FC_MovementEndEventToESMTriggerFilterRuntime> DerivedPtr = TECSComponentDerivedPtr<FC_MovementEndEventToESMTriggerFilterRuntime>();
    const FC_MovementEndEventToESMTriggerFilterRuntime DefaultValue = FC_MovementEndEventToESMTriggerFilterRuntime();
}
namespace __INTENRAL_FC_GameAttributeChangedEventToESMTriggerFilterRuntime_NS
{
    const TECSComponentDerivedPtr<FC_GameAttributeChangedEventToESMTriggerFilterRuntime> DerivedPtr = TECSComponentDerivedPtr<FC_GameAttributeChangedEventToESMTriggerFilterRuntime>();
    const FC_GameAttributeChangedEventToESMTriggerFilterRuntime DefaultValue = FC_GameAttributeChangedEventToESMTriggerFilterRuntime();

}
struct FC_BeginOverlapFilterConfig : FECSComponent
{
    UPROPERTY()
    FGameplayTag OtherMatchTag;

    FC_BeginOverlapFilterConfig()
    {
        return;
    }
}

struct FT_BeginOverlapFilterConfig : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_BeginOverlapFilterConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_BeginOverlapFilterConfig, NAME_None);
    UPROPERTY()
    FC_BeginOverlapFilterConfig Config_FC_BeginOverlapFilterConfig;

    FT_BeginOverlapFilterConfig()
    {
        return;
    }
}

struct FC_EventToESMTriggerFilterConfig : FECSComponent
{
    UPROPERTY()
    TArray<FEventToESMTriggerFilterConfigItem_BeginOverlap> BeginOverlapFilter;
    UPROPERTY()
    TArray<FEventToESMTriggerFilterConfigItem_CustomInteract> CustomInteractFilter;
    UPROPERTY()
    TArray<FEventToESMTriggerFilterConfigItem_OnTakeDamage> OnTakeDamageFilter;
    UPROPERTY()
    TArray<FEventToESMTriggerFilterConfigItem_OnBeingHit> OnBeingHitFilter;
    UPROPERTY()
    TArray<FEventToESMTriggerFilterConfigItem_GlobalLevelEvent> GlobalLevelEventFilter;
    UPROPERTY()
    TArray<FEventToESMTriggerFilterConfigItem_PropEcologyEvent> PropEcologyEventFilter;
    UPROPERTY()
    TArray<FEventToESMTriggerFilterConfigItem_PropMovementHitSceneEvent> PropMovementHitSceneEventFilter;
    UPROPERTY()
    TArray<FEventToESMTriggerFilterConfigItem_DeathEvent> DeathEventFilter;
    UPROPERTY()
    TArray<FEventToESMTriggerFilterConfigItem_MovementEnd> MovementEndEventToESMTriggerFilter;
    UPROPERTY()
    TArray<FEventToESMTriggerFilterConfigItem_GameAttributeChanged> GameAttributeChangedEventToESMTriggerFilter;

    FC_EventToESMTriggerFilterConfig()
    {
        return;
    }
    void PostPrefabLoad(const FECSEntity &inout Entity)
    {
        if (!(this.PropEcologyEventFilter.IsEmpty()))
        {
            FC_PropEcologyInitStateTag local_8;
            Assign local_6;
            local_6.opCall(local_8);
        }
        return;
    }
}

struct FC_EventToESMTriggerFilterContext : FECSComponent
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FECSEntity m_BeginOverlap_OverlappingEntity;
    UPROPERTY()
    FECSEntity m_CustomInteract_InteractSource;
    UPROPERTY()
    FName m_CustomInteract_CustomEventName;
    UPROPERTY()
    FECSEntity m_OnTakeDamage_Causer;
    UPROPERTY()
    FECSEntity m_OnTakeDamage_DirectDamageCauser;
    UPROPERTY()
    FECSEntity m_OnBeingHit_Attacker;
    UPROPERTY()
    FECSEntity m_OnBeingHit_Receiver;
    UPROPERTY()
    FECSEntity m_PropMovementHitScene_HitEntity;
    UPROPERTY()
    FVector m_PropMovementHitScene_ImpactPoint;

    FC_EventToESMTriggerFilterContext()
    {
        this.__InitDirtyFlags();
        return;
    }
    FC_EventToESMTriggerFilterContext(const FC_EventToESMTriggerFilterContext &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_BeginOverlap_OverlappingEntity = Other.m_BeginOverlap_OverlappingEntity;
        this.m_CustomInteract_InteractSource = Other.m_CustomInteract_InteractSource;
        this.m_CustomInteract_CustomEventName = Other.m_CustomInteract_CustomEventName;
        this.m_OnTakeDamage_Causer = Other.m_OnTakeDamage_Causer;
        this.m_OnTakeDamage_DirectDamageCauser = Other.m_OnTakeDamage_DirectDamageCauser;
        this.m_OnBeingHit_Attacker = Other.m_OnBeingHit_Attacker;
        this.m_OnBeingHit_Receiver = Other.m_OnBeingHit_Receiver;
        this.m_PropMovementHitScene_HitEntity = Other.m_PropMovementHitScene_HitEntity;
        this.m_PropMovementHitScene_ImpactPoint = Other.m_PropMovementHitScene_ImpactPoint;
        return;
    }
    FC_EventToESMTriggerFilterContext opAssign(const FC_EventToESMTriggerFilterContext &inout Other)
    {
        FC_EventToESMTriggerFilterContext __r;
        this.SetBeginOverlap_OverlappingEntity(Other.GetBeginOverlap_OverlappingEntity());
        this.SetCustomInteract_InteractSource(Other.GetCustomInteract_InteractSource());
        this.SetCustomInteract_CustomEventName(Other.GetCustomInteract_CustomEventName());
        this.SetOnTakeDamage_Causer(Other.GetOnTakeDamage_Causer());
        this.SetOnTakeDamage_DirectDamageCauser(Other.GetOnTakeDamage_DirectDamageCauser());
        this.SetOnBeingHit_Attacker(Other.GetOnBeingHit_Attacker());
        this.SetOnBeingHit_Receiver(Other.GetOnBeingHit_Receiver());
        this.SetPropMovementHitScene_HitEntity(Other.GetPropMovementHitScene_HitEntity());
        this.SetPropMovementHitScene_ImpactPoint(Other.GetPropMovementHitScene_ImpactPoint());
        return __r;
    }
    const FECSEntity GetBeginOverlap_OverlappingEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_BeginOverlap_OverlappingEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetBeginOverlap_OverlappingEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_BeginOverlap_OverlappingEntity = __Value;
        return;
    }
    const FECSEntity GetCustomInteract_InteractSource() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_CustomInteract_InteractSource() property
    {
        FECSEntity __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetCustomInteract_InteractSource(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_CustomInteract_InteractSource = __Value;
        return;
    }
    FName GetCustomInteract_CustomEventName() const property
    {
        return this.m_CustomInteract_CustomEventName;
    }
    void SetCustomInteract_CustomEventName(const FName &inout __Value) property
    {
        if ((this.m_CustomInteract_CustomEventName == __Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_CustomInteract_CustomEventName = __Value;
        return;
    }
    const FECSEntity GetOnTakeDamage_Causer() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_OnTakeDamage_Causer() property
    {
        FECSEntity __r;
        this.__MarkDirty(3);
        return __r;
    }
    void SetOnTakeDamage_Causer(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_OnTakeDamage_Causer = __Value;
        return;
    }
    const FECSEntity GetOnTakeDamage_DirectDamageCauser() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_OnTakeDamage_DirectDamageCauser() property
    {
        FECSEntity __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetOnTakeDamage_DirectDamageCauser(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_OnTakeDamage_DirectDamageCauser = __Value;
        return;
    }
    const FECSEntity GetOnBeingHit_Attacker() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_OnBeingHit_Attacker() property
    {
        FECSEntity __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetOnBeingHit_Attacker(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_OnBeingHit_Attacker = __Value;
        return;
    }
    const FECSEntity GetOnBeingHit_Receiver() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_OnBeingHit_Receiver() property
    {
        FECSEntity __r;
        this.__MarkDirty(6);
        return __r;
    }
    void SetOnBeingHit_Receiver(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_OnBeingHit_Receiver = __Value;
        return;
    }
    const FECSEntity GetPropMovementHitScene_HitEntity() const property
    {
        const FECSEntity __r;
        return __r;
    }
    FECSEntity GetModify_PropMovementHitScene_HitEntity() property
    {
        FECSEntity __r;
        this.__MarkDirty(7);
        return __r;
    }
    void SetPropMovementHitScene_HitEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_PropMovementHitScene_HitEntity = __Value;
        return;
    }
    const FVector GetPropMovementHitScene_ImpactPoint() const property
    {
        const FVector __r;
        return __r;
    }
    FVector GetModify_PropMovementHitScene_ImpactPoint() property
    {
        FVector __r;
        this.__MarkDirty(8);
        return __r;
    }
    void SetPropMovementHitScene_ImpactPoint(const FVector &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_PropMovementHitScene_ImpactPoint = __Value;
        return;
    }
}

struct FC_BeginOverlapEventToESMTriggerFilterRuntime : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int8 m_ActivatedIndexMask;

    FC_BeginOverlapEventToESMTriggerFilterRuntime()
    {
        this.m_ActivatedIndexMask = false;
        this.__InitDirtyFlags();
        return;
    }
    FC_BeginOverlapEventToESMTriggerFilterRuntime(const FC_BeginOverlapEventToESMTriggerFilterRuntime &inout Other)
    {
        this.m_ActivatedIndexMask = false;
        this.__InitDirtyFlags();
        this.m_ActivatedIndexMask = (int(Other.m_ActivatedIndexMask) != 0);
        return;
    }
    FC_BeginOverlapEventToESMTriggerFilterRuntime opAssign(const FC_BeginOverlapEventToESMTriggerFilterRuntime &inout Other)
    {
        FC_BeginOverlapEventToESMTriggerFilterRuntime __r;
        this.SetActivatedIndexMask(int8(Other.GetActivatedIndexMask()));
        return __r;
    }
    int8 GetActivatedIndexMask() const property
    {
        return this.m_ActivatedIndexMask;
    }
    void SetActivatedIndexMask(const int8 __Value) property
    {
        if (this.m_ActivatedIndexMask == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ActivatedIndexMask = (__Value != 0);
        return;
    }
}

struct FC_CustomInteractEventToESMTriggerFilterRuntime : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int8 m_ActivatedIndexMask;

    FC_CustomInteractEventToESMTriggerFilterRuntime()
    {
        this.m_ActivatedIndexMask = false;
        this.__InitDirtyFlags();
        return;
    }
    FC_CustomInteractEventToESMTriggerFilterRuntime(const FC_CustomInteractEventToESMTriggerFilterRuntime &inout Other)
    {
        this.m_ActivatedIndexMask = false;
        this.__InitDirtyFlags();
        this.m_ActivatedIndexMask = (int(Other.m_ActivatedIndexMask) != 0);
        return;
    }
    FC_CustomInteractEventToESMTriggerFilterRuntime opAssign(const FC_CustomInteractEventToESMTriggerFilterRuntime &inout Other)
    {
        FC_CustomInteractEventToESMTriggerFilterRuntime __r;
        this.SetActivatedIndexMask(int8(Other.GetActivatedIndexMask()));
        return __r;
    }
    int8 GetActivatedIndexMask() const property
    {
        return this.m_ActivatedIndexMask;
    }
    void SetActivatedIndexMask(const int8 __Value) property
    {
        if (this.m_ActivatedIndexMask == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ActivatedIndexMask = (__Value != 0);
        return;
    }
}

struct FC_OnTakeDamageEventToESMTriggerFilterRuntime : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int8 m_ActivatedIndexMask;

    FC_OnTakeDamageEventToESMTriggerFilterRuntime()
    {
        this.m_ActivatedIndexMask = false;
        this.__InitDirtyFlags();
        return;
    }
    FC_OnTakeDamageEventToESMTriggerFilterRuntime(const FC_OnTakeDamageEventToESMTriggerFilterRuntime &inout Other)
    {
        this.m_ActivatedIndexMask = false;
        this.__InitDirtyFlags();
        this.m_ActivatedIndexMask = (int(Other.m_ActivatedIndexMask) != 0);
        return;
    }
    FC_OnTakeDamageEventToESMTriggerFilterRuntime opAssign(const FC_OnTakeDamageEventToESMTriggerFilterRuntime &inout Other)
    {
        FC_OnTakeDamageEventToESMTriggerFilterRuntime __r;
        this.SetActivatedIndexMask(int8(Other.GetActivatedIndexMask()));
        return __r;
    }
    int8 GetActivatedIndexMask() const property
    {
        return this.m_ActivatedIndexMask;
    }
    void SetActivatedIndexMask(const int8 __Value) property
    {
        if (this.m_ActivatedIndexMask == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ActivatedIndexMask = (__Value != 0);
        return;
    }
}

struct FC_OnBeingHitEventToESMTriggerFilterRuntime : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int8 m_ActivatedIndexMask;

    FC_OnBeingHitEventToESMTriggerFilterRuntime()
    {
        this.m_ActivatedIndexMask = false;
        this.__InitDirtyFlags();
        return;
    }
    FC_OnBeingHitEventToESMTriggerFilterRuntime(const FC_OnBeingHitEventToESMTriggerFilterRuntime &inout Other)
    {
        this.m_ActivatedIndexMask = false;
        this.__InitDirtyFlags();
        this.m_ActivatedIndexMask = (int(Other.m_ActivatedIndexMask) != 0);
        return;
    }
    FC_OnBeingHitEventToESMTriggerFilterRuntime opAssign(const FC_OnBeingHitEventToESMTriggerFilterRuntime &inout Other)
    {
        FC_OnBeingHitEventToESMTriggerFilterRuntime __r;
        this.SetActivatedIndexMask(int8(Other.GetActivatedIndexMask()));
        return __r;
    }
    int8 GetActivatedIndexMask() const property
    {
        return this.m_ActivatedIndexMask;
    }
    void SetActivatedIndexMask(const int8 __Value) property
    {
        if (this.m_ActivatedIndexMask == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ActivatedIndexMask = (__Value != 0);
        return;
    }
}

struct FC_GlobalLevelEventToESMTriggerFilterRuntime : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int8 m_ActivatedIndexMask;

    FC_GlobalLevelEventToESMTriggerFilterRuntime()
    {
        this.m_ActivatedIndexMask = false;
        this.__InitDirtyFlags();
        return;
    }
    FC_GlobalLevelEventToESMTriggerFilterRuntime(const FC_GlobalLevelEventToESMTriggerFilterRuntime &inout Other)
    {
        this.m_ActivatedIndexMask = false;
        this.__InitDirtyFlags();
        this.m_ActivatedIndexMask = (int(Other.m_ActivatedIndexMask) != 0);
        return;
    }
    FC_GlobalLevelEventToESMTriggerFilterRuntime opAssign(const FC_GlobalLevelEventToESMTriggerFilterRuntime &inout Other)
    {
        FC_GlobalLevelEventToESMTriggerFilterRuntime __r;
        this.SetActivatedIndexMask(int8(Other.GetActivatedIndexMask()));
        return __r;
    }
    int8 GetActivatedIndexMask() const property
    {
        return this.m_ActivatedIndexMask;
    }
    void SetActivatedIndexMask(const int8 __Value) property
    {
        if (this.m_ActivatedIndexMask == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ActivatedIndexMask = (__Value != 0);
        return;
    }
}

struct FC_PropEcologyEventToESMTriggerFilterRuntime : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int8 m_ActivatedIndexMask;

    FC_PropEcologyEventToESMTriggerFilterRuntime()
    {
        this.m_ActivatedIndexMask = false;
        this.__InitDirtyFlags();
        return;
    }
    FC_PropEcologyEventToESMTriggerFilterRuntime(const FC_PropEcologyEventToESMTriggerFilterRuntime &inout Other)
    {
        this.m_ActivatedIndexMask = false;
        this.__InitDirtyFlags();
        this.m_ActivatedIndexMask = (int(Other.m_ActivatedIndexMask) != 0);
        return;
    }
    FC_PropEcologyEventToESMTriggerFilterRuntime opAssign(const FC_PropEcologyEventToESMTriggerFilterRuntime &inout Other)
    {
        FC_PropEcologyEventToESMTriggerFilterRuntime __r;
        this.SetActivatedIndexMask(int8(Other.GetActivatedIndexMask()));
        return __r;
    }
    int8 GetActivatedIndexMask() const property
    {
        return this.m_ActivatedIndexMask;
    }
    void SetActivatedIndexMask(const int8 __Value) property
    {
        if (this.m_ActivatedIndexMask == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ActivatedIndexMask = (__Value != 0);
        return;
    }
}

struct FC_PropMovementHitSceneEventToESMTriggerFilterRuntime : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int8 m_ActivatedIndexMask;

    FC_PropMovementHitSceneEventToESMTriggerFilterRuntime()
    {
        this.m_ActivatedIndexMask = false;
        this.__InitDirtyFlags();
        return;
    }
    FC_PropMovementHitSceneEventToESMTriggerFilterRuntime(const FC_PropMovementHitSceneEventToESMTriggerFilterRuntime &inout Other)
    {
        this.m_ActivatedIndexMask = false;
        this.__InitDirtyFlags();
        this.m_ActivatedIndexMask = (int(Other.m_ActivatedIndexMask) != 0);
        return;
    }
    FC_PropMovementHitSceneEventToESMTriggerFilterRuntime opAssign(const FC_PropMovementHitSceneEventToESMTriggerFilterRuntime &inout Other)
    {
        FC_PropMovementHitSceneEventToESMTriggerFilterRuntime __r;
        this.SetActivatedIndexMask(int8(Other.GetActivatedIndexMask()));
        return __r;
    }
    int8 GetActivatedIndexMask() const property
    {
        return this.m_ActivatedIndexMask;
    }
    void SetActivatedIndexMask(const int8 __Value) property
    {
        if (this.m_ActivatedIndexMask == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ActivatedIndexMask = (__Value != 0);
        return;
    }
}

struct FC_DeathEventToESMTriggerFilterRuntime : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int8 m_ActivatedIndexMask;

    FC_DeathEventToESMTriggerFilterRuntime()
    {
        this.m_ActivatedIndexMask = false;
        this.__InitDirtyFlags();
        return;
    }
    FC_DeathEventToESMTriggerFilterRuntime(const FC_DeathEventToESMTriggerFilterRuntime &inout Other)
    {
        this.m_ActivatedIndexMask = false;
        this.__InitDirtyFlags();
        this.m_ActivatedIndexMask = (int(Other.m_ActivatedIndexMask) != 0);
        return;
    }
    FC_DeathEventToESMTriggerFilterRuntime opAssign(const FC_DeathEventToESMTriggerFilterRuntime &inout Other)
    {
        FC_DeathEventToESMTriggerFilterRuntime __r;
        this.SetActivatedIndexMask(int8(Other.GetActivatedIndexMask()));
        return __r;
    }
    int8 GetActivatedIndexMask() const property
    {
        return this.m_ActivatedIndexMask;
    }
    void SetActivatedIndexMask(const int8 __Value) property
    {
        if (this.m_ActivatedIndexMask == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ActivatedIndexMask = (__Value != 0);
        return;
    }
}

struct FC_MovementEndEventToESMTriggerFilterRuntime : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int8 m_ActivatedIndexMask;

    FC_MovementEndEventToESMTriggerFilterRuntime()
    {
        this.m_ActivatedIndexMask = false;
        this.__InitDirtyFlags();
        return;
    }
    FC_MovementEndEventToESMTriggerFilterRuntime(const FC_MovementEndEventToESMTriggerFilterRuntime &inout Other)
    {
        this.m_ActivatedIndexMask = false;
        this.__InitDirtyFlags();
        this.m_ActivatedIndexMask = (int(Other.m_ActivatedIndexMask) != 0);
        return;
    }
    FC_MovementEndEventToESMTriggerFilterRuntime opAssign(const FC_MovementEndEventToESMTriggerFilterRuntime &inout Other)
    {
        FC_MovementEndEventToESMTriggerFilterRuntime __r;
        this.SetActivatedIndexMask(int8(Other.GetActivatedIndexMask()));
        return __r;
    }
    int8 GetActivatedIndexMask() const property
    {
        return this.m_ActivatedIndexMask;
    }
    void SetActivatedIndexMask(const int8 __Value) property
    {
        if (this.m_ActivatedIndexMask == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ActivatedIndexMask = (__Value != 0);
        return;
    }
}

struct FC_GameAttributeChangedEventToESMTriggerFilterRuntime : FECSComponent
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int8 m_ActivatedIndexMask;

    FC_GameAttributeChangedEventToESMTriggerFilterRuntime()
    {
        this.m_ActivatedIndexMask = false;
        this.__InitDirtyFlags();
        return;
    }
    FC_GameAttributeChangedEventToESMTriggerFilterRuntime(const FC_GameAttributeChangedEventToESMTriggerFilterRuntime &inout Other)
    {
        this.m_ActivatedIndexMask = false;
        this.__InitDirtyFlags();
        this.m_ActivatedIndexMask = (int(Other.m_ActivatedIndexMask) != 0);
        return;
    }
    FC_GameAttributeChangedEventToESMTriggerFilterRuntime opAssign(const FC_GameAttributeChangedEventToESMTriggerFilterRuntime &inout Other)
    {
        FC_GameAttributeChangedEventToESMTriggerFilterRuntime __r;
        this.SetActivatedIndexMask(int8(Other.GetActivatedIndexMask()));
        return __r;
    }
    int8 GetActivatedIndexMask() const property
    {
        return this.m_ActivatedIndexMask;
    }
    void SetActivatedIndexMask(const int8 __Value) property
    {
        if (this.m_ActivatedIndexMask == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_ActivatedIndexMask = (__Value != 0);
        return;
    }
}

namespace ECSFunc_FC_BeginOverlapFilterConfig
{
UFUNCTION()
bool HasBeginOverlapFilterConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_BeginOverlapFilterConfig);
}
FC_BeginOverlapFilterConfig& AssignBeginOverlapFilterConfig(const FECSEntity &inout Entity, const FC_BeginOverlapFilterConfig &inout DefaultValue = FC_BeginOverlapFilterConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_BeginOverlapFilterConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignBeginOverlapFilterConfig_BP(const FECSEntity &inout Entity, const FC_BeginOverlapFilterConfig &inout DefaultValue = FC_BeginOverlapFilterConfig())
{
    ECSFunc_FC_BeginOverlapFilterConfig::AssignBeginOverlapFilterConfig(Entity, DefaultValue);
    return;
}
FC_BeginOverlapFilterConfig& ModifyBeginOverlapFilterConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_BeginOverlapFilterConfig));
    return local_12.GetComp();
}
FC_BeginOverlapFilterConfig& ModifyOrAddBeginOverlapFilterConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_BeginOverlapFilterConfig));
    return local_12.GetComp();
}
const FC_BeginOverlapFilterConfig& GetBeginOverlapFilterConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_BeginOverlapFilterConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_BeginOverlapFilterConfig GetBeginOverlapFilterConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_BeginOverlapFilterConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_BeginOverlapFilterConfig::GetBeginOverlapFilterConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_BeginOverlapFilterConfig GetDefaultedBeginOverlapFilterConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_BeginOverlapFilterConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_BeginOverlapFilterConfig);
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
FC_BeginOverlapFilterConfig GetDefaultedBeginOverlapFilterConfig_BP(const FECSEntity &inout Entity)
{
    FC_BeginOverlapFilterConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveBeginOverlapFilterConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_BeginOverlapFilterConfig);
}
}
FECSMonitorRuntimeView __GetMonitorBeginOverlapFilterConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_BeginOverlapFilterConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeginOverlapFilterConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_BeginOverlapFilterConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeginOverlapFilterConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_BeginOverlapFilterConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeginOverlapFilterConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_BeginOverlapFilterConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeginOverlapFilterConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_BeginOverlapFilterConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorBeginOverlapFilterConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_BeginOverlapFilterConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBeginOverlapFilterConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_BeginOverlapFilterConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBeginOverlapFilterConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_BeginOverlapFilterConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EventToESMTriggerFilterConfig
{
UFUNCTION()
bool HasEventToESMTriggerFilterConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EventToESMTriggerFilterConfig);
}
FC_EventToESMTriggerFilterConfig& AssignEventToESMTriggerFilterConfig(const FECSEntity &inout Entity, const FC_EventToESMTriggerFilterConfig &inout DefaultValue = FC_EventToESMTriggerFilterConfig())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EventToESMTriggerFilterConfig, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEventToESMTriggerFilterConfig_BP(const FECSEntity &inout Entity, const FC_EventToESMTriggerFilterConfig &inout DefaultValue = FC_EventToESMTriggerFilterConfig())
{
    ECSFunc_FC_EventToESMTriggerFilterConfig::AssignEventToESMTriggerFilterConfig(Entity, DefaultValue);
    return;
}
FC_EventToESMTriggerFilterConfig& ModifyEventToESMTriggerFilterConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EventToESMTriggerFilterConfig));
    return local_12.GetComp();
}
FC_EventToESMTriggerFilterConfig& ModifyOrAddEventToESMTriggerFilterConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EventToESMTriggerFilterConfig));
    return local_12.GetComp();
}
const FC_EventToESMTriggerFilterConfig& GetEventToESMTriggerFilterConfig(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EventToESMTriggerFilterConfig));
    return local_12.GetComp();
}
UFUNCTION()
FC_EventToESMTriggerFilterConfig GetEventToESMTriggerFilterConfig_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    FC_EventToESMTriggerFilterConfig __r;
    bValid = false;
    bValid = ECSFunc_FC_EventToESMTriggerFilterConfig::GetEventToESMTriggerFilterConfig(Entity);
    if (bValid)
    {
    }
    else
    {
    }
    return __r;
}
const FC_EventToESMTriggerFilterConfig GetDefaultedEventToESMTriggerFilterConfig(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EventToESMTriggerFilterConfig __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EventToESMTriggerFilterConfig);
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
FC_EventToESMTriggerFilterConfig GetDefaultedEventToESMTriggerFilterConfig_BP(const FECSEntity &inout Entity)
{
    FC_EventToESMTriggerFilterConfig __r;
    return __r;
}
UFUNCTION()
bool RemoveEventToESMTriggerFilterConfig(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EventToESMTriggerFilterConfig);
}
}
FECSMonitorRuntimeView __GetMonitorEventToESMTriggerFilterConfigOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EventToESMTriggerFilterConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEventToESMTriggerFilterConfigOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EventToESMTriggerFilterConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEventToESMTriggerFilterConfigOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EventToESMTriggerFilterConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEventToESMTriggerFilterConfigOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EventToESMTriggerFilterConfig, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEventToESMTriggerFilterConfigOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EventToESMTriggerFilterConfig, bFixedFrame, bMustHandleAll);
}
void __MonitorEventToESMTriggerFilterConfigLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EventToESMTriggerFilterConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEventToESMTriggerFilterConfigActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EventToESMTriggerFilterConfig, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEventToESMTriggerFilterConfigModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EventToESMTriggerFilterConfig, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_EventToESMTriggerFilterContext
{
UFUNCTION()
bool HasEventToESMTriggerFilterContext(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_EventToESMTriggerFilterContext);
}
FC_EventToESMTriggerFilterContext& AssignEventToESMTriggerFilterContext(const FECSEntity &inout Entity, const FC_EventToESMTriggerFilterContext &inout DefaultValue = FC_EventToESMTriggerFilterContext())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_EventToESMTriggerFilterContext, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignEventToESMTriggerFilterContext_BP(const FECSEntity &inout Entity, const FC_EventToESMTriggerFilterContext &inout DefaultValue = FC_EventToESMTriggerFilterContext())
{
    ECSFunc_FC_EventToESMTriggerFilterContext::AssignEventToESMTriggerFilterContext(Entity, DefaultValue);
    return;
}
FC_EventToESMTriggerFilterContext& ModifyEventToESMTriggerFilterContext(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_EventToESMTriggerFilterContext));
    return local_12.GetComp();
}
FC_EventToESMTriggerFilterContext& ModifyOrAddEventToESMTriggerFilterContext(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_EventToESMTriggerFilterContext));
    return local_12.GetComp();
}
const FC_EventToESMTriggerFilterContext& GetEventToESMTriggerFilterContext(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_EventToESMTriggerFilterContext));
    return local_12.GetComp();
}
UFUNCTION()
FC_EventToESMTriggerFilterContext GetEventToESMTriggerFilterContext_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_EventToESMTriggerFilterContext& local_4 = ECSFunc_FC_EventToESMTriggerFilterContext::GetEventToESMTriggerFilterContext(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_EventToESMTriggerFilterContext();
}
const FC_EventToESMTriggerFilterContext GetDefaultedEventToESMTriggerFilterContext(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_EventToESMTriggerFilterContext __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_EventToESMTriggerFilterContext);
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
FC_EventToESMTriggerFilterContext GetDefaultedEventToESMTriggerFilterContext_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_EventToESMTriggerFilterContext::GetDefaultedEventToESMTriggerFilterContext(Entity);
}
UFUNCTION()
bool RemoveEventToESMTriggerFilterContext(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_EventToESMTriggerFilterContext);
}
}
FECSMonitorRuntimeView __GetMonitorEventToESMTriggerFilterContextOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_EventToESMTriggerFilterContext, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEventToESMTriggerFilterContextOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_EventToESMTriggerFilterContext, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEventToESMTriggerFilterContextOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_EventToESMTriggerFilterContext, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEventToESMTriggerFilterContextOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_EventToESMTriggerFilterContext, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorEventToESMTriggerFilterContextOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_EventToESMTriggerFilterContext, bFixedFrame, bMustHandleAll);
}
void __MonitorEventToESMTriggerFilterContextLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_EventToESMTriggerFilterContext, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEventToESMTriggerFilterContextActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_EventToESMTriggerFilterContext, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorEventToESMTriggerFilterContextModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_EventToESMTriggerFilterContext, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_BeginOverlapEventToESMTriggerFilterRuntime
{
UFUNCTION()
bool HasBeginOverlapEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_BeginOverlapEventToESMTriggerFilterRuntime);
}
FC_BeginOverlapEventToESMTriggerFilterRuntime& AssignBeginOverlapEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity, const FC_BeginOverlapEventToESMTriggerFilterRuntime &inout DefaultValue = FC_BeginOverlapEventToESMTriggerFilterRuntime())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_BeginOverlapEventToESMTriggerFilterRuntime, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignBeginOverlapEventToESMTriggerFilterRuntime_BP(const FECSEntity &inout Entity, const FC_BeginOverlapEventToESMTriggerFilterRuntime &inout DefaultValue = FC_BeginOverlapEventToESMTriggerFilterRuntime())
{
    ECSFunc_FC_BeginOverlapEventToESMTriggerFilterRuntime::AssignBeginOverlapEventToESMTriggerFilterRuntime(Entity, DefaultValue);
    return;
}
FC_BeginOverlapEventToESMTriggerFilterRuntime& ModifyBeginOverlapEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_BeginOverlapEventToESMTriggerFilterRuntime));
    return local_12.GetComp();
}
FC_BeginOverlapEventToESMTriggerFilterRuntime& ModifyOrAddBeginOverlapEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_BeginOverlapEventToESMTriggerFilterRuntime));
    return local_12.GetComp();
}
const FC_BeginOverlapEventToESMTriggerFilterRuntime& GetBeginOverlapEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_BeginOverlapEventToESMTriggerFilterRuntime));
    return local_12.GetComp();
}
UFUNCTION()
FC_BeginOverlapEventToESMTriggerFilterRuntime GetBeginOverlapEventToESMTriggerFilterRuntime_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_BeginOverlapEventToESMTriggerFilterRuntime& local_4 = ECSFunc_FC_BeginOverlapEventToESMTriggerFilterRuntime::GetBeginOverlapEventToESMTriggerFilterRuntime(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_BeginOverlapEventToESMTriggerFilterRuntime();
}
const FC_BeginOverlapEventToESMTriggerFilterRuntime GetDefaultedBeginOverlapEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_BeginOverlapEventToESMTriggerFilterRuntime __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_BeginOverlapEventToESMTriggerFilterRuntime);
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
FC_BeginOverlapEventToESMTriggerFilterRuntime GetDefaultedBeginOverlapEventToESMTriggerFilterRuntime_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_BeginOverlapEventToESMTriggerFilterRuntime::GetDefaultedBeginOverlapEventToESMTriggerFilterRuntime(Entity);
}
UFUNCTION()
bool RemoveBeginOverlapEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_BeginOverlapEventToESMTriggerFilterRuntime);
}
}
FECSMonitorRuntimeView __GetMonitorBeginOverlapEventToESMTriggerFilterRuntimeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_BeginOverlapEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeginOverlapEventToESMTriggerFilterRuntimeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_BeginOverlapEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeginOverlapEventToESMTriggerFilterRuntimeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_BeginOverlapEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeginOverlapEventToESMTriggerFilterRuntimeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_BeginOverlapEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorBeginOverlapEventToESMTriggerFilterRuntimeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_BeginOverlapEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
void __MonitorBeginOverlapEventToESMTriggerFilterRuntimeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_BeginOverlapEventToESMTriggerFilterRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBeginOverlapEventToESMTriggerFilterRuntimeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_BeginOverlapEventToESMTriggerFilterRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorBeginOverlapEventToESMTriggerFilterRuntimeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_BeginOverlapEventToESMTriggerFilterRuntime, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_CustomInteractEventToESMTriggerFilterRuntime
{
UFUNCTION()
bool HasCustomInteractEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_CustomInteractEventToESMTriggerFilterRuntime);
}
FC_CustomInteractEventToESMTriggerFilterRuntime& AssignCustomInteractEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity, const FC_CustomInteractEventToESMTriggerFilterRuntime &inout DefaultValue = FC_CustomInteractEventToESMTriggerFilterRuntime())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_CustomInteractEventToESMTriggerFilterRuntime, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignCustomInteractEventToESMTriggerFilterRuntime_BP(const FECSEntity &inout Entity, const FC_CustomInteractEventToESMTriggerFilterRuntime &inout DefaultValue = FC_CustomInteractEventToESMTriggerFilterRuntime())
{
    ECSFunc_FC_CustomInteractEventToESMTriggerFilterRuntime::AssignCustomInteractEventToESMTriggerFilterRuntime(Entity, DefaultValue);
    return;
}
FC_CustomInteractEventToESMTriggerFilterRuntime& ModifyCustomInteractEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_CustomInteractEventToESMTriggerFilterRuntime));
    return local_12.GetComp();
}
FC_CustomInteractEventToESMTriggerFilterRuntime& ModifyOrAddCustomInteractEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_CustomInteractEventToESMTriggerFilterRuntime));
    return local_12.GetComp();
}
const FC_CustomInteractEventToESMTriggerFilterRuntime& GetCustomInteractEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_CustomInteractEventToESMTriggerFilterRuntime));
    return local_12.GetComp();
}
UFUNCTION()
FC_CustomInteractEventToESMTriggerFilterRuntime GetCustomInteractEventToESMTriggerFilterRuntime_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_CustomInteractEventToESMTriggerFilterRuntime& local_4 = ECSFunc_FC_CustomInteractEventToESMTriggerFilterRuntime::GetCustomInteractEventToESMTriggerFilterRuntime(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_CustomInteractEventToESMTriggerFilterRuntime();
}
const FC_CustomInteractEventToESMTriggerFilterRuntime GetDefaultedCustomInteractEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_CustomInteractEventToESMTriggerFilterRuntime __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_CustomInteractEventToESMTriggerFilterRuntime);
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
FC_CustomInteractEventToESMTriggerFilterRuntime GetDefaultedCustomInteractEventToESMTriggerFilterRuntime_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_CustomInteractEventToESMTriggerFilterRuntime::GetDefaultedCustomInteractEventToESMTriggerFilterRuntime(Entity);
}
UFUNCTION()
bool RemoveCustomInteractEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_CustomInteractEventToESMTriggerFilterRuntime);
}
}
FECSMonitorRuntimeView __GetMonitorCustomInteractEventToESMTriggerFilterRuntimeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_CustomInteractEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCustomInteractEventToESMTriggerFilterRuntimeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_CustomInteractEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCustomInteractEventToESMTriggerFilterRuntimeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_CustomInteractEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCustomInteractEventToESMTriggerFilterRuntimeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_CustomInteractEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorCustomInteractEventToESMTriggerFilterRuntimeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_CustomInteractEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
void __MonitorCustomInteractEventToESMTriggerFilterRuntimeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_CustomInteractEventToESMTriggerFilterRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCustomInteractEventToESMTriggerFilterRuntimeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_CustomInteractEventToESMTriggerFilterRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorCustomInteractEventToESMTriggerFilterRuntimeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_CustomInteractEventToESMTriggerFilterRuntime, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_OnTakeDamageEventToESMTriggerFilterRuntime
{
UFUNCTION()
bool HasOnTakeDamageEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_OnTakeDamageEventToESMTriggerFilterRuntime);
}
FC_OnTakeDamageEventToESMTriggerFilterRuntime& AssignOnTakeDamageEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity, const FC_OnTakeDamageEventToESMTriggerFilterRuntime &inout DefaultValue = FC_OnTakeDamageEventToESMTriggerFilterRuntime())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_OnTakeDamageEventToESMTriggerFilterRuntime, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignOnTakeDamageEventToESMTriggerFilterRuntime_BP(const FECSEntity &inout Entity, const FC_OnTakeDamageEventToESMTriggerFilterRuntime &inout DefaultValue = FC_OnTakeDamageEventToESMTriggerFilterRuntime())
{
    ECSFunc_FC_OnTakeDamageEventToESMTriggerFilterRuntime::AssignOnTakeDamageEventToESMTriggerFilterRuntime(Entity, DefaultValue);
    return;
}
FC_OnTakeDamageEventToESMTriggerFilterRuntime& ModifyOnTakeDamageEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_OnTakeDamageEventToESMTriggerFilterRuntime));
    return local_12.GetComp();
}
FC_OnTakeDamageEventToESMTriggerFilterRuntime& ModifyOrAddOnTakeDamageEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_OnTakeDamageEventToESMTriggerFilterRuntime));
    return local_12.GetComp();
}
const FC_OnTakeDamageEventToESMTriggerFilterRuntime& GetOnTakeDamageEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_OnTakeDamageEventToESMTriggerFilterRuntime));
    return local_12.GetComp();
}
UFUNCTION()
FC_OnTakeDamageEventToESMTriggerFilterRuntime GetOnTakeDamageEventToESMTriggerFilterRuntime_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_OnTakeDamageEventToESMTriggerFilterRuntime& local_4 = ECSFunc_FC_OnTakeDamageEventToESMTriggerFilterRuntime::GetOnTakeDamageEventToESMTriggerFilterRuntime(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_OnTakeDamageEventToESMTriggerFilterRuntime();
}
const FC_OnTakeDamageEventToESMTriggerFilterRuntime GetDefaultedOnTakeDamageEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_OnTakeDamageEventToESMTriggerFilterRuntime __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_OnTakeDamageEventToESMTriggerFilterRuntime);
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
FC_OnTakeDamageEventToESMTriggerFilterRuntime GetDefaultedOnTakeDamageEventToESMTriggerFilterRuntime_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_OnTakeDamageEventToESMTriggerFilterRuntime::GetDefaultedOnTakeDamageEventToESMTriggerFilterRuntime(Entity);
}
UFUNCTION()
bool RemoveOnTakeDamageEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_OnTakeDamageEventToESMTriggerFilterRuntime);
}
}
FECSMonitorRuntimeView __GetMonitorOnTakeDamageEventToESMTriggerFilterRuntimeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_OnTakeDamageEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOnTakeDamageEventToESMTriggerFilterRuntimeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_OnTakeDamageEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOnTakeDamageEventToESMTriggerFilterRuntimeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_OnTakeDamageEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOnTakeDamageEventToESMTriggerFilterRuntimeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_OnTakeDamageEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOnTakeDamageEventToESMTriggerFilterRuntimeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_OnTakeDamageEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
void __MonitorOnTakeDamageEventToESMTriggerFilterRuntimeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_OnTakeDamageEventToESMTriggerFilterRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorOnTakeDamageEventToESMTriggerFilterRuntimeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_OnTakeDamageEventToESMTriggerFilterRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorOnTakeDamageEventToESMTriggerFilterRuntimeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_OnTakeDamageEventToESMTriggerFilterRuntime, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_OnBeingHitEventToESMTriggerFilterRuntime
{
UFUNCTION()
bool HasOnBeingHitEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_OnBeingHitEventToESMTriggerFilterRuntime);
}
FC_OnBeingHitEventToESMTriggerFilterRuntime& AssignOnBeingHitEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity, const FC_OnBeingHitEventToESMTriggerFilterRuntime &inout DefaultValue = FC_OnBeingHitEventToESMTriggerFilterRuntime())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_OnBeingHitEventToESMTriggerFilterRuntime, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignOnBeingHitEventToESMTriggerFilterRuntime_BP(const FECSEntity &inout Entity, const FC_OnBeingHitEventToESMTriggerFilterRuntime &inout DefaultValue = FC_OnBeingHitEventToESMTriggerFilterRuntime())
{
    ECSFunc_FC_OnBeingHitEventToESMTriggerFilterRuntime::AssignOnBeingHitEventToESMTriggerFilterRuntime(Entity, DefaultValue);
    return;
}
FC_OnBeingHitEventToESMTriggerFilterRuntime& ModifyOnBeingHitEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_OnBeingHitEventToESMTriggerFilterRuntime));
    return local_12.GetComp();
}
FC_OnBeingHitEventToESMTriggerFilterRuntime& ModifyOrAddOnBeingHitEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_OnBeingHitEventToESMTriggerFilterRuntime));
    return local_12.GetComp();
}
const FC_OnBeingHitEventToESMTriggerFilterRuntime& GetOnBeingHitEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_OnBeingHitEventToESMTriggerFilterRuntime));
    return local_12.GetComp();
}
UFUNCTION()
FC_OnBeingHitEventToESMTriggerFilterRuntime GetOnBeingHitEventToESMTriggerFilterRuntime_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_OnBeingHitEventToESMTriggerFilterRuntime& local_4 = ECSFunc_FC_OnBeingHitEventToESMTriggerFilterRuntime::GetOnBeingHitEventToESMTriggerFilterRuntime(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_OnBeingHitEventToESMTriggerFilterRuntime();
}
const FC_OnBeingHitEventToESMTriggerFilterRuntime GetDefaultedOnBeingHitEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_OnBeingHitEventToESMTriggerFilterRuntime __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_OnBeingHitEventToESMTriggerFilterRuntime);
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
FC_OnBeingHitEventToESMTriggerFilterRuntime GetDefaultedOnBeingHitEventToESMTriggerFilterRuntime_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_OnBeingHitEventToESMTriggerFilterRuntime::GetDefaultedOnBeingHitEventToESMTriggerFilterRuntime(Entity);
}
UFUNCTION()
bool RemoveOnBeingHitEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_OnBeingHitEventToESMTriggerFilterRuntime);
}
}
FECSMonitorRuntimeView __GetMonitorOnBeingHitEventToESMTriggerFilterRuntimeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_OnBeingHitEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOnBeingHitEventToESMTriggerFilterRuntimeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_OnBeingHitEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOnBeingHitEventToESMTriggerFilterRuntimeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_OnBeingHitEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOnBeingHitEventToESMTriggerFilterRuntimeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_OnBeingHitEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorOnBeingHitEventToESMTriggerFilterRuntimeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_OnBeingHitEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
void __MonitorOnBeingHitEventToESMTriggerFilterRuntimeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_OnBeingHitEventToESMTriggerFilterRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorOnBeingHitEventToESMTriggerFilterRuntimeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_OnBeingHitEventToESMTriggerFilterRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorOnBeingHitEventToESMTriggerFilterRuntimeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_OnBeingHitEventToESMTriggerFilterRuntime, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_GlobalLevelEventToESMTriggerFilterRuntime
{
UFUNCTION()
bool HasGlobalLevelEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_GlobalLevelEventToESMTriggerFilterRuntime);
}
FC_GlobalLevelEventToESMTriggerFilterRuntime& AssignGlobalLevelEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity, const FC_GlobalLevelEventToESMTriggerFilterRuntime &inout DefaultValue = FC_GlobalLevelEventToESMTriggerFilterRuntime())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_GlobalLevelEventToESMTriggerFilterRuntime, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignGlobalLevelEventToESMTriggerFilterRuntime_BP(const FECSEntity &inout Entity, const FC_GlobalLevelEventToESMTriggerFilterRuntime &inout DefaultValue = FC_GlobalLevelEventToESMTriggerFilterRuntime())
{
    ECSFunc_FC_GlobalLevelEventToESMTriggerFilterRuntime::AssignGlobalLevelEventToESMTriggerFilterRuntime(Entity, DefaultValue);
    return;
}
FC_GlobalLevelEventToESMTriggerFilterRuntime& ModifyGlobalLevelEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_GlobalLevelEventToESMTriggerFilterRuntime));
    return local_12.GetComp();
}
FC_GlobalLevelEventToESMTriggerFilterRuntime& ModifyOrAddGlobalLevelEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_GlobalLevelEventToESMTriggerFilterRuntime));
    return local_12.GetComp();
}
const FC_GlobalLevelEventToESMTriggerFilterRuntime& GetGlobalLevelEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_GlobalLevelEventToESMTriggerFilterRuntime));
    return local_12.GetComp();
}
UFUNCTION()
FC_GlobalLevelEventToESMTriggerFilterRuntime GetGlobalLevelEventToESMTriggerFilterRuntime_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_GlobalLevelEventToESMTriggerFilterRuntime& local_4 = ECSFunc_FC_GlobalLevelEventToESMTriggerFilterRuntime::GetGlobalLevelEventToESMTriggerFilterRuntime(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_GlobalLevelEventToESMTriggerFilterRuntime();
}
const FC_GlobalLevelEventToESMTriggerFilterRuntime GetDefaultedGlobalLevelEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_GlobalLevelEventToESMTriggerFilterRuntime __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_GlobalLevelEventToESMTriggerFilterRuntime);
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
FC_GlobalLevelEventToESMTriggerFilterRuntime GetDefaultedGlobalLevelEventToESMTriggerFilterRuntime_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_GlobalLevelEventToESMTriggerFilterRuntime::GetDefaultedGlobalLevelEventToESMTriggerFilterRuntime(Entity);
}
UFUNCTION()
bool RemoveGlobalLevelEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_GlobalLevelEventToESMTriggerFilterRuntime);
}
}
FECSMonitorRuntimeView __GetMonitorGlobalLevelEventToESMTriggerFilterRuntimeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_GlobalLevelEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGlobalLevelEventToESMTriggerFilterRuntimeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_GlobalLevelEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGlobalLevelEventToESMTriggerFilterRuntimeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_GlobalLevelEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGlobalLevelEventToESMTriggerFilterRuntimeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_GlobalLevelEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGlobalLevelEventToESMTriggerFilterRuntimeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_GlobalLevelEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
void __MonitorGlobalLevelEventToESMTriggerFilterRuntimeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_GlobalLevelEventToESMTriggerFilterRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGlobalLevelEventToESMTriggerFilterRuntimeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_GlobalLevelEventToESMTriggerFilterRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGlobalLevelEventToESMTriggerFilterRuntimeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_GlobalLevelEventToESMTriggerFilterRuntime, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PropEcologyEventToESMTriggerFilterRuntime
{
UFUNCTION()
bool HasPropEcologyEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PropEcologyEventToESMTriggerFilterRuntime);
}
FC_PropEcologyEventToESMTriggerFilterRuntime& AssignPropEcologyEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity, const FC_PropEcologyEventToESMTriggerFilterRuntime &inout DefaultValue = FC_PropEcologyEventToESMTriggerFilterRuntime())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PropEcologyEventToESMTriggerFilterRuntime, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPropEcologyEventToESMTriggerFilterRuntime_BP(const FECSEntity &inout Entity, const FC_PropEcologyEventToESMTriggerFilterRuntime &inout DefaultValue = FC_PropEcologyEventToESMTriggerFilterRuntime())
{
    ECSFunc_FC_PropEcologyEventToESMTriggerFilterRuntime::AssignPropEcologyEventToESMTriggerFilterRuntime(Entity, DefaultValue);
    return;
}
FC_PropEcologyEventToESMTriggerFilterRuntime& ModifyPropEcologyEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PropEcologyEventToESMTriggerFilterRuntime));
    return local_12.GetComp();
}
FC_PropEcologyEventToESMTriggerFilterRuntime& ModifyOrAddPropEcologyEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PropEcologyEventToESMTriggerFilterRuntime));
    return local_12.GetComp();
}
const FC_PropEcologyEventToESMTriggerFilterRuntime& GetPropEcologyEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PropEcologyEventToESMTriggerFilterRuntime));
    return local_12.GetComp();
}
UFUNCTION()
FC_PropEcologyEventToESMTriggerFilterRuntime GetPropEcologyEventToESMTriggerFilterRuntime_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PropEcologyEventToESMTriggerFilterRuntime& local_4 = ECSFunc_FC_PropEcologyEventToESMTriggerFilterRuntime::GetPropEcologyEventToESMTriggerFilterRuntime(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PropEcologyEventToESMTriggerFilterRuntime();
}
const FC_PropEcologyEventToESMTriggerFilterRuntime GetDefaultedPropEcologyEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PropEcologyEventToESMTriggerFilterRuntime __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PropEcologyEventToESMTriggerFilterRuntime);
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
FC_PropEcologyEventToESMTriggerFilterRuntime GetDefaultedPropEcologyEventToESMTriggerFilterRuntime_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PropEcologyEventToESMTriggerFilterRuntime::GetDefaultedPropEcologyEventToESMTriggerFilterRuntime(Entity);
}
UFUNCTION()
bool RemovePropEcologyEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PropEcologyEventToESMTriggerFilterRuntime);
}
}
FECSMonitorRuntimeView __GetMonitorPropEcologyEventToESMTriggerFilterRuntimeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PropEcologyEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropEcologyEventToESMTriggerFilterRuntimeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PropEcologyEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropEcologyEventToESMTriggerFilterRuntimeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PropEcologyEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropEcologyEventToESMTriggerFilterRuntimeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PropEcologyEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropEcologyEventToESMTriggerFilterRuntimeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PropEcologyEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
void __MonitorPropEcologyEventToESMTriggerFilterRuntimeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PropEcologyEventToESMTriggerFilterRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPropEcologyEventToESMTriggerFilterRuntimeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PropEcologyEventToESMTriggerFilterRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPropEcologyEventToESMTriggerFilterRuntimeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PropEcologyEventToESMTriggerFilterRuntime, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_PropMovementHitSceneEventToESMTriggerFilterRuntime
{
UFUNCTION()
bool HasPropMovementHitSceneEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_PropMovementHitSceneEventToESMTriggerFilterRuntime);
}
FC_PropMovementHitSceneEventToESMTriggerFilterRuntime& AssignPropMovementHitSceneEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity, const FC_PropMovementHitSceneEventToESMTriggerFilterRuntime &inout DefaultValue = FC_PropMovementHitSceneEventToESMTriggerFilterRuntime())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_PropMovementHitSceneEventToESMTriggerFilterRuntime, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignPropMovementHitSceneEventToESMTriggerFilterRuntime_BP(const FECSEntity &inout Entity, const FC_PropMovementHitSceneEventToESMTriggerFilterRuntime &inout DefaultValue = FC_PropMovementHitSceneEventToESMTriggerFilterRuntime())
{
    ECSFunc_FC_PropMovementHitSceneEventToESMTriggerFilterRuntime::AssignPropMovementHitSceneEventToESMTriggerFilterRuntime(Entity, DefaultValue);
    return;
}
FC_PropMovementHitSceneEventToESMTriggerFilterRuntime& ModifyPropMovementHitSceneEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_PropMovementHitSceneEventToESMTriggerFilterRuntime));
    return local_12.GetComp();
}
FC_PropMovementHitSceneEventToESMTriggerFilterRuntime& ModifyOrAddPropMovementHitSceneEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_PropMovementHitSceneEventToESMTriggerFilterRuntime));
    return local_12.GetComp();
}
const FC_PropMovementHitSceneEventToESMTriggerFilterRuntime& GetPropMovementHitSceneEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_PropMovementHitSceneEventToESMTriggerFilterRuntime));
    return local_12.GetComp();
}
UFUNCTION()
FC_PropMovementHitSceneEventToESMTriggerFilterRuntime GetPropMovementHitSceneEventToESMTriggerFilterRuntime_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_PropMovementHitSceneEventToESMTriggerFilterRuntime& local_4 = ECSFunc_FC_PropMovementHitSceneEventToESMTriggerFilterRuntime::GetPropMovementHitSceneEventToESMTriggerFilterRuntime(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_PropMovementHitSceneEventToESMTriggerFilterRuntime();
}
const FC_PropMovementHitSceneEventToESMTriggerFilterRuntime GetDefaultedPropMovementHitSceneEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_PropMovementHitSceneEventToESMTriggerFilterRuntime __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_PropMovementHitSceneEventToESMTriggerFilterRuntime);
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
FC_PropMovementHitSceneEventToESMTriggerFilterRuntime GetDefaultedPropMovementHitSceneEventToESMTriggerFilterRuntime_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_PropMovementHitSceneEventToESMTriggerFilterRuntime::GetDefaultedPropMovementHitSceneEventToESMTriggerFilterRuntime(Entity);
}
UFUNCTION()
bool RemovePropMovementHitSceneEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_PropMovementHitSceneEventToESMTriggerFilterRuntime);
}
}
FECSMonitorRuntimeView __GetMonitorPropMovementHitSceneEventToESMTriggerFilterRuntimeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_PropMovementHitSceneEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropMovementHitSceneEventToESMTriggerFilterRuntimeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_PropMovementHitSceneEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropMovementHitSceneEventToESMTriggerFilterRuntimeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_PropMovementHitSceneEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropMovementHitSceneEventToESMTriggerFilterRuntimeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_PropMovementHitSceneEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorPropMovementHitSceneEventToESMTriggerFilterRuntimeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_PropMovementHitSceneEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
void __MonitorPropMovementHitSceneEventToESMTriggerFilterRuntimeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_PropMovementHitSceneEventToESMTriggerFilterRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPropMovementHitSceneEventToESMTriggerFilterRuntimeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_PropMovementHitSceneEventToESMTriggerFilterRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorPropMovementHitSceneEventToESMTriggerFilterRuntimeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_PropMovementHitSceneEventToESMTriggerFilterRuntime, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_DeathEventToESMTriggerFilterRuntime
{
UFUNCTION()
bool HasDeathEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_DeathEventToESMTriggerFilterRuntime);
}
FC_DeathEventToESMTriggerFilterRuntime& AssignDeathEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity, const FC_DeathEventToESMTriggerFilterRuntime &inout DefaultValue = FC_DeathEventToESMTriggerFilterRuntime())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_DeathEventToESMTriggerFilterRuntime, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignDeathEventToESMTriggerFilterRuntime_BP(const FECSEntity &inout Entity, const FC_DeathEventToESMTriggerFilterRuntime &inout DefaultValue = FC_DeathEventToESMTriggerFilterRuntime())
{
    ECSFunc_FC_DeathEventToESMTriggerFilterRuntime::AssignDeathEventToESMTriggerFilterRuntime(Entity, DefaultValue);
    return;
}
FC_DeathEventToESMTriggerFilterRuntime& ModifyDeathEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_DeathEventToESMTriggerFilterRuntime));
    return local_12.GetComp();
}
FC_DeathEventToESMTriggerFilterRuntime& ModifyOrAddDeathEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_DeathEventToESMTriggerFilterRuntime));
    return local_12.GetComp();
}
const FC_DeathEventToESMTriggerFilterRuntime& GetDeathEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_DeathEventToESMTriggerFilterRuntime));
    return local_12.GetComp();
}
UFUNCTION()
FC_DeathEventToESMTriggerFilterRuntime GetDeathEventToESMTriggerFilterRuntime_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_DeathEventToESMTriggerFilterRuntime& local_4 = ECSFunc_FC_DeathEventToESMTriggerFilterRuntime::GetDeathEventToESMTriggerFilterRuntime(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_DeathEventToESMTriggerFilterRuntime();
}
const FC_DeathEventToESMTriggerFilterRuntime GetDefaultedDeathEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_DeathEventToESMTriggerFilterRuntime __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_DeathEventToESMTriggerFilterRuntime);
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
FC_DeathEventToESMTriggerFilterRuntime GetDefaultedDeathEventToESMTriggerFilterRuntime_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_DeathEventToESMTriggerFilterRuntime::GetDefaultedDeathEventToESMTriggerFilterRuntime(Entity);
}
UFUNCTION()
bool RemoveDeathEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_DeathEventToESMTriggerFilterRuntime);
}
}
FECSMonitorRuntimeView __GetMonitorDeathEventToESMTriggerFilterRuntimeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_DeathEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDeathEventToESMTriggerFilterRuntimeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_DeathEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDeathEventToESMTriggerFilterRuntimeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_DeathEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDeathEventToESMTriggerFilterRuntimeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_DeathEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorDeathEventToESMTriggerFilterRuntimeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_DeathEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
void __MonitorDeathEventToESMTriggerFilterRuntimeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_DeathEventToESMTriggerFilterRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDeathEventToESMTriggerFilterRuntimeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_DeathEventToESMTriggerFilterRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorDeathEventToESMTriggerFilterRuntimeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_DeathEventToESMTriggerFilterRuntime, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_MovementEndEventToESMTriggerFilterRuntime
{
UFUNCTION()
bool HasMovementEndEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_MovementEndEventToESMTriggerFilterRuntime);
}
FC_MovementEndEventToESMTriggerFilterRuntime& AssignMovementEndEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity, const FC_MovementEndEventToESMTriggerFilterRuntime &inout DefaultValue = FC_MovementEndEventToESMTriggerFilterRuntime())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_MovementEndEventToESMTriggerFilterRuntime, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignMovementEndEventToESMTriggerFilterRuntime_BP(const FECSEntity &inout Entity, const FC_MovementEndEventToESMTriggerFilterRuntime &inout DefaultValue = FC_MovementEndEventToESMTriggerFilterRuntime())
{
    ECSFunc_FC_MovementEndEventToESMTriggerFilterRuntime::AssignMovementEndEventToESMTriggerFilterRuntime(Entity, DefaultValue);
    return;
}
FC_MovementEndEventToESMTriggerFilterRuntime& ModifyMovementEndEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_MovementEndEventToESMTriggerFilterRuntime));
    return local_12.GetComp();
}
FC_MovementEndEventToESMTriggerFilterRuntime& ModifyOrAddMovementEndEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_MovementEndEventToESMTriggerFilterRuntime));
    return local_12.GetComp();
}
const FC_MovementEndEventToESMTriggerFilterRuntime& GetMovementEndEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_MovementEndEventToESMTriggerFilterRuntime));
    return local_12.GetComp();
}
UFUNCTION()
FC_MovementEndEventToESMTriggerFilterRuntime GetMovementEndEventToESMTriggerFilterRuntime_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_MovementEndEventToESMTriggerFilterRuntime& local_4 = ECSFunc_FC_MovementEndEventToESMTriggerFilterRuntime::GetMovementEndEventToESMTriggerFilterRuntime(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_MovementEndEventToESMTriggerFilterRuntime();
}
const FC_MovementEndEventToESMTriggerFilterRuntime GetDefaultedMovementEndEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_MovementEndEventToESMTriggerFilterRuntime __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_MovementEndEventToESMTriggerFilterRuntime);
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
FC_MovementEndEventToESMTriggerFilterRuntime GetDefaultedMovementEndEventToESMTriggerFilterRuntime_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_MovementEndEventToESMTriggerFilterRuntime::GetDefaultedMovementEndEventToESMTriggerFilterRuntime(Entity);
}
UFUNCTION()
bool RemoveMovementEndEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_MovementEndEventToESMTriggerFilterRuntime);
}
}
FECSMonitorRuntimeView __GetMonitorMovementEndEventToESMTriggerFilterRuntimeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_MovementEndEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMovementEndEventToESMTriggerFilterRuntimeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_MovementEndEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMovementEndEventToESMTriggerFilterRuntimeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_MovementEndEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMovementEndEventToESMTriggerFilterRuntimeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_MovementEndEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorMovementEndEventToESMTriggerFilterRuntimeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_MovementEndEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
void __MonitorMovementEndEventToESMTriggerFilterRuntimeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_MovementEndEventToESMTriggerFilterRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMovementEndEventToESMTriggerFilterRuntimeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_MovementEndEventToESMTriggerFilterRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorMovementEndEventToESMTriggerFilterRuntimeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_MovementEndEventToESMTriggerFilterRuntime, bFixedFrame, Details);
    return;
}
namespace ECSFunc_FC_GameAttributeChangedEventToESMTriggerFilterRuntime
{
UFUNCTION()
bool HasGameAttributeChangedEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Has(Entity.GetWorld(), Entity.GetId(), FC_GameAttributeChangedEventToESMTriggerFilterRuntime);
}
FC_GameAttributeChangedEventToESMTriggerFilterRuntime& AssignGameAttributeChangedEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity, const FC_GameAttributeChangedEventToESMTriggerFilterRuntime &inout DefaultValue = FC_GameAttributeChangedEventToESMTriggerFilterRuntime())
{
    int local_14 = 0;
    local_14.InternalSet(ECSInternal::Assign(Entity.GetWorld(), Entity.GetId(), FC_GameAttributeChangedEventToESMTriggerFilterRuntime, FECSComponentPtr(DefaultValue)));
    return local_14.GetComp();
}
UFUNCTION()
void AssignGameAttributeChangedEventToESMTriggerFilterRuntime_BP(const FECSEntity &inout Entity, const FC_GameAttributeChangedEventToESMTriggerFilterRuntime &inout DefaultValue = FC_GameAttributeChangedEventToESMTriggerFilterRuntime())
{
    ECSFunc_FC_GameAttributeChangedEventToESMTriggerFilterRuntime::AssignGameAttributeChangedEventToESMTriggerFilterRuntime(Entity, DefaultValue);
    return;
}
FC_GameAttributeChangedEventToESMTriggerFilterRuntime& ModifyGameAttributeChangedEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Modify(Entity.GetWorld(), Entity.GetId(), FC_GameAttributeChangedEventToESMTriggerFilterRuntime));
    return local_12.GetComp();
}
FC_GameAttributeChangedEventToESMTriggerFilterRuntime& ModifyOrAddGameAttributeChangedEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::ModifyOrAdd(Entity.GetWorld(), Entity.GetId(), FC_GameAttributeChangedEventToESMTriggerFilterRuntime));
    return local_12.GetComp();
}
const FC_GameAttributeChangedEventToESMTriggerFilterRuntime& GetGameAttributeChangedEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_12 = 0;
    local_12.InternalSet(ECSInternal::Get(Entity.GetWorld(), Entity.GetId(), FC_GameAttributeChangedEventToESMTriggerFilterRuntime));
    return local_12.GetComp();
}
UFUNCTION()
FC_GameAttributeChangedEventToESMTriggerFilterRuntime GetGameAttributeChangedEventToESMTriggerFilterRuntime_BP(const FECSEntity &inout Entity, bool &out bValid)
{
    bValid = false;
    const FC_GameAttributeChangedEventToESMTriggerFilterRuntime& local_4 = ECSFunc_FC_GameAttributeChangedEventToESMTriggerFilterRuntime::GetGameAttributeChangedEventToESMTriggerFilterRuntime(Entity);
    bValid = local_4;
    if (bValid)
    {
        return local_4;
    }
    return FC_GameAttributeChangedEventToESMTriggerFilterRuntime();
}
const FC_GameAttributeChangedEventToESMTriggerFilterRuntime GetDefaultedGameAttributeChangedEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    const FC_GameAttributeChangedEventToESMTriggerFilterRuntime __r;
    FECSComponentPtr local_10 = ECSInternal::GetDefaulted(Entity.GetWorld(), Entity.GetId(), FC_GameAttributeChangedEventToESMTriggerFilterRuntime);
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
FC_GameAttributeChangedEventToESMTriggerFilterRuntime GetDefaultedGameAttributeChangedEventToESMTriggerFilterRuntime_BP(const FECSEntity &inout Entity)
{
    return ECSFunc_FC_GameAttributeChangedEventToESMTriggerFilterRuntime::GetDefaultedGameAttributeChangedEventToESMTriggerFilterRuntime(Entity);
}
UFUNCTION()
bool RemoveGameAttributeChangedEventToESMTriggerFilterRuntime(const FECSEntity &inout Entity)
{
    return ECSInternal::Remove(Entity.GetWorld(), Entity.GetId(), FC_GameAttributeChangedEventToESMTriggerFilterRuntime);
}
}
FECSMonitorRuntimeView __GetMonitorGameAttributeChangedEventToESMTriggerFilterRuntimeOnAssignView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnAssignView(World, FC_GameAttributeChangedEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameAttributeChangedEventToESMTriggerFilterRuntimeOnRemoveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnRemoveView(World, FC_GameAttributeChangedEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameAttributeChangedEventToESMTriggerFilterRuntimeOnActiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnActiveView(World, FC_GameAttributeChangedEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameAttributeChangedEventToESMTriggerFilterRuntimeOnInactiveView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnInactiveView(World, FC_GameAttributeChangedEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
FECSMonitorRuntimeView __GetMonitorGameAttributeChangedEventToESMTriggerFilterRuntimeOnModifyView(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bMustHandleAll = true)
{
    return ECSInternal::GetMonitorOnModifyView(World, FC_GameAttributeChangedEventToESMTriggerFilterRuntime, bFixedFrame, bMustHandleAll);
}
void __MonitorGameAttributeChangedEventToESMTriggerFilterRuntimeLifetime(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorLifetime(World, FC_GameAttributeChangedEventToESMTriggerFilterRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameAttributeChangedEventToESMTriggerFilterRuntimeActivity(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const bool bNeedSnapshot, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorActivity(World, FC_GameAttributeChangedEventToESMTriggerFilterRuntime, bFixedFrame, bNeedSnapshot, Details);
    return;
}
void __MonitorGameAttributeChangedEventToESMTriggerFilterRuntimeModification(const FECSWorldPtr &inout World, const EECSRegType RegType, const bool bFixedFrame, const FECSMonitorDetail &inout Details = FECSMonitorDetail())
{
    ECSInternal::MonitorModification(World, FC_GameAttributeChangedEventToESMTriggerFilterRuntime, bFixedFrame, Details);
    return;
}
namespace EntityBB
{
void GetEntityBBVar_EventToESMTriggerFilterContext_BeginOverlap_OverlappingEntity(const FECSEntity &inout Entity, FECSEntity &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = FECSEntity(local_4.opCall().GetBeginOverlap_OverlappingEntity());
    return;
}
void GetEntityBBVar_EventToESMTriggerFilterContext_CustomInteract_InteractSource(const FECSEntity &inout Entity, FECSEntity &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = FECSEntity(local_4.opCall().GetCustomInteract_InteractSource());
    return;
}
void GetEntityBBVar_EventToESMTriggerFilterContext_CustomInteract_CustomEventName(const FECSEntity &inout Entity, FName &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = FName(local_4.opCall().GetCustomInteract_CustomEventName());
    return;
}
void GetEntityBBVar_EventToESMTriggerFilterContext_OnTakeDamage_Causer(const FECSEntity &inout Entity, FECSEntity &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = FECSEntity(local_4.opCall().GetOnTakeDamage_Causer());
    return;
}
void GetEntityBBVar_EventToESMTriggerFilterContext_OnTakeDamage_DirectDamageCauser(const FECSEntity &inout Entity, FECSEntity &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = FECSEntity(local_4.opCall().GetOnTakeDamage_DirectDamageCauser());
    return;
}
void GetEntityBBVar_EventToESMTriggerFilterContext_OnBeingHit_Attacker(const FECSEntity &inout Entity, FECSEntity &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = FECSEntity(local_4.opCall().GetOnBeingHit_Attacker());
    return;
}
void GetEntityBBVar_EventToESMTriggerFilterContext_OnBeingHit_Receiver(const FECSEntity &inout Entity, FECSEntity &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = FECSEntity(local_4.opCall().GetOnBeingHit_Receiver());
    return;
}
void GetEntityBBVar_EventToESMTriggerFilterContext_PropMovementHitScene_HitEntity(const FECSEntity &inout Entity, FECSEntity &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = FECSEntity(local_4.opCall().GetPropMovementHitScene_HitEntity());
    return;
}
void GetEntityBBVar_EventToESMTriggerFilterContext_PropMovementHitScene_ImpactPoint(const FECSEntity &inout Entity, FVector &inout OutRetValue)
{
    GetDefaulted local_4;
    OutRetValue = FVector(local_4.opCall().GetPropMovementHitScene_ImpactPoint());
    return;
}
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FC_EventToESMTriggerFilterContext &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FC_EventToESMTriggerFilterContext &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_EventToESMTriggerFilterContext &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_EventToESMTriggerFilterContext
{
int __IndexOf_BeginOverlap_OverlappingEntity()
{
    return 0;
}
int __IndexOf_CustomInteract_InteractSource()
{
    return 1;
}
int __IndexOf_CustomInteract_CustomEventName()
{
    return 2;
}
int __IndexOf_OnTakeDamage_Causer()
{
    return 3;
}
int __IndexOf_OnTakeDamage_DirectDamageCauser()
{
    return 4;
}
int __IndexOf_OnBeingHit_Attacker()
{
    return 5;
}
int __IndexOf_OnBeingHit_Receiver()
{
    return 6;
}
int __IndexOf_PropMovementHitScene_HitEntity()
{
    return 7;
}
int __IndexOf_PropMovementHitScene_ImpactPoint()
{
    return 8;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_BeginOverlapEventToESMTriggerFilterRuntime &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_BeginOverlapEventToESMTriggerFilterRuntime &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_BeginOverlapEventToESMTriggerFilterRuntime &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_BeginOverlapEventToESMTriggerFilterRuntime
{
int __IndexOf_ActivatedIndexMask()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_CustomInteractEventToESMTriggerFilterRuntime &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_CustomInteractEventToESMTriggerFilterRuntime &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_CustomInteractEventToESMTriggerFilterRuntime &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_CustomInteractEventToESMTriggerFilterRuntime
{
int __IndexOf_ActivatedIndexMask()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_OnTakeDamageEventToESMTriggerFilterRuntime &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_OnTakeDamageEventToESMTriggerFilterRuntime &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_OnTakeDamageEventToESMTriggerFilterRuntime &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_OnTakeDamageEventToESMTriggerFilterRuntime
{
int __IndexOf_ActivatedIndexMask()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_OnBeingHitEventToESMTriggerFilterRuntime &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_OnBeingHitEventToESMTriggerFilterRuntime &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_OnBeingHitEventToESMTriggerFilterRuntime &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_OnBeingHitEventToESMTriggerFilterRuntime
{
int __IndexOf_ActivatedIndexMask()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_GlobalLevelEventToESMTriggerFilterRuntime &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_GlobalLevelEventToESMTriggerFilterRuntime &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_GlobalLevelEventToESMTriggerFilterRuntime &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_GlobalLevelEventToESMTriggerFilterRuntime
{
int __IndexOf_ActivatedIndexMask()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_PropEcologyEventToESMTriggerFilterRuntime &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_PropEcologyEventToESMTriggerFilterRuntime &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_PropEcologyEventToESMTriggerFilterRuntime &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_PropEcologyEventToESMTriggerFilterRuntime
{
int __IndexOf_ActivatedIndexMask()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_PropMovementHitSceneEventToESMTriggerFilterRuntime &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_PropMovementHitSceneEventToESMTriggerFilterRuntime &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_PropMovementHitSceneEventToESMTriggerFilterRuntime &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_PropMovementHitSceneEventToESMTriggerFilterRuntime
{
int __IndexOf_ActivatedIndexMask()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_DeathEventToESMTriggerFilterRuntime &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_DeathEventToESMTriggerFilterRuntime &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_DeathEventToESMTriggerFilterRuntime &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_DeathEventToESMTriggerFilterRuntime
{
int __IndexOf_ActivatedIndexMask()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_MovementEndEventToESMTriggerFilterRuntime &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_MovementEndEventToESMTriggerFilterRuntime &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_MovementEndEventToESMTriggerFilterRuntime &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_MovementEndEventToESMTriggerFilterRuntime
{
int __IndexOf_ActivatedIndexMask()
{
    return 0;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FC_GameAttributeChangedEventToESMTriggerFilterRuntime &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FC_GameAttributeChangedEventToESMTriggerFilterRuntime &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FC_GameAttributeChangedEventToESMTriggerFilterRuntime &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FC_GameAttributeChangedEventToESMTriggerFilterRuntime
{
int __IndexOf_ActivatedIndexMask()
{
    return 0;
}
}
