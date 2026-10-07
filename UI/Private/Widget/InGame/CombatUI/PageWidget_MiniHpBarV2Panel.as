
namespace UPageWidget_MiniHpBarV2Panel
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UPageWidget_MiniHpBarV2Panel : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_MiniHpBarV2Panel> MiniHpBarPanel;

    UPageWidget_MiniHpBarV2Panel()
    {
        return;
    }
    UFUNCTION()
    TArray<FECSEntity> MiniHpBarPanel_Entities() const
    {
        FVMS_MiniHpBarV2Panel& local_2;
        TArray<FECSEntity> local_12;
        if (local_2)
        {
            local_12 = local_2.GetEntities();
        }
        else
        {
            local_12 = TArray<FECSEntity>();
        }
        return local_12;
    }
    UFUNCTION()
    ESlateVisibility MiniHpBarPanel_MiniHpBarV2Visibility() const
    {
        FVMS_MiniHpBarV2Panel& local_2;
        int local_5;
        if (local_2)
        {
            local_5 = int(local_2.MiniHpBarV2Visibility());
        }
        else
        {
            local_5 = 0;
        }
        return ESlateVisibility(local_5);
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.MiniHpBarPanel.Initialize(this, FName("VMS_MiniHpBarV2Panel"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UPageWidget_MiniHpBarV2Panel
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    return;
}
FEUIWidgetRef CreateWidget(const APlayerController OwningPlayer, const TSoftClassPtr<UEUIUserWidget> &inout WidgetClass)
{
    return FEUIWidget::CreateWidget(OwningPlayer.GetLocalPlayer(), WidgetClass);
}
FEUIWidgetRef AddWidget(const APlayerController OwningPlayer, const FGameplayTag &inout WidgetTag)
{
    return FEUIWidget::AddWidget(OwningPlayer.GetLocalPlayer(), WidgetTag);
}
}
