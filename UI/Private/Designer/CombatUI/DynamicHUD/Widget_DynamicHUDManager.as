
namespace UWidget_DynamicHUDManager
{
    const int ViewID = 0;

}
class UWidget_DynamicHUDManager : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_DynamicHUDManager> DynamicHUDManager;

    UWidget_DynamicHUDManager()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        return;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> DynamicHUDManager_SelectTargetModelArray() const
    {
        FVMS_DynamicHUDManager& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetSelectTargetModelArray());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.DynamicHUDManager.Initialize(this, FName("VMS_DynamicHUDManager"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_DynamicHUDManager
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
