
namespace __INTENRAL_FCE_NotifyEnableInputContext_NS
{
    const TECSEventDerivedPtr<FCE_NotifyEnableInputContext> DerivedPtr = TECSEventDerivedPtr<FCE_NotifyEnableInputContext>();
}
namespace __INTENRAL_FCE_NotifyEnableInputContextTag_NS
{
    const TECSEventDerivedPtr<FCE_NotifyEnableInputContextTag> DerivedPtr = TECSEventDerivedPtr<FCE_NotifyEnableInputContextTag>();
}
namespace __INTENRAL_FCE_SetGameplayInputEnabled_NS
{
    const TECSEventDerivedPtr<FCE_SetGameplayInputEnabled> DerivedPtr = TECSEventDerivedPtr<FCE_SetGameplayInputEnabled>();
}
namespace __INTENRAL_FCE_SetTeleportInputBlocked_NS
{
    const TECSEventDerivedPtr<FCE_SetTeleportInputBlocked> DerivedPtr = TECSEventDerivedPtr<FCE_SetTeleportInputBlocked>();

}
struct FCE_NotifyEnableInputContext : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TDataObjectPtr<FEnhancedInputContextConfig> InputContextConfig;
    UPROPERTY()
    bool bEnable;


}

struct FCE_NotifyEnableInputContextTag : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FGameplayTag Tag;
    UPROPERTY()
    bool bEnable;


}

struct FCE_SetGameplayInputEnabled : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    bool bEnabled;


}

struct FCE_SetTeleportInputBlocked : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    uint64 SourceDsId;
    UPROPERTY()
    bool bBlocked;


}

