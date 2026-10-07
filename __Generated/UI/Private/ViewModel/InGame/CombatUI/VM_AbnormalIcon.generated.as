
namespace __FVM_AbnormalIcon_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_AbnormalIcon> __ModelContainer_Require_FVM_AbnormalIcon(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_AbnormalIcon>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_AbnormalIcon(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_AbnormalIcon>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_AbnormalIcon>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_AbnormalIcon>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
