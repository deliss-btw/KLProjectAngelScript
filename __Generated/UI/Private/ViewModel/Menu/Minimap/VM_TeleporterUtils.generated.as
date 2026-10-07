
namespace __FVM_TeleporterUtilsDelegateHelper_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TeleporterUtilsDelegateHelper> __ModelContainer_Require_FVM_TeleporterUtilsDelegateHelper(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TeleporterUtilsDelegateHelper>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TeleporterUtilsDelegateHelper(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TeleporterUtilsDelegateHelper>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TeleporterUtilsDelegateHelper>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TeleporterUtilsDelegateHelper>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_TeleporterUtils_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TeleporterUtils> __ModelContainer_Require_FVM_TeleporterUtils(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TeleporterUtils>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TeleporterUtils(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TeleporterUtils>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TeleporterUtils>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TeleporterUtils>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
