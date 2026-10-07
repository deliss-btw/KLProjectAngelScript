
namespace __FVM_ChatUnReadTips_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ChatUnReadTips> __ModelContainer_Require_FVM_ChatUnReadTips(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ChatUnReadTips>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ChatUnReadTips(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ChatUnReadTips>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ChatUnReadTips>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ChatUnReadTips>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
