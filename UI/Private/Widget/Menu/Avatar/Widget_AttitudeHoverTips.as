
namespace UWidget_AttitudeHoverTips
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_AttitudeHoverTips : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarInfo> Avatar;
    UPROPERTY()
    UEUIFormatTextBlock IllustrateText;
    UPROPERTY()
    UEUIFormatTextBlock PowerNameText;
    FEUIModelWeakRef __Avatar;
    UPROPERTY()
    FGetEUIModelRef AvatarDelegate;

    UWidget_AttitudeHoverTips()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        return;
    }
    UFUNCTION()
    void OnAvatarConfigChanged(const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig)
    {
        if (AvatarConfig)
        {
            TRawPtr<FDamageTypeInfoConfig> local_4;
            local_4.GetDamageTypeInfo();
            if (local_4)
            {
                if (UICommonUtil::CVar_UI_UseAttributePresentation.GetBool())
                {
                    local_4.opArrow().DamagePresentation.GetDisplayName();
                    FString local_10;
                    this.PowerNameText.SetArgument(local_10, "0");
                    return;
                }
                this.PowerNameText.SetArgument("0", local_4.opArrow().DamageName);
            }
        }
        return;
    }
    UFUNCTION()
    void OnIllustrateChanged(const EAvatarIllustrate Illustrate)
    {
        this.IllustrateText.SetArgument("0", this.Avatar.opArrow().GetIllustrateDisplayName());
        return;
    }
    UFUNCTION()
    void Avatar_OnChangeSpecialty() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    UFUNCTION()
    void Avatar_OnCurrentAvatarsChanged() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_AvatarInfo& local_6;
        TEUIModelRef<FVM_AvatarInfo> local_2 = this.Avatar.AsRef();
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
                    this.Avatar.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_AvatarInfo::__IndexOf_AvatarConfig());
                    }
                    if (local_6)
                    {
                        this.OnAvatarConfigChanged(local_6.GetAvatarConfig());
                    }
                    this.Avatar.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_AvatarInfo::__IndexOf_Illustrate());
                    }
                    if (local_6)
                    {
                        this.OnIllustrateChanged(local_6.GetIllustrate());
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
                XError(ELog(17), "Remaining observed model change: OnAvatarConfigChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnIllustrateChanged");
            }
            return;
        }
        this.__Avatar = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Avatar.Initialize(this, FName("VM_AvatarInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.AvatarDelegate.IsBound())
        {
            this.Avatar.SetRef(this.AvatarDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_AttitudeHoverTips
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnAvatarConfigChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnIllustrateChanged"));
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
