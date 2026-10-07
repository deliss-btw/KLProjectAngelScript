
namespace __FVM_MailDetail_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MailDetail> __ModelContainer_Require_FVM_MailDetail(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MailDetail>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MailDetail(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MailDetail>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MailDetail>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MailDetail>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
