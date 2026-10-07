

struct FConfigVM_MenuPage : FConfigEUIModelBase
{
    UPROPERTY()
    TDataObjectPtr<FMenuConfig> MenuConfig;

    FConfigVM_MenuPage()
    {
        return;
    }
}

namespace __FVM_MenuPage_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MenuPage> __ModelContainer_Require_FVM_MenuPage(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MenuPage>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MenuPage(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MenuPage>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MenuPage>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MenuPage>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
