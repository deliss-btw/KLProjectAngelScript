
namespace __FVM_StaminaBar_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_StaminaBar> __ModelContainer_Require_FVM_StaminaBar(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_StaminaBar>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_StaminaBar(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_StaminaBar>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_StaminaBar>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_StaminaBar>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
