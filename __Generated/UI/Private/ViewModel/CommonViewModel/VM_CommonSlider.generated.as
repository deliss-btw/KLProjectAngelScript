

struct FOnCommonSliderRatioChanged : FEUIModelEvent
{
    FEUIModelEvent _base_FEUIModelEvent;

    FOnCommonSliderRatioChanged()
    {
        FEUIModelEvent local_22 = FEUIModelEvent("", "float");
        return;
    }
    void Broadcast(const float32 Arg0) const
    {
        Z__CastTemplate local_4;
        local_4.opCall().Broadcast(Arg0);
        return;
    }
}

namespace __FVM_CommonSlider_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonSlider> __ModelContainer_Require_FVM_CommonSlider(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonSlider>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonSlider(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonSlider>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonSlider>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonSlider>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
