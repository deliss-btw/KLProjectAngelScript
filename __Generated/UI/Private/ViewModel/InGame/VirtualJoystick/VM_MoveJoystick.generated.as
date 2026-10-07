

struct FConfigVM_MoveJoystick : FConfigEUIModelBase
{
    UPROPERTY()
    FVirtualJoystickConfig Config;

    FConfigVM_MoveJoystick()
    {
        return;
    }
}

namespace __FVM_MoveJoystick_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MoveJoystick> __ModelContainer_Require_FVM_MoveJoystick(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MoveJoystick>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MoveJoystick(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MoveJoystick>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MoveJoystick>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MoveJoystick>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
