
namespace __FVM_QiongSkillResourceItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_QiongSkillResourceItem> __ModelContainer_Require_FVM_QiongSkillResourceItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_QiongSkillResourceItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_QiongSkillResourceItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_QiongSkillResourceItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_QiongSkillResourceItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_QiongSkillResourceItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_QiongSkillResource_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_QiongSkillResource> __ModelContainer_Require_FVM_QiongSkillResource(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_QiongSkillResource>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_QiongSkillResource(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_QiongSkillResource>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_QiongSkillResource>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_QiongSkillResource>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
