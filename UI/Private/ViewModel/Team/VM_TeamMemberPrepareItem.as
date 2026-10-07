
namespace FVM_TeamMemberPrepareItem
{
    const int ModelId = 0;

}
struct FVM_TeamMemberPrepareItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_TeammateInfo> m_TeammateInfo;
    UPROPERTY()
    FText m_Name;
    UPROPERTY()
    bool m_bSelf;
    UPROPERTY()
    bool m_bHasSelectedAvatar;
    UPROPERTY()
    bool m_bReady;
    UPROPERTY()
    bool m_bReject;
    UPROPERTY()
    bool m_bCaptain;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerBasicItem> m_PlayerBasicItem;

    FVM_TeamMemberPrepareItem()
    {
        this.m_bSelf = false;
        this.m_bHasSelectedAvatar = false;
        this.m_bReady = false;
        this.m_bReject = false;
        this.m_bCaptain = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TeamMemberPrepareItem' by default constructor.");
        return;
    }
    FVM_TeamMemberPrepareItem(const FVM_TeamMemberPrepareItem &inout Other)
    {
        this.m_bSelf = false;
        this.m_bHasSelectedAvatar = false;
        this.m_bReady = false;
        this.m_bReject = false;
        this.m_bCaptain = false;
        this.m_TeammateInfo = Other.m_TeammateInfo;
        this.m_Name = Other.m_Name;
        this.m_bSelf = Other.m_bSelf;
        this.m_bHasSelectedAvatar = Other.m_bHasSelectedAvatar;
        this.m_bReady = Other.m_bReady;
        this.m_bReject = Other.m_bReject;
        this.m_bCaptain = Other.m_bCaptain;
        this.m_PlayerBasicItem = Other.m_PlayerBasicItem;
        return;
    }
    FVM_TeamMemberPrepareItem(const TEUIModelRef<FVM_TeammateInfo> &inout InTeammateInfo)
    {
        this.m_bSelf = false;
        this.m_bHasSelectedAvatar = false;
        this.m_bReady = false;
        this.m_bReject = false;
        this.m_bCaptain = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTeammateInfo(InTeammateInfo);
        return;
    }
    FVM_TeamMemberPrepareItem& opAssign(const FVM_TeamMemberPrepareItem &inout Other)
    {
        this.m_TeammateInfo = Other.m_TeammateInfo;
        this.m_Name = Other.m_Name;
        this.m_bSelf = Other.m_bSelf;
        this.m_bHasSelectedAvatar = Other.m_bHasSelectedAvatar;
        this.m_bReady = Other.m_bReady;
        this.m_bReject = Other.m_bReject;
        this.m_bCaptain = Other.m_bCaptain;
        return Other.m_PlayerBasicItem;
    }
    void PostConstruct()
    {
        TEUIModelRef<FM_Player> local_10;
        if (this.GetTeammateInfo().IsValid())
        {
            TEUIModelRef<FM_TeamMember> local_8;
            TEUIModelRef<FVM_PlayerBasicItem> local_6;
            TEUIModelRef<FVM_TeammateInfo> local_2 = this.GetTeammateInfo();
            local_6.GetPlayerBasicItem();
            this.SetPlayerBasicItem(local_6);
            TEUIModelRef<FVM_TeammateInfo> local_2_2 = this.GetTeammateInfo();
            local_8.GetTeamMember();
            bool local_3 = local_8.IsValid();
            if (!(local_3))
            {
                local_3 = false;
            }
            else
            {
                TEUIModelRef<FVM_TeammateInfo> local_2_3 = this.GetTeammateInfo();
                local_8.GetTeamMember();
                local_10.GetPlayer();
                local_3 = local_10.IsValid();
            }
            if (local_3)
            {
                FString local_16;
                TEUIModelRef<FVM_TeammateInfo> local_2_4 = this.GetTeammateInfo();
                local_8.GetTeamMember();
                local_10.GetPlayer();
                local_16.GetNickName();
                this.SetName(FText::FromString(local_16));
            }
            TEUIModelRef<FVM_TeammateInfo> local_2_5 = this.GetTeammateInfo();
            this.SetbSelf(IsSelf());
            bool local_3_2 = this.GetPlayerBasicItem().IsValid();
            if (!(local_3_2))
            {
                local_3_2 = false;
            }
            else
            {
                local_6 = this.GetPlayerBasicItem();
                local_3_2 = (GetAvatarID() > 0);
            }
            this.SetbHasSelectedAvatar(local_3_2);
            TEUIModelRef<FVM_TeammateInfo> local_2_6 = this.GetTeammateInfo();
            local_8.GetTeamMember();
            this.SetbCaptain(IsCaptain());
        }
        return;
    }
    void OnTeammatePlayerBasicItemChanged()
    {
        if (this.GetTeammateInfo().IsValid())
        {
            TEUIModelRef<FVM_PlayerBasicItem> local_6;
            TEUIModelRef<FVM_TeammateInfo> local_2 = this.GetTeammateInfo();
            local_6.GetPlayerBasicItem();
            this.SetPlayerBasicItem(local_6);
            bool local_3 = this.GetPlayerBasicItem().IsValid();
            if (!(local_3))
            {
                local_3 = false;
            }
            else
            {
                local_6 = this.GetPlayerBasicItem();
                local_3 = (GetAvatarID() > 0);
            }
            this.SetbHasSelectedAvatar(local_3);
        }
        return;
    }
    TEUIModelRef<FVM_TeammateInfo> GetTeammateInfo() const property
    {
        this.TrackPropertyRead(0);
        return this.m_TeammateInfo;
    }
    void SetTeammateInfo(const TEUIModelRef<FVM_TeammateInfo> &inout __Value) property
    {
        TEUIModelRef<FVM_TeammateInfo> local_2;
        local_2 = this.m_TeammateInfo;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TeammateInfo = __Value;
        return;
    }
    FText GetName() const property
    {
        FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_Name() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Name = __Value;
        return;
    }
    bool GetbSelf() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bSelf;
    }
    void SetbSelf(const bool __Value) property
    {
        if (!(this.m_bSelf) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bSelf = __Value;
        return;
    }
    bool GetbHasSelectedAvatar() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bHasSelectedAvatar;
    }
    void SetbHasSelectedAvatar(const bool __Value) property
    {
        if (!(this.m_bHasSelectedAvatar) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bHasSelectedAvatar = __Value;
        return;
    }
    bool GetbReady() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bReady;
    }
    void SetbReady(const bool __Value) property
    {
        if (!(this.m_bReady) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bReady = __Value;
        return;
    }
    bool GetbReject() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bReject;
    }
    void SetbReject(const bool __Value) property
    {
        if (!(this.m_bReject) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bReject = __Value;
        return;
    }
    bool GetbCaptain() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bCaptain;
    }
    void SetbCaptain(const bool __Value) property
    {
        if (!(this.m_bCaptain) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bCaptain = __Value;
        return;
    }
    TEUIModelRef<FVM_PlayerBasicItem> GetPlayerBasicItem() const property
    {
        this.TrackPropertyRead(7);
        return this.m_PlayerBasicItem;
    }
    void SetPlayerBasicItem(const TEUIModelRef<FVM_PlayerBasicItem> &inout __Value) property
    {
        TEUIModelRef<FVM_PlayerBasicItem> local_2;
        local_2 = this.m_PlayerBasicItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_PlayerBasicItem = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TeamMemberPrepareItem
{
    UPROPERTY()
    TEUIModelRef<FVM_TeamMemberPrepareItem> Self;

    __GeneratedProperties_FVM_TeamMemberPrepareItem()
    {
        return;
    }
}

namespace FVM_TeamMemberPrepareItem
{
FVM_TeamMemberPrepareItem& Create(const UObject ContextObject, const TEUIModelRef<FVM_TeammateInfo> &inout TeammateInfo)
{
    return FVM_TeamMemberPrepareItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), TeammateInfo);
}
FVM_TeamMemberPrepareItem CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FVM_TeammateInfo> &inout TeammateInfo)
{
    FVM_TeamMemberPrepareItem __r;
    TEUIModelRef<FVM_TeamMemberPrepareItem> local_6 = TEUIModelRef<FVM_TeamMemberPrepareItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TeamMemberPrepareItem::ModelId, 0, TeammateInfo));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_TeamMemberPrepareItem;
}
void __OnTeammatePlayerBasicItemChanged(FVM_TeamMemberPrepareItem &inout Model)
{
    Model.OnTeammatePlayerBasicItemChanged();
    return;
}
TEUIModelRef<FVM_TeammateInfo> __UIGetter_TeammateInfo(const FVM_TeamMemberPrepareItem &inout Model)
{
    return Model.GetTeammateInfo();
}
FText __UIGetter_Name(const FVM_TeamMemberPrepareItem &inout Model)
{
    return Model.GetName();
}
bool __UIGetter_bSelf(const FVM_TeamMemberPrepareItem &inout Model)
{
    return Model.GetbSelf();
}
bool __UIGetter_bHasSelectedAvatar(const FVM_TeamMemberPrepareItem &inout Model)
{
    return Model.GetbHasSelectedAvatar();
}
bool __UIGetter_bReady(const FVM_TeamMemberPrepareItem &inout Model)
{
    return Model.GetbReady();
}
bool __UIGetter_bReject(const FVM_TeamMemberPrepareItem &inout Model)
{
    return Model.GetbReject();
}
bool __UIGetter_bCaptain(const FVM_TeamMemberPrepareItem &inout Model)
{
    return Model.GetbCaptain();
}
TEUIModelRef<FVM_PlayerBasicItem> __UIGetter_PlayerBasicItem(const FVM_TeamMemberPrepareItem &inout Model)
{
    return Model.GetPlayerBasicItem();
}
TEUIModelRef<FVM_TeamMemberPrepareItem> __UIGetter_Self(const FVM_TeamMemberPrepareItem &inout Model)
{
    return TEUIModelRef<FVM_TeamMemberPrepareItem>(Model);
}
int __IndexOf_TeammateInfo()
{
    return 0;
}
int __IndexOf_Name()
{
    return 1;
}
int __IndexOf_bSelf()
{
    return 2;
}
int __IndexOf_bHasSelectedAvatar()
{
    return 3;
}
int __IndexOf_bReady()
{
    return 4;
}
int __IndexOf_bReject()
{
    return 5;
}
int __IndexOf_bCaptain()
{
    return 6;
}
int __IndexOf_PlayerBasicItem()
{
    return 7;
}
}
namespace __GeneratedProperties_FVM_TeamMemberPrepareItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
