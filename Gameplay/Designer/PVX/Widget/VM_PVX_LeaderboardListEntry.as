
namespace FVM_PVX_LeaderboardListEntry
{
    const int ModelId = 0;

}
struct FVM_PVX_LeaderboardListEntry : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FECSEntity m_PlayerEntity;
    UPROPERTY()
    FText m_PlayerDisplayName;
    UPROPERTY()
    FText m_PlayerIdText;
    UPROPERTY()
    int m_Kills;
    UPROPERTY()
    int m_Deaths;
    UPROPERTY()
    int m_Assists;
    UPROPERTY()
    FText m_KDAText;
    UPROPERTY()
    int m_TeamId;
    UPROPERTY()
    int m_CurrencyAmount;
    UPROPERTY()
    FSoftBrush m_AvatarIcon;
    UPROPERTY()
    bool m_bIsLocalPlayer;
    UPROPERTY()
    FFPTime m_LastLeaderboardRowRefreshTime;

    FVM_PVX_LeaderboardListEntry()
    {
        this.m_Kills = 0;
        this.m_Deaths = 0;
        this.m_Assists = 0;
        this.m_TeamId = -1;
        this.m_CurrencyAmount = 0;
        this.m_bIsLocalPlayer = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_PVX_LeaderboardListEntry' by default constructor.");
        return;
    }
    FVM_PVX_LeaderboardListEntry(const FVM_PVX_LeaderboardListEntry &inout Other)
    {
        this.m_Kills = 0;
        this.m_Deaths = 0;
        this.m_Assists = 0;
        this.m_TeamId = -1;
        this.m_CurrencyAmount = 0;
        this.m_bIsLocalPlayer = false;
        this.m_PlayerEntity = Other.m_PlayerEntity;
        this.m_PlayerDisplayName = Other.m_PlayerDisplayName;
        this.m_PlayerIdText = Other.m_PlayerIdText;
        this.m_Kills = int(Other.m_Kills);
        this.m_Deaths = int(Other.m_Deaths);
        this.m_Assists = int(Other.m_Assists);
        this.m_KDAText = Other.m_KDAText;
        this.m_TeamId = int(Other.m_TeamId);
        this.m_CurrencyAmount = int(Other.m_CurrencyAmount);
        this.m_AvatarIcon = Other.m_AvatarIcon;
        this.m_bIsLocalPlayer = Other.m_bIsLocalPlayer;
        this.m_LastLeaderboardRowRefreshTime = Other.m_LastLeaderboardRowRefreshTime;
        return;
    }
    FVM_PVX_LeaderboardListEntry(const FECSEntity &inout InPlayerEntity)
    {
        this.m_Kills = 0;
        this.m_Deaths = 0;
        this.m_Assists = 0;
        this.m_TeamId = -1;
        this.m_CurrencyAmount = 0;
        this.m_bIsLocalPlayer = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetPlayerEntity(InPlayerEntity);
        return;
    }
    FVM_PVX_LeaderboardListEntry& opAssign(const FVM_PVX_LeaderboardListEntry &inout Other)
    {
        this.m_PlayerEntity = Other.m_PlayerEntity;
        this.m_PlayerDisplayName = Other.m_PlayerDisplayName;
        this.m_PlayerIdText = Other.m_PlayerIdText;
        this.m_Kills = int(Other.m_Kills);
        this.m_Deaths = int(Other.m_Deaths);
        this.m_Assists = int(Other.m_Assists);
        this.m_KDAText = Other.m_KDAText;
        this.m_TeamId = int(Other.m_TeamId);
        this.m_CurrencyAmount = int(Other.m_CurrencyAmount);
        this.m_AvatarIcon = Other.m_AvatarIcon;
        this.m_bIsLocalPlayer = Other.m_bIsLocalPlayer;
        return Other.m_LastLeaderboardRowRefreshTime;
    }
    void PostConstruct()
    {
        this.RefreshDisplay();
        this.SetLastLeaderboardRowRefreshTime(this.GetContext().Time);
        return;
    }
    void TickLeaderboardRow()
    {
        if (!(::FVMS_PVX_MainHUD::Get(this.GetContext().Manager).GetbLeaderboardVisible()))
        {
            return;
        }
        if ((FFPTime(this.GetContext().Time) - this.GetLastLeaderboardRowRefreshTime()).ToSeconds() < 5.0)
        {
            return;
        }
        this.RefreshDisplay();
        this.SetLastLeaderboardRowRefreshTime(this.GetContext().Time);
        return;
    }
    void RefreshDisplay()
    {
        TMap<FECSEntity, FPVX_PlayerData> local_24 = ::FGameModeDataBridge::GetPVXPlayerInfoMap(ECS::GetECSWorld());
        if (!(local_24.Contains(this.GetPlayerEntity())))
        {
            return;
        }
        FPVX_PlayerData& local_48 = local_24[this.GetPlayerEntity()];
        FText local_64 = local_48.GetPlayerName().IsEmpty() ? NSLOCTEXT("PVX", "DefaultPlayerName", "зЋ©е®¶") : FText::FromString(local_48.GetPlayerName());
        this.SetPlayerDisplayName(local_64);
        int local_66 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(this.GetPlayerEntity());
        FNumberFormattingOptions local_72;
        this.SetPlayerIdText(FText::AsNumber(local_66, local_72));
        this.SetKills(local_48.GetKills());
        this.SetDeaths(local_48.GetDeaths());
        this.SetAssists(local_48.GetAssists());
        FString local_78 = (String::Conv_IntToString(this.GetKills()) + " / ");
        FString local_78_2 = ((local_78 + String::Conv_IntToString(this.GetDeaths())) + " / ");
        this.SetKDAText(FText::FromString((local_78_2 + String::Conv_IntToString(this.GetAssists()))));
        this.SetTeamId(local_48.GetTeamId());
        this.SetbIsLocalPlayer(this.GetContext().GetLocalPlayer().IsValid() && (FECSEntity(this.GetPlayerEntity()) == this.GetContext().GetLocalPlayer()));
        this.SetCurrencyAmount(local_48.GetCurrencyAmount());
        this.SetAvatarIcon(::GetDefaultedAvatarConfig(this.GetPlayerEntity()).AvatarIcon);
        return;
    }
    FECSEntity GetPlayerEntity() const property
    {
        FECSEntity __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FECSEntity GetModify_PlayerEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetPlayerEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_PlayerEntity = __Value;
        return;
    }
    const FText GetPlayerDisplayName() const property
    {
        const FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_PlayerDisplayName() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetPlayerDisplayName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_PlayerDisplayName = __Value;
        return;
    }
    const FText GetPlayerIdText() const property
    {
        const FText __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FText GetModify_PlayerIdText() property
    {
        FText __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetPlayerIdText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_PlayerIdText = __Value;
        return;
    }
    int GetKills() const property
    {
        this.TrackPropertyRead(3);
        return this.m_Kills;
    }
    void SetKills(const int __Value) property
    {
        if (this.m_Kills == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_Kills = __Value;
        return;
    }
    int GetDeaths() const property
    {
        this.TrackPropertyRead(4);
        return this.m_Deaths;
    }
    void SetDeaths(const int __Value) property
    {
        if (this.m_Deaths == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_Deaths = __Value;
        return;
    }
    int GetAssists() const property
    {
        this.TrackPropertyRead(5);
        return this.m_Assists;
    }
    void SetAssists(const int __Value) property
    {
        if (this.m_Assists == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_Assists = __Value;
        return;
    }
    const FText GetKDAText() const property
    {
        const FText __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FText GetModify_KDAText() property
    {
        FText __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetKDAText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_KDAText = __Value;
        return;
    }
    int GetTeamId() const property
    {
        this.TrackPropertyRead(7);
        return this.m_TeamId;
    }
    void SetTeamId(const int __Value) property
    {
        if (this.m_TeamId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_TeamId = __Value;
        return;
    }
    int GetCurrencyAmount() const property
    {
        this.TrackPropertyRead(8);
        return this.m_CurrencyAmount;
    }
    void SetCurrencyAmount(const int __Value) property
    {
        if (this.m_CurrencyAmount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_CurrencyAmount = __Value;
        return;
    }
    FSoftBrush GetAvatarIcon() const property
    {
        FSoftBrush __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    FSoftBrush GetModify_AvatarIcon() property
    {
        FSoftBrush __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetAvatarIcon(const FSoftBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_AvatarIcon = __Value;
        return;
    }
    bool GetbIsLocalPlayer() const property
    {
        this.TrackPropertyRead(10);
        return this.m_bIsLocalPlayer;
    }
    void SetbIsLocalPlayer(const bool __Value) property
    {
        if (!(this.m_bIsLocalPlayer) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_bIsLocalPlayer = __Value;
        return;
    }
    const FFPTime GetLastLeaderboardRowRefreshTime() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    FFPTime GetModify_LastLeaderboardRowRefreshTime() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetLastLeaderboardRowRefreshTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_LastLeaderboardRowRefreshTime = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_PVX_LeaderboardListEntry
{
    UPROPERTY()
    TEUIModelRef<FVM_PVX_LeaderboardListEntry> Self;

    __GeneratedProperties_FVM_PVX_LeaderboardListEntry()
    {
        return;
    }
}

namespace FVM_PVX_LeaderboardListEntry
{
FVM_PVX_LeaderboardListEntry& Create(const UObject ContextObject, const FECSEntity &inout PlayerEntity)
{
    return FVM_PVX_LeaderboardListEntry::CreateByManager(EUIInternal::GetContextManager(ContextObject), PlayerEntity);
}
FVM_PVX_LeaderboardListEntry CreateByManager(const UEUIManagerSubsystem Manager, const FECSEntity &inout PlayerEntity)
{
    FVM_PVX_LeaderboardListEntry __r;
    TEUIModelRef<FVM_PVX_LeaderboardListEntry> local_6 = TEUIModelRef<FVM_PVX_LeaderboardListEntry>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_PVX_LeaderboardListEntry::ModelId, 0, PlayerEntity));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "PlayerDisplayName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerIdText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Kills";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Deaths";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Assists";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "KDAText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TeamId";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CurrencyAmount";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AvatarIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsLocalPlayer";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_PVX_LeaderboardListEntry>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_PVX_LeaderboardListEntry;
    Result.TickFunction.FunctionName = "__TickLeaderboardRow";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_PVX_LeaderboardListEntry;
}
void __TickLeaderboardRow(FVM_PVX_LeaderboardListEntry &inout Model)
{
    Model.TickLeaderboardRow();
    return;
}
FText __UIGetter_PlayerDisplayName(const FVM_PVX_LeaderboardListEntry &inout Model)
{
    return Model.GetPlayerDisplayName();
}
FText __UIGetter_PlayerIdText(const FVM_PVX_LeaderboardListEntry &inout Model)
{
    return Model.GetPlayerIdText();
}
int __UIGetter_Kills(const FVM_PVX_LeaderboardListEntry &inout Model)
{
    return Model.GetKills();
}
int __UIGetter_Deaths(const FVM_PVX_LeaderboardListEntry &inout Model)
{
    return Model.GetDeaths();
}
int __UIGetter_Assists(const FVM_PVX_LeaderboardListEntry &inout Model)
{
    return Model.GetAssists();
}
FText __UIGetter_KDAText(const FVM_PVX_LeaderboardListEntry &inout Model)
{
    return Model.GetKDAText();
}
int __UIGetter_TeamId(const FVM_PVX_LeaderboardListEntry &inout Model)
{
    return Model.GetTeamId();
}
int __UIGetter_CurrencyAmount(const FVM_PVX_LeaderboardListEntry &inout Model)
{
    return Model.GetCurrencyAmount();
}
FSoftBrush __UIGetter_AvatarIcon(const FVM_PVX_LeaderboardListEntry &inout Model)
{
    return Model.GetAvatarIcon();
}
bool __UIGetter_bIsLocalPlayer(const FVM_PVX_LeaderboardListEntry &inout Model)
{
    return Model.GetbIsLocalPlayer();
}
TEUIModelRef<FVM_PVX_LeaderboardListEntry> __UIGetter_Self(const FVM_PVX_LeaderboardListEntry &inout Model)
{
    return TEUIModelRef<FVM_PVX_LeaderboardListEntry>(Model);
}
int __IndexOf_PlayerEntity()
{
    return 0;
}
int __IndexOf_PlayerDisplayName()
{
    return 1;
}
int __IndexOf_PlayerIdText()
{
    return 2;
}
int __IndexOf_Kills()
{
    return 3;
}
int __IndexOf_Deaths()
{
    return 4;
}
int __IndexOf_Assists()
{
    return 5;
}
int __IndexOf_KDAText()
{
    return 6;
}
int __IndexOf_TeamId()
{
    return 7;
}
int __IndexOf_CurrencyAmount()
{
    return 8;
}
int __IndexOf_AvatarIcon()
{
    return 9;
}
int __IndexOf_bIsLocalPlayer()
{
    return 10;
}
int __IndexOf_LastLeaderboardRowRefreshTime()
{
    return 11;
}
}
namespace __GeneratedProperties_FVM_PVX_LeaderboardListEntry
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
