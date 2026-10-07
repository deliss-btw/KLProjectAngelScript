
namespace __FVM_CookTip_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CookTip> __ModelContainer_Require_FVM_CookTip(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CookTip>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CookTip(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CookTip>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CookTip>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CookTip>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
