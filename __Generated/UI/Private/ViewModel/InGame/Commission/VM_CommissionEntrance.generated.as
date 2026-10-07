

struct FConfigVM_CommissionEntrance : FConfigEUIModelBase
{
    UPROPERTY()
    float32 LockedOpacity = 0.5f;


}

namespace __FVM_CommissionEntrance_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommissionEntrance> __ModelContainer_Require_FVM_CommissionEntrance(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommissionEntrance>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommissionEntrance(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommissionEntrance>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommissionEntrance>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommissionEntrance>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
