
namespace __FVM_DynamicWidgetSelector_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_DynamicWidgetSelector> __ModelContainer_Require_FVM_DynamicWidgetSelector(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_DynamicWidgetSelector>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_DynamicWidgetSelector(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_DynamicWidgetSelector>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_DynamicWidgetSelector>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_DynamicWidgetSelector>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
