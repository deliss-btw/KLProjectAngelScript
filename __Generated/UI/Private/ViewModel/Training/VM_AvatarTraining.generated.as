
namespace __FVM_AvatarTraining_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AvatarTraining> __ModelContainer_Require_FVM_AvatarTraining(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AvatarTraining>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AvatarTraining(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AvatarTraining>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AvatarTraining>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AvatarTraining>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
