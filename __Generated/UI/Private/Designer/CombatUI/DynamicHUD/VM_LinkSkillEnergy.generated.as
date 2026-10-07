
namespace __FVM_LinkSkillEnergy_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_LinkSkillEnergy> __ModelContainer_Require_FVM_LinkSkillEnergy(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_LinkSkillEnergy>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_LinkSkillEnergy(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_LinkSkillEnergy>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_LinkSkillEnergy>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_LinkSkillEnergy>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
