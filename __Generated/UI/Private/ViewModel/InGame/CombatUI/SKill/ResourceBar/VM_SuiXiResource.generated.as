
namespace __FVM_SuiXiSkillResource_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_SuiXiSkillResource> __ModelContainer_Require_FVM_SuiXiSkillResource(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_SuiXiSkillResource>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_SuiXiSkillResource(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_SuiXiSkillResource>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_SuiXiSkillResource>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_SuiXiSkillResource>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
