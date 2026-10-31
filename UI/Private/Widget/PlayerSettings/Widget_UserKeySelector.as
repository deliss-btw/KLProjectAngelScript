namespace UWidget_UserKeySelector
{
    const int ViewID = 0;

}
class UWidget_UserKeySelector : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_PlayerKeyMappingPair> KeyMappingPair;
    UPROPERTY()
    UEUIButton w_btn;
    UPROPERTY()
    UEUIButton w_btn_1;
    FEUIModelWeakRef __KeyMappingPair;
    UPROPERTY()
    FGetEUIModelRef KeyMappingPairDelegate;

    UWidget_UserKeySelector()
    {
        return;
    }
    UFUNCTION()
    void HandleRelatedFocusChanged_Implementation()
    {
        this.RefreshBtnFocusState();
        this.ChangeButtonVisibility0();
        this.ChangeButtonVisibility1();
        UEUIInputSubsystem::Get(this.GetOwningLocalPlayer()).OnInputMethodChanged.AddUFunction(this, n"OnInputMethodChanged");
        return;
    }
    UFUNCTION()
    FEventReply OnMouseMove_Implementation(const FGeometry &inout MyGeometry, const FPointerEvent &inout MouseEvent)
    {
        if (!(this.KeyMappingPair.IsValid()))
        {
            return FEventReply::Unhandled();
        }
        FVector2D local_60 = MyGeometry.AbsoluteToLocal(MouseEvent.GetScreenSpacePosition());
        if (!(this.KeyMappingPair.Get().GetMapping1().IsValid()))
        {
            this.OnHoverIndex0();
        }
        else
        {
            if (this.KeyMappingPair.Get().GetMapping1().IsValid() && this.KeyMappingPair.Get().GetMapping0().IsValid())
            {
                if (local_60.X > (MyGeometry.GetLocalSize().X * 0.5))
                {
                    this.OnHoverIndex1();
                    this.OnUnhoverIndex0();
                }
                else
                {
                    this.OnHoverIndex0();
                    this.OnUnhoverIndex1();
                }
            }
        }
        return FEventReply::Unhandled();
    }
    UFUNCTION()
    void OnMouseLeave_Implementation(const FPointerEvent &inout MouseEvent)
    {
        this.OnUnhoverIndex0();
        this.OnUnhoverIndex1();
        return;
    }
    UFUNCTION()
    void OnInputMethodChanged(const EEUIInputType InputType)
    {
        ::FVMS_PlayerKeyMappings::Get(this).ExitKeySelecting();
        return;
    }
    void RefreshBtnFocusState()
    {
        if (this.w_btn != nullptr && this.IsPartOfFocusPath(this.w_btn))
        {
            this.OnHoverIndex0();
            this.OnUnhoverIndex1();
        }
        if (this.KeyMappingPair.IsValid() && this.KeyMappingPair.Get().GetbIsGamepadSelector())
        {
            return;
        }
        if (this.w_btn_1 != nullptr && this.IsPartOfFocusPath(this.w_btn_1))
        {
            this.OnHoverIndex1();
            this.OnUnhoverIndex0();
        }
        return;
    }
    UFUNCTION()
    void OnHoverIndex0()
    {
        int local_4 = this.KeyMappingPair.Get().GetMapping0().IsValid() ? 1 : 0;
        this.KeyMappingPair.Get().SetHoverIndex0(local_4);
        return;
    }
    UFUNCTION()
    void OnHoverIndex1()
    {
        int local_4 = this.KeyMappingPair.Get().GetMapping1().IsValid() ? 1 : 0;
        this.KeyMappingPair.Get().SetHoverIndex1(local_4);
        return;
    }
    UFUNCTION()
    void OnUnhoverIndex0()
    {
        if (!(this.KeyMappingPair.Get().GetMapping0().IsValid()))
        {
            return;
        }
        this.KeyMappingPair.Get().SetHoverIndex0(0);
        return;
    }
    UFUNCTION()
    void OnUnhoverIndex1()
    {
        if (!(this.KeyMappingPair.Get().GetMapping1().IsValid()))
        {
            return;
        }
        this.KeyMappingPair.Get().SetHoverIndex1(0);
        return;
    }
    UFUNCTION()
    void ChangeButtonVisibility0()
    {
        int local_14;
        int local_15;
        if (this.w_btn != nullptr && this.KeyMappingPair.Get().GetMapping0().IsValid())
        {
            if ((!(this.KeyMappingPair.Get().GetbIsGamepadSelector()) && (int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer())) == 1)) || !(this.KeyMappingPair.Get().GetMapping0().Get().GetbConfigurable()))
            {
                local_15 = 0;
                local_14 = local_15;
            }
            else
            {
                local_15 = 2;
                local_14 = local_15;
            }
            this.w_btn.SetVisibility(ESlateVisibility(local_14));
        }
        return;
    }
    UFUNCTION()
    void ChangeButtonVisibility1()
    {
        int local_14;
        int local_15;
        if (this.w_btn_1 != nullptr && this.KeyMappingPair.Get().GetMapping1().IsValid())
        {
            if ((!(this.KeyMappingPair.Get().GetbIsGamepadSelector()) && (int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer())) == 1)) || !(this.KeyMappingPair.Get().GetMapping1().Get().GetbConfigurable()))
            {
                local_15 = 0;
                local_14 = local_15;
            }
            else
            {
                local_15 = 2;
                local_14 = local_15;
            }
            this.w_btn_1.SetVisibility(ESlateVisibility(local_14));
        }
        return;
    }
    UFUNCTION()
    bool IsKeyValid0(const FKey &inout Key) const
    {
        if (this.KeyMappingPair.IsValid() && this.KeyMappingPair.Get().GetMapping0().IsValid())
        {
            return this.KeyMappingPair.opArrow().GetMapping0().opArrow().IsValid(Key);
        }
        return true;
    }
    UFUNCTION()
    bool IsKeyValid1(const FKey &inout Key) const
    {
        if (this.KeyMappingPair.IsValid() && this.KeyMappingPair.Get().GetMapping1().IsValid())
        {
            return this.KeyMappingPair.opArrow().GetMapping1().opArrow().IsValid(Key);
        }
        return true;
    }
    UFUNCTION()
    void OpenKeySelectionPage() const
    {
        int local_96 = 0;
        UWidget_KeySelectionPage local_104;
        if (!(this.KeyMappingPair.IsValid()) || !(this.KeyMappingPair.Get().GetMapping0().IsValid()))
        {
            return;
        }
        FVM_KeyList& local_10 = ::FVM_KeyList::Create(this.GetOwningLocalPlayer());
        local_10.SetActionName(this.KeyMappingPair.opArrow().GetActionName());
        TArray<TEUIModelRef<FVM_PlayerMappableKey>> local_14 = this.KeyMappingPair.opArrow().GetMapping0().opArrow().GetMappableKeys();
        TArray<FEUIModelContainer> local_22;
        for (auto& local_40 : local_14)
        {
            FEUIModelContainer local_54;
            local_54.AddModel(local_40.opImplConv(), false);
            local_22.Add(local_54);
        }
        local_10.SetKeys(local_22);
        FEUIWidgetRef local_74 = FEUIWidget::AddWidget(this.GetOwningLocalPlayer(), GameplayTags::UI_Type_KeySelection, FEUIModelRef(local_10));
        if (local_74)
        {
            for (auto& local_90 : local_10.GetKeys())
            {
                GetModel local_94 = FEUIModelContainer::GetModel(local_90);
                local_96.SetOwnerPage(local_74);
                local_96.GetModify_OnSelect().Bind(this.KeyMappingPair.opArrow().GetMapping0().opImplConv(), FVM_PlayerKeyMapping::SelectionSetKey);
            }
            FKey local_102 = FKey(this.KeyMappingPair.opArrow().GetMapping0().opArrow().GetCurrentKey());
            local_104 = (Cast<UWidget_KeySelectionPage>(local_74.RequireWidget()));
            if (local_104 != nullptr)
            {
                for (auto& local_90 : local_10.GetKeys())
                {
                    GetModel local_94_2 = FEUIModelContainer::GetModel(local_90);
                    if ((FKey(local_96.GetKey()) == local_102))
                    {
                        local_104.list.NavigateToItem(local_90);
                        break;
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    bool KeyMappingPair_bHasChordKey0() const
    {
        bool local_5;
        FVM_PlayerKeyMappingPair& local_2 = this.KeyMappingPair.Get();
        if (local_2)
        {
            local_5 = local_2.GetbHasChordKey0();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    bool KeyMappingPair_bHasChordKey1() const
    {
        bool local_5;
        FVM_PlayerKeyMappingPair& local_2 = this.KeyMappingPair.Get();
        if (local_2)
        {
            local_5 = local_2.GetbHasChordKey1();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    void KeyMappingPair_SetKey0(const FKey &inout NewKey) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(NewKey);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void KeyMappingPair_SetKey1(const FKey &inout NewKey) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(NewKey);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void KeyMappingPair_SetKeySelectingWithCheck0() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void KeyMappingPair_SetKeySelectingWithCheck1() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void KeyMappingPair_OnKeySelecting0(const bool bOnKeySelecting) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(bOnKeySelecting);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void KeyMappingPair_OnKeySelecting1(const bool bOnKeySelecting) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(bOnKeySelecting);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        TEUIModelRef<FVM_PlayerKeyMappingPair> local_2 = this.KeyMappingPair.AsRef();
        FVM_PlayerKeyMappingPair& local_6 = local_2.Get();
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
                    this.KeyMappingPair.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_PlayerKeyMappingPair::__IndexOf_bIsKeySelecting0());
                        local_6.TrackPropertyRead(::FVM_PlayerKeyMappingPair::__IndexOf_HoverIndex0());
                    }
                    if (local_6)
                    {
                        this.ChangeButtonVisibility0();
                    }
                    this.KeyMappingPair.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_PlayerKeyMappingPair::__IndexOf_bIsKeySelecting1());
                        local_6.TrackPropertyRead(::FVM_PlayerKeyMappingPair::__IndexOf_HoverIndex1());
                    }
                    if (local_6)
                    {
                        this.ChangeButtonVisibility1();
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
                XError(ELog(17), "Remaining observed model change: ChangeButtonVisibility0");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: ChangeButtonVisibility1");
            }
            return;
        }
        this.__KeyMappingPair = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.KeyMappingPair.Initialize(this, FName("VM_PlayerKeyMappingPair"), EEUIWidgetRefModelCreationType(1), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.KeyMappingPairDelegate.IsBound())
        {
            this.KeyMappingPair.SetRef(this.KeyMappingPairDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_UserKeySelector
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.WidgetType = UWidget_UserKeySelector;
    Result.ObservedModelChangesSubscriberNames.Add(FString("ChangeButtonVisibility0"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("ChangeButtonVisibility1"));
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
