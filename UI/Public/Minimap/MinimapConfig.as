

// NOTE: class defaults are not authored in this module: FEUIActionBindingMinimapAction (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

struct FEUIActionBindingMinimapAction : FEUIActionBindingCustom
{
    FEUIActionBindingCustom _base_FEUIActionBindingCustom;
    UPROPERTY()
    FMinimapActionCallback OnMinimapAction;
    UPROPERTY()
    FEUIModelWeakRef OwnerModel;

    FEUIActionBindingMinimapAction()
    {
        this.__InitDefaults();
        return;
    }
    void DeferRegisterAction(const FEUIModelRef &inout Model, const ULocalPlayer Player, const FEUIViewModel &inout InViewModel, const FEUIModelCallbackSignature &inout InCallbackSignature)
    {
        this.UnRegister();
        this.OwnerModel = FEUIModelWeakRef(Model);
        this.OnMinimapAction.Bind(InViewModel, InCallbackSignature);
        this.DeferRegisterForModel(Model, Player);
        return;
    }
    void UnRegisterForModel(const FEUIModelRef &inout Model)
    {
        FEUIModelRef local_2 = this.OwnerModel.AsRef();
        if (local_2.IsValid() && !((local_2 == Model)))
        {
            return;
        }
        this.OwnerModel.Reset();
        this.UnRegister();
        return;
    }
    void OnBindingExecute_Implementation()
    {
        if (this.OnMinimapAction.IsBound())
        {
            this.OnMinimapAction.Execute();
        }
        return;
    }
}

class UMinimapGlobalConfig : UGameplaySettingsBase
{
    UPROPERTY()
    FEUIActionBindingMinimapAction GuideAction;
    UPROPERTY()
    FEUIActionBindingMinimapAction CancelGuideAction;
    UPROPERTY()
    FEUIActionBindingMinimapAction TeleportAction;
    UPROPERTY()
    FEUIActionBindingMinimapAction MarkAction;
    UPROPERTY()
    FEUIActionBindingMinimapAction CancelMarkAction;
    UPROPERTY()
    FEUIActionBindingMinimapAction MarkAndGuideAction;
    UPROPERTY()
    FEUIActionBindingMinimapAction CancelMarkAndGuideAction;
    UPROPERTY()
    TMap<EEntityMinimapIconType, TSoftClassPtr<UUserWidget>> DefaultIconWidgets;
    UPROPERTY()
    TSubclassOf<UMinimapIconRegistryAsset> DefaultLevelSpotIconRegistry;
    UPROPERTY()
    TMap<EMinimapIconDecoratorType, UMinimapIconDecoratorBase> MinimapIconDecorators;
    UPROPERTY()
    TDataObjectPtr<FMinimapIconSimplifiedDisplayRule> DefaultMinimapIconSimplifiedDisplayRule;
    UPROPERTY()
    TSubclassOf<UMinimapIconRegistryAsset> SystemIconRegistry;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> DefaultTooltipWidgetClass;
    UPROPERTY()
    float32 SelectedIconScale = 1.2f;
    UPROPERTY()
    FMinimapPathStyle GuidingPathStyle;
    UPROPERTY()
    FMinimapPathStyle UncertainGuidingPathStyle;
    UPROPERTY()
    float32 GuidingPathTension = 0.0f;
    UPROPERTY()
    TSoftClassPtr<UUserWidget> ChangeAreaIconWidget;
    UPROPERTY()
    FVector2D ChangeAreaIconSize = FVector2D(32.0, 32.0);
    UPROPERTY()
    int ChangeAreaIconZOrder;
    UPROPERTY()
    FMinimapPathStyle ChangeAreaPathStyle;
    UPROPERTY()
    TSoftClassPtr<UUserWidget> BossTrackingAreaIconWidget;
    UPROPERTY()
    int BossTrackingAreaIconZOrder = -100;


}

