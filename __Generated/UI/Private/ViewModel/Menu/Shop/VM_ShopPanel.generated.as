

struct FConfigVM_ShopPanel : FConfigEUIModelBase
{
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> PopupClass;

    FConfigVM_ShopPanel()
    {
        return;
    }
}

namespace __FVM_ShopPanel_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ShopPanel> __ModelContainer_Require_FVM_ShopPanel(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ShopPanel>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ShopPanel(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ShopPanel>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ShopPanel>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ShopPanel>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
