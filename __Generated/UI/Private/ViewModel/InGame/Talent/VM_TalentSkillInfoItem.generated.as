
namespace __FVM_TalentSkillInfoItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TalentSkillInfoItem> __ModelContainer_Require_FVM_TalentSkillInfoItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TalentSkillInfoItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TalentSkillInfoItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TalentSkillInfoItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TalentSkillInfoItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TalentSkillInfoItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
