

struct FConfigVM_CurrencyBar : FConfigEUIModelBase
{
    UPROPERTY()
    TDataObjectPtr<FItemConfig> CurrencyItemConfig;

    FConfigVM_CurrencyBar()
    {
        return;
    }
}

namespace __FVM_CurrencyBar_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CurrencyBar> __ModelContainer_Require_FVM_CurrencyBar(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CurrencyBar>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CurrencyBar(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CurrencyBar>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CurrencyBar>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CurrencyBar>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
