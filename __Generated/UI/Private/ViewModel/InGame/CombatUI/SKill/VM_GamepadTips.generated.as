
namespace __FVM_GamepadTips_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_GamepadTips> __ModelContainer_Require_FVM_GamepadTips(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_GamepadTips>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_GamepadTips(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_GamepadTips>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_GamepadTips>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_GamepadTips>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
