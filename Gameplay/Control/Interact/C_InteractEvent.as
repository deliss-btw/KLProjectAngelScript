
namespace __INTENRAL_FCE_StartMultiExecution_NS
{
    const TECSEventDerivedPtr<FCE_StartMultiExecution> DerivedPtr = TECSEventDerivedPtr<FCE_StartMultiExecution>();
}
namespace __INTENRAL_FCE_OnAbilityCustomInteract_NS
{
    const TECSEventDerivedPtr<FCE_OnAbilityCustomInteract> DerivedPtr = TECSEventDerivedPtr<FCE_OnAbilityCustomInteract>();
}
namespace __INTENRAL_FCE_SetEntityInteractTargetEnabled_NS
{
    const TECSEventDerivedPtr<FCE_SetEntityInteractTargetEnabled> DerivedPtr = TECSEventDerivedPtr<FCE_SetEntityInteractTargetEnabled>();
}
namespace __INTENRAL_FCE_SetEntityInteractionBlocked_NS
{
    const TECSEventDerivedPtr<FCE_SetEntityInteractionBlocked> DerivedPtr = TECSEventDerivedPtr<FCE_SetEntityInteractionBlocked>();
}
namespace __INTENRAL_FCE_BeginInteractEvent_NS
{
    const TECSEventDerivedPtr<FCE_BeginInteractEvent> DerivedPtr = TECSEventDerivedPtr<FCE_BeginInteractEvent>();
}
namespace __INTENRAL_FCE_EndInteractEvent_NS
{
    const TECSEventDerivedPtr<FCE_EndInteractEvent> DerivedPtr = TECSEventDerivedPtr<FCE_EndInteractEvent>();
}
namespace __INTENRAL_FCE_ServerTriggerBeginInteractEvent_NS
{
    const TECSEventDerivedPtr<FCE_ServerTriggerBeginInteractEvent> DerivedPtr = TECSEventDerivedPtr<FCE_ServerTriggerBeginInteractEvent>();
}
namespace __INTENRAL_FCE_ServerTriggerEndInteractEvent_NS
{
    const TECSEventDerivedPtr<FCE_ServerTriggerEndInteractEvent> DerivedPtr = TECSEventDerivedPtr<FCE_ServerTriggerEndInteractEvent>();
}
namespace __INTENRAL_FCE_BeginAutoInteractEvent_NS
{
    const TECSEventDerivedPtr<FCE_BeginAutoInteractEvent> DerivedPtr = TECSEventDerivedPtr<FCE_BeginAutoInteractEvent>();
}
namespace __INTENRAL_FCE_EndAutoInteractEvent_NS
{
    const TECSEventDerivedPtr<FCE_EndAutoInteractEvent> DerivedPtr = TECSEventDerivedPtr<FCE_EndAutoInteractEvent>();
}
namespace __INTENRAL_FCE_AutoInteractTargetsEvent_NS
{
    const TECSEventDerivedPtr<FCE_AutoInteractTargetsEvent> DerivedPtr = TECSEventDerivedPtr<FCE_AutoInteractTargetsEvent>();
}
namespace __INTENRAL_FCE_InteractActionESMTriggerEvent_NS
{
    const TECSEventDerivedPtr<FCE_InteractActionESMTriggerEvent> DerivedPtr = TECSEventDerivedPtr<FCE_InteractActionESMTriggerEvent>();
}
namespace __INTENRAL_FCE_InteractActionESMTriggerEventForLocalReg_NS
{
    const TECSEventDerivedPtr<FCE_InteractActionESMTriggerEventForLocalReg> DerivedPtr = TECSEventDerivedPtr<FCE_InteractActionESMTriggerEventForLocalReg>();
}
namespace __INTENRAL_FCE_InteractActionOpenUIEvent_NS
{
    const TECSEventDerivedPtr<FCE_InteractActionOpenUIEvent> DerivedPtr = TECSEventDerivedPtr<FCE_InteractActionOpenUIEvent>();
}
namespace __INTENRAL_FCE_InteractActionOpenPageEvent_NS
{
    const TECSEventDerivedPtr<FCE_InteractActionOpenPageEvent> DerivedPtr = TECSEventDerivedPtr<FCE_InteractActionOpenPageEvent>();
}
namespace __INTENRAL_FCE_InteractActionClosePageEvent_NS
{
    const TECSEventDerivedPtr<FCE_InteractActionClosePageEvent> DerivedPtr = TECSEventDerivedPtr<FCE_InteractActionClosePageEvent>();
}
namespace __INTENRAL_FCE_InteractUIPageClosedEvent_NS
{
    const TECSEventDerivedPtr<FCE_InteractUIPageClosedEvent> DerivedPtr = TECSEventDerivedPtr<FCE_InteractUIPageClosedEvent>();
}
namespace __INTENRAL_FCE_UITriggerInteractSourceAbility_NS
{
    const TECSEventDerivedPtr<FCE_UITriggerInteractSourceAbility> DerivedPtr = TECSEventDerivedPtr<FCE_UITriggerInteractSourceAbility>();
}
namespace __INTENRAL_FCE_UITriggerInteractTargetAbility_NS
{
    const TECSEventDerivedPtr<FCE_UITriggerInteractTargetAbility> DerivedPtr = TECSEventDerivedPtr<FCE_UITriggerInteractTargetAbility>();
}
namespace __INTENRAL_FCE_DebugTriggerClientInteract_NS
{
    const TECSEventDerivedPtr<FCE_DebugTriggerClientInteract> DerivedPtr = TECSEventDerivedPtr<FCE_DebugTriggerClientInteract>();

}
struct FCE_StartMultiExecution : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity ExecuteTarget;

    FCE_StartMultiExecution()
    {
        return;
    }
}

