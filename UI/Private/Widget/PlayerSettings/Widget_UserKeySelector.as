
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
        TEUIModelRef<FVM_PlayerKeyMapping> local_68;
        local_68.GetMapping1();
        if (!(local_68.IsValid()))
        {
            this.OnHoverIndex0();
        }
        else
        {
            local_68.GetMapping1();
            bool local_1 = local_68.IsValid();
            if (!(local_1))
            {
                local_1 = false;
            }
            else
            {
                local_68.GetMapping0();
                local_1 = local_68.IsValid();
            }
            if (local_1)
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
        if (this.KeyMappingPair.IsValid() && GetbIsGamepadSelector())
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
        TEUIModelRef<FVM_PlayerKeyMapping> local_2;
        local_2.GetMapping0();
        if (local_2.IsValid())
        {
        }
        else
        {
        }
        SetHoverIndex0();
        return;
    }
    UFUNCTION()
    void OnHoverIndex1()
    {
        TEUIModelRef<FVM_PlayerKeyMapping> local_2;
        local_2.GetMapping1();
        if (local_2.IsValid())
        {
        }
        else
        {
        }
        SetHoverIndex1();
        return;
    }
    UFUNCTION()
    void OnUnhoverIndex0()
    {
        TEUIModelRef<FVM_PlayerKeyMapping> local_2;
        local_2.GetMapping0();
        if (!(local_2.IsValid()))
        {
            return;
        }
        0.SetHoverIndex0();
        return;
    }
    UFUNCTION()
    void OnUnhoverIndex1()
    {
        TEUIModelRef<FVM_PlayerKeyMapping> local_2;
        local_2.GetMapping1();
        if (!(local_2.IsValid()))
        {
            return;
        }
        0.SetHoverIndex1();
        return;
    }
    UFUNCTION()
    void ChangeButtonVisibility0()
    {
        bool local_7;
        int local_14;
        int local_15;
        if (this.w_btn == nullptr)
        {
            local_7 = false;
        }
        else
        {
            TEUIModelRef<FVM_PlayerKeyMapping> local_2;
            local_2.GetMapping0();
            local_7 = local_2.IsValid();
        }
        if (local_7)
        {
            TEUIModelRef<FVM_PlayerKeyMapping> local_2;
            bool local_3 = !(GetbIsGamepadSelector()) && (int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer())) == 1);
            if (local_3)
            {
                local_3 = true;
            }
            else
            {
                local_2.GetMapping0();
                local_3 = !(GetbConfigurable());
            }
            if (local_3)
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
        bool local_7;
        int local_14;
        int local_15;
        if (this.w_btn_1 == nullptr)
        {
            local_7 = false;
        }
        else
        {
            TEUIModelRef<FVM_PlayerKeyMapping> local_2;
            local_2.GetMapping1();
            local_7 = local_2.IsValid();
        }
        if (local_7)
        {
            TEUIModelRef<FVM_PlayerKeyMapping> local_2;
            bool local_3 = !(GetbIsGamepadSelector()) && (int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer())) == 1);
            if (local_3)
            {
                local_3 = true;
            }
            else
            {
                local_2.GetMapping1();
                local_3 = !(GetbConfigurable());
            }
            if (local_3)
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
        bool local_1;
        if (!(this.KeyMappingPair.IsValid()))
        {
            local_1 = false;
        }
        else
        {
            TEUIModelRef<FVM_PlayerKeyMapping> local_4;
            local_4.GetMapping0();
            local_1 = local_4.IsValid();
        }
        if (local_1)
        {
            return this.KeyMappingPair.opArrow().GetMapping0().opArrow().IsValid(Key);
        }
        return true;
    }
    UFUNCTION()
    bool IsKeyValid1(const FKey &inout Key) const
    {
        bool local_1;
        if (!(this.KeyMappingPair.IsValid()))
        {
            local_1 = false;
        }
        else
        {
            TEUIModelRef<FVM_PlayerKeyMapping> local_4;
            local_4.GetMapping1();
            local_1 = local_4.IsValid();
        }
        if (local_1)
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
        bool local_1 = !(this.KeyMappingPair.IsValid());
        if (local_1)
        {
            local_1 = true;
        }
        else
        {
            TEUIModelRef<FVM_PlayerKeyMapping> local_4;
            local_4.GetMapping0();
            local_1 = !(local_4.IsValid());
        }
        if (local_1)
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
        FVM_PlayerKeyMappingPair& local_2;
        bool local_5;
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
        FVM_PlayerKeyMappingPair& local_2;
        bool local_5;
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
        FVM_PlayerKeyMappingPair& local_6;
        TEUIModelRef<FVM_PlayerKeyMappingPair> local_2 = this.KeyMappingPair.AsRef();
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
