
namespace __FVM_BornSelectSpecialty_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_BornSelectSpecialty> __ModelContainer_Require_FVM_BornSelectSpecialty(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_BornSelectSpecialty>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_BornSelectSpecialty(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_BornSelectSpecialty>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_BornSelectSpecialty>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_BornSelectSpecialty>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
