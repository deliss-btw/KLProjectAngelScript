

struct FConfigVM_TaskPanel : FConfigEUIModelBase
{
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> TaskEntryWidgetClass;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> TaskGroupEntryWidgetClass;

    FConfigVM_TaskPanel()
    {
        return;
    }
}

namespace __FVM_TaskPanel_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TaskPanel> __ModelContainer_Require_FVM_TaskPanel(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TaskPanel>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TaskPanel(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TaskPanel>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TaskPanel>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TaskPanel>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
