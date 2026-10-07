
namespace __FVM_MarkInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MarkInfo> __ModelContainer_Require_FVM_MarkInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MarkInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MarkInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MarkInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MarkInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MarkInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
