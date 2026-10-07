

struct FClickedWithModelRef : FEUIModelDelegate
{
    FEUIModelDelegate _base_FEUIModelDelegate;

    FClickedWithModelRef()
    {
        FEUIModelDelegate local_26 = FEUIModelDelegate("bool", "FEUIModelRef");
        return;
    }
    bool Execute(const FEUIModelRef &inout Arg0) const
    {
        Z__CastTemplate local_4;
        return local_4.opCall().Execute(Arg0);
    }
    bool ExecuteIfBound(const FEUIModelRef &inout Arg0, bool &inout OutResult) const
    {
        Z__CastTemplate local_4;
        return local_4.opCall().ExecuteIfBound(Arg0, OutResult);
    }
}

namespace __FVM_Text_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_Text> __ModelContainer_Require_FVM_Text(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_Text>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_Text(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_Text>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_Text>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_Text>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_TitleAndDesc_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TitleAndDesc> __ModelContainer_Require_FVM_TitleAndDesc(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TitleAndDesc>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TitleAndDesc(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TitleAndDesc>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TitleAndDesc>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TitleAndDesc>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_TitleAndDescAndStatus_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TitleAndDescAndStatus> __ModelContainer_Require_FVM_TitleAndDescAndStatus(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TitleAndDescAndStatus>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TitleAndDescAndStatus(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TitleAndDescAndStatus>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TitleAndDescAndStatus>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
