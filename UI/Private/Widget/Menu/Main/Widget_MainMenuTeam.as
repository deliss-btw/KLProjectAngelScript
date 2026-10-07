
namespace UWidget_MainMenuTeam
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_MainMenuTeam : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MenuPage> Menu;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarShowcase> Showcase;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MainMenuTeam> Team;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CurrentDivineSkill> CurrentEquipableSkill;
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_ItemBtns> ItemBtns;
    TArray<bool> SavedShowItemUsableCount;
    UPROPERTY()
    FConfigVM_MenuPage MenuConfig;
    UPROPERTY()
    FConfigVM_AvatarShowcase ShowcaseConfig;
    UPROPERTY()
    FGetEUIModelRef MenuDelegate;
    UPROPERTY()
    FGetEUIModelRef ShowcaseDelegate;
    UPROPERTY()
    FGetEUIModelRef TeamDelegate;
    UPROPERTY()
    FGetEUIModelRef CurrentEquipableSkillDelegate;

    UWidget_MainMenuTeam()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        FVMS_ItemBtns& local_4;
        TEUIModelRef<FVM_AvatarShowcase> local_2;
        local_2;
        local_2.SetCurrentShowcase();
        if (local_4)
        {
            this.SavedShowItemUsableCount.Empty(0);
            this.SaveCountAndHide(local_4.GetCombatBtnVM1());
            this.SaveCountAndHide(local_4.GetCombatBtnVM2());
            this.SaveCountAndHide(local_4.GetHealBtnVM());
        }
        return;
    }
    UFUNCTION()
    void OnViewUnbind_Implementation()
    {
        FVMS_ItemBtns& local_2;
        if (local_2)
        {
            this.RestoreCount(local_2.GetCombatBtnVM1(), 0);
            this.RestoreCount(local_2.GetCombatBtnVM2(), 1);
            this.RestoreCount(local_2.GetHealBtnVM(), 2);
        }
        return;
    }
    void SaveCountAndHide(const TEUIModelRef<FVM_NormalSkillBtn> &inout Btn)
    {
        FVM_NormalSkillBtn& local_2;
        if (local_2)
        {
            this.SavedShowItemUsableCount.Add(local_2.GetbShowItemUsableCount());
            local_2.SetbShowItemUsableCount(false);
            return;
        }
        this.SavedShowItemUsableCount.Add(false);
        return;
    }
    void RestoreCount(const TEUIModelRef<FVM_NormalSkillBtn> &inout Btn, const int Index)
    {
        if (Index < this.SavedShowItemUsableCount.Num())
        {
            FVM_NormalSkillBtn& local_4;
            if (local_4)
            {
                local_4.SetbShowItemUsableCount((this.SavedShowItemUsableCount[Index]));
            }
        }
        return;
    }
    UFUNCTION()
    void Team_OpenAvatarSelection(const int Index) const
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
    void Team_OnHoverAvatar(const int Index) const
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
    void Team_OnUnhoverAvatar(const int Index) const
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
    void CodeGenInitProperty()
    {
        this.Menu.Initialize(this, FName("VM_MenuPage"), EEUIWidgetRefModelCreationType(0), false);
        this.Showcase.Initialize(this, FName("VM_AvatarShowcase"), EEUIWidgetRefModelCreationType(0), false);
        this.Team.Initialize(this, FName("VM_MainMenuTeam"), EEUIWidgetRefModelCreationType(0), false);
        this.CurrentEquipableSkill.Initialize(this, FName("VM_CurrentDivineSkill"), EEUIWidgetRefModelCreationType(0), false);
        this.ItemBtns.Initialize(this, FName("VMS_ItemBtns"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MenuDelegate.IsBound())
        {
            this.Menu.SetRef(this.MenuDelegate.Execute());
        }
        if (this.ShowcaseDelegate.IsBound())
        {
            this.Showcase.SetRef(this.ShowcaseDelegate.Execute());
        }
        if (this.TeamDelegate.IsBound())
        {
            this.Team.SetRef(this.TeamDelegate.Execute());
        }
        if (this.CurrentEquipableSkillDelegate.IsBound())
        {
            this.CurrentEquipableSkill.SetRef(this.CurrentEquipableSkillDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_MainMenuTeam
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
