
namespace FVMS_ItemBtns
{
    const int ModelId = 0;

}
struct FVMS_ItemBtns : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    TEUIModelRef<FVM_NormalSkillBtn> m_MountBtnVM;
    UPROPERTY()
    TEUIModelRef<FVM_NormalSkillBtn> m_HealBtnVM;
    UPROPERTY()
    TEUIModelRef<FVM_NormalSkillBtn> m_CombatBtnVM1;
    UPROPERTY()
    TEUIModelRef<FVM_NormalSkillBtn> m_CombatBtnVM2;
    UPROPERTY()
    ESlateVisibility m_CombatItem1Visible;
    UPROPERTY()
    ESlateVisibility m_CombatItem2Visible;
    UPROPERTY()
    ESlateVisibility m_HealItemVisible;
    UPROPERTY()
    bool m_bCenterIconVisible;
    UPROPERTY()
    TEUIModelRef<FVM_NormalSkillBtn> m_CombatTmpVM;
    UPROPERTY()
    TEUIModelRef<FVM_EquipHoverTips> m_HoverTipsVM;
    UPROPERTY()
    TEUIModelWeakRef<FVM_NormalSkillBtn> m_ToolTipsBtn;
    UPROPERTY()
    bool m_bInit;
    UPROPERTY()
    int m_HealItemNum;
    UPROPERTY()
    int m_CombatItemNum;
    UPROPERTY()
    FECSEntity m_CurPawnEntity;
    UPROPERTY()
    ESlateVisibility m_MountUsing;
    UPROPERTY()
    ESlateVisibility m_CachedVisibility;
    UPROPERTY()
    bool m_bIsMountBtnUnlocked;
    UPROPERTY()
    bool m_bIsInventoryQuickSlotUnlocked;
    UPROPERTY()
    int m_HoverBtnIndex;
    UPROPERTY()
    bool m_bGamepadLeftShoulderPress;
    UPROPERTY()
    ESlateVisibility m_CombatTmpVisibility;

    FVMS_ItemBtns()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVMS_ItemBtns(const FVMS_ItemBtns &inout Other)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVMS_ItemBtns opAssign(const FVMS_ItemBtns &inout Other)
    {
        FVMS_ItemBtns __r;
        this.m_MountBtnVM = Other.m_MountBtnVM;
        this.m_HealBtnVM = Other.m_HealBtnVM;
        this.m_CombatBtnVM1 = Other.m_CombatBtnVM1;
        this.m_CombatBtnVM2 = Other.m_CombatBtnVM2;
        this.m_CombatItem1Visible = Other.m_CombatItem1Visible;
        this.m_CombatItem2Visible = Other.m_CombatItem2Visible;
        this.m_HealItemVisible = Other.m_HealItemVisible;
        this.m_bCenterIconVisible = Other.m_bCenterIconVisible;
        this.m_CombatTmpVM = Other.m_CombatTmpVM;
        this.m_HoverTipsVM = Other.m_HoverTipsVM;
        this.m_ToolTipsBtn = Other.m_ToolTipsBtn;
        this.m_bInit = Other.m_bInit;
        this.m_HealItemNum = int(Other.m_HealItemNum);
        this.m_CombatItemNum = int(Other.m_CombatItemNum);
        this.m_CurPawnEntity = Other.m_CurPawnEntity;
        this.m_MountUsing = Other.m_MountUsing;
        this.m_CachedVisibility = Other.m_CachedVisibility;
        this.m_bIsMountBtnUnlocked = Other.m_bIsMountBtnUnlocked;
        this.m_bIsInventoryQuickSlotUnlocked = Other.m_bIsInventoryQuickSlotUnlocked;
        this.m_HoverBtnIndex = int(Other.m_HoverBtnIndex);
        this.m_bGamepadLeftShoulderPress = Other.m_bGamepadLeftShoulderPress;
        this.m_CombatTmpVisibility = Other.m_CombatTmpVisibility;
        return __r;
    }
    void TestRequireFocus()
    {
        this.GetContext().Manager.SetLayerRootChildrenFocusable(this.GetContext().UELocalPlayer, EEUILayoutLayer(3), true);
        return;
    }
    void TestReleaseFocus()
    {
        this.GetContext().Manager.SetLayerRootChildrenFocusable(this.GetContext().UELocalPlayer, EEUILayoutLayer(3), false);
        return;
    }
    int GetLeftShoulderPressSwitch() const
    {
        return this.GetbGamepadLeftShoulderPress() ? 1 : 0;
    }
    ESlateVisibility GetLeftShoulderPressVisibility() const
    {
        int local_2;
        if (this.GetbGamepadLeftShoulderPress())
        {
            local_2 = 2;
        }
        else
        {
            local_2 = 0;
        }
        return ESlateVisibility(local_2);
    }
    float32 GetSkillbtnsSizeOverride() const
    {
        return !(this.GetbGamepadLeftShoulderPress()) ? 60.0f : 75.0f;
    }
    ESlateVisibility GetCombatItem1Visibility() const
    {
        return this.GetCombatItem1Visible();
    }
    ESlateVisibility GetCombatItem2Visibility() const
    {
        return this.GetCombatItem2Visible();
    }
    ESlateVisibility GetHealItemVisibility() const
    {
        return this.GetHealItemVisible();
    }
    ESlateVisibility GetMountUsingVisibility() const
    {
        return this.GetMountUsing();
    }
    ESlateVisibility SkillBtnsPanelVisibility() const
    {
        int local_3;
        if (UICommonUtil::CVar_UI_DebugEnableNewItemBtns.GetBool() && this.GetIsInventoryQuickSlotUnlock())
        {
            local_3 = 0;
        }
        else
        {
            local_3 = 2;
        }
        return ESlateVisibility(local_3);
    }
    ESlateVisibility GetCombatTmpBtnVisibility() const
    {
        return this.GetCombatTmpVisibility();
    }
    bool IsBtnHoverVisible() const
    {
        return this.GetHoverTipsVM().IsValid();
    }
    bool GetIsMountBtnUnlock() const
    {
        return this.GetbIsMountBtnUnlocked();
    }
    bool GetIsInventoryQuickSlotUnlock() const
    {
        return this.GetbIsInventoryQuickSlotUnlocked();
    }
    void PostConstruct()
    {
        const UUtilitySettings local_36;
        this.RefreshInventoryQuickSlotUnlockState();
        this.SetMountBtnVM(TEUIModelRef<FVM_NormalSkillBtn>(::FVM_NormalSkillBtn::Create(this.GetContext().Manager)));
        FNormalSkillBtnConfig local_30;
        local_30.SkillButtonType = ESkillButtonType(3);
        local_30.bShowInputActionOnKeyBoard = true;
        local_30.bShowInputActionOnGamepad = false;
        local_30.bShowInputActionOnTouch = false;
        TEUIModelRef<FVM_NormalSkillBtn> local_2 = this.GetMountBtnVM();
        true.SetbOverrideProgressType();
        int local_33 = 1;
        TEUIModelRef<FVM_NormalSkillBtn> local_2_2 = this.GetMountBtnVM();
        local_33.SetProgressType();
        TEUIModelRef<FVM_NormalSkillBtn> local_2_3 = this.GetMountBtnVM();
        local_30.SetSkillBtnConfig();
        bool local_32_2 = false;
        TEUIModelRef<FVM_NormalSkillBtn> local_2_4 = this.GetMountBtnVM();
        local_32_2.SetbShowItemUsableCount();
        bool local_32_3 = true;
        TEUIModelRef<FVM_NormalSkillBtn> local_2_5 = this.GetMountBtnVM();
        local_32_3.SetbOverrideIcon();
        GetGameplaySettings<UUtilitySettings> local_38;
        local_36 = local_38;
        TEUIModelRef<FVM_NormalSkillBtn> local_2_6 = this.GetMountBtnVM();
        local_36.MountIconImg.SetOverrideIcon();
        this.RefreshMountButtonIcon();
        this.RefreshMountUnlockState();
        bool local_32_4 = this.GetIsMountBtnUnlock();
        TEUIModelRef<FVM_NormalSkillBtn> local_2_7 = this.GetMountBtnVM();
        local_32_4.SetCachedVisibility();
        this.SetHealBtnVM(TEUIModelRef<FVM_NormalSkillBtn>(::FVM_NormalSkillBtn::Create(this.GetContext().Manager)));
        FNormalSkillBtnConfig local_68;
        local_68.bShowInputActionOnKeyBoard = true;
        local_68.bShowInputActionOnGamepad = false;
        local_68.bShowInputActionOnTouch = false;
        bool local_32_5 = true;
        TEUIModelRef<FVM_NormalSkillBtn> local_2_8 = this.GetHealBtnVM();
        local_32_5.SetbOverrideProgressType();
        int local_33_2 = 3;
        TEUIModelRef<FVM_NormalSkillBtn> local_2_9 = this.GetHealBtnVM();
        local_33_2.SetProgressType();
        TEUIModelRef<FVM_NormalSkillBtn> local_2_10 = this.GetHealBtnVM();
        local_68.SetSkillBtnConfig();
        this.SetCombatBtnVM1(TEUIModelRef<FVM_NormalSkillBtn>(::FVM_NormalSkillBtn::Create(this.GetContext().Manager)));
        FNormalSkillBtnConfig local_96;
        local_96.bShowInputActionOnKeyBoard = true;
        local_96.bShowInputActionOnGamepad = false;
        local_96.bShowInputActionOnTouch = false;
        bool local_32_6 = true;
        TEUIModelRef<FVM_NormalSkillBtn> local_2_11 = this.GetCombatBtnVM1();
        local_32_6.SetbOverrideProgressType();
        int local_33_3 = 3;
        TEUIModelRef<FVM_NormalSkillBtn> local_2_12 = this.GetCombatBtnVM1();
        local_33_3.SetProgressType();
        TEUIModelRef<FVM_NormalSkillBtn> local_2_13 = this.GetCombatBtnVM1();
        local_96.SetSkillBtnConfig();
        this.SetCombatBtnVM2(TEUIModelRef<FVM_NormalSkillBtn>(::FVM_NormalSkillBtn::Create(this.GetContext().Manager)));
        FNormalSkillBtnConfig local_124;
        local_124.bShowInputActionOnKeyBoard = true;
        local_124.bShowInputActionOnGamepad = false;
        local_124.bShowInputActionOnTouch = false;
        bool local_32_7 = true;
        TEUIModelRef<FVM_NormalSkillBtn> local_2_14 = this.GetCombatBtnVM2();
        local_32_7.SetbOverrideProgressType();
        int local_33_4 = 3;
        TEUIModelRef<FVM_NormalSkillBtn> local_2_15 = this.GetCombatBtnVM2();
        local_33_4.SetProgressType();
        this.SetCombatTmpVM(TEUIModelRef<FVM_NormalSkillBtn>(::FVM_NormalSkillBtn::Create(this.GetContext().Manager)));
        FNormalSkillBtnConfig local_152;
        local_152.bShowInputActionOnKeyBoard = true;
        local_152.bShowInputActionOnGamepad = false;
        local_152.bShowInputActionOnTouch = false;
        local_152.SkillSlot = ESkillSlot(9);
        bool local_32_8 = false;
        TEUIModelRef<FVM_NormalSkillBtn> local_2_16 = this.GetCombatTmpVM();
        local_32_8.SetbOverrideProgressType();
        int local_33_5 = 3;
        TEUIModelRef<FVM_NormalSkillBtn> local_2_17 = this.GetCombatTmpVM();
        local_33_5.SetProgressType();
        TEUIModelRef<FVM_NormalSkillBtn> local_2_18 = this.GetCombatTmpVM();
        local_152.SetSkillBtnConfig();
        return;
    }
    void RefreshPawnItemButtonState()
    {
        int local_10;
        FECSEntity local_4 = FECSEntity(this.GetContext().GetLocalPlayerPawn());
        if (!(local_4.IsValid()))
        {
            this.SetCurPawnEntity(ENTITY_NULL);
            this.SetMountUsing(ESlateVisibility(2));
            return;
        }
        FECSEntity local_8 = ::FASCommonUtils::GetUniqueAvatarPawnEntity(local_4);
        if (!(local_8.IsValid()))
        {
            this.SetCurPawnEntity(ENTITY_NULL);
            this.SetMountUsing(ESlateVisibility(2));
            return;
        }
        bool local_9 = !((FECSEntity(this.GetCurPawnEntity()) == local_8));
        this.SetCurPawnEntity(local_8);
        Has local_20;
        bool local_15 = local_20.opCall();
        if (local_15)
        {
            local_10 = 0;
        }
        else
        {
            local_10 = 2;
        }
        this.SetMountUsing(ESlateVisibility(local_10));
        if (!(this.GetbInit()) || local_9)
        {
            this.UpdateItemInfo();
            this.UpdateRemnantItemInfo();
            this.SetbInit(true);
        }
        return;
    }
    void RefreshCenterIconVisibility()
    {
        this.SetbCenterIconVisible(this.GetbIsMountBtnUnlocked() || (int(this.GetHealItemVisible()) == 0) || (int(this.GetCombatItem1Visible()) == 0) || (int(this.GetCombatItem2Visible()) == 0));
        return;
    }
    void RefreshCombatTmpInputActionVisibility()
    {
        this.SyncCombatTmpInputActionVisibility();
        return;
    }
    void OnClientConditionChanged(const FMsg_ClientConditionChanged &inout Msg)
    {
        if (Msg.bInputTypeChanged)
        {
            this.SyncCombatTmpInputActionVisibility();
        }
        return;
    }
    void SyncCombatTmpInputActionVisibility()
    {
        int local_8 = 0;
        if (!(this.GetCombatTmpVM().IsValid()))
        {
            return;
        }
        if ((int(::UICommonUtil::GetCurrentInputType(nullptr))) == 1)
        {
            bool local_3 = true;
            TEUIModelRef<FVM_NormalSkillBtn> local_2 = this.GetCombatTmpVM();
            local_3.SetbOverrideInputActionVisibility();
            if (this.GetbGamepadLeftShoulderPress())
            {
                local_8 = 0;
            }
            else
            {
                local_8 = 1;
            }
            TEUIModelRef<FVM_NormalSkillBtn> local_2_2 = this.GetCombatTmpVM();
            SetOverrideInputActionVisibility();
            return;
        }
        bool local_3_2 = false;
        TEUIModelRef<FVM_NormalSkillBtn> local_2_3 = this.GetCombatTmpVM();
        local_3_2.SetbOverrideInputActionVisibility();
        return;
    }
    void RefreshHoverButtonTips()
    {
        this.RefreshHoverBtnIndex();
        return;
    }
    void OnQuickSlotChanged(const FCE_NotifyQuickSlotItemChanged &inout Event)
    {
        this.UpdateItemInfo();
        return;
    }
    void OnQuickSlotInit(const FCE_ItemQuickSlotInit &inout Event)
    {
        this.UpdateItemInfo();
        return;
    }
    void OnInventoryChanged(const FMsg_PlayerInventoryChanged &inout Msg)
    {
        this.UpdateItemInfo();
        return;
    }
    void OnFashionMountChanged(const FMsg_FashionMountChanged &inout Msg)
    {
        this.RefreshMountButtonIcon();
        return;
    }
    void OnSystemUnlockFromGS(const FMsg_SystemUnlockFromGS &inout Msg)
    {
        if (int(Msg.SystemModule) == 117)
        {
            this.RefreshMountButtonState(::FASCommonUtils::GetUniqueAvatarPawnEntity(this.GetContext().GetLocalPlayerPawn()));
        }
        if (int(Msg.SystemModule) == 116)
        {
            this.RefreshInventoryQuickSlotUnlockState();
            this.UpdateItemInfo();
        }
        if (int(Msg.SystemModule) == 118)
        {
            this.UpdateItemInfo();
        }
        return;
    }
    void OnRemnantSlotChanged(const FCE_RemnantSlotChangedEvent &inout Event)
    {
        int local_4 = 0;
        this.UpdateRemnantItemInfo();
        if (this.GetCombatTmpVM().IsValid())
        {
            TEUIModelRef<FVM_NormalSkillBtn> local_2 = this.GetCombatTmpVM();
            local_4.SetRemnantSlotChangedCounter((GetRemnantSlotChangedCounter() + 1));
        }
        return;
    }
    void OnWorldChanged(const FMsg_ECSWorldRequireCleanUp &inout Msg)
    {
        this.UpdateRemnantItemInfo();
        return;
    }
    void UpdateItemInfo()
    {
        bool local_13;
        int local_177 = 0;
        FECSEntity local_12 = ::FASCommonUtils::GetUniqueAvatarPawnEntity(this.GetContext().GetLocalPlayerPawn());
        if (!(local_12.IsValid()))
        {
            return;
        }
        this.RefreshMountButtonState(local_12);
        if (!(::FMS_SystemControl::Get(this.GetContext().Manager).IsSystemUnlock(ESystemModule(118), false)))
        {
            this.SetHealItemVisible(ESlateVisibility(1));
        }
        else
        {
            CastTo local_100;
            TDataObjectPtr<FCombatItemConfig> local_70;
            CastTo local_46;
            this.SetHealItemVisible(ESlateVisibility(0));
            ::InventoryUtils::GetQuickSlotItemByName(local_12, n"ConsumableItem_Heal");
            local_70 = local_46.opCall();
            if (local_70)
            {
                int local_125 = ::InventoryUtils::GetInventoryItemNumber(local_12, local_100.opCall());
                this.SetupConsumableItemSkillButton(this.GetHealBtnVM(), local_70, local_125);
                this.SetHealItemNum(local_125);
                ::InventoryUtils::GetQuickSlotConfigByName(n"ConsumableItem_Heal");
                TEUIModelRef<FVM_NormalSkillBtn> local_128 = this.GetHealBtnVM();
                (FEUIInputAction(FCharacterInputUtils::GetInputActionByInputSlot(local_12, EESMTriggerInputSlot(local_177)))).SetInputAction();
            }
            else
            {
                this.SetConsumableItemSkillButtonToEmpty(this.GetHealBtnVM());
            }
        }
        if (::FGameModeUtils::IsTacticalItemDisabled())
        {
            local_13 = true;
        }
        else
        {
            local_13 = false;
            local_13 = !(::FMS_SystemControl::Get(this.GetContext().Manager).IsSystemUnlock(ESystemModule(116), local_13));
        }
        if (local_13)
        {
            this.SetCombatItem1Visible(ESlateVisibility(1));
            this.SetCombatItem2Visible(ESlateVisibility(1));
        }
        else
        {
            CastTo local_100;
            TDataObjectPtr<FCombatItemConfig> local_70;
            CastTo local_46;
            this.SetCombatItem1Visible(ESlateVisibility(0));
            this.SetCombatItem2Visible(ESlateVisibility(0));
            ::InventoryUtils::GetQuickSlotItemByName(local_12, n"ConsumableItem_Attack_1");
            TDataObjectPtr<FCombatItemConfig> local_94 = local_46.opCall();
            if (local_94)
            {
                int local_17 = ::InventoryUtils::GetInventoryItemNumber(local_12, local_100.opCall());
                this.SetupConsumableItemSkillButton(this.GetCombatBtnVM1(), local_94, local_17);
                this.SetCombatItemNum(local_17);
                ::InventoryUtils::GetQuickSlotConfigByName(n"ConsumableItem_Attack_1");
                FEUIInputAction local_186_2 = FEUIInputAction(FCharacterInputUtils::GetInputActionByInputSlot(local_12, EESMTriggerInputSlot(local_177)));
                TEUIModelRef<FVM_NormalSkillBtn> local_128_2 = this.GetCombatBtnVM1();
                local_186_2.SetInputAction();
            }
            else
            {
                this.SetConsumableItemSkillButtonToEmpty(this.GetCombatBtnVM1());
            }
            ::InventoryUtils::GetQuickSlotItemByName(local_12, n"ConsumableItem_Attack_2");
            local_70 = local_46.opCall();
            if (local_70)
            {
                int local_95 = ::InventoryUtils::GetInventoryItemNumber(local_12, local_100.opCall());
                this.SetupConsumableItemSkillButton(this.GetCombatBtnVM2(), local_70, local_95);
                this.SetCombatItemNum(local_95);
                ::InventoryUtils::GetQuickSlotConfigByName(n"ConsumableItem_Attack_2");
                FEUIInputAction local_186_3 = FEUIInputAction(FCharacterInputUtils::GetInputActionByInputSlot(local_12, EESMTriggerInputSlot(local_177)));
                TEUIModelRef<FVM_NormalSkillBtn> local_128_3 = this.GetCombatBtnVM2();
                local_186_3.SetInputAction();
            }
            else
            {
                this.SetConsumableItemSkillButtonToEmpty(this.GetCombatBtnVM2());
            }
        }
        return;
    }
    void RefreshMountButtonState(const FECSEntity &inout LocalPlayerPawnEntity)
    {
        if (!(this.GetMountBtnVM().IsValid()))
        {
            return;
        }
        this.RefreshMountUnlockState();
        bool local_3 = this.GetIsMountBtnUnlock();
        TEUIModelRef<FVM_NormalSkillBtn> local_2 = this.GetMountBtnVM();
        local_3.SetCachedVisibility();
        TEUIModelRef<FVM_NormalSkillBtn> local_2_2 = this.GetMountBtnVM();
        if (!(GetCachedVisibility()) || !(LocalPlayerPawnEntity.IsValid()))
        {
            return;
        }
        bool local_3_2 = true;
        TEUIModelRef<FVM_NormalSkillBtn> local_2_3 = this.GetMountBtnVM();
        local_3_2.SetbOverrideInputAction();
        UCharacterGlobalSetting local_6 = ::UCharacterGlobalSetting::Get();
        UESMInputTriggerAsset local_8;
        FEUIInputAction local_16 = FEUIInputAction(FCharacterInputUtils::GetInputActionByMainInputName(LocalPlayerPawnEntity, local_8.CoreTriggerItem.MainInputName.Name));
        TEUIModelRef<FVM_NormalSkillBtn> local_2_4 = this.GetMountBtnVM();
        local_16.SetInputAction();
        return;
    }
    void RefreshMountUnlockState()
    {
        this.SetbIsMountBtnUnlocked(::FMS_SystemControl::Get(this.GetContext().Manager).IsSystemUnlock(ESystemModule(117), false));
        return;
    }
    void RefreshMountButtonIcon()
    {
        const UUtilitySettings local_6;
        if (!(this.GetMountBtnVM().IsValid()))
        {
            return;
        }
        GetGameplaySettings<UUtilitySettings> local_8;
        local_6 = local_8;
        FSoftBrush local_56 = local_6.MountIconImg;
        if (::FMS_FashionModel::Get(this.GetContext().Manager).GetCurrentMountFashionConfig())
        {
            CastTo local_108;
            local_56 = ::DisplayItemAdapter_Fashion::ResolveDisplayIcon(local_108.opCall(), EBodyType(0), EDisplayItemIconType(0));
        }
        bool local_3 = true;
        TEUIModelRef<FVM_NormalSkillBtn> local_2 = this.GetMountBtnVM();
        local_3.SetbOverrideIcon();
        TEUIModelRef<FVM_NormalSkillBtn> local_2_2 = this.GetMountBtnVM();
        local_56.SetOverrideIcon();
        return;
    }
    void RefreshInventoryQuickSlotUnlockState()
    {
        this.SetbIsInventoryQuickSlotUnlocked(::FMS_SystemControl::Get(this.GetContext().Manager).IsSystemUnlock(ESystemModule(116), false));
        return;
    }
    void UpdateRemnantItemInfo()
    {
        int local_79 = 0;
        FECSEntity local_12 = ::FASCommonUtils::GetUniqueAvatarPawnEntity(this.GetContext().GetLocalPlayerPawn());
        if (!(local_12.IsValid()))
        {
            return;
        }
        if ((this.GetContext().GetLocalPlayer() == ENTITY_NULL))
        {
            this.SetCombatTmpVisibility(ESlateVisibility(1));
            return;
        }
        FECSEntity local_4 = this.GetContext().GetLocalPlayer();
        Get local_18;
        const FC_PlayerController& local_20 = local_18.opCall();
        if (local_20)
        {
            if (!(local_20.GetAllPlayerPawnEntities().Contains(local_12)))
            {
                this.SetCombatTmpVisibility(ESlateVisibility(1));
                return;
            }
        }
        FECSEntity local_8 = this.GetContext().GetLocalPlayer();
        Get local_24;
        const FC_RemnantInfo& local_26 = local_24.opCall();
        if (local_26)
        {
            this.SetCombatTmpVisibility(ESlateVisibility(0));
            this.SetupRemnantItemSkillButton(this.GetCombatTmpVM(), local_26);
            ::InventoryUtils::GetQuickSlotConfigByName(n"ConsumableItem_TemporaryAbility");
            TEUIModelRef<FVM_NormalSkillBtn> local_28 = this.GetCombatTmpVM();
            (FEUIInputAction(FCharacterInputUtils::GetInputActionByInputSlot(local_12, EESMTriggerInputSlot(local_79)))).SetInputAction();
        }
        else
        {
            this.SetCombatTmpVisibility(ESlateVisibility(1));
        }
        return;
    }
    void SetupRemnantItemSkillButton(const TEUIModelRef<FVM_NormalSkillBtn> &inout VM_SkillButton, const FC_RemnantInfo &inout RemnantInfo)
    {
        if (RemnantInfo.GetRemnantItemConfig())
        {
        }
        else
        {
        }
        USkillConfig local_4;
        local_4.SetSkillConfig();
        FNormalSkillBtnConfig local_32;
        local_32.SkillButtonType = ESkillButtonType(1);
        local_32.SetSkillBtnConfig();
        TDataObjectPtr<FCombatItemConfig>().SetConsumableItem();
        -1.SetItemUsableCount();
        return;
    }
    void SetupConsumableItemSkillButton(const TEUIModelRef<FVM_NormalSkillBtn> &inout VM_SkillButton, const TDataObjectPtr<FCombatItemConfig> &inout Config, const int ItemNumber)
    {
        Config.opArrow().ItemSkillConfig.SetSkillConfig();
        FNormalSkillBtnConfig local_28;
        local_28.SkillButtonType = ESkillButtonType(3);
        local_28.SetSkillBtnConfig();
        Config.SetConsumableItem();
        ItemNumber.SetItemUsableCount();
        return;
    }
    void SetConsumableItemSkillButtonToEmpty(const TEUIModelRef<FVM_NormalSkillBtn> &inout VM_SkillButton)
    {
        nullptr.SetSkillConfig();
        FNormalSkillBtnConfig local_28;
        local_28.SkillButtonType = ESkillButtonType(3);
        local_28.SetSkillBtnConfig();
        TDataObjectPtr<FCombatItemConfig>().SetConsumableItem();
        -1.SetItemUsableCount();
        return;
    }
    void RefreshHoverBtnIndex()
    {
        TEUIModelRef<FVM_NormalSkillBtn> local_2 = TEUIModelRef<FVM_NormalSkillBtn>(nullptr);
        bool local_5 = this.GetHealBtnVM().IsValid();
        if (!(local_5))
        {
            local_5 = false;
        }
        else
        {
            TEUIModelRef<FVM_BattleBuildEntry> local_8;
            TEUIModelRef<FVM_NormalSkillBtn> local_4 = this.GetHealBtnVM();
            local_8.GetConfigEntry();
            local_5 = local_8.IsValid();
        }
        if (local_5)
        {
            local_2 = this.GetHealBtnVM();
        }
        else
        {
            TEUIModelRef<FVM_BattleBuildEntry> local_8;
            bool local_5_2 = this.GetCombatBtnVM1().IsValid();
            if (!(local_5_2))
            {
                local_5_2 = false;
            }
            else
            {
                TEUIModelRef<FVM_NormalSkillBtn> local_4_2 = this.GetCombatBtnVM1();
                local_8.GetConfigEntry();
                local_5_2 = local_8.IsValid();
            }
            if (local_5_2)
            {
                local_2 = this.GetCombatBtnVM1();
            }
            else
            {
                bool local_5_3 = this.GetCombatBtnVM2().IsValid();
                if (!(local_5_3))
                {
                    local_5_3 = false;
                }
                else
                {
                    TEUIModelRef<FVM_NormalSkillBtn> local_4_3 = this.GetCombatBtnVM2();
                    local_8.GetConfigEntry();
                    local_5_3 = local_8.IsValid();
                }
                if (local_5_3)
                {
                    local_2 = this.GetCombatBtnVM2();
                }
                else
                {
                    bool local_5_4 = this.GetMountBtnVM().IsValid();
                    if (!(local_5_4))
                    {
                        local_5_4 = false;
                    }
                    else
                    {
                        TEUIModelRef<FVM_NormalSkillBtn> local_4_4 = this.GetMountBtnVM();
                        local_8.GetConfigEntry();
                        local_5_4 = local_8.IsValid();
                    }
                    if (local_5_4)
                    {
                        local_2 = this.GetMountBtnVM();
                    }
                }
            }
        }
        TEUIModelWeakRef<FVM_NormalSkillBtn> local_12 = this.GetToolTipsBtn();
        FEUIModelRef local_14 = local_2.opImplConv();
        if ((!((local_12 == local_14))))
        {
            if (local_2.IsValid())
            {
                this.SetToolTipsBtn(local_12);
                local_14.GetHoverTips();
                this.SetHoverTipsVM(TEUIModelRef<FVM_EquipHoverTips>());
            }
            else
            {
                this.SetToolTipsBtn(local_12);
                this.SetHoverTipsVM(TEUIModelRef<FVM_EquipHoverTips>());
            }
        }
        return;
    }
    TEUIModelRef<FVM_NormalSkillBtn> GetMountBtnVM() const property
    {
        this.TrackPropertyRead(0);
        return this.m_MountBtnVM;
    }
    void SetMountBtnVM(const TEUIModelRef<FVM_NormalSkillBtn> &inout __Value) property
    {
        TEUIModelRef<FVM_NormalSkillBtn> local_2;
        local_2 = this.m_MountBtnVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_MountBtnVM = __Value;
        return;
    }
    TEUIModelRef<FVM_NormalSkillBtn> GetHealBtnVM() const property
    {
        this.TrackPropertyRead(1);
        return this.m_HealBtnVM;
    }
    void SetHealBtnVM(const TEUIModelRef<FVM_NormalSkillBtn> &inout __Value) property
    {
        TEUIModelRef<FVM_NormalSkillBtn> local_2;
        local_2 = this.m_HealBtnVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_HealBtnVM = __Value;
        return;
    }
    TEUIModelRef<FVM_NormalSkillBtn> GetCombatBtnVM1() const property
    {
        this.TrackPropertyRead(2);
        return this.m_CombatBtnVM1;
    }
    void SetCombatBtnVM1(const TEUIModelRef<FVM_NormalSkillBtn> &inout __Value) property
    {
        TEUIModelRef<FVM_NormalSkillBtn> local_2;
        local_2 = this.m_CombatBtnVM1;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CombatBtnVM1 = __Value;
        return;
    }
    TEUIModelRef<FVM_NormalSkillBtn> GetCombatBtnVM2() const property
    {
        this.TrackPropertyRead(3);
        return this.m_CombatBtnVM2;
    }
    void SetCombatBtnVM2(const TEUIModelRef<FVM_NormalSkillBtn> &inout __Value) property
    {
        TEUIModelRef<FVM_NormalSkillBtn> local_2;
        local_2 = this.m_CombatBtnVM2;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CombatBtnVM2 = __Value;
        return;
    }
    ESlateVisibility GetCombatItem1Visible() const property
    {
        this.TrackPropertyRead(4);
        return this.m_CombatItem1Visible;
    }
    void SetCombatItem1Visible(const ESlateVisibility __Value) property
    {
        if (int(this.m_CombatItem1Visible) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_CombatItem1Visible = __Value;
        return;
    }
    ESlateVisibility GetCombatItem2Visible() const property
    {
        this.TrackPropertyRead(5);
        return this.m_CombatItem2Visible;
    }
    void SetCombatItem2Visible(const ESlateVisibility __Value) property
    {
        if (int(this.m_CombatItem2Visible) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_CombatItem2Visible = __Value;
        return;
    }
    ESlateVisibility GetHealItemVisible() const property
    {
        this.TrackPropertyRead(6);
        return this.m_HealItemVisible;
    }
    void SetHealItemVisible(const ESlateVisibility __Value) property
    {
        if (int(this.m_HealItemVisible) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_HealItemVisible = __Value;
        return;
    }
    bool GetbCenterIconVisible() const property
    {
        this.TrackPropertyRead(7);
        return this.m_bCenterIconVisible;
    }
    void SetbCenterIconVisible(const bool __Value) property
    {
        if (!(this.m_bCenterIconVisible) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_bCenterIconVisible = __Value;
        return;
    }
    TEUIModelRef<FVM_NormalSkillBtn> GetCombatTmpVM() const property
    {
        this.TrackPropertyRead(8);
        return this.m_CombatTmpVM;
    }
    void SetCombatTmpVM(const TEUIModelRef<FVM_NormalSkillBtn> &inout __Value) property
    {
        TEUIModelRef<FVM_NormalSkillBtn> local_2;
        local_2 = this.m_CombatTmpVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_CombatTmpVM = __Value;
        return;
    }
    TEUIModelRef<FVM_EquipHoverTips> GetHoverTipsVM() const property
    {
        this.TrackPropertyRead(9);
        return this.m_HoverTipsVM;
    }
    void SetHoverTipsVM(const TEUIModelRef<FVM_EquipHoverTips> &inout __Value) property
    {
        TEUIModelRef<FVM_EquipHoverTips> local_2;
        local_2 = this.m_HoverTipsVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_HoverTipsVM = __Value;
        return;
    }
    TEUIModelWeakRef<FVM_NormalSkillBtn> GetToolTipsBtn() const property
    {
        this.TrackPropertyRead(10);
        return this.m_ToolTipsBtn;
    }
    void SetToolTipsBtn(const TEUIModelWeakRef<FVM_NormalSkillBtn> &inout __Value) property
    {
        TEUIModelWeakRef<FVM_NormalSkillBtn> local_2;
        local_2 = this.m_ToolTipsBtn;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_ToolTipsBtn = __Value;
        return;
    }
    bool GetbInit() const property
    {
        this.TrackPropertyRead(11);
        return this.m_bInit;
    }
    void SetbInit(const bool __Value) property
    {
        if (!(this.m_bInit) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_bInit = __Value;
        return;
    }
    int GetHealItemNum() const property
    {
        this.TrackPropertyRead(12);
        return this.m_HealItemNum;
    }
    void SetHealItemNum(const int __Value) property
    {
        if (this.m_HealItemNum == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_HealItemNum = __Value;
        return;
    }
    int GetCombatItemNum() const property
    {
        this.TrackPropertyRead(13);
        return this.m_CombatItemNum;
    }
    void SetCombatItemNum(const int __Value) property
    {
        if (this.m_CombatItemNum == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_CombatItemNum = __Value;
        return;
    }
    const FECSEntity GetCurPawnEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(14);
        return __r;
    }
    FECSEntity GetModify_CurPawnEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(14);
        return __r;
    }
    void SetCurPawnEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_CurPawnEntity = __Value;
        return;
    }
    ESlateVisibility GetMountUsing() const property
    {
        this.TrackPropertyRead(15);
        return this.m_MountUsing;
    }
    void SetMountUsing(const ESlateVisibility __Value) property
    {
        if (int(this.m_MountUsing) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_MountUsing = __Value;
        return;
    }
    ESlateVisibility GetCachedVisibility() const property
    {
        this.TrackPropertyRead(16);
        return this.m_CachedVisibility;
    }
    void SetCachedVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_CachedVisibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_CachedVisibility = __Value;
        return;
    }
    bool GetbIsMountBtnUnlocked() const property
    {
        this.TrackPropertyRead(17);
        return this.m_bIsMountBtnUnlocked;
    }
    void SetbIsMountBtnUnlocked(const bool __Value) property
    {
        if (!(this.m_bIsMountBtnUnlocked) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_bIsMountBtnUnlocked = __Value;
        return;
    }
    bool GetbIsInventoryQuickSlotUnlocked() const property
    {
        this.TrackPropertyRead(18);
        return this.m_bIsInventoryQuickSlotUnlocked;
    }
    void SetbIsInventoryQuickSlotUnlocked(const bool __Value) property
    {
        if (!(this.m_bIsInventoryQuickSlotUnlocked) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(18);
        this.m_bIsInventoryQuickSlotUnlocked = __Value;
        return;
    }
    int GetHoverBtnIndex() const property
    {
        this.TrackPropertyRead(19);
        return this.m_HoverBtnIndex;
    }
    void SetHoverBtnIndex(const int __Value) property
    {
        if (this.m_HoverBtnIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(19);
        this.m_HoverBtnIndex = __Value;
        return;
    }
    bool GetbGamepadLeftShoulderPress() const property
    {
        this.TrackPropertyRead(20);
        return this.m_bGamepadLeftShoulderPress;
    }
    void SetbGamepadLeftShoulderPress(const bool __Value) property
    {
        if (!(this.m_bGamepadLeftShoulderPress) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(20);
        this.m_bGamepadLeftShoulderPress = __Value;
        return;
    }
    ESlateVisibility GetCombatTmpVisibility() const property
    {
        this.TrackPropertyRead(21);
        return this.m_CombatTmpVisibility;
    }
    void SetCombatTmpVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_CombatTmpVisibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(21);
        this.m_CombatTmpVisibility = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_ItemBtns
{
    UPROPERTY()
    int LeftShoulderPressSwitch;
    UPROPERTY()
    ESlateVisibility LeftShoulderPressVisibility;
    UPROPERTY()
    float32 SkillbtnsSizeOverride;
    UPROPERTY()
    ESlateVisibility CombatItem1Visibility;
    UPROPERTY()
    ESlateVisibility CombatItem2Visibility;
    UPROPERTY()
    ESlateVisibility HealItemVisibility;
    UPROPERTY()
    ESlateVisibility MountUsingVisibility;
    UPROPERTY()
    ESlateVisibility SkillBtnsPanelVisibility;
    UPROPERTY()
    ESlateVisibility CombatTmpBtnVisibility;
    UPROPERTY()
    bool IsBtnHoverVisible;
    UPROPERTY()
    bool IsMountBtnUnlock;
    UPROPERTY()
    bool IsInventoryQuickSlotUnlock;
    UPROPERTY()
    TEUIModelRef<FVMS_ItemBtns> Self;


}

namespace FVMS_ItemBtns
{
FVMS_ItemBtns& Get(const UObject ContextObject)
{
    return FVMS_ItemBtns::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_ItemBtns GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_ItemBtns __r;
    TEUIModelRef<FVMS_ItemBtns> local_6 = TEUIModelRef<FVMS_ItemBtns>(EUIInternal::MakeModelWithManager(Manager, FVMS_ItemBtns::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "MountBtnVM";
    local_14.TypeName = "TEUIModelRef<FVM_NormalSkillBtn>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HealBtnVM";
    local_14.TypeName = "TEUIModelRef<FVM_NormalSkillBtn>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CombatBtnVM1";
    local_14.TypeName = "TEUIModelRef<FVM_NormalSkillBtn>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CombatBtnVM2";
    local_14.TypeName = "TEUIModelRef<FVM_NormalSkillBtn>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CombatItem1Visible";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CombatItem2Visible";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HealItemVisible";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bCenterIconVisible";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CombatTmpVM";
    local_14.TypeName = "TEUIModelRef<FVM_NormalSkillBtn>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HoverTipsVM";
    local_14.TypeName = "TEUIModelRef<FVM_EquipHoverTips>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MountUsing";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LeftShoulderPressSwitch";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LeftShoulderPressVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SkillbtnsSizeOverride";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CombatItem1Visibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CombatItem2Visibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HealItemVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MountUsingVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SkillBtnsPanelVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CombatTmpBtnVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsBtnHoverVisible";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsMountBtnUnlock";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsInventoryQuickSlotUnlock";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_ItemBtns>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_ItemBtns;
    FEUIModelEffectDefine local_20;
    local_20.FunctionName = "RefreshPawnItemButtonState";
    Result.EffectFunctions.Add(local_20);
    local_20.FunctionName = "RefreshCenterIconVisibility";
    Result.EffectFunctions.Add(local_20);
    local_20.FunctionName = "RefreshCombatTmpInputActionVisibility";
    Result.EffectFunctions.Add(local_20);
    FEUIModelMsgHandleDefine local_30;
    local_30.FunctionName = "__OnClientConditionChanged";
    local_30.MessageTypeName = "Msg_ClientConditionChanged";
    local_30.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_30);
    local_20.FunctionName = "RefreshHoverButtonTips";
    Result.EffectFunctions.Add(local_20);
    FEUIModelEventDefine local_40;
    local_40.FunctionName = "__OnQuickSlotChanged";
    local_40.EventType = FCE_NotifyQuickSlotItemChanged;
    Result.EventFunctions.Add(local_40);
    local_40.FunctionName = "__OnQuickSlotInit";
    local_40.EventType = FCE_ItemQuickSlotInit;
    Result.EventFunctions.Add(local_40);
    local_30.FunctionName = "__OnInventoryChanged";
    local_30.MessageTypeName = "Msg_PlayerInventoryChanged";
    local_30.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_30);
    local_30.FunctionName = "__OnFashionMountChanged";
    local_30.MessageTypeName = "Msg_FashionMountChanged";
    local_30.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_30);
    local_30.FunctionName = "__OnSystemUnlockFromGS";
    local_30.MessageTypeName = "Msg_SystemUnlockFromGS";
    local_30.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_30);
    local_40.FunctionName = "__OnRemnantSlotChanged";
    local_40.EventType = FCE_RemnantSlotChangedEvent;
    Result.EventFunctions.Add(local_40);
    local_30.FunctionName = "__OnWorldChanged";
    local_30.MessageTypeName = "Msg_ECSWorldRequireCleanUp";
    local_30.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_30);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_ItemBtns;
}
void __OnClientConditionChanged(FVMS_ItemBtns &inout Model, const FMsg_ClientConditionChanged &inout Message)
{
    Model.OnClientConditionChanged(Message);
    return;
}
void __OnQuickSlotChanged(FVMS_ItemBtns &inout Model, const FCE_NotifyQuickSlotItemChanged &inout Event)
{
    Model.OnQuickSlotChanged(Event);
    return;
}
void __OnQuickSlotInit(FVMS_ItemBtns &inout Model, const FCE_ItemQuickSlotInit &inout Event)
{
    Model.OnQuickSlotInit(Event);
    return;
}
void __OnInventoryChanged(FVMS_ItemBtns &inout Model, const FMsg_PlayerInventoryChanged &inout Message)
{
    Model.OnInventoryChanged(Message);
    return;
}
void __OnFashionMountChanged(FVMS_ItemBtns &inout Model, const FMsg_FashionMountChanged &inout Message)
{
    Model.OnFashionMountChanged(Message);
    return;
}
void __OnSystemUnlockFromGS(FVMS_ItemBtns &inout Model, const FMsg_SystemUnlockFromGS &inout Message)
{
    Model.OnSystemUnlockFromGS(Message);
    return;
}
void __OnRemnantSlotChanged(FVMS_ItemBtns &inout Model, const FCE_RemnantSlotChangedEvent &inout Event)
{
    Model.OnRemnantSlotChanged(Event);
    return;
}
void __OnWorldChanged(FVMS_ItemBtns &inout Model, const FMsg_ECSWorldRequireCleanUp &inout Message)
{
    Model.OnWorldChanged(Message);
    return;
}
TEUIModelRef<FVM_NormalSkillBtn> __UIGetter_MountBtnVM(const FVMS_ItemBtns &inout Model)
{
    return Model.GetMountBtnVM();
}
TEUIModelRef<FVM_NormalSkillBtn> __UIGetter_HealBtnVM(const FVMS_ItemBtns &inout Model)
{
    return Model.GetHealBtnVM();
}
TEUIModelRef<FVM_NormalSkillBtn> __UIGetter_CombatBtnVM1(const FVMS_ItemBtns &inout Model)
{
    return Model.GetCombatBtnVM1();
}
TEUIModelRef<FVM_NormalSkillBtn> __UIGetter_CombatBtnVM2(const FVMS_ItemBtns &inout Model)
{
    return Model.GetCombatBtnVM2();
}
ESlateVisibility __UIGetter_CombatItem1Visible(const FVMS_ItemBtns &inout Model)
{
    return Model.GetCombatItem1Visible();
}
ESlateVisibility __UIGetter_CombatItem2Visible(const FVMS_ItemBtns &inout Model)
{
    return Model.GetCombatItem2Visible();
}
ESlateVisibility __UIGetter_HealItemVisible(const FVMS_ItemBtns &inout Model)
{
    return Model.GetHealItemVisible();
}
bool __UIGetter_bCenterIconVisible(const FVMS_ItemBtns &inout Model)
{
    return Model.GetbCenterIconVisible();
}
TEUIModelRef<FVM_NormalSkillBtn> __UIGetter_CombatTmpVM(const FVMS_ItemBtns &inout Model)
{
    return Model.GetCombatTmpVM();
}
TEUIModelRef<FVM_EquipHoverTips> __UIGetter_HoverTipsVM(const FVMS_ItemBtns &inout Model)
{
    return Model.GetHoverTipsVM();
}
ESlateVisibility __UIGetter_MountUsing(const FVMS_ItemBtns &inout Model)
{
    return Model.GetMountUsing();
}
int __UIGetter_LeftShoulderPressSwitch(const FVMS_ItemBtns &inout Model)
{
    return Model.GetLeftShoulderPressSwitch();
}
ESlateVisibility __UIGetter_LeftShoulderPressVisibility(const FVMS_ItemBtns &inout Model)
{
    return Model.GetLeftShoulderPressVisibility();
}
float32 __UIGetter_SkillbtnsSizeOverride(const FVMS_ItemBtns &inout Model)
{
    return Model.GetSkillbtnsSizeOverride();
}
ESlateVisibility __UIGetter_CombatItem1Visibility(const FVMS_ItemBtns &inout Model)
{
    return Model.GetCombatItem1Visibility();
}
ESlateVisibility __UIGetter_CombatItem2Visibility(const FVMS_ItemBtns &inout Model)
{
    return Model.GetCombatItem2Visibility();
}
ESlateVisibility __UIGetter_HealItemVisibility(const FVMS_ItemBtns &inout Model)
{
    return Model.GetHealItemVisibility();
}
ESlateVisibility __UIGetter_MountUsingVisibility(const FVMS_ItemBtns &inout Model)
{
    return Model.GetMountUsingVisibility();
}
ESlateVisibility __UIGetter_SkillBtnsPanelVisibility(const FVMS_ItemBtns &inout Model)
{
    return Model.SkillBtnsPanelVisibility();
}
ESlateVisibility __UIGetter_CombatTmpBtnVisibility(const FVMS_ItemBtns &inout Model)
{
    return Model.GetCombatTmpBtnVisibility();
}
bool __UIGetter_IsBtnHoverVisible(const FVMS_ItemBtns &inout Model)
{
    return Model.IsBtnHoverVisible();
}
bool __UIGetter_IsMountBtnUnlock(const FVMS_ItemBtns &inout Model)
{
    return Model.GetIsMountBtnUnlock();
}
bool __UIGetter_IsInventoryQuickSlotUnlock(const FVMS_ItemBtns &inout Model)
{
    return Model.GetIsInventoryQuickSlotUnlock();
}
TEUIModelRef<FVMS_ItemBtns> __UIGetter_Self(const FVMS_ItemBtns &inout Model)
{
    return TEUIModelRef<FVMS_ItemBtns>(Model);
}
int __IndexOf_MountBtnVM()
{
    return 0;
}
int __IndexOf_HealBtnVM()
{
    return 1;
}
int __IndexOf_CombatBtnVM1()
{
    return 2;
}
int __IndexOf_CombatBtnVM2()
{
    return 3;
}
int __IndexOf_CombatItem1Visible()
{
    return 4;
}
int __IndexOf_CombatItem2Visible()
{
    return 5;
}
int __IndexOf_HealItemVisible()
{
    return 6;
}
int __IndexOf_bCenterIconVisible()
{
    return 7;
}
int __IndexOf_CombatTmpVM()
{
    return 8;
}
int __IndexOf_HoverTipsVM()
{
    return 9;
}
int __IndexOf_ToolTipsBtn()
{
    return 10;
}
int __IndexOf_bInit()
{
    return 11;
}
int __IndexOf_HealItemNum()
{
    return 12;
}
int __IndexOf_CombatItemNum()
{
    return 13;
}
int __IndexOf_CurPawnEntity()
{
    return 14;
}
int __IndexOf_MountUsing()
{
    return 15;
}
int __IndexOf_CachedVisibility()
{
    return 16;
}
int __IndexOf_bIsMountBtnUnlocked()
{
    return 17;
}
int __IndexOf_bIsInventoryQuickSlotUnlocked()
{
    return 18;
}
int __IndexOf_HoverBtnIndex()
{
    return 19;
}
int __IndexOf_bGamepadLeftShoulderPress()
{
    return 20;
}
int __IndexOf_CombatTmpVisibility()
{
    return 21;
}
}
namespace __GeneratedProperties_FVMS_ItemBtns
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
