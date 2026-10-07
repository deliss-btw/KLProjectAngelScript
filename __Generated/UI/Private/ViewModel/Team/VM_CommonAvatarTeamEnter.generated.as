
namespace __FVM_CommonAvatarTeamEnterItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonAvatarTeamEnterItem> __ModelContainer_Require_FVM_CommonAvatarTeamEnterItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonAvatarTeamEnterItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonAvatarTeamEnterItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonAvatarTeamEnterItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonAvatarTeamEnterItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonAvatarTeamEnterItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_CommonAvatarTeamEnter_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonAvatarTeamEnter> __ModelContainer_Require_FVM_CommonAvatarTeamEnter(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonAvatarTeamEnter>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonAvatarTeamEnter(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonAvatarTeamEnter>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonAvatarTeamEnter>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonAvatarTeamEnter>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
