
enum EMenuOperationFunction
{
    ExitGame,
    Unstuck,
    Feedback,
}

namespace FMenuCategorySettings
{
    const FMenuCategorySettings Empty = FMenuCategorySettings();

}
struct FMenuOperation
{
    UPROPERTY()
    FSoftBrush OperationIcon;
    UPROPERTY()
    FText OperationName;
    UPROPERTY()
    EMenuOperationFunction Function;


}

struct FMenuCategorySettings
{
    UPROPERTY()
    FText CategoryName;
    UPROPERTY()
    TArray<TDataObjectPtr<FMenuConfig>> MenuConfigs;
    UPROPERTY()
    TArray<FMenuOperation> MenuOperations;

    FMenuCategorySettings()
    {
        return;
    }
}

struct FMenuSettingsCache
{
    UPROPERTY()
    TMap<TDataObjectPtr<FMenuConfig>, int> MenuConfigToCategoryIndex;

    FMenuSettingsCache()
    {
        return;
    }
}

class UMenuSettings : UGameplaySettingsBase
{
    UPROPERTY()
    TArray<FMenuCategorySettings> MenuCategories;
    UPROPERTY()
    FEUIWidgetTag MenuBarWidget;
    UPROPERTY()
    UInputAction PrevMenuAction;
    UPROPERTY()
    UInputAction NextMenuAction;

    UMenuSettings()
    {
        return;
    }
    UFUNCTION()
    FInstancedStruct ComputeCacheData_Implementation() const
    {
        FMenuSettingsCache local_20;
        int local_21 = 0;
        for (; local_21 < this.MenuCategories.Num(); ++local_21)
        {
            for (auto& local_38 : this.MenuCategories[local_21].MenuConfigs)
            {
                local_20.MenuConfigToCategoryIndex.Add(local_38, local_21);
            }
        }
        return FInstancedStruct::Make(local_20);
    }
    int GetBelongingCategoryIndex(const TDataObjectPtr<FMenuConfig> &inout MenuConfig) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
    }
}

