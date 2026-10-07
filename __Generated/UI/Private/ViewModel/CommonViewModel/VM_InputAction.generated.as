

struct FInputActionListCallback : FEUIModelEvent
{
    FEUIModelEvent _base_FEUIModelEvent;

    FInputActionListCallback()
    {
        FEUIModelEvent local_22 = FEUIModelEvent("", "int32");
        return;
    }
    void Broadcast(const int Arg0) const
    {
        Z__CastTemplate local_4;
        local_4.opCall().Broadcast();
        return;
    }
}

namespace __FVM_InputAction_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_InputAction> __ModelContainer_Require_FVM_InputAction(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_InputAction>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_InputAction(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_InputAction>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_InputAction>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_InputAction>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_InputActionList_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_InputActionList> __ModelContainer_Require_FVM_InputActionList(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_InputActionList>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_InputActionList(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_InputActionList>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_InputActionList>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_InputActionList>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
