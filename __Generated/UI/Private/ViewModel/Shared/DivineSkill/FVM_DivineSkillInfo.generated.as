
namespace __FVM_DivineSkillInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_DivineSkillInfo> __ModelContainer_Require_FVM_DivineSkillInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_DivineSkillInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_DivineSkillInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_DivineSkillInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_DivineSkillInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_DivineSkillInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
