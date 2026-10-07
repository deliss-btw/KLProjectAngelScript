
namespace __FVMS_LinkSkillInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_LinkSkillInfo> __ModelContainer_Require_FVMS_LinkSkillInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_LinkSkillInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_LinkSkillInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_LinkSkillInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_LinkSkillInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_LinkSkillInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
