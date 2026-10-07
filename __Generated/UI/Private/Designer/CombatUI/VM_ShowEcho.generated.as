
namespace __FVM_ShowEcho_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ShowEcho> __ModelContainer_Require_FVM_ShowEcho(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ShowEcho>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ShowEcho(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ShowEcho>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ShowEcho>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ShowEcho>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
