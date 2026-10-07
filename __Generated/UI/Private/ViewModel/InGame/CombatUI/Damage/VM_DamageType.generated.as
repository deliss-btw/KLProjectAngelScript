
namespace __FVM_DamageType_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_DamageType> __ModelContainer_Require_FVM_DamageType(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_DamageType>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_DamageType(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_DamageType>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_DamageType>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_DamageType>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
