
namespace __FVM_TeamInvitationPage_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TeamInvitationPage> __ModelContainer_Require_FVM_TeamInvitationPage(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TeamInvitationPage>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TeamInvitationPage(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TeamInvitationPage>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TeamInvitationPage>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TeamInvitationPage>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
