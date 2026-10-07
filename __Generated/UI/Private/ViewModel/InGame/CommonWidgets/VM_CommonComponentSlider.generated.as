

struct FOnCommonComponentSliderSelected : FEUIModelEvent
{
    FEUIModelEvent _base_FEUIModelEvent;

    FOnCommonComponentSliderSelected()
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

namespace __FVM_CommonComponentSlider_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonComponentSlider> __ModelContainer_Require_FVM_CommonComponentSlider(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonComponentSlider>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonComponentSlider(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonComponentSlider>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonComponentSlider>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonComponentSlider>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
