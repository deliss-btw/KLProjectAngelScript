
namespace UWidget_AnnularProgressBar
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_AnnularProgressBar : UEUIUserWidget
{
    UPROPERTY()
    UMaterialInstance ProgressBarMaterial;
    UPROPERTY()
    UMaterialInstanceDynamic ProgressBarMaterialDynamic;
    UPROPERTY()
    UImage ProgressImage;
    UPROPERTY()
    float32 StartOffset = 0.0f;
    UPROPERTY()
    float32 Softness = 100.0f;
    UPROPERTY()
    TEUIWidgetModelRef<FVM_CommonAnnularProgressBar> CurrencyBar;
    FEUIModelWeakRef __CurrencyBar;
    UPROPERTY()
    FGetEUIModelRef CurrencyBarDelegate;


    UFUNCTION()
    void PreConstruct_Implementation(const bool bIsDesignTime)
    {
        this.ProgressBarMaterialDynamic = Material::CreateDynamicMaterialInstance(__GetWorldContext(), this.ProgressBarMaterial, NAME_None, EMIDCreationFlags(0));
        this.ProgressImage.SetBrushFromMaterial(this.ProgressBarMaterialDynamic);
        this.ProgressBarMaterialDynamic.SetScalarParameterValue(n"StartOffset", this.StartOffset);
        this.ProgressBarMaterialDynamic.SetScalarParameterValue(n"Softness", this.Softness);
        return;
    }
    UFUNCTION()
    void SetProgress(const float InProgress)
    {
        this.ProgressBarMaterialDynamic.SetScalarParameterValue(n"Progress", float32(GetShowProgress()));
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_CommonAnnularProgressBar& local_6;
        TEUIModelRef<FVM_CommonAnnularProgressBar> local_2 = this.CurrencyBar.AsRef();
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
                    this.CurrencyBar.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_CommonAnnularProgressBar::__IndexOf_Progress());
                    }
                    if (local_6)
                    {
                        this.SetProgress(local_6.GetProgress());
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
                XError(ELog(17), "Remaining observed model change: SetProgress");
            }
            return;
        }
        this.__CurrencyBar = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.CurrencyBar.Initialize(this, FName("VM_CommonAnnularProgressBar"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.CurrencyBarDelegate.IsBound())
        {
            this.CurrencyBar.SetRef(this.CurrencyBarDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_AnnularProgressBar
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("SetProgress"));
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
