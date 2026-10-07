
namespace FVM_AvatarQuicklyEquip
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnSelectAvatar = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SwitchItemTraitCompare = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnItemEquip = FEUIModelCallbackSignature();

}
struct FVM_AvatarQuicklyEquip : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Equipment> m_CurEquipmentModel;
    UPROPERTY()
    int m_SelectedAvatarIndex;
    UPROPERTY()
    TArray<FEUIModelContainer> m_FilteredAvatars;
    UPROPERTY()
    FEUIModelContainer m_SelectedAvatar;
    UPROPERTY()
    TEUIModelRef<FVMS_PlayerOwnedAvatarInfo> m_PlayerOwnedAvatarInfo;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarEquipmentItemInfoCompare> m_InfoCompare;
    UPROPERTY()
    bool m_bCurEquipmentEquiped;
    UPROPERTY()
    bool m_bItemTraitCompared;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarShowcase> m_Showcase;
    UPROPERTY()
    TArray<FAvatarShowcaseEntry> m_ShowCaseAvatarEntries;

    FVM_AvatarQuicklyEquip()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_AvatarQuicklyEquip(const FVM_AvatarQuicklyEquip &inout Other)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_AvatarQuicklyEquip(const TEUIModelRef<FM_Equipment> &inout InCurEquipmentModel)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_AvatarQuicklyEquip& opAssign(const FVM_AvatarQuicklyEquip &inout Other)
    {
        this.m_CurEquipmentModel = Other.m_CurEquipmentModel;
        this.m_SelectedAvatarIndex = int(Other.m_SelectedAvatarIndex);
        this.m_FilteredAvatars = Other.m_FilteredAvatars;
        this.m_SelectedAvatar = Other.m_SelectedAvatar;
        this.m_PlayerOwnedAvatarInfo = Other.m_PlayerOwnedAvatarInfo;
        this.m_InfoCompare = Other.m_InfoCompare;
        this.m_bCurEquipmentEquiped = Other.m_bCurEquipmentEquiped;
        this.m_bItemTraitCompared = Other.m_bItemTraitCompared;
        this.m_Showcase = Other.m_Showcase;
        return Other.m_ShowCaseAvatarEntries;
    }
    void PostConstruct()
    {
        this.SetPlayerOwnedAvatarInfo(TEUIModelRef<FVMS_PlayerOwnedAvatarInfo>(::FVMS_PlayerOwnedAvatarInfo::Get(this.GetManager())));
        TEUIModelRef<FVM_EquipmentInfo> local_8 = TEUIModelRef<FVM_EquipmentInfo>(::FVM_EquipmentInfo::Create(this.GetContext().Manager, this.GetCurEquipmentModel()));
        this.SetInfoCompare(TEUIModelRef<FVM_AvatarEquipmentItemInfoCompare>(::FVM_AvatarEquipmentItemInfoCompare::Create(this.GetContext().Manager, local_8)));
        return;
    }
    void SetCurrentShowcase(const TEUIModelRef<FVM_AvatarShowcase> &inout InShowcase)
    {
        XLog(ELog(60), FString().Append("[VM_AvatarQuicklyEquip]SetCurrentShowcase."));
        this.SetShowcase(InShowcase);
        this.RefreshShowcaseAvatars();
        return;
    }
    void RefreshShowcaseAvatars()
    {
        XLog(ELog(60), FString().Append("[VM_AvatarQuicklyEquip]RefreshShowcaseAvatars."));
        if (this.GetShowcase())
        {
            TArray<FAvatarShowcaseEntry> local_14;
            FVM_AvatarInfo& local_16 = FEUIModelContainer::GetModel(this.GetSelectedAvatar()).opCall();
            if (local_16)
            {
                FAvatarShowcaseEntry local_118 = ::FAvatarShowcaseEntryUtils::FromAvatarInfo(TEUIModelRef<FVM_AvatarInfo>(local_16));
                if (this.GetCurEquipmentModel().IsValid())
                {
                    TEUIModelRef<FM_Equipment> local_120 = this.GetCurEquipmentModel();
                    if (GetEquipmentConfig().IsSet())
                    {
                        CastTo local_172;
                        TDataObjectPtr<FWeaponConfig> local_196 = local_172.opCall();
                        if (local_196)
                        {
                            local_118.WeaponConfig = local_196;
                        }
                    }
                }
                local_14.Add(local_118);
            }
            TArray<FAvatarShowcaseEntry> local_226;
            local_226 = this.GetShowCaseAvatarEntries();
            if ((!((local_226 == local_14))))
            {
                this.GetModify_ShowCaseAvatarEntries().Reset(0);
                this.GetModify_ShowCaseAvatarEntries().Append(local_14);
                if (!(local_14.IsEmpty()))
                {
                    XLog(ELog(60), FString().Append("[VM_AvatarQuicklyEquip]RefreshShowcaseAvatars. SetAvatarEntries."));
                    TEUIModelRef<FVM_AvatarShowcase> local_8 = this.GetShowcase();
                    this.GetShowCaseAvatarEntries().SetNextAvatarEntries();
                }
            }
        }
        return;
    }
    void RefreshInfoCompare(const TDataObjectPtr<FAvatarPrefabConfig> &inout CurrentAvatarCfg)
    {
        int local_64 = 0;
        if (this.GetInfoCompare().IsValid())
        {
            FDSAvatarEquipmentInfo local_112;
            FDSAvatarInfo local_54;
            FECSEntity local_58 = this.GetContext().GetLocalPlayer();
            if (local_64 && CurrentAvatarCfg.IsSet())
            {
                for (auto& local_80 : local_64.GetAvatarList())
                {
                    if (local_80.GetAvatarId() == 0)
                    {
                        local_54 = local_80;
                        break;
                    }
                }
            }
            if (local_54.GetEquipmentInfos().Find(EEquipSlotType(1), local_112))
            {
                TEUIModelRef<FM_Equipment> local_120 = ::FMS_EquipmentDataCache::Get(this.GetContext().Manager).GetEquipment(local_112.GetGuid());
                TEUIModelRef<FVM_EquipmentInfo> local_122 = TEUIModelRef<FVM_EquipmentInfo>(::FVM_EquipmentInfo::Create(this.GetContext().Manager, local_120));
                TEUIModelRef<FVM_AvatarEquipmentItemInfoCompare> local_2 = this.GetInfoCompare();
            }
        }
        return;
    }
    void RefreshAvatarInfoCurrentState()
    {
        int local_2 = 0;
        int local_12 = 0;
        FDSAvatarEquipmentInfo local_60;
        int local_1 = 0;
        FECSEntity local_6 = this.GetContext().GetLocalPlayer();
        if (local_12)
        {
            FMS_EquipmentDataCache& local_16 = ::FMS_EquipmentDataCache::Get(this.GetContext().Manager);
            for (auto& local_30 : local_12.GetAvatarList())
            {
                if (local_30.GetEquipmentInfos().Find(EEquipSlotType(1), local_60))
                {
                    if (local_16.GetItemUid(this.GetCurEquipmentModel()) == local_60.GetGuid())
                    {
                        this.SetbCurEquipmentEquiped(true);
                        local_2 = local_30.GetAvatarId();
                        local_1 = local_2;
                        break;
                    }
                }
            }
        }
        for (auto& local_82 : this.GetFilteredAvatars())
        {
            FVM_AvatarInfo& local_84 = FEUIModelContainer::GetModel(local_82).opCall();
            if (local_84)
            {
                TDataObjectPtr<FAvatarPrefabConfig> local_112 = local_84.GetAvatarConfig();
                FVM_AvatarInfoExtend& local_138 = FEUIModelContainer::GetModel(local_82).opCall();
                if (local_138)
                {
                    if (local_112.IsSet() && (local_1 == local_2))
                    {
                        local_138.SetAvatarInfoDisplayState(1);
                        continue;
                    }
                    local_138.SetAvatarInfoDisplayState(0);
                }
            }
        }
        return;
    }
    void OnAvatarEquipmentChanged(const FC_DSPlayerAvatarInfo &inout C_PlayerAvatarInfo)
    {
        FVM_AvatarInfo& local_2 = FEUIModelContainer::GetModel(this.GetSelectedAvatar()).opCall();
        if (local_2)
        {
            this.RefreshInfoCompare(local_2.GetAvatarConfig());
        }
        this.RefreshAvatarInfoCurrentState();
        return;
    }
    void OnFilteredAvatarsChanged()
    {
        XLog(ELog(60), FString().Append("[FVM_AvatarQuicklyEquip]OnFilteredAvatarsChanged."));
        this.RefreshAvatarInfoCurrentState();
        return;
    }
    void OnSelectedAvatarIndexChanged()
    {
        XLog(ELog(60), FString().Append("[FVM_AvatarQuicklyEquip]OnSelectedAvatarIndexChanged."));
        if (this.GetFilteredAvatars().IsValidIndex(this.GetSelectedAvatarIndex()))
        {
            this.SetSelectedAvatar(this.GetFilteredAvatars()[this.GetSelectedAvatarIndex()]);
            this.RefreshShowcaseAvatars();
            FVM_AvatarInfo& local_10 = FEUIModelContainer::GetModel(this.GetSelectedAvatar()).opCall();
            if (local_10)
            {
                this.RefreshInfoCompare(local_10.GetAvatarConfig());
            }
        }
        return;
    }
    void OnSelectAvatar(const int AvatarIndex)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void RefreshFilteredAvatarList()
    {
        FVM_AvatarInfo& local_32;
        XLog(ELog(60), FString().Append("[FVM_AvatarQuicklyEquip]RefreshFilteredAvatarList."));
        TArray<FEUIModelContainer>& local_8 = this.GetModify_FilteredAvatars();
        local_8.Reset(0);
        bool local_13 = this.GetCurEquipmentModel().IsValid();
        if (local_13)
        {
            TEUIModelRef<FVMS_PlayerOwnedAvatarInfo> local_16 = this.GetPlayerOwnedAvatarInfo();
            for (auto& local_30 : GetUnLockAvatarList())
            {
                if (local_32)
                {
                    if (!(local_32.GetAvatarConfig().IsSet()))
                    {
                        local_13 = false;
                    }
                    else
                    {
                        TEUIModelRef<FM_Equipment> local_12 = this.GetCurEquipmentModel();
                        local_13 = ::FEquipmentUtils::AvatarCanEquip(local_32.GetAvatarConfig(), GetEquipmentConfig());
                    }
                    if (local_13)
                    {
                        FEUIModelContainer local_48;
                        local_48.AddModel(local_30.opImplConv(), false);
                        local_48.AddModel(FEUIModelRef(::FVM_AvatarInfoExtend::Create(this.GetContext().Manager)), false);
                        local_8.Add(local_48);
                    }
                }
            }
        }
        if (this.GetFilteredAvatars().Num() > 0)
        {
            int local_54 = 0;
            if (FEUIModelContainer::GetModel(this.GetSelectedAvatar()).opCall())
            {
                int local_59 = 0;
                for (; local_59 < this.GetFilteredAvatars().Num(); ++local_59)
                {
                    if (FEUIModelContainer::GetModel(this.GetFilteredAvatars()[local_59]).opCall())
                    {
                        if (0 == 0)
                        {
                            local_54 = local_59;
                            break;
                        }
                    }
                }
            }
            this.SetSelectedAvatarIndex(local_54);
        }
        return;
    }
    void SwitchItemTraitCompare()
    {
        XLog(ELog(60), FString().Append("[VM_AvatarQuicklyEquip]SwitchItemTraitCompare."));
        if (this.GetInfoCompare().IsValid())
        {
            this.SetbItemTraitCompared(!(this.GetbItemTraitCompared()));
            TEUIModelRef<FVM_AvatarEquipmentItemInfoCompare> local_8 = this.GetInfoCompare();
            this.GetbItemTraitCompared().SetIsCompareOverviewShow();
        }
        return;
    }
    void OnItemEquip()
    {
        XLog(ELog(60), FString().Append("[FVM_AvatarQuicklyEquip]OnItemEquip."));
        FVM_AvatarInfo& local_8 = FEUIModelContainer::GetModel(this.GetSelectedAvatar()).opCall();
        if (local_8)
        {
            if (!(local_8.GetAvatarConfig().IsSet()))
            {
                return;
            }
            if (!(this.GetCurEquipmentModel().IsValid()))
            {
                return;
            }
            TEUIModelRef<FM_Equipment> local_16 = this.GetCurEquipmentModel();
            if (!(::FEquipmentUtils::AvatarCanEquip(local_8.GetAvatarConfig(), GetEquipmentConfig())))
            {
                return;
            }
            ::FEquipmentUtils::GS_RequestChangeEquipment(this.GetContext().GetLocalPlayer(), local_8.GetAvatarConfig(), ::FMS_EquipmentDataCache::Get(this.GetContext().Manager).GetItemUid(this.GetCurEquipmentModel()));
        }
        return;
    }
    TEUIModelRef<FM_Equipment> GetCurEquipmentModel() const property
    {
        this.TrackPropertyRead(0);
        return this.m_CurEquipmentModel;
    }
    void SetCurEquipmentModel(const TEUIModelRef<FM_Equipment> &inout __Value) property
    {
        TEUIModelRef<FM_Equipment> local_2;
        local_2 = this.m_CurEquipmentModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CurEquipmentModel = __Value;
        return;
    }
    int GetSelectedAvatarIndex() const property
    {
        this.TrackPropertyRead(1);
        return this.m_SelectedAvatarIndex;
    }
    void SetSelectedAvatarIndex(const int __Value) property
    {
        if (this.m_SelectedAvatarIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SelectedAvatarIndex = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetFilteredAvatars() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_FilteredAvatars() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetFilteredAvatars(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_FilteredAvatars = __Value;
        return;
    }
    FEUIModelContainer GetSelectedAvatar() const property
    {
        FEUIModelContainer __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FEUIModelContainer GetModify_SelectedAvatar() property
    {
        FEUIModelContainer __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetSelectedAvatar(const FEUIModelContainer &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_SelectedAvatar = __Value;
        return;
    }
    TEUIModelRef<FVMS_PlayerOwnedAvatarInfo> GetPlayerOwnedAvatarInfo() const property
    {
        this.TrackPropertyRead(4);
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
        this.MarkPropertyDirty(4);
        this.m_PlayerOwnedAvatarInfo = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarEquipmentItemInfoCompare> GetInfoCompare() const property
    {
        this.TrackPropertyRead(5);
        return this.m_InfoCompare;
    }
    void SetInfoCompare(const TEUIModelRef<FVM_AvatarEquipmentItemInfoCompare> &inout __Value) property
    {
        TEUIModelRef<FVM_AvatarEquipmentItemInfoCompare> local_2;
        local_2 = this.m_InfoCompare;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_InfoCompare = __Value;
        return;
    }
    bool GetbCurEquipmentEquiped() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bCurEquipmentEquiped;
    }
    void SetbCurEquipmentEquiped(const bool __Value) property
    {
        if (!(this.m_bCurEquipmentEquiped) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bCurEquipmentEquiped = __Value;
        return;
    }
    bool GetbItemTraitCompared() const property
    {
        this.TrackPropertyRead(7);
        return this.m_bItemTraitCompared;
    }
    void SetbItemTraitCompared(const bool __Value) property
    {
        if (!(this.m_bItemTraitCompared) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_bItemTraitCompared = __Value;
        return;
    }
    TEUIModelRef<FVM_AvatarShowcase> GetShowcase() const property
    {
        this.TrackPropertyRead(8);
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
        this.MarkPropertyDirty(8);
        this.m_Showcase = __Value;
        return;
    }
    const TArray<FAvatarShowcaseEntry> GetShowCaseAvatarEntries() const property
    {
        const TArray<FAvatarShowcaseEntry> __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    TArray<FAvatarShowcaseEntry> GetModify_ShowCaseAvatarEntries() property
    {
        TArray<FAvatarShowcaseEntry> __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetShowCaseAvatarEntries(const TArray<FAvatarShowcaseEntry> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_ShowCaseAvatarEntries = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_AvatarQuicklyEquip
{
    UPROPERTY()
    TEUIModelRef<FVM_AvatarQuicklyEquip> Self;

    __GeneratedProperties_FVM_AvatarQuicklyEquip()
    {
        return;
    }
}

namespace FVM_AvatarQuicklyEquip
{
FVM_AvatarQuicklyEquip& Create(const UObject ContextObject, const TEUIModelRef<FM_Equipment> &inout CurEquipmentModel)
{
    return FVM_AvatarQuicklyEquip::CreateByManager(EUIInternal::GetContextManager(ContextObject), CurEquipmentModel);
}
FVM_AvatarQuicklyEquip CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Equipment> &inout CurEquipmentModel)
{
    FVM_AvatarQuicklyEquip __r;
    TEUIModelRef<FVM_AvatarQuicklyEquip> local_6 = TEUIModelRef<FVM_AvatarQuicklyEquip>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_AvatarQuicklyEquip::ModelId, 0, CurEquipmentModel));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_AvatarQuicklyEquip;
}
void __OnAvatarEquipmentChanged(FVM_AvatarQuicklyEquip &inout Model, const FECSEntity &inout Entity, const FC_DSPlayerAvatarInfo &inout Component)
{
    Model.OnAvatarEquipmentChanged(Component);
    return;
}
void __OnFilteredAvatarsChanged(FVM_AvatarQuicklyEquip &inout Model)
{
    Model.OnFilteredAvatarsChanged();
    return;
}
void __OnSelectedAvatarIndexChanged(FVM_AvatarQuicklyEquip &inout Model)
{
    Model.OnSelectedAvatarIndexChanged();
    return;
}
void __RefreshFilteredAvatarList(FVM_AvatarQuicklyEquip &inout Model)
{
    Model.RefreshFilteredAvatarList();
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
TArray<FEUIModelContainer> __UIGetter_FilteredAvatars(const FVM_AvatarQuicklyEquip &inout Model)
{
    return Model.GetFilteredAvatars();
}
FEUIModelContainer __UIGetter_SelectedAvatar(const FVM_AvatarQuicklyEquip &inout Model)
{
    return Model.GetSelectedAvatar();
}
TEUIModelRef<FVM_AvatarEquipmentItemInfoCompare> __UIGetter_InfoCompare(const FVM_AvatarQuicklyEquip &inout Model)
{
    return Model.GetInfoCompare();
}
TEUIModelRef<FVM_AvatarQuicklyEquip> __UIGetter_Self(const FVM_AvatarQuicklyEquip &inout Model)
{
    return TEUIModelRef<FVM_AvatarQuicklyEquip>(Model);
}
int __IndexOf_CurEquipmentModel()
{
    return 0;
}
int __IndexOf_SelectedAvatarIndex()
{
    return 1;
}
int __IndexOf_FilteredAvatars()
{
    return 2;
}
int __IndexOf_SelectedAvatar()
{
    return 3;
}
int __IndexOf_PlayerOwnedAvatarInfo()
{
    return 4;
}
int __IndexOf_InfoCompare()
{
    return 5;
}
int __IndexOf_bCurEquipmentEquiped()
{
    return 6;
}
int __IndexOf_bItemTraitCompared()
{
    return 7;
}
int __IndexOf_Showcase()
{
    return 8;
}
int __IndexOf_ShowCaseAvatarEntries()
{
    return 9;
}
}
namespace __GeneratedProperties_FVM_AvatarQuicklyEquip
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
