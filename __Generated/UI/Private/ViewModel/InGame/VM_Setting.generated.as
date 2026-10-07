
namespace __FVMS_Setting_Helpers
{
UFUNCTION()
TEUIModelRef<FVMS_Setting> __ModelContainer_Require_FVMS_Setting(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVMS_Setting>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVMS_Setting(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVMS_Setting>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVMS_Setting>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVMS_Setting>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
