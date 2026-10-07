
namespace UWidget_WeaponCraftCategory
{
    const int ViewID = 0;
}
namespace UWidget_EquipmentCraftPopup
{
    const int ViewID = 0;
}
namespace UWidget_Blacksmith
{
    const int ViewID = 0;

}
class UWidget_WeaponCraftCategory : UEUIUserListItemWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_WeaponCraftCategory> Category;
    UPROPERTY()
    FGetEUIModelRef CategoryDelegate;

    UWidget_WeaponCraftCategory()
    {
        return;
    }
    UFUNCTION()
    FText Category_DisplayName() const
    {
        FVM_WeaponCraftCategory& local_2;
        FText local_12;
        if (local_2)
        {
            local_12 = local_2.GetDisplayName();
        }
        else
        {
            local_12 = FText();
        }
        return local_12;
    }
    UFUNCTION()
    bool Category_IsSelected() const
    {
        FVM_WeaponCraftCategory& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.IsSelected();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    void Category_OnSelected() const
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
        this.Category.Initialize(this, FName("VM_WeaponCraftCategory"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CategoryDelegate.IsBound())
        {
            this.Category.SetRef(this.CategoryDelegate.Execute());
        }
        return;
    }
}

class UWidget_EquipmentCraftPopup : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_EquipmentInfo> Equipment;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Page> Page;
    UPROPERTY()
    UEUIButtonBase GotoEquip;
    UPROPERTY()
    FEUIActionBinding GotoEquipActionBinding;
    UPROPERTY()
    FText CannotEquipTips;
    UPROPERTY()
    FGetEUIModelRef EquipmentDelegate;
    UPROPERTY()
    FGetEUIModelRef PageDelegate;

    UWidget_EquipmentCraftPopup()
    {
        return;
    }
    void SetIsGotoEquipEnable(const bool bEnable)
    {
        int local_4;
        int local_5;
        if (this.GotoEquip != nullptr)
        {
            if (bEnable)
            {
                local_5 = 0;
                local_4 = local_5;
            }
            else
            {
                local_5 = 1;
                local_4 = local_5;
            }
            this.GotoEquip.SetVisibility(ESlateVisibility(local_4));
        }
        bool local_3 = !(bEnable);
        this.GotoEquipActionBinding.SetCollapsed(local_3);
        return;
    }
    UFUNCTION()
    void GoFastEquip()
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> Equipment_EquipmentTraits() const
    {
        FVM_EquipmentInfo& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetEquipmentTraits());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> Equipment_EquipmentAttributes() const
    {
        FVM_EquipmentInfo& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetEquipmentAttributes());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    bool Equipment_bShowDescription() const
    {
        FVM_EquipmentInfo& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbShowDescription();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    void Page_ClosePage() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Page_CloseGroup() const
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
        this.Equipment.Initialize(this, FName("VM_EquipmentInfo"), EEUIWidgetRefModelCreationType(0), false);
        this.Page.Initialize(this, FName("VM_Page"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.EquipmentDelegate.IsBound())
        {
            this.Equipment.SetRef(this.EquipmentDelegate.Execute());
        }
        if (this.PageDelegate.IsBound())
        {
            this.Page.SetRef(this.PageDelegate.Execute());
        }
        return;
    }
}

