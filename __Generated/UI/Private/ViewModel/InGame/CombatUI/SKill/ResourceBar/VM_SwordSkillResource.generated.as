
namespace __FVM_SwordSkillResourceItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_SwordSkillResourceItem> __ModelContainer_Require_FVM_SwordSkillResourceItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_SwordSkillResourceItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_SwordSkillResourceItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_SwordSkillResourceItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_SwordSkillResourceItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_SwordSkillResourceItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_SwordSkillResourcePoint_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_SwordSkillResourcePoint> __ModelContainer_Require_FVM_SwordSkillResourcePoint(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_SwordSkillResourcePoint>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_SwordSkillResourcePoint(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_SwordSkillResourcePoint>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_SwordSkillResourcePoint>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_SwordSkillResourcePoint>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_SwordSkillResource_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_SwordSkillResource> __ModelContainer_Require_FVM_SwordSkillResource(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_SwordSkillResource>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_SwordSkillResource(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_SwordSkillResource>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_SwordSkillResource>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_SwordSkillResource>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
