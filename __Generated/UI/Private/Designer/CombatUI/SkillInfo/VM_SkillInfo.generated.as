
namespace __FVMS_SkillInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_SkillInfo> __ModelContainer_Require_FVMS_SkillInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_SkillInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_SkillInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_SkillInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_SkillInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_SkillInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
