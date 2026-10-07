

struct FConfigVM_CommonSideHintList : FConfigEUIModelBase
{
    UPROPERTY()
    int MaxDisplayNum = 3;
    UPROPERTY()
    ECommonSideHintListType SideHintListType;


}

namespace __FVM_CommonSideHintList_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonSideHintList> __ModelContainer_Require_FVM_CommonSideHintList(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonSideHintList>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonSideHintList(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonSideHintList>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonSideHintList>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonSideHintList>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_CommonSideHint_Large_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonSideHint_Large> __ModelContainer_Require_FVM_CommonSideHint_Large(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonSideHint_Large>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonSideHint_Large(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonSideHint_Large>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonSideHint_Large>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonSideHint_Large>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_CommonSideHint_Small_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonSideHint_Small> __ModelContainer_Require_FVM_CommonSideHint_Small(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonSideHint_Small>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonSideHint_Small(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonSideHint_Small>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonSideHint_Small>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonSideHint_Small>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
