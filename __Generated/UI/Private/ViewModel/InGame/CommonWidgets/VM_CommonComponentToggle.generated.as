

struct FOnCommonComponentToggleSelected : FEUIModelEvent
{
    FEUIModelEvent _base_FEUIModelEvent;

    FOnCommonComponentToggleSelected()
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

namespace __FVM_CommonComponentToggle_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonComponentToggle> __ModelContainer_Require_FVM_CommonComponentToggle(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonComponentToggle>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonComponentToggle(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonComponentToggle>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonComponentToggle>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonComponentToggle>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
