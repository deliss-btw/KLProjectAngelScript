
namespace UWidget_TeamMemberInfo
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_TeamMemberInfo : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_TeammateInfo> TeammateInfo;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_PlayerInfo> PlayerInfo;
    UPROPERTY()
    FGetEUIModelRef TeammateInfoDelegate;
    UPROPERTY()
    FGetEUIModelRef PlayerInfoDelegate;

    UWidget_TeamMemberInfo()
    {
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        if (this.TeammateInfo.IsValid())
        {
            this.PlayerInfo.SetRef(this.TeammateInfo.opArrow().GetPlayerInfo());
        }
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        if (this.TeammateInfo.IsValid())
        {
            this.BP_OnTeamTypeChanged(this.TeammateInfo.opArrow().IsSocialTeam());
        }
        return;
    }
    UFUNCTION()
    void BP_OnTeamTypeChanged_Implementation(const bool bIsSocialTeam)
    {
        return;
    }
    void BP_OnTeamTypeChanged(const bool bIsSocialTeam)
    {
        __Evt_PushArgument__bool(bIsSocialTeam);
        __Evt_Execute(this, n"BP_OnTeamTypeChanged");
        return;
    }
    UFUNCTION()
    void TeammateInfo_OnClickTeamItem(const UWidget Widget) const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder::PushArg local_42;
        local_42.opCall(Widget);
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void PlayerInfo_CopyUidToClipboard() const
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
        this.TeammateInfo.Initialize(this, FName("VM_TeammateInfo"), EEUIWidgetRefModelCreationType(0), false);
        this.PlayerInfo.Initialize(this, FName("VM_PlayerInfo"), EEUIWidgetRefModelCreationType(0), true);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.TeammateInfoDelegate.IsBound())
        {
            this.TeammateInfo.SetRef(this.TeammateInfoDelegate.Execute());
        }
        if (this.PlayerInfoDelegate.IsBound())
        {
            this.PlayerInfo.SetRef(this.PlayerInfoDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_TeamMemberInfo
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
