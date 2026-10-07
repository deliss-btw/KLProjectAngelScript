
namespace UWidget_AvatarAttributeInfo
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_AvatarAttributeInfo : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_AvatarAttributeList> AttributeList;
    UPROPERTY()
    FGetEUIModelRef AttributeListDelegate;

    UWidget_AvatarAttributeInfo()
    {
        return;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> AttributeList_AttributeItems() const
    {
        FVM_AvatarAttributeList& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetAttributeItems());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.AttributeList.Initialize(this, FName("VM_AvatarAttributeList"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.AttributeListDelegate.IsBound())
        {
            this.AttributeList.SetRef(this.AttributeListDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_AvatarAttributeInfo
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
