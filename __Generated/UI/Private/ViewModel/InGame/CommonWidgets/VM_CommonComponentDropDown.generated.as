

struct FOnCommonComponentDropDownSelected : FEUIModelEvent
{
    FEUIModelEvent _base_FEUIModelEvent;

    FOnCommonComponentDropDownSelected()
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

namespace __FVM_CommonComponentDropDown_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonComponentDropDown> __ModelContainer_Require_FVM_CommonComponentDropDown(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonComponentDropDown>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonComponentDropDown(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonComponentDropDown>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonComponentDropDown>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonComponentDropDown>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
