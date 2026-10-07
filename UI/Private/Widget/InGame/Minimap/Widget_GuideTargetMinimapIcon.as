
namespace UWidget_GuideTargetIcon
{
    const int ViewID = 0;
}
namespace UWidget_GuideTargetMinimapIcon
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_GuideTargetIcon : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_GuideTargetIcon> Icon;
    UPROPERTY()
    UWidgetSwitcher IconSwitcher;
    FEUIModelWeakRef __Icon;
    UPROPERTY()
    FGetEUIModelRef IconDelegate;

    UWidget_GuideTargetIcon()
    {
        return;
    }
    UFUNCTION()
    void OnIconIndexSet(const int IconIndex)
    {
        this.IconSwitcher.SetActiveWidgetIndex(IconIndex);
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_GuideTargetIcon& local_6;
        TEUIModelRef<FVM_GuideTargetIcon> local_2 = this.Icon.AsRef();
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
                    this.Icon.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_GuideTargetIcon::__IndexOf_IconIndex());
                    }
                    if (local_6)
                    {
                        this.OnIconIndexSet(local_6.GetIconIndex());
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
                XError(ELog(17), "Remaining observed model change: OnIconIndexSet");
            }
            return;
        }
        this.__Icon = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.Icon.Initialize(this, FName("VM_GuideTargetIcon"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.IconDelegate.IsBound())
        {
            this.Icon.SetRef(this.IconDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_GuideTargetMinimapIcon : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_GuideTargetMinimapIcon> GuideTarget;
    UPROPERTY()
    UWidget_GuideTargetIcon IconWidget;
    UPROPERTY()
    FGetEUIModelRef GuideTargetDelegate;

    UWidget_GuideTargetMinimapIcon()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        if (!(this.GuideTarget.IsValid()))
        {
            this.SetVisibility(ESlateVisibility(2));
        }
        return;
    }
    UFUNCTION()
    void Destruct_Implementation()
    {
        this.SetVisibility(ESlateVisibility(2));
        this.GuideTarget.ResetRef();
        return;
    }
    UFUNCTION()
    void SetCreater(const FECSEntity &inout Creater)
    {
        this.SetVisibility(ESlateVisibility(4));
        this.GuideTarget.SetRef(TEUIModelRef<FVM_GuideTargetMinimapIcon>(::FVM_GuideTargetMinimapIcon::Create(this, Creater)));
        return;
    }
    UFUNCTION()
    FEUIModelRef GuideTarget_Icon() const
    {
        FVM_GuideTargetMinimapIcon& local_2;
        FEUIModelRef local_8;
        if (local_2)
        {
            local_8 = local_2.GetIcon();
        }
        else
        {
            local_8 = FEUIModelRef();
        }
        return local_8;
    }
    UFUNCTION()
    void GuideTarget_RemoveGuideTarget() const
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
        this.GuideTarget.Initialize(this, FName("VM_GuideTargetMinimapIcon"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.GuideTargetDelegate.IsBound())
        {
            this.GuideTarget.SetRef(this.GuideTargetDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_GuideTargetIcon
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnIconIndexSet"));
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
namespace UWidget_GuideTargetMinimapIcon
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
