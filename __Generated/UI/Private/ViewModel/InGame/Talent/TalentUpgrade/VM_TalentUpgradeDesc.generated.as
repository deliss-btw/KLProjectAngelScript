
namespace __FVM_TalentUpgradeDesc_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TalentUpgradeDesc> __ModelContainer_Require_FVM_TalentUpgradeDesc(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TalentUpgradeDesc>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TalentUpgradeDesc(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TalentUpgradeDesc>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TalentUpgradeDesc>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TalentUpgradeDesc>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
