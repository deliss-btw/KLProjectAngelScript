
namespace __FVM_Qiong_BuffTip_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_Qiong_BuffTip> __ModelContainer_Require_FVM_Qiong_BuffTip(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_Qiong_BuffTip>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_Qiong_BuffTip(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_Qiong_BuffTip>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_Qiong_BuffTip>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_Qiong_BuffTip>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
