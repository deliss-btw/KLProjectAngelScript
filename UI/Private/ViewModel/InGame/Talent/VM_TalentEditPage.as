
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
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_TalentEditPage(const FVM_TalentEditPage &inout Other)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
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
        bool local_3 = this.GetEditingAvatar().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelRef<FMS_EditingAvatar> local_2 = this.GetEditingAvatar();
            local_3 = GetAvatarConfig();
        }
        if (local_3)
        {
            TEUIModelRef<FMS_EditingAvatar> local_2_2 = this.GetEditingAvatar();
            NSLOCTEXT("Talent", "TalentTitleFormat", "е¤©иµ‹ <Beige24>/ {0}</>");
            return FText();
        }
        return FText::FromString("");
    }
    bool TalentSkillChangePageIsClose() const
    {
        return !(this.GetTalentSkillChangePageIsOpen());
    }
    bool TalentSkillHasSelect() const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        bool __r; return __r;
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
                TEUIModelRef<FMS_EditingAvatar> local_10 = this.GetEditingAvatar();
                local_8.Add(GetAvatarConfig());
            }
            TEUIModelRef<FVM_AvatarShowcase> local_2 = this.GetShowcase();
            local_8.SetNextAvatars();
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
        TEUIModelRef<FMS_EditingAvatar> local_4 = this.GetEditingAvatar();
        bool local_5 = !(!(GetAvatarConfig()));
        this.UpdateSkillList();
        this.UpdateTalentTreeList();
        TArray<TEUIModelRef<FVM_TalentSkillInfoItem>> local_10;
        this.SetSelectSkillChangeVM(TEUIModelRef<FVM_TalentEditPageChangeSkill>(::FVM_TalentEditPageChangeSkill::Create(this.GetContext().Manager, local_10)));
        if (this.GetTalentModel().IsValid())
        {
            TEUIModelRef<FMS_Talent> local_2 = this.GetTalentModel();
            RefreshAllNodeActionableRedDots();
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
            TEUIModelRef<FMS_Talent> local_4 = this.GetTalentModel();
            RefreshAllNodeActionableRedDots();
        }
        return;
    }
    void OnTalentTreeUpdateFinish(const FMsg_TalentTreeUpdateFinish &inout Msg)
    {
        int local_12;
        if (!(this.GetSelectedDetailTalentNode().IsValid()) || !(Msg.FormulaTreeVM.IsValid()))
        {
            return;
        }
        TEUIModelWeakRef<FM_TalentNode> local_2 = this.GetSelectedDetailTalentNode();
        int local_5 = GetDataId();
        if (this.GetSelectedDetailSkillInfo().IsValid())
        {
            TEUIModelRef<FVM_TalentSkillInfoItem> local_10 = this.GetSelectedDetailSkillInfo();
            local_12 = GetChoiceIndex();
        }
        else
        {
            local_12 = 0;
        }
        for (auto& local_30 : GetItemNodeMap())
        {
            if (!(local_30.GetKey().IsValid()) || !(IsValid()))
            {
                continue;
            }
            if (GetDataId() != local_5)
            {
                continue;
            }
            for (auto& local_44 : GetChoiceNodeList())
            {
                if (local_44.IsValid())
                {
                    bool local_3 = (GetChoiceIndex() == local_12);
                    local_3.SetbSelect();
                }
            }
        }
        return;
    }
    void UpdateSkillList()
    {
        int local_137 = 0;
        int local_179 = 0;
        this.GetModify_OnEquipmentSkill().Empty(0);
        bool local_5 = this.GetEditingAvatar().IsNull();
        if (local_5)
        {
            local_5 = true;
        }
        else
        {
            TEUIModelRef<FMS_EditingAvatar> local_4 = this.GetEditingAvatar();
            local_5 = !(GetAvatarConfig());
        }
        if (local_5)
        {
            return;
        }
        if (this.GetTalentModel().IsValid())
        {
            TEUIModelRef<FMS_Talent> local_8 = this.GetTalentModel();
            RefreshNewSkillDerivedRedDots();
        }
        TEUIModelRef<FMS_EditingAvatar> local_4_2 = this.GetEditingAvatar();
        TDataObjectPtr<FAvatarPrefabConfig> local_32 = GetAvatarConfig();
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
        TEUIModelRef<FMS_Talent> local_8_2 = this.GetTalentModel();
        FAvatarEquippedTalentInfo local_136;
        local_137.GetAvatarEquippedTalentInfo(local_136);
        local_137 = int(local_136.FoundationId);
        TEUIModelRef<FMS_Talent> local_8_3 = this.GetTalentModel();
        TEUIModelWeakRef<FM_TalentNode> local_142;
        local_142.GetNodeByTalentId(local_137);
        TEUIModelRef<FVM_TalentEditSkillBtn> local_148 = TEUIModelRef<FVM_TalentEditSkillBtn>(::FVM_TalentEditSkillBtn::Create(this.GetContext().Manager, local_32, local_142, ESkillSlot(ESkillSlot(0))));
        TEUIModelRef<FMS_Talent> local_8_4 = this.GetTalentModel();
        TArray<TEUIModelRef<FM_TalentNode>> local_154;
        local_154.GetActiveFoundationTalentNodeList(local_84);
        bool local_5_2 = (local_154.Num() > 1);
        local_5_2.SetbCanChange();
        this.GetModify_OnEquipmentSkill().Add(local_148);
        TArray<ESkillSlot> local_158 = ::FSkillUIUtils::GetAvatarAllSkillSlots(local_32);
        for (auto local_175 : local_158)
        {
            if (int(local_175) == 1 || (int(local_175) == 2))
            {
                if (int(local_175) == 1)
                {
                    local_179 = 3;
                }
                else
                {
                    local_179 = 4;
                }
                TEUIModelWeakRef<FM_TalentNode> local_182;
                TEUIModelRef<FMS_Talent> local_8_5 = this.GetTalentModel();
                local_154.GetActiveTalentNodeListByType(local_84);
                for (auto& local_200 : local_154)
                {
                    local_200;
                    if (int(GetTalentType()) == 6)
                    {
                        TDataObjectPtr<FTalentConfig> local_226;
                        local_226.GetConfig(0);
                        if (local_137 == (int(local_136.FoundationId)))
                        {
                            local_182 = local_142;
                            break;
                        }
                    }
                }
                TEUIModelRef<FVM_TalentEditSkillBtn> local_230 = TEUIModelRef<FVM_TalentEditSkillBtn>(::FVM_TalentEditSkillBtn::Create(this.GetContext().Manager, local_32, local_182));
                this.GetModify_OnEquipmentSkill().Add(local_230);
                continue;
            }
            int local_231 = int(local_175);
            TEUIModelWeakRef<FM_TalentNode> local_182;
            if (local_136.SlotToTalentId.Contains(local_231))
            {
                int local_232;
                local_232 = local_136.SlotToTalentId[local_231];
                TEUIModelRef<FMS_Talent> local_8_6 = this.GetTalentModel();
                local_142.GetNodeByTalentId(local_232);
                local_182 = local_142;
            }
            TEUIModelRef<FVM_TalentEditSkillBtn> local_230_2 = TEUIModelRef<FVM_TalentEditSkillBtn>(::FVM_TalentEditSkillBtn::Create(this.GetContext().Manager, local_32, local_182));
            if (local_182.IsValid())
            {
                if (int(GetEffectiveSkillType()) != 0)
                {
                    TArray<TEUIModelRef<FM_TalentNode>> local_186;
                    TEUIModelRef<FMS_Talent> local_8_7 = this.GetTalentModel();
                    local_186.GetActiveTalentNodeListByType(local_84);
                    if (local_186.Num() > 1)
                    {
                        bool local_5_3 = true;
                        local_5_3.SetbCanChange();
                    }
                    else
                    {
                        false.SetbCanChange();
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
            if ((int(GetSkillButtonSlot())) == (int(SkillSlot)))
            {
                return local_16;
            }
        }
        return TEUIModelRef<FVM_TalentEditSkillBtn>();
    }
    void OnSkillItemSelected(const FEUIModelContainer &inout SkillItem)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void OnSkillItemSelectedSlot(const ESkillSlot SkillSlot)
    {
        int local_1 = -1;
        for (auto& local_18 : this.GetOnEquipmentSkill())
        {
            if (int(GetSkillButtonSlot()) == int(SkillSlot))
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
        // body not fully recovered вЂ” stub [opcode-uncovered]
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
        int local_7 = int(local_6.opArrow().GetSkillType());
        this.UpdateSkillSellectType(local_6.opArrow().GetSkillButtonSlot());
        return;
    }
    void ClosePage()
    {
        bool local_7;
        int local_59 = 0;
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
        if (!(this.GetTalentModel().IsValid() && this.GetEditingAvatar().IsValid()))
        {
            local_7 = false;
        }
        else
        {
            TEUIModelRef<FMS_EditingAvatar> local_6 = this.GetEditingAvatar();
            local_7 = GetAvatarConfig();
        }
        if (local_7)
        {
            TEUIModelRef<FMS_EditingAvatar> local_6_2 = this.GetEditingAvatar();
            if (::UAvatarMappingSettings::Get().GetMappingConfigOfAvatar(GetAvatarConfig()))
            {
                TEUIModelRef<FMS_Talent> local_4 = this.GetTalentModel();
                local_59.ConsumeAllPerNodeRedDots();
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
        TEUIModelRef<FM_TalentNode> local_20;
        if (this.GetTalentSkillChangePageIsOpen())
        {
            this.SetTalentSkillChangePageIsOpen(false);
        }
        this.SetCacheLastSkillIndex(this.GetCurrentSkillIndex());
        this.SetCurrentSkillIndex(INDEX_NONE);
        bool local_1 = this.GetTalentModel().IsValid();
        if (local_1)
        {
            for (auto& local_18 : this.GetOnSelectTypeAllSkill())
            {
                if (!(local_18.IsValid()))
                {
                    local_1 = false;
                }
                else
                {
                    local_20.GetTalentNode();
                    local_1 = local_20.IsValid();
                }
                if (local_1)
                {
                    local_20.GetTalentNode();
                    TEUIModelRef<FMS_Talent> local_4 = this.GetTalentModel();
                    GetDataId().ConsumeNewSkillRedDot();
                }
            }
        }
        this.GetModify_OnSelectTypeAllSkill().Empty(0);
        return;
    }
    void UpdateSkillSellectType(const ESkillSlot SkillSlot, const ESkillType SkillType)
    {
        int local_163 = 0;
        TEUIModelRef<FMS_EditingAvatar> local_2 = this.GetEditingAvatar();
        TDataObjectPtr<FAvatarPrefabConfig> local_26 = GetAvatarConfig();
        UAvatarMappingSettings local_54 = ::UAvatarMappingSettings::Get();
        TDataObjectPtr<FAvatarMappingConfig> local_78;
        if (local_54 != nullptr)
        {
            local_78 = local_54.GetMappingConfigOfAvatar(local_26);
        }
        this.GetModify_OnSelectTypeAllSkill().Empty(0);
        if (int(SkillType) == 2)
        {
            TArray<TEUIModelRef<FM_TalentNode>> local_136;
            TEUIModelRef<FMS_Talent> local_132 = this.GetTalentModel();
            local_136.GetActiveFoundationTalentNodeList(local_78);
            for (auto& local_154 : local_136)
            {
                TEUIModelRef<FVM_TalentSkillInfoItem> local_156 = TEUIModelRef<FVM_TalentSkillInfoItem>(::FVM_TalentSkillInfoItem::Create(this.GetContext().Manager, local_78, local_154, ESkillSlot(0), ETalentInfoShowPageType(2)));
                SetEnterButtonSlot();
                this.GetModify_OnSelectTypeAllSkill().Add(local_156);
            }
        }
        else
        {
            TArray<TEUIModelRef<FM_TalentNode>> local_140;
            TEUIModelRef<FMS_Talent> local_132_2 = this.GetTalentModel();
            local_140.GetActiveTalentNodeListByType(local_78);
            for (auto& local_154 : local_140)
            {
                int local_162 = GetDataId();
                TEUIModelRef<FMS_Talent> local_132_3 = this.GetTalentModel();
                int local_158 = local_163.GetSlotByTalentNodeId(local_162);
                TEUIModelRef<FVM_TalentSkillInfoItem> local_156_2 = TEUIModelRef<FVM_TalentSkillInfoItem>(::FVM_TalentSkillInfoItem::Create(this.GetContext().Manager, local_78, local_154, ESkillSlot(2)));
                SetEnterButtonSlot();
                this.GetModify_OnSelectTypeAllSkill().Add(local_156_2);
            }
        }
        this.SetTalentSkillChangePageIsOpen(true);
        this.SetSelectSkillChangeVM(TEUIModelRef<FVM_TalentEditPageChangeSkill>(::FVM_TalentEditPageChangeSkill::Create(this.GetContext().Manager, this.GetOnSelectTypeAllSkill())));
        TEUIModelRef<FVM_TalentEditSkillBtn> local_168 = this.GetSkillItemBySlot(ESkillSlot(SkillSlot));
        if (local_168.IsValid())
        {
            TEUIModelRef<FVM_TalentEditPageChangeSkill> local_166 = this.GetSelectSkillChangeVM();
            local_168.Setup();
        }
        return;
    }
    void OnTalentUnlockOrUpgradeRequest(const FMsg_TalentUnlockOrUpgradeOpenConfirm &inout Msg)
    {
        if (!(Msg.TalentNode.IsValid()))
        {
            return;
        }
        TEUIModelRef<FM_TalentNode> local_6;
        TEUIModelRef<FVM_TalentUpgradeConfirm> local_8 = TEUIModelRef<FVM_TalentUpgradeConfirm>(::FVM_TalentUpgradeConfirm::Create(this.GetContext().Manager, local_6));
        Msg.ChoiceIndex.SetChoiceIndex();
        FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_Msg_TalentSKillUpgradeConfirm, local_8.opImplConv());
        return;
    }
    void OnTalentSetEquipSkillSlot(const FMsg_TalentSetEquipSkillSlot &inout Msg)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void OnTalentSetEquipChoiceTalent(const FMsg_TalentSetEquipChoiceTalent &inout Msg)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void OnTalentSetEquipFoundation(const FMsg_TalentSetEquipFoundation &inout Msg)
    {
        int local_123 = 0;
        if (!(Msg.FoundationNode.IsValid()))
        {
            return;
        }
        if ((int(GetStateType())) != 3)
        {
            FCommonTipsParam local_12;
            ::CommonPopup::WeakTips(NSLOCTEXT("Talent", "TalentNotUnlocked", "иЇ·е…€и§Јй”ЃеЅ“е‰Ќе¤©иµ‹"), local_12);
            return;
        }
        if (::FASCommonUtils::IsInCombat(this.GetContext().GetLocalPlayerPawn()))
        {
            FCommonTipsParam local_12;
            ::CommonPopup::WeakTips(NSLOCTEXT("Talent", "TalentNotInBattle", "ж€ж–—дё­ж— жі•е€‡жЌўе¤©иµ‹"), local_12);
            return;
        }
        TEUIModelRef<FMS_EditingAvatar> local_18 = this.GetEditingAvatar();
        TDataObjectPtr<FAvatarPrefabConfig> local_42 = GetAvatarConfig();
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
        local_122.SetAvatarId(local_123);
        local_122.SetFoundationId(GetDataId());
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
        FVM_TalentUpgradeFormulaTree& local_14;
        int local_20;
        FString local_4 = FString().Append("[VM_TalentEditPage] CurrentTalentTreeList Num=[").Append(this.GetCurrentTalentTreeList().Num()).Append("]");
        int local_10 = 0;
        for (; local_10 < this.GetCurrentTalentTreeList().Num(); )
        {
            if (local_14.GetTreeM().IsValid())
            {
                TEUIModelWeakRef<FM_TalentTree> local_18 = local_14.GetTreeM();
                local_20 = GetTreeId();
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
        TEUIModelRef<FMS_EditingAvatar> local_10 = this.GetEditingAvatar();
        TEUIModelRef<FMS_Talent> local_8 = this.GetTalentModel();
        TArray<TEUIModelWeakRef<FM_TalentTree>> local_14;
        local_14.GetTalentTreeListByAvatar(GetAvatarConfig());
        int local_17 = 0;
        for (; local_17 < local_14.Num(); ++local_17)
        {
            if (local_14[local_17].IsValid())
            {
                TEUIModelWeakRef<FM_TalentTree> local_24;
                TEUIModelRef<FVM_TalentUpgradeFormulaTree> local_28 = TEUIModelRef<FVM_TalentUpgradeFormulaTree>(::FVM_TalentUpgradeFormulaTree::Create(this.GetContext().Manager, (TEUIModelWeakRef<FVM_TalentEditPage>(this)), local_24, local_17, 50.0f));
                this.GetModify_CurrentTalentTreeList().Add(local_28);
            }
        }
        if (this.GetCurrentTalentTreeList().Num() > 0)
        {
            int local_1 = this.GetCurrentTalentTreeList().Num() - 1;
            1.SetbLastList();
        }
        return;
    }
    void OnTalentItemHoverStateChagne(const FMsg_TalentItemHoverStateChagne &inout Msg)
    {
        bool local_1;
        FM_TalentNode& local_8;
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
            TEUIModelRef<FM_TalentNode> local_6 = this.GetHoverTalentInfo().opArrow().GetTalentNode();
            return this.GetHoverTalentInfo().opArrow().GetChoiceIndex().IsUnequippedChoice();
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
                TEUIModelRef<FM_TalentNode> local_8 = this.GetHoverTalentInfo().opArrow().GetTalentNode();
                TEUIModelWeakRef<FM_TalentNode> local_18;
                local_10.TalentNode = local_18;
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
            TEUIModelRef<FMS_Talent> local_4 = this.GetTalentModel();
            GetDataId().ConsumePerNodeRedDot();
        }
        TEUIModelRef<FMS_EditingAvatar> local_8 = this.GetEditingAvatar();
        TDataObjectPtr<FAvatarPrefabConfig> local_32 = GetAvatarConfig();
        TDataObjectPtr<FAvatarMappingConfig> local_80;
        if (local_32)
        {
            UAvatarMappingSettings local_84 = ::UAvatarMappingSettings::Get();
            if (local_84 != nullptr)
            {
                local_80 = local_84.GetMappingConfigOfAvatar(local_32);
            }
        }
        TEUIModelRef<FVM_TalentSkillInfoItem> local_138 = TEUIModelRef<FVM_TalentSkillInfoItem>(::FVM_TalentSkillInfoItem::Create(this.GetContext().Manager, local_80, TEUIModelRef<FM_TalentNode>(), ESkillSlot(0), ETalentInfoShowPageType(1)));
        this.SetSelectedDetailSkillInfo(local_138);
        TEUIModelRef<FVM_TalentSkillInfoItem> local_138_2 = this.GetSelectedDetailSkillInfo();
        local_138_2.opArrow().SetChoiceIndex(Msg.ChoiceIndex);
        TEUIModelRef<FVM_TalentUpgradeConfirm> local_142 = TEUIModelRef<FVM_TalentUpgradeConfirm>(::FVM_TalentUpgradeConfirm::Create(this.GetContext().Manager, TEUIModelRef<FM_TalentNode>()));
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
            int local_4 = GetDataId();
            for (auto& local_20 : this.GetCurrentTalentTreeList())
            {
                if (!(local_20.IsValid()))
                {
                    continue;
                }
                for (auto& local_38 : GetItemNodeMap())
                {
                    if (!(local_38.GetKey().IsValid()) || !(IsValid()))
                    {
                        continue;
                    }
                    if (GetDataId() != local_4)
                    {
                        continue;
                    }
                    for (auto& local_54 : GetChoiceNodeList())
                    {
                        if (local_54.IsValid())
                        {
                            bool local_39 = false;
                            local_39.SetbSelect();
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
            TEUIModelRef<FM_TalentNode> local_6 = this.GetHoverTalentInfo().opArrow().GetTalentNode();
            TEUIModelWeakRef<FM_TalentNode> local_16;
            local_8.TalentNode = local_16;
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
        int local_2 = 0;
        bool local_4;
        int local_1 = 2147483647;
        int local_3 = 2147483647;
        if (!(A.IsValid()))
        {
            local_4 = false;
        }
        else
        {
            local_4 = GetLayoutConfig();
        }
        if (local_4)
        {
            local_1 = local_2;
        }
        if (!(B.IsValid()))
        {
            local_4 = false;
        }
        else
        {
            local_4 = GetLayoutConfig();
        }
        if (local_4)
        {
            local_3 = local_2;
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
        CommonPopup::Tips(NSLOCTEXT("Talent", "AvatarNotUnlockedViewTalent", "и§’и‰ІжњЄи§Јй”ЃпјЊдёЌиѓЅжџҐзњ‹е¤©иµ‹гЂ‚"), local_12);
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
FVM_TalentEditPage CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_TalentEditPage __r;
    TEUIModelRef<FVM_TalentEditPage> local_6 = TEUIModelRef<FVM_TalentEditPage>(EUIInternal::MakeModelWithManager(Manager, FVM_TalentEditPage::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
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
    // body not fully recovered вЂ” stub [argmismatch:argtype]
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
    UScriptStruct local_2;
    return local_2;
}
}
