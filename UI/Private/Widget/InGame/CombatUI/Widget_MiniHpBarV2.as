
namespace UWidget_MiniHpBarV2
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_MiniHpBarV2 : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_MiniHPBarV2> MiniHpBar;
    UPROPERTY()
    float32 PreviewHpBarChaseSeconds = 0.7f;
    UPROPERTY()
    UWidgetAnimation Anim_FadeOut;
    UPROPERTY()
    EOffsetRefType DefaultDisplayOffsetType = EOffsetRefType(2);
    FEUIModelWeakRef __MiniHpBar;
    UPROPERTY()
    FGetEUIModelRef MiniHpBarDelegate;


    UFUNCTION()
    void SetEntity_Implementation(const FECSEntity &inout Entity)
    {
        this.MiniHpBar.SetRef(TEUIModelRef<FVM_MiniHPBarV2>(::FVM_MiniHPBarV2::Create(this, Entity, this.PreviewHpBarChaseSeconds)));
        return;
    }
    UFUNCTION()
    bool OverrideIconLocation_Implementation(const FECSEntity &inout Entity, FVector &out OverrideLocation) const
    {
        FVector local_6;
        OverrideLocation = local_6;
        FVector local_14(FVector::ZeroVector);
        Get local_18;
        const FC_PrefabInfoDisplayConfig& local_20 = local_18.opCall();
        if (local_20)
        {
            if (local_20.bOverrideDisplayOffset)
            {
                local_14 = local_20.OverrideDisplayOffset;
            }
        }
        OverrideLocation = FTransformUtils::GetOffsetRefLocation(Entity, FTransformUtils::GetTransform(Entity, FFPTime(-1)));
        OverrideLocation += local_14;
        return true;
    }
    UFUNCTION()
    void HandleIconActiveChanged(const bool bBarActive)
    {
        if (bBarActive)
        {
            this.PlayAnimation(this.Anim_FadeOut, this.Anim_FadeOut.GetEndTime(), 1, EUMGSequencePlayMode(1), 1.0f, (0 != 0));
            return;
        }
        this.PlayAnimationForward(this.Anim_FadeOut, 1.0f, (0 != 0));
        return;
    }
    UFUNCTION()
    float32 MiniHpBar_DisplayHpBarRatio() const
    {
        FVM_MiniHPBarV2& local_2;
        return local_2 ? local_2.GetDisplayHpBarRatio() : 0.0f;
    }
    UFUNCTION()
    float32 MiniHpBar_DisplayPreviewHpBarRatio() const
    {
        FVM_MiniHPBarV2& local_2;
        return local_2 ? local_2.GetDisplayPreviewHpBarRatio() : 0.0f;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_MiniHPBarV2& local_6;
        TEUIModelRef<FVM_MiniHPBarV2> local_2 = this.MiniHpBar.AsRef();
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
                    this.MiniHpBar.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_MiniHPBarV2::__IndexOf_bBarActive());
                    }
                    if (local_6)
                    {
                        this.HandleIconActiveChanged(local_6.GetbBarActive());
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
                XError(ELog(17), "Remaining observed model change: HandleIconActiveChanged");
            }
            return;
        }
        this.__MiniHpBar = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.MiniHpBar.Initialize(this, FName("VM_MiniHPBarV2"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.MiniHpBarDelegate.IsBound())
        {
            this.MiniHpBar.SetRef(this.MiniHpBarDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_MiniHpBarV2
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("HandleIconActiveChanged"));
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
