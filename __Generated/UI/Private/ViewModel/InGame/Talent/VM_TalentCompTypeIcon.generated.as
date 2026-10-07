
namespace __FVM_TalentDivisionTypeIcon_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TalentDivisionTypeIcon> __ModelContainer_Require_FVM_TalentDivisionTypeIcon(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TalentDivisionTypeIcon>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TalentDivisionTypeIcon(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TalentDivisionTypeIcon>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TalentDivisionTypeIcon>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TalentDivisionTypeIcon>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
