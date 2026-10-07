
namespace UWidget_EquipableSkillListItem
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_EquipableSkillListItem : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_DivineSkillInfo> EquipableSkillInfo;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_SelectableItem> SelectableItem;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_RedDot> RedDotVM;
    UPROPERTY()
    FConfigVM_RedDot RedDotVMConfig;
    FEUIModelWeakRef __SelectableItem;
    UPROPERTY()
    FGetEUIModelRef EquipableSkillInfoDelegate;
    UPROPERTY()
    FGetEUIModelRef SelectableItemDelegate;
    UPROPERTY()
    FGetEUIModelRef RedDotVMDelegate;

    UWidget_EquipableSkillListItem()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        TDataObjectPtr<FDivineSkillConfig> local_24 = this.EquipableSkillInfo.opArrow().GetEquipableSkillConfig();
        if (local_24)
        {
            int64 local_58 = local_24.opArrow().DataId;
            FRedDotNodeData local_54 = FRedDotNodeData(GameplayTags::RedDotSystem_Partner_NewDivineSkill, local_58);
            FEUIModelRef local_60;
            this.RedDotVM = local_60;
        }
        return;
    }
    UFUNCTION()
    void OnSelectedChanged(const bool bIsSelected)
    {
        if (bIsSelected)
        {
            TDataObjectPtr<FDivineSkillConfig> local_24 = this.EquipableSkillInfo.opArrow().GetEquipableSkillConfig();
            if (local_24)
            {
                int64 local_52 = local_24.opArrow().DataId;
                ::FMS_RedDotSystem::Get(this).ConsumeRedDot(GameplayTags::RedDotSystem_Partner_NewDivineSkill, local_52);
            }
        }
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_SelectableItem& local_6;
        TEUIModelRef<FVM_SelectableItem> local_2 = this.SelectableItem.AsRef();
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
                    this.SelectableItem.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_SelectableItem::__IndexOf_bIsSelected());
                    }
                    if (local_6)
                    {
                        this.OnSelectedChanged(local_6.GetbIsSelected());
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
                XError(ELog(17), "Remaining observed model change: OnSelectedChanged");
            }
            return;
        }
        this.__SelectableItem = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.EquipableSkillInfo.Initialize(this, FName("VM_DivineSkillInfo"), EEUIWidgetRefModelCreationType(0), false);
        this.SelectableItem.Initialize(this, FName("VM_SelectableItem"), EEUIWidgetRefModelCreationType(0), false);
        this.RedDotVM.Initialize(this, FName("VM_RedDot"), EEUIWidgetRefModelCreationType(0), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.EquipableSkillInfoDelegate.IsBound())
        {
            this.EquipableSkillInfo.SetRef(this.EquipableSkillInfoDelegate.Execute());
        }
        if (this.SelectableItemDelegate.IsBound())
        {
            this.SelectableItem.SetRef(this.SelectableItemDelegate.Execute());
        }
        if (this.RedDotVMDelegate.IsBound())
        {
            this.RedDotVM.SetRef(this.RedDotVMDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_EquipableSkillListItem
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnSelectedChanged"));
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
