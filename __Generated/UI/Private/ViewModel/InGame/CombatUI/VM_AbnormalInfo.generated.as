
namespace __FVMS_AbnormalInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_AbnormalInfo> __ModelContainer_Require_FVMS_AbnormalInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_AbnormalInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_AbnormalInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_AbnormalInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_AbnormalInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_AbnormalInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
