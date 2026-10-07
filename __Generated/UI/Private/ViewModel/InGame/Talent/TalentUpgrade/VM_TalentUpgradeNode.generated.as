
namespace __FVM_TalentUpgradeNode_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TalentUpgradeNode> __ModelContainer_Require_FVM_TalentUpgradeNode(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TalentUpgradeNode>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TalentUpgradeNode(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TalentUpgradeNode>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TalentUpgradeNode>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TalentUpgradeNode>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
