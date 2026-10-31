namespace UWidget_SearchFriendInput
{
    const int ViewID = 0;

}
class UWidget_SearchFriendInput : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SearchFriendInput> SearchFriendInput;
    UPROPERTY()
    UEditableTextBox EditInput;
    FEUIModelWeakRef __SearchFriendInput;
    UPROPERTY()
    FGetEUIModelRef SearchFriendInputDelegate;

    UWidget_SearchFriendInput()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.ClearSearchInput();
        return;
    }
    UFUNCTION()
    void OnAlreadyInputTextChanged()
    {
        if (!(this.SearchFriendInput.IsValid()) || (!((this.EditInput != nullptr))))
        {
            return;
        }
        this.EditInput.SetText(FText::FromString(this.SearchFriendInput.Get().GetAlreadyInputText()));
        return;
    }
    UFUNCTION()
    void OnShowSearchResultChanged(const bool bShowSearchResult)
    {
        if (!(this.SearchFriendInput.IsValid()) || (!((this.EditInput != nullptr))))
        {
            return;
        }
        if (bShowSearchResult)
        {
            this.RestoreSearchInputFocus();
        }
        return;
    }
    UFUNCTION()
    void OnInputTextChanged(const FText &inout Text)
    {
        this.CheckInputValid(Text.ToString());
        return;
    }
    UFUNCTION()
    void OnInputTextCommitted(const FText &in Text, const ETextCommit CommitMethod)
    {
        if (int(CommitMethod) == 1)
        {
            this.CheckInputValid(Text.ToString());
            this.OnSearchBtnClicked();
            this.RestoreSearchInputFocus();
        }
        return;
    }
    UFUNCTION()
    void OnSearchBtnClicked()
    {
        if (this.SearchFriendInput.IsValid())
        {
            this.SearchFriendInput.Get().OnBeginSearch();
        }
        return;
    }
    UFUNCTION()
    void OnClearBtnClicked()
    {
        this.ClearSearchInput();
        return;
    }
    void CheckInputValid(const FString &inout Input)
    {
        if (!(this.SearchFriendInput.IsValid()))
        {
            return;
        }
        this.SearchFriendInput.Get().ApplySearchInputFromEdit(Input);
        FString local_6 = FString(this.SearchFriendInput.Get().GetTempInputText());
        if ((!((local_6 == Input)) && ((this.EditInput != nullptr))))
        {
            this.EditInput.SetText(FText::FromString(local_6));
        }
        return;
    }
    void RestoreSearchInputFocus()
    {
        if (this.EditInput != nullptr && (int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer())) != 1))
        {
            this.RuleSetUserFocus(this.EditInput);
        }
        return;
    }
    void ClearSearchInput()
    {
        if (this.SearchFriendInput.IsValid())
        {
            this.SearchFriendInput.Get().ClearSearchResult();
            this.OnAlreadyInputTextChanged();
        }
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        TEUIModelRef<FVM_SearchFriendInput> local_2 = this.SearchFriendInput.AsRef();
        FVM_SearchFriendInput& local_6 = local_2.Get();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_56 = FEUIReactiveSubscriberTrackScope(It);
            int local_57 = It.GetIndex();
            if (local_57 <= 1)
            {
                if (local_57 != 0)
                {
                    if (local_57 != 1)
                    {
                    }
                }
                else
                {
                    this.SearchFriendInput.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_SearchFriendInput::__IndexOf_AlreadyInputText());
                    }
                    if (local_6)
                    {
                        this.OnAlreadyInputTextChanged();
                    }
                    this.SearchFriendInput.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_SearchFriendInput::__IndexOf_bShowSearchResult());
                    }
                    if (local_6)
                    {
                        this.OnShowSearchResultChanged(local_6.GetbShowSearchResult());
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
                XError(ELog(17), "Remaining observed model change: OnAlreadyInputTextChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnShowSearchResultChanged");
            }
            return;
        }
        this.__SearchFriendInput = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SearchFriendInput.Initialize(this, FName("VM_SearchFriendInput"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.SearchFriendInputDelegate.IsBound())
        {
            this.SearchFriendInput.SetRef(this.SearchFriendInputDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_SearchFriendInput
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.WidgetType = UWidget_SearchFriendInput;
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnAlreadyInputTextChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnShowSearchResultChanged"));
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
