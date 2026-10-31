struct FOnCommonDropdownSelected : FEUIModelEvent
{
    FEUIModelEvent _base_FEUIModelEvent = FEUIModelEvent("", "int32");

    FOnCommonDropdownSelected()
    {
        return;
    }
    void Broadcast(const int Arg0) const
    {
        Z__CastTemplate local_4;
        local_4.opCall().Broadcast(Arg0);
        return;
    }
}

namespace __FVM_CommonDropdown_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CommonDropdown> __ModelContainer_Require_FVM_CommonDropdown(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CommonDropdown>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CommonDropdown(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CommonDropdown>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CommonDropdown>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CommonDropdown>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
