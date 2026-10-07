
namespace __FVM_GuideGroupDetail_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_GuideGroupDetail> __ModelContainer_Require_FVM_GuideGroupDetail(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_GuideGroupDetail>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_GuideGroupDetail(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_GuideGroupDetail>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_GuideGroupDetail>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_GuideGroupDetail>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
