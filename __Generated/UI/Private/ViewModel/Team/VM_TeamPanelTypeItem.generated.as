
namespace __FVM_TeamPanelTypeItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TeamPanelTypeItem> __ModelContainer_Require_FVM_TeamPanelTypeItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TeamPanelTypeItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TeamPanelTypeItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TeamPanelTypeItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TeamPanelTypeItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TeamPanelTypeItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
