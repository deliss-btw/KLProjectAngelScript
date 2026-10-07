
namespace __FVM_RegionInfo_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_RegionInfo> __ModelContainer_Require_FVM_RegionInfo(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_RegionInfo>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_RegionInfo(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_RegionInfo>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_RegionInfo>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_RegionInfo>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVMS_Login_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_Login> __ModelContainer_Require_FVMS_Login(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_Login>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_Login(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_Login>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_Login>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_Login>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
