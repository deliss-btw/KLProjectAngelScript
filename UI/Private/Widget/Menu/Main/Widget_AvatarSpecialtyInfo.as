
namespace UWidget_AvatarSpecialtyInfo
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_AvatarSpecialtyInfo : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarSpecialtyInfo> AvatarSpecialtyInfo;
    UPROPERTY()
    bool bIsHover = false;
    FEUIModelWeakRef __AvatarSpecialtyInfo;
    UPROPERTY()
    FGetEUIModelRef AvatarSpecialtyInfoDelegate;


    UFUNCTION()
    void OnAvatarConfigChanged()
    {
        if (this.AvatarSpecialtyInfo.IsValid() && GetbIsHover())
        {
            this.RuleSetUserFocus(this);
        }
        return;
    }
    UFUNCTION()
    void OnHoverEnter()
    {
        this.bIsHover = true;
        if (this.AvatarSpecialtyInfo.IsValid())
        {
            1.OnHoverChanged();
        }
        return;
    }
    UFUNCTION()
    void OnHoverExit()
    {
        this.bIsHover = false;
        if (this.AvatarSpecialtyInfo.IsValid())
        {
            0.OnHoverChanged();
        }
        return;
    }
    UFUNCTION()
    void AvatarSpecialtyInfo_ExecuteOnHoverChanged() const
    {
        FEUIModelRef local_2;
        local_2;
        FEUIWidgetModelCallbackBuilder local_20;
        local_20.EnqueueCallback();
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_AvatarSpecialtyInfo& local_6;
        TEUIModelRef<FVM_AvatarSpecialtyInfo> local_2 = this.AvatarSpecialtyInfo.AsRef();
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
                    this.AvatarSpecialtyInfo.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_AvatarSpecialtyInfo::__IndexOf_AvatarConfig());
                    }
                    if (local_6)
                    {
                        this.OnAvatarConfigChanged();
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
            return;
        }
        this.__AvatarSpecialtyInfo = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.AvatarSpecialtyInfo.Initialize(this, FName("VM_AvatarSpecialtyInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.AvatarSpecialtyInfoDelegate.IsBound())
        {
            this.AvatarSpecialtyInfo.SetRef(this.AvatarSpecialtyInfoDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_AvatarSpecialtyInfo
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnAvatarConfigChanged"));
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
