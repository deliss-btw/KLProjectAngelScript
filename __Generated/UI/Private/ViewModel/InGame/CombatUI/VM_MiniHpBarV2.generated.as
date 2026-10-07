
namespace __FVM_MiniHPBarV2_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MiniHPBarV2> __ModelContainer_Require_FVM_MiniHPBarV2(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MiniHPBarV2>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MiniHPBarV2(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MiniHPBarV2>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MiniHPBarV2>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MiniHPBarV2>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
