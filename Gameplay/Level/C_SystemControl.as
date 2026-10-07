
namespace __INTENRAL_FCE_LBPDisableSystemControl_NS
{
    const TECSEventDerivedPtr<FCE_LBPDisableSystemControl> DerivedPtr = TECSEventDerivedPtr<FCE_LBPDisableSystemControl>();
}
namespace __INTENRAL_FCE_LBPEnableSystemControl_NS
{
    const TECSEventDerivedPtr<FCE_LBPEnableSystemControl> DerivedPtr = TECSEventDerivedPtr<FCE_LBPEnableSystemControl>();

}
struct FCE_LBPDisableSystemControl : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    uint SystemDataId;
    UPROPERTY()
    FString ForbiddenTips;


}

struct FCE_LBPEnableSystemControl : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    uint SystemDataId;


}

