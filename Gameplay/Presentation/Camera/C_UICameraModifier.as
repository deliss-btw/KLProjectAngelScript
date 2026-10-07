
namespace __INTENRAL_FCE_RequestStartCameraModifier_NS
{
    const TECSEventDerivedPtr<FCE_RequestStartCameraModifier> DerivedPtr = TECSEventDerivedPtr<FCE_RequestStartCameraModifier>();
}
namespace __INTENRAL_FCE_RequestStopCameraModifier_NS
{
    const TECSEventDerivedPtr<FCE_RequestStopCameraModifier> DerivedPtr = TECSEventDerivedPtr<FCE_RequestStopCameraModifier>();

}
struct FCE_RequestStartCameraModifier : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FName SourceIdentifier;
    UPROPERTY()
    TDataObjectPtr<FTPCameraModifierConfig> ModifierConfig;
    UPROPERTY()
    float32 OverrideEnterDuration = -1.0f;


    bool Validate() const
    {
        bool local_1 = !(this.SourceIdentifier.IsNone());
        if (!(local_1))
        {
            local_1 = false;
        }
        else
        {
            local_1 = this.ModifierConfig;
        }
        return local_1;
    }
}

struct FCE_RequestStopCameraModifier : FECSEvent
{
    FECSEvent _base_FECSEvent;
    UPROPERTY()
    FName SourceIdentifier;
    UPROPERTY()
    TDataObjectPtr<FTPCameraModifierConfig> ModifierConfig;
    UPROPERTY()
    float32 OverrideExitDuration = -1.0f;
    UPROPERTY()
    bool bWarnIfNotExists = true;


    bool Validate() const
    {
        bool local_1 = !(this.SourceIdentifier.IsNone());
        if (!(local_1))
        {
            local_1 = false;
        }
        else
        {
            local_1 = this.ModifierConfig;
        }
        return local_1;
    }
}

