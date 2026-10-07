
namespace __FVM_TalentSkillTypeBG_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TalentSkillTypeBG> __ModelContainer_Require_FVM_TalentSkillTypeBG(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TalentSkillTypeBG>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TalentSkillTypeBG(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TalentSkillTypeBG>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TalentSkillTypeBG>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TalentSkillTypeBG>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
