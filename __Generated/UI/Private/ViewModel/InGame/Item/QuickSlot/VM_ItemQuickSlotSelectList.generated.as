
namespace __FVM_ItemQuickSlotSelectListEntry_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ItemQuickSlotSelectListEntry> __ModelContainer_Require_FVM_ItemQuickSlotSelectListEntry(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ItemQuickSlotSelectListEntry>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ItemQuickSlotSelectListEntry(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ItemQuickSlotSelectListEntry>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ItemQuickSlotSelectListEntry>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ItemQuickSlotSelectListEntry>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_ItemQuickSlotSelectList_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ItemQuickSlotSelectList> __ModelContainer_Require_FVM_ItemQuickSlotSelectList(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ItemQuickSlotSelectList>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ItemQuickSlotSelectList(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ItemQuickSlotSelectList>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ItemQuickSlotSelectList>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ItemQuickSlotSelectList>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
