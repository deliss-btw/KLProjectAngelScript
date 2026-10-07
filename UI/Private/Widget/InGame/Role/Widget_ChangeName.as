
namespace UWidget_ChangeName
{
    const int ViewID = 0;

}
class UWidget_ChangeName : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_ChangeName> ChangeName;
    UPROPERTY()
    UEditableTextBox EditableTextBox_PlayerName;
    UPROPERTY()
    UEUIButton Button_Confirm;
    FEUIModelWeakRef __ChangeName;

    UWidget_ChangeName()
    {
        return;
    }
    UFUNCTION()
    void OnInitialized_Implementation()
    {
        this.Button_Confirm.OnClicked.AddUFunction(this, n"OnConfirmButtonClicked");
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        FVMS_ChangeName local_2;
        this.EditableTextBox_PlayerName.SetText(FText::FromString(local_2.GetPlayerNameString()));
        return;
    }
    UFUNCTION()
    void OnConfirmButtonClicked()
    {
        FString local_14 = this.EditableTextBox_PlayerName.GetText().ToString();
        int local_15 = 20;
        int local_16 = local_14.Len();
        if (local_16 <= 0)
        {
            FCommonTipsParam local_22;
            ::CommonPopup::Tips(NSLOCTEXT("ChangeName", "ChangeName_NameShouldNotEmpty", "еђЌе­—дёЌиѓЅдёєз©є"), local_22);
            return;
        }
        if (local_16 > 20)
        {
            local_14 = local_14.Left(20);
        }
        FVMS_ChangeName local_2;
        local_2.RequestChangePlayerName(local_14);
        return;
    }
    UFUNCTION()
    void OnCloseByVM(const bool bShouldClose)
    {
        if (bShouldClose)
        {
            this.ClosePage(false);
        }
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVMS_ChangeName& local_6;
        TEUIModelRef<FVMS_ChangeName> local_2 = this.ChangeName.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            int local_57 = It.GetIndex();
            if (local_57 <= 0)
            {
                if (local_57 != 0)
                {
                }
                else
                {
                    this.ChangeName.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVMS_ChangeName::__IndexOf_bShouldClose());
                    }
                    if (local_6)
                    {
                        this.OnCloseByVM(local_6.GetbShouldClose());
                    }
                }
            }
            It.MarkCurrentClean();
            It.opPreInc();
        }
        if (It.ReachMax())
        {
            XError(ELog(17), "Observed model changes consume max.");
            if (It.IsDirty(0))
            {
                XError(ELog(17), "Remaining observed model change: OnCloseByVM");
            }
            return;
        }
        this.__ChangeName = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.ChangeName.Initialize(this, FName("VMS_ChangeName"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_ChangeName
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnCloseByVM"));
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
