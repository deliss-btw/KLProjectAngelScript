
namespace __FVM_GramherExclusiveSkill_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_GramherExclusiveSkill> __ModelContainer_Require_FVM_GramherExclusiveSkill(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_GramherExclusiveSkill>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_GramherExclusiveSkill(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_GramherExclusiveSkill>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_GramherExclusiveSkill>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_GramherExclusiveSkill>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_SwordExclusiveSkill_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_SwordExclusiveSkill> __ModelContainer_Require_FVM_SwordExclusiveSkill(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_SwordExclusiveSkill>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_SwordExclusiveSkill(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_SwordExclusiveSkill>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_SwordExclusiveSkill>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_SwordExclusiveSkill>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_WizardExclusiveSkill_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_WizardExclusiveSkill> __ModelContainer_Require_FVM_WizardExclusiveSkill(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_WizardExclusiveSkill>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_WizardExclusiveSkill(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_WizardExclusiveSkill>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_WizardExclusiveSkill>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_WizardExclusiveSkill>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_ShuijingExclusiveSkill_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_ShuijingExclusiveSkill> __ModelContainer_Require_FVM_ShuijingExclusiveSkill(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_ShuijingExclusiveSkill>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_ShuijingExclusiveSkill(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_ShuijingExclusiveSkill>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_ShuijingExclusiveSkill>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_ShuijingExclusiveSkill>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_QiongExclusiveSkill_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_QiongExclusiveSkill> __ModelContainer_Require_FVM_QiongExclusiveSkill(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_QiongExclusiveSkill>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_QiongExclusiveSkill(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_QiongExclusiveSkill>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_QiongExclusiveSkill>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_QiongExclusiveSkill>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
namespace __FVM_FakeCharacterProgress_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_FakeCharacterProgress> __ModelContainer_Require_FVM_FakeCharacterProgress(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_FakeCharacterProgress>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_FakeCharacterProgress(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_FakeCharacterProgress>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_FakeCharacterProgress>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_FakeCharacterProgress>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
