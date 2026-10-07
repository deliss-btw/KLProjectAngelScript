
enum ESkillBtnsCharacterType
{
    Avatar,
    FakeCharacter,
    Custom,
}

namespace FVMS_SkillBtns
{
    const int ModelId = 0;

}
struct FVMS_SkillBtns : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    TEUIModelRef<FVM_NormalSkillBtn> m_UltraSkillBtnVM;
    UPROPERTY()
    TEUIModelRef<FVM_NormalSkillBtn> m_SpecialESkillBtnVM;
    UPROPERTY()
    TEUIModelRef<FVM_NormalSkillBtn> m_QSkillBtnVM;
    UPROPERTY()
    TEUIModelRef<FVM_NormalSkillBtn> m_ESkillBtnVM;
    UPROPERTY()
    TEUIModelRef<FVM_NormalSkillBtn> m_RSkillBtnVM;
    UPROPERTY()
    TEUIModelRef<FVM_NormalSkillBtn> m_TSkillBtnVM;
    UPROPERTY()
    TEUIModelRef<FVM_NormalSkillBtn> m_AttackBtnVM;
    UPROPERTY()
    TEUIModelRef<FVM_NormalSkillBtn> m_AimBtnVM;
    UPROPERTY()
    TEUIModelRef<FVM_NormalSkillBtn> m_JumpBtnVM;
    UPROPERTY()
    TEUIModelRef<FVM_NormalSkillBtn> m_DodgeBtnVM;
    UPROPERTY()
    TEUIModelRef<FVM_NormalSkillBtn> m_LockTargetBtnVM;
    UPROPERTY()
    TEUIModelRef<FVM_NormalSkillBtn> m_SwitchAvatarBtnVM;
    UPROPERTY()
    FEUIModelRef m_ExclusiveSkill;
    UPROPERTY()
    TEUIModelRef<FVM_FakeCharacterProgress> m_FakeCharacterProgressVM;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> m_ExclusiveSkillWidget;
    UPROPERTY()
    FECSEntity m_CurPawnEntity;
    UPROPERTY()
    ESkillBtnsCharacterType m_SkillBtnsCharacterType;
    UPROPERTY()
    ESlateVisibility m_CachedVisibility;
    UPROPERTY()
    ESlateVisibility m_UltraVisibility;
    UPROPERTY()
    ESlateVisibility m_SpecialEVisibility;
    UPROPERTY()
    ESlateVisibility m_QVisibility;
    UPROPERTY()
    ESlateVisibility m_EVisibility;
    UPROPERTY()
    ESlateVisibility m_RVisibility;
    UPROPERTY()
    ESlateVisibility m_TVisibility;
    UPROPERTY()
    ESlateVisibility m_RBVisibility;
    UPROPERTY()
    bool m_bGamepadRightShoulderInputPress;
    UPROPERTY()
    bool m_bGamepadRightShoulderPress;
    UPROPERTY()
    bool m_bIsPVXControlFakeCharacter;
    UPROPERTY()
    TDataObjectPtr<FSkillBtnConfig> m_CurSkillBtnConfig;
    UPROPERTY()
    FEUITimerHandle m_RebuildHUDTimer;

    FVMS_SkillBtns()
    {
        this.m_SkillBtnsCharacterType = ESkillBtnsCharacterType(0);
        this.m_CachedVisibility = ESlateVisibility(1);
        this.m_UltraVisibility = ESlateVisibility(0);
        this.m_SpecialEVisibility = ESlateVisibility(0);
        this.m_QVisibility = ESlateVisibility(0);
        this.m_EVisibility = ESlateVisibility(0);
        this.m_RVisibility = ESlateVisibility(0);
        this.m_TVisibility = ESlateVisibility(0);
        this.m_RBVisibility = ESlateVisibility(0);
        this.m_bGamepadRightShoulderInputPress = false;
        this.m_bGamepadRightShoulderPress = false;
        this.m_bIsPVXControlFakeCharacter = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_SkillBtns(const FVMS_SkillBtns &inout Other)
    {
        this.m_SkillBtnsCharacterType = ESkillBtnsCharacterType(0);
        this.m_CachedVisibility = ESlateVisibility(1);
        this.m_UltraVisibility = ESlateVisibility(0);
        this.m_SpecialEVisibility = ESlateVisibility(0);
        this.m_QVisibility = ESlateVisibility(0);
        this.m_EVisibility = ESlateVisibility(0);
        this.m_RVisibility = ESlateVisibility(0);
        this.m_TVisibility = ESlateVisibility(0);
        this.m_RBVisibility = ESlateVisibility(0);
        this.m_bGamepadRightShoulderInputPress = false;
        this.m_bGamepadRightShoulderPress = false;
        this.m_bIsPVXControlFakeCharacter = false;
        this.m_UltraSkillBtnVM = Other.m_UltraSkillBtnVM;
        this.m_SpecialESkillBtnVM = Other.m_SpecialESkillBtnVM;
        this.m_QSkillBtnVM = Other.m_QSkillBtnVM;
        this.m_ESkillBtnVM = Other.m_ESkillBtnVM;
        this.m_RSkillBtnVM = Other.m_RSkillBtnVM;
        this.m_TSkillBtnVM = Other.m_TSkillBtnVM;
        this.m_AttackBtnVM = Other.m_AttackBtnVM;
        this.m_AimBtnVM = Other.m_AimBtnVM;
        this.m_JumpBtnVM = Other.m_JumpBtnVM;
        this.m_DodgeBtnVM = Other.m_DodgeBtnVM;
        this.m_LockTargetBtnVM = Other.m_LockTargetBtnVM;
        this.m_SwitchAvatarBtnVM = Other.m_SwitchAvatarBtnVM;
        this.m_ExclusiveSkill = Other.m_ExclusiveSkill;
        this.m_FakeCharacterProgressVM = Other.m_FakeCharacterProgressVM;
        this.m_ExclusiveSkillWidget = Other.m_ExclusiveSkillWidget;
        this.m_CurPawnEntity = Other.m_CurPawnEntity;
        this.m_SkillBtnsCharacterType = Other.m_SkillBtnsCharacterType;
        this.m_CachedVisibility = Other.m_CachedVisibility;
        this.m_UltraVisibility = Other.m_UltraVisibility;
        this.m_SpecialEVisibility = Other.m_SpecialEVisibility;
        this.m_QVisibility = Other.m_QVisibility;
        this.m_EVisibility = Other.m_EVisibility;
        this.m_RVisibility = Other.m_RVisibility;
        this.m_TVisibility = Other.m_TVisibility;
        this.m_RBVisibility = Other.m_RBVisibility;
        this.m_bGamepadRightShoulderInputPress = Other.m_bGamepadRightShoulderInputPress;
        this.m_bGamepadRightShoulderPress = Other.m_bGamepadRightShoulderPress;
        this.m_bIsPVXControlFakeCharacter = Other.m_bIsPVXControlFakeCharacter;
        this.m_CurSkillBtnConfig = Other.m_CurSkillBtnConfig;
        this.m_RebuildHUDTimer = Other.m_RebuildHUDTimer;
        return;
    }
    FVMS_SkillBtns& opAssign(const FVMS_SkillBtns &inout Other)
    {
        this.m_UltraSkillBtnVM = Other.m_UltraSkillBtnVM;
        this.m_SpecialESkillBtnVM = Other.m_SpecialESkillBtnVM;
        this.m_QSkillBtnVM = Other.m_QSkillBtnVM;
        this.m_ESkillBtnVM = Other.m_ESkillBtnVM;
        this.m_RSkillBtnVM = Other.m_RSkillBtnVM;
        this.m_TSkillBtnVM = Other.m_TSkillBtnVM;
        this.m_AttackBtnVM = Other.m_AttackBtnVM;
        this.m_AimBtnVM = Other.m_AimBtnVM;
        this.m_JumpBtnVM = Other.m_JumpBtnVM;
        this.m_DodgeBtnVM = Other.m_DodgeBtnVM;
        this.m_LockTargetBtnVM = Other.m_LockTargetBtnVM;
        this.m_SwitchAvatarBtnVM = Other.m_SwitchAvatarBtnVM;
        this.m_ExclusiveSkill = Other.m_ExclusiveSkill;
        this.m_FakeCharacterProgressVM = Other.m_FakeCharacterProgressVM;
        this.m_ExclusiveSkillWidget = Other.m_ExclusiveSkillWidget;
        this.m_CurPawnEntity = Other.m_CurPawnEntity;
        this.m_SkillBtnsCharacterType = Other.m_SkillBtnsCharacterType;
        this.m_CachedVisibility = Other.m_CachedVisibility;
        this.m_UltraVisibility = Other.m_UltraVisibility;
        this.m_SpecialEVisibility = Other.m_SpecialEVisibility;
        this.m_QVisibility = Other.m_QVisibility;
        this.m_EVisibility = Other.m_EVisibility;
        this.m_RVisibility = Other.m_RVisibility;
        this.m_TVisibility = Other.m_TVisibility;
        this.m_RBVisibility = Other.m_RBVisibility;
        this.m_bGamepadRightShoulderInputPress = Other.m_bGamepadRightShoulderInputPress;
        this.m_bGamepadRightShoulderPress = Other.m_bGamepadRightShoulderPress;
        this.m_bIsPVXControlFakeCharacter = Other.m_bIsPVXControlFakeCharacter;
        this.m_CurSkillBtnConfig = Other.m_CurSkillBtnConfig;
        return Other.m_RebuildHUDTimer;
    }
    ESlateVisibility IsUltraVisibility() const
    {
        return this.GetUltraVisibility();
    }
    ESlateVisibility IsSpecialEVisibility() const
    {
        if (this.GetbGamepadRightShoulderPress())
        {
            return ESlateVisibility(1);
        }
        return this.GetSpecialEVisibility();
    }
    ESlateVisibility IsQVisibility() const
    {
        return this.GetQVisibility();
    }
    ESlateVisibility IsEVisibility() const
    {
        if (this.GetbGamepadRightShoulderPress())
        {
            return ESlateVisibility(1);
        }
        return this.GetEVisibility();
    }
    ESlateVisibility IsRVisibility() const
    {
        return this.GetRVisibility();
    }
    ESlateVisibility IsTVisibility() const
    {
        return this.GetTVisibility();
    }
    ESlateVisibility SpecialEAndNormalEVisibility() const
    {
        if ((int(this.GetSpecialEVisibility())) == 1 && (int(this.GetEVisibility()) == 1))
        {
            return ESlateVisibility(1);
        }
        return ESlateVisibility(0);
    }
    ESlateVisibility IsRBVisibility() const
    {
        return this.GetRBVisibility();
    }
    int GetSpecialEAndNormalESwitch() const
    {
        if (int(this.GetSpecialEVisibility()) == 0)
        {
            return 0;
        }
        if (int(this.GetEVisibility()) == 0)
        {
            return 1;
        }
        return 0;
    }
    int GetRightShoulderPressSwitch() const
    {
        return this.GetbGamepadRightShoulderPress() ? 1 : 0;
    }
    float32 GetSkillbtnsSizeOverride() const
    {
        return !(this.GetbGamepadRightShoulderPress()) ? 78.0f : 100.0f;
    }
    bool ShouldShowGamepadRight() const
    {
        if (this.GetCurSkillBtnConfig())
        {
            return this.GetCurSkillBtnConfig().opArrow().bEnableGamepadRightShoulderAnim;
        }
        return true;
    }
    TArray<FEUIDynamicWidgetData> GetSimpleSkillEntryDataList() const
    {
        TArray<FEUIDynamicWidgetData> local_4;
        TEUIModelRef<FVM_NormalSkillBtn> local_6 = this.GetSpecialESkillBtnVM();
        if (GetCachedVisibility())
        {
            FEUIDynamicWidgetData local_32;
            local_32.ModelContainer = FEUIModelContainer(this.GetSpecialESkillBtnVM().opImplConv());
            local_4.Add(local_32);
        }
        TEUIModelRef<FVM_NormalSkillBtn> local_6_2 = this.GetUltraSkillBtnVM();
        if (GetCachedVisibility())
        {
            FEUIDynamicWidgetData local_32;
            local_32.ModelContainer = FEUIModelContainer(this.GetUltraSkillBtnVM().opImplConv());
            local_4.Add(local_32);
        }
        TEUIModelRef<FVM_NormalSkillBtn> local_6_3 = this.GetQSkillBtnVM();
        if (GetCachedVisibility())
        {
            FEUIDynamicWidgetData local_32;
            local_32.ModelContainer = FEUIModelContainer(this.GetQSkillBtnVM().opImplConv());
            local_4.Add(local_32);
        }
        TEUIModelRef<FVM_NormalSkillBtn> local_6_4 = this.GetESkillBtnVM();
        if (GetCachedVisibility())
        {
            FEUIDynamicWidgetData local_32;
            local_32.ModelContainer = FEUIModelContainer(this.GetESkillBtnVM().opImplConv());
            local_4.Add(local_32);
        }
        TEUIModelRef<FVM_NormalSkillBtn> local_6_5 = this.GetRSkillBtnVM();
        if (GetCachedVisibility())
        {
            FEUIDynamicWidgetData local_32;
            local_32.ModelContainer = FEUIModelContainer(this.GetRSkillBtnVM().opImplConv());
            local_4.Add(local_32);
        }
        return local_4;
    }
    ESlateVisibility IsFakeProgressVisibility() const
    {
        int local_6;
        if ((int(this.GetSkillBtnsCharacterType())) == 1 && !(this.GetbIsPVXControlFakeCharacter()))
        {
            local_6 = 3;
        }
        else
        {
            local_6 = 1;
        }
        return ESlateVisibility(local_6);
    }
    ESlateVisibility IsExclusiveVisibility() const
    {
        int local_2;
        bool local_1 = !(this.GetCurSkillBtnConfig().IsSet());
        if (local_1)
        {
            return ESlateVisibility(1);
        }
        if (local_1)
        {
            local_2 = 3;
        }
        else
        {
            local_2 = 1;
        }
        return ESlateVisibility(local_2);
    }
    int GetFakeProgressAndDevinceSwitcher() const
    {
        if ((int(this.GetSkillBtnsCharacterType())) == 1 && !(this.GetbIsPVXControlFakeCharacter()))
        {
            return 1;
        }
        return 0;
    }
    void PostConstruct()
    {
        this.SetUltraSkillBtnVM(TEUIModelRef<FVM_NormalSkillBtn>(::FVM_NormalSkillBtn::Create(this.GetContext().Manager)));
        this.SetSpecialESkillBtnVM(TEUIModelRef<FVM_NormalSkillBtn>(::FVM_NormalSkillBtn::Create(this.GetContext().Manager)));
        this.SetQSkillBtnVM(TEUIModelRef<FVM_NormalSkillBtn>(::FVM_NormalSkillBtn::Create(this.GetContext().Manager)));
        this.SetESkillBtnVM(TEUIModelRef<FVM_NormalSkillBtn>(::FVM_NormalSkillBtn::Create(this.GetContext().Manager)));
        this.SetRSkillBtnVM(TEUIModelRef<FVM_NormalSkillBtn>(::FVM_NormalSkillBtn::Create(this.GetContext().Manager)));
        this.SetTSkillBtnVM(TEUIModelRef<FVM_NormalSkillBtn>(::FVM_NormalSkillBtn::Create(this.GetContext().Manager)));
        this.SetAttackBtnVM(TEUIModelRef<FVM_NormalSkillBtn>(::FVM_NormalSkillBtn::Create(this.GetContext().Manager)));
        this.SetAimBtnVM(TEUIModelRef<FVM_NormalSkillBtn>(::FVM_NormalSkillBtn::Create(this.GetContext().Manager)));
        this.SetJumpBtnVM(TEUIModelRef<FVM_NormalSkillBtn>(::FVM_NormalSkillBtn::Create(this.GetContext().Manager)));
        this.SetDodgeBtnVM(TEUIModelRef<FVM_NormalSkillBtn>(::FVM_NormalSkillBtn::Create(this.GetContext().Manager)));
        this.SetLockTargetBtnVM(TEUIModelRef<FVM_NormalSkillBtn>(::FVM_NormalSkillBtn::Create(this.GetContext().Manager)));
        this.SetSwitchAvatarBtnVM(TEUIModelRef<FVM_NormalSkillBtn>(::FVM_NormalSkillBtn::Create(this.GetContext().Manager)));
        this.SetFakeCharacterProgressVM(TEUIModelRef<FVM_FakeCharacterProgress>(::FVM_FakeCharacterProgress::Create(this.GetContext().Manager)));
        return;
    }
    void RefreshGamepadRightShoulderPress()
    {
        if (!(!(this.GetCurSkillBtnConfig())) && this.GetCurSkillBtnConfig().opArrow().bEnableGamepadRightShoulderAnim)
        {
            this.SetbGamepadRightShoulderPress(this.GetbGamepadRightShoulderInputPress());
            return;
        }
        this.SetbGamepadRightShoulderPress(false);
        return;
    }
    void RefreshSkillBtnModels()
    {
        int64 local_16;
        bool local_70 = false;
        int local_76 = 0;
        int local_142 = 0;
        bool local_150 = false;
        int local_151;
        int local_152;
        FECSEntity local_4 = FECSEntity(this.GetContext().GetLocalPlayerPawn());
        if (!(local_4.IsValid()))
        {
            return;
        }
        if (!(::UICommonUtil::IsValidPawnContext(local_4)))
        {
            return;
        }
        bool local_9 = !(this.TrackConsoleBool(UICommonUtil::CVar_UI_DebugEnableNewSkillBtns));
        if (local_9)
        {
            return;
        }
        FECSEntity local_14 = FECSEntity(this.GetCurPawnEntity());
        local_16 = this.GetCurSkillBtnConfig().GetUniqueID();
        if (!(this.GetCurSkillBtnConfig().IsSet()))
        {
            local_9 = false;
        }
        else
        {
            TDataObjectPtr<FSkillBtnConfig> local_44;
            local_44 = this.GetCurSkillBtnConfig();
            local_9 = !((local_44 == nullptr));
        }
        bool local_69 = local_9 && local_70;
        this.SetCurPawnEntity(local_4);
        if (!(local_76))
        {
            return;
        }
        ::FASCommonUtils::GetUniquePlayerEntity(local_4);
        bool local_81 = true;
        Get local_88;
        const FC_ChangeSkillPanel& local_84 = local_88.opCall();
        if (local_84)
        {
            this.SetCurSkillBtnConfig(local_84.GetSkillBtnConfig());
            this.SetSkillBtnsCharacterType(ESkillBtnsCharacterType(ESkillBtnsCharacterType(0)));
            local_81 = false;
        }
        local_70 = local_81 && ::FASCommonUtils::IsAvatarPrefab(this.GetCurPawnEntity());
        if (local_70)
        {
            TDataObjectPtr<FAvatarPrefabConfig> local_114 = ::GetAvatarConfig(this.GetCurPawnEntity());
            this.SetCurSkillBtnConfig(GetSkillBtnConfig());
            this.SetSkillBtnsCharacterType(ESkillBtnsCharacterType(ESkillBtnsCharacterType(0)));
        }
        else
        {
            if (local_81 && ::FASCommonUtils::IsMonsterPrefab(this.GetCurPawnEntity()))
            {
                TDataObjectPtr<FMonsterPrefabConfig> local_138 = ::GetMonsterConfig(this.GetCurPawnEntity());
                this.SetCurSkillBtnConfig(GetSkillBtnConfig());
                this.SetSkillBtnsCharacterType(ESkillBtnsCharacterType(ESkillBtnsCharacterType(1)));
                this.SetbIsPVXControlFakeCharacter(this.GetCurPawnEntity().MatchGameplayTag(GameplayTags::CombatState_ControlMonster_PVX));
            }
        }
        if (local_69 && (local_16 != this.GetCurSkillBtnConfig().GetUniqueID()))
        {
            this.ClearTimer(this.GetModify_RebuildHUDTimer());
            this.ScheduleCall(this.GetModify_RebuildHUDTimer(), n"RebuildSkillBtnsHUDDeferred", 0.0f);
        }
        bool local_19 = !(this.GetCurSkillBtnConfig().IsSet());
        if (local_19)
        {
            local_70 = true;
        }
        else
        {
            TDataObjectPtr<FSkillBtnConfig> local_68;
            local_68 = this.GetCurSkillBtnConfig();
            local_70 = (local_68 == nullptr);
        }
        if (local_70)
        {
            return;
        }
        TEUIModelRef<FVM_NormalSkillBtn> local_148 = this.GetUltraSkillBtnVM();
        TEUIModelRef<FVM_NormalSkillBtn> local_148_2 = this.GetUltraSkillBtnVM();
        local_19.SetCachedVisibility();
        bool local_9_2 = true;
        TEUIModelRef<FVM_NormalSkillBtn> local_148_3 = this.GetUltraSkillBtnVM();
        local_9_2.SetbEnableTouchTriggerSkill();
        local_70 = local_150 && !(local_142 && local_142.IsHidden(ENormalSSkillBtnUIType(0)));
        if (local_70)
        {
            local_151 = 0;
        }
        else
        {
            local_151 = 1;
        }
        this.SetUltraVisibility(ESlateVisibility(local_151));
        TEUIModelRef<FVM_NormalSkillBtn> local_148_4 = this.GetSpecialESkillBtnVM();
        TEUIModelRef<FVM_NormalSkillBtn> local_148_5 = this.GetSpecialESkillBtnVM();
        local_150.SetCachedVisibility();
        bool local_19_2 = true;
        TEUIModelRef<FVM_NormalSkillBtn> local_148_6 = this.GetSpecialESkillBtnVM();
        local_19_2.SetbEnableTouchTriggerSkill();
        if (!(local_70))
        {
            local_19_2 = false;
        }
        else
        {
            local_9_2 = !(local_142 && local_142.IsHidden(ENormalSSkillBtnUIType(1)));
            local_19_2 = local_9_2;
        }
        if (local_19_2)
        {
            local_151 = 0;
        }
        else
        {
            local_151 = 1;
        }
        this.SetSpecialEVisibility(ESlateVisibility(local_151));
        TEUIModelRef<FVM_NormalSkillBtn> local_148_7 = this.GetQSkillBtnVM();
        TEUIModelRef<FVM_NormalSkillBtn> local_148_8 = this.GetQSkillBtnVM();
        local_9_2.SetCachedVisibility();
        bool local_19_3 = true;
        TEUIModelRef<FVM_NormalSkillBtn> local_148_9 = this.GetQSkillBtnVM();
        local_19_3.SetbEnableTouchTriggerSkill();
        if (local_150 && !(local_142 && local_142.IsHidden(ENormalSSkillBtnUIType(2))))
        {
            local_152 = 0;
        }
        else
        {
            local_152 = 1;
        }
        this.SetQVisibility(ESlateVisibility(local_152));
        TEUIModelRef<FVM_NormalSkillBtn> local_148_10 = this.GetESkillBtnVM();
        TEUIModelRef<FVM_NormalSkillBtn> local_148_11 = this.GetESkillBtnVM();
        local_70.SetCachedVisibility();
        bool local_19_4 = true;
        TEUIModelRef<FVM_NormalSkillBtn> local_148_12 = this.GetESkillBtnVM();
        local_19_4.SetbEnableTouchTriggerSkill();
        if (local_9_2 && !(local_142 && local_142.IsHidden(ENormalSSkillBtnUIType(3))))
        {
            local_151 = 0;
        }
        else
        {
            local_151 = 1;
        }
        this.SetEVisibility(ESlateVisibility(local_151));
        TEUIModelRef<FVM_NormalSkillBtn> local_148_13 = this.GetRSkillBtnVM();
        TEUIModelRef<FVM_NormalSkillBtn> local_148_14 = this.GetRSkillBtnVM();
        local_150.SetCachedVisibility();
        bool local_19_5 = true;
        TEUIModelRef<FVM_NormalSkillBtn> local_148_15 = this.GetRSkillBtnVM();
        local_19_5.SetbEnableTouchTriggerSkill();
        if (!(local_70))
        {
            local_19_5 = false;
        }
        else
        {
            local_9_2 = !(local_142 && local_142.IsHidden(ENormalSSkillBtnUIType(4)));
            local_19_5 = local_9_2;
        }
        if (local_19_5)
        {
            local_152 = 0;
        }
        else
        {
            local_152 = 1;
        }
        this.SetRVisibility(ESlateVisibility(local_152));
        TEUIModelRef<FVM_NormalSkillBtn> local_148_16 = this.GetTSkillBtnVM();
        TEUIModelRef<FVM_NormalSkillBtn> local_148_17 = this.GetTSkillBtnVM();
        local_9_2.SetCachedVisibility();
        bool local_19_6 = true;
        TEUIModelRef<FVM_NormalSkillBtn> local_148_18 = this.GetTSkillBtnVM();
        local_19_6.SetbEnableTouchTriggerSkill();
        if (local_150 && !(local_142 && local_142.IsHidden(ENormalSSkillBtnUIType(5))))
        {
            local_151 = 0;
        }
        else
        {
            local_151 = 1;
        }
        this.SetTVisibility(ESlateVisibility(local_151));
        FNormalSkillBtnConfig local_180;
        local_180.SkillSlot = ESkillSlot(1);
        local_180.SkillButtonType = ESkillButtonType(1);
        TEUIModelRef<FVM_NormalSkillBtn> local_148_19 = this.GetAttackBtnVM();
        local_180.SetSkillBtnConfig();
        local_70 = true && !(local_142 && local_142.IsHidden(ENormalSSkillBtnUIType(6)));
        TEUIModelRef<FVM_NormalSkillBtn> local_148_20 = this.GetAttackBtnVM();
        local_70.SetCachedVisibility();
        local_150 = true;
        TEUIModelRef<FVM_NormalSkillBtn> local_148_21 = this.GetAttackBtnVM();
        local_150.SetbEnableTouchTriggerSkill();
        local_70 = true;
        TEUIModelRef<FVM_NormalSkillBtn> local_148_22 = this.GetAimBtnVM();
        local_70.SetbOverrideInputAction();
        bool local_19_7 = true;
        TEUIModelRef<FVM_NormalSkillBtn> local_148_23 = this.GetAimBtnVM();
        local_19_7.SetbToggleMode();
        FEUIInputAction local_190 = FEUIInputAction(FCharacterInputUtils::GetInputActionByMainInputName(this.GetCurPawnEntity(), n"CharacterAim"));
        TEUIModelRef<FVM_NormalSkillBtn> local_148_24 = this.GetAimBtnVM();
        local_190.SetInputAction();
        local_70 = true && !(local_142 && local_142.IsHidden(ENormalSSkillBtnUIType(7)));
        TEUIModelRef<FVM_NormalSkillBtn> local_148_25 = this.GetAimBtnVM();
        local_70.SetCachedVisibility();
        local_150 = true;
        TEUIModelRef<FVM_NormalSkillBtn> local_148_26 = this.GetAimBtnVM();
        local_150.SetbEnableTouchTriggerSkill();
        local_70 = true;
        TEUIModelRef<FVM_NormalSkillBtn> local_148_27 = this.GetJumpBtnVM();
        local_70.SetbOverrideInputAction();
        FEUIInputAction local_190_2 = FEUIInputAction(FCharacterInputUtils::GetInputActionByMainInputName(this.GetCurPawnEntity(), n"CharacterJump"));
        TEUIModelRef<FVM_NormalSkillBtn> local_148_28 = this.GetJumpBtnVM();
        local_190_2.SetInputAction();
        local_70 = true && !(local_142 && local_142.IsHidden(ENormalSSkillBtnUIType(8)));
        TEUIModelRef<FVM_NormalSkillBtn> local_148_29 = this.GetJumpBtnVM();
        local_70.SetCachedVisibility();
        bool local_9_3 = true;
        TEUIModelRef<FVM_NormalSkillBtn> local_148_30 = this.GetJumpBtnVM();
        local_9_3.SetbEnableTouchTriggerSkill();
        local_70 = true;
        TEUIModelRef<FVM_NormalSkillBtn> local_148_31 = this.GetDodgeBtnVM();
        local_70.SetbOverrideInputAction();
        FEUIInputAction local_190_3 = FEUIInputAction(FCharacterInputUtils::GetInputActionByMainInputName(this.GetCurPawnEntity(), n"CharacterSprint"));
        TEUIModelRef<FVM_NormalSkillBtn> local_148_32 = this.GetDodgeBtnVM();
        local_190_3.SetInputAction();
        local_9_3 = true && !(local_142 && local_142.IsHidden(ENormalSSkillBtnUIType(9)));
        TEUIModelRef<FVM_NormalSkillBtn> local_148_33 = this.GetDodgeBtnVM();
        local_9_3.SetCachedVisibility();
        local_150 = true;
        TEUIModelRef<FVM_NormalSkillBtn> local_148_34 = this.GetDodgeBtnVM();
        local_150.SetbEnableTouchTriggerSkill();
        bool local_9_4 = true;
        TEUIModelRef<FVM_NormalSkillBtn> local_148_35 = this.GetLockTargetBtnVM();
        local_9_4.SetbOverrideInputAction();
        FEUIInputAction local_190_4 = FEUIInputAction(FCharacterInputUtils::GetInputActionByMainInputName(this.GetCurPawnEntity(), n"LockTarget"));
        TEUIModelRef<FVM_NormalSkillBtn> local_148_36 = this.GetLockTargetBtnVM();
        local_190_4.SetInputAction();
        local_150 = true && !(local_142 && local_142.IsHidden(ENormalSSkillBtnUIType(10)));
        TEUIModelRef<FVM_NormalSkillBtn> local_148_37 = this.GetLockTargetBtnVM();
        local_150.SetCachedVisibility();
        local_70 = true;
        TEUIModelRef<FVM_NormalSkillBtn> local_148_38 = this.GetLockTargetBtnVM();
        local_70.SetbEnableTouchTriggerSkill();
        local_150 = true;
        TEUIModelRef<FVM_NormalSkillBtn> local_148_39 = this.GetSwitchAvatarBtnVM();
        local_150.SetbOverrideInputAction();
        FEUIInputAction local_190_5 = FEUIInputAction(FCharacterInputUtils::GetInputActionByMainInputName(this.GetCurPawnEntity(), n"SwitchAvatar"));
        TEUIModelRef<FVM_NormalSkillBtn> local_148_40 = this.GetSwitchAvatarBtnVM();
        local_190_5.SetInputAction();
        local_70 = true && !(local_142 && local_142.IsHidden(ENormalSSkillBtnUIType(11)));
        TEUIModelRef<FVM_NormalSkillBtn> local_148_41 = this.GetSwitchAvatarBtnVM();
        local_70.SetCachedVisibility();
        bool local_9_5 = true;
        TEUIModelRef<FVM_NormalSkillBtn> local_148_42 = this.GetSwitchAvatarBtnVM();
        local_9_5.SetbEnableTouchTriggerSkill();
        bool local_191 = this.GetCurSkillBtnConfig().opArrow().bEnableGamepadRightShoulderAnim;
        if (local_142 && local_142.IsHidden(ENormalSSkillBtnUIType(12)))
        {
            local_191 = false;
        }
        if (local_191)
        {
            local_152 = 0;
        }
        else
        {
            local_152 = 2;
        }
        this.SetRBVisibility(ESlateVisibility(local_152));
        if (!(local_19_7))
        {
            local_9_5 = false;
        }
        else
        {
            local_9_5 = !((FECSEntity(this.GetCurPawnEntity()) == local_14));
            local_9_5 = local_9_5 || (local_16 != this.GetCurSkillBtnConfig().GetUniqueID());
        }
        if (local_9_5)
        {
            if ((int(this.GetSkillBtnsCharacterType())) == 0)
            {
                UExclusiveSkillModelAdapterBase local_194;
                this.SetExclusiveSkill(local_194.MakeViewModels(this.GetContext()));
            }
        }
        return;
    }
    void RebuildSkillBtnsHUDDeferred()
    {
        ULocalPlayer local_8;
        this.ClearTimer(this.GetModify_RebuildHUDTimer());
        if (local_8 != nullptr && ::UICommonUtil::IsValidPawnContext(this.GetContext().GetLocalPlayerPawn()))
        {
            ::FSkillBtnsUtils::SafeRebuildSkillResouce(this.GetContext());
        }
        return;
    }
    void RefreshInputActionVisibility()
    {
        if ((int(::UICommonUtil::GetCurrentInputType(nullptr))) == 1)
        {
            TEUIModelRef<FVM_NormalSkillBtn> local_6 = this.GetSpecialESkillBtnVM();
            1.SetbOverrideInputActionVisibility();
            int local_7 = 0;
            TEUIModelRef<FVM_NormalSkillBtn> local_6_2 = this.GetSpecialESkillBtnVM();
            local_7.SetOverrideInputActionVisibility();
            int local_4 = 1;
            TEUIModelRef<FVM_NormalSkillBtn> local_6_3 = this.GetESkillBtnVM();
            local_4.SetbOverrideInputActionVisibility();
            local_7 = 0;
            TEUIModelRef<FVM_NormalSkillBtn> local_6_4 = this.GetESkillBtnVM();
            local_7.SetOverrideInputActionVisibility();
            return;
        }
        int local_4_2 = 0;
        TEUIModelRef<FVM_NormalSkillBtn> local_6_5 = this.GetSpecialESkillBtnVM();
        local_4_2.SetbOverrideInputActionVisibility();
        local_4_2 = 0;
        TEUIModelRef<FVM_NormalSkillBtn> local_6_6 = this.GetESkillBtnVM();
        local_4_2.SetbOverrideInputActionVisibility();
        return;
    }
    void RefreshSkillBtnsPanelVisibility()
    {
        int local_2;
        if (this.TrackConsoleBool(UICommonUtil::CVar_UI_DebugEnableNewSkillBtns))
        {
            int local_3;
            local_3 = 0;
            local_2 = local_3;
        }
        else
        {
            int local_3;
            local_3 = 2;
            local_2 = local_3;
        }
        this.SetCachedVisibility(ESlateVisibility(local_2));
        return;
    }
    ESlateVisibility SkillBtnsPanelVisibility() const
    {
        return this.GetCachedVisibility();
    }
    TEUIModelRef<FVM_NormalSkillBtn> GetUltraSkillBtnVM() const property
    {
        this.TrackPropertyRead(0);
        return this.m_UltraSkillBtnVM;
    }
    void SetUltraSkillBtnVM(const TEUIModelRef<FVM_NormalSkillBtn> &inout __Value) property
    {
        TEUIModelRef<FVM_NormalSkillBtn> local_2;
        local_2 = this.m_UltraSkillBtnVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_UltraSkillBtnVM = __Value;
        return;
    }
    TEUIModelRef<FVM_NormalSkillBtn> GetSpecialESkillBtnVM() const property
    {
        this.TrackPropertyRead(1);
        return this.m_SpecialESkillBtnVM;
    }
    void SetSpecialESkillBtnVM(const TEUIModelRef<FVM_NormalSkillBtn> &inout __Value) property
    {
        TEUIModelRef<FVM_NormalSkillBtn> local_2;
        local_2 = this.m_SpecialESkillBtnVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SpecialESkillBtnVM = __Value;
        return;
    }
    TEUIModelRef<FVM_NormalSkillBtn> GetQSkillBtnVM() const property
    {
        this.TrackPropertyRead(2);
        return this.m_QSkillBtnVM;
    }
    void SetQSkillBtnVM(const TEUIModelRef<FVM_NormalSkillBtn> &inout __Value) property
    {
        TEUIModelRef<FVM_NormalSkillBtn> local_2;
        local_2 = this.m_QSkillBtnVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_QSkillBtnVM = __Value;
        return;
    }
    TEUIModelRef<FVM_NormalSkillBtn> GetESkillBtnVM() const property
    {
        this.TrackPropertyRead(3);
        return this.m_ESkillBtnVM;
    }
    void SetESkillBtnVM(const TEUIModelRef<FVM_NormalSkillBtn> &inout __Value) property
    {
        TEUIModelRef<FVM_NormalSkillBtn> local_2;
        local_2 = this.m_ESkillBtnVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_ESkillBtnVM = __Value;
        return;
    }
    TEUIModelRef<FVM_NormalSkillBtn> GetRSkillBtnVM() const property
    {
        this.TrackPropertyRead(4);
        return this.m_RSkillBtnVM;
    }
    void SetRSkillBtnVM(const TEUIModelRef<FVM_NormalSkillBtn> &inout __Value) property
    {
        TEUIModelRef<FVM_NormalSkillBtn> local_2;
        local_2 = this.m_RSkillBtnVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_RSkillBtnVM = __Value;
        return;
    }
    TEUIModelRef<FVM_NormalSkillBtn> GetTSkillBtnVM() const property
    {
        this.TrackPropertyRead(5);
        return this.m_TSkillBtnVM;
    }
    void SetTSkillBtnVM(const TEUIModelRef<FVM_NormalSkillBtn> &inout __Value) property
    {
        TEUIModelRef<FVM_NormalSkillBtn> local_2;
        local_2 = this.m_TSkillBtnVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_TSkillBtnVM = __Value;
        return;
    }
    TEUIModelRef<FVM_NormalSkillBtn> GetAttackBtnVM() const property
    {
        this.TrackPropertyRead(6);
        return this.m_AttackBtnVM;
    }
    void SetAttackBtnVM(const TEUIModelRef<FVM_NormalSkillBtn> &inout __Value) property
    {
        TEUIModelRef<FVM_NormalSkillBtn> local_2;
        local_2 = this.m_AttackBtnVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_AttackBtnVM = __Value;
        return;
    }
    TEUIModelRef<FVM_NormalSkillBtn> GetAimBtnVM() const property
    {
        this.TrackPropertyRead(7);
        return this.m_AimBtnVM;
    }
    void SetAimBtnVM(const TEUIModelRef<FVM_NormalSkillBtn> &inout __Value) property
    {
        TEUIModelRef<FVM_NormalSkillBtn> local_2;
        local_2 = this.m_AimBtnVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_AimBtnVM = __Value;
        return;
    }
    TEUIModelRef<FVM_NormalSkillBtn> GetJumpBtnVM() const property
    {
        this.TrackPropertyRead(8);
        return this.m_JumpBtnVM;
    }
    void SetJumpBtnVM(const TEUIModelRef<FVM_NormalSkillBtn> &inout __Value) property
    {
        TEUIModelRef<FVM_NormalSkillBtn> local_2;
        local_2 = this.m_JumpBtnVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_JumpBtnVM = __Value;
        return;
    }
    TEUIModelRef<FVM_NormalSkillBtn> GetDodgeBtnVM() const property
    {
        this.TrackPropertyRead(9);
        return this.m_DodgeBtnVM;
    }
    void SetDodgeBtnVM(const TEUIModelRef<FVM_NormalSkillBtn> &inout __Value) property
    {
        TEUIModelRef<FVM_NormalSkillBtn> local_2;
        local_2 = this.m_DodgeBtnVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_DodgeBtnVM = __Value;
        return;
    }
    TEUIModelRef<FVM_NormalSkillBtn> GetLockTargetBtnVM() const property
    {
        this.TrackPropertyRead(10);
        return this.m_LockTargetBtnVM;
    }
    void SetLockTargetBtnVM(const TEUIModelRef<FVM_NormalSkillBtn> &inout __Value) property
    {
        TEUIModelRef<FVM_NormalSkillBtn> local_2;
        local_2 = this.m_LockTargetBtnVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_LockTargetBtnVM = __Value;
        return;
    }
    TEUIModelRef<FVM_NormalSkillBtn> GetSwitchAvatarBtnVM() const property
    {
        this.TrackPropertyRead(11);
        return this.m_SwitchAvatarBtnVM;
    }
    void SetSwitchAvatarBtnVM(const TEUIModelRef<FVM_NormalSkillBtn> &inout __Value) property
    {
        TEUIModelRef<FVM_NormalSkillBtn> local_2;
        local_2 = this.m_SwitchAvatarBtnVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_SwitchAvatarBtnVM = __Value;
        return;
    }
    const FEUIModelRef GetExclusiveSkill() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(12);
        return __r;
    }
    FEUIModelRef GetModify_ExclusiveSkill() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(12);
        return __r;
    }
    void SetExclusiveSkill(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_ExclusiveSkill = __Value;
        return;
    }
    TEUIModelRef<FVM_FakeCharacterProgress> GetFakeCharacterProgressVM() const property
    {
        this.TrackPropertyRead(13);
        return this.m_FakeCharacterProgressVM;
    }
    void SetFakeCharacterProgressVM(const TEUIModelRef<FVM_FakeCharacterProgress> &inout __Value) property
    {
        TEUIModelRef<FVM_FakeCharacterProgress> local_2;
        local_2 = this.m_FakeCharacterProgressVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_FakeCharacterProgressVM = __Value;
        return;
    }
    TSoftClassPtr<UEUIUserWidget> GetExclusiveSkillWidget() const property
    {
        this.TrackPropertyRead(14);
        return this.m_ExclusiveSkillWidget;
    }
    void SetExclusiveSkillWidget(const TSoftClassPtr<UEUIUserWidget> &inout __Value) property
    {
        if ((this.m_ExclusiveSkillWidget == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_ExclusiveSkillWidget = __Value;
        return;
    }
    const FECSEntity GetCurPawnEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(15);
        return __r;
    }
    FECSEntity GetModify_CurPawnEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(15);
        return __r;
    }
    void SetCurPawnEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_CurPawnEntity = __Value;
        return;
    }
    ESkillBtnsCharacterType GetSkillBtnsCharacterType() const property
    {
        this.TrackPropertyRead(16);
        return this.m_SkillBtnsCharacterType;
    }
    void SetSkillBtnsCharacterType(const ESkillBtnsCharacterType __Value) property
    {
        if (int(this.m_SkillBtnsCharacterType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(16);
        this.m_SkillBtnsCharacterType = __Value;
        return;
    }
    ESlateVisibility GetCachedVisibility() const property
    {
        this.TrackPropertyRead(17);
        return this.m_CachedVisibility;
    }
    void SetCachedVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_CachedVisibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(17);
        this.m_CachedVisibility = __Value;
        return;
    }
    ESlateVisibility GetUltraVisibility() const property
    {
        this.TrackPropertyRead(18);
        return this.m_UltraVisibility;
    }
    void SetUltraVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_UltraVisibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(18);
        this.m_UltraVisibility = __Value;
        return;
    }
    ESlateVisibility GetSpecialEVisibility() const property
    {
        this.TrackPropertyRead(19);
        return this.m_SpecialEVisibility;
    }
    void SetSpecialEVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_SpecialEVisibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(19);
        this.m_SpecialEVisibility = __Value;
        return;
    }
    ESlateVisibility GetQVisibility() const property
    {
        this.TrackPropertyRead(20);
        return this.m_QVisibility;
    }
    void SetQVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_QVisibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(20);
        this.m_QVisibility = __Value;
        return;
    }
    ESlateVisibility GetEVisibility() const property
    {
        this.TrackPropertyRead(21);
        return this.m_EVisibility;
    }
    void SetEVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_EVisibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(21);
        this.m_EVisibility = __Value;
        return;
    }
    ESlateVisibility GetRVisibility() const property
    {
        this.TrackPropertyRead(22);
        return this.m_RVisibility;
    }
    void SetRVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_RVisibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(22);
        this.m_RVisibility = __Value;
        return;
    }
    ESlateVisibility GetTVisibility() const property
    {
        this.TrackPropertyRead(23);
        return this.m_TVisibility;
    }
    void SetTVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_TVisibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(23);
        this.m_TVisibility = __Value;
        return;
    }
    ESlateVisibility GetRBVisibility() const property
    {
        this.TrackPropertyRead(24);
        return this.m_RBVisibility;
    }
    void SetRBVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_RBVisibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(24);
        this.m_RBVisibility = __Value;
        return;
    }
    bool GetbGamepadRightShoulderInputPress() const property
    {
        this.TrackPropertyRead(25);
        return this.m_bGamepadRightShoulderInputPress;
    }
    void SetbGamepadRightShoulderInputPress(const bool __Value) property
    {
        if (!(this.m_bGamepadRightShoulderInputPress) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(25);
        this.m_bGamepadRightShoulderInputPress = __Value;
        return;
    }
    bool GetbGamepadRightShoulderPress() const property
    {
        this.TrackPropertyRead(26);
        return this.m_bGamepadRightShoulderPress;
    }
    void SetbGamepadRightShoulderPress(const bool __Value) property
    {
        if (!(this.m_bGamepadRightShoulderPress) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(26);
        this.m_bGamepadRightShoulderPress = __Value;
        return;
    }
    bool GetbIsPVXControlFakeCharacter() const property
    {
        this.TrackPropertyRead(27);
        return this.m_bIsPVXControlFakeCharacter;
    }
    void SetbIsPVXControlFakeCharacter(const bool __Value) property
    {
        if (!(this.m_bIsPVXControlFakeCharacter) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(27);
        this.m_bIsPVXControlFakeCharacter = __Value;
        return;
    }
    const TDataObjectPtr<FSkillBtnConfig> GetCurSkillBtnConfig() const property
    {
        const TDataObjectPtr<FSkillBtnConfig> __r;
        this.TrackPropertyRead(28);
        return __r;
    }
    TDataObjectPtr<FSkillBtnConfig> GetModify_CurSkillBtnConfig() property
    {
        TDataObjectPtr<FSkillBtnConfig> __r;
        this.MarkPropertyDirty(28);
        return __r;
    }
    void SetCurSkillBtnConfig(const TDataObjectPtr<FSkillBtnConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(28);
        this.m_CurSkillBtnConfig = __Value;
        return;
    }
    const FEUITimerHandle GetRebuildHUDTimer() const property
    {
        const FEUITimerHandle __r;
        this.TrackPropertyRead(29);
        return __r;
    }
    FEUITimerHandle GetModify_RebuildHUDTimer() property
    {
        FEUITimerHandle __r;
        this.MarkPropertyDirty(29);
        return __r;
    }
    void SetRebuildHUDTimer(const FEUITimerHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(29);
        this.m_RebuildHUDTimer = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_SkillBtns
{
    UPROPERTY()
    ESlateVisibility IsUltraVisibility;
    UPROPERTY()
    ESlateVisibility IsSpecialEVisibility;
    UPROPERTY()
    ESlateVisibility IsQVisibility;
    UPROPERTY()
    ESlateVisibility IsEVisibility;
    UPROPERTY()
    ESlateVisibility IsRVisibility;
    UPROPERTY()
    ESlateVisibility IsTVisibility;
    UPROPERTY()
    ESlateVisibility SpecialEAndNormalEVisibility;
    UPROPERTY()
    ESlateVisibility IsRBVisibility;
    UPROPERTY()
    int SpecialEAndNormalESwitch;
    UPROPERTY()
    int RightShoulderPressSwitch;
    UPROPERTY()
    float32 SkillbtnsSizeOverride;
    UPROPERTY()
    bool ShouldShowGamepadRight;
    UPROPERTY()
    TArray<FEUIDynamicWidgetData> SimpleSkillEntryDataList;
    UPROPERTY()
    ESlateVisibility IsFakeProgressVisibility;
    UPROPERTY()
    ESlateVisibility IsExclusiveVisibility;
    UPROPERTY()
    int FakeProgressAndDevinceSwitcher;
    UPROPERTY()
    ESlateVisibility SkillBtnsPanelVisibility;
    UPROPERTY()
    TEUIModelRef<FVMS_SkillBtns> Self;


}

namespace FVMS_SkillBtns
{
FVMS_SkillBtns& Get(const UObject ContextObject)
{
    return FVMS_SkillBtns::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_SkillBtns GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_SkillBtns __r;
    TEUIModelRef<FVMS_SkillBtns> local_6 = TEUIModelRef<FVMS_SkillBtns>(EUIInternal::MakeModelWithManager(Manager, FVMS_SkillBtns::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "UltraSkillBtnVM";
    local_14.TypeName = "TEUIModelRef<FVM_NormalSkillBtn>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SpecialESkillBtnVM";
    local_14.TypeName = "TEUIModelRef<FVM_NormalSkillBtn>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "QSkillBtnVM";
    local_14.TypeName = "TEUIModelRef<FVM_NormalSkillBtn>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ESkillBtnVM";
    local_14.TypeName = "TEUIModelRef<FVM_NormalSkillBtn>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RSkillBtnVM";
    local_14.TypeName = "TEUIModelRef<FVM_NormalSkillBtn>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TSkillBtnVM";
    local_14.TypeName = "TEUIModelRef<FVM_NormalSkillBtn>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AttackBtnVM";
    local_14.TypeName = "TEUIModelRef<FVM_NormalSkillBtn>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AimBtnVM";
    local_14.TypeName = "TEUIModelRef<FVM_NormalSkillBtn>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "JumpBtnVM";
    local_14.TypeName = "TEUIModelRef<FVM_NormalSkillBtn>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DodgeBtnVM";
    local_14.TypeName = "TEUIModelRef<FVM_NormalSkillBtn>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LockTargetBtnVM";
    local_14.TypeName = "TEUIModelRef<FVM_NormalSkillBtn>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SwitchAvatarBtnVM";
    local_14.TypeName = "TEUIModelRef<FVM_NormalSkillBtn>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ExclusiveSkill";
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "FakeCharacterProgressVM";
    local_14.TypeName = "TEUIModelRef<FVM_FakeCharacterProgress>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ExclusiveSkillWidget";
    local_14.TypeName = "TSoftClassPtr<UEUIUserWidget>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsUltraVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsSpecialEVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsQVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsEVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsRVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsTVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SpecialEAndNormalEVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsRBVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SpecialEAndNormalESwitch";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RightShoulderPressSwitch";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SkillbtnsSizeOverride";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShouldShowGamepadRight";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SimpleSkillEntryDataList";
    local_14.TypeName = "TArray<FEUIDynamicWidgetData>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsFakeProgressVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsExclusiveVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "FakeProgressAndDevinceSwitcher";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SkillBtnsPanelVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_SkillBtns>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_SkillBtns;
    FEUIModelEffectDefine local_20;
    local_20.FunctionName = "RefreshGamepadRightShoulderPress";
    Result.EffectFunctions.Add(local_20);
    local_20.FunctionName = "RefreshSkillBtnModels";
    Result.EffectFunctions.Add(local_20);
    local_20.FunctionName = "RefreshInputActionVisibility";
    Result.EffectFunctions.Add(local_20);
    local_20.FunctionName = "RefreshSkillBtnsPanelVisibility";
    Result.EffectFunctions.Add(local_20);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_SkillBtns;
}
TEUIModelRef<FVM_NormalSkillBtn> __UIGetter_UltraSkillBtnVM(const FVMS_SkillBtns &inout Model)
{
    return Model.GetUltraSkillBtnVM();
}
TEUIModelRef<FVM_NormalSkillBtn> __UIGetter_SpecialESkillBtnVM(const FVMS_SkillBtns &inout Model)
{
    return Model.GetSpecialESkillBtnVM();
}
TEUIModelRef<FVM_NormalSkillBtn> __UIGetter_QSkillBtnVM(const FVMS_SkillBtns &inout Model)
{
    return Model.GetQSkillBtnVM();
}
TEUIModelRef<FVM_NormalSkillBtn> __UIGetter_ESkillBtnVM(const FVMS_SkillBtns &inout Model)
{
    return Model.GetESkillBtnVM();
}
TEUIModelRef<FVM_NormalSkillBtn> __UIGetter_RSkillBtnVM(const FVMS_SkillBtns &inout Model)
{
    return Model.GetRSkillBtnVM();
}
TEUIModelRef<FVM_NormalSkillBtn> __UIGetter_TSkillBtnVM(const FVMS_SkillBtns &inout Model)
{
    return Model.GetTSkillBtnVM();
}
TEUIModelRef<FVM_NormalSkillBtn> __UIGetter_AttackBtnVM(const FVMS_SkillBtns &inout Model)
{
    return Model.GetAttackBtnVM();
}
TEUIModelRef<FVM_NormalSkillBtn> __UIGetter_AimBtnVM(const FVMS_SkillBtns &inout Model)
{
    return Model.GetAimBtnVM();
}
TEUIModelRef<FVM_NormalSkillBtn> __UIGetter_JumpBtnVM(const FVMS_SkillBtns &inout Model)
{
    return Model.GetJumpBtnVM();
}
TEUIModelRef<FVM_NormalSkillBtn> __UIGetter_DodgeBtnVM(const FVMS_SkillBtns &inout Model)
{
    return Model.GetDodgeBtnVM();
}
TEUIModelRef<FVM_NormalSkillBtn> __UIGetter_LockTargetBtnVM(const FVMS_SkillBtns &inout Model)
{
    return Model.GetLockTargetBtnVM();
}
TEUIModelRef<FVM_NormalSkillBtn> __UIGetter_SwitchAvatarBtnVM(const FVMS_SkillBtns &inout Model)
{
    return Model.GetSwitchAvatarBtnVM();
}
FEUIModelRef __UIGetter_ExclusiveSkill(const FVMS_SkillBtns &inout Model)
{
    return Model.GetExclusiveSkill();
}
TEUIModelRef<FVM_FakeCharacterProgress> __UIGetter_FakeCharacterProgressVM(const FVMS_SkillBtns &inout Model)
{
    return Model.GetFakeCharacterProgressVM();
}
TSoftClassPtr<UEUIUserWidget> __UIGetter_ExclusiveSkillWidget(const FVMS_SkillBtns &inout Model)
{
    return Model.GetExclusiveSkillWidget();
}
ESlateVisibility __UIGetter_IsUltraVisibility(const FVMS_SkillBtns &inout Model)
{
    return Model.IsUltraVisibility();
}
ESlateVisibility __UIGetter_IsSpecialEVisibility(const FVMS_SkillBtns &inout Model)
{
    return Model.IsSpecialEVisibility();
}
ESlateVisibility __UIGetter_IsQVisibility(const FVMS_SkillBtns &inout Model)
{
    return Model.IsQVisibility();
}
ESlateVisibility __UIGetter_IsEVisibility(const FVMS_SkillBtns &inout Model)
{
    return Model.IsEVisibility();
}
ESlateVisibility __UIGetter_IsRVisibility(const FVMS_SkillBtns &inout Model)
{
    return Model.IsRVisibility();
}
ESlateVisibility __UIGetter_IsTVisibility(const FVMS_SkillBtns &inout Model)
{
    return Model.IsTVisibility();
}
ESlateVisibility __UIGetter_SpecialEAndNormalEVisibility(const FVMS_SkillBtns &inout Model)
{
    return Model.SpecialEAndNormalEVisibility();
}
ESlateVisibility __UIGetter_IsRBVisibility(const FVMS_SkillBtns &inout Model)
{
    return Model.IsRBVisibility();
}
int __UIGetter_SpecialEAndNormalESwitch(const FVMS_SkillBtns &inout Model)
{
    return Model.GetSpecialEAndNormalESwitch();
}
int __UIGetter_RightShoulderPressSwitch(const FVMS_SkillBtns &inout Model)
{
    return Model.GetRightShoulderPressSwitch();
}
float32 __UIGetter_SkillbtnsSizeOverride(const FVMS_SkillBtns &inout Model)
{
    return Model.GetSkillbtnsSizeOverride();
}
bool __UIGetter_ShouldShowGamepadRight(const FVMS_SkillBtns &inout Model)
{
    return Model.ShouldShowGamepadRight();
}
TArray<FEUIDynamicWidgetData> __UIGetter_SimpleSkillEntryDataList(const FVMS_SkillBtns &inout Model)
{
    return Model.GetSimpleSkillEntryDataList();
}
ESlateVisibility __UIGetter_IsFakeProgressVisibility(const FVMS_SkillBtns &inout Model)
{
    return Model.IsFakeProgressVisibility();
}
ESlateVisibility __UIGetter_IsExclusiveVisibility(const FVMS_SkillBtns &inout Model)
{
    return Model.IsExclusiveVisibility();
}
int __UIGetter_FakeProgressAndDevinceSwitcher(const FVMS_SkillBtns &inout Model)
{
    return Model.GetFakeProgressAndDevinceSwitcher();
}
ESlateVisibility __UIGetter_SkillBtnsPanelVisibility(const FVMS_SkillBtns &inout Model)
{
    return Model.SkillBtnsPanelVisibility();
}
TEUIModelRef<FVMS_SkillBtns> __UIGetter_Self(const FVMS_SkillBtns &inout Model)
{
    return TEUIModelRef<FVMS_SkillBtns>(Model);
}
int __IndexOf_UltraSkillBtnVM()
{
    return 0;
}
int __IndexOf_SpecialESkillBtnVM()
{
    return 1;
}
int __IndexOf_QSkillBtnVM()
{
    return 2;
}
int __IndexOf_ESkillBtnVM()
{
    return 3;
}
int __IndexOf_RSkillBtnVM()
{
    return 4;
}
int __IndexOf_TSkillBtnVM()
{
    return 5;
}
int __IndexOf_AttackBtnVM()
{
    return 6;
}
int __IndexOf_AimBtnVM()
{
    return 7;
}
int __IndexOf_JumpBtnVM()
{
    return 8;
}
int __IndexOf_DodgeBtnVM()
{
    return 9;
}
int __IndexOf_LockTargetBtnVM()
{
    return 10;
}
int __IndexOf_SwitchAvatarBtnVM()
{
    return 11;
}
int __IndexOf_ExclusiveSkill()
{
    return 12;
}
int __IndexOf_FakeCharacterProgressVM()
{
    return 13;
}
int __IndexOf_ExclusiveSkillWidget()
{
    return 14;
}
int __IndexOf_CurPawnEntity()
{
    return 15;
}
int __IndexOf_SkillBtnsCharacterType()
{
    return 16;
}
int __IndexOf_CachedVisibility()
{
    return 17;
}
int __IndexOf_UltraVisibility()
{
    return 18;
}
int __IndexOf_SpecialEVisibility()
{
    return 19;
}
int __IndexOf_QVisibility()
{
    return 20;
}
int __IndexOf_EVisibility()
{
    return 21;
}
int __IndexOf_RVisibility()
{
    return 22;
}
int __IndexOf_TVisibility()
{
    return 23;
}
int __IndexOf_RBVisibility()
{
    return 24;
}
int __IndexOf_bGamepadRightShoulderInputPress()
{
    return 25;
}
int __IndexOf_bGamepadRightShoulderPress()
{
    return 26;
}
int __IndexOf_bIsPVXControlFakeCharacter()
{
    return 27;
}
int __IndexOf_CurSkillBtnConfig()
{
    return 28;
}
int __IndexOf_RebuildHUDTimer()
{
    return 29;
}
}
namespace __GeneratedProperties_FVMS_SkillBtns
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
