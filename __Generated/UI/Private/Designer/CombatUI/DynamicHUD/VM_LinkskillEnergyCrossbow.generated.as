
namespace __FVMS_LinkSkillEnergyCrossbow_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_LinkSkillEnergyCrossbow> __ModelContainer_Require_FVMS_LinkSkillEnergyCrossbow(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_LinkSkillEnergyCrossbow>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_LinkSkillEnergyCrossbow(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_LinkSkillEnergyCrossbow>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_LinkSkillEnergyCrossbow>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_LinkSkillEnergyCrossbow>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
