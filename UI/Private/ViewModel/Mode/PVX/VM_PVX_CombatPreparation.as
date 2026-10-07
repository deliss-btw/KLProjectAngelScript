
namespace FVM_PVX_CombatPreparation
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnSelectIllustrateFilter = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnSelectAvatar = FEUIModelCallbackSignature();

}
struct FVM_PVX_CombatPreparation : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_SelectedAvatarIndex;
    UPROPERTY()
    TArray<FEUIModelContainer> m_IllustrateTypes;
    UPROPERTY()
    EAvatarIllustrate m_FilterByIllustrate;
    UPROPERTY()
    TEUIModelRef<FVMS_PlayerOwnedAvatarInfo> m_PlayerOwnedAvatarInfo;
    UPROPERTY()
    TArray<FEUIModelContainer> m_FilteredAvatars;
    UPROPERTY()
    FEUIModelContainer m_SelectedAvatar;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarDetailInfo> m_AvatarDetailInfo;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarShowcase> m_Showcase;

    FVM_PVX_CombatPreparation()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_PVX_CombatPreparation(const FVM_PVX_CombatPreparation &inout Other)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_PVX_CombatPreparation& opAssign(const FVM_PVX_CombatPreparation &inout Other)
    {
        this.m_SelectedAvatarIndex = int(Other.m_SelectedAvatarIndex);
        this.m_IllustrateTypes = Other.m_IllustrateTypes;
        this.m_FilterByIllustrate = Other.m_FilterByIllustrate;
        this.m_PlayerOwnedAvatarInfo = Other.m_PlayerOwnedAvatarInfo;
        this.m_FilteredAvatars = Other.m_FilteredAvatars;
        this.m_SelectedAvatar = Other.m_SelectedAvatar;
        this.m_AvatarDetailInfo = Other.m_AvatarDetailInfo;
        return Other.m_Showcase;
    }
    void PostConstruct()
    {
        const UUtilitySettings local_2;
        const UAvatarBuildSettings local_36;
        GetGameplaySettings<UUtilitySettings> local_4;
        local_2 = local_4;
        FEUIModelContainer local_20;
        UEUIManagerSubsystem local_22 = this.GetManager();
        FEUIModelRef local_26;
        local_20.AddModel(local_26, false);
        FVM_CommonTabItem& local_28 = ::FVM_CommonTabItem::Create(this.GetManager());
        local_28.SetTitleText(NSLOCTEXT("PVX_CombatPreparation", "IllustrateAll", "е…ЁйѓЁ"));
        local_26 = FEUIModelRef(local_28);
        local_20.AddModel(local_26, false);
        this.GetModify_IllustrateTypes().Add(local_20);
        GetGameplaySettings<UAvatarBuildSettings> local_38;
        local_36 = local_38;
        if (local_36 != nullptr)
        {
            int local_41 = 0;
            for (; local_41 < 3; )
            {
                FEUIModelContainer local_56;
                FAvatarIllustrateInfo local_192;
                if (local_36.AvatarIllustrateInfos.Find(local_192, local_41))
                {
                    UEUIManagerSubsystem local_22_2 = this.GetManager();
                    local_56.AddModel(local_26, false);
                }
                else
                {
                    UEUIManagerSubsystem local_22_3 = this.GetManager();
                    local_56.AddModel(local_26, false);
                }
                FVM_CommonTabItem& local_196 = ::FVM_CommonTabItem::Create(this.GetManager());
                local_196.SetTitleText(local_192.DisplayName);
                local_56.AddModel(FEUIModelRef(local_196), false);
                this.GetModify_IllustrateTypes().Add(local_56);
                ++local_41;
            }
        }
        this.SetPlayerOwnedAvatarInfo(TEUIModelRef<FVMS_PlayerOwnedAvatarInfo>(::FVMS_PlayerOwnedAvatarInfo::Get(this.GetManager())));
        this.SetAvatarDetailInfo(TEUIModelRef<FVM_AvatarDetailInfo>(::FVM_AvatarDetailInfo::Create(this.GetManager())));
        TEUIModelRef<FVM_AvatarDetailInfo> local_200 = this.GetAvatarDetailInfo();
        1.SetPanelGameMode();
        return;
    }
    void SetCurrentShowcase(const TEUIModelRef<FVM_AvatarShowcase> &inout InShowcase)
    {
        XLog(ELog(70), FString().Append("[PVX_CombatPreparation]SetCurrentShowcase."));
        this.SetShowcase(InShowcase);
        this.RefreshShowcaseAvatars();
        return;
    }
    TEUIModelRef<FVM_AvatarInfo> GetSelectedAvatarInfo() const
    {
        return TEUIModelRef<FVM_AvatarInfo>(FEUIModelContainer::GetModel(this.GetSelectedAvatar()).opCall());
    }
    void OnSelectedAvatarIndexChanged()
    {
        XLog(ELog(70), FString().Append("[PVX_CombatPreparation]OnSelectedAvatarIndexChanged."));
        if (this.GetFilteredAvatars().IsValidIndex(this.GetSelectedAvatarIndex()))
        {
            this.SetSelectedAvatar(this.GetFilteredAvatars()[this.GetSelectedAvatarIndex()]);
            this.RefreshShowcaseAvatars();
            if (this.GetSelectedAvatarInfo().IsValid())
            {
                TEUIModelRef<FM_Avatar> local_16;
                local_16.GetAvatar();
                TEUIModelRef<FVM_AvatarDetailInfo> local_14 = this.GetAvatarDetailInfo();
                local_16.SetCurrentAvatar();
                int local_7 = 1;
                TEUIModelRef<FVM_AvatarDetailInfo> local_14_2 = this.GetAvatarDetailInfo();
                local_7.TrySetShowAttributeOrSkill();
                if (GetAvatarConfig())
                {
                    ::FMS_PvpModeState::Get(this.GetManager()).SetCurrentPvpAvatarId(GetAvatarConfig().opArrow().DataId);
                }
            }
        }
        return;
    }
    void RefreshShowcaseAvatars()
    {
        XLog(ELog(70), FString().Append("[PVX_CombatPreparation]RefreshShowcaseAvatars."));
        if (this.GetShowcase())
        {
            TArray<TDataObjectPtr<FAvatarPrefabConfig>> local_14;
            if (this.GetSelectedAvatarInfo().IsValid())
            {
                local_14.Add(GetAvatarConfig());
            }
            if (!(local_14.IsEmpty()))
            {
                XLog(ELog(70), FString().Append("[PVX_CombatPreparation]RefreshShowcaseAvatars. SetAvatars."));
                TEUIModelRef<FVM_AvatarShowcase> local_8 = this.GetShowcase();
                local_14.SetNextAvatars();
            }
        }
        return;
    }
    void OnSelectIllustrateFilter(const int IllustrateFilterItemIndex)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void OnSelectAvatar(const int AvatarIndex)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void RefreshFilteredAvatarList()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
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
    const TArray<FEUIModelContainer> GetIllustrateTypes() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_IllustrateTypes() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetIllustrateTypes(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_IllustrateTypes = __Value;
        return;
    }
    EAvatarIllustrate GetFilterByIllustrate() const property
    {
        this.TrackPropertyRead(2);
        return this.m_FilterByIllustrate;
    }
    void SetFilterByIllustrate(const EAvatarIllustrate __Value) property
    {
        if (int(this.m_FilterByIllustrate) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_FilterByIllustrate = __Value;
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
    const TArray<FEUIModelContainer> GetFilteredAvatars() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_FilteredAvatars() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetFilteredAvatars(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_FilteredAvatars = __Value;
        return;
    }
    FEUIModelContainer GetSelectedAvatar() const property
    {
        FEUIModelContainer __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FEUIModelContainer GetModify_SelectedAvatar() property
    {
        FEUIModelContainer __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetSelectedAvatar(const FEUIModelContainer &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_SelectedAvatar = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarDetailInfo> GetAvatarDetailInfo() const property
    {
        this.TrackPropertyRead(6);
        return this.m_AvatarDetailInfo;
    }
    void SetAvatarDetailInfo(const TEUIModelRef<FVM_AvatarDetailInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarDetailInfo> local_2;
        local_2 = this.m_AvatarDetailInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_AvatarDetailInfo = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarShowcase> GetShowcase() const property
    {
        this.TrackPropertyRead(7);
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
        this.MarkPropertyDirty(7);
        this.m_Showcase = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_PVX_CombatPreparation
{
    UPROPERTY()
    TEUIModelRef<FVM_AvatarInfo> SelectedAvatarInfo;
    UPROPERTY()
    TEUIModelRef<FVM_PVX_CombatPreparation> Self;

    __GeneratedProperties_FVM_PVX_CombatPreparation()
    {
        return;
    }
}

namespace FVM_PVX_CombatPreparation
{
FVM_PVX_CombatPreparation& Create(const UObject ContextObject)
{
    return FVM_PVX_CombatPreparation::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_PVX_CombatPreparation CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_PVX_CombatPreparation __r;
    TEUIModelRef<FVM_PVX_CombatPreparation> local_6 = TEUIModelRef<FVM_PVX_CombatPreparation>(EUIInternal::MakeModelWithManager(Manager, FVM_PVX_CombatPreparation::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_PVX_CombatPreparation;
}
void __OnSelectedAvatarIndexChanged(FVM_PVX_CombatPreparation &inout Model)
{
    Model.OnSelectedAvatarIndexChanged();
    return;
}
void __RefreshFilteredAvatarList(FVM_PVX_CombatPreparation &inout Model)
{
    Model.RefreshFilteredAvatarList();
    return;
}
TArray<FEUIModelContainer> __UIGetter_IllustrateTypes(const FVM_PVX_CombatPreparation &inout Model)
{
    return Model.GetIllustrateTypes();
}
TArray<FEUIModelContainer> __UIGetter_FilteredAvatars(const FVM_PVX_CombatPreparation &inout Model)
{
    return Model.GetFilteredAvatars();
}
FEUIModelContainer __UIGetter_SelectedAvatar(const FVM_PVX_CombatPreparation &inout Model)
{
    return Model.GetSelectedAvatar();
}
TEUIModelRef<FVM_AvatarDetailInfo> __UIGetter_AvatarDetailInfo(const FVM_PVX_CombatPreparation &inout Model)
{
    return Model.GetAvatarDetailInfo();
}
TEUIModelRef<FVM_AvatarInfo> __UIGetter_SelectedAvatarInfo(const FVM_PVX_CombatPreparation &inout Model)
{
    return Model.GetSelectedAvatarInfo();
}
TEUIModelRef<FVM_PVX_CombatPreparation> __UIGetter_Self(const FVM_PVX_CombatPreparation &inout Model)
{
    return TEUIModelRef<FVM_PVX_CombatPreparation>(Model);
}
int __IndexOf_SelectedAvatarIndex()
{
    return 0;
}
int __IndexOf_IllustrateTypes()
{
    return 1;
}
int __IndexOf_FilterByIllustrate()
{
    return 2;
}
int __IndexOf_PlayerOwnedAvatarInfo()
{
    return 3;
}
int __IndexOf_FilteredAvatars()
{
    return 4;
}
int __IndexOf_SelectedAvatar()
{
    return 5;
}
int __IndexOf_AvatarDetailInfo()
{
    return 6;
}
int __IndexOf_Showcase()
{
    return 7;
}
}
namespace __GeneratedProperties_FVM_PVX_CombatPreparation
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
