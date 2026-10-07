

struct FConfigVM_CommonRewardList : FConfigEUIModelBase
{
    UPROPERTY()
    FText RewardDescriptionText;
    UPROPERTY()
    FText RewardTitleText;

    FConfigVM_CommonRewardList()
    {
        return;
    }
}

namespace __FVM_CommonRewardItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonRewardItem> __ModelContainer_Require_FVM_CommonRewardItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonRewardItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonRewardItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonRewardItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonRewardItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonRewardItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_CommonRewardList_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonRewardList> __ModelContainer_Require_FVM_CommonRewardList(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonRewardList>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonRewardList(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonRewardList>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonRewardList>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonRewardList>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
