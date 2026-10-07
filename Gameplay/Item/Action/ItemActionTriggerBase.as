

UCLASS(Abstract)
class UItemActionTriggerBase : UObject
{
    UItemActionTriggerBase()
    {
        return;
    }
    void Execute(const FItemActionSource &inout ActionSource) const
    {
        return;
    }
}

