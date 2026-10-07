
namespace FVM_MainMenuTeam
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature ApplyAvatarSelection = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OpenAvatarSelection = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnHoverAvatar = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnUnhoverAvatar = FEUIModelCallbackSignature();

}
struct FVM_MainMenuTeam : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_SelectedAvatarIndex;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarInfo> m_Avatar0;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarInfo> m_Avatar1;
    UPROPERTY()
    TEUIModelRef<FVMS_PlayerOwnedAvatarInfo> m_PlayerOwnedAvatarInfo;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarShowcase> m_Showcase;
    UPROPERTY()
    TEUIModelRef<FMS_CombatSettingData> m_CombatSettingData;
    UPROPERTY()
    bool m_bIsHoverAvatar;
    UPROPERTY()
    bool m_bPendingFieldSwitch;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarInfo> m_PendingAvatar0;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarInfo> m_PendingAvatar1;
    UPROPERTY()
    float PendingFieldSwitchTimeout;
    UPROPERTY()
    float m_PendingFieldSwitchDeadline;
    UPROPERTY()
    bool m_bShowReturn;

    FVM_MainMenuTeam()
    {
        this.m_SelectedAvatarIndex = 0;
        this.m_bIsHoverAvatar = false;
        this.m_bPendingFieldSwitch = false;
        this.PendingFieldSwitchTimeout = 10.0;
        this.m_PendingFieldSwitchDeadline = 0.0;
        this.m_bShowReturn = true;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_MainMenuTeam(const FVM_MainMenuTeam &inout Other)
    {
        this.m_SelectedAvatarIndex = 0;
        this.m_bIsHoverAvatar = false;
        this.m_bPendingFieldSwitch = false;
        this.PendingFieldSwitchTimeout = 10.0;
        this.m_PendingFieldSwitchDeadline = 0.0;
        this.m_bShowReturn = true;
        this.m_SelectedAvatarIndex = int(Other.m_SelectedAvatarIndex);
        this.m_Avatar0 = Other.m_Avatar0;
        this.m_Avatar1 = Other.m_Avatar1;
        this.m_PlayerOwnedAvatarInfo = Other.m_PlayerOwnedAvatarInfo;
        this.m_Showcase = Other.m_Showcase;
        this.m_CombatSettingData = Other.m_CombatSettingData;
        this.m_bIsHoverAvatar = Other.m_bIsHoverAvatar;
        this.m_bPendingFieldSwitch = Other.m_bPendingFieldSwitch;
        this.m_PendingAvatar0 = Other.m_PendingAvatar0;
        this.m_PendingAvatar1 = Other.m_PendingAvatar1;
        this.m_PendingFieldSwitchDeadline = Other.m_PendingFieldSwitchDeadline;
        this.m_bShowReturn = Other.m_bShowReturn;
        return;
    }
    FVM_MainMenuTeam opAssign(const FVM_MainMenuTeam &inout Other)
    {
        FVM_MainMenuTeam __r;
        this.m_SelectedAvatarIndex = int(Other.m_SelectedAvatarIndex);
        this.m_Avatar0 = Other.m_Avatar0;
        this.m_Avatar1 = Other.m_Avatar1;
        this.m_PlayerOwnedAvatarInfo = Other.m_PlayerOwnedAvatarInfo;
        this.m_Showcase = Other.m_Showcase;
        this.m_CombatSettingData = Other.m_CombatSettingData;
        this.m_bIsHoverAvatar = Other.m_bIsHoverAvatar;
        this.m_bPendingFieldSwitch = Other.m_bPendingFieldSwitch;
        this.m_PendingAvatar0 = Other.m_PendingAvatar0;
        this.m_PendingAvatar1 = Other.m_PendingAvatar1;
        this.m_PendingFieldSwitchDeadline = Other.m_PendingFieldSwitchDeadline;
        this.m_bShowReturn = Other.m_bShowReturn;
        return __r;
    }
    void OnWidgetPresenceChanged(const FMsg_WidgetPresence &inout Msg)
    {
        if ((FGameplayTag(Msg.WidgetTag) == GameplayTags::UI_Type_InventoryQuickSlotAssembly))
        {
            this.SetbShowReturn(!(Msg.bPresented));
        }
        return;
    }
    void SetCurrentShowcase(const TEUIModelRef<FVM_AvatarShowcase> &inout InShowcase)
    {
        this.SetShowcase(InShowcase);
        this.RefreshShowcaseAvatars();
        return;
    }
    FText GetAvatarName0() const
    {
        FText local_16;
        if (this.GetAvatar0())
        {
            FText local_8;
            TEUIModelRef<FVM_AvatarInfo> local_2 = this.GetAvatar0();
            local_8.GetDisplayName();
            local_16 = local_8;
        }
        else
        {
            local_16 = local_8;
        }
        return local_16;
    }
    FText GetAvatarName1() const
    {
        FText local_16;
        if (this.GetAvatar1())
        {
            FText local_8;
            TEUIModelRef<FVM_AvatarInfo> local_2 = this.GetAvatar1();
            local_8.GetDisplayName();
            local_16 = local_8;
        }
        else
        {
            local_16 = local_8;
        }
        return local_16;
    }
    float32 GetHoverAlphaAvatar0() const
    {
        if (this.GetSelectedAvatarIndex() == 1)
        {
            return 0.5f;
        }
        return 1.0f;
    }
    float32 GetHoverAlphaAvatar1() const
    {
        return this.GetSelectedAvatarIndex() == 1 ? 1.0f : 0.5f;
    }
    bool IsDivineSkillHoverVisible() const
    {
        return false;
    }
    void PostConstruct()
    {
        this.SetPlayerOwnedAvatarInfo(TEUIModelRef<FVMS_PlayerOwnedAvatarInfo>(::FVMS_PlayerOwnedAvatarInfo::Get(this.GetManager())));
        this.SetCombatSettingData(TEUIModelRef<FMS_CombatSettingData>(::FMS_CombatSettingData::Get(this.GetManager())));
        this.ResetPendingFieldSwitch();
        this.UpdateAvatarsInternal();
        return;
    }
    void UpdateAvatar()
    {
        if (this.GetbPendingFieldSwitch())
        {
            return;
        }
        this.UpdateAvatarsInternal();
        return;
    }
    void UpdatePresetAvatar(const FMsg_EditingCombatSettingPresetTypeChanged &inout Msg)
    {
        if (this.GetbPendingFieldSwitch())
        {
            return;
        }
        this.UpdateAvatarsInternal();
        return;
    }
    bool ApplyAvatarSelection(const FEUIModelRef &inout NewSelection)
    {
        bool local_5;
        bool local_31;
        bool local_33 = false;
        bool local_35 = false;
        int local_55 = 0;
        if (!(::FSwitchPlayerUtils::CheckSwitchPlayerCondition(this.GetContext().GetLocalPlayer(), this.GetContext().Time)))
        {
            FCommonTipsParam local_14;
            ::CommonPopup::Tips(NSLOCTEXT("ChangeRole", "ChangeRole_CheckConditionFailed", "еЅ“е‰ЌзЉ¶жЂЃж— жі•е€‡жЌўи§’и‰І"), local_14);
            return false;
        }
        if (this.GetbPendingFieldSwitch())
        {
            if (!(this.ExpirePendingFieldSwitchIfTimedOut()))
            {
                XLog(ELog(16), FString().Append("xxxxxx [ApplyAvatarSelection] PendingFieldSwitch is true, but not timed out, return false"));
                return false;
            }
        }
        TEUIModelRef<FVM_AvatarInfo> local_24 = TEUIModelRef<FVM_AvatarInfo>(NewSelection);
        TEUIModelRef<FVM_AvatarInfo> local_26;
        TEUIModelRef<FVM_AvatarInfo> local_28;
        if (this.GetSelectedAvatarIndex() == 0)
        {
            if ((this.GetAvatar1() == NewSelection))
            {
                local_26 = this.GetAvatar1();
                local_28 = this.GetAvatar0();
            }
            else
            {
                local_26 = local_24;
                local_28 = this.GetAvatar1();
            }
        }
        else
        {
            if ((this.GetAvatar0() == NewSelection))
            {
                local_26 = this.GetAvatar1();
                local_28 = this.GetAvatar0();
            }
            else
            {
                local_26 = this.GetAvatar0();
                local_28 = local_24;
            }
        }
        if (!(local_26))
        {
            local_5 = false;
        }
        else
        {
            local_5 = GetAvatarConfig();
        }
        bool local_32 = local_5 && local_33;
        if (!(local_28))
        {
            local_33 = false;
        }
        else
        {
            local_33 = GetAvatarConfig();
        }
        local_5 = local_33 && local_35;
        local_33 = local_32 && local_5;
        if (local_33)
        {
            FCommonTipsParam local_14;
            ::CommonPopup::Tips(NSLOCTEXT("MainMenuTeam", "TwoMainPlayerNotAllowed", "дёЌиѓЅеђЊж—¶дёЉйµдё¤еђЌдё»и§’"), local_14);
            return false;
        }
        local_35 = (int(this.GetCombatSettingData().opArrow().GetCurrentLevelPresetType()) == int(this.GetCombatSettingData().opArrow().GetEditingPresetType()));
        bool local_36 = (this.GetAvatar1() == NewSelection);
        bool local_34 = this.GetAvatar0().IsValid();
        if (!(local_34))
        {
            local_31 = false;
        }
        else
        {
            TEUIModelRef<FVM_AvatarInfo> local_22 = this.GetAvatar0();
            local_31 = GetAvatarConfig();
        }
        if (!(local_31))
        {
            local_34 = false;
        }
        else
        {
            TEUIModelRef<FVM_AvatarInfo> local_22_2 = this.GetAvatar0();
            local_34 = local_33;
        }
        local_31 = local_34 && local_32;
        local_33 = local_31 && !(local_36);
        local_31 = !((this.GetAvatar0() == NewSelection));
        bool local_44 = local_35 && (this.GetSelectedAvatarIndex() == 0);
        bool local_45 = local_44 && !(local_36);
        bool local_45_2 = (local_45 && !(local_33)) && local_31;
        if (local_45_2)
        {
            FCE_ClientToServerChangeRole local_54;
            FFPTime local_52 = FFPTime(-1);
            FECSEntity local_4 = this.GetContext().GetLocalPlayer();
            local_54.SlotIndex = 0;
            local_54.AvatarId = local_55;
            this.SetbPendingFieldSwitch(true);
            this.SetPendingFieldSwitchDeadline((this.GetContext().Time.ToSeconds() + this.PendingFieldSwitchTimeout));
            this.SetPendingAvatar0(local_24);
            this.SetPendingAvatar1(this.GetAvatar1());
            this.CloseSelectWidget();
            return true;
        }
        local_31 = false;
        int local_61 = 0;
        int local_62 = 0;
        if (this.GetSelectedAvatarIndex() == 0)
        {
            bool local_34_2 = (this.GetAvatar1() == NewSelection);
            if (local_34_2)
            {
                this.SetSlotAvatar(1, this.GetAvatar0());
            }
            else
            {
                TEUIModelRef<FVM_AvatarInfo> local_22_3 = this.GetAvatar0();
                if (local_34_2 && local_32)
                {
                    local_31 = true;
                    TEUIModelRef<FVM_AvatarInfo> local_22_4 = this.GetAvatar0();
                    local_61 = local_55;
                    local_62 = local_55;
                }
            }
            this.SetSlotAvatar(0, TEUIModelRef<FVM_AvatarInfo>(NewSelection));
        }
        else
        {
            local_44 = (this.GetAvatar0() == NewSelection);
            if (local_44)
            {
                this.SetSlotAvatar(0, this.GetAvatar1());
            }
            else
            {
                TEUIModelRef<FVM_AvatarInfo> local_64 = this.GetAvatar1();
                bool local_34_3 = local_64;
                if (!(local_34_3))
                {
                    local_45_2 = false;
                }
                else
                {
                    TEUIModelRef<FVM_AvatarInfo> local_22_5 = this.GetAvatar1();
                    local_45_2 = local_44;
                }
                if (local_45_2 && local_5)
                {
                    local_31 = true;
                    TEUIModelRef<FVM_AvatarInfo> local_64_2 = this.GetAvatar1();
                    local_61 = local_55;
                    local_62 = local_55;
                }
            }
            this.SetSlotAvatar(1, TEUIModelRef<FVM_AvatarInfo>(NewSelection));
        }
        this.SaveAvatarSetting(local_31, local_61, local_62);
        this.CloseSelectWidget();
        return true;
    }
    void OnFieldChangeRoleSucceeded(const FCE_ServerToClientChangeRole &inout Event)
    {
        if (!(this.GetbPendingFieldSwitch()) || (int(Event.SlotIndex) != 0))
        {
            return;
        }
        this.ApplyPendingFieldSwitch();
        return;
    }
    void OnFieldChangeRoleResult(const FCE_ServerToClientChangeRoleResult &inout Event)
    {
        if (!(this.GetbPendingFieldSwitch()) || (int(Event.SlotIndex) != 0))
        {
            return;
        }
        if (Event.bAccepted)
        {
            this.ApplyPendingFieldSwitch();
            return;
        }
        this.ResetPendingFieldSwitch();
        FCommonTipsParam local_12;
        ::CommonPopup::Tips(NSLOCTEXT("ChangeRole", "ChangeRole_CheckConditionFailed", "еЅ“е‰ЌзЉ¶жЂЃж— жі•е€‡жЌўи§’и‰І"), local_12);
        return;
    }
    void ApplyPendingFieldSwitch()
    {
        if (!(this.GetbPendingFieldSwitch()))
        {
            return;
        }
        this.SetAvatar0(this.GetPendingAvatar0());
        this.SetAvatar1(this.GetPendingAvatar1());
        this.SaveAvatarSetting(false, 0, 0);
        this.ResetPendingFieldSwitch();
        return;
    }
    void ResetPendingFieldSwitch()
    {
        this.SetbPendingFieldSwitch(false);
        this.SetPendingFieldSwitchDeadline(0.0);
        return;
    }
    bool ExpirePendingFieldSwitchIfTimedOut()
    {
        if (!(this.GetbPendingFieldSwitch()))
        {
            return false;
        }
        if (this.GetContext().Time.ToSeconds() < this.GetPendingFieldSwitchDeadline())
        {
            return false;
        }
        this.ResetPendingFieldSwitch();
        this.UpdateAvatarsInternal();
        return true;
    }
    void OpenAvatarSelection(const int Index)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void OnHoverAvatar(const int Index)
    {
        if (Index == 1 && !(this.GetAvatar1()))
        {
            return;
        }
        if (!(this.GetbIsHoverAvatar()))
        {
            this.SetbIsHoverAvatar(true);
            TEUIModelRef<FVM_AvatarShowcase> local_8 = this.GetShowcase();
            Index.PlayerHoverAvatarSeq(true);
        }
        return;
    }
    void OnUnhoverAvatar(const int Index)
    {
        if (this.GetbIsHoverAvatar())
        {
            this.SetbIsHoverAvatar(false);
            TEUIModelRef<FVM_AvatarShowcase> local_4 = this.GetShowcase();
            Index.PlayerHoverAvatarSeq(0);
        }
        return;
    }
    void RefreshShowcaseAvatars()
    {
        if (this.GetShowcase())
        {
            TArray<FAvatarShowcaseEntry> local_8;
            if (this.GetAvatar0())
            {
                local_8.Add(::FAvatarShowcaseEntryUtils::FromAvatarInfo(this.GetAvatar0()));
            }
            if (this.GetAvatar1())
            {
                local_8.Add(::FAvatarShowcaseEntryUtils::FromAvatarInfo(this.GetAvatar1()));
            }
            TEUIModelRef<FVM_AvatarShowcase> local_2 = this.GetShowcase();
            local_8.SetNextAvatarEntries();
        }
        return;
    }
    void UpdateAvatarsInternal()
    {
        UEUIManagerSubsystem local_16;
        TEUIModelRef<FVM_AvatarInfo> local_2;
        int local_18 = 0;
        TEUIModelRef<FVM_AvatarInfo> local_4;
        TEUIModelRef<FM_CombatSettingPreset> local_8 = this.GetCombatSettingData().opArrow().GetEditingCombatSettingPreset();
        if (local_8)
        {
            if (local_8.opArrow().GetMainAvatarCombatSetting().IsValid())
            {
                TEUIModelRef<FM_AvatarCombatSetting> local_14 = local_8.opArrow().GetMainAvatarCombatSetting();
                local_16 = this.GetManager();
                local_2 = TEUIModelRef<FVM_AvatarInfo>(::FVM_AvatarInfo::Create(this.GetManager(), (TEUIModelRef<FM_Avatar>(local_18))));
            }
            if (local_8.opArrow().GetAssistAvatarCombatSetting().IsValid())
            {
                TEUIModelRef<FM_AvatarCombatSetting> local_14_2 = local_8.opArrow().GetAssistAvatarCombatSetting();
                local_16 = this.GetManager();
                local_4 = TEUIModelRef<FVM_AvatarInfo>(::FVM_AvatarInfo::Create(this.GetManager(), (TEUIModelRef<FM_Avatar>(local_18))));
            }
        }
        else
        {
            FVMS_PlayerOwnedAvatarInfo& local_26;
            TEUIModelRef<FVMS_PlayerOwnedAvatarInfo> local_24 = this.GetPlayerOwnedAvatarInfo();
            if (local_26)
            {
                if (local_26.GetCurrentTeamAvatars().Num() > 0)
                {
                    local_2 = local_26.GetCurrentTeamAvatars()[0];
                }
                if (local_26.GetCurrentTeamAvatars().Num() > 1)
                {
                    local_4 = local_26.GetCurrentTeamAvatars()[1];
                }
            }
        }
        this.SetAvatar0(local_2);
        this.SetAvatar1(local_4);
        return;
    }
    void SetSlotAvatar(const int Index, const TEUIModelRef<FVM_AvatarInfo> &inout NewSelection)
    {
        int local_11 = 0;
        int local_30 = 0;
        if (Index == 0)
        {
            TEUIModelRef<FM_CombatSettingPreset> local_6 = this.GetCombatSettingData().opArrow().GetEditingCombatSettingPreset();
            if (local_6)
            {
                if (local_6.opArrow().GetAssistAvatarCombatSetting().IsValid())
                {
                    local_11 = local_6.opArrow().GetAssistAvatarCombatSetting().opArrow().GetAvatarConfig().opArrow().DataId;
                    if (local_11 == GetAvatarConfig().opArrow().DataId)
                    {
                        TEUIModelRef<FVM_AvatarInfo> local_14 = this.GetAvatar0();
                        local_6.opArrow().SetupFromAvatarID(GetAvatarConfig().opArrow().DataId, local_11);
                    }
                }
            }
            this.SetAvatar0(NewSelection);
        }
        else
        {
            this.SetAvatar1(NewSelection);
        }
        if (int(this.GetCombatSettingData().opArrow().GetCurrentLevelPresetType()) == (int(this.GetCombatSettingData().opArrow().GetEditingPresetType())))
        {
            bool local_2 = (Index == 0);
            if (Index > 0)
            {
                FECSEntity local_24 = this.GetContext().GetLocalPlayer();
                local_2 = local_30.GetAllPlayerPawnEntities().IsValidIndex(Index);
            }
            if (local_2)
            {
                FCE_ClientToServerChangeRole local_38;
                FFPTime local_36 = FFPTime(-1);
                FECSEntity local_24_2 = this.GetContext().GetLocalPlayer();
                local_38.SlotIndex = Index;
                local_38.AvatarId = local_11;
            }
        }
        return;
    }
    void SaveAvatarSetting(const bool bIsChangeMainAvatarSpecialty, const uint SpecialtyFrom, const uint SpecialtyTo)
    {
        TEUIModelRef<FVM_AvatarInfo> local_26 = this.GetAvatar0();
        TDataObjectPtr<FAvatarPrefabConfig> local_24 = GetAvatarConfig();
        TDataObjectPtr<FAvatarPrefabConfig> local_74 = TDataObjectPtr<FAvatarPrefabConfig>(nullptr);
        bool local_99 = this.GetAvatar1().IsValid();
        if (!(local_99))
        {
            local_99 = false;
        }
        else
        {
            TEUIModelRef<FVM_AvatarInfo> local_26_2 = this.GetAvatar1();
            local_99 = GetAvatarConfig();
        }
        if (local_99)
        {
            TEUIModelRef<FVM_AvatarInfo> local_26_3 = this.GetAvatar1();
            local_74 = GetAvatarConfig();
        }
        else
        {
            TEUIModelRef<FM_CombatSettingPreset> local_104 = this.GetCombatSettingData().opArrow().GetEditingCombatSettingPreset();
            if (local_104)
            {
                if (local_104.opArrow().GetAssistAvatarCombatSetting().IsValid())
                {
                    local_74 = local_104.opArrow().GetAssistAvatarCombatSetting().opArrow().GetAvatarConfig();
                }
            }
        }
        this.GetCombatSettingData().opArrow().SaveEditingAvatarSetting(local_24, local_74);
        if (!(bIsChangeMainAvatarSpecialty))
        {
            this.GetCombatSettingData().opArrow().GS_RequestSaveCurrentEditingCombatSettingPreset();
            return;
        }
        this.GetCombatSettingData().opArrow().GS_RequestSaveChangeMainAvatarSpecialty(SpecialtyFrom, SpecialtyTo);
        return;
    }
    void CloseSelectWidget()
    {
        FEUIWidgetRef local_2 = FEUIWidget::FindWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_Avatar_Selection);
        if (local_2)
        {
            FEUIWidget::RemoveWidget(local_2);
        }
        return;
    }
    int GetSelectedAvatarIndex() const property
    {
        this.TrackPropertyRead(0);
        return this.m_SelectedAvatarIndex;
    }
    void SetSelectedAvatarIndex(const int __Value) property
    {
        if (this.m_SelectedAvatarIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_SelectedAvatarIndex = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarInfo> GetAvatar0() const property
    {
        this.TrackPropertyRead(1);
        return this.m_Avatar0;
    }
    void SetAvatar0(const TEUIModelRef<FVM_AvatarInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarInfo> local_2;
        local_2 = this.m_Avatar0;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Avatar0 = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarInfo> GetAvatar1() const property
    {
        this.TrackPropertyRead(2);
        return this.m_Avatar1;
    }
    void SetAvatar1(const TEUIModelRef<FVM_AvatarInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarInfo> local_2;
        local_2 = this.m_Avatar1;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_Avatar1 = __Value;
        return;
    }
    TEUIModelRef<FVMS_PlayerOwnedAvatarInfo> GetPlayerOwnedAvatarInfo() const property
    {
        this.TrackPropertyRead(3);
        return this.m_PlayerOwnedAvatarInfo;
    }
    void SetPlayerOwnedAvatarInfo(const TEUIModelRef<FVMS_PlayerOwnedAvatarInfo> &inout __Value) property
    {
        TEUIModelRef<FVMS_PlayerOwnedAvatarInfo> local_2;
        local_2 = this.m_PlayerOwnedAvatarInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_PlayerOwnedAvatarInfo = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarShowcase> GetShowcase() const property
    {
        this.TrackPropertyRead(4);
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
        this.MarkPropertyDirty(4);
        this.m_Showcase = __Value;
        return;
    }
    TEUIModelRef<FMS_CombatSettingData> GetCombatSettingData() const property
    {
        this.TrackPropertyRead(5);
        return this.m_CombatSettingData;
    }
    void SetCombatSettingData(const TEUIModelRef<FMS_CombatSettingData> &inout __Value) property
    {
        TEUIModelRef<FMS_CombatSettingData> local_2;
        local_2 = this.m_CombatSettingData;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_CombatSettingData = __Value;
        return;
    }
    bool GetbIsHoverAvatar() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bIsHoverAvatar;
    }
    void SetbIsHoverAvatar(const bool __Value) property
    {
        if (!(this.m_bIsHoverAvatar) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bIsHoverAvatar = __Value;
        return;
    }
    bool GetbPendingFieldSwitch() const property
    {
        this.TrackPropertyRead(7);
        return this.m_bPendingFieldSwitch;
    }
    void SetbPendingFieldSwitch(const bool __Value) property
    {
        if (!(this.m_bPendingFieldSwitch) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_bPendingFieldSwitch = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarInfo> GetPendingAvatar0() const property
    {
        this.TrackPropertyRead(8);
        return this.m_PendingAvatar0;
    }
    void SetPendingAvatar0(const TEUIModelRef<FVM_AvatarInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarInfo> local_2;
        local_2 = this.m_PendingAvatar0;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_PendingAvatar0 = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarInfo> GetPendingAvatar1() const property
    {
        this.TrackPropertyRead(9);
        return this.m_PendingAvatar1;
    }
    void SetPendingAvatar1(const TEUIModelRef<FVM_AvatarInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarInfo> local_2;
        local_2 = this.m_PendingAvatar1;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_PendingAvatar1 = __Value;
        return;
    }
    const float GetPendingFieldSwitchDeadline() const property
    {
        const float __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    float GetModify_PendingFieldSwitchDeadline() property
    {
        float __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetPendingFieldSwitchDeadline(const float &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_PendingFieldSwitchDeadline = __Value;
        return;
    }
    bool GetbShowReturn() const property
    {
        this.TrackPropertyRead(11);
        return this.m_bShowReturn;
    }
    void SetbShowReturn(const bool __Value) property
    {
        if (!(this.m_bShowReturn) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_bShowReturn = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_MainMenuTeam
{
    UPROPERTY()
    FText AvatarName0;
    UPROPERTY()
    FText AvatarName1;
    UPROPERTY()
    float32 HoverAlphaAvatar0;
    UPROPERTY()
    float32 HoverAlphaAvatar1;
    UPROPERTY()
    bool IsDivineSkillHoverVisible;
    UPROPERTY()
    TEUIModelRef<FVM_MainMenuTeam> Self;


}

namespace FVM_MainMenuTeam
{
FVM_MainMenuTeam& Create(const UObject ContextObject)
{
    return FVM_MainMenuTeam::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_MainMenuTeam CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_MainMenuTeam __r;
    TEUIModelRef<FVM_MainMenuTeam> local_6 = TEUIModelRef<FVM_MainMenuTeam>(EUIInternal::MakeModelWithManager(Manager, FVM_MainMenuTeam::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_MainMenuTeam;
}
void __OnWidgetPresenceChanged(FVM_MainMenuTeam &inout Model, const FMsg_WidgetPresence &inout Message)
{
    Model.OnWidgetPresenceChanged(Message);
    return;
}
void __UpdateAvatar(FVM_MainMenuTeam &inout Model)
{
    Model.UpdateAvatar();
    return;
}
void __UpdatePresetAvatar(FVM_MainMenuTeam &inout Model, const FMsg_EditingCombatSettingPresetTypeChanged &inout Message)
{
    Model.UpdatePresetAvatar(Message);
    return;
}
void __OnFieldChangeRoleSucceeded(FVM_MainMenuTeam &inout Model, const FCE_ServerToClientChangeRole &inout Event)
{
    Model.OnFieldChangeRoleSucceeded(Event);
    return;
}
void __OnFieldChangeRoleResult(FVM_MainMenuTeam &inout Model, const FCE_ServerToClientChangeRoleResult &inout Event)
{
    Model.OnFieldChangeRoleResult(Event);
    return;
}
void __RefreshShowcaseAvatars(FVM_MainMenuTeam &inout Model)
{
    Model.RefreshShowcaseAvatars();
    return;
}
TEUIModelRef<FVM_AvatarInfo> __UIGetter_Avatar0(const FVM_MainMenuTeam &inout Model)
{
    return Model.GetAvatar0();
}
TEUIModelRef<FVM_AvatarInfo> __UIGetter_Avatar1(const FVM_MainMenuTeam &inout Model)
{
    return Model.GetAvatar1();
}
bool __UIGetter_bShowReturn(const FVM_MainMenuTeam &inout Model)
{
    return Model.GetbShowReturn();
}
FText __UIGetter_AvatarName0(const FVM_MainMenuTeam &inout Model)
{
    return Model.GetAvatarName0();
}
FText __UIGetter_AvatarName1(const FVM_MainMenuTeam &inout Model)
{
    return Model.GetAvatarName1();
}
float32 __UIGetter_HoverAlphaAvatar0(const FVM_MainMenuTeam &inout Model)
{
    return Model.GetHoverAlphaAvatar0();
}
float32 __UIGetter_HoverAlphaAvatar1(const FVM_MainMenuTeam &inout Model)
{
    return Model.GetHoverAlphaAvatar1();
}
bool __UIGetter_IsDivineSkillHoverVisible(const FVM_MainMenuTeam &inout Model)
{
    return Model.IsDivineSkillHoverVisible();
}
TEUIModelRef<FVM_MainMenuTeam> __UIGetter_Self(const FVM_MainMenuTeam &inout Model)
{
    return TEUIModelRef<FVM_MainMenuTeam>(Model);
}
int __IndexOf_SelectedAvatarIndex()
{
    return 0;
}
int __IndexOf_Avatar0()
{
    return 1;
}
int __IndexOf_Avatar1()
{
    return 2;
}
int __IndexOf_PlayerOwnedAvatarInfo()
{
    return 3;
}
int __IndexOf_Showcase()
{
    return 4;
}
int __IndexOf_CombatSettingData()
{
    return 5;
}
int __IndexOf_bIsHoverAvatar()
{
    return 6;
}
int __IndexOf_bPendingFieldSwitch()
{
    return 7;
}
int __IndexOf_PendingAvatar0()
{
    return 8;
}
int __IndexOf_PendingAvatar1()
{
    return 9;
}
int __IndexOf_PendingFieldSwitchDeadline()
{
    return 10;
}
int __IndexOf_bShowReturn()
{
    return 11;
}
}
namespace __GeneratedProperties_FVM_MainMenuTeam
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
