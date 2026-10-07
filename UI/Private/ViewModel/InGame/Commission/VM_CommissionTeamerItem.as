
namespace FVM_CommissionTeamerItem
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature LikeThis = FEUIModelCallbackSignature();

}
struct FCommissionTeamerItemData
{
    UPROPERTY()
    FString PlayerNameCached;
    UPROPERTY()
    TDataObjectPtr<FAvatarPrefabConfig> AvatarPrefabConfig;
    UPROPERTY()
    int TeamIndex;
    UPROPERTY()
    uint PlayerID;


}

struct FVM_CommissionTeamerItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FString m_PlayerNameCached;
    UPROPERTY()
    TDataObjectPtr<FAvatarPrefabConfig> m_AvatarPrefabConfig;
    UPROPERTY()
    int m_TeamIndex;
    UPROPERTY()
    uint m_PlayerID;
    UPROPERTY()
    bool m_bHasTeam;
    UPROPERTY()
    TEUIModelRef<FM_Player> m_Player;
    UPROPERTY()
    int m_LikeCount;
    UPROPERTY()
    bool m_LikedBySelf;
    UPROPERTY()
    bool m_bHasLike;
    UPROPERTY()
    bool m_HasBestBadge;
    UPROPERTY()
    TEUIModelRef<FVM_CommissionBadgeItem> m_BestBadgeModel;

    FVM_CommissionTeamerItem()
    {
        this.m_TeamIndex = 0;
        this.m_PlayerID = 0;
        this.m_bHasTeam = false;
        this.m_LikeCount = 0;
        this.m_LikedBySelf = false;
        this.m_bHasLike = false;
        this.m_HasBestBadge = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommissionTeamerItem' by default constructor.");
        return;
    }
    FVM_CommissionTeamerItem(const FVM_CommissionTeamerItem &inout Other)
    {
        this.m_TeamIndex = 0;
        this.m_PlayerID = 0;
        this.m_bHasTeam = false;
        this.m_LikeCount = 0;
        this.m_LikedBySelf = false;
        this.m_bHasLike = false;
        this.m_HasBestBadge = false;
        this.m_PlayerNameCached = Other.m_PlayerNameCached;
        this.m_AvatarPrefabConfig = Other.m_AvatarPrefabConfig;
        this.m_TeamIndex = int(Other.m_TeamIndex);
        this.m_PlayerID = int(Other.m_PlayerID);
        this.m_bHasTeam = Other.m_bHasTeam;
        this.m_Player = Other.m_Player;
        this.m_LikeCount = int(Other.m_LikeCount);
        this.m_LikedBySelf = Other.m_LikedBySelf;
        this.m_bHasLike = Other.m_bHasLike;
        this.m_HasBestBadge = Other.m_HasBestBadge;
        this.m_BestBadgeModel = Other.m_BestBadgeModel;
        return;
    }
    FVM_CommissionTeamerItem(const FString &inout InPlayerNameCached, const TDataObjectPtr<FAvatarPrefabConfig> &inout InAvatarPrefabConfig, const int InTeamIndex, const uint InPlayerID)
    {
        this.m_TeamIndex = 0;
        this.m_PlayerID = 0;
        this.m_bHasTeam = false;
        this.m_LikeCount = 0;
        this.m_LikedBySelf = false;
        this.m_bHasLike = false;
        this.m_HasBestBadge = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetPlayerNameCached(InPlayerNameCached);
        this.SetAvatarPrefabConfig(InAvatarPrefabConfig);
        this.SetTeamIndex(InTeamIndex);
        this.SetPlayerID(InPlayerID);
        return;
    }
    FVM_CommissionTeamerItem& opAssign(const FVM_CommissionTeamerItem &inout Other)
    {
        this.m_PlayerNameCached = Other.m_PlayerNameCached;
        this.m_AvatarPrefabConfig = Other.m_AvatarPrefabConfig;
        this.m_TeamIndex = int(Other.m_TeamIndex);
        this.m_PlayerID = int(Other.m_PlayerID);
        this.m_bHasTeam = Other.m_bHasTeam;
        this.m_Player = Other.m_Player;
        this.m_LikeCount = int(Other.m_LikeCount);
        this.m_LikedBySelf = Other.m_LikedBySelf;
        this.m_bHasLike = Other.m_bHasLike;
        this.m_HasBestBadge = Other.m_HasBestBadge;
        return Other.m_BestBadgeModel;
    }
    FText GetPlayerName() const
    {
        return FText::FromString(this.GetPlayerNameCached());
    }
    FSoftBrush GetPlayerIcon() const
    {
        if (this.GetPlayer().IsValid())
        {
            if (this.GetAvatarPrefabConfig())
            {
            }
            else
            {
            }
        }
        return FSoftBrush();
    }
    int Tag_Number() const
    {
        return this.GetTeamIndex();
    }
    int Tag_ColorSwitchIndex() const
    {
        return (this.GetTeamIndex() - 1);
    }
    TEUIModelRef<FVM_Index> GetIndex() const
    {
        return TEUIModelRef<FVM_Index>(::FVM_Index::Create(this.GetContext().Manager, (this.GetTeamIndex() - 1)));
    }
    FText GetIndexText() const
    {
        return FText::Format(INVTEXT("{0}."), this.GetTeamIndex());
    }
    TEUIModelRef<FVM_ChatCommonAvatar> GetAvatar() const
    {
        return TEUIModelRef<FVM_ChatCommonAvatar>(::FVM_ChatCommonAvatar::Create(this.GetContext().Manager, this.GetAvatarPrefabConfig()));
    }
    void PostConstruct()
    {
        int local_10 = 0;
        this.SetLikedBySelf(false);
        this.SetHasBestBadge(false);
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        for (auto& local_24 : local_10.GetFinishTeamers())
        {
            if (local_24.GetPlayerID() == this.GetPlayerID())
            {
                if (local_24.GetRewardBadge().Num() > 0)
                {
                    this.SetHasBestBadge(true);
                    this.SetBestBadgeModel(TEUIModelRef<FVM_CommissionBadgeItem>(::FVM_CommissionBadgeItem::Create(this.GetContext().Manager, local_24.GetRewardBadge()[0])));
                }
                else
                {
                    this.SetHasBestBadge(false);
                }
            }
            this.SetbHasTeam((local_10.GetFinishTeamers().Num() > 1));
            this.SetPlayer(::FMS_CommissionData::Get(this.GetContext().Manager).GetCommissionFinishPlayerModel(this.GetPlayerID()));
        }
        return;
    }
    void OnLikeTeamer(const FCS_CommissionFinish &inout C_CommissionFinish)
    {
        if (!(C_CommissionFinish))
        {
            return;
        }
        for (auto& local_16 : C_CommissionFinish.GetFinishTeamers())
        {
            if (local_16.GetPlayerID() == this.GetPlayerID())
            {
                this.SetLikeCount(local_16.GetLikeCount());
                this.SetbHasLike((this.GetLikeCount() > 0));
                break;
            }
        }
        return;
    }
    void LikeThis()
    {
        if (!(this.GetLikedBySelf()))
        {
            this.SetLikedBySelf(true);
            ::CommissionUtils::CommissionFinishLikePlayer(this.GetContext().GetLocalPlayer(), this.GetPlayerID());
        }
        return;
    }
    FString GetPlayerNameCached() const property
    {
        FString __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FString GetModify_PlayerNameCached() property
    {
        FString __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetPlayerNameCached(const FString &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_PlayerNameCached = __Value;
        return;
    }
    const TDataObjectPtr<FAvatarPrefabConfig> GetAvatarPrefabConfig() const property
    {
        const TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TDataObjectPtr<FAvatarPrefabConfig> GetModify_AvatarPrefabConfig() property
    {
        TDataObjectPtr<FAvatarPrefabConfig> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetAvatarPrefabConfig(const TDataObjectPtr<FAvatarPrefabConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_AvatarPrefabConfig = __Value;
        return;
    }
    int GetTeamIndex() const property
    {
        this.TrackPropertyRead(2);
        return this.m_TeamIndex;
    }
    void SetTeamIndex(const int __Value) property
    {
        if (this.m_TeamIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_TeamIndex = __Value;
        return;
    }
    uint GetPlayerID() const property
    {
        this.TrackPropertyRead(3);
        return this.m_PlayerID;
    }
    void SetPlayerID(const uint __Value) property
    {
        if (this.m_PlayerID == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_PlayerID = __Value;
        return;
    }
    bool GetbHasTeam() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bHasTeam;
    }
    void SetbHasTeam(const bool __Value) property
    {
        if (!(this.m_bHasTeam) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bHasTeam = __Value;
        return;
    }
    TEUIModelRef<FM_Player> GetPlayer() const property
    {
        this.TrackPropertyRead(5);
        return this.m_Player;
    }
    void SetPlayer(const TEUIModelRef<FM_Player> &inout __Value) property
    {
        TEUIModelRef<FM_Player> local_2;
        local_2 = this.m_Player;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_Player = __Value;
        return;
    }
    int GetLikeCount() const property
    {
        this.TrackPropertyRead(6);
        return this.m_LikeCount;
    }
    void SetLikeCount(const int __Value) property
    {
        if (this.m_LikeCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_LikeCount = __Value;
        return;
    }
    bool GetLikedBySelf() const property
    {
        this.TrackPropertyRead(7);
        return this.m_LikedBySelf;
    }
    void SetLikedBySelf(const bool __Value) property
    {
        if (!(this.m_LikedBySelf) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_LikedBySelf = __Value;
        return;
    }
    bool GetbHasLike() const property
    {
        this.TrackPropertyRead(8);
        return this.m_bHasLike;
    }
    void SetbHasLike(const bool __Value) property
    {
        if (!(this.m_bHasLike) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_bHasLike = __Value;
        return;
    }
    bool GetHasBestBadge() const property
    {
        this.TrackPropertyRead(9);
        return this.m_HasBestBadge;
    }
    void SetHasBestBadge(const bool __Value) property
    {
        if (!(this.m_HasBestBadge) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_HasBestBadge = __Value;
        return;
    }
    TEUIModelRef<FVM_CommissionBadgeItem> GetBestBadgeModel() const property
    {
        this.TrackPropertyRead(10);
        return this.m_BestBadgeModel;
    }
    void SetBestBadgeModel(const TEUIModelRef<FVM_CommissionBadgeItem> &inout __Value) property
    {
        TEUIModelRef<FVM_CommissionBadgeItem> local_2;
        local_2 = this.m_BestBadgeModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_BestBadgeModel = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommissionTeamerItem
{
    UPROPERTY()
    FText PlayerName;
    UPROPERTY()
    FSoftBrush PlayerIcon;
    UPROPERTY()
    int Tag_Number;
    UPROPERTY()
    int Tag_ColorSwitchIndex;
    UPROPERTY()
    TEUIModelRef<FVM_Index> Index;
    UPROPERTY()
    FText IndexText;
    UPROPERTY()
    TEUIModelRef<FVM_ChatCommonAvatar> Avatar;
    UPROPERTY()
    TEUIModelRef<FVM_CommissionTeamerItem> Self;


}

namespace FVM_CommissionTeamerItem
{
FVM_CommissionTeamerItem& Create(const UObject ContextObject, const FString &inout PlayerNameCached, const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarPrefabConfig, const int TeamIndex, const uint PlayerID)
{
    return FVM_CommissionTeamerItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), PlayerNameCached, AvatarPrefabConfig, TeamIndex, PlayerID);
}
FVM_CommissionTeamerItem CreateByManager(const UEUIManagerSubsystem Manager, const FString &inout PlayerNameCached, const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarPrefabConfig, const int TeamIndex, const uint PlayerID)
{
    FVM_CommissionTeamerItem __r;
    TEUIModelRef<FVM_CommissionTeamerItem> local_6 = TEUIModelRef<FVM_CommissionTeamerItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommissionTeamerItem::ModelId, 0, PlayerNameCached, AvatarPrefabConfig, TeamIndex, PlayerID));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "bHasTeam";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LikeCount";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LikedBySelf";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bHasLike";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasBestBadge";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BestBadgeModel";
    local_14.TypeName = "TEUIModelRef<FVM_CommissionBadgeItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Tag_Number";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Tag_ColorSwitchIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Index";
    local_14.TypeName = "TEUIModelRef<FVM_Index>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IndexText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Avatar";
    local_14.TypeName = "TEUIModelRef<FVM_ChatCommonAvatar>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommissionTeamerItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommissionTeamerItem;
    FEUIModelMonitorDefine local_26;
    local_26.FunctionName = "__OnLikeTeamer";
    local_26.ComponentType = FCS_CommissionFinish;
    Result.MonitorFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommissionTeamerItem;
}
void __OnLikeTeamer(FVM_CommissionTeamerItem &inout Model, const FECSEntity &inout Entity, const FCS_CommissionFinish &inout Component)
{
    Get local_4;
    Model.OnLikeTeamer(local_4.opCall());
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
bool __UIGetter_bHasTeam(const FVM_CommissionTeamerItem &inout Model)
{
    return Model.GetbHasTeam();
}
int __UIGetter_LikeCount(const FVM_CommissionTeamerItem &inout Model)
{
    return Model.GetLikeCount();
}
bool __UIGetter_LikedBySelf(const FVM_CommissionTeamerItem &inout Model)
{
    return Model.GetLikedBySelf();
}
bool __UIGetter_bHasLike(const FVM_CommissionTeamerItem &inout Model)
{
    return Model.GetbHasLike();
}
bool __UIGetter_HasBestBadge(const FVM_CommissionTeamerItem &inout Model)
{
    return Model.GetHasBestBadge();
}
TEUIModelRef<FVM_CommissionBadgeItem> __UIGetter_BestBadgeModel(const FVM_CommissionTeamerItem &inout Model)
{
    return Model.GetBestBadgeModel();
}
FText __UIGetter_PlayerName(const FVM_CommissionTeamerItem &inout Model)
{
    return Model.GetPlayerName();
}
FSoftBrush __UIGetter_PlayerIcon(const FVM_CommissionTeamerItem &inout Model)
{
    return Model.GetPlayerIcon();
}
int __UIGetter_Tag_Number(const FVM_CommissionTeamerItem &inout Model)
{
    return Model.Tag_Number();
}
int __UIGetter_Tag_ColorSwitchIndex(const FVM_CommissionTeamerItem &inout Model)
{
    return Model.Tag_ColorSwitchIndex();
}
TEUIModelRef<FVM_Index> __UIGetter_Index(const FVM_CommissionTeamerItem &inout Model)
{
    return Model.GetIndex();
}
FText __UIGetter_IndexText(const FVM_CommissionTeamerItem &inout Model)
{
    return Model.GetIndexText();
}
TEUIModelRef<FVM_ChatCommonAvatar> __UIGetter_Avatar(const FVM_CommissionTeamerItem &inout Model)
{
    return Model.GetAvatar();
}
TEUIModelRef<FVM_CommissionTeamerItem> __UIGetter_Self(const FVM_CommissionTeamerItem &inout Model)
{
    return TEUIModelRef<FVM_CommissionTeamerItem>(Model);
}
int __IndexOf_PlayerNameCached()
{
    return 0;
}
int __IndexOf_AvatarPrefabConfig()
{
    return 1;
}
int __IndexOf_TeamIndex()
{
    return 2;
}
int __IndexOf_PlayerID()
{
    return 3;
}
int __IndexOf_bHasTeam()
{
    return 4;
}
int __IndexOf_Player()
{
    return 5;
}
int __IndexOf_LikeCount()
{
    return 6;
}
int __IndexOf_LikedBySelf()
{
    return 7;
}
int __IndexOf_bHasLike()
{
    return 8;
}
int __IndexOf_HasBestBadge()
{
    return 9;
}
int __IndexOf_BestBadgeModel()
{
    return 10;
}
}
namespace __GeneratedProperties_FVM_CommissionTeamerItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
