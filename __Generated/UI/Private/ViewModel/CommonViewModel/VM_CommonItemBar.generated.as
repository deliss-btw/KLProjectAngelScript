

struct FConfigVM_CommonItemBar : FConfigEUIModelBase
{
    UPROPERTY()
    bool bEnableClickLock = false;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> ItemConfig;


}

namespace __FVM_CommonItemBar_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonItemBar> __ModelContainer_Require_FVM_CommonItemBar(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonItemBar>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonItemBar(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonItemBar>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonItemBar>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonItemBar>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
