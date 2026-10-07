
namespace __FVM_TalentEditPage_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TalentEditPage> __ModelContainer_Require_FVM_TalentEditPage(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TalentEditPage>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TalentEditPage(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TalentEditPage>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TalentEditPage>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TalentEditPage>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
