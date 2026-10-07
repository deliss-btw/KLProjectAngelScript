

struct FOnCommonComponentFilterSelected : FEUIModelEvent
{
    FEUIModelEvent _base_FEUIModelEvent;

    FOnCommonComponentFilterSelected()
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

namespace __FVM_CommonComponentFilter_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonComponentFilter> __ModelContainer_Require_FVM_CommonComponentFilter(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonComponentFilter>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonComponentFilter(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonComponentFilter>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonComponentFilter>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonComponentFilter>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
