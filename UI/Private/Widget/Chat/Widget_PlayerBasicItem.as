
namespace UWidget_PlayerBasicItem
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_PlayerBasicItem : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_PlayerBasicItem> PlayerBasicItem;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_PlayerBasicItemExtend> PlayerBasicItemExtend;
    UPROPERTY()
    bool bCanTriggerClick = true;
    UPROPERTY()
    FGetEUIModelRef PlayerBasicItemDelegate;
    UPROPERTY()
    FGetEUIModelRef PlayerBasicItemExtendDelegate;


    UFUNCTION()
    void OnPlayerBasicItemClicked()
    {
        int local_14;
        XLog(ELog(74), FString().Append("OnPlayerBasicItemClicked: ").Append(GetPlayerUID()));
        if (!(this.bCanTriggerClick))
        {
            return;
        }
        if (!((this.GetOwningLocalPlayer() != nullptr)) || !(this.PlayerBasicItem))
        {
            return;
        }
        local_14 = GetPlayerUID();
        if (local_14 == 0)
        {
            return;
        }
        FEUIMessageBus::PublishWithWidgetReferencedModels(EUIMessageBus);
        FMsg_OpenPlayerBasicInfo local_20;
        local_20.PlayerUid = local_14;
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.PlayerBasicItem.Initialize(this, FName("VM_PlayerBasicItem"), EEUIWidgetRefModelCreationType(0), false);
        this.PlayerBasicItemExtend.Initialize(this, FName("VM_PlayerBasicItemExtend"), EEUIWidgetRefModelCreationType(0), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PlayerBasicItemDelegate.IsBound())
        {
            this.PlayerBasicItem.SetRef(this.PlayerBasicItemDelegate.Execute());
        }
        if (this.PlayerBasicItemExtendDelegate.IsBound())
        {
            this.PlayerBasicItemExtend.SetRef(this.PlayerBasicItemExtendDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_PlayerBasicItem
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
