
namespace __FVM_CookReadyHeadAvatar_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CookReadyHeadAvatar> __ModelContainer_Require_FVM_CookReadyHeadAvatar(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CookReadyHeadAvatar>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CookReadyHeadAvatar(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CookReadyHeadAvatar>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CookReadyHeadAvatar>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CookReadyHeadAvatar>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_CookReady_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_CookReady> __ModelContainer_Require_FVM_CookReady(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_CookReady>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_CookReady(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_CookReady>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_CookReady>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_CookReady>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
