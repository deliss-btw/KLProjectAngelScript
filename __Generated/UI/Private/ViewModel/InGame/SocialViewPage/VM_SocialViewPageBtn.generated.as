
namespace __FVM_SocialViewPageBigBtn_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_SocialViewPageBigBtn> __ModelContainer_Require_FVM_SocialViewPageBigBtn(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_SocialViewPageBigBtn>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_SocialViewPageBigBtn(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_SocialViewPageBigBtn>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_SocialViewPageBigBtn>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_SocialViewPageBigBtn>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_SocialViewPageSmallBtn_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_SocialViewPageSmallBtn> __ModelContainer_Require_FVM_SocialViewPageSmallBtn(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_SocialViewPageSmallBtn>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_SocialViewPageSmallBtn(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_SocialViewPageSmallBtn>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_SocialViewPageSmallBtn>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_SocialViewPageSmallBtn>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
