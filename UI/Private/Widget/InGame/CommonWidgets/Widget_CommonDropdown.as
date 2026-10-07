
enum ECommonDropdownExpandDirection
{
    Up,
    Down,
}

namespace UWidget_CommonDropdown
{
    const int ViewID = 0;
}
namespace UWidget_CommonDropdownList
{
    const int ViewID = 0;
}
namespace UWidget_CommonDropdownListCanvas
{
    const int ViewID = 0;
}
namespace UWidget_CommonDropdownOption
{
    const int ViewID = 0;
}
namespace UWidget_CommonDropdownButton
{
    const int ViewID = 0;
}
namespace UWidget_TextDropdownOption
{
    const int ViewID = 0;
}
namespace UWidget_TextDropdownButton
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_CommonDropdown : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonDropdown> CommonDropdown;
    UPROPERTY()
    TSubclassOf<UEUIUserWidget> DropdownButtonWidgetClass;
    UPROPERTY()
    TSubclassOf<UEUIUserWidget> DropdownOptionWidgetClass;
    UPROPERTY()
    ECommonDropdownExpandDirection ExpandDirection = ECommonDropdownExpandDirection(1);
    UPROPERTY()
    float32 DropdownListMaxHeight = 800.0f;
    UPROPERTY()
    UEUIDynamicWidget DropdownButtonWidget;
    FEUIModelWeakRef __CommonDropdown;
    UPROPERTY()
    FGetEUIModelRef CommonDropdownDelegate;


    UFUNCTION()
    void PreConstruct_Implementation(const bool IsDesignTime)
    {
        this.DropdownButtonWidget.SetDynamicWidgetClass(TSoftClassPtr<UEUIUserWidget>(this.DropdownButtonWidgetClass));
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.SyncExpandDirectionToModel();
        return;
    }
    UFUNCTION()
    void OnViewUnbind_Implementation()
    {
        this.CloseDropdownList();
        return;
    }
    UFUNCTION()
    void OnDropdownOpenChanged(const bool bDropdownOpen)
    {
        if (bDropdownOpen)
        {
            this.OpenDropdownList();
            return;
        }
        this.CloseDropdownList();
        return;
    }
    void SyncExpandDirectionToModel()
    {
        FVM_CommonDropdown& local_2;
        if (local_2)
        {
            local_2.SetExpandDirection(this.ExpandDirection);
        }
        return;
    }
    void NotifyCloseFromDropdownList()
    {
        this.CommonDropdown_SetDropdownOpen(false);
        return;
    }
    void OpenDropdownList()
    {
        this.CloseDropdownList();
        FEUIModelRef local_4;
        local_4;
        FEUIWidget::AddWidget(this.GetOwningLocalPlayer(), GameplayTags::UI_Type_CommonDropdownListCanvas, this.CommonDropdown.opArrow().GetDropdownList().opImplConv(), FEUIModelRef(), local_4);
        return;
    }
    void CloseDropdownList()
    {
        FEUIWidgetRef local_4 = FEUIWidget::FindWidget(this.GetOwningLocalPlayer(), GameplayTags::UI_Type_CommonDropdownListCanvas);
        if (local_4)
        {
            FEUIWidget::RemoveWidget(local_4);
        }
        return;
    }
    UFUNCTION()
    void CommonDropdown_SetDropdownOpen(const bool bInDropdownOpen) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(bInDropdownOpen);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_CommonDropdown& local_6;
        TEUIModelRef<FVM_CommonDropdown> local_2 = this.CommonDropdown.AsRef();
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
                    this.CommonDropdown.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_CommonDropdown::__IndexOf_bDropdownOpen());
                    }
                    if (local_6)
                    {
                        this.OnDropdownOpenChanged(local_6.GetbDropdownOpen());
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
                XError(ELog(17), "Remaining observed model change: OnDropdownOpenChanged");
            }
            return;
        }
        this.__CommonDropdown = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CommonDropdown.Initialize(this, FName("VM_CommonDropdown"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommonDropdownDelegate.IsBound())
        {
            this.CommonDropdown.SetRef(this.CommonDropdownDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_CommonDropdownList : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonDropdownList> CommonDropdownList;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_WidgetRef> DropdownWidgetRef;
    UPROPERTY()
    UEUICommonListView ListView;
    bool bWasFocused = false;
    FEUIModelWeakRef __CommonDropdownList;
    FEUIModelWeakRef __DropdownWidgetRef;
    UPROPERTY()
    FGetEUIModelRef CommonDropdownListDelegate;
    UPROPERTY()
    FGetEUIModelRef DropdownWidgetRefDelegate;


    UFUNCTION()
    void OnInitialized_Implementation()
    {
        this.ListView.BP_OnItemClicked.AddUFunction(this, n"OnItemClicked");
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.FocusSelectedOption();
        return;
    }
    UFUNCTION()
    void HandleRelatedFocusChanged_Implementation()
    {
        if ((int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer()))) == 0)
        {
            return;
        }
        bool local_11 = (this.ListView != nullptr) && this.IsPartOfFocusPath(this.ListView);
        bool local_6 = !(this.bWasFocused);
        if ((local_6 && local_11))
        {
            this.FocusSelectedOption();
        }
        this.bWasFocused = local_11;
        return;
    }
    void FocusSelectedOption()
    {
        if (this.CommonDropdownList.opArrow().GetOptions().Num() > this.CommonDropdownList.opArrow().GetDropdown().opArrow().GetSelectedIndex())
        {
            int local_1 = this.CommonDropdownList.opArrow().GetDropdown().opArrow().GetSelectedIndex();
            this.ListView.NavigateToItem(this.CommonDropdownList.opArrow().GetOptions()[]);
        }
        return;
    }
    UFUNCTION()
    void OnDropdownWidgetRefChanged()
    {
        this.ListView.SetEntryWidgetClassOverride(this.GetDropdownWidget().DropdownOptionWidgetClass);
        return;
    }
    UFUNCTION()
    void SyncDropdownListFocus()
    {
        if (!(this.DropdownWidgetRef.IsValid()) || (this.ListView == nullptr))
        {
            return;
        }
        if ((int(::UICommonUtil::GetCurrentInputType(this.GetOwningLocalPlayer()))) == 0)
        {
            return;
        }
        this.FocusSelectedOption();
        return;
    }
    UFUNCTION()
    void OnItemClicked(const FEUIModelContainer &inout Item)
    {
        this.CommonDropdownList_OnDropdownItemSelected(Item);
        return;
    }
    UWidget_CommonDropdown GetDropdownWidget() const
    {
        return Cast<UWidget_CommonDropdown>(this.DropdownWidgetRef.opArrow().GetWidget());
    }
    UFUNCTION()
    void CommonDropdownList_OnDropdownItemSelected(const FEUIModelContainer &inout Item) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Item);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_CommonDropdownList& local_6;
        FVM_WidgetRef& local_12;
        TEUIModelRef<FVM_CommonDropdownList> local_2 = this.CommonDropdownList.AsRef();
        TEUIModelRef<FVM_WidgetRef> local_8 = this.DropdownWidgetRef.AsRef();
        for (; It; )
        {
            FEUIReactiveSubscriberTrackScope local_62 = FEUIReactiveSubscriberTrackScope(It);
            int local_63 = It.GetIndex();
            if (local_63 <= 1)
            {
                if (local_63 != 0)
                {
                    if (local_63 != 1)
                    {
                    }
                }
                else
                {
                    this.DropdownWidgetRef.TrackRead();
                    if (local_12)
                    {
                        local_12.TrackPropertyRead(::FVM_WidgetRef::__IndexOf_WeakWidget());
                    }
                    if (local_12)
                    {
                        this.OnDropdownWidgetRefChanged();
                    }
                    this.CommonDropdownList.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_CommonDropdownList::__IndexOf_Dropdown());
                    }
                    if (local_6)
                    {
                        this.SyncDropdownListFocus();
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
                XError(ELog(17), "Remaining observed model change: OnDropdownWidgetRefChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: SyncDropdownListFocus");
            }
            return;
        }
        this.__CommonDropdownList = local_2.opImplConv();
        this.__DropdownWidgetRef = local_8.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CommonDropdownList.Initialize(this, FName("VM_CommonDropdownList"), EEUIWidgetRefModelCreationType(0), false);
        this.DropdownWidgetRef.Initialize(this, FName("VM_WidgetRef"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommonDropdownListDelegate.IsBound())
        {
            this.CommonDropdownList.SetRef(this.CommonDropdownListDelegate.Execute());
        }
        if (this.DropdownWidgetRefDelegate.IsBound())
        {
            this.DropdownWidgetRef.SetRef(this.DropdownWidgetRefDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_CommonDropdownListCanvas : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonDropdown> CommonDropdown;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonDropdownList> CommonDropdownList;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_WidgetRef> DropdownWidgetRef;
    UPROPERTY()
    USizeBox DropdownListBoundary;
    UPROPERTY()
    FGetEUIModelRef CommonDropdownDelegate;
    UPROPERTY()
    FGetEUIModelRef CommonDropdownListDelegate;
    UPROPERTY()
    FGetEUIModelRef DropdownWidgetRefDelegate;

    UWidget_CommonDropdownListCanvas()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    UFUNCTION()
    void CloseDropdown()
    {
        FVM_CommonDropdown& local_2;
        if (local_2)
        {
            local_2.SetbDropdownOpen(false);
            return;
        }
        this.RemoveFromLayout();
        return;
    }
    UFUNCTION()
    void CommonDropdown_SetDropdownOpen(const bool bInDropdownOpen) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(bInDropdownOpen);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CommonDropdownList_OnDropdownItemSelected(const FEUIModelContainer &inout Item) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Item);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CommonDropdown.Initialize(this, FName("VM_CommonDropdown"), EEUIWidgetRefModelCreationType(0), false);
        this.CommonDropdownList.Initialize(this, FName("VM_CommonDropdownList"), EEUIWidgetRefModelCreationType(0), false);
        this.DropdownWidgetRef.Initialize(this, FName("VM_WidgetRef"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommonDropdownDelegate.IsBound())
        {
            this.CommonDropdown.SetRef(this.CommonDropdownDelegate.Execute());
        }
        if (this.CommonDropdownListDelegate.IsBound())
        {
            this.CommonDropdownList.SetRef(this.CommonDropdownListDelegate.Execute());
        }
        if (this.DropdownWidgetRefDelegate.IsBound())
        {
            this.DropdownWidgetRef.SetRef(this.DropdownWidgetRefDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_CommonDropdownOption : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonDropdownOption> CommonDropdownOption;
    UPROPERTY()
    FGetEUIModelRef CommonDropdownOptionDelegate;

    UWidget_CommonDropdownOption()
    {
        return;
    }
    UFUNCTION()
    void SelectOption()
    {
        int local_8 = 0;
        if (this.GetItemListUserWidget() != nullptr)
        {
            FEUIModelRef local_16;
            FEUIMessageBus::PublishWithWidgetReferencedModels(EUIMessageBus);
            local_16;
            FEUIModelWeakRef local_14 = FEUIModelWeakRef(local_16);
            local_8.Option = TEUIModelWeakRef<FVM_CommonDropdownOption>(local_14);
        }
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CommonDropdownOption.Initialize(this, FName("VM_CommonDropdownOption"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommonDropdownOptionDelegate.IsBound())
        {
            this.CommonDropdownOption.SetRef(this.CommonDropdownOptionDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_CommonDropdownButton : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonDropdownButton> CommonDropdownButton;
    UPROPERTY()
    FGetEUIModelRef CommonDropdownButtonDelegate;

    UWidget_CommonDropdownButton()
    {
        return;
    }
    UFUNCTION()
    void CommonDropdownButton_TriggerDropdown() const
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
        this.CommonDropdownButton.Initialize(this, FName("VM_CommonDropdownButton"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CommonDropdownButtonDelegate.IsBound())
        {
            this.CommonDropdownButton.SetRef(this.CommonDropdownButtonDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_TextDropdownOption : UEUIUserWidget
{
    UPROPERTY()
    FEUIActionBinding OptionSelecteAction;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Text> Text;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonDropdownOption> DropdownOption;
    UPROPERTY()
    FGetEUIModelRef TextDelegate;
    UPROPERTY()
    FGetEUIModelRef DropdownOptionDelegate;

    UWidget_TextDropdownOption()
    {
        this.OptionSelecteAction.SetBindFunctionName(n"PublishOptionSelected");
        return;
    }
    UFUNCTION()
    void PublishOptionSelected()
    {
        int local_8 = 0;
        if (this.GetItemListUserWidget() != nullptr)
        {
            FEUIModelRef local_16;
            FEUIMessageBus::PublishWithWidgetReferencedModels(EUIMessageBus);
            local_16;
            FEUIModelWeakRef local_14 = FEUIModelWeakRef(local_16);
            local_8.Option = TEUIModelWeakRef<FVM_CommonDropdownOption>(local_14);
        }
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Text.Initialize(this, FName("VM_Text"), EEUIWidgetRefModelCreationType(0), false);
        this.DropdownOption.Initialize(this, FName("VM_CommonDropdownOption"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TextDelegate.IsBound())
        {
            this.Text.SetRef(this.TextDelegate.Execute());
        }
        if (this.DropdownOptionDelegate.IsBound())
        {
            this.DropdownOption.SetRef(this.DropdownOptionDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_TextDropdownButton : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Text> Text;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonDropdownButton> DropdownButton;
    UPROPERTY()
    FGetEUIModelRef TextDelegate;
    UPROPERTY()
    FGetEUIModelRef DropdownButtonDelegate;

    UWidget_TextDropdownButton()
    {
        return;
    }
    UFUNCTION()
    void DropdownButton_TriggerDropdown() const
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
        this.Text.Initialize(this, FName("VM_Text"), EEUIWidgetRefModelCreationType(0), false);
        this.DropdownButton.Initialize(this, FName("VM_CommonDropdownButton"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TextDelegate.IsBound())
        {
            this.Text.SetRef(this.TextDelegate.Execute());
        }
        if (this.DropdownButtonDelegate.IsBound())
        {
            this.DropdownButton.SetRef(this.DropdownButtonDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_CommonDropdown
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnDropdownOpenChanged"));
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
namespace UWidget_CommonDropdownList
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnDropdownWidgetRefChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("SyncDropdownListFocus"));
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
namespace UWidget_CommonDropdownListCanvas
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
namespace UWidget_CommonDropdownOption
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
namespace UWidget_CommonDropdownButton
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
namespace UWidget_TextDropdownOption
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
namespace UWidget_TextDropdownButton
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
