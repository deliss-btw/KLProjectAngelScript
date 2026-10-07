
namespace __FVM_TeamInvitationItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TeamInvitationItem> __ModelContainer_Require_FVM_TeamInvitationItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TeamInvitationItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TeamInvitationItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TeamInvitationItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TeamInvitationItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TeamInvitationItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
