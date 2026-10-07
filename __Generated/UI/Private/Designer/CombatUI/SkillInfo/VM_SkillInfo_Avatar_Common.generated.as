
namespace __FVMS_SkillInfo_Avatar_Common_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_SkillInfo_Avatar_Common> __ModelContainer_Require_FVMS_SkillInfo_Avatar_Common(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_SkillInfo_Avatar_Common>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_SkillInfo_Avatar_Common(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_SkillInfo_Avatar_Common>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_SkillInfo_Avatar_Common>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_SkillInfo_Avatar_Common>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
