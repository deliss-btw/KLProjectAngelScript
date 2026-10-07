

struct FConfigVM_NavSampleList : FConfigEUIModelBase
{
    UPROPERTY()
    int InitialSelectedIndex;
    UPROPERTY()
    int ItemCount;


}

namespace __FVM_NavSampleListItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_NavSampleListItem> __ModelContainer_Require_FVM_NavSampleListItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_NavSampleListItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_NavSampleListItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_NavSampleListItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_NavSampleListItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_NavSampleListItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_NavSampleList_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_NavSampleList> __ModelContainer_Require_FVM_NavSampleList(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_NavSampleList>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_NavSampleList(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_NavSampleList>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_NavSampleList>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_NavSampleList>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
