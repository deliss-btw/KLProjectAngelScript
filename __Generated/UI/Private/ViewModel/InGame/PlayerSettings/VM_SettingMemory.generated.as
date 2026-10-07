
namespace __FVM_SettingMemory_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_SettingMemory> __ModelContainer_Require_FVM_SettingMemory(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_SettingMemory>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_SettingMemory(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_SettingMemory>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_SettingMemory>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_SettingMemory>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
