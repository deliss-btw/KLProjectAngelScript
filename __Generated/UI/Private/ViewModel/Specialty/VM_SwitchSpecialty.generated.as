
namespace __FVM_SwitchSpecialty_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_SwitchSpecialty> __ModelContainer_Require_FVM_SwitchSpecialty(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_SwitchSpecialty>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_SwitchSpecialty(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_SwitchSpecialty>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_SwitchSpecialty>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_SwitchSpecialty>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
