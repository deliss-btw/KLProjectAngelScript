

struct FOnMinimapMarkOptionSelected : FEUIModelEvent
{
    FEUIModelEvent _base_FEUIModelEvent;

    FOnMinimapMarkOptionSelected()
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

namespace __FVM_MinimapMarkDialogOption_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MinimapMarkDialogOption> __ModelContainer_Require_FVM_MinimapMarkDialogOption(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MinimapMarkDialogOption>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MinimapMarkDialogOption(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MinimapMarkDialogOption>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MinimapMarkDialogOption>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MinimapMarkDialogOption>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_MinimapMarkDialog_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MinimapMarkDialog> __ModelContainer_Require_FVM_MinimapMarkDialog(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MinimapMarkDialog>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MinimapMarkDialog(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MinimapMarkDialog>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MinimapMarkDialog>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MinimapMarkDialog>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
