

struct FConfigVM_GovReviewCharge : FConfigEUIModelBase
{
    UPROPERTY()
    TDataObjectPtr<FShopConfig> ShopConfig;

    FConfigVM_GovReviewCharge()
    {
        return;
    }
}

namespace __FVM_GovReviewCharge_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_GovReviewCharge> __ModelContainer_Require_FVM_GovReviewCharge(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_GovReviewCharge>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_GovReviewCharge(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_GovReviewCharge>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_GovReviewCharge>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_GovReviewCharge>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
