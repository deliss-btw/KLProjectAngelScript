

struct FConfigVM_GammaSlider : FConfigEUIModelBase
{
    UPROPERTY()
    float32 MinValue = 0.5f;
    UPROPERTY()
    float32 MaxValue = 5.0f;
    UPROPERTY()
    float32 DeadZone = 0.1f;
    UPROPERTY()
    float32 DefaultValue = 2.2f;


}

namespace __FVM_GammaSlider_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_GammaSlider> __ModelContainer_Require_FVM_GammaSlider(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_GammaSlider>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_GammaSlider(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_GammaSlider>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_GammaSlider>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_GammaSlider>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
