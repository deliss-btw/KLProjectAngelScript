

struct FConfigVM_DivineSkillSettings : FConfigEUIModelBase
{
    UPROPERTY()
    FLinearColor NotSuitTintColor;

    FConfigVM_DivineSkillSettings()
    {
        return;
    }
}

namespace __FVM_DivineSkillSettings_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_DivineSkillSettings> __ModelContainer_Require_FVM_DivineSkillSettings(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_DivineSkillSettings>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_DivineSkillSettings(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_DivineSkillSettings>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_DivineSkillSettings>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_DivineSkillSettings>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
