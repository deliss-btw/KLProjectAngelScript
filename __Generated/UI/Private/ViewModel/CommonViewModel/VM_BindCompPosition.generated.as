

struct FConfigVM_BindCompPosition : FConfigEUIModelBase
{
    UPROPERTY()
    bool bDebugDraw = false;
    UPROPERTY()
    FName TagName;


}

namespace __FVM_BindCompPosition_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_BindCompPosition> __ModelContainer_Require_FVM_BindCompPosition(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_BindCompPosition>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_BindCompPosition(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_BindCompPosition>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_BindCompPosition>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_BindCompPosition>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
