
namespace __FVM_CommonDisplayDetail_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonDisplayDetail> __ModelContainer_Require_FVM_CommonDisplayDetail(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonDisplayDetail>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonDisplayDetail(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonDisplayDetail>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonDisplayDetail>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonDisplayDetail>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
