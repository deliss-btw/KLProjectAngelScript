
namespace __FVM_TalentEditSkillBtn_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TalentEditSkillBtn> __ModelContainer_Require_FVM_TalentEditSkillBtn(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TalentEditSkillBtn>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TalentEditSkillBtn(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TalentEditSkillBtn>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TalentEditSkillBtn>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TalentEditSkillBtn>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
