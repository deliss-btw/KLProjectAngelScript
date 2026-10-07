
namespace __FVM_TalentUpgradeInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TalentUpgradeInfo> __ModelContainer_Require_FVM_TalentUpgradeInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TalentUpgradeInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TalentUpgradeInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TalentUpgradeInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TalentUpgradeInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TalentUpgradeInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
