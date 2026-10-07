

struct FConfigVM_CloseScope : FConfigEUIModelBase
{
    UPROPERTY()
    bool bCloseOnClickOutside = true;
    UPROPERTY()
    bool bBlockPointerOutside = false;
    UPROPERTY()
    bool bCloseOnBack = false;
    UPROPERTY()
    bool bCloseOnlyOnPureBlank = false;
    UPROPERTY()
    bool bEnabled = true;


}

namespace __FVM_CloseScope_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CloseScope> __ModelContainer_Require_FVM_CloseScope(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CloseScope>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CloseScope(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CloseScope>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CloseScope>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CloseScope>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
