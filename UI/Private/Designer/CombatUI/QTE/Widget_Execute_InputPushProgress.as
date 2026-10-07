
namespace UWidget_Execute_InputPushProgress
{
    const int ViewID = 0;

}
class UWidget_Execute_InputPushProgress : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_Execute_InputPushProgress> InputPushProgressVM;
    UPROPERTY()
    UWidgetAnimation Anim_Success;
    UPROPERTY()
    UWidgetAnimation Anim_Failed;
    UPROPERTY()
    UEUIImage UI_HUD_QTEProgress;
    UPROPERTY()
    UMaterialInstanceDynamic ProgressMID;
    UPROPERTY()
    float32 timer = 9999.0f;
    FEUIModelWeakRef __InputPushProgressVM;
    UPROPERTY()
    FGetEUIModelRef InputPushProgressVMDelegate;


    UFUNCTION()
    void Construct_Implementation()
    {
        UMaterialInterface local_50;
        UObject local_52;
        if (this.UI_HUD_QTEProgress != nullptr)
        {
            FSlateBrush local_48 = this.UI_HUD_QTEProgress.GetBrush();
            local_52 = local_48.ResourceObject;
            local_50 = (Cast<UMaterialInterface>(local_52));
            if (local_50 != nullptr)
            {
                this.ProgressMID = Material::CreateDynamicMaterialInstance(__GetWorldContext(), local_50, NAME_None, EMIDCreationFlags(0));
                local_48.ResourceObject = this.ProgressMID;
                this.UI_HUD_QTEProgress.SetBrush(local_48);
            }
        }
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        this.timer -= InDeltaTime;
        if (this.timer <= 0.0f)
        {
            FVM_Execute_InputPushProgress local_2;
            FEUIWidget::RemoveWidget(local_2.GetPageHandle());
            this.timer = 9999.0f;
        }
        return;
    }
    UFUNCTION()
    void OnProgressRatioChanged(const float32 Ratio)
    {
        if (this.ProgressMID != nullptr)
        {
            this.ProgressMID.SetScalarParameterValue(n"Progress ValueV", FMath::Clamp(Ratio, 0.0f, 1.0f));
        }
        return;
    }
    UFUNCTION()
    void OnStateChanged(const EProgressOperationState State)
    {
        if (int(State) == 3)
        {
            this.PlayAnimation(this.Anim_Success, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
        }
        else
        {
            if ((int(State) == 4 || (int(State) == 5)))
            {
                this.PlayAnimation(this.Anim_Failed, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
            }
        }
        if (int(State) >= 3)
        {
            FVM_Execute_InputPushProgress& local_14;
            this.timer = ((local_14.GetMaxTime() - local_14.GetCurTime()) + 0.6f);
        }
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_Execute_InputPushProgress& local_6;
        TEUIModelRef<FVM_Execute_InputPushProgress> local_2 = this.InputPushProgressVM.AsRef();
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
                    this.InputPushProgressVM.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_Execute_InputPushProgress::__IndexOf_CurProgressRatio());
                    }
                    if (local_6)
                    {
                        this.OnProgressRatioChanged(local_6.GetCurProgressRatio());
                    }
                    this.InputPushProgressVM.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_Execute_InputPushProgress::__IndexOf_State());
                    }
                    if (local_6)
                    {
                        this.OnStateChanged(local_6.GetState());
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
                XError(ELog(17), "Remaining observed model change: OnProgressRatioChanged");
            }
            if (It.IsDirty(1))
            {
                XError(ELog(17), "Remaining observed model change: OnStateChanged");
            }
            return;
        }
        this.__InputPushProgressVM = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.InputPushProgressVM.Initialize(this, FName("VM_Execute_InputPushProgress"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.InputPushProgressVMDelegate.IsBound())
        {
            this.InputPushProgressVM.SetRef(this.InputPushProgressVMDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_Execute_InputPushProgress
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnProgressRatioChanged"));
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnStateChanged"));
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
