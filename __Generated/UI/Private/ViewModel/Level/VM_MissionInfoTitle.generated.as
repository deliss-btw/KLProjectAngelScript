
namespace __FVM_MissionInfoTitle_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MissionInfoTitle> __ModelContainer_Require_FVM_MissionInfoTitle(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MissionInfoTitle>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MissionInfoTitle(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MissionInfoTitle>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MissionInfoTitle>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MissionInfoTitle>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
