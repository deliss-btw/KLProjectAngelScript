
namespace FVM_SwitchSpecialty
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature AB_ConfirmSpecialty = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnSelectIndexChanged = FEUIModelCallbackSignature();

}
struct FVM_SwitchSpecialty : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Player> m_PlayerModel;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_AvatarInfo>> m_SpecialtyAvatarList;
    UPROPERTY()
    uint m_SelectedAvatarId;
    UPROPERTY()
    uint m_CurrentSpecialtyId;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_SpecialtyItem>> m_SpecialtyItems;
    UPROPERTY()
    bool m_bIsInChangingSpecialty;
    UPROPERTY()
    bool m_bIsChangeSucc;

    FVM_SwitchSpecialty()
    {
        this.m_SelectedAvatarId = 0;
        this.m_CurrentSpecialtyId = 0;
        this.m_bIsInChangingSpecialty = false;
        this.m_bIsChangeSucc = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_SwitchSpecialty(const FVM_SwitchSpecialty &inout Other)
    {
        this.m_SelectedAvatarId = 0;
        this.m_CurrentSpecialtyId = 0;
        this.m_bIsInChangingSpecialty = false;
        this.m_bIsChangeSucc = false;
        this.m_PlayerModel = Other.m_PlayerModel;
        this.m_SpecialtyAvatarList = Other.m_SpecialtyAvatarList;
        this.m_SelectedAvatarId = int(Other.m_SelectedAvatarId);
        this.m_CurrentSpecialtyId = int(Other.m_CurrentSpecialtyId);
        this.m_SpecialtyItems = Other.m_SpecialtyItems;
        this.m_bIsInChangingSpecialty = Other.m_bIsInChangingSpecialty;
        this.m_bIsChangeSucc = Other.m_bIsChangeSucc;
        return;
    }
    FVM_SwitchSpecialty opAssign(const FVM_SwitchSpecialty &inout Other)
    {
        FVM_SwitchSpecialty __r;
        this.m_PlayerModel = Other.m_PlayerModel;
        this.m_SpecialtyAvatarList = Other.m_SpecialtyAvatarList;
        this.m_SelectedAvatarId = int(Other.m_SelectedAvatarId);
        this.m_CurrentSpecialtyId = int(Other.m_CurrentSpecialtyId);
        this.m_SpecialtyItems = Other.m_SpecialtyItems;
        this.m_bIsInChangingSpecialty = Other.m_bIsInChangingSpecialty;
        this.m_bIsChangeSucc = Other.m_bIsChangeSucc;
        return __r;
    }
    void PostConstruct()
    {
        this.SetPlayerModel(::FMS_PlayerData::Get(this.GetManager()).GetLocalPlayerData());
        if (!(this.GetPlayerModel().IsValid()))
        {
            XError(ELog(16), "PlayerModel is not valid");
            return;
        }
        this.RefreshCurrentSpecialty();
        this.GenerateSpecialtyAvatarList();
        return;
    }
    void OnSpeicaltyChangedMsg(const FMsg_SpeicaltyChanged &inout Msg)
    {
        int local_1 = int(Msg.FromSpecialtyID);
        int local_3 = int(Msg.ToSpecialtyID);
        this.SetbIsInChangingSpecialty(false);
        this.SetbIsChangeSucc(true);
        if (local_1 == this.GetCurrentSpecialtyId())
        {
            this.SetCurrentSpecialtyId(local_3);
            FCommonTipsParam local_12;
            ::CommonPopup::Tips(NSLOCTEXT("Specialty", "ChangeSpecialtySucc", "дё“й•їе€‡жЌўж€ђеЉџ"), local_12);
        }
        return;
    }
    void RefreshCurrentSpecialty()
    {
        this.SetCurrentSpecialtyId(0);
        if (this.GetPlayerModel().IsValid())
        {
            TEUIModelRef<FM_Player> local_4 = this.GetPlayerModel();
            this.SetCurrentSpecialtyId(GetPlayerSpecialtyID());
        }
        return;
    }
    void GenerateSpecialtyAvatarList()
    {
        bool local_25 = false;
        this.GetModify_SpecialtyAvatarList().Empty(0);
        this.GetModify_SpecialtyItems().Empty(0);
        TArray<TEUIModelRef<FVM_AvatarInfo>> local_6 = ::FVMS_PlayerOwnedAvatarInfo::Get(this.GetManager()).GetAllConfigAvatars();
        for (auto& local_24 : local_6)
        {
            if (!(local_24.IsValid()) || !(GetAvatarConfig().IsSet()))
            {
                continue;
            }
            if (local_25)
            {
                this.GetModify_SpecialtyAvatarList().Add(local_24);
                TEUIModelRef<FVM_SpecialtyItem> local_28 = TEUIModelRef<FVM_SpecialtyItem>(::FVM_SpecialtyItem::Create(this.GetManager(), local_24));
                if (0 == this.GetCurrentSpecialtyId())
                {
                    this.SetSelectedAvatarId(this.GetCurrentSpecialtyId());
                    local_25 = true;
                    local_25.SetbSelected();
                }
                this.GetModify_SpecialtyItems().Add(local_28);
            }
        }
        return;
    }
    void AB_ConfirmSpecialty()
    {
        int local_2 = 0;
        int local_1 = this.GetSelectedAvatarId();
        if (local_1 == 0)
        {
            return;
        }
        if (this.GetbIsInChangingSpecialty())
        {
            return;
        }
        bool local_3 = this.GetPlayerModel().IsValid();
        if (!(local_3))
        {
            local_3 = false;
        }
        else
        {
            TEUIModelRef<FM_Player> local_6 = this.GetPlayerModel();
            local_2 = this.GetSelectedAvatarId();
            local_3 = (GetPlayerSpecialtyID() == local_2);
        }
        if (local_3)
        {
            FCommonTipsParam local_16;
            ::CommonPopup::Tips(NSLOCTEXT("Specialty", "AlreadyCurrentSpecialty", "еЅ“е‰Ќе·ІжЇиЇҐдё“й•ї"), local_16);
            return;
        }
        for (auto& local_30 : this.GetSpecialtyAvatarList())
        {
            if (!(local_30.IsValid()) || !(GetAvatarConfig().IsSet()))
            {
                continue;
            }
            if (local_2 == this.GetSelectedAvatarId())
            {
                true.ChangeToSpecialty();
                if (::UGameClientConnectionSubsystem::Get() != nullptr && ::UGameClientConnectionSubsystem::Get().IsConnectedToGameServer())
                {
                    this.SetbIsInChangingSpecialty(true);
                }
                else
                {
                    this.SetbIsChangeSucc(true);
                }
                break;
            }
        }
        return;
    }
    void OnSelectIndexChanged(const int Index)
    {
        TEUIModelRef<FVM_AvatarInfo> local_4;
        int local_6 = 0;
        bool local_1 = !(this.GetSpecialtyItems().IsValidIndex(Index)) || !(this.GetSpecialtyItems()[Index].IsValid());
        if (local_1)
        {
            local_1 = true;
        }
        else
        {
            local_4.GetAvatarInfo();
            local_1 = !(local_4.IsValid());
        }
        if (local_1)
        {
            local_1 = true;
        }
        else
        {
            local_4.GetAvatarInfo();
            local_1 = !(GetAvatarConfig().IsSet());
        }
        if (local_1)
        {
            return;
        }
        local_4.GetAvatarInfo();
        int local_5 = local_6;
        this.RefreshSelectedAvatar(local_5);
        return;
    }
    void RefreshSelectedAvatar(const uint InSelectedAvatarId)
    {
        TEUIModelRef<FVM_AvatarInfo> local_18;
        int local_21 = 0;
        this.SetSelectedAvatarId(InSelectedAvatarId);
        for (auto& local_16 : this.GetSpecialtyItems())
        {
            bool local_13 = !(local_16.IsValid());
            if (local_13)
            {
                local_13 = true;
            }
            else
            {
                local_18.GetAvatarInfo();
                local_13 = !(local_18.IsValid());
            }
            if (local_13)
            {
                local_13 = true;
            }
            else
            {
                local_18.GetAvatarInfo();
                local_13 = !(GetAvatarConfig().IsSet());
            }
            if (local_13)
            {
                continue;
            }
            local_18.GetAvatarInfo();
            if (local_21 != this.GetSelectedAvatarId())
            {
                local_13 = false;
            }
            else
            {
                local_21 = this.GetSelectedAvatarId();
                local_13 = (local_21 != 0);
            }
            local_13.SetbSelected();
        }
        return;
    }
    TEUIModelRef<FM_Player> GetPlayerModel() const property
    {
        this.TrackPropertyRead(0);
        return this.m_PlayerModel;
    }
    void SetPlayerModel(const TEUIModelRef<FM_Player> &inout __Value) property
    {
        TEUIModelRef<FM_Player> local_2;
        local_2 = this.m_PlayerModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_PlayerModel = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_AvatarInfo>> GetSpecialtyAvatarList() const property
    {
        const TArray<TEUIModelRef<FVM_AvatarInfo>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TEUIModelRef<FVM_AvatarInfo>> GetModify_SpecialtyAvatarList() property
    {
        TArray<TEUIModelRef<FVM_AvatarInfo>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetSpecialtyAvatarList(const TArray<TEUIModelRef<FVM_AvatarInfo>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SpecialtyAvatarList = __Value;
        return;
    }
    uint GetSelectedAvatarId() const property
    {
        this.TrackPropertyRead(2);
        return this.m_SelectedAvatarId;
    }
    void SetSelectedAvatarId(const uint __Value) property
    {
        if (this.m_SelectedAvatarId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_SelectedAvatarId = __Value;
        return;
    }
    uint GetCurrentSpecialtyId() const property
    {
        this.TrackPropertyRead(3);
        return this.m_CurrentSpecialtyId;
    }
    void SetCurrentSpecialtyId(const uint __Value) property
    {
        if (this.m_CurrentSpecialtyId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CurrentSpecialtyId = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_SpecialtyItem>> GetSpecialtyItems() const property
    {
        const TArray<TEUIModelRef<FVM_SpecialtyItem>> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TArray<TEUIModelRef<FVM_SpecialtyItem>> GetModify_SpecialtyItems() property
    {
        TArray<TEUIModelRef<FVM_SpecialtyItem>> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetSpecialtyItems(const TArray<TEUIModelRef<FVM_SpecialtyItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_SpecialtyItems = __Value;
        return;
    }
    bool GetbIsInChangingSpecialty() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bIsInChangingSpecialty;
    }
    void SetbIsInChangingSpecialty(const bool __Value) property
    {
        if (!(this.m_bIsInChangingSpecialty) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bIsInChangingSpecialty = __Value;
        return;
    }
    bool GetbIsChangeSucc() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bIsChangeSucc;
    }
    void SetbIsChangeSucc(const bool __Value) property
    {
        if (!(this.m_bIsChangeSucc) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bIsChangeSucc = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_SwitchSpecialty
{
    UPROPERTY()
    TEUIModelRef<FVM_SwitchSpecialty> Self;

    __GeneratedProperties_FVM_SwitchSpecialty()
    {
        return;
    }
}

namespace FVM_SwitchSpecialty
{
FVM_SwitchSpecialty& Create(const UObject ContextObject)
{
    return FVM_SwitchSpecialty::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_SwitchSpecialty CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_SwitchSpecialty __r;
    TEUIModelRef<FVM_SwitchSpecialty> local_6 = TEUIModelRef<FVM_SwitchSpecialty>(EUIInternal::MakeModelWithManager(Manager, FVM_SwitchSpecialty::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "SpecialtyItems";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_SpecialtyItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_SwitchSpecialty>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_SwitchSpecialty;
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__OnSpeicaltyChangedMsg";
    local_26.MessageTypeName = "Msg_SpeicaltyChanged";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    FEUIModelEffectDefine local_34;
    local_34.FunctionName = "RefreshCurrentSpecialty";
    Result.EffectFunctions.Add(local_34);
    local_34.FunctionName = "GenerateSpecialtyAvatarList";
    Result.EffectFunctions.Add(local_34);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_SwitchSpecialty;
}
void __OnSpeicaltyChangedMsg(FVM_SwitchSpecialty &inout Model, const FMsg_SpeicaltyChanged &inout Message)
{
    Model.OnSpeicaltyChangedMsg(Message);
    return;
}
TArray<TEUIModelRef<FVM_SpecialtyItem>> __UIGetter_SpecialtyItems(const FVM_SwitchSpecialty &inout Model)
{
    return Model.GetSpecialtyItems();
}
TEUIModelRef<FVM_SwitchSpecialty> __UIGetter_Self(const FVM_SwitchSpecialty &inout Model)
{
    return TEUIModelRef<FVM_SwitchSpecialty>(Model);
}
int __IndexOf_PlayerModel()
{
    return 0;
}
int __IndexOf_SpecialtyAvatarList()
{
    return 1;
}
int __IndexOf_SelectedAvatarId()
{
    return 2;
}
int __IndexOf_CurrentSpecialtyId()
{
    return 3;
}
int __IndexOf_SpecialtyItems()
{
    return 4;
}
int __IndexOf_bIsInChangingSpecialty()
{
    return 5;
}
int __IndexOf_bIsChangeSucc()
{
    return 6;
}
}
namespace __GeneratedProperties_FVM_SwitchSpecialty
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
