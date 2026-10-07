
namespace __FVMS_LinkSkill_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_LinkSkill> __ModelContainer_Require_FVMS_LinkSkill(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_LinkSkill>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_LinkSkill(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_LinkSkill>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_LinkSkill>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_LinkSkill>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
