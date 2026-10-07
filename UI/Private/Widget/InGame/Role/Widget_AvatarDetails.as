
namespace UWidget_AvatarDetails
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_AvatarDetails : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarInfo> Avatar;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarDetailInfo> AvatarDetails;
    FEUIModelWeakRef __Avatar;
    UPROPERTY()
    FGetEUIModelRef AvatarDelegate;
    UPROPERTY()
    FGetEUIModelRef AvatarDetailsDelegate;

    UWidget_AvatarDetails()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.OnAvatarChanged();
        return;
    }
    UFUNCTION()
    void OnAvatarChanged()
    {
        FVM_AvatarInfo& local_2;
        if (local_2)
        {
            local_2.GetAvatar().SetCurrentAvatar();
            0.SetbHasHoverSkill();
        }
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
    UFUNCTION()
    TArray<FEUIModelWeakRef> AvatarDetails_AvatarTraitList() const
    {
        FVM_AvatarDetailInfo& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetAvatarTraitList());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> AvatarDetails_TraitHoverList() const
    {
        FVM_AvatarDetailInfo& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetTraitHoverList());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> AvatarDetails_AvatarAttributeList() const
    {
        FVM_AvatarDetailInfo& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetAvatarAttributeList());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    bool AvatarDetails_bCanDisplayAttribute() const
    {
        FVM_AvatarDetailInfo& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbCanDisplayAttribute();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    bool AvatarDetails_bCanDisplayTrait() const
    {
        FVM_AvatarDetailInfo& local_2;
        bool local_5;
        if (local_2)
        {
            local_5 = local_2.GetbCanDisplayTrait();
        }
        else
        {
            local_5 = false;
        }
        return local_5;
    }
    UFUNCTION()
    void AvatarDetails_SwitchDisplayAttributeOrSkill() const
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
            if (local_57 <= 0)
            {
                if (local_57 != 0)
                {
                }
                else
                {
                    this.Avatar.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_AvatarInfo::__IndexOf_Avatar());
                    }
                    if (local_6)
                    {
                        this.OnAvatarChanged();
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
                XError(ELog(17), "Remaining observed model change: OnAvatarChanged");
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
        this.AvatarDetails.Initialize(this, FName("VM_AvatarDetailInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.AvatarDelegate.IsBound())
        {
            this.Avatar.SetRef(this.AvatarDelegate.Execute());
        }
        if (this.AvatarDetailsDelegate.IsBound())
        {
            this.AvatarDetails.SetRef(this.AvatarDetailsDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_AvatarDetails
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnAvatarChanged"));
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
