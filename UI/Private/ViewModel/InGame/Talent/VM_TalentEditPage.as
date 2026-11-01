namespace FVM_TalentEditPage
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnSkillItemSelected = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnSkillItemSelectedSlot = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SelectNextSkill = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SelectPrevSkill = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SelectFirst = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature ClosePage = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnBlankClick = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature CloseSkillChoice = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature UpdateSkillSellectType = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnSwitchCurSelectChoiceEquip = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature ShowTalentNodeHoverOpenDetails = FEUIModelCallbackSignature();

}
struct FVM_TalentEditPage : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_CurrentSkillIndex;
    UPROPERTY()
    int m_CacheLastSkillIndex;
    UPROPERTY()
    TEUIModelRef<FMS_Talent> m_TalentModel;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarShowcase> m_Showcase;
    UPROPERTY()
    TEUIModelRef<FMS_EditingAvatar> m_EditingAvatar;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_TalentEditSkillBtn>> m_OnEquipmentSkill;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_TalentSkillInfoItem>> m_OnSelectTypeAllSkill;
    UPROPERTY()
    TDataObjectPtr<FSkillBtnConfig> m_CurSkillBtnConfig;
    UPROPERTY()
    TEUIModelRef<FVM_TalentEditPageChangeSkill> m_SelectSkillChangeVM;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_TalentUpgradeFormulaTree>> m_CurrentTalentTreeList;
    UPROPERTY()
    TArray<FEUIModelContainer> m_CurrentTalentTreeListA;
    UPROPERTY()
    FCommonHoverHandle m_HoverTalentDetailsHandle;
    UPROPERTY()
    TEUIModelRef<FVM_TalentNodeHover> m_HoverTalentInfo;
    UPROPERTY()
    FEUIWidgetRef m_SelectedTalentPageHandle;
    UPROPERTY()
    TEUIModelWeakRef<FM_TalentNode> m_SelectedDetailTalentNode;
    UPROPERTY()
    TEUIModelRef<FVM_TalentSkillInfoItem> m_SelectedDetailSkillInfo;
    UPROPERTY()
    TEUIModelRef<FVM_TalentUpgradeConfirm> m_SelectedDetailUpgradeConfirm;
    UPROPERTY()
    bool m_TalentSkillChangePageIsOpen;
    UPROPERTY()
    bool m_bPendingClose;

    FVM_TalentEditPage()
    {
        this.m_CurrentSkillIndex = INDEX_NONE;
        this.m_CacheLastSkillIndex = INDEX_NONE;
        this.m_TalentSkillChangePageIsOpen = false;
        this.m_bPendingClose = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_TalentEditPage(const FVM_TalentEditPage &inout Other)
    {
        this.m_CurrentSkillIndex = INDEX_NONE;
        this.m_CacheLastSkillIndex = INDEX_NONE;
        this.m_TalentSkillChangePageIsOpen = false;
        this.m_bPendingClose = false;
        this.m_CurrentSkillIndex = int(Other.m_CurrentSkillIndex);
        this.m_CacheLastSkillIndex = int(Other.m_CacheLastSkillIndex);
        this.m_TalentModel = Other.m_TalentModel;
        this.m_Showcase = Other.m_Showcase;
        this.m_EditingAvatar = Other.m_EditingAvatar;
        this.m_OnEquipmentSkill = Other.m_OnEquipmentSkill;
        this.m_OnSelectTypeAllSkill = Other.m_OnSelectTypeAllSkill;
        this.m_CurSkillBtnConfig = Other.m_CurSkillBtnConfig;
        this.m_SelectSkillChangeVM = Other.m_SelectSkillChangeVM;
        this.m_CurrentTalentTreeList = Other.m_CurrentTalentTreeList;
        this.m_CurrentTalentTreeListA = Other.m_CurrentTalentTreeListA;
        this.m_HoverTalentInfo = Other.m_HoverTalentInfo;
        this.m_SelectedTalentPageHandle = Other.m_SelectedTalentPageHandle;
        this.m_SelectedDetailTalentNode = Other.m_SelectedDetailTalentNode;
        this.m_SelectedDetailSkillInfo = Other.m_SelectedDetailSkillInfo;
        this.m_SelectedDetailUpgradeConfirm = Other.m_SelectedDetailUpgradeConfirm;
        this.m_TalentSkillChangePageIsOpen = Other.m_TalentSkillChangePageIsOpen;
        this.m_bPendingClose = Other.m_bPendingClose;
        return;
    }
    FVM_TalentEditPage opAssign(const FVM_TalentEditPage &inout Other)
    {
        FVM_TalentEditPage __r;
        this.m_CurrentSkillIndex = int(Other.m_CurrentSkillIndex);
        this.m_CacheLastSkillIndex = int(Other.m_CacheLastSkillIndex);
        this.m_TalentModel = Other.m_TalentModel;
        this.m_Showcase = Other.m_Showcase;
        this.m_EditingAvatar = Other.m_EditingAvatar;
        this.m_OnEquipmentSkill = Other.m_OnEquipmentSkill;
        this.m_OnSelectTypeAllSkill = Other.m_OnSelectTypeAllSkill;
        this.m_CurSkillBtnConfig = Other.m_CurSkillBtnConfig;
        this.m_SelectSkillChangeVM = Other.m_SelectSkillChangeVM;
        this.m_CurrentTalentTreeList = Other.m_CurrentTalentTreeList;
        this.m_CurrentTalentTreeListA = Other.m_CurrentTalentTreeListA;
        this.m_HoverTalentInfo = Other.m_HoverTalentInfo;
        this.m_SelectedTalentPageHandle = Other.m_SelectedTalentPageHandle;
        this.m_SelectedDetailTalentNode = Other.m_SelectedDetailTalentNode;
        this.m_SelectedDetailSkillInfo = Other.m_SelectedDetailSkillInfo;
        this.m_SelectedDetailUpgradeConfirm = Other.m_SelectedDetailUpgradeConfirm;
        this.m_TalentSkillChangePageIsOpen = Other.m_TalentSkillChangePageIsOpen;
        this.m_bPendingClose = Other.m_bPendingClose;
        return __r;
    }
    FText GetTitle() const
    {
        if (!(!(this.GetEditingAvatar().IsValid())) && this.GetEditingAvatar().Get().GetAvatarConfig())
        {
            return FText::Format(NSLOCTEXT("Talent", "TalentTitleFormat", "天赋 <Beige24>/ {0}</>"), this.GetEditingAvatar().Get().GetAvatarConfig().Get().DisplayName);
        }
        return FText::FromString("");
    }
    bool TalentSkillChangePageIsClose() const
    {
        return !(this.GetTalentSkillChangePageIsOpen());
    }
    bool TalentSkillHasSelect() const
    {
        int local_2 = INDEX_NONE;
        return (this.GetCurrentSkillIndex() != local_2);
    }
    bool TalentSkillHasNotSelect() const
    {
        return !(this.TalentSkillHasSelect());
    }
    bool CanShowCurrency() const
    {
        return this.GetIsNotDetailSelected() && !(this.GetTalentSkillChangePageIsOpen());
    }
    TEUIModelRef<FVM_TalentEditSkillBtn> GetSelectedSkillItem() const
    {
        if (this.GetOnEquipmentSkill().IsValidIndex(this.GetCurrentSkillIndex()))
        {
            return this.GetOnEquipmentSkill()[this.GetCurrentSkillIndex()];
        }
        return TEUIModelRef<FVM_TalentEditSkillBtn>();
    }
    void SetCurrentShowcase(const TEUIModelRef<FVM_AvatarShowcase> &inout InShowcase)
    {
        this.SetShowcase(InShowcase);
        this.RefreshShowcaseAvatars();
        return;
    }
    void RefreshShowcaseAvatars()
    {
        if (this.GetShowcase())
        {
            TArray<TDataObjectPtr<FAvatarPrefabConfig>> local_8;
            if (this.GetEditingAvatar())
            {
                local_8.Add(this.GetEditingAvatar().Get().GetAvatarConfig());
            }
            this.GetShowcase().Get().SetNextAvatars(local_8);
        }
        return;
    }
    void Setup(const EEquipSlotType InEditingEquipSlot)
    {
        return;
    }
    void PostLoad()
    {
        return;
    }
    void PostConstruct()
    {
        this.SetTalentModel(TEUIModelRef<FMS_Talent>(::FMS_Talent::Get(this.GetContext().Manager)));
        this.SetEditingAvatar(TEUIModelRef<FMS_EditingAvatar>(::FMS_EditingAvatar::Get(this.GetContext().Manager)));
        bool local_5 = !(!(this.GetEditingAvatar().Get().GetAvatarConfig()));
        this.UpdateSkillList();
        this.UpdateTalentTreeList();
        TArray<TEUIModelRef<FVM_TalentSkillInfoItem>> local_10;
        this.SetSelectSkillChangeVM(TEUIModelRef<FVM_TalentEditPageChangeSkill>(::FVM_TalentEditPageChangeSkill::Create(this.GetContext().Manager, local_10)));
        if (this.GetTalentModel().IsValid())
        {
            this.GetTalentModel().Get().RefreshAllNodeActionableRedDots();
        }
        return;
    }
    void BeginDestroy()
    {
        FCommonHoverHandle local_2;
        if (local_2.opCmp(FCommonHoverHandle::InvalidHandle) != 0)
        {
            ::CommonPopup::CloseHover(this.GetHoverTalentDetailsHandle(), this.GetContext().Manager, true);
            this.SetHoverTalentDetailsHandle(FCommonHoverHandle::InvalidHandle);
        }
        return;
    }
    void OnShouldUpdateEquipmentSelectDetail()
    {
        this.UpdateSkillList();
        return;
    }
    void OnPlayerEquipmentChanged(const FC_DSPlayerAvatarInfo &inout C_PlayerAvatarInfo)
    {
        this.UpdateSkillList();
        return;
    }
    void OnTalentDataUpdated(const FMsg_TalentTreeDataUpdate &inout Msg)
    {
        this.UpdateSkillList();
        if (Msg.bStructural)
        {
            this.UpdateTalentTreeList();
        }
        if (this.GetTalentModel().IsValid())
        {
            this.GetTalentModel().Get().RefreshAllNodeActionableRedDots();
        }
        return;
    }
    void OnTalentTreeUpdateFinish(const FMsg_TalentTreeUpdateFinish &inout Msg)
    {
        if (!(this.GetSelectedDetailTalentNode().IsValid()) || !(Msg.FormulaTreeVM.IsValid()))
        {
            return;
        }
        int local_5 = this.GetSelectedDetailTalentNode().Get().GetDataId();
        int local_12 = this.GetSelectedDetailSkillInfo().IsValid() ? this.GetSelectedDetailSkillInfo().Get().GetChoiceIndex() : 0;
        for (auto& local_30 : Msg.FormulaTreeVM.Get().GetItemNodeMap())
        {
            if (!(local_30.GetKey().IsValid()) || !(local_30.GetValue().IsValid()))
            {
                continue;
            }
            if (local_30.GetKey().Get().GetDataId() != local_5)
            {
                continue;
            }
            for (auto& local_44 : local_30.GetValue().Get().GetChoiceNodeList())
            {
                if (local_44.IsValid())
                {
                    local_44.Get().SetbSelect((local_44.Get().GetChoiceIndex() == local_12));
                }
            }
        }
        return;
    }
    void UpdateSkillList()
    {
        int local_175;
        int local_178;
        int local_179;
        this.GetModify_OnEquipmentSkill().Empty(0);
        if (this.GetEditingAvatar().IsNull() || !(this.GetEditingAvatar().Get().GetAvatarConfig()))
        {
            return;
        }
        if (this.GetTalentModel().IsValid())
        {
            this.GetTalentModel().Get().RefreshNewSkillDerivedRedDots();
        }
        TDataObjectPtr<FAvatarPrefabConfig> local_32 = this.GetEditingAvatar().Get().GetAvatarConfig();
        UAvatarMappingSettings local_60 = ::UAvatarMappingSettings::Get();
        if (!((local_60 != nullptr)))
        {
            return;
        }
        TDataObjectPtr<FAvatarMappingConfig> local_84 = local_60.GetMappingConfigOfAvatar(local_32);
        if (!(local_84))
        {
            return;
        }
        int local_137 = local_84.Get().DataId;
        FAvatarEquippedTalentInfo local_136;
        this.GetTalentModel().Get().GetAvatarEquippedTalentInfo(local_137, local_136);
        TEUIModelWeakRef<FM_TalentNode> local_140;
        local_140 = this.GetTalentModel().Get().GetNodeByTalentId(int(local_136.FoundationId));
        TEUIModelRef<FVM_TalentEditSkillBtn> local_144 = TEUIModelRef<FVM_TalentEditSkillBtn>(::FVM_TalentEditSkillBtn::Create(this.GetContext().Manager, local_32, local_140, ESkillSlot(0)));
        TArray<TEUIModelRef<FM_TalentNode>> local_154 = this.GetTalentModel().Get().GetActiveFoundationTalentNodeList(local_84);
        local_144.Get().SetbCanChange((local_154.Num() > 1));
        this.GetModify_OnEquipmentSkill().Add(local_144);
        TArray<ESkillSlot> local_158 = ::FSkillUIUtils::GetAvatarAllSkillSlots(local_32);
        auto local_168 = local_158.Iterator();
        for (; local_168.CanProceed;)
        {
            local_175 = int(local_168.Proceed());
            if (local_175 == 1 || ((local_175 == 2)))
            {
                if (local_175 == 1)
                {
                    local_179 = 3;
                    local_178 = local_179;
                }
                else
                {
                    local_179 = 4;
                    local_178 = local_179;
                }
                TEUIModelWeakRef<FM_TalentNode> local_182;
                TArray<TEUIModelRef<FM_TalentNode>> local_154_2 = this.GetTalentModel().Get().GetActiveTalentNodeListByType(local_84, ESkillType(local_178));
                for (auto& local_200 : local_154_2)
                {
                    if (int(local_200.Get().GetTalentType()) == 6)
                    {
                        if (local_200.Get().GetConfig(0).Get().GetFoundationTalent().Get().DataId == (int(local_136.FoundationId)))
                        {
                            local_182 = TEUIModelWeakRef<FM_TalentNode>(local_200.Get());
                            break;
                        }
                    }
                }
                TEUIModelRef<FVM_TalentEditSkillBtn> local_230 = TEUIModelRef<FVM_TalentEditSkillBtn>(::FVM_TalentEditSkillBtn::Create(this.GetContext().Manager, local_32, local_182, ESkillSlot(local_175)));
                this.GetModify_OnEquipmentSkill().Add(local_230);
                continue;
            }
            int local_176 = local_175;
            int local_231 = local_176;
            TEUIModelWeakRef<FM_TalentNode> local_182;
            if (local_136.SlotToTalentId.Contains(local_231))
            {
                local_182 = this.GetTalentModel().Get().GetNodeByTalentId(local_136.SlotToTalentId[local_231]);
            }
            TEUIModelRef<FVM_TalentEditSkillBtn> local_230_2 = TEUIModelRef<FVM_TalentEditSkillBtn>(::FVM_TalentEditSkillBtn::Create(this.GetContext().Manager, local_32, local_182, ESkillSlot(local_175)));
            if (local_182.IsValid())
            {
                int local_177 = int(local_182.Get().GetEffectiveSkillType());
                if (local_177 != 0)
                {
                    if (this.GetTalentModel().Get().GetActiveTalentNodeListByType(local_84, ESkillType(local_177)).Num() > 1)
                    {
                        local_230_2.Get().SetbCanChange(true);
                    }
                    else
                    {
                        local_230_2.Get().SetbCanChange(false);
                    }
                }
            }
            this.GetModify_OnEquipmentSkill().Add(local_230_2);
            continue;
        }
        return;
    }
    TEUIModelRef<FVM_TalentEditSkillBtn> GetSkillItemBySlot(const ESkillSlot SkillSlot)
    {
        for (auto& local_16 : this.GetOnEquipmentSkill())
        {
            if ((int(local_16.Get().GetSkillButtonSlot())) == (int(SkillSlot)))
            {
                return local_16;
            }
        }
        return TEUIModelRef<FVM_TalentEditSkillBtn>();
    }
    void OnSkillItemSelected(const FEUIModelContainer &inout SkillItem)
    {
        int local_7 = this.GetOnEquipmentSkill().IndexOfByKey(TEUIModelRef<FVM_TalentEditSkillBtn>(FEUIModelContainer::GetModel(SkillItem).opCall()));
        if (local_7 == this.GetCurrentSkillIndex())
        {
            return;
        }
        if (local_7 == INDEX_NONE)
        {
            this.SetTalentSkillChangePageIsOpen(false);
            return;
        }
        this.SetCurrentSkillIndex(local_7);
        this.UpdateSkillSellectType(FEUIModelContainer::GetModel(SkillItem).opCall().GetSkillButtonSlot(), FEUIModelContainer::GetModel(SkillItem).opCall().GetSkillType());
        return;
    }
    void OnSkillItemSelectedSlot(const ESkillSlot SkillSlot)
    {
        int local_1 = -1;
        for (auto& local_18 : this.GetOnEquipmentSkill())
        {
            if (int(local_18.Get().GetSkillButtonSlot()) == int(SkillSlot))
            {
                local_1 = this.GetOnEquipmentSkill().IndexOfByKey(local_18);
                break;
            }
        }
        this.SetCurrentSkillIndex(local_1);
        return;
    }
    void SelectNextSkill()
    {
        this.MoveSelectSkill(1);
        return;
    }
    void SelectPrevSkill()
    {
        this.MoveSelectSkill(-1);
        return;
    }
    void SelectFirst()
    {
        if (this.GetOnEquipmentSkill().Num() <= 0)
        {
            this.SetCurrentSkillIndex(INDEX_NONE);
            this.SetCacheLastSkillIndex(INDEX_NONE);
            return;
        }
        if (this.GetCacheLastSkillIndex() == INDEX_NONE)
        {
            if (this.GetCurrentSkillIndex() < 0)
            {
                this.SetCurrentSkillIndex(0);
                TEUIModelRef<FVM_TalentEditSkillBtn> local_6 = TEUIModelRef<FVM_TalentEditSkillBtn>(this.GetOnEquipmentSkill()[this.GetCurrentSkillIndex()]);
                this.UpdateSkillSellectType(local_6.opArrow().GetSkillButtonSlot(), local_6.opArrow().GetSkillType());
            }
            return;
        }
        this.SetCurrentSkillIndex(this.GetCacheLastSkillIndex());
        TEUIModelRef<FVM_TalentEditSkillBtn> local_6_2 = TEUIModelRef<FVM_TalentEditSkillBtn>(this.GetOnEquipmentSkill()[this.GetCurrentSkillIndex()]);
        this.UpdateSkillSellectType(local_6_2.opArrow().GetSkillButtonSlot(), local_6_2.opArrow().GetSkillType());
        return;
    }
    void MoveSelectSkill(const int Offset)
    {
        if (this.GetOnEquipmentSkill().Num() <= 0)
        {
            this.SetCurrentSkillIndex(INDEX_NONE);
            this.SetCacheLastSkillIndex(INDEX_NONE);
            return;
        }
        this.SetCurrentSkillIndex(this.GetCurrentSkillIndex() + Offset);
        if (this.GetCurrentSkillIndex() < 0)
        {
            this.SetCurrentSkillIndex((this.GetOnEquipmentSkill().Num() - 1));
        }
        if (this.GetCurrentSkillIndex() >= this.GetOnEquipmentSkill().Num())
        {
            this.SetCurrentSkillIndex(0);
        }
        TEUIModelRef<FVM_TalentEditSkillBtn> local_6 = TEUIModelRef<FVM_TalentEditSkillBtn>(this.GetOnEquipmentSkill()[this.GetCurrentSkillIndex()]);
        this.UpdateSkillSellectType(local_6.opArrow().GetSkillButtonSlot(), local_6.opArrow().GetSkillType());
        return;
    }
    void ClosePage()
    {
        if (this.GetTalentSkillChangePageIsOpen())
        {
            this.CloseSkillChoice();
            return;
        }
        if (this.GetSelectedTalentPageHandle().IsValid())
        {
            this.CloseDetailSelected();
            return;
        }
        this.SetbPendingClose(true);
        if (!(!(this.GetTalentModel().IsValid() && this.GetEditingAvatar().IsValid())) && this.GetEditingAvatar().Get().GetAvatarConfig())
        {
            TDataObjectPtr<FAvatarMappingConfig> local_34 = ::UAvatarMappingSettings::Get().GetMappingConfigOfAvatar(this.GetEditingAvatar().Get().GetAvatarConfig());
            if (local_34)
            {
                this.GetTalentModel().Get().ConsumeAllPerNodeRedDots(local_34.Get().DataId);
            }
        }
        return;
    }
    void OnBlankClick()
    {
        if (this.GetTalentSkillChangePageIsOpen())
        {
            this.CloseSkillChoice();
            return;
        }
        else
        {
            if (this.GetSelectedTalentPageHandle().IsValid())
            {
                this.CloseDetailSelected();
                return;
            }
        }
    }
    void CloseSkillChoice()
    {
        if (this.GetTalentSkillChangePageIsOpen())
        {
            this.SetTalentSkillChangePageIsOpen(false);
        }
        this.SetCacheLastSkillIndex(this.GetCurrentSkillIndex());
        this.SetCurrentSkillIndex(INDEX_NONE);
        if (this.GetTalentModel().IsValid())
        {
            for (auto& local_18 : this.GetOnSelectTypeAllSkill())
            {
                if (local_18.IsValid() && local_18.Get().GetTalentNode().IsValid())
                {
                    this.GetTalentModel().Get().ConsumeNewSkillRedDot(local_18.Get().GetTalentNode().Get().GetDataId());
                }
            }
        }
        this.GetModify_OnSelectTypeAllSkill().Empty(0);
        return;
    }
    void UpdateSkillSellectType(const ESkillSlot SkillSlot, const ESkillType SkillType)
    {
        TDataObjectPtr<FAvatarPrefabConfig> local_26 = this.GetEditingAvatar().Get().GetAvatarConfig();
        UAvatarMappingSettings local_54 = ::UAvatarMappingSettings::Get();
        TDataObjectPtr<FAvatarMappingConfig> local_78;
        if (local_54 != nullptr)
        {
            local_78 = local_54.GetMappingConfigOfAvatar(local_26);
        }
        this.GetModify_OnSelectTypeAllSkill().Empty(0);
        if (int(SkillType) == 2)
        {
            TArray<TEUIModelRef<FM_TalentNode>> local_136 = this.GetTalentModel().Get().GetActiveFoundationTalentNodeList(local_78);
            for (auto& local_154 : local_136)
            {
                TEUIModelRef<FVM_TalentSkillInfoItem> local_156 = TEUIModelRef<FVM_TalentSkillInfoItem>(::FVM_TalentSkillInfoItem::Create(this.GetContext().Manager, local_78, local_154, ESkillSlot(0), ETalentInfoShowPageType(2)));
                local_156.Get().SetEnterButtonSlot(ESkillSlot(SkillSlot));
                this.GetModify_OnSelectTypeAllSkill().Add(local_156);
            }
        }
        else
        {
            TArray<TEUIModelRef<FM_TalentNode>> local_140 = this.GetTalentModel().Get().GetActiveTalentNodeListByType(local_78, ESkillType(SkillType));
            for (auto& local_154 : local_140)
            {
                TEUIModelRef<FVM_TalentSkillInfoItem> local_156_2 = TEUIModelRef<FVM_TalentSkillInfoItem>(::FVM_TalentSkillInfoItem::Create(this.GetContext().Manager, local_78, local_154, ESkillSlot(this.GetTalentModel().Get().GetSlotByTalentNodeId(local_78.Get().DataId, local_154.Get().GetDataId())), ETalentInfoShowPageType(2)));
                local_156_2.Get().SetEnterButtonSlot(ESkillSlot(SkillSlot));
                this.GetModify_OnSelectTypeAllSkill().Add(local_156_2);
            }
        }
        this.SetTalentSkillChangePageIsOpen(true);
        this.SetSelectSkillChangeVM(TEUIModelRef<FVM_TalentEditPageChangeSkill>(::FVM_TalentEditPageChangeSkill::Create(this.GetContext().Manager, this.GetOnSelectTypeAllSkill())));
        TEUIModelRef<FVM_TalentEditSkillBtn> local_168 = this.GetSkillItemBySlot(ESkillSlot(SkillSlot));
        if (local_168.IsValid())
        {
            this.GetSelectSkillChangeVM().Get().Setup(local_168);
        }
        return;
    }
    void OnTalentUnlockOrUpgradeRequest(const FMsg_TalentUnlockOrUpgradeOpenConfirm &inout Msg)
    {
        if (!(Msg.TalentNode.IsValid()))
        {
            return;
        }
        TEUIModelRef<FVM_TalentUpgradeConfirm> local_4 = TEUIModelRef<FVM_TalentUpgradeConfirm>(::FVM_TalentUpgradeConfirm::Create(this.GetContext().Manager, TEUIModelRef<FM_TalentNode>(Msg.TalentNode.Get())));
        local_4.Get().SetChoiceIndex(int(Msg.ChoiceIndex));
        FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_Msg_TalentSKillUpgradeConfirm, local_4.opImplConv());
        return;
    }
    void OnTalentSetEquipSkillSlot(const FMsg_TalentSetEquipSkillSlot &inout Msg)
    {
        int local_69;
        if (!(Msg.TalentNode.IsValid()))
        {
            return;
        }
        if (int(Msg.TalentNode.Get().GetStateType()) != 3)
        {
            FCommonTipsParam local_12;
            ::CommonPopup::WeakTips(NSLOCTEXT("Talent", "TalentNotUnlocked", "请先解锁当前天赋"), local_12);
            return;
        }
        if (this.GetCurrentSkillIndex() == INDEX_NONE || !(this.GetOnEquipmentSkill().IsValidIndex(this.GetCurrentSkillIndex())))
        {
            return;
        }
        if (::FASCommonUtils::IsInCombat(this.GetContext().GetLocalPlayerPawn()))
        {
            FCommonTipsParam local_12;
            ::CommonPopup::WeakTips(NSLOCTEXT("Talent", "TalentNotInBattle", "战斗中无法切换天赋"), local_12);
            return;
        }
        TDataObjectPtr<FAvatarPrefabConfig> local_44 = this.GetEditingAvatar().Get().GetAvatarConfig();
        if (!(local_44))
        {
            return;
        }
        local_69 = int(this.GetOnEquipmentSkill()[this.GetCurrentSkillIndex()].Get().GetSkillButtonSlot());
        int local_3 = FSkillUtils::GetSkillIndex(this.GetContext().GetLocalPlayerPawn(), ESkillSlot(local_69));
        if (local_3 != INDEX_NONE && (float32(FSkillUtils::GetSkillCDRemainTime(this.GetContext().GetLocalPlayerPawn(), local_3).ToSeconds()) > 0.0f))
        {
            FCommonTipsParam local_12;
            ::CommonPopup::WeakTips(NSLOCTEXT("Talent", "TalentSkillInCD", "技能冷却中，无法切换"), local_12);
            return;
        }
        UAvatarMappingSettings local_82 = ::UAvatarMappingSettings::Get();
        if (local_82 != nullptr)
        {
            FCommonTipsParam local_12;
            TDataObjectPtr<FAvatarMappingConfig> local_106 = local_82.GetMappingConfigOfAvatar(local_44);
            if (local_106)
            {
                int local_137 = this.GetTalentModel().Get().GetSlotByTalentNodeId(local_106.Get().DataId, Msg.TalentNode.Get().GetDataId());
                if (local_137 != 0 && ((local_137 != local_69)))
                {
                    int local_71 = FSkillUtils::GetSkillIndex(this.GetContext().GetLocalPlayerPawn(), ESkillSlot(local_137));
                    if (local_71 != INDEX_NONE && (float32(FSkillUtils::GetSkillCDRemainTime(this.GetContext().GetLocalPlayerPawn(), local_71).ToSeconds()) > 0.0f))
                    {
                        ::CommonPopup::WeakTips(NSLOCTEXT("Talent", "TalentSkillInCD", "技能冷却中，无法切换"), local_12);
                        return;
                    }
                }
            }
        }
        TDataObjectPtr<FTalentConfig> local_186 = Msg.TalentNode.Get().FindTalentByChoiceAndLevel(int(Msg.ChoiceIndex), FMath::Max(Msg.TalentNode.Get().GetCurrentLevel(), 1));
        if (!(local_186))
        {
            return;
        }
        int local_136_2 = local_186.Get().DataId;
        FPbManageTalentReq local_190;
        local_190.SetAvatarId(local_44.Get().DataId);
        FPbAvatarReplaceSkillBin local_200 = local_190.GetReplaceSkill();
        local_200.SetSlot(local_69);
        local_200.SetTalentId(local_136_2);
        ::UGameClientConnectionSubsystem::Get().SendProtoWrapper(local_190.ToWrapper());
        this.CloseSkillChoice();
        return;
    }
    void OnTalentSetEquipChoiceTalent(const FMsg_TalentSetEquipChoiceTalent &inout Msg)
    {
        if (!(Msg.TalentNode.IsValid()))
        {
            return;
        }
        if (int(Msg.TalentNode.Get().GetStateType()) != 3)
        {
            FCommonTipsParam local_12;
            ::CommonPopup::WeakTips(NSLOCTEXT("Talent", "TalentNotUnlocked", "请先解锁当前天赋"), local_12);
            return;
        }
        if (::FASCommonUtils::IsInCombat(this.GetContext().GetLocalPlayerPawn()))
        {
            FCommonTipsParam local_12;
            ::CommonPopup::WeakTips(NSLOCTEXT("Talent", "TalentNotInBattle", "战斗中无法切换天赋"), local_12);
            return;
        }
        TDataObjectPtr<FAvatarPrefabConfig> local_42 = this.GetEditingAvatar().Get().GetAvatarConfig();
        if (!(local_42))
        {
            return;
        }
        UAvatarMappingSettings local_70 = ::UAvatarMappingSettings::Get();
        if ((!((local_70 != nullptr))))
        {
            return;
        }
        TDataObjectPtr<FAvatarMappingConfig> local_94 = local_70.GetMappingConfigOfAvatar(local_42);
        if (!(local_94))
        {
            return;
        }
        int local_125 = this.GetTalentModel().Get().GetSlotByTalentNodeId(local_94.Get().DataId, Msg.TalentNode.Get().GetDataId());
        if (local_125 != 0)
        {
            FCommonTipsParam local_12;
            int local_4 = FSkillUtils::GetSkillIndex(this.GetContext().GetLocalPlayerPawn(), ESkillSlot(local_125));
            if (local_4 != INDEX_NONE && (float32(FSkillUtils::GetSkillCDRemainTime(this.GetContext().GetLocalPlayerPawn(), local_4).ToSeconds()) > 0.0f))
            {
                ::CommonPopup::WeakTips(NSLOCTEXT("Talent", "TalentSkillInCD", "技能冷却中，无法切换"), local_12);
                return;
            }
        }
        TDataObjectPtr<FTalentConfig> local_184 = Msg.TalentNode.Get().FindTalentByChoiceAndLevel(int(Msg.NewChoice), FMath::Max(Msg.TalentNode.Get().GetCurrentLevel(), 1));
        if (!(local_184))
        {
            return;
        }
        FPbManageTalentReq local_188;
        local_188.SetAvatarId(local_42.Get().DataId);
        local_188.SetChooseId(local_184.Get().DataId);
        ::UGameClientConnectionSubsystem::Get().SendProtoWrapper(local_188.ToWrapper());
        return;
    }
    void OnTalentSetEquipFoundation(const FMsg_TalentSetEquipFoundation &inout Msg)
    {
        if (!(Msg.FoundationNode.IsValid()))
        {
            return;
        }
        if ((int(Msg.FoundationNode.Get().GetStateType())) != 3)
        {
            FCommonTipsParam local_12;
            ::CommonPopup::WeakTips(NSLOCTEXT("Talent", "TalentNotUnlocked", "请先解锁当前天赋"), local_12);
            return;
        }
        if (::FASCommonUtils::IsInCombat(this.GetContext().GetLocalPlayerPawn()))
        {
            FCommonTipsParam local_12;
            ::CommonPopup::WeakTips(NSLOCTEXT("Talent", "TalentNotInBattle", "战斗中无法切换天赋"), local_12);
            return;
        }
        TDataObjectPtr<FAvatarPrefabConfig> local_42 = this.GetEditingAvatar().Get().GetAvatarConfig();
        if (!(local_42))
        {
            return;
        }
        UAvatarMappingSettings local_70 = ::UAvatarMappingSettings::Get();
        if ((!((local_70 != nullptr))))
        {
            return;
        }
        if (!(local_70.GetMappingConfigOfAvatar(local_42)))
        {
            return;
        }
        FPbManageTalentReq local_122;
        local_122.SetAvatarId(local_42.Get().DataId);
        local_122.SetFoundationId(Msg.FoundationNode.Get().GetDataId());
        ::UGameClientConnectionSubsystem::Get().SendProtoWrapper(local_122.ToWrapper());
        this.CloseSkillChoice();
        return;
    }
    void Tick()
    {
        return;
    }
    void DebugTickLogTreeList()
    {
        int local_20;
        FString local_4 = FString().Append("[VM_TalentEditPage] CurrentTalentTreeList Num=[").Append(this.GetCurrentTalentTreeList().Num()).Append("]");
        int local_10 = 0;
        for (; local_10 < this.GetCurrentTalentTreeList().Num(); )
        {
            FVM_TalentUpgradeFormulaTree& local_14 = this.GetCurrentTalentTreeList()[local_10].Get();
            if (local_14.GetTreeM().IsValid())
            {
                local_20 = local_14.GetTreeM().Get().GetTreeId();
            }
            else
            {
                local_20 = 0;
            }
            local_4 += FString().Append(" | [").Append(local_10).Append("] TreeId=").Append(local_20).Append(", NodeNum=").Append(local_14.GetNodeList().Num()).Append(", Branch=").Append(int(local_14.GetBranchType()));
            ++local_10;
        }
        XLog(ELog(68), local_4);
        return;
    }
    void UpdateTalentTreeList()
    {
        this.GetModify_CurrentTalentTreeList().Reset(0);
        TArray<TEUIModelWeakRef<FM_TalentTree>> local_14 = this.GetTalentModel().Get().GetTalentTreeListByAvatar(this.GetEditingAvatar().Get().GetAvatarConfig());
        __Lambda_UI_Private_ViewModel_InGame_Talent_VM_TalentEditPage_773 local_16;
        local_14.Sort(local_16);
        int local_17 = 0;
        for (; local_17 < local_14.Num(); ++local_17)
        {
            if (local_14[local_17].IsValid())
            {
                TEUIModelRef<FVM_TalentUpgradeFormulaTree> local_28 = TEUIModelRef<FVM_TalentUpgradeFormulaTree>(::FVM_TalentUpgradeFormulaTree::Create(this.GetContext().Manager, (TEUIModelWeakRef<FVM_TalentEditPage>(this)), TEUIModelWeakRef<FM_TalentTree>(local_14[local_17].Get()), local_17, 50.0f));
                this.GetModify_CurrentTalentTreeList().Add(local_28);
            }
        }
        if (this.GetCurrentTalentTreeList().Num() > 0)
        {
            this.GetModify_CurrentTalentTreeList()[(this.GetCurrentTalentTreeList().Num() - 1)].Get().SetbLastList(true);
        }
        return;
    }
    void OnTalentItemHoverStateChagne(const FMsg_TalentItemHoverStateChagne &inout Msg)
    {
        bool local_1;
        const UTalentSettings local_80;
        if (!(Msg.bShow) || !(Msg.TalentNode.IsValid()) || (!((Msg.SourceWidget != nullptr))))
        {
            TEUIModelRef<FVM_TalentNodeHover> local_6 = this.GetHoverTalentInfo();
            if (local_6.IsValid())
            {
                local_1 = false;
                TEUIModelRef<FVM_TalentNodeHover> local_6_2 = this.GetHoverTalentInfo();
                local_6_2.opArrow().SetbVisible(local_1);
            }
            return;
        }
        FM_TalentNode& local_8 = Msg.TalentNode.Get();
        if (!(local_8.GetConfig(int(Msg.ChoiceIndex))))
        {
            return;
        }
        FCommonHoverHandle local_60;
        if (local_60.opCmp(FCommonHoverHandle::InvalidHandle) != 0)
        {
            TEUIModelRef<FM_TalentNode> local_62 = TEUIModelRef<FM_TalentNode>(local_8);
            TEUIModelRef<FVM_TalentNodeHover> local_6_3 = this.GetHoverTalentInfo();
            local_6_3.opArrow().SetTalentNode(local_62);
            TEUIModelRef<FVM_TalentNodeHover> local_6_4 = this.GetHoverTalentInfo();
            local_6_4.opArrow().SetChoiceIndex(Msg.ChoiceIndex);
            local_1 = true;
            TEUIModelRef<FVM_TalentNodeHover> local_6_5 = this.GetHoverTalentInfo();
            local_6_5.opArrow().SetbVisible(local_1);
            ::CommonPopup::SetHover(this.GetHoverTalentDetailsHandle(), Msg.SourceWidget, this.GetContext().Manager);
            return;
        }
        FEUIModelContainer local_76;
        TEUIModelRef<FVM_TalentNodeHover> local_6_6 = TEUIModelRef<FVM_TalentNodeHover>(::FVM_TalentNodeHover::Create(this.GetContext().Manager, (TEUIModelRef<FM_TalentNode>(local_8)), int(Msg.ChoiceIndex)));
        this.SetHoverTalentInfo(local_6_6);
        TEUIModelRef<FVM_TalentNodeHover> local_6_7 = this.GetHoverTalentInfo();
        local_76.AddModel(local_6_7.opImplConv(), false);
        GetGameplaySettings<UTalentSettings> local_82;
        local_80 = local_82;
        local_60 = ::CommonPopup::HoverCustom(Msg.SourceWidget, local_80.TalentInfoHover, local_76, false, true, ECommonHoverLayout(0), EEUILayoutLayer(0), false);
        this.SetHoverTalentDetailsHandle(local_60);
        return;
    }
    bool IsCurSelectIsChooiceNode() const
    {
        if (this.GetHoverTalentInfo().IsValid() && this.GetHoverTalentInfo().opArrow().GetbVisible() && this.GetHoverTalentInfo().opArrow().GetTalentNode().IsValid())
        {
            return this.GetHoverTalentInfo().opArrow().GetTalentNode().Get().IsUnequippedChoice(this.GetHoverTalentInfo().opArrow().GetChoiceIndex());
        }
        return false;
    }
    void OnSwitchCurSelectChoiceEquip()
    {
        if (this.IsCurSelectIsChooiceNode())
        {
            if (this.GetHoverTalentInfo().IsValid() && this.GetHoverTalentInfo().opArrow().GetbVisible() && this.GetHoverTalentInfo().opArrow().GetTalentNode().IsValid())
            {
                FMsg_TalentSetEquipChoiceTalent local_10;
                FEUIModelRef local_16 = FEUIModelRef(this);
                FEUIMessageBus::Publish(EUIMessageBus);
                local_10.TalentNode = TEUIModelWeakRef<FM_TalentNode>(this.GetHoverTalentInfo().opArrow().GetTalentNode().Get());
                local_10.NewChoice = this.GetHoverTalentInfo().opArrow().GetChoiceIndex();
            }
        }
        return;
    }
    bool GetIsDetailSelected() const
    {
        return this.GetSelectedDetailTalentNode().IsValid();
    }
    bool GetIsNotDetailSelected() const
    {
        return !(this.GetIsDetailSelected());
    }
    void OnTalentNodeHoverOpenDetails(const FMsg_TalentNodeHoverOpenDetails &inout Msg)
    {
        if (!(Msg.TalentNode.IsValid()))
        {
            return;
        }
        if (this.GetSelectedTalentPageHandle())
        {
            FEUIWidget::RemoveWidget(this.GetSelectedTalentPageHandle());
        }
        this.SetSelectedDetailTalentNode(Msg.TalentNode);
        if (this.GetTalentModel().IsValid())
        {
            this.GetTalentModel().Get().ConsumePerNodeRedDot(Msg.TalentNode.Get().GetDataId());
        }
        TDataObjectPtr<FAvatarPrefabConfig> local_32 = this.GetEditingAvatar().Get().GetAvatarConfig();
        TDataObjectPtr<FAvatarMappingConfig> local_80;
        if (local_32)
        {
            UAvatarMappingSettings local_84 = ::UAvatarMappingSettings::Get();
            if (local_84 != nullptr)
            {
                local_80 = local_84.GetMappingConfigOfAvatar(local_32);
            }
        }
        TEUIModelRef<FVM_TalentSkillInfoItem> local_138 = TEUIModelRef<FVM_TalentSkillInfoItem>(::FVM_TalentSkillInfoItem::Create(this.GetContext().Manager, local_80, TEUIModelRef<FM_TalentNode>(Msg.TalentNode.Get()), ESkillSlot(0), ETalentInfoShowPageType(1)));
        this.SetSelectedDetailSkillInfo(local_138);
        TEUIModelRef<FVM_TalentSkillInfoItem> local_138_2 = this.GetSelectedDetailSkillInfo();
        local_138_2.opArrow().SetChoiceIndex(Msg.ChoiceIndex);
        TEUIModelRef<FVM_TalentUpgradeConfirm> local_142 = TEUIModelRef<FVM_TalentUpgradeConfirm>(::FVM_TalentUpgradeConfirm::Create(this.GetContext().Manager, TEUIModelRef<FM_TalentNode>(Msg.TalentNode.Get())));
        this.SetSelectedDetailUpgradeConfirm(local_142);
        int local_139_2 = Msg.ChoiceIndex;
        TEUIModelRef<FVM_TalentUpgradeConfirm> local_142_2 = this.GetSelectedDetailUpgradeConfirm();
        local_142_2.opArrow().SetChoiceIndex(local_139_2);
        TEUIModelRef<FVM_TalentUpgradeConfirm> local_142_3 = this.GetSelectedDetailUpgradeConfirm();
        FEUIModelRef local_144 = local_142_3.opImplConv();
        TEUIModelRef<FVM_TalentSkillInfoItem> local_138_3 = this.GetSelectedDetailSkillInfo();
        this.SetSelectedTalentPageHandle(FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_Avatar_TalentUpgrade, local_138_3.opImplConv(), local_144));
        return;
    }
    void OnTalentNodeHoverCloseDetails(const FMsg_TalentNodeHoverCloseDetails &inout Msg)
    {
        this.CloseDetailSelected();
        return;
    }
    void CloseDetailSelected()
    {
        TEUIModelWeakRef<FM_TalentNode> local_2 = this.GetSelectedDetailTalentNode();
        if (local_2.IsValid())
        {
            local_2 = this.GetSelectedDetailTalentNode();
            int local_4 = local_2.Get().GetDataId();
            for (auto& local_20 : this.GetCurrentTalentTreeList())
            {
                if (!(local_20.IsValid()))
                {
                    continue;
                }
                for (auto& local_38 : local_20.Get().GetItemNodeMap())
                {
                    if (!(local_38.GetKey().IsValid()) || !(local_38.GetValue().IsValid()))
                    {
                        continue;
                    }
                    if (local_38.GetKey().Get().GetDataId() != local_4)
                    {
                        continue;
                    }
                    for (auto& local_54 : local_38.GetValue().Get().GetChoiceNodeList())
                    {
                        if (local_54.IsValid())
                        {
                            local_54.Get().SetbSelect(false);
                        }
                    }
                }
            }
        }
        this.SetSelectedDetailTalentNode(local_2);
        this.SetSelectedDetailSkillInfo(TEUIModelRef<FVM_TalentSkillInfoItem>());
        this.SetSelectedDetailUpgradeConfirm(TEUIModelRef<FVM_TalentUpgradeConfirm>());
        if (this.GetSelectedTalentPageHandle())
        {
            FEUIWidget::RemoveWidget(this.GetSelectedTalentPageHandle());
        }
        return;
    }
    void ShowTalentNodeHoverOpenDetails()
    {
        if (this.GetHoverTalentInfo().IsValid() && this.GetHoverTalentInfo().opArrow().GetbVisible() && this.GetHoverTalentInfo().opArrow().GetTalentNode().IsValid())
        {
            FMsg_TalentNodeHoverOpenDetails local_8;
            FEUIModelRef local_14 = FEUIModelRef(this);
            FEUIMessageBus::Publish(EUIMessageBus);
            local_8.TalentNode = TEUIModelWeakRef<FM_TalentNode>(this.GetHoverTalentInfo().opArrow().GetTalentNode().Get());
            local_8.ChoiceIndex = this.GetHoverTalentInfo().opArrow().GetChoiceIndex();
        }
        return;
    }
    bool ShowTalentSkillChangeList() const
    {
        return this.GetIsNotDetailSelected();
    }
    int GetCurrentSkillIndex() const property
    {
        this.TrackPropertyRead(0);
        return this.m_CurrentSkillIndex;
    }
    void SetCurrentSkillIndex(const int __Value) property
    {
        if (this.m_CurrentSkillIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CurrentSkillIndex = __Value;
        return;
    }
    int GetCacheLastSkillIndex() const property
    {
        this.TrackPropertyRead(1);
        return this.m_CacheLastSkillIndex;
    }
    void SetCacheLastSkillIndex(const int __Value) property
    {
        if (this.m_CacheLastSkillIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CacheLastSkillIndex = __Value;
        return;
    }
    TEUIModelRef<FMS_Talent> GetTalentModel() const property
    {
        this.TrackPropertyRead(2);
        return this.m_TalentModel;
    }
    void SetTalentModel(const TEUIModelRef<FMS_Talent> &inout __Value) property
    {
        TEUIModelRef<FMS_Talent> local_2;
        local_2 = this.m_TalentModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_TalentModel = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarShowcase> GetShowcase() const property
    {
        this.TrackPropertyRead(3);
        return this.m_Showcase;
    }
    void SetShowcase(const TEUIModelRef<FVM_AvatarShowcase> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarShowcase> local_2;
        local_2 = this.m_Showcase;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_Showcase = __Value;
        return;
    }
    TEUIModelRef<FMS_EditingAvatar> GetEditingAvatar() const property
    {
        this.TrackPropertyRead(4);
        return this.m_EditingAvatar;
    }
    void SetEditingAvatar(const TEUIModelRef<FMS_EditingAvatar> &inout __Value) property
    {
        TEUIModelRef<FMS_EditingAvatar> local_2;
        local_2 = this.m_EditingAvatar;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_EditingAvatar = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_TalentEditSkillBtn>> GetOnEquipmentSkill() const property
    {
        const TArray<TEUIModelRef<FVM_TalentEditSkillBtn>> __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    TArray<TEUIModelRef<FVM_TalentEditSkillBtn>> GetModify_OnEquipmentSkill() property
    {
        TArray<TEUIModelRef<FVM_TalentEditSkillBtn>> __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetOnEquipmentSkill(const TArray<TEUIModelRef<FVM_TalentEditSkillBtn>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_OnEquipmentSkill = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_TalentSkillInfoItem>> GetOnSelectTypeAllSkill() const property
    {
        const TArray<TEUIModelRef<FVM_TalentSkillInfoItem>> __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    TArray<TEUIModelRef<FVM_TalentSkillInfoItem>> GetModify_OnSelectTypeAllSkill() property
    {
        TArray<TEUIModelRef<FVM_TalentSkillInfoItem>> __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetOnSelectTypeAllSkill(const TArray<TEUIModelRef<FVM_TalentSkillInfoItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_OnSelectTypeAllSkill = __Value;
        return;
    }
    const TDataObjectPtr<FSkillBtnConfig> GetCurSkillBtnConfig() const property
    {
        const TDataObjectPtr<FSkillBtnConfig> __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    TDataObjectPtr<FSkillBtnConfig> GetModify_CurSkillBtnConfig() property
    {
        TDataObjectPtr<FSkillBtnConfig> __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetCurSkillBtnConfig(const TDataObjectPtr<FSkillBtnConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_CurSkillBtnConfig = __Value;
        return;
    }
    TEUIModelRef<FVM_TalentEditPageChangeSkill> GetSelectSkillChangeVM() const property
    {
        this.TrackPropertyRead(8);
        return this.m_SelectSkillChangeVM;
    }
    void SetSelectSkillChangeVM(const TEUIModelRef<FVM_TalentEditPageChangeSkill> &inout __Value) property
    {
        TEUIModelRef<FVM_TalentEditPageChangeSkill> local_2;
        local_2 = this.m_SelectSkillChangeVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_SelectSkillChangeVM = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_TalentUpgradeFormulaTree>> GetCurrentTalentTreeList() const property
    {
        const TArray<TEUIModelRef<FVM_TalentUpgradeFormulaTree>> __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    TArray<TEUIModelRef<FVM_TalentUpgradeFormulaTree>> GetModify_CurrentTalentTreeList() property
    {
        TArray<TEUIModelRef<FVM_TalentUpgradeFormulaTree>> __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetCurrentTalentTreeList(const TArray<TEUIModelRef<FVM_TalentUpgradeFormulaTree>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_CurrentTalentTreeList = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetCurrentTalentTreeListA() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_CurrentTalentTreeListA() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetCurrentTalentTreeListA(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_CurrentTalentTreeListA = __Value;
        return;
    }
    const FCommonHoverHandle GetHoverTalentDetailsHandle() const property
    {
        const FCommonHoverHandle __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    FCommonHoverHandle GetModify_HoverTalentDetailsHandle() property
    {
        FCommonHoverHandle __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetHoverTalentDetailsHandle(const FCommonHoverHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        return;
    }
    TEUIModelRef<FVM_TalentNodeHover> GetHoverTalentInfo() const property
    {
        this.TrackPropertyRead(12);
        return this.m_HoverTalentInfo;
    }
    void SetHoverTalentInfo(const TEUIModelRef<FVM_TalentNodeHover> &inout __Value) property
    {
        TEUIModelRef<FVM_TalentNodeHover> local_2;
        local_2 = this.m_HoverTalentInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_HoverTalentInfo = __Value;
        return;
    }
    const FEUIWidgetRef GetSelectedTalentPageHandle() const property
    {
        const FEUIWidgetRef __r;
        this.TrackPropertyRead(13);
        return __r;
    }
    FEUIWidgetRef GetModify_SelectedTalentPageHandle() property
    {
        FEUIWidgetRef __r;
        this.MarkPropertyDirty(13);
        return __r;
    }
    void SetSelectedTalentPageHandle(const FEUIWidgetRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_SelectedTalentPageHandle = __Value;
        return;
    }
    TEUIModelWeakRef<FM_TalentNode> GetSelectedDetailTalentNode() const property
    {
        this.TrackPropertyRead(14);
        return this.m_SelectedDetailTalentNode;
    }
    void SetSelectedDetailTalentNode(const TEUIModelWeakRef<FM_TalentNode> &inout __Value) property
    {
        TEUIModelWeakRef<FM_TalentNode> local_2;
        local_2 = this.m_SelectedDetailTalentNode;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_SelectedDetailTalentNode = __Value;
        return;
    }
    TEUIModelRef<FVM_TalentSkillInfoItem> GetSelectedDetailSkillInfo() const property
    {
        this.TrackPropertyRead(15);
        return this.m_SelectedDetailSkillInfo;
    }
    void SetSelectedDetailSkillInfo(const TEUIModelRef<FVM_TalentSkillInfoItem> &inout __Value) property
    {
        TEUIModelRef<FVM_TalentSkillInfoItem> local_2;
        local_2 = this.m_SelectedDetailSkillInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_SelectedDetailSkillInfo = __Value;
        return;
    }
    TEUIModelRef<FVM_TalentUpgradeConfirm> GetSelectedDetailUpgradeConfirm() const property
    {
        this.TrackPropertyRead(16);
        return this.m_SelectedDetailUpgradeConfirm;
    }
    void SetSelectedDetailUpgradeConfirm(const TEUIModelRef<FVM_TalentUpgradeConfirm> &inout __Value) property
    {
        TEUIModelRef<FVM_TalentUpgradeConfirm> local_2;
        local_2 = this.m_SelectedDetailUpgradeConfirm;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_SelectedDetailUpgradeConfirm = __Value;
        return;
    }
    bool GetTalentSkillChangePageIsOpen() const property
    {
        this.TrackPropertyRead(17);
        return this.m_TalentSkillChangePageIsOpen;
    }
    void SetTalentSkillChangePageIsOpen(const bool __Value) property
    {
        if (!(this.m_TalentSkillChangePageIsOpen) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_TalentSkillChangePageIsOpen = __Value;
        return;
    }
    bool GetbPendingClose() const property
    {
        this.TrackPropertyRead(18);
        return this.m_bPendingClose;
    }
    void SetbPendingClose(const bool __Value) property
    {
        if (!(this.m_bPendingClose) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(18);
        this.m_bPendingClose = __Value;
        return;
    }
}

struct __Lambda_UI_Private_ViewModel_InGame_Talent_VM_TalentEditPage_773
{
    __Lambda_UI_Private_ViewModel_InGame_Talent_VM_TalentEditPage_773()
    {
        return;
    }
    bool opCall(const TEUIModelWeakRef<FM_TalentTree> &inout A, const TEUIModelWeakRef<FM_TalentTree> &inout B)
    {
        bool local_4;
        int local_1 = 2147483647;
        int local_3 = 2147483647;
        if (!(A.IsValid()))
        {
            local_4 = false;
        }
        else
        {
            local_4 = A.Get().GetLayoutConfig();
        }
        if (local_4)
        {
            local_1 = A.Get().GetLayoutConfig().Get().Priority;
        }
        if (!(B.IsValid()))
        {
            local_4 = false;
        }
        else
        {
            local_4 = B.Get().GetLayoutConfig();
        }
        if (local_4)
        {
            local_3 = B.Get().GetLayoutConfig().Get().Priority;
        }
        return (local_1 < local_3);
    }
}

struct __GeneratedProperties_FVM_TalentEditPage
{
    UPROPERTY()
    FText Title;
    UPROPERTY()
    bool TalentSkillChangePageIsClose;
    UPROPERTY()
    bool TalentSkillHasSelect;
    UPROPERTY()
    bool TalentSkillHasNotSelect;
    UPROPERTY()
    bool CanShowCurrency;
    UPROPERTY()
    TEUIModelRef<FVM_TalentEditSkillBtn> SelectedSkillItem;
    UPROPERTY()
    bool IsCurSelectIsChooiceNode;
    UPROPERTY()
    bool IsDetailSelected;
    UPROPERTY()
    bool IsNotDetailSelected;
    UPROPERTY()
    bool ShowTalentSkillChangeList;
    UPROPERTY()
    TEUIModelRef<FVM_TalentEditPage> Self;

}

namespace FVM_TalentEditPage
{
bool CanViewAvatarTalent(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FAvatarPrefabConfig> &inout InAvatarConfig)
{
    if (!(FMS_SystemControl::Get(Manager).IsSystemUnlock(ESystemModule(4), true)))
    {
        return false;
    }
    if (!(FMS_PlayerAvatarData::Get(Manager).IsAvatarUnlocked(InAvatarConfig)))
    {
        FCommonTipsParam local_12;
        CommonPopup::Tips(NSLOCTEXT("Talent", "AvatarNotUnlockedViewTalent", "角色未解锁，不能查看天赋。"), local_12);
        return false;
    }
    return true;
}
void GotoPage(const ULocalPlayer InLocalPlayer, const TDataObjectPtr<FAvatarPrefabConfig> &inout InAvatarConfig)
{
    FMS_EditingAvatar::Get(InLocalPlayer.GetWorld()).SetAvatarConfig(InAvatarConfig);
    FGameplayTag local_4 = FGameplayTag(GameplayTags::UI_Type_Avatar_Talent);
    if (!(FEUIWidget::FindWidget(InLocalPlayer, local_4)))
    {
        FEUIWidget::AddWidget(InLocalPlayer, local_4);
    }
    return;
}
TEUIModelRef<FVM_TalentEditSkillBtn> GetCurrentSelectSkillModel(const ULocalPlayer InLocalPlayer)
{
    if (FEUIWidget::FindWidget(InLocalPlayer, FGameplayTag(GameplayTags::UI_Type_Avatar_Talent)).IsValid())
    {
        FEUIWidgetRef::GetViewModel local_12;
        return local_12.opCall(NAME_None).GetSelectedSkillItem();
    }
    return TEUIModelRef<FVM_TalentEditSkillBtn>();
}
FVM_TalentEditPage& Create(const UObject ContextObject)
{
    return FVM_TalentEditPage::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_TalentEditPage& CreateByManager(const UEUIManagerSubsystem Manager)
{
    return TEUIModelRef<FVM_TalentEditPage>(EUIInternal::MakeModelWithManager(Manager, FVM_TalentEditPage::ModelId)).Get();
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasPostLoad(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "OnEquipmentSkill";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_TalentEditSkillBtn>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "OnSelectTypeAllSkill";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_TalentSkillInfoItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectSkillChangeVM";
    local_14.TypeName = "TEUIModelRef<FVM_TalentEditPageChangeSkill>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentTalentTreeList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_TalentUpgradeFormulaTree>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrentTalentTreeListA";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedDetailSkillInfo";
    local_14.TypeName = "TEUIModelRef<FVM_TalentSkillInfoItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedDetailUpgradeConfirm";
    local_14.TypeName = "TEUIModelRef<FVM_TalentUpgradeConfirm>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TalentSkillChangePageIsOpen";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bPendingClose";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Title";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TalentSkillChangePageIsClose";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TalentSkillHasSelect";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TalentSkillHasNotSelect";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CanShowCurrency";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedSkillItem";
    local_14.TypeName = "TEUIModelRef<FVM_TalentEditSkillBtn>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsCurSelectIsChooiceNode";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsDetailSelected";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsNotDetailSelected";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShowTalentSkillChangeList";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TalentEditPage>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TalentEditPage;
    FEUIModelRefPropertyDirtyIndexer local_22 = FEUIModelRefPropertyDirtyIndexer(19);
    local_22.AddRefPropertyDirty(0, 2, FMS_EditingAvatar::__IndexOf_AvatarConfig());
    local_22.ApplySort();
    FEUIModelRefPropertyDirty local_30;
    local_30.PropertyName = FName("EditingAvatar");
    local_30.PropertyModelId = FMS_EditingAvatar::ModelId;
    local_30.MappingDirtyOffset = local_22.GetMappingDirtyOffset(2);
    local_30.RelatedDirtyMask.SetBit(FMS_EditingAvatar::__IndexOf_AvatarConfig(), true);
    Result.ListeningModelRefDirties.Add(local_30);
    FEUIModelDirtyDefine local_40;
    local_40.FunctionName = "__RefreshShowcaseAvatars";
    local_40.DirtyFlags.Set(FVM_TalentEditPage::__IndexOf_EditingAvatar());
    Result.DirtyFunctions.Add(local_40);
    local_40.FunctionName = "__OnShouldUpdateEquipmentSelectDetail";
    local_40.DirtyFlags.Set(FVM_TalentEditPage::__IndexOf_EditingAvatar());
    local_40.DirtyFlags.Set(local_22.GetMappingDirtyIndex(0));
    Result.DirtyFunctions.Add(local_40);
    FEUIModelMonitorDefine local_50;
    local_50.FunctionName = "__OnPlayerEquipmentChanged";
    local_50.MonitorTarget = EEUIModelMonitorTarget(3);
    local_50.ComponentType = FC_DSPlayerAvatarInfo;
    Result.MonitorFunctions.Add(local_50);
    FEUIModelMsgHandleDefine local_62;
    local_62.FunctionName = "__OnTalentDataUpdated";
    local_62.MessageTypeName = "Msg_TalentTreeDataUpdate";
    local_62.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_62);
    local_62.FunctionName = "__OnTalentTreeUpdateFinish";
    local_62.MessageTypeName = "Msg_TalentTreeUpdateFinish";
    local_62.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_62);
    local_62.FunctionName = "__OnTalentUnlockOrUpgradeRequest";
    local_62.MessageTypeName = "Msg_TalentUnlockOrUpgradeOpenConfirm";
    local_62.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_62);
    local_62.FunctionName = "__OnTalentSetEquipSkillSlot";
    local_62.MessageTypeName = "Msg_TalentSetEquipSkillSlot";
    local_62.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_62);
    local_62.FunctionName = "__OnTalentSetEquipChoiceTalent";
    local_62.MessageTypeName = "Msg_TalentSetEquipChoiceTalent";
    local_62.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_62);
    local_62.FunctionName = "__OnTalentSetEquipFoundation";
    local_62.MessageTypeName = "Msg_TalentSetEquipFoundation";
    local_62.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_62);
    Result.TickFunction.FunctionName = "__Tick";
    local_62.FunctionName = "__OnTalentItemHoverStateChagne";
    local_62.MessageTypeName = "Msg_TalentItemHoverStateChagne";
    local_62.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_62);
    local_62.FunctionName = "__OnTalentNodeHoverOpenDetails";
    local_62.MessageTypeName = "Msg_TalentNodeHoverOpenDetails";
    local_62.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_62);
    local_62.FunctionName = "__OnTalentNodeHoverCloseDetails";
    local_62.MessageTypeName = "Msg_TalentNodeHoverCloseDetails";
    local_62.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_62);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TalentEditPage;
}
void __RefreshShowcaseAvatars(FVM_TalentEditPage &inout Model)
{
    Model.RefreshShowcaseAvatars();
    return;
}
void __OnShouldUpdateEquipmentSelectDetail(FVM_TalentEditPage &inout Model)
{
    Model.OnShouldUpdateEquipmentSelectDetail();
    return;
}
void __OnPlayerEquipmentChanged(FVM_TalentEditPage &inout Model, const FECSEntity &inout Entity, const FC_DSPlayerAvatarInfo &inout Component)
{
    Model.OnPlayerEquipmentChanged(Component);
    return;
}
void __OnTalentDataUpdated(FVM_TalentEditPage &inout Model, const FMsg_TalentTreeDataUpdate &inout Message)
{
    Model.OnTalentDataUpdated(Message);
    return;
}
void __OnTalentTreeUpdateFinish(FVM_TalentEditPage &inout Model, const FMsg_TalentTreeUpdateFinish &inout Message)
{
    Model.OnTalentTreeUpdateFinish(Message);
    return;
}
void __OnTalentUnlockOrUpgradeRequest(FVM_TalentEditPage &inout Model, const FMsg_TalentUnlockOrUpgradeOpenConfirm &inout Message)
{
    Model.OnTalentUnlockOrUpgradeRequest(Message);
    return;
}
void __OnTalentSetEquipSkillSlot(FVM_TalentEditPage &inout Model, const FMsg_TalentSetEquipSkillSlot &inout Message)
{
    Model.OnTalentSetEquipSkillSlot(Message);
    return;
}
void __OnTalentSetEquipChoiceTalent(FVM_TalentEditPage &inout Model, const FMsg_TalentSetEquipChoiceTalent &inout Message)
{
    Model.OnTalentSetEquipChoiceTalent(Message);
    return;
}
void __OnTalentSetEquipFoundation(FVM_TalentEditPage &inout Model, const FMsg_TalentSetEquipFoundation &inout Message)
{
    Model.OnTalentSetEquipFoundation(Message);
    return;
}
void __Tick(FVM_TalentEditPage &inout Model)
{
    Model.Tick();
    return;
}
void __OnTalentItemHoverStateChagne(FVM_TalentEditPage &inout Model, const FMsg_TalentItemHoverStateChagne &inout Message)
{
    Model.OnTalentItemHoverStateChagne(Message);
    return;
}
void __OnTalentNodeHoverOpenDetails(FVM_TalentEditPage &inout Model, const FMsg_TalentNodeHoverOpenDetails &inout Message)
{
    Model.OnTalentNodeHoverOpenDetails(Message);
    return;
}
void __OnTalentNodeHoverCloseDetails(FVM_TalentEditPage &inout Model, const FMsg_TalentNodeHoverCloseDetails &inout Message)
{
    Model.OnTalentNodeHoverCloseDetails(Message);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    __MonitorDSPlayerAvatarInfoLifetime(ECSWorld, EECSRegType(0), false, false, FECSMonitorDetail::All(NAME_None, FName("EJG_OutputBackend::TickUIModel")));
    __MonitorDSPlayerAvatarInfoModification(ECSWorld, EECSRegType(0), false, FECSMonitorDetail::All(NAME_None, FName("EJG_OutputBackend::TickUIModel")));
    return;
}
TArray<TEUIModelRef<FVM_TalentEditSkillBtn>> __UIGetter_OnEquipmentSkill(const FVM_TalentEditPage &inout Model)
{
    return Model.GetOnEquipmentSkill();
}
TArray<TEUIModelRef<FVM_TalentSkillInfoItem>> __UIGetter_OnSelectTypeAllSkill(const FVM_TalentEditPage &inout Model)
{
    return Model.GetOnSelectTypeAllSkill();
}
TEUIModelRef<FVM_TalentEditPageChangeSkill> __UIGetter_SelectSkillChangeVM(const FVM_TalentEditPage &inout Model)
{
    return Model.GetSelectSkillChangeVM();
}
TArray<TEUIModelRef<FVM_TalentUpgradeFormulaTree>> __UIGetter_CurrentTalentTreeList(const FVM_TalentEditPage &inout Model)
{
    return Model.GetCurrentTalentTreeList();
}
TArray<FEUIModelContainer> __UIGetter_CurrentTalentTreeListA(const FVM_TalentEditPage &inout Model)
{
    return Model.GetCurrentTalentTreeListA();
}
TEUIModelRef<FVM_TalentSkillInfoItem> __UIGetter_SelectedDetailSkillInfo(const FVM_TalentEditPage &inout Model)
{
    return Model.GetSelectedDetailSkillInfo();
}
TEUIModelRef<FVM_TalentUpgradeConfirm> __UIGetter_SelectedDetailUpgradeConfirm(const FVM_TalentEditPage &inout Model)
{
    return Model.GetSelectedDetailUpgradeConfirm();
}
bool __UIGetter_TalentSkillChangePageIsOpen(const FVM_TalentEditPage &inout Model)
{
    return Model.GetTalentSkillChangePageIsOpen();
}
bool __UIGetter_bPendingClose(const FVM_TalentEditPage &inout Model)
{
    return Model.GetbPendingClose();
}
FText __UIGetter_Title(const FVM_TalentEditPage &inout Model)
{
    return Model.GetTitle();
}
bool __UIGetter_TalentSkillChangePageIsClose(const FVM_TalentEditPage &inout Model)
{
    return Model.TalentSkillChangePageIsClose();
}
bool __UIGetter_TalentSkillHasSelect(const FVM_TalentEditPage &inout Model)
{
    return Model.TalentSkillHasSelect();
}
bool __UIGetter_TalentSkillHasNotSelect(const FVM_TalentEditPage &inout Model)
{
    return Model.TalentSkillHasNotSelect();
}
bool __UIGetter_CanShowCurrency(const FVM_TalentEditPage &inout Model)
{
    return Model.CanShowCurrency();
}
TEUIModelRef<FVM_TalentEditSkillBtn> __UIGetter_SelectedSkillItem(const FVM_TalentEditPage &inout Model)
{
    return Model.GetSelectedSkillItem();
}
bool __UIGetter_IsCurSelectIsChooiceNode(const FVM_TalentEditPage &inout Model)
{
    return Model.IsCurSelectIsChooiceNode();
}
bool __UIGetter_IsDetailSelected(const FVM_TalentEditPage &inout Model)
{
    return Model.GetIsDetailSelected();
}
bool __UIGetter_IsNotDetailSelected(const FVM_TalentEditPage &inout Model)
{
    return Model.GetIsNotDetailSelected();
}
bool __UIGetter_ShowTalentSkillChangeList(const FVM_TalentEditPage &inout Model)
{
    return Model.ShowTalentSkillChangeList();
}
TEUIModelRef<FVM_TalentEditPage> __UIGetter_Self(const FVM_TalentEditPage &inout Model)
{
    return TEUIModelRef<FVM_TalentEditPage>(Model);
}
int __IndexOf_CurrentSkillIndex()
{
    return 0;
}
int __IndexOf_CacheLastSkillIndex()
{
    return 1;
}
int __IndexOf_TalentModel()
{
    return 2;
}
int __IndexOf_Showcase()
{
    return 3;
}
int __IndexOf_EditingAvatar()
{
    return 4;
}
int __IndexOf_OnEquipmentSkill()
{
    return 5;
}
int __IndexOf_OnSelectTypeAllSkill()
{
    return 6;
}
int __IndexOf_CurSkillBtnConfig()
{
    return 7;
}
int __IndexOf_SelectSkillChangeVM()
{
    return 8;
}
int __IndexOf_CurrentTalentTreeList()
{
    return 9;
}
int __IndexOf_CurrentTalentTreeListA()
{
    return 10;
}
int __IndexOf_HoverTalentDetailsHandle()
{
    return 11;
}
int __IndexOf_HoverTalentInfo()
{
    return 12;
}
int __IndexOf_SelectedTalentPageHandle()
{
    return 13;
}
int __IndexOf_SelectedDetailTalentNode()
{
    return 14;
}
int __IndexOf_SelectedDetailSkillInfo()
{
    return 15;
}
int __IndexOf_SelectedDetailUpgradeConfirm()
{
    return 16;
}
int __IndexOf_TalentSkillChangePageIsOpen()
{
    return 17;
}
int __IndexOf_bPendingClose()
{
    return 18;
}
}
namespace __GeneratedProperties_FVM_TalentEditPage
{
UScriptStruct StaticStruct()
{
    return __GeneratedProperties_FVM_TalentEditPage.Get();
}
}
