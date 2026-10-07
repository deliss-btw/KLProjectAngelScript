
namespace __FVMS_SkillInfo_Avatar_PlayerWizard_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_SkillInfo_Avatar_PlayerWizard> __ModelContainer_Require_FVMS_SkillInfo_Avatar_PlayerWizard(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_SkillInfo_Avatar_PlayerWizard>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_SkillInfo_Avatar_PlayerWizard(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_SkillInfo_Avatar_PlayerWizard>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_SkillInfo_Avatar_PlayerWizard>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_SkillInfo_Avatar_PlayerWizard>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
