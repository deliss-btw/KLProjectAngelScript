

struct FConfigVM_MobilePageEntrance : FConfigEUIModelBase
{
    UPROPERTY()
    FGameplayTag RedDotEntranceTag;
    UPROPERTY()
    FEUIWidgetTag PageTag;

    FConfigVM_MobilePageEntrance()
    {
        return;
    }
}

namespace __FVM_MobilePageEntrance_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MobilePageEntrance> __ModelContainer_Require_FVM_MobilePageEntrance(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MobilePageEntrance>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MobilePageEntrance(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MobilePageEntrance>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MobilePageEntrance>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MobilePageEntrance>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
