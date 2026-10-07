

struct FConfigVM_SimpleLevelSequence : FConfigEUIModelBase
{
    UPROPERTY()
    float32 StopTime = 0.5f;
    UPROPERTY()
    bool bAutoPlay = false;
    UPROPERTY()
    ELevelSequenceVisibilityMode VisibilityMode = ELevelSequenceVisibilityMode(0);
    UPROPERTY()
    TSoftObjectPtr<ULevelSequence> LevelSequenceData;


}

namespace __FVM_SimpleLevelSequence_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_SimpleLevelSequence> __ModelContainer_Require_FVM_SimpleLevelSequence(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_SimpleLevelSequence>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_SimpleLevelSequence(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_SimpleLevelSequence>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_SimpleLevelSequence>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_SimpleLevelSequence>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
