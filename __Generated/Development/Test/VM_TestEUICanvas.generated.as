

struct FConfigVM_TestEUICanvas : FConfigEUIModelBase
{
    UPROPERTY()
    int ConstructProperty;
    UPROPERTY()
    FSmallSideHintDataWithBuffStack SmallBuffSideHintData;
    UPROPERTY()
    FBuffHintDescParamItemListParam LargeBuffSideHintData;


}

namespace __FVM_TestEUICanvas_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TestEUICanvas> __ModelContainer_Require_FVM_TestEUICanvas(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TestEUICanvas>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TestEUICanvas(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TestEUICanvas>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TestEUICanvas>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TestEUICanvas>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
