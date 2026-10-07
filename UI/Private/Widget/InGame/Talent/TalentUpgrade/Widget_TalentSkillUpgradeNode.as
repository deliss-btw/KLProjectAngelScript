
namespace UWidget_TalentSkillUpgradeNode
{
    const int ViewID = 0;

}
class UWidget_TalentSkillUpgradeNode : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TalentUpgradeNode> Node;
    UPROPERTY()
    UEUIDynamicEntryBox w_entry_combo;
    UPROPERTY()
    UWidget changeChoose;
    UPROPERTY()
    UWidget AutoLineAnchor;
    UPROPERTY()
    FGetEUIModelRef NodeDelegate;

    UWidget_TalentSkillUpgradeNode()
    {
        return;
    }
    UWidget GetAutoLineAnchorWidget()
    {
        if (this.AutoLineAnchor != nullptr)
        {
            return this.AutoLineAnchor;
        }
        return this;
    }
    UWidget ResolveAutoLineActiveWidget(const UWidget SourceWidget)
    {
        if (SourceWidget == nullptr)
        {
            return nullptr;
        }
        UWidgetSwitcher local_6 = (Cast<UWidgetSwitcher>(SourceWidget));
        if (local_6 != nullptr)
        {
            UWidget local_10 = local_6.GetActiveWidget();
            if (local_10 != nullptr)
            {
                return local_10;
            }
            if (local_6.GetNumWidgets() > 0)
            {
                UWidget local_14 = local_6.GetWidgetAtIndex(0);
                if (local_14 != nullptr)
                {
                    return local_14;
                }
            }
        }
        return SourceWidget;
    }
    UWidget FindChildWidgetByName(const UWidget SourceRootWidget, const FString &inout WidgetName)
    {
        UWidget local_10;
        UPanelWidget local_16;
        UWidget local_22;
        TArray<UWidget> local_4;
        if (SourceRootWidget != nullptr)
        {
            local_4.Add(SourceRootWidget);
        }
        while (local_4.Num() > 0)
        {
            local_10 = local_4.Last(0);
            local_4.RemoveAt((local_4.Num() - 1));
            if (local_10 == nullptr)
            {
                continue;
            }
            if ((local_10.GetName() == WidgetName))
            {
                return local_10;
            }
            local_16 = Cast<UPanelWidget>(local_10);
            if (local_16 == nullptr)
            {
                continue;
            }
            int local_19 = 0;
            for (; local_19 < local_16.GetChildrenCount(); )
            {
                local_22 = local_16.GetChildAt(local_19);
                local_4.Add(local_22);
                ++local_19;
            }
        }
        return local_22;
    }
    bool IsAutoLineVisibleWidget(const UWidget Widget)
    {
        int local_1;
        if (Widget == nullptr)
        {
            return false;
        }
        ESlateVisibility local_3 = Widget.GetVisibility();
        if ((int(local_3)) == 1)
        {
            local_1 = 0;
        }
        else
        {
            local_1 = (int(local_3) != 2);
        }
        return (local_1 != 0);
    }
    UWidget ResolveChoiceHubCenterWidget(const UWidget StateWidget, const bool bRequireVisible)
    {
        UWidget local_2 = this.FindChildWidgetByName(StateWidget, "point");
        if (local_2 == nullptr)
        {
            local_2 = this.FindChildWidgetByName(StateWidget, "Center");
        }
        if (local_2 == nullptr)
        {
            return nullptr;
        }
        if (bRequireVisible && !(this.IsAutoLineVisibleWidget(local_2)))
        {
            return nullptr;
        }
        return local_2;
    }
    UWidget ResolveChoiceHubVisualWidget()
    {
        UWidget local_4;
        UWidget local_2 = this.FindChildWidgetByName(this.changeChoose, "normal");
        if (this.IsAutoLineVisibleWidget(local_2))
        {
            if (this.ResolveChoiceHubCenterWidget(local_2, true) != nullptr)
            {
            }
            else
            {
            }
            return local_4;
        }
        UWidget local_8 = this.FindChildWidgetByName(this.changeChoose, "Choose");
        if (this.IsAutoLineVisibleWidget(local_8))
        {
            if (this.ResolveChoiceHubCenterWidget(local_8, true) != nullptr)
            {
            }
            else
            {
            }
            return local_4;
        }
        UWidget local_10 = this.FindChildWidgetByName(this.changeChoose, "hover");
        if (this.IsAutoLineVisibleWidget(local_10))
        {
            if (this.ResolveChoiceHubCenterWidget(local_10, true) != nullptr)
            {
            }
            else
            {
            }
            return local_4;
        }
        UWidget local_12 = this.ResolveChoiceHubCenterWidget(this.changeChoose, false);
        if (local_12 != nullptr)
        {
            return local_12;
        }
        if (local_2 != nullptr)
        {
            return local_2;
        }
        if (local_8 != nullptr)
        {
        }
        else
        {
        }
        return local_4;
    }
    void HideLegacyChoiceLine()
    {
        UWidget local_2 = this.FindChildWidgetByName(this.GetRootWidget(), "line");
        if (local_2 != nullptr)
        {
            local_2.SetVisibility(ESlateVisibility(1));
        }
        return;
    }
    UWidget GetAutoLineChoiceHubWidget()
    {
        this.HideLegacyChoiceLine();
        if (this.changeChoose != nullptr)
        {
            UWidget local_6 = this.ResolveChoiceHubVisualWidget();
            if (local_6 != nullptr)
            {
                return local_6;
            }
            return this.ResolveAutoLineActiveWidget(this.changeChoose);
        }
        return this.GetAutoLineAnchorWidget();
    }
    UWidget GetAutoLineChoiceHubCenterMarkerWidget()
    {
        UWidget local_12;
        this.HideLegacyChoiceLine();
        UWidget local_2 = this.FindChildWidgetByName(this.GetRootWidget(), "w_switcher_state");
        if (local_2 != nullptr && this.IsAutoLineVisibleWidget(local_2))
        {
            UWidget local_10 = this.ResolveAutoLineActiveWidget(local_2);
            if (local_10 != nullptr && this.IsAutoLineVisibleWidget(local_10))
            {
                local_12 = this.ResolveChoiceHubCenterWidget(local_10, true);
                if (local_12 != nullptr)
                {
                    return local_12;
                }
            }
            local_12 = this.ResolveChoiceHubCenterWidget(local_2, true);
            if (local_12 != nullptr)
            {
                return local_12;
            }
            return local_2;
        }
        UWidget local_4_2 = this.GetAutoLineChoiceHubWidget();
        return local_4_2;
    }
    UWidget GetAutoLineChoiceHubAnchorWidget()
    {
        this.HideLegacyChoiceLine();
        if (this.changeChoose != nullptr)
        {
            UWidget local_6 = this.FindChildWidgetByName(this.changeChoose, "normal");
            if (this.IsAutoLineVisibleWidget(local_6))
            {
                return local_6;
            }
            UWidget local_8 = this.FindChildWidgetByName(this.changeChoose, "Choose");
            if (this.IsAutoLineVisibleWidget(local_8))
            {
                return local_8;
            }
            UWidget local_10 = this.FindChildWidgetByName(this.changeChoose, "hover");
            if (this.IsAutoLineVisibleWidget(local_10))
            {
                return local_10;
            }
            return this.ResolveAutoLineActiveWidget(this.changeChoose);
        }
        return this.GetAutoLineAnchorWidget();
    }
    UWidget_TalentUpgradeItem GetChoiceItemWidget(const int ChoiceIndex)
    {
        if ((this.w_entry_combo == nullptr || (ChoiceIndex < 0)))
        {
            return nullptr;
        }
        TArray<UUserWidget> local_12 = this.w_entry_combo.GetAllEntries();
        if (!(local_12.IsValidIndex(ChoiceIndex)))
        {
            UWidget_TalentUpgradeItem local_8;
            return local_8;
        }
        UUserWidget local_14 = local_12[ChoiceIndex];
        return Cast<UWidget_TalentUpgradeItem>(local_14);
    }
    UFUNCTION()
    void Node_OnChoiceNodeChangedBtn() const
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
        this.Node.Initialize(this, FName("VM_TalentUpgradeNode"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.NodeDelegate.IsBound())
        {
            this.Node.SetRef(this.NodeDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TalentSkillUpgradeNode
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
