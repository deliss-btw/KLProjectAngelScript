

struct FConfigVM_RedDot : FConfigEUIModelBase
{
    UPROPERTY()
    int LimitDisplayCount = 99;


}

namespace __FVM_RedDot_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_RedDot> __ModelContainer_Require_FVM_RedDot(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_RedDot>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_RedDot(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_RedDot>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_RedDot>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_RedDot>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
