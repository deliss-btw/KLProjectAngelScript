
namespace UWidget_InteractTarget_Panel
{
    const int ViewID = 0;

// NOTE: class defaults are not authored in this module: UWidget_InteractTarget_Panel (default scalar field UEUIActivatableWidget.bAutoActivate has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

}
class UWidget_InteractTarget_Panel : UEUIActivatableWidget
{
    UPROPERTY()
    UCanvasPanel UI_InteractTargetPanel;
    UPROPERTY()
    TSubclassOf<UWidget_InteractTarget> UI_InteractTarget_WidgetBPClass;
    UPROPERTY()
    TSubclassOf<UWidget_InteractTargetIcon> UI_InteractTargetIcon_WidgetBPClass;
    UPROPERTY()
    TSubclassOf<UWidget_InteractProgress> UI_InteractProgress_WidgetBPClass;
    UPROPERTY()
    TSubclassOf<UWidget_InteractTipTargetIcon> UI_InteractTipTargetIcon_WidgetBPClass;
    UPROPERTY()
    UWidget_InteractTarget UI_InteractTarget_Replace_F;
    UPROPERTY()
    UWidget_InteractTarget UI_InteractTarget_Replace_Z;
    UPROPERTY()
    UWidget_InteractTargetIcon UI_InteractTargetIcon_Replace_F;
    UPROPERTY()
    UWidget_InteractTargetIcon UI_InteractTargetIcon_Replace_Z;
    UPROPERTY()
    TArray<UWidget_InteractTipTargetIcon> UI_InteractTipTargetIcons;
    UPROPERTY()
    UWidget_InteractProgress UI_InteractProgress_Replace;

