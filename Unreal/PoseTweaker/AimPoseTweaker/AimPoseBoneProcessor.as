

UCLASS(Abstract)
class UAimPoseBoneProcessor : UObject
{
    FName ProcessorName;
    int Order = 0;
    bool bEnabled = false;
    float32 Weight = 1.0f;
    bool bEnableDebugDraw = false;
    bool CfgEnabled = false;
    float32 CfgWeight = 1.0f;


    void ResetToConfigDefaults()
    {
        this.bEnabled = this.CfgEnabled;
        this.Weight = this.CfgWeight;
        return;
    }
    void DebugDraw(const USkeletalPoseTweaker Tweaker)
    {
        return;
    }
    void SetIdentity(const FName &inout InName, const int InOrder)
    {
        this.ProcessorName = InName;
        this.Order = InOrder;
        return;
    }
}

