
namespace __FVM_StigmataGifts_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_StigmataGifts> __ModelContainer_Require_FVM_StigmataGifts(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_StigmataGifts>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_StigmataGifts(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_StigmataGifts>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_StigmataGifts>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_StigmataGifts>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
