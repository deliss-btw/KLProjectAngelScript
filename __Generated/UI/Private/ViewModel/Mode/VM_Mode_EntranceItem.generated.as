

struct FConfigVM_Mode_EntranceItem : FConfigEUIModelBase
{
    UPROPERTY()
    FGameplayTag RedDotEntranceTag;

    FConfigVM_Mode_EntranceItem()
    {
        return;
    }
}

namespace __FVM_Mode_EntranceItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_Mode_EntranceItem> __ModelContainer_Require_FVM_Mode_EntranceItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_Mode_EntranceItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_Mode_EntranceItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_Mode_EntranceItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_Mode_EntranceItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_Mode_EntranceItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
