
namespace __FVMS_SkillInfo_Avatar_ShuiJing_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_SkillInfo_Avatar_ShuiJing> __ModelContainer_Require_FVMS_SkillInfo_Avatar_ShuiJing(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_SkillInfo_Avatar_ShuiJing>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_SkillInfo_Avatar_ShuiJing(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_SkillInfo_Avatar_ShuiJing>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_SkillInfo_Avatar_ShuiJing>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_SkillInfo_Avatar_ShuiJing>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
