
namespace UWidget_LinkSkill
{
    const int ViewID = 0;

}
class UWidget_LinkSkill : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_LinkSkill> LinkSkill;
    UPROPERTY()
    UEUIWidgetProxy EUILinkSkill;
    UPROPERTY()
    UWidgetAnimation DelayShow;
    UPROPERTY()
    UCanvasPanel CanvasPanel;
    FEUIModelWeakRef __LinkSkill;

    UWidget_LinkSkill()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        this.CanvasPanel.SetRenderOpacity(0.0f);
        return;
    }
    UFUNCTION()
    void ShowUI(const bool bVisibility)
    {
        UEUIUserWidget local_86;
        bool local_1 = !(bVisibility);
        if (local_1 == !(true))
        {
            FECSEntity local_10 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
            Get local_14;
            const FC_PropManipulator& local_16 = local_14.opCall();
            if (local_16)
            {
                if (::FASCommonUtils::GetPropConfigDataPtr(FECSEntity(local_16.GetManipulatedPropEntity())))
                {
                    const FPropPrefabConfig& local_70;
                    if ((int(local_70.PropType) == 2 && (int(local_70.CombatPropType) == 1)))
                    {
                        TSoftClassPtr<UEUIUserWidget> local_84 = TSoftClassPtr<UEUIUserWidget>(local_70.UI_CustomSkillInfo);
                        if (!(local_84.IsNull()))
                        {
                            local_86 = FEUIWidget::CreateWidget(this.GetOwningLocalPlayer(), local_84).RequireWidget();
                            this.EUILinkSkill.AddChild(local_86);
                        }
                    }
                }
            }
            this.PlayAnimation(this.DelayShow, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
            return;
        }
        this.CanvasPanel.SetRenderOpacity(0.0f);
        this.EUILinkSkill.ClearChildren();
        return;
    }
    UFUNCTION()
    FEUIModelRef LinkSkill_VM_LinkSkillEnergyCrossbow() const
    {
        FVMS_LinkSkill& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_LinkSkillEnergyCrossbow() : FEUIModelRef();
        return local_8;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVMS_LinkSkill& local_6;
        TEUIModelRef<FVMS_LinkSkill> local_2 = this.LinkSkill.AsRef();
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
                    this.LinkSkill.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVMS_LinkSkill::__IndexOf_bVisibility());
                    }
                    if (local_6)
                    {
                        this.ShowUI(local_6.GetbVisibility());
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
                XError(ELog(17), "Remaining observed model change: ShowUI");
            }
            return;
        }
        this.__LinkSkill = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.LinkSkill.Initialize(this, FName("VMS_LinkSkill"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_LinkSkill
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("ShowUI"));
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
