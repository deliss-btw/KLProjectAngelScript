

struct FCommonItemClicked : FEUIModelEvent
{
    FEUIModelEvent _base_FEUIModelEvent;

    FCommonItemClicked()
    {
        FEUIModelEvent local_22 = FEUIModelEvent("", "");
        return;
    }
    void Broadcast() const
    {
        Z__CastTemplate local_4;
        local_4.opCall().Broadcast();
        return;
    }
}

namespace __FVM_CommonItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonItem> __ModelContainer_Require_FVM_CommonItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