    UWidget_InteractTarget_Panel()
    {
        return;
    }
    UFUNCTION()
    void Construct_Implementation()
    {
        this.SetVisibility(ESlateVisibility(4));
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        float32 local_23;
        FECSEntity local_4 = FECSEntity(UECSFunctionLibraryExtension::GetLocalPlayerPawnEntity(__GetWorldContext()));
        if (!(local_4.GetWorld().IsValid()))
        {
            return;
        }
        if ((local_4 == ENTITY_NULL))
        {
            return;
        }
        if (!(HeadsUpDisplay_Dev::CVar_EnableHeadsUpDisplay.GetBool()))
        {
            this.InteractTargetWidget(local_4, EInteractMode(1));
        }
        this.InteractTargetWidget(local_4, EInteractMode(0));
        this.InteractTipTargetWidget(local_4);
        FECSWorldPtr local_12 = local_4.GetWorld();
        Get local_20;
        AECSPlayerController local_22 = local_20.opCall().UEPlayerController;
        FVector local_30;
        FText local_34;
        bool local_35 = false;
        local_35 = ::FInteractUtils::GetCurrentInteractProgressInfoForUI(local_4, local_30, local_23, local_34);
        if (local_35)
        {
            if (this.UI_InteractProgress_Replace == nullptr)
            {
                this.UI_InteractProgress_Replace = Cast<UWidget_InteractProgress>(this.CreateInteractTargetWidget(this.UI_InteractProgress_WidgetBPClass, local_22));
                this.UI_InteractProgress_Replace.AddToPlayerScreen(-100);
            }
            this.SetWidgetPosition(local_22, this.UI_InteractProgress_Replace, local_30);
            this.UI_InteractProgress_Replace.SetVisibility(ESlateVisibility(0));
            this.UI_InteractProgress_Replace.AS_ProgressBar.SetPercent(local_23);
            this.UI_InteractProgress_Replace.AS_Text_ProgressType.SetText(local_34);
        }
        else
        {
            if (this.UI_InteractProgress_Replace != nullptr)
            {
                this.UI_InteractProgress_Replace.SetVisibility(ESlateVisibility(2));
            }
        }
        return;
    }
    UUserWidget CreateInteractTargetWidget(const UClass WidgetClass, const APlayerController PlayerController)
    {
        if ((WidgetClass == nullptr || (PlayerController == nullptr)))
        {
            return nullptr;
        }
        UUserWidget local_10 = WidgetBlueprint::CreateWidget(__GetWorldContext(), TSubclassOf<UUserWidget>(WidgetClass), PlayerController);
        if (local_10 == nullptr)
        {
            System::PrintString(__GetWorldContext(), FString().Append("value=CreateInteractTargetWidget failed, Result is nullptr"), true, false, FLinearColor::Blue, 5.0f, NAME_None);
            return nullptr;
        }
        UCanvasPanelSlot local_20 = this.UI_InteractTargetPanel.AddChildToCanvas(local_10);
        if (local_20 == nullptr)
        {
            System::PrintString(__GetWorldContext(), FString().Append("value=CreateInteractTargetWidget failed, CanvasSlot is nullptr"), true, false, FLinearColor::Blue, 5.0f, NAME_None);
            return nullptr;
        }
        local_20.SetAnchors(FAnchors(0.0f, 0.0f, 1.0f, 1.0f));
        local_20.SetZOrder(-100);
        local_20.SetSize(FVector2D::ZeroVector);
        return local_10;
    }
    void SetWidgetPosition(const APlayerController PlayerController, const UUserWidget Widget, const FVector &inout Position3D)
    {
        FVector2D local_4;
        PlayerController.ProjectWorldLocationToScreen(Position3D, local_4, true);
        local_4 /= (WidgetLayout::GetViewportScale(__GetWorldContext()) * 1.33f);
        UPanelSlot local_18 = Widget.Slot;
        Cast<UCanvasPanelSlot>(local_18).SetPosition(local_4);
        return;
    }
    void InteractTargetWidget(const FECSEntity &inout LocalPlayerPawnEntity, const EInteractMode InteractMode)
    {
        int local_90 = 0;
        int local_94 = 0;
        FECSWorldPtr local_2 = LocalPlayerPawnEntity.GetWorld();
        Get local_6;
        AECSPlayerController local_8 = local_6.opCall().UEPlayerController;
        bool local_9 = false;
        FVector local_16;
        FVector2D local_20;
        FString local_24;
        bool local_10 = false;
        FString local_25 = local_10;
        FSoftBrush local_72;
        FVector local_78;
        FVector2D local_82;
        bool local_10_2 = false;
        FVector2D local_83 = local_10_2;
        FECSEntity local_88;
        local_9 = ::FInteractUtils::GetCurrentInteractTargetInfoForUI(LocalPlayerPawnEntity, EInteractMode(InteractMode), local_16, local_20, local_24, local_25, local_72, local_78, local_82, local_83, local_88);
        if (local_8 == nullptr)
        {
            return;
        }
        if (int(InteractMode) == 0)
        {
        }
        else
        {
        }
        if (int(InteractMode) == 0)
        {
        }
        else
        {
        }
        if (local_9)
        {
            UWidget_InteractTarget local_98;
            this.SetVisibility(ESlateVisibility(4));
            local_98 = local_90;
            if (local_98 == nullptr)
            {
                local_98 = Cast<UWidget_InteractTarget>(this.CreateInteractTargetWidget(this.UI_InteractTarget_WidgetBPClass, local_8));
                local_90.SetInputActionType(EInteractMode(InteractMode));
            }
            this.SetWidgetPosition(local_8, local_90, local_16);
            bool local_10_3 = !(local_72.GetResourceObject().IsNull());
            if ((local_10_3 && !(!(local_24.IsEmpty())) && !(local_83)))
            {
                local_90.SetVisibility(ESlateVisibility(1));
            }
            else
            {
                local_90.AS_Text_InteractType.SetText(FText::FromString(local_24));
                local_90.AS_Text_InteractType.SetRenderTranslation(local_20);
                FLinearColor local_126;
                if (local_25 != 0)
                {
                    local_126 = FLinearColor(1.0f, 0.5f, 0.5f, 1.0f);
                }
                else
                {
                    local_126 = FLinearColor::White;
                }
                local_90.AS_Text_InteractType.SetColorAndOpacity(FSlateColor(local_126));
                local_90.ForceLayoutPrepass();
                local_90.SetVisibility(ESlateVisibility(4));
            }
            local_90.AS_InteractActionSwitch.SetRenderTranslation(local_20);
            if (local_10_3)
            {
                UWidget_InteractTargetIcon local_134;
                local_134 = local_94;
                if (local_134 == nullptr)
                {
                    local_134 = Cast<UWidget_InteractTargetIcon>(this.CreateInteractTargetWidget(this.UI_InteractTargetIcon_WidgetBPClass, local_8));
                }
                local_94.AS_Image_Icon.SetBrush(local_72.LoadBrush());
                local_94.AS_Image_Icon.SetRenderTranslation(local_82);
                this.SetWidgetPosition(local_8, local_94, local_78);
                local_94.SetVisibility(ESlateVisibility(3));
            }
            else
            {
                UWidget_InteractTargetIcon local_134;
                local_134 = local_94;
                if (local_134 != nullptr)
                {
                    local_94.SetVisibility(ESlateVisibility(2));
                }
            }
        }
        else
        {
            UWidget_InteractTargetIcon local_134;
            UWidget_InteractTarget local_98;
            local_98 = local_90;
            if (local_98 != nullptr)
            {
                local_90.SetVisibility(ESlateVisibility(2));
            }
            local_134 = local_94;
            if (local_134 != nullptr)
            {
                local_94.SetVisibility(ESlateVisibility(2));
            }
        }
        return;
    }
    void InteractTipTargetWidget(const FECSEntity &inout LocalPlayerPawnEntity)
    {
        UWidget_InteractTipTargetIcon local_24;
        FECSWorldPtr local_2 = LocalPlayerPawnEntity.GetWorld();
        Get local_6;
        AECSPlayerController local_8 = local_6.opCall().UEPlayerController;
        bool local_9 = false;
        TArray<FInteractTipTargetHUDRenderInfo> local_14;
        local_9 = ::FInteractUtils::GetCurrentInteractTipTargetInfoForUI(LocalPlayerPawnEntity, local_14);
        if (local_8 == nullptr)
        {
            return;
        }
        if (local_9)
        {
            int local_16 = local_14.Num();
            if (this.UI_InteractTipTargetIcons.Num() < local_16)
            {
                int local_18 = 0;
                for (; local_18 < (local_14.Num() - this.UI_InteractTipTargetIcons.Num()); )
                {
                    local_24 = Cast<UWidget_InteractTipTargetIcon>(this.CreateInteractTargetWidget(this.UI_InteractTipTargetIcon_WidgetBPClass, local_8));
                    this.UI_InteractTipTargetIcons.Add(local_24);
                    ++local_18;
                }
            }
            int local_18_2 = 0;
            for (; local_18_2 < local_14.Num(); ++local_18_2)
            {
                if (local_18_2 < this.UI_InteractTipTargetIcons.Num())
                {
                    this.UI_InteractTipTargetIcons[local_18_2].AS_Image_Icon.SetBrush(local_14[local_18_2].HUDIcon.LoadBrush());
                    this.UI_InteractTipTargetIcons[local_18_2].AS_Image_Icon.SetRenderTranslation(local_14[local_18_2].HUDIconDisplayUIOffset);
                    this.SetWidgetPosition(local_8, this.UI_InteractTipTargetIcons[local_18_2], local_14[local_18_2].HUDIconDisplayLocation);
                    this.UI_InteractTipTargetIcons[local_18_2].SetVisibility(ESlateVisibility(0));
                }
            }
            int local_15_2 = local_14.Num();
            for (; local_15_2 < this.UI_InteractTipTargetIcons.Num(); )
            {
                this.UI_InteractTipTargetIcons[local_15_2].SetVisibility(ESlateVisibility(2));
                ++local_15_2;
            }
        }
        else
        {
            for (auto local_26 : this.UI_InteractTipTargetIcons)
            {
                local_26.SetVisibility(ESlateVisibility(2));
            }
        }
        return;
    }
}

namespace UWidget_InteractTarget_Panel
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
