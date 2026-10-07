
namespace __FVM_TalentNodeHover_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TalentNodeHover> __ModelContainer_Require_FVM_TalentNodeHover(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TalentNodeHover>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TalentNodeHover(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TalentNodeHover>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TalentNodeHover>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TalentNodeHover>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
