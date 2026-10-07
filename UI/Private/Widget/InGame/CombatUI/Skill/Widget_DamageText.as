
enum EDamageTextPhysicalType
{
    Normal,
    Critical,
    Weakness,
    WeaknessCritical,
}

namespace UWidget_DamageTextPanel
{
    const int ViewID = 0;
}
namespace UWidget_DamageText
{
    const int ViewID = 0;

}
UCLASS(Abstract)
class UWidget_DamageTextPanel : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_DmageTextPanel> DamageTextPanelVM;
    UPROPERTY()
    FGetEUIModelRef DamageTextPanelVMDelegate;

    UWidget_DamageTextPanel()
    {
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.DamageTextPanelVM.Initialize(this, FName("VM_DmageTextPanel"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.DamageTextPanelVMDelegate.IsBound())
        {
            this.DamageTextPanelVM.SetRef(this.DamageTextPanelVMDelegate.Execute());
        }
        return;
    }
}

UCLASS(Abstract)
class UWidget_DamageText : UEUIUserWidget
{
    UPROPERTY()
    TEUIWidgetModelRef<FVM_DmageText> DamageTextVM;
    UPROPERTY()
    UEUITextBlock DamageTextBlock;
    UPROPERTY()
    UCanvasPanel TextPanel;
    UPROPERTY()
    UWidget SizeBox;
    UPROPERTY()
    UEUIImage w_img_CriticalStrike;
    UPROPERTY()
    UEUIImage w_img_CriticalStrike_1;
    UPROPERTY()
    UEUIImage w_img_Weakness;
    UPROPERTY()
    UEUIImage w_img_Weakness_1;
    UPROPERTY()
    TMap<EDamageType, UMaterial> MatInstanceMap;
    UPROPERTY()
    UMaterial WeaknessMatInstance;
    UPROPERTY()
    UMaterial AttenuatedMatInstance;
    UPROPERTY()
    TMap<EDamageTextPhysicalType, UMaterial> PhysicalMatInstanceMap;
    UPROPERTY()
    TMap<EDamageTextPhysicalType, FSoftBrush> PhysicalCriticalTextBgMap;
    UPROPERTY()
    TMap<EDamageTextPhysicalType, FSoftBrush> PhysicalWeaknessTextBgMap;
    UPROPERTY()
    TMap<EDamageType, FSoftBrush> CriticalTextBgMap;
    UPROPERTY()
    TMap<EDamageType, FSoftBrush> WeaknessTextBgMap;
    UPROPERTY()
    UWidgetAnimation Anim_In_Out;
    UPROPERTY()
    UWidgetAnimation Anim_TextIn;
    UPROPERTY()
    UWidgetAnimation Anim_TextOut;
    UPROPERTY()
    float32 CurTickTime = 0.0f;
    FEUIModelWeakRef __DamageTextVM;
    UPROPERTY()
    FGetEUIModelRef DamageTextVMDelegate;


