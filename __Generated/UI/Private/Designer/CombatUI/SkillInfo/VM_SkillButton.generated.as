
namespace __FVM_SkillButton_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_SkillButton> __ModelContainer_Require_FVM_SkillButton(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_SkillButton>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_SkillButton(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_SkillButton>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_SkillButton>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_SkillButton>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
