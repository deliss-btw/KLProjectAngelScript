
namespace __FVM_TalentUpgradeConfirm_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TalentUpgradeConfirm> __ModelContainer_Require_FVM_TalentUpgradeConfirm(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TalentUpgradeConfirm>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TalentUpgradeConfirm(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TalentUpgradeConfirm>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TalentUpgradeConfirm>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TalentUpgradeConfirm>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
