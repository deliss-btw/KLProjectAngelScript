
namespace __FVM_CurrentDivineSkill_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CurrentDivineSkill> __ModelContainer_Require_FVM_CurrentDivineSkill(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CurrentDivineSkill>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CurrentDivineSkill(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CurrentDivineSkill>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CurrentDivineSkill>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CurrentDivineSkill>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
