
namespace __FVM_CommonHoverContent_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonHoverContent> __ModelContainer_Require_FVM_CommonHoverContent(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonHoverContent>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonHoverContent(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonHoverContent>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonHoverContent>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonHoverContent>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_CommonHover_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonHover> __ModelContainer_Require_FVM_CommonHover(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonHover>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonHover(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonHover>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonHover>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonHover>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
