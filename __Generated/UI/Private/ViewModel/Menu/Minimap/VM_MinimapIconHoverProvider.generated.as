
namespace __FVM_MinimapIconDecorator_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MinimapIconDecorator> __ModelContainer_Require_FVM_MinimapIconDecorator(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MinimapIconDecorator>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MinimapIconDecorator(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MinimapIconDecorator>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MinimapIconDecorator>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MinimapIconDecorator>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_MinimapIconHoverProvider_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MinimapIconHoverProvider> __ModelContainer_Require_FVM_MinimapIconHoverProvider(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MinimapIconHoverProvider>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MinimapIconHoverProvider(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MinimapIconHoverProvider>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MinimapIconHoverProvider>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MinimapIconHoverProvider>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
