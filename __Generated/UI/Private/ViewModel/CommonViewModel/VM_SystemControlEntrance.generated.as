

struct FConfigVM_SystemControlEntrance : FConfigEUIModelBase
{
    UPROPERTY()
    TDataObjectPtr<FSystemControlConfig> SystemControlConfig;
    UPROPERTY()
    FGameplayTag RedDotEntranceTag;
    UPROPERTY()
    FEUIWidgetTag PageTag;

    FConfigVM_SystemControlEntrance()
    {
        return;
    }
}

namespace __FVM_SystemControlEntrance_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_SystemControlEntrance> __ModelContainer_Require_FVM_SystemControlEntrance(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_SystemControlEntrance>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_SystemControlEntrance(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_SystemControlEntrance>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_SystemControlEntrance>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_SystemControlEntrance>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
