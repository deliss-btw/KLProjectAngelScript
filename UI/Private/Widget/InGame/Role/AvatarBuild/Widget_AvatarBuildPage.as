
namespace UWidget_AvatarBuildPage
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_AvatarBuildPage : UEUIActivatableWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarBuildPage> AvatarBuild;
    UPROPERTY()
    FGetEUIModelRef AvatarBuildDelegate;

    UWidget_AvatarBuildPage()
    {
        return;
    }
    UFUNCTION()
    TEUIModelRef<FVM_AvatarAttributeList> AvatarBuild_AvatarAttributeList() const
    {
        FVM_AvatarBuildPage& local_2;
        TEUIModelRef<FVM_AvatarAttributeList> local_10;
        if (local_2)
        {
            local_10 = local_2.GetAvatarAttributeList();
        }
        else
        {
            local_10 = TEUIModelRef<FVM_AvatarAttributeList>();
        }
        return local_10;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> AvatarBuild_AvatarTraitList() const
    {
        FVM_AvatarBuildPage& local_2;
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
    FEUIModelRef AvatarBuild_EditingPlayerAvatar() const
    {
        FVM_AvatarBuildPage& local_2;
        FEUIModelRef local_8 = local_2 ? local_2.GetEditingPlayerAvatar() : FEUIModelRef();
        return local_8;
    }
    UFUNCTION()
    FEUIModelRef AvatarBuild_AvatarEquipment() const
    {
        FVM_AvatarBuildPage& local_2;
        FEUIModelRef local_8;
        if (local_2)
        {
            local_8 = local_2.GetAvatarEquipment();
        }
        else
        {
            local_8 = FEUIModelRef();
        }
        return local_8;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.AvatarBuild.Initialize(this, FName("VM_AvatarBuildPage"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.AvatarBuildDelegate.IsBound())
        {
            this.AvatarBuild.SetRef(this.AvatarBuildDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_AvatarBuildPage
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
