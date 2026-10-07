

struct FConfigVM_MissionMainPanel : FConfigEUIModelBase
{
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> SingleMissionEntryWidgetClass;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> ChapterMissionEntryWidgetClass;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> ChapterEntryWidgetClass;
    UPROPERTY()
    FText RecommendLevelWarningFormat;
    UPROPERTY()
    TMap<EMissionTabType, FMissionTabInfo> MissionTabConfigMap;

    FConfigVM_MissionMainPanel()
    {
        return;
    }
}

namespace __FVM_MissionMainPanel_Helpers
{
UFUNCTION()
TEUIModelRef<FVM_MissionMainPanel> __ModelContainer_Require_FVM_MissionMainPanel(const FEUIModelContainer &inout Container)
{
    return TEUIModelRef<FVM_MissionMainPanel>(FEUIModelContainer::RequireModel(Container).opCall());
}
UFUNCTION()
void __ModelContainer_RequireArray_FVM_MissionMainPanel(const TArray<FEUIModelContainer> &inout ContainerArray, TArray<TEUIModelRef<FVM_MissionMainPanel>> &out OutModelArray)
{
    TArray<TEUIModelRef<FVM_MissionMainPanel>> local_4;
    OutModelArray = local_4;
    for (auto& local_20 : ContainerArray)
    {
        OutModelArray.Add(TEUIModelRef<FVM_MissionMainPanel>(FEUIModelContainer::RequireModel(local_20).opCall()));
    }
    return;
}
}
