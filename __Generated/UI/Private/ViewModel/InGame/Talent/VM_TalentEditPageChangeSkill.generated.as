
namespace __FVM_TalentEditPageChangeSkill_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TalentEditPageChangeSkill> __ModelContainer_Require_FVM_TalentEditPageChangeSkill(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TalentEditPageChangeSkill>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TalentEditPageChangeSkill(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TalentEditPageChangeSkill>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TalentEditPageChangeSkill>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TalentEditPageChangeSkill>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