struct FCE_OnAbilityCustomInteract : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity InteractTarget;
    UPROPERTY()
    FName CustomEventName;
    UPROPERTY()
    int PointIndex;


}

struct FCE_SetEntityInteractTargetEnabled : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    bool bEnabled = false;
    UPROPERTY()
    int PointIndex = -1;


}

struct FCE_SetEntityInteractionBlocked : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    bool bBlocked = false;


}

struct FCE_BeginInteractEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    bool bIsSecondaryInteract = false;
    UPROPERTY()
    FInteractionPointAndBehaviorIndex InteractTargetPointAndBehaviorIndex;
    UPROPERTY()
    EInteractMode InteractMode = EInteractMode(0);


}

struct FCE_EndInteractEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    FInteractionPointAndBehaviorIndex InteractTargetPointAndBehaviorIndex;

    FCE_EndInteractEvent()
    {
        return;
    }
}

struct FCE_ServerTriggerBeginInteractEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    bool bIsSecondaryInteract = false;
    UPROPERTY()
    FInteractionPointAndBehaviorIndex InteractTargetPointAndBehaviorIndex;


}

struct FCE_ServerTriggerEndInteractEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity TargetEntity;
    UPROPERTY()
    FInteractionPointAndBehaviorIndex InteractTargetPointAndBehaviorIndex;

    FCE_ServerTriggerEndInteractEvent()
    {
        return;
    }
}

struct FCE_BeginAutoInteractEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_BeginAutoInteractEvent()
    {
        return;
    }
}

struct FCE_EndAutoInteractEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_EndAutoInteractEvent()
    {
        return;
    }
}

struct FCE_AutoInteractTargetsEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TArray<FInteractTargetInfo> InteractTargets;

    FCE_AutoInteractTargetsEvent()
    {
        return;
    }
}

struct FInteractActionESMBBForEvent
{
    UPROPERTY()
    FName m_ESMBBTriggerName;
    UPROPERTY()
    float32 m_TriggerValidateTime = 0.1f;


    FName GetESMBBTriggerName() const property
    {
        return this;
    }
    void SetESMBBTriggerName(const FName &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    float32 GetTriggerValidateTime() const property
    {
        return this.m_TriggerValidateTime;
    }
    void SetTriggerValidateTime(const float32 __Value) property
    {
        this.m_TriggerValidateTime = __Value;
        return;
    }
}

struct FCE_InteractActionESMTriggerEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity InteractSourceEntity;
    UPROPERTY()
    FECSEntity RealInteractTriggerEntity;
    UPROPERTY()
    FInteractActionESMBBForEvent InteractActionESMBBForEvent;

    FCE_InteractActionESMTriggerEvent()
    {
        return;
    }
}

struct FCE_InteractActionESMTriggerEventForLocalReg : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity RealInteractTriggerEntity;
    UPROPERTY()
    FInteractActionESMBBForEvent InteractActionESMBBForEvent;

    FCE_InteractActionESMTriggerEventForLocalReg()
    {
        return;
    }
}

struct FCE_InteractActionOpenUIEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TSoftClassPtr<UUserWidget> UIWidget;

    FCE_InteractActionOpenUIEvent()
    {
        return;
    }
}

struct FCE_InteractActionOpenPageEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> PageWidget;
    UPROPERTY()
    FGameplayTag WidgetTag;
    UPROPERTY()
    FECSEntity InteractSource;
    UPROPERTY()
    FInteractTargetInfo InteractTargetInfo;

    FCE_InteractActionOpenPageEvent()
    {
        return;
    }
}

struct FCE_InteractActionClosePageEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity InteractTarget;

    FCE_InteractActionClosePageEvent()
    {
        return;
    }
}

struct FCE_InteractUIPageClosedEvent : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FEUIWidgetRef PageHandle;

    FCE_InteractUIPageClosedEvent()
    {
        return;
    }
}

struct FCE_UITriggerInteractSourceAbility : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity AbilityOwner;
    UPROPERTY()
    TSoftClassPtr<UEASAbility> AbilityClass;
    UPROPERTY()
    FName SignalName;

    FCE_UITriggerInteractSourceAbility()
    {
        return;
    }
}

struct FCE_UITriggerInteractTargetAbility : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FECSEntity AbilityOwner;
    UPROPERTY()
    FName SignalName;
    UPROPERTY()
    FInteractionPointAndBehaviorIndex InteractTargetPointAndBehaviorIndex;

    FCE_UITriggerInteractTargetAbility()
    {
        return;
    }
}

struct FCE_DebugTriggerClientInteract : FECSEvent
{
    FECSEvent _base_FECSEvent;

    FCE_DebugTriggerClientInteract()
    {
        return;
    }
}