class UWidget_Blacksmith : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Page> Page;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_ItemCraft> Craft;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_WeaponCraft> WeaponCraft;
    UPROPERTY()
    UUserWidget ItemTooltip;
    UPROPERTY()
    FConfigVM_ItemCraft CraftConfig;
    UPROPERTY()
    FConfigVM_WeaponCraft WeaponCraftConfig;
    UPROPERTY()
    FGetEUIModelRef PageDelegate;
    UPROPERTY()
    FGetEUIModelRef CraftDelegate;
    UPROPERTY()
    FGetEUIModelRef WeaponCraftDelegate;

    UWidget_Blacksmith()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        TEUIModelRef<FVM_ItemCraft> local_2;
        local_2;
        this.WeaponCraft.opArrow().Setup(local_2);
        return;
    }
    UFUNCTION()
    void Page_ClosePage() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Page_CloseGroup() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    TEUIModelRef<FVM_QualitySelector> Craft_CraftQuality() const
    {
        FVM_ItemCraft& local_2;
        TEUIModelRef<FVM_QualitySelector> local_10;
        if (local_2)
        {
            local_10 = local_2.GetCraftQuality();
        }
        else
        {
            local_10 = TEUIModelRef<FVM_QualitySelector>();
        }
        return local_10;
    }
    UFUNCTION()
    TEUIModelRef<FVM_CraftableItem> Craft_CurrentCraft() const
    {
        FVM_ItemCraft& local_2;
        TEUIModelRef<FVM_CraftableItem> local_10;
        if (local_2)
        {
            local_10 = local_2.GetCurrentCraft();
        }
        else
        {
            local_10 = TEUIModelRef<FVM_CraftableItem>();
        }
        return local_10;
    }
    UFUNCTION()
    TDataObjectPtr<FItemConfig> Craft_CurrentCraftItemConfig() const
    {
        FVM_ItemCraft& local_2;
        TDataObjectPtr<FItemConfig> local_52;
        if (local_2)
        {
            local_52 = local_2.GetCurrentCraftItemConfig();
        }
        else
        {
            local_52 = TDataObjectPtr<FItemConfig>();
        }
        return local_52;
    }
    UFUNCTION()
    bool Craft_bCanDoCurrentCraft() const
    {
        FVM_ItemCraft& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbCanDoCurrentCraft();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    bool Craft_bCurrentCraftUnlocked() const
    {
        FVM_ItemCraft& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbCurrentCraftUnlocked();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> Craft_AllCraftableItems() const
    {
        FVM_ItemCraft& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetAllCraftableItems());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> Craft_CraftConsumeRewards() const
    {
        FVM_ItemCraft& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetCraftConsumeRewards());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    TEUIModelRef<FVM_CommonItem> Craft_CurrentCommonItem() const
    {
        FVM_ItemCraft& local_2;
        TEUIModelRef<FVM_CommonItem> local_10;
        if (local_2)
        {
            local_10 = local_2.GetCurrentCommonItem();
        }
        else
        {
            local_10 = TEUIModelRef<FVM_CommonItem>();
        }
        return local_10;
    }
    UFUNCTION()
    TEUIModelRef<FVM_CommonConsume> Craft_CurrentCommonConsume() const
    {
        FVM_ItemCraft& local_2;
        TEUIModelRef<FVM_CommonConsume> local_10;
        if (local_2)
        {
            local_10 = local_2.GetCurrentCommonConsume();
        }
        else
        {
            local_10 = TEUIModelRef<FVM_CommonConsume>();
        }
        return local_10;
    }
    UFUNCTION()
    FSlateBrush Craft_CurrentCraftItemIcon() const
    {
        FVM_ItemCraft& local_2;
        FSlateBrush local_136 = local_2 ? local_2.CurrentCraftItemIcon() : FSlateBrush();
        return local_136;
    }
    UFUNCTION()
    bool Craft_CurrentCraftIsLocked() const
    {
        FVM_ItemCraft& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetCurrentCraftIsLocked();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    int Craft_CurrentCraftSwitcherIndex() const
    {
        FVM_ItemCraft& local_2;
        return local_2 ? local_2.GetCurrentCraftSwitcherIndex() : 0;
    }
    UFUNCTION()
    void Craft_DoCraft() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Craft_SetCurrentCraftTypeIndex(const int Index) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Index);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Craft_SwitchFocus() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> WeaponCraft_CraftableEquipments() const
    {
        FVM_WeaponCraft& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetCraftableEquipments());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> WeaponCraft_Categories() const
    {
        FVM_WeaponCraft& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetCategories());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    TEUIModelRef<FVM_EquipmentInfo> WeaponCraft_CurrentCraftEquipmentInfo() const
    {
        FVM_WeaponCraft& local_2;
        TEUIModelRef<FVM_EquipmentInfo> local_10;
        if (local_2)
        {
            local_10 = local_2.GetCurrentCraftEquipmentInfo();
        }
        else
        {
            local_10 = TEUIModelRef<FVM_EquipmentInfo>();
        }
        return local_10;
    }
    UFUNCTION()
    FSlateBrush WeaponCraft_CurrentCraftEquipmentPreview() const
    {
        FVM_WeaponCraft& local_2;
        FSlateBrush local_136 = local_2 ? local_2.GetCurrentCraftEquipmentPreview() : FSlateBrush();
        return local_136;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Page.Initialize(this, FName("VM_Page"), EEUIWidgetRefModelCreationType(0), false);
        this.Craft.Initialize(this, FName("VM_ItemCraft"), EEUIWidgetRefModelCreationType(0), false);
        this.WeaponCraft.Initialize(this, FName("VM_WeaponCraft"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.PageDelegate.IsBound())
        {
            this.Page.SetRef(this.PageDelegate.Execute());
        }
        if (this.CraftDelegate.IsBound())
        {
            this.Craft.SetRef(this.CraftDelegate.Execute());
        }
        if (this.WeaponCraftDelegate.IsBound())
        {
            this.WeaponCraft.SetRef(this.WeaponCraftDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_WeaponCraftCategory
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
namespace UWidget_EquipmentCraftPopup
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
namespace UWidget_Blacksmith
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
