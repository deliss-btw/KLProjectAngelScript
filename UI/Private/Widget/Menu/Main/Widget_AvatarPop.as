
namespace UWidget_AvatarPop
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_AvatarPop : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarDetailPopInfo> AvatarDetailPopInfo;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarDetailInfo> AvatarDetails;
    UPROPERTY()
    FGetEUIModelRef AvatarDetailPopInfoDelegate;
    UPROPERTY()
    FGetEUIModelRef AvatarDetailsDelegate;

    UWidget_AvatarPop()
    {
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        FVM_AvatarInfo& local_4;
        TEUIModelRef<FVM_AvatarInfo> local_2;
        local_2.GetAvatarInfo();
        if (local_4)
        {
            local_4.GetAvatar().SetCurrentAvatar();
        }
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
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.AvatarDetailPopInfo.Initialize(this, FName("VM_AvatarDetailPopInfo"), EEUIWidgetRefModelCreationType(0), false);
        this.AvatarDetails.Initialize(this, FName("VM_AvatarDetailInfo"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.AvatarDetailPopInfoDelegate.IsBound())
        {
            this.AvatarDetailPopInfo.SetRef(this.AvatarDetailPopInfoDelegate.Execute());
        }
        if (this.AvatarDetailsDelegate.IsBound())
        {
            this.AvatarDetails.SetRef(this.AvatarDetailsDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_AvatarPop
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
