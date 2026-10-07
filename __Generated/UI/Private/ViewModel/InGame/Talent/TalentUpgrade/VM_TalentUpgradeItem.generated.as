
namespace __FVM_TalentUpgradeItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TalentUpgradeItem> __ModelContainer_Require_FVM_TalentUpgradeItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TalentUpgradeItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TalentUpgradeItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TalentUpgradeItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TalentUpgradeItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TalentUpgradeItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
