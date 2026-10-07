
namespace __FVM_Teleporter_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_Teleporter> __ModelContainer_Require_FVM_Teleporter(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_Teleporter>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_Teleporter(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_Teleporter>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_Teleporter>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_Teleporter>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_TeleporterConfig_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_TeleporterConfig> __ModelContainer_Require_FVM_TeleporterConfig(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_TeleporterConfig>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_TeleporterConfig(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_TeleporterConfig>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_TeleporterConfig>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_TeleporterConfig>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
