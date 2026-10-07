

struct FConfigVM_PVX_Match : FConfigEUIModelBase
{
    UPROPERTY()
    FText UnselectedCampusTips;
    UPROPERTY()
    FText OutOfOpenPeriodTips;
    UPROPERTY()
    FText DismatchTeamMemberCountTips;

    FConfigVM_PVX_Match()
    {
        return;
    }
}

namespace __FVM_PVX_Match_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_PVX_Match> __ModelContainer_Require_FVM_PVX_Match(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_PVX_Match>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_PVX_Match(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_PVX_Match>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_PVX_Match>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_PVX_Match>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
