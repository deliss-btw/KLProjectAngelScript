
namespace __FVM_TraitSourceInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TraitSourceInfo> __ModelContainer_Require_FVM_TraitSourceInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TraitSourceInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TraitSourceInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TraitSourceInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TraitSourceInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TraitSourceInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_TraitInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TraitInfo> __ModelContainer_Require_FVM_TraitInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TraitInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TraitInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TraitInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TraitInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TraitInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
