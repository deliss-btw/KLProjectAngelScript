

UCLASS(Abstract)
class UItemActionConfig_Immediate : UItemActionConfigBase
{
    UItemActionConfig_Immediate()
    {
        super();
        return;
    }
    void OnExecutionStart(FItemActionRuntimeInfo &inout ActionInstance) const
    {
        if (Super::ExecutePayCost(ActionInstance))
        {
            Super::ExecuteFinish(ActionInstance);
            return;
        }
        Super::ExecuteFail(ActionInstance);
        return;
    }
}

