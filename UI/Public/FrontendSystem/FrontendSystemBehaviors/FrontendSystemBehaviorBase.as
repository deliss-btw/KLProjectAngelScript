

UCLASS(Abstract)
class UFrontendSystemBehaviorBase : UObject
{
    UFrontendSystemBehaviorBase()
    {
        return;
    }
    bool ShouldCreateInstance() const
    {
        return false;
    }
    FInstancedStruct CreateInstance() const
    {
        return FInstancedStruct();
    }
    void OnEnter(const FFrontendSystemContext &inout Context, FInstancedStruct &inout BehaviorInstance) const
    {
        return;
    }
    void OnExit(const FFrontendSystemContext &inout Context, FInstancedStruct &inout BehaviorInstance) const
    {
        return;
    }
}

struct FFrontendSystemBehaviorInstance
{
    UPROPERTY()
    const UFrontendSystemBehaviorBase Behavior;

    FFrontendSystemBehaviorInstance()
    {
        return;
    }
}

