
namespace __FVM_TeamMemberConfirm_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TeamMemberConfirm> __ModelContainer_Require_FVM_TeamMemberConfirm(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TeamMemberConfirm>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TeamMemberConfirm(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TeamMemberConfirm>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TeamMemberConfirm>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TeamMemberConfirm>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
