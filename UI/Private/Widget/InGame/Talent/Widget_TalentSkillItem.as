
namespace UWidget_TalentSkillItem
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_TalentSkillItem : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SelectableItem> SelectableItem;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TalentEditSkillBtn> SkillIcon;
    UPROPERTY()
    bool bTypeNameVisible = true;
    UPROPERTY()
    UWidget w_switcher_key;
    UPROPERTY()
    USizeBox w_size_Icon;
    UPROPERTY()
    UWidget w_spacer_large;
    UPROPERTY()
    bool bNeedBigIconState = true;
    FEUIModelWeakRef __SkillIcon;
    UPROPERTY()
    FGetEUIModelRef SelectableItemDelegate;
    UPROPERTY()
    FGetEUIModelRef SkillIconDelegate;


    UFUNCTION()
    void PreConstruct_Implementation(const bool IsDesignTime)
    {
        int local_2;
        if (this.bTypeNameVisible)
        {
            int local_3;
            local_3 = 0;
            local_2 = local_3;
        }
        else
        {
            int local_3;
            local_3 = 1;
            local_2 = local_3;
        }
        this.w_switcher_key.SetVisibility(ESlateVisibility(local_2));
        return;
    }
    UFUNCTION()
    void OnSkillBtnBigStateChanged()
    {
        if ((this.w_size_Icon != nullptr && ((this.w_spacer_large != nullptr))))
        {
            if (this.bNeedBigIconState && GetbIsBigButton())
            {
                this.w_size_Icon.SetHeightOverride(120.0f);
                this.w_size_Icon.SetWidthOverride(120.0f);
                this.w_spacer_large.SetVisibility(ESlateVisibility(0));
                return;
            }
            this.w_size_Icon.SetHeightOverride(96.0f);
            this.w_size_Icon.SetWidthOverride(96.0f);
            this.w_spacer_large.SetVisibility(ESlateVisibility(1));
        }
        return;
    }
    UFUNCTION()
    void SkillIcon_OnAvatarSkillDetialSelect() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void SkillIcon_OnUpdateSkillSellectType() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_TalentEditSkillBtn& local_6;
        TEUIModelRef<FVM_TalentEditSkillBtn> local_2 = this.SkillIcon.AsRef();
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
                    this.SkillIcon.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_TalentEditSkillBtn::__IndexOf_bIsBigButton());
                    }
                    if (local_6)
                    {
                        this.OnSkillBtnBigStateChanged();
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
                XError(ELog(17), "Remaining observed model change: OnSkillBtnBigStateChanged");
            }
            return;
        }
        this.__SkillIcon = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SelectableItem.Initialize(this, FName("VM_SelectableItem"), EEUIWidgetRefModelCreationType(0), false);
        this.SkillIcon.Initialize(this, FName("VM_TalentEditSkillBtn"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SelectableItemDelegate.IsBound())
        {
            this.SelectableItem.SetRef(this.SelectableItemDelegate.Execute());
        }
        if (this.SkillIconDelegate.IsBound())
        {
            this.SkillIcon.SetRef(this.SkillIconDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TalentSkillItem
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSkillBtnBigStateChanged"));
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
