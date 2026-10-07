
namespace __FVM_TalentUpgradeFormulaTree_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TalentUpgradeFormulaTree> __ModelContainer_Require_FVM_TalentUpgradeFormulaTree(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TalentUpgradeFormulaTree>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TalentUpgradeFormulaTree(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TalentUpgradeFormulaTree>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TalentUpgradeFormulaTree>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TalentUpgradeFormulaTree>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
