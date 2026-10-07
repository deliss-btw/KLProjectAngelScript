
namespace __FVM_Image_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_Image> __ModelContainer_Require_FVM_Image(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_Image>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_Image(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_Image>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_Image>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_Image>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
