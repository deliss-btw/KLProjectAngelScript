
namespace UWidget_SkillInfo
{
    const int ViewID = 0;

}
class UWidget_SkillInfo : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_SkillInfo> SkillInfo;
    UPROPERTY()
    UEUIWidgetProxy PlayerCustomSkillInfo;
    FEUIModelWeakRef __SkillInfo;

    UWidget_SkillInfo()
    {
        return;
    }
    UFUNCTION()
    void OnPlayerPawnEntityChanged(const FECSEntity &inout PlayerPawnEntity)
    {
        UEUIUserWidget local_16;
        if (UICommonUtil::CVar_UI_DebugEnableNewSkillBtns.GetBool())
        {
            return;
        }
        this.PlayerCustomSkillInfo.ClearChildren();
        TSoftClassPtr<UEUIUserWidget> local_14 = TSoftClassPtr<UEUIUserWidget>(::GetDefaultedBasePrefabConfig(PlayerPawnEntity).UI_CustomSkillInfo);
        if (!(local_14.IsNull()))
        {
            local_16 = FEUIWidget::CreateWidget(this.GetOwningLocalPlayer(), local_14).RequireWidget();
            this.PlayerCustomSkillInfo.AddChild(local_16);
        }
        return;
    }
    UFUNCTION()
    FEUIModelRef SkillInfo_VM_BasePrefab_CustomSkillInfo() const
    {
        FVMS_SkillInfo& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetVM_BasePrefab_CustomSkillInfo() : FEUIModelRef();
        return local_8;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVMS_SkillInfo& local_6;
        TEUIModelRef<FVMS_SkillInfo> local_2 = this.SkillInfo.AsRef();
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
                    this.SkillInfo.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVMS_SkillInfo::__IndexOf_PlayerPawnEntity());
                    }
                    if (local_6)
                    {
                        this.OnPlayerPawnEntityChanged(local_6.GetPlayerPawnEntity());
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
                XError(ELog(17), "Remaining observed model change: OnPlayerPawnEntityChanged");
            }
            return;
        }
        this.__SkillInfo = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.SkillInfo.Initialize(this, FName("VMS_SkillInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_SkillInfo
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnPlayerPawnEntityChanged"));
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
