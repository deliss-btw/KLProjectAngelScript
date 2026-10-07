
namespace __FVM_PlayPiano_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_PlayPiano> __ModelContainer_Require_FVM_PlayPiano(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_PlayPiano>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_PlayPiano(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_PlayPiano>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_PlayPiano>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_PlayPiano>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
