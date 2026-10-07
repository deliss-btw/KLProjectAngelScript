
namespace __FVM_MailBriefItem_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MailBriefItem> __ModelContainer_Require_FVM_MailBriefItem(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MailBriefItem>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MailBriefItem(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MailBriefItem>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MailBriefItem>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MailBriefItem>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
