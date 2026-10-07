

struct FConfigVM_InputContext : FConfigEUIModelBase
{
    UPROPERTY()
    TDataObjectPtr<FEnhancedInputContextConfig> InputContext;

    FConfigVM_InputContext()
    {
        return;
    }
}

namespace __FVM_InputContext_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_InputContext> __ModelContainer_Require_FVM_InputContext(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_InputContext>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_InputContext(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_InputContext>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_InputContext>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_InputContext>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
