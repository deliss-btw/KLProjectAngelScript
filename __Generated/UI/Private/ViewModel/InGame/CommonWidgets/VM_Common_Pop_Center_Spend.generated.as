

struct FConfigVM_Common_Pop_Center_Spend : FConfigEUIModelBase
{
    UPROPERTY()
    FText DescriptionText;
    UPROPERTY()
    FText ConfirmButtonText;
    UPROPERTY()
    FText CancelButtonText;
    UPROPERTY()
    bool bShowCancelButton = true;
    UPROPERTY()
    FText TitleText;


}

namespace __FVM_CommonPopCenterSpendItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonPopCenterSpendItem> __ModelContainer_Require_FVM_CommonPopCenterSpendItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonPopCenterSpendItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonPopCenterSpendItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonPopCenterSpendItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonPopCenterSpendItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonPopCenterSpendItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_Common_Pop_Center_Spend_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_Common_Pop_Center_Spend> __ModelContainer_Require_FVM_Common_Pop_Center_Spend(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_Common_Pop_Center_Spend>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_Common_Pop_Center_Spend(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_Common_Pop_Center_Spend>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_Common_Pop_Center_Spend>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_Common_Pop_Center_Spend>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
