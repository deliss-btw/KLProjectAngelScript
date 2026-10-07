
namespace UWidget_RoleItem
{
    const int ViewID = 0;

}
class UWidget_RoleItem : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_RoleItem> Item;
    UPROPERTY()
    FGetEUIModelRef ItemDelegate;

    UWidget_RoleItem()
    {
        return;
    }
    UFUNCTION()
    ESlateVisibility Item_SlateVisibilitybIsSelected() const
    {
        FVM_RoleItem& local_2;
        int local_5;
        if (local_2)
        {
            local_5 = int(local_2.bIsSelectedAsSlateVisibility());
        }
        else
        {
            local_5 = 0;
        }
        return ESlateVisibility(local_5);
    }
    UFUNCTION()
    ESlateVisibility Item_SlateVisibilitybIsCurrent() const
    {
        FVM_RoleItem& local_2;
        int local_5;
        if (local_2)
        {
            local_5 = int(local_2.bIsCurrentAsSlateVisibility());
        }
        else
        {
            local_5 = 0;
        }
        return ESlateVisibility(local_5);
    }
    UFUNCTION()
    FText Item_AvatarName() const
    {
        FVM_RoleItem& local_2;
        FText local_16 = local_2 ? local_2.GetAvatarName() : FText();
        return local_16;
    }
    UFUNCTION()
    FSlateBrush Item_AvatarIcon() const
    {
        FVM_RoleItem& local_2;
        FSlateBrush local_136;
        if (local_2)
        {
            local_136 = local_2.GetAvatarIcon();
        }
        else
        {
            local_136 = FSlateBrush();
        }
        return local_136;
    }
    UFUNCTION()
    FSlateBrush Item_PlayerPowerIcon() const
    {
        FVM_RoleItem& local_2;
        FSlateBrush local_136 = local_2 ? local_2.GetPlayerPowerIcon() : FSlateBrush();
        return local_136;
    }
    UFUNCTION()
    FSlateBrush Item_PlayerTachie() const
    {
        FVM_RoleItem& local_2;
        FSlateBrush local_136 = local_2 ? local_2.GetPlayerTachie() : FSlateBrush();
        return local_136;
    }
    UFUNCTION()
    FText Item_PlayerIllustrate1() const
    {
        FVM_RoleItem& local_2;
        FText local_16 = local_2 ? local_2.GetPlayerIllustrate1() : FText();
        return local_16;
    }
    UFUNCTION()
    FText Item_PlayerIllustrate2() const
    {
        FVM_RoleItem& local_2;
        FText local_16 = local_2 ? local_2.GetPlayerIllustrate2() : FText();
        return local_16;
    }
    UFUNCTION()
    void Item_OnSelect() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Item.Initialize(this, FName("VM_RoleItem"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.ItemDelegate.IsBound())
        {
            this.Item.SetRef(this.ItemDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_RoleItem
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
