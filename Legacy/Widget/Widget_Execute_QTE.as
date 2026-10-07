
namespace UWidget_Execute_QTE
{
    const int ViewID = 0;

}
class UWidget_Execute_QTE : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVMS_ProgressOperation> VMS_ProgressOperation;
    UPROPERTY()
    UProgressBar ExecutePowerBar;
    UPROPERTY()
    UEUIInputActionWidget IAWidget_InputHint;
    UPROPERTY()
    FEUIInputActionDataRow InputActionRow;
    UPROPERTY()
    UWidgetAnimation PressHint;
    UPROPERTY()
    TSubclassOf<UWidget_QTE_Result> UI_QTE_Result;
    UPROPERTY()
    TSubclassOf<UWidget_QTE_Result> UI_QTE_Result_Fail;
    UPROPERTY()
    UCanvasPanel DisplayCanvas;
    FEUIModelWeakRef __VMS_ProgressOperation;

    UWidget_Execute_QTE()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        this.PlayAnimation(this.PressHint, 0.0f, 0, EUMGSequencePlayMode(0), 1.0f, (0 != 0));
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        FVMS_ProgressOperation local_2;
        FECSEntity local_6 = FECSEntity(local_2.GetTargetEntity());
        if (!(local_6.IsValid()))
        {
            return;
        }
        FVector local_24 = FTransformUtils::GetLocation(local_6, FFPTime(-1));
        FVector2D local_28;
        this.GetOwningPlayer().ProjectWorldLocationToScreen(local_24, local_28, false);
        this.SetPositionInViewport(local_28, true);
        return;
    }
    UFUNCTION()
    void OnStateChanged(const EProgressOperationState State)
    {
        UWidget_QTE_Result local_6;
        if (int(State) == 3)
        {
            this.DisplayCanvas.SetRenderOpacity(0.0f);
            local_6 = (Cast<UWidget_QTE_Result>(WidgetBlueprint::CreateWidget(__GetWorldContext(), this.UI_QTE_Result, this.GetOwningPlayer())));
            local_6.AddToViewport(0);
        }
        else
        {
            if ((int(State) == 4 || (int(State) == 5)))
            {
                local_6 = (Cast<UWidget_QTE_Result>(WidgetBlueprint::CreateWidget(__GetWorldContext(), this.UI_QTE_Result_Fail, this.GetOwningPlayer())));
                local_6.AddToViewport(0);
            }
        }
        if (int(State) >= 3)
        {
            FVMS_ProgressOperation local_18;
            FEUIWidget::RemoveWidget(local_18.GetPageHandle());
        }
        return;
    }
    UFUNCTION()
    float32 VMS_ProgressOperation_ValueProgress() const
    {
        FVMS_ProgressOperation& local_2;
        return local_2 ? local_2.GetValueProgress() : 0.0f;
    }
    UFUNCTION()
    float32 VMS_ProgressOperation_TimeProgress() const
    {
        FVMS_ProgressOperation& local_2;
        float32 local_4;
        if (local_2)
        {
            local_4 = local_2.GetTimeProgress();
        }
        else
        {
            local_4 = 0.0f;
        }
        return local_4;
    }
    UFUNCTION()
    FWidgetTransform VMS_ProgressOperation_PointerTrans() const
    {
        FVMS_ProgressOperation& local_2;
        FWidgetTransform local_32 = local_2 ? local_2.GetPointerTrans() : FWidgetTransform();
        return local_32;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVMS_ProgressOperation& local_6;
        TEUIModelRef<FVMS_ProgressOperation> local_2 = this.VMS_ProgressOperation.AsRef();
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
                    this.VMS_ProgressOperation.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVMS_ProgressOperation::__IndexOf_State());
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
                XError(ELog(17), "Remaining observed model change: OnStateChanged");
            }
            return;
        }
        this.__VMS_ProgressOperation = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.VMS_ProgressOperation.Initialize(this, FName("VMS_ProgressOperation"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        return;
    }
}

namespace UWidget_Execute_QTE
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
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
