
namespace __FVM_SkillInfoItem_Monster_Test_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_SkillInfoItem_Monster_Test> __ModelContainer_Require_FVM_SkillInfoItem_Monster_Test(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_SkillInfoItem_Monster_Test>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_SkillInfoItem_Monster_Test(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_SkillInfoItem_Monster_Test>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_SkillInfoItem_Monster_Test>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_SkillInfoItem_Monster_Test>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
