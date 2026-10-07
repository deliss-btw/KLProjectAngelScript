
namespace __FVM_EcosimAIQuestIcon_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_EcosimAIQuestIcon> __ModelContainer_Require_FVM_EcosimAIQuestIcon(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_EcosimAIQuestIcon>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_EcosimAIQuestIcon(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_EcosimAIQuestIcon>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_EcosimAIQuestIcon>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_EcosimAIQuestIcon>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
