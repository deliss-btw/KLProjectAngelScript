

struct FConfigVM_ThreeChooseOne : FConfigEUIModelBase
{
    UPROPERTY()
    float32 AutoClosePageDistance = 700.0f;


}

namespace __FVM_ThreeChooseOne_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ThreeChooseOne> __ModelContainer_Require_FVM_ThreeChooseOne(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ThreeChooseOne>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ThreeChooseOne(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ThreeChooseOne>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ThreeChooseOne>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ThreeChooseOne>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
