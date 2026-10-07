
namespace UWidget_SideHint
{
    const int ViewID = 0;

}
class UWidget_SideHint : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_SideHint> SideHint;

    UWidget_SideHint()
    {
        return;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> SideHint_SideHintArray() const
    {
        FVMS_SideHint& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetSideHintArray());
        }
        else
        {
            local_16 = TArray<FEUIModelWeakRef>();
        }
        return local_16;
    }
    UFUNCTION()
    TArray<FEUIModelWeakRef> SideHint_ImportantSideHintArray() const
    {
        FVMS_SideHint& local_2;
        TArray<FEUIModelWeakRef> local_16;
        if (local_2)
        {
            local_16 = EUIInternal::AsWeakRefList(local_2.GetImportantSideHintArray());
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
        this.SideHint.Initialize(this, FName("VMS_SideHint"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_SideHint
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
