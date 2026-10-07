
namespace __FVM_GramherSkillResourceItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_GramherSkillResourceItem> __ModelContainer_Require_FVM_GramherSkillResourceItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_GramherSkillResourceItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_GramherSkillResourceItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_GramherSkillResourceItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_GramherSkillResourceItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_GramherSkillResourceItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_GramherSkillResource_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_GramherSkillResource> __ModelContainer_Require_FVM_GramherSkillResource(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_GramherSkillResource>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_GramherSkillResource(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_GramherSkillResource>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_GramherSkillResource>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_GramherSkillResource>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
