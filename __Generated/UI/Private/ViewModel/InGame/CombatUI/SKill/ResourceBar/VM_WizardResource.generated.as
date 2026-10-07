
namespace __FVM_WizardSkillResourceStarItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_WizardSkillResourceStarItem> __ModelContainer_Require_FVM_WizardSkillResourceStarItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_WizardSkillResourceStarItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_WizardSkillResourceStarItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_WizardSkillResourceStarItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_WizardSkillResourceStarItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_WizardSkillResourceStarItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_WizardSkillResource_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_WizardSkillResource> __ModelContainer_Require_FVM_WizardSkillResource(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_WizardSkillResource>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_WizardSkillResource(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_WizardSkillResource>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_WizardSkillResource>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_WizardSkillResource>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
