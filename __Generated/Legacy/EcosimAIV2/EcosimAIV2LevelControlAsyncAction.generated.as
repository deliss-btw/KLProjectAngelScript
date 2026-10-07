

class UASECSDelayActionTestWrapper : UECSAsyncActionBase
{
    UPROPERTY()
    FASECSDelayActionTest Action;
    UPROPERTY()
    float32 DelayTime = 3.0f;
    UPROPERTY()
    float32 DelayTime1 = 3.0f;
    UPROPERTY()
    FECSAsyncActionDelegate OnDelayFinished;
    UPROPERTY()
    FECSAsyncActionDelegate OnDelayFinished1;


    UFUNCTION()
    UScriptStruct GetAsyncActionClass_Implementation() const
    {
        return FASECSDelayActionTest;
    }
}

namespace FECSAsyncActionFactory_ASECSDelayActionTest
{
UASECSDelayActionTestWrapper MakeWrapper(const FASECSDelayActionTest &inout ActionData)
{
    return UASECSDelayActionTestWrapper.GetDefaultObject();
}
UFUNCTION()
UASECSDelayActionTestWrapper Init_float(const float32 InDelayTime)
{
    FASECSDelayActionTest local_18;
    local_18.Init(InDelayTime);
    return FECSAsyncActionFactory_ASECSDelayActionTest::MakeWrapper(local_18);
}
}
