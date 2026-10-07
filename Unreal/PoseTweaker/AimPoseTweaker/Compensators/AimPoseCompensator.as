
enum EAimPoseCompensateMethod
{
    RotationRestore,
    TwoBoneIK,
    RotationPropagate,
    RollFromAngularVelocity,
    TwistSmooth,
}


struct FAimPoseCompensatorExecContext
{
    UPROPERTY()
    float32 DeltaTime = 0.0f;


}

UCLASS(Abstract)
class UAimPoseCompensator : UAimPoseBoneProcessor
{
    UAimPoseCompensator()
    {
        super();
        return;
    }
    void InitFromConfig(const FAimPoseCompensatorConfig &inout Cfg, const bool ResetAttr)
    {
        this.CfgEnabled = Cfg.bEnabled;
        this.bEnabled = Cfg.bEnabled;
        this.Order = int(Cfg.Order);
        this.bEnableDebugDraw = Cfg.bEnableDebugDraw;
        return;
    }
    void ApplyOverride(const FAimPoseCompensatorOverride &inout Ovr)
    {
        if (Ovr.GetbOverrideEnabled())
        {
            this.bEnabled = Ovr.GetbEnabled();
        }
        if (Ovr.GetbOverrideWeight())
        {
            this.Weight = Ovr.GetWeight();
        }
        return;
    }
    void OnInitializeBoneRefs(const USkeletalPoseTweaker Tweaker)
    {
        return;
    }
    void Snapshot()
    {
        return;
    }
    void Execute(const FAimPoseCompensatorExecContext &inout Ctx)
    {
        return;
    }
    void InitializeBoneRefs(const USkeletalPoseTweaker Tweaker)
    {
        this.OnInitializeBoneRefs(Tweaker);
        return;
    }
}

