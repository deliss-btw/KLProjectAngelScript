
namespace FVM_BonfirePage_Supply
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature GenerateHoverModel = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnAddButtonClicked = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnConfirmButtonClicked = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnCancelButtonClicked = FEUIModelCallbackSignature();

}
struct FVM_BonfirePage_Supply : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_TitleAndDesc> m_TitleAndDescVM;
    UPROPERTY()
    FEUIModelContainer m_HoverModels;
    UPROPERTY()
    TSoftClassPtr<UUserWidget> m_HoverWidgetClass;
    UPROPERTY()
    int m_HoverRequestVersion;
    UPROPERTY()
    TWeakObjectPtr<UWidget> m_SharedHoverAnchor;
    UPROPERTY()
    ECommonHoverLayout m_SharedHoverLayout;
    UPROPERTY()
    ESlateVisibility m_TeleportVisibility;
    UPROPERTY()
    FECSEntity m_Bonfire;
    UPROPERTY()
    FECSEntity m_LocalPlayerPawn;
    UPROPERTY()
    FECSEntity m_LocalPlayer;
    UPROPERTY()
    FUIInteractAbilityGroup m_AbilityGroup;
    UPROPERTY()
    int m_BonfireState;
    UPROPERTY()
    FText m_TitleText;
    UPROPERTY()
    FText m_TipsTitleText;
    UPROPERTY()
    FText m_TipsText;
    UPROPERTY()
    FText m_RemainedRefillTimes;
    UPROPERTY()
    FText m_RemainedRefillTimesMax;
    UPROPERTY()
    FText m_ResidualText;
    UPROPERTY()
    FText m_RefillCostHint;
    UPROPERTY()
    FText m_HintText;
    UPROPERTY()
    FText m_ButtonText;
    UPROPERTY()
    FText m_ConsumeKeyText;
    UPROPERTY()
    FText m_SupplyHintText;
    UPROPERTY()
    float32 m_ConsumeOpacity;
    UPROPERTY()
    TArray<FEUIModelRef> m_ItemRefs;
    UPROPERTY()
    float32 m_FillPercent;
    UPROPERTY()
    ESlateVisibility m_AddButtonVisibility;
    UPROPERTY()
    ESlateVisibility m_TipsVisibility;
    UPROPERTY()
    ESlateVisibility m_LeftVisibility;
    UPROPERTY()
    ESlateVisibility m_RightVisibility;
    UPROPERTY()
    const UAS_GameModeSettingsPVX m_GameModeSettings;
    UPROPERTY()
    FMW_EBBInt m_RefillTimesSource;
    UPROPERTY()
    FMW_EBBInt m_RefillTimesMaxSource;

    FVM_BonfirePage_Supply()
    {
        this.m_GameModeSettings = nullptr;
        this.m_HoverRequestVersion = 0;
        this.m_SharedHoverLayout = ECommonHoverLayout(0);
        this.m_TeleportVisibility = ESlateVisibility(0);
        this.m_BonfireState = 0;
        this.m_ConsumeOpacity = 1.0f;
        this.m_FillPercent = 0.0f;
        this.m_AddButtonVisibility = ESlateVisibility(2);
        this.m_TipsVisibility = ESlateVisibility(2);
        this.m_LeftVisibility = ESlateVisibility(0);
        this.m_RightVisibility = ESlateVisibility(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_BonfirePage_Supply(const FVM_BonfirePage_Supply &inout Other)
    {
        this.m_GameModeSettings = nullptr;
        this.m_HoverRequestVersion = 0;
        this.m_SharedHoverLayout = ECommonHoverLayout(0);
        this.m_TeleportVisibility = ESlateVisibility(0);
        this.m_BonfireState = 0;
        this.m_ConsumeOpacity = 1.0f;
        this.m_FillPercent = 0.0f;
        this.m_AddButtonVisibility = ESlateVisibility(2);
        this.m_TipsVisibility = ESlateVisibility(2);
        this.m_LeftVisibility = ESlateVisibility(0);
        this.m_RightVisibility = ESlateVisibility(0);
        this.m_TitleAndDescVM = Other.m_TitleAndDescVM;
        this.m_HoverModels = Other.m_HoverModels;
        this.m_HoverWidgetClass = Other.m_HoverWidgetClass;
        this.m_HoverRequestVersion = int(Other.m_HoverRequestVersion);
        this.m_SharedHoverAnchor = Other.m_SharedHoverAnchor;
        this.m_SharedHoverLayout = Other.m_SharedHoverLayout;
        this.m_TeleportVisibility = Other.m_TeleportVisibility;
        this.m_Bonfire = Other.m_Bonfire;
        this.m_LocalPlayerPawn = Other.m_LocalPlayerPawn;
        this.m_LocalPlayer = Other.m_LocalPlayer;
        this.m_BonfireState = int(Other.m_BonfireState);
        this.m_TitleText = Other.m_TitleText;
        this.m_TipsTitleText = Other.m_TipsTitleText;
        this.m_TipsText = Other.m_TipsText;
        this.m_RemainedRefillTimes = Other.m_RemainedRefillTimes;
        this.m_RemainedRefillTimesMax = Other.m_RemainedRefillTimesMax;
        this.m_ResidualText = Other.m_ResidualText;
        this.m_RefillCostHint = Other.m_RefillCostHint;
        this.m_HintText = Other.m_HintText;
        this.m_ButtonText = Other.m_ButtonText;
        this.m_ConsumeKeyText = Other.m_ConsumeKeyText;
        this.m_SupplyHintText = Other.m_SupplyHintText;
        this.m_ConsumeOpacity = Other.m_ConsumeOpacity;
        this.m_ItemRefs = Other.m_ItemRefs;
        this.m_FillPercent = Other.m_FillPercent;
        this.m_AddButtonVisibility = Other.m_AddButtonVisibility;
        this.m_TipsVisibility = Other.m_TipsVisibility;
        this.m_LeftVisibility = Other.m_LeftVisibility;
        this.m_RightVisibility = Other.m_RightVisibility;
        this.m_GameModeSettings = Other.m_GameModeSettings;
        this.m_RefillTimesSource = Other.m_RefillTimesSource;
        this.m_RefillTimesMaxSource = Other.m_RefillTimesMaxSource;
        return;
    }
    FVM_BonfirePage_Supply& opAssign(const FVM_BonfirePage_Supply &inout Other)
    {
        this.m_TitleAndDescVM = Other.m_TitleAndDescVM;
        this.m_HoverModels = Other.m_HoverModels;
        this.m_HoverWidgetClass = Other.m_HoverWidgetClass;
        this.m_HoverRequestVersion = int(Other.m_HoverRequestVersion);
        this.m_SharedHoverAnchor = Other.m_SharedHoverAnchor;
        this.m_SharedHoverLayout = Other.m_SharedHoverLayout;
        this.m_TeleportVisibility = Other.m_TeleportVisibility;
        this.m_Bonfire = Other.m_Bonfire;
        this.m_LocalPlayerPawn = Other.m_LocalPlayerPawn;
        this.m_LocalPlayer = Other.m_LocalPlayer;
        this.m_BonfireState = int(Other.m_BonfireState);
        this.m_TitleText = Other.m_TitleText;
        this.m_TipsTitleText = Other.m_TipsTitleText;
        this.m_TipsText = Other.m_TipsText;
        this.m_RemainedRefillTimes = Other.m_RemainedRefillTimes;
        this.m_RemainedRefillTimesMax = Other.m_RemainedRefillTimesMax;
        this.m_ResidualText = Other.m_ResidualText;
        this.m_RefillCostHint = Other.m_RefillCostHint;
        this.m_HintText = Other.m_HintText;
        this.m_ButtonText = Other.m_ButtonText;
        this.m_ConsumeKeyText = Other.m_ConsumeKeyText;
        this.m_SupplyHintText = Other.m_SupplyHintText;
        this.m_ConsumeOpacity = Other.m_ConsumeOpacity;
        this.m_ItemRefs = Other.m_ItemRefs;
        this.m_FillPercent = Other.m_FillPercent;
        this.m_AddButtonVisibility = Other.m_AddButtonVisibility;
        this.m_TipsVisibility = Other.m_TipsVisibility;
        this.m_LeftVisibility = Other.m_LeftVisibility;
        this.m_RightVisibility = Other.m_RightVisibility;
        this.m_GameModeSettings = Other.m_GameModeSettings;
        this.m_RefillTimesSource = Other.m_RefillTimesSource;
        return Other.m_RefillTimesMaxSource;
    }
    void PostConstruct()
    {
        this.SetLocalPlayerPawn(this.GetContext().GetLocalPlayerPawn());
        this.SetLocalPlayer(this.GetContext().GetLocalPlayer());
        this.InitData();
        this.GenerateHoverModel();
        return;
    }
    void InitData()
    {
        float local_72;
        this.SetTitleText(NSLOCTEXT("Bonfire", "зЇќзЃ«"));
        this.SetTipsTitleText(NSLOCTEXT("Bonfire", "зЇќзЃ«"));
        this.SetTipsText(NSLOCTEXT("<key id=\"Enter\"/>View Details", "<key id=\"Enter\"/>жџҐзњ‹иЇ¦жѓ…"));
        this.SetButtonText(NSLOCTEXT("Supply", "иЎҐз»™"));
        this.SetConsumeKeyText(NSLOCTEXT("HoldToSupply", "й•їжЊ‰иЎҐз»™"));
        this.SetResidualText(NSLOCTEXT("ResidualSupplyTimes:", "е‰©дЅ™иЎҐз»™ж•°й‡Џпјљ"));
        UGlobalItemSettings local_6 = ::UGlobalItemSettings::Get();
        int local_56 = ::InventoryUtils::GetInventoryItemNumber(this.GetLocalPlayerPawn(), local_6.CoinConfig);
        FNameHandle_EntityBBVarInt local_62;
        local_62;
        int local_55_2 = this.GetLocalPlayerPawn().GetBB_Int(local_62);
        this.SetGameModeSettings(Cast<UAS_GameModeSettingsPVX>(UECSGameModeSettingsBase::Get(ECS::GetUEWorld())));
        if (this.GetGameModeSettings() != nullptr)
        {
            local_62;
            local_55_2 = this.GetLocalPlayerPawn().GetBB_Int(local_62);
        }
        if (local_56 > local_55_2)
        {
            local_72 = 1.0;
        }
        else
        {
            local_72 = 0.65;
        }
        this.SetConsumeOpacity(float32(local_72));
        if (this.GetGameModeSettings() != nullptr)
        {
            this.SetLeftVisibility(ESlateVisibility(2));
        }
        Get local_84;
        this.SetBonfire(local_84.opCall().GetTargetEntity());
        this.SetAbilityGroup(::UIInteractAbilityConfig::GetUIInteractAbilityGroup(n"Bonfire"));
        int local_89 = 0;
        for (; local_89 < this.GetAbilityGroup().GroupItems.Num(); ++local_89)
        {
            if ((local_89 != 0 && (local_89 != 1)))
            {
                bool local_91 = this.GetAbilityGroup().GroupItems[local_89].bIsInteractTarget;
                this.GetModify_ItemRefs().Add(FEUIModelRef(::FVM_CommonBGItemMenu::Create(this.GetContext().Manager, n"Bonfire", local_89, this.GetAbilityGroup().GroupItems[local_89].Signal, local_91, this.GetAbilityGroup().GroupItems[local_89].bSetVisibility)));
            }
        }
        return;
    }
    void GenerateHoverModel()
    {
        this.SetTitleAndDescVM(TEUIModelRef<FVM_TitleAndDesc>(::FVM_TitleAndDesc::Create(this.GetManager(), this.GetTipsTitleText(), this.GetTipsText())));
        return;
    }
    void SyncRefillSources()
    {
        FECSEntity local_4 = FECSEntity(this.GetContext().GetLocalPlayer());
        if (!(local_4.IsValid()))
        {
            this.GetModify_RefillTimesSource().Reset();
            this.GetModify_RefillTimesMaxSource().Reset();
            return;
        }
        this.GetModify_RefillTimesSource().SetEBB(local_4, n"iRefillTimes");
        this.GetModify_RefillTimesMaxSource().SetEBB(local_4, n"iRefillTimesMax");
        return;
    }
    void RefreshRefillStatus()
    {
        int local_1 = 0;
        int local_2 = 0;
        int local_4;
        if (this.GetGameModeSettings() != nullptr)
        {
            FNameHandle_EntityBBVarInt local_12;
            local_12;
            local_4 = this.GetLocalPlayer().GetBB_Int(local_12);
        }
        else
        {
            FNameHandle_EntityBBVarInt local_12;
            local_12;
            local_4 = this.GetLocalPlayer().GetBB_Int(local_12);
        }
        if (local_1 < 0)
        {
            this.SetRemainedRefillTimes(INVTEXT("в€ћ"));
            this.SetHintText(NSLOCTEXT("RefillSufficientHint", "ењ°и„‰е……з›€"));
            this.SetBonfireState(0);
            this.SetAddButtonVisibility(ESlateVisibility(2));
        }
        else
        {
            this.SetRemainedRefillTimes(FText::AsNumber(local_1, FNumberFormattingOptions::DefaultNoGrouping()));
            if (local_1 == 0)
            {
                this.SetAddButtonVisibility(ESlateVisibility(0));
            }
            else
            {
                this.SetAddButtonVisibility(ESlateVisibility(2));
            }
        }
        if (local_1 >= 0 && (local_2 > 0))
        {
            this.SetFillPercent((local_1 / local_2));
        }
        else
        {
            this.SetFillPercent(1.0f);
        }
        if (local_1 >= 0 && (local_2 > 0))
        {
            FNameHandle_EntityBBVarInt local_12;
            FText local_28;
            FText local_24;
            this.SetHintText(NSLOCTEXT("RefillLackHint", "ењ°и„‰зґЉд№±"));
            local_12;
            int local_3 = this.GetLocalPlayer().GetBB_Int(local_12);
            FText::AsNumber(local_4, local_24);
            FText::AsNumber(local_2, local_28);
            this.SetSupplyHintText(FText::Format(NSLOCTEXT("CampsiteProvisions_Lack", "ењ°и„‰зґЉд№±жњџењ°и„‰иЎҐз»™еЏ—й»пјЊд»…еЏЇжЏђдѕ›<Yellow20>{0}</>ж¬ЎжµЃжµ†з“¶е…Ќиґ№иЎҐз»™гЂ‚\nеЏЇж¶€иЂ—<Yellow20>{1}</>и•ґеђ«зєЇе‡ЂдёќзєїеЉ›й‡Џзљ„з‰©е“Ѓи‡ЄиЎЊиЎҐз»™пјЊжЃўе¤ЌеЅ“е‰ЌжµЃжµ†з“¶е№¶иЎҐе……<Yellow20>{2}</>ж¬ЎиЎҐз»™гЂ‚"), local_28, FNumberFormattingOptions::DefaultNoGrouping(), local_24));
            this.SetBonfireState(1);
        }
        else
        {
            this.SetHintText(NSLOCTEXT("RefillSufficientHint", "ењ°и„‰е……з›€"));
            this.SetSupplyHintText(NSLOCTEXT("CampsiteProvisions_Full", "ењ°и„‰е……з›€жњџењ°и„‰иЎҐз»™еЏЇжЏђдѕ›<Yellow20>в€ћ</>ж¬ЎжµЃжµ†з“¶е…Ќиґ№иЎҐз»™гЂ‚"));
            this.SetBonfireState(0);
        }
        this.SetRefillCostHint(FText::AsNumber(local_4, FNumberFormattingOptions::DefaultNoGrouping()));
        return;
    }
    void OnAddButtonClicked()
    {
        this.SetAddButtonVisibility(ESlateVisibility(0));
        this.SetLeftVisibility(ESlateVisibility(0));
        if (FEUIWidget::FindWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_Interact_Camp_Provision).IsValid())
        {
            FEUIWidget::RemoveWidget(FEUIWidget::FindWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_Interact_Camp_Provision));
        }
        FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_Interact_Camp_Provision);
        this.RefreshRefillStatus();
        return;
    }
    void OnConfirmButtonClicked()
    {
        FNameHandle_EntityBBVarInt local_20;
        int local_30 = 0;
        GetDefaulted local_4;
        const FC_InteractionInfoForESM& local_6 = local_4.opCall();
        if (local_6)
        {
            if (local_6.GetTargetEntity().IsValid())
            {
                if (this.GetGameModeSettings() != nullptr)
                {
                    int local_15 = ::FMS_PlayerInventory::Get(this.GetContext().Manager).GetTotalItemNum(this.GetGameModeSettings().CurrencyItemConfig);
                    local_20;
                    if (local_15 >= this.GetLocalPlayer().GetBB_Int(local_20))
                    {
                        this.SetAddButtonVisibility(ESlateVisibility(0));
                        this.SetLeftVisibility(ESlateVisibility(0));
                        this.OnCancelButtonClicked();
                        FFPTime local_28 = FFPTime(-1);
                        local_30.AbilityOwner = local_6.GetTargetEntity();
                        local_30.SignalName = FName("SupplyPVX");
                        local_30.InteractTargetPointAndBehaviorIndex = local_6.GetTargetPointAndBehaviorIndex();
                    }
                    else
                    {
                        FFPTime local_28_2 = FFPTime(-1);
                        local_30.AbilityOwner = local_6.GetTargetEntity();
                        local_30.SignalName = FName("SupplyFail");
                        local_30.InteractTargetPointAndBehaviorIndex = local_6.GetTargetPointAndBehaviorIndex();
                    }
                }
                else
                {
                    int local_16 = ::FMS_PlayerInventory::Get(this.GetContext().Manager).GetTotalItemNum(::UGlobalItemSettings::Get().CoinConfig);
                    local_20;
                    int local_11_2 = this.GetLocalPlayer().GetBB_Int(local_20);
                    if (local_16 >= local_11_2)
                    {
                        ::FMS_PlayerInventory::Get(this.GetContext().Manager).GS_RequestDestroyItem(::UGlobalItemSettings::Get().CoinConfig, local_11_2);
                        this.SetAddButtonVisibility(ESlateVisibility(0));
                        this.SetLeftVisibility(ESlateVisibility(0));
                        FFPTime local_28_3 = FFPTime(-1);
                        local_30.AbilityOwner = local_6.GetTargetEntity();
                        local_30.SignalName = FName("Supply");
                        local_30.InteractTargetPointAndBehaviorIndex = local_6.GetTargetPointAndBehaviorIndex();
                        this.OnCancelButtonClicked();
                    }
                    else
                    {
                        FFPTime local_28_4 = FFPTime(-1);
                        local_30.AbilityOwner = local_6.GetTargetEntity();
                        local_30.SignalName = FName("SupplyFail");
                        local_30.InteractTargetPointAndBehaviorIndex = local_6.GetTargetPointAndBehaviorIndex();
                    }
                }
            }
        }
        this.RefreshRefillStatus();
        return;
    }
    void OnCancelButtonClicked()
    {
        this.SetAddButtonVisibility(ESlateVisibility(0));
        this.SetLeftVisibility(ESlateVisibility(0));
        FEUIWidgetRef local_4 = FEUIWidget::FindWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_Interact_Camp_Provision);
        if (local_4.IsValid())
        {
            FEUIWidget::RemoveWidget(local_4);
        }
        return;
    }
    TEUIModelRef<FVM_TitleAndDesc> GetTitleAndDescVM() const property
    {
        this.TrackPropertyRead(0);
        return this.m_TitleAndDescVM;
    }
    void SetTitleAndDescVM(const TEUIModelRef<FVM_TitleAndDesc> &inout __Value) property
    {
        TEUIModelRef<FVM_TitleAndDesc> local_2;
        local_2 = this.m_TitleAndDescVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TitleAndDescVM = __Value;
        return;
    }
    FEUIModelContainer GetHoverModels() const property
    {
        FEUIModelContainer __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FEUIModelContainer GetModify_HoverModels() property
    {
        FEUIModelContainer __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetHoverModels(const FEUIModelContainer &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_HoverModels = __Value;
        return;
    }
    TSoftClassPtr<UUserWidget> GetHoverWidgetClass() const property
    {
        this.TrackPropertyRead(2);
        return this.m_HoverWidgetClass;
    }
    void SetHoverWidgetClass(const TSoftClassPtr<UUserWidget> &inout __Value) property
    {
        if ((this.m_HoverWidgetClass == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_HoverWidgetClass = __Value;
        return;
    }
    int GetHoverRequestVersion() const property
    {
        this.TrackPropertyRead(3);
        return this.m_HoverRequestVersion;
    }
    void SetHoverRequestVersion(const int __Value) property
    {
        if (this.m_HoverRequestVersion == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_HoverRequestVersion = __Value;
        return;
    }
    TWeakObjectPtr<UWidget> GetSharedHoverAnchor() const property
    {
        this.TrackPropertyRead(4);
        return this.m_SharedHoverAnchor;
    }
    void SetSharedHoverAnchor(const TWeakObjectPtr<UWidget> &inout __Value) property
    {
        if ((this.m_SharedHoverAnchor == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_SharedHoverAnchor = __Value;
        return;
    }
    ECommonHoverLayout GetSharedHoverLayout() const property
    {
        this.TrackPropertyRead(5);
        return this.m_SharedHoverLayout;
    }
    void SetSharedHoverLayout(const ECommonHoverLayout __Value) property
    {
        if (int(this.m_SharedHoverLayout) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_SharedHoverLayout = __Value;
        return;
    }
    ESlateVisibility GetTeleportVisibility() const property
    {
        this.TrackPropertyRead(6);
        return this.m_TeleportVisibility;
    }
    void SetTeleportVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_TeleportVisibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_TeleportVisibility = __Value;
        return;
    }
    const FECSEntity GetBonfire() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FECSEntity GetModify_Bonfire() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetBonfire(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_Bonfire = __Value;
        return;
    }
    FECSEntity GetLocalPlayerPawn() const property
    {
        FECSEntity __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    FECSEntity GetModify_LocalPlayerPawn() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetLocalPlayerPawn(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_LocalPlayerPawn = __Value;
        return;
    }
    FECSEntity GetLocalPlayer() const property
    {
        FECSEntity __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    FECSEntity GetModify_LocalPlayer() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetLocalPlayer(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_LocalPlayer = __Value;
        return;
    }
    const FUIInteractAbilityGroup GetAbilityGroup() const property
    {
        const FUIInteractAbilityGroup __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    FUIInteractAbilityGroup GetModify_AbilityGroup() property
    {
        FUIInteractAbilityGroup __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetAbilityGroup(const FUIInteractAbilityGroup &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        return;
    }
    int GetBonfireState() const property
    {
        this.TrackPropertyRead(11);
        return this.m_BonfireState;
    }
    void SetBonfireState(const int __Value) property
    {
        if (this.m_BonfireState == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_BonfireState = __Value;
        return;
    }
    FText GetTitleText() const property
    {
        FText __r;
        this.TrackPropertyRead(12);
        return __r;
    }
    FText GetModify_TitleText() property
    {
        FText __r;
        this.MarkPropertyDirty(12);
        return __r;
    }
    void SetTitleText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_TitleText = __Value;
        return;
    }
    const FText GetTipsTitleText() const property
    {
        const FText __r;
        this.TrackPropertyRead(13);
        return __r;
    }
    FText GetModify_TipsTitleText() property
    {
        FText __r;
        this.MarkPropertyDirty(13);
        return __r;
    }
    void SetTipsTitleText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_TipsTitleText = __Value;
        return;
    }
    const FText GetTipsText() const property
    {
        const FText __r;
        this.TrackPropertyRead(14);
        return __r;
    }
    FText GetModify_TipsText() property
    {
        FText __r;
        this.MarkPropertyDirty(14);
        return __r;
    }
    void SetTipsText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_TipsText = __Value;
        return;
    }
    const FText GetRemainedRefillTimes() const property
    {
        const FText __r;
        this.TrackPropertyRead(15);
        return __r;
    }
    FText GetModify_RemainedRefillTimes() property
    {
        FText __r;
        this.MarkPropertyDirty(15);
        return __r;
    }
    void SetRemainedRefillTimes(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_RemainedRefillTimes = __Value;
        return;
    }
    const FText GetRemainedRefillTimesMax() const property
    {
        const FText __r;
        this.TrackPropertyRead(16);
        return __r;
    }
    FText GetModify_RemainedRefillTimesMax() property
    {
        FText __r;
        this.MarkPropertyDirty(16);
        return __r;
    }
    void SetRemainedRefillTimesMax(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_RemainedRefillTimesMax = __Value;
        return;
    }
    const FText GetResidualText() const property
    {
        const FText __r;
        this.TrackPropertyRead(17);
        return __r;
    }
    FText GetModify_ResidualText() property
    {
        FText __r;
        this.MarkPropertyDirty(17);
        return __r;
    }
    void SetResidualText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_ResidualText = __Value;
        return;
    }
    const FText GetRefillCostHint() const property
    {
        const FText __r;
        this.TrackPropertyRead(18);
        return __r;
    }
    FText GetModify_RefillCostHint() property
    {
        FText __r;
        this.MarkPropertyDirty(18);
        return __r;
    }
    void SetRefillCostHint(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(18);
        this.m_RefillCostHint = __Value;
        return;
    }
    const FText GetHintText() const property
    {
        const FText __r;
        this.TrackPropertyRead(19);
        return __r;
    }
    FText GetModify_HintText() property
    {
        FText __r;
        this.MarkPropertyDirty(19);
        return __r;
    }
    void SetHintText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(19);
        this.m_HintText = __Value;
        return;
    }
    const FText GetButtonText() const property
    {
        const FText __r;
        this.TrackPropertyRead(20);
        return __r;
    }
    FText GetModify_ButtonText() property
    {
        FText __r;
        this.MarkPropertyDirty(20);
        return __r;
    }
    void SetButtonText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(20);
        this.m_ButtonText = __Value;
        return;
    }
    const FText GetConsumeKeyText() const property
    {
        const FText __r;
        this.TrackPropertyRead(21);
        return __r;
    }
    FText GetModify_ConsumeKeyText() property
    {
        FText __r;
        this.MarkPropertyDirty(21);
        return __r;
    }
    void SetConsumeKeyText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(21);
        this.m_ConsumeKeyText = __Value;
        return;
    }
    const FText GetSupplyHintText() const property
    {
        const FText __r;
        this.TrackPropertyRead(22);
        return __r;
    }
    FText GetModify_SupplyHintText() property
    {
        FText __r;
        this.MarkPropertyDirty(22);
        return __r;
    }
    void SetSupplyHintText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(22);
        this.m_SupplyHintText = __Value;
        return;
    }
    const float32 GetConsumeOpacity() const property
    {
        const float32 __r;
        this.TrackPropertyRead(23);
        return __r;
    }
    float32 GetModify_ConsumeOpacity() property
    {
        float32 __r;
        this.MarkPropertyDirty(23);
        return __r;
    }
    void SetConsumeOpacity(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(23);
        this.m_ConsumeOpacity = __Value;
        return;
    }
    const TArray<FEUIModelRef> GetItemRefs() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(24);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_ItemRefs() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(24);
        return __r;
    }
    void SetItemRefs(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(24);
        this.m_ItemRefs = __Value;
        return;
    }
    const float32 GetFillPercent() const property
    {
        const float32 __r;
        this.TrackPropertyRead(25);
        return __r;
    }
    float32 GetModify_FillPercent() property
    {
        float32 __r;
        this.MarkPropertyDirty(25);
        return __r;
    }
    void SetFillPercent(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(25);
        this.m_FillPercent = __Value;
        return;
    }
    ESlateVisibility GetAddButtonVisibility() const property
    {
        this.TrackPropertyRead(26);
        return this.m_AddButtonVisibility;
    }
    void SetAddButtonVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_AddButtonVisibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(26);
        this.m_AddButtonVisibility = __Value;
        return;
    }
    ESlateVisibility GetTipsVisibility() const property
    {
        this.TrackPropertyRead(27);
        return this.m_TipsVisibility;
    }
    void SetTipsVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_TipsVisibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(27);
        this.m_TipsVisibility = __Value;
        return;
    }
    ESlateVisibility GetLeftVisibility() const property
    {
        this.TrackPropertyRead(28);
        return this.m_LeftVisibility;
    }
    void SetLeftVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_LeftVisibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(28);
        this.m_LeftVisibility = __Value;
        return;
    }
    ESlateVisibility GetRightVisibility() const property
    {
        this.TrackPropertyRead(29);
        return this.m_RightVisibility;
    }
    void SetRightVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_RightVisibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(29);
        this.m_RightVisibility = __Value;
        return;
    }
    const UAS_GameModeSettingsPVX GetGameModeSettings() const property
    {
        this.TrackPropertyRead(30);
        return this.m_GameModeSettings;
    }
    void SetGameModeSettings(const UAS_GameModeSettingsPVX __Value) property
    {
        if (this.m_GameModeSettings == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(30);
        return;
    }
    const FMW_EBBInt GetRefillTimesSource() const property
    {
        const FMW_EBBInt __r;
        this.TrackPropertyRead(31);
        return __r;
    }
    FMW_EBBInt GetModify_RefillTimesSource() property
    {
        FMW_EBBInt __r;
        this.MarkPropertyDirty(31);
        return __r;
    }
    void SetRefillTimesSource(const FMW_EBBInt &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(31);
        this.m_RefillTimesSource = __Value;
        return;
    }
    const FMW_EBBInt GetRefillTimesMaxSource() const property
    {
        const FMW_EBBInt __r;
        this.TrackPropertyRead(32);
        return __r;
    }
    FMW_EBBInt GetModify_RefillTimesMaxSource() property
    {
        FMW_EBBInt __r;
        this.MarkPropertyDirty(32);
        return __r;
    }
    void SetRefillTimesMaxSource(const FMW_EBBInt &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(32);
        this.m_RefillTimesMaxSource = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_BonfirePage_Supply
{
    UPROPERTY()
    TEUIModelRef<FVM_BonfirePage_Supply> Self;

    __GeneratedProperties_FVM_BonfirePage_Supply()
    {
        return;
    }
}

namespace FVM_BonfirePage_Supply
{
FVM_BonfirePage_Supply& Create(const UObject ContextObject)
{
    return FVM_BonfirePage_Supply::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_BonfirePage_Supply CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_BonfirePage_Supply __r;
    TEUIModelRef<FVM_BonfirePage_Supply> local_6 = TEUIModelRef<FVM_BonfirePage_Supply>(EUIInternal::MakeModelWithManager(Manager, FVM_BonfirePage_Supply::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TitleAndDescVM";
    local_14.TypeName = "TEUIModelRef<FVM_TitleAndDesc>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HoverModels";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HoverWidgetClass";
    local_14.TypeName = "TSoftClassPtr<UUserWidget>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HoverRequestVersion";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TeleportVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BonfireState";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TitleText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TipsTitleText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TipsText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RemainedRefillTimes";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RemainedRefillTimesMax";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ResidualText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RefillCostHint";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HintText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ButtonText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ConsumeKeyText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SupplyHintText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ConsumeOpacity";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ItemRefs";
    local_14.TypeName = "TArray<FEUIModelRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "FillPercent";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AddButtonVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TipsVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LeftVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RightVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_BonfirePage_Supply>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_BonfirePage_Supply;
    FEUIModelWatcherProperty local_19;
    local_19.PropertyName = FName("RefillTimesSource");
    int local_2_2 = FVM_BonfirePage_Supply::__IndexOf_RefillTimesSource();
    Result.WatcherProperties.Add(local_19);
    local_19.PropertyName = FName("RefillTimesMaxSource");
    int local_2_3 = FVM_BonfirePage_Supply::__IndexOf_RefillTimesMaxSource();
    Result.WatcherProperties.Add(local_19);
    FEUIModelEffectDefine local_26;
    local_26.FunctionName = "SyncRefillSources";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "RefreshRefillStatus";
    Result.EffectFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_BonfirePage_Supply;
}
TEUIModelRef<FVM_TitleAndDesc> __UIGetter_TitleAndDescVM(const FVM_BonfirePage_Supply &inout Model)
{
    return Model.GetTitleAndDescVM();
}
FEUIModelContainer __UIGetter_HoverModels(const FVM_BonfirePage_Supply &inout Model)
{
    return Model.GetHoverModels();
}
TSoftClassPtr<UUserWidget> __UIGetter_HoverWidgetClass(const FVM_BonfirePage_Supply &inout Model)
{
    return Model.GetHoverWidgetClass();
}
int __UIGetter_HoverRequestVersion(const FVM_BonfirePage_Supply &inout Model)
{
    return Model.GetHoverRequestVersion();
}
ESlateVisibility __UIGetter_TeleportVisibility(const FVM_BonfirePage_Supply &inout Model)
{
    return Model.GetTeleportVisibility();
}
int __UIGetter_BonfireState(const FVM_BonfirePage_Supply &inout Model)
{
    return Model.GetBonfireState();
}
FText __UIGetter_TitleText(const FVM_BonfirePage_Supply &inout Model)
{
    return Model.GetTitleText();
}
FText __UIGetter_TipsTitleText(const FVM_BonfirePage_Supply &inout Model)
{
    return Model.GetTipsTitleText();
}
FText __UIGetter_TipsText(const FVM_BonfirePage_Supply &inout Model)
{
    return Model.GetTipsText();
}
FText __UIGetter_RemainedRefillTimes(const FVM_BonfirePage_Supply &inout Model)
{
    return Model.GetRemainedRefillTimes();
}
FText __UIGetter_RemainedRefillTimesMax(const FVM_BonfirePage_Supply &inout Model)
{
    return Model.GetRemainedRefillTimesMax();
}
FText __UIGetter_ResidualText(const FVM_BonfirePage_Supply &inout Model)
{
    return Model.GetResidualText();
}
FText __UIGetter_RefillCostHint(const FVM_BonfirePage_Supply &inout Model)
{
    return Model.GetRefillCostHint();
}
FText __UIGetter_HintText(const FVM_BonfirePage_Supply &inout Model)
{
    return Model.GetHintText();
}
FText __UIGetter_ButtonText(const FVM_BonfirePage_Supply &inout Model)
{
    return Model.GetButtonText();
}
FText __UIGetter_ConsumeKeyText(const FVM_BonfirePage_Supply &inout Model)
{
    return Model.GetConsumeKeyText();
}
FText __UIGetter_SupplyHintText(const FVM_BonfirePage_Supply &inout Model)
{
    return Model.GetSupplyHintText();
}
float32 __UIGetter_ConsumeOpacity(const FVM_BonfirePage_Supply &inout Model)
{
    return Model.GetConsumeOpacity();
}
TArray<FEUIModelRef> __UIGetter_ItemRefs(const FVM_BonfirePage_Supply &inout Model)
{
    return Model.GetItemRefs();
}
float32 __UIGetter_FillPercent(const FVM_BonfirePage_Supply &inout Model)
{
    return Model.GetFillPercent();
}
ESlateVisibility __UIGetter_AddButtonVisibility(const FVM_BonfirePage_Supply &inout Model)
{
    return Model.GetAddButtonVisibility();
}
ESlateVisibility __UIGetter_TipsVisibility(const FVM_BonfirePage_Supply &inout Model)
{
    return Model.GetTipsVisibility();
}
ESlateVisibility __UIGetter_LeftVisibility(const FVM_BonfirePage_Supply &inout Model)
{
    return Model.GetLeftVisibility();
}
ESlateVisibility __UIGetter_RightVisibility(const FVM_BonfirePage_Supply &inout Model)
{
    return Model.GetRightVisibility();
}
TEUIModelRef<FVM_BonfirePage_Supply> __UIGetter_Self(const FVM_BonfirePage_Supply &inout Model)
{
    return TEUIModelRef<FVM_BonfirePage_Supply>(Model);
}
int __IndexOf_TitleAndDescVM()
{
    return 0;
}
int __IndexOf_HoverModels()
{
    return 1;
}
int __IndexOf_HoverWidgetClass()
{
    return 2;
}
int __IndexOf_HoverRequestVersion()
{
    return 3;
}
int __IndexOf_SharedHoverAnchor()
{
    return 4;
}
int __IndexOf_SharedHoverLayout()
{
    return 5;
}
int __IndexOf_TeleportVisibility()
{
    return 6;
}
int __IndexOf_Bonfire()
{
    return 7;
}
int __IndexOf_LocalPlayerPawn()
{
    return 8;
}
int __IndexOf_LocalPlayer()
{
    return 9;
}
int __IndexOf_AbilityGroup()
{
    return 10;
}
int __IndexOf_BonfireState()
{
    return 11;
}
int __IndexOf_TitleText()
{
    return 12;
}
int __IndexOf_TipsTitleText()
{
    return 13;
}
int __IndexOf_TipsText()
{
    return 14;
}
int __IndexOf_RemainedRefillTimes()
{
    return 15;
}
int __IndexOf_RemainedRefillTimesMax()
{
    return 16;
}
int __IndexOf_ResidualText()
{
    return 17;
}
int __IndexOf_RefillCostHint()
{
    return 18;
}
int __IndexOf_HintText()
{
    return 19;
}
int __IndexOf_ButtonText()
{
    return 20;
}
int __IndexOf_ConsumeKeyText()
{
    return 21;
}
int __IndexOf_SupplyHintText()
{
    return 22;
}
int __IndexOf_ConsumeOpacity()
{
    return 23;
}
int __IndexOf_ItemRefs()
{
    return 24;
}
int __IndexOf_FillPercent()
{
    return 25;
}
int __IndexOf_AddButtonVisibility()
{
    return 26;
}
int __IndexOf_TipsVisibility()
{
    return 27;
}
int __IndexOf_LeftVisibility()
{
    return 28;
}
int __IndexOf_RightVisibility()
{
    return 29;
}
int __IndexOf_GameModeSettings()
{
    return 30;
}
int __IndexOf_RefillTimesSource()
{
    return 31;
}
int __IndexOf_RefillTimesMaxSource()
{
    return 32;
}
}
namespace __GeneratedProperties_FVM_BonfirePage_Supply
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
