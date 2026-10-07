
namespace __FVM_TeamMemberPrepareItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TeamMemberPrepareItem> __ModelContainer_Require_FVM_TeamMemberPrepareItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TeamMemberPrepareItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TeamMemberPrepareItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TeamMemberPrepareItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TeamMemberPrepareItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TeamMemberPrepareItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
