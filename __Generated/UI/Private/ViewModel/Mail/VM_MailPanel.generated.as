
namespace __FVM_MailPanel_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MailPanel> __ModelContainer_Require_FVM_MailPanel(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MailPanel>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MailPanel(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MailPanel>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MailPanel>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MailPanel>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
