
namespace __FVM_MatchSwitchConfirm_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MatchSwitchConfirm> __ModelContainer_Require_FVM_MatchSwitchConfirm(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MatchSwitchConfirm>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MatchSwitchConfirm(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MatchSwitchConfirm>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MatchSwitchConfirm>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MatchSwitchConfirm>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_MatchRecruitConfirm_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MatchRecruitConfirm> __ModelContainer_Require_FVM_MatchRecruitConfirm(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MatchRecruitConfirm>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MatchRecruitConfirm(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MatchRecruitConfirm>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MatchRecruitConfirm>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MatchRecruitConfirm>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
