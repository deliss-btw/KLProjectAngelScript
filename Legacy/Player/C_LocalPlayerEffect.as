
namespace __INTENRAL_FCE_LocalPlayerForceFeedbackEffect_NS
{
    const TECSEventDerivedPtr<FCE_LocalPlayerForceFeedbackEffect> DerivedPtr = TECSEventDerivedPtr<FCE_LocalPlayerForceFeedbackEffect>();

}
struct FCE_LocalPlayerForceFeedbackEffect : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    TSoftObjectPtr<UForceFeedbackEffect> ForceFeedbackEffect;
    UPROPERTY()
    FName Tag;
    UPROPERTY()
    bool bLooping;
    UPROPERTY()
    bool bIgnoreTimeDilation;
    UPROPERTY()
    bool bPlayWhilePaused;


}

