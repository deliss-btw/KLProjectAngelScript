

struct FVM_NavigationBarConfigDefault : FConfigEUIModelDefaultBase
{
    UPROPERTY()
    float32 DelayShowSeconds = 1.5f;


}

namespace __FVM_NavigationBar_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_NavigationBar> __ModelContainer_Require_FVM_NavigationBar(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_NavigationBar>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_NavigationBar(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_NavigationBar>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_NavigationBar>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_NavigationBar>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