    UFUNCTION()
    void Construct_Implementation()
    {
        this.CurTickTime = 0.0f;
        return;
    }
    UFUNCTION()
    void OnViewBind_Implementation()
    {
        this.SetVisibility(ESlateVisibility(4));
        if (!(this.DamageTextVM.IsValid()))
        {
            return;
        }
        if (GetbPlayAnim())
        {
            this.CurTickTime = 0.0f;
            this.StopAnimation(this.Anim_TextOut);
            this.PlayAnimation(this.Anim_TextIn, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
            bool local_2 = false;
            local_2.SetbPlayAnim();
        }
        return;
    }
    UFUNCTION()
    void OnViewUnbind_Implementation()
    {
        this.CurTickTime = 0.0f;
        this.StopAnimation(this.Anim_TextIn);
        this.StopAnimation(this.Anim_TextOut);
        this.SetVisibility(ESlateVisibility(2));
        return;
    }
    UFUNCTION()
    void Tick_Implementation(const FGeometry &inout MyGeometry, const float32 InDeltaTime)
    {
        UPanelSlot local_28;
        UPanelSlot local_82;
        if (!(this.DamageTextVM.IsValid()))
        {
            return;
        }
        this.CurTickTime += InDeltaTime;
        if (this.CurTickTime >= GetDamageTextAnimDuration())
        {
            this.PlayAnimation(this.Anim_TextOut, 0.0f, 1, EUMGSequencePlayMode(0), 1.0f, false);
            this.CurTickTime = -9999.0f;
        }
        APlayerController local_14 = this.GetOwningPlayer();
        if (local_14 != nullptr)
        {
            FVector local_20(GetDamageTextData().HitPosition);
            FVector2D local_24;
            if (!(WidgetLayout::ProjectWorldLocationToWidgetPosition(local_14, local_20, local_24, false)))
            {
                local_28 = this.SizeBox.Slot;
                Cast<UCanvasPanelSlot>(local_28).SetPosition(FVector2D(9999.0, 9999.0));
                return;
            }
            FVector2D local_34 = MyGeometry.AbsoluteToLocal(WidgetLayout::GetViewportWidgetGeometry(__GetWorldContext()).LocalToAbsolute((local_24 + GetRandomOffset())));
            local_82 = this.SizeBox.Slot;
            Cast<UCanvasPanelSlot>(local_82).SetPosition(local_34);
        }
        return;
    }
    UFUNCTION()
    void OnDamageTextChange(const FDmageTextData &inout DamageTextData)
    {
        UMaterialInstanceDynamic local_2;
        UMaterialInstanceDynamic local_8;
        if (DamageTextData.bAttenuated)
        {
            local_8 = ::UDamageTextSubsystem::Get().AttenuatedMaterialInstanceDynamic;
            if (local_8 == nullptr)
            {
                local_8 = Material::CreateDynamicMaterialInstance(__GetWorldContext(), this.AttenuatedMatInstance, NAME_None, EMIDCreationFlags(0));
                ::UDamageTextSubsystem::Get().AttenuatedMaterialInstanceDynamic = local_8;
            }
            local_2 = ::UDamageTextSubsystem::Get().AttenuatedMaterialInstanceDynamic;
            this.DamageTextBlock.SetFontMaterial(local_2);
            return;
        }
        if (int(DamageTextData.DamageType) == 0)
        {
            int local_16;
            int local_15;
            local_16 = 0;
            local_15 = local_16;
            if ((DamageTextData.bCritical && DamageTextData.bHitWeakness))
            {
                local_16 = 3;
                local_15 = local_16;
            }
            else
            {
                bool local_3_3 = DamageTextData.bCritical;
                if (local_3_3)
                {
                    local_16 = 1;
                    local_15 = local_16;
                }
                else
                {
                    bool local_3_4 = DamageTextData.bHitWeakness;
                    if (local_3_4)
                    {
                        local_16 = 2;
                        local_15 = local_16;
                    }
                }
            }
            if (!(::UDamageTextSubsystem::Get().PhysicalMatInstanceDynamicMap.Contains(EDamageTextPhysicalType(local_15))))
            {
                local_2 = Material::CreateDynamicMaterialInstance(__GetWorldContext(), this.PhysicalMatInstanceMap[EDamageTextPhysicalType(local_15)], NAME_None, EMIDCreationFlags(0));
                ::UDamageTextSubsystem::Get().PhysicalMatInstanceDynamicMap.Add(EDamageTextPhysicalType(local_15), local_2);
            }
            else
            {
                local_2 = ::UDamageTextSubsystem::Get().PhysicalMatInstanceDynamicMap[EDamageTextPhysicalType(local_15)];
            }
            this.DamageTextBlock.SetFontMaterial(local_2);
            this.w_img_CriticalStrike.SetBrush(this.PhysicalCriticalTextBgMap[EDamageTextPhysicalType(local_15)].LoadBrush());
            this.w_img_CriticalStrike_1.SetBrush(this.PhysicalCriticalTextBgMap[EDamageTextPhysicalType(local_15)].LoadBrush());
            this.w_img_Weakness.SetBrush(this.PhysicalWeaknessTextBgMap[EDamageTextPhysicalType(local_15)].LoadBrush());
            this.w_img_Weakness_1.SetBrush(this.PhysicalWeaknessTextBgMap[EDamageTextPhysicalType(local_15)].LoadBrush());
            return;
        }
        if (DamageTextData.bHitWeakness && (int(DamageTextData.DamageType) == 0))
        {
            local_8 = ::UDamageTextSubsystem::Get().WeaknessMaterialInstanceDynamic;
            if (local_8 == nullptr)
            {
                local_8 = Material::CreateDynamicMaterialInstance(__GetWorldContext(), this.WeaknessMatInstance, NAME_None, EMIDCreationFlags(0));
                ::UDamageTextSubsystem::Get().WeaknessMaterialInstanceDynamic = local_8;
            }
            local_2 = ::UDamageTextSubsystem::Get().WeaknessMaterialInstanceDynamic;
        }
        else
        {
            if (!(::UDamageTextSubsystem::Get().MaterialInstanceDynamicMap.Contains(DamageTextData.DamageType)))
            {
                local_2 = Material::CreateDynamicMaterialInstance(__GetWorldContext(), this.MatInstanceMap[DamageTextData.DamageType], NAME_None, EMIDCreationFlags(0));
                ::UDamageTextSubsystem::Get().MaterialInstanceDynamicMap.Add(DamageTextData.DamageType, local_2);
            }
            else
            {
                local_2 = ::UDamageTextSubsystem::Get().MaterialInstanceDynamicMap[DamageTextData.DamageType];
            }
        }
        this.DamageTextBlock.SetFontMaterial(local_2);
        this.w_img_CriticalStrike.SetBrush(this.CriticalTextBgMap[DamageTextData.DamageType].LoadBrush());
        this.w_img_CriticalStrike_1.SetBrush(this.CriticalTextBgMap[DamageTextData.DamageType].LoadBrush());
        this.w_img_Weakness.SetBrush(this.WeaknessTextBgMap[DamageTextData.DamageType].LoadBrush());
        this.w_img_Weakness_1.SetBrush(this.WeaknessTextBgMap[DamageTextData.DamageType].LoadBrush());
        return;
    }
    void HandleObservedModelChanges(FEUIReactiveSubscriberIterator &inout It)
    {
        FVM_DmageText& local_6;
        TEUIModelRef<FVM_DmageText> local_2 = this.DamageTextVM.AsRef();
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
                    this.DamageTextVM.TrackRead();
                    if (local_6)
                    {
                        local_6.TrackPropertyRead(::FVM_DmageText::__IndexOf_DamageTextData());
                    }
                    if (local_6)
                    {
                        this.OnDamageTextChange(local_6.GetDamageTextData());
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
                XError(ELog(17), "Remaining observed model change: OnDamageTextChange");
            }
            return;
        }
        this.__DamageTextVM = local_2.opImplConv();
        return;
    }
    UFUNCTION()
    void CodeGenInitProperty()
    {
        this.DamageTextVM.Initialize(this, FName("VM_DmageText"), EEUIWidgetRefModelCreationType(0), false);
        return;
    }
    UFUNCTION()
    void CodeGenConstruct()
    {
        if (this.DamageTextVMDelegate.IsBound())
        {
            this.DamageTextVM.SetRef(this.DamageTextVMDelegate.Execute());
        }
        return;
    }
}

namespace UWidget_DamageTextPanel
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
namespace UWidget_DamageText
{
void GetModelInfo(FEUIWidgetMetaInfo &inout Result)
{
    Result.ObservedModelChangesSubscriberNames.Add(FString("OnDamageTextChange"));
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
