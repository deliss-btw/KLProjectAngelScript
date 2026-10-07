
namespace FVM_PVP_TDM_KDAListEntry
{
    const int ModelId = 0;

}
struct FVM_PVP_TDM_KDAListEntry : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FECSEntity m_PlayerEntity;
    UPROPERTY()
    FString m_PlayerDisplayName;
    UPROPERTY()
    FString m_PlayerIdText;
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
    int m_DamageDealt;
    UPROPERTY()
    int m_DamageTaken;
    UPROPERTY()
    bool m_bIsLocalPlayer;
    UPROPERTY()
    FFPTime m_LastRowRefreshTime;

    FVM_PVP_TDM_KDAListEntry()
    {
        this.m_Kills = 0;
        this.m_Deaths = 0;
        this.m_Assists = 0;
        this.m_TeamId = 0;
        this.m_DamageDealt = 0;
        this.m_DamageTaken = 0;
        this.m_bIsLocalPlayer = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_PVP_TDM_KDAListEntry' by default constructor.");
        return;
    }
    FVM_PVP_TDM_KDAListEntry(const FVM_PVP_TDM_KDAListEntry &inout Other)
    {
        this.m_Kills = 0;
        this.m_Deaths = 0;
        this.m_Assists = 0;
        this.m_TeamId = 0;
        this.m_DamageDealt = 0;
        this.m_DamageTaken = 0;
        this.m_bIsLocalPlayer = false;
        this.m_PlayerEntity = Other.m_PlayerEntity;
        this.m_PlayerDisplayName = Other.m_PlayerDisplayName;
        this.m_PlayerIdText = Other.m_PlayerIdText;
        this.m_Kills = int(Other.m_Kills);
        this.m_Deaths = int(Other.m_Deaths);
        this.m_Assists = int(Other.m_Assists);
        this.m_KDAText = Other.m_KDAText;
        this.m_TeamId = int(Other.m_TeamId);
        this.m_DamageDealt = int(Other.m_DamageDealt);
        this.m_DamageTaken = int(Other.m_DamageTaken);
        this.m_bIsLocalPlayer = Other.m_bIsLocalPlayer;
        this.m_LastRowRefreshTime = Other.m_LastRowRefreshTime;
        return;
    }
    FVM_PVP_TDM_KDAListEntry(const FECSEntity &inout InPlayerEntity)
    {
        this.m_Kills = 0;
        this.m_Deaths = 0;
        this.m_Assists = 0;
        this.m_TeamId = 0;
        this.m_DamageDealt = 0;
        this.m_DamageTaken = 0;
        this.m_bIsLocalPlayer = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetPlayerEntity(InPlayerEntity);
        return;
    }
    FVM_PVP_TDM_KDAListEntry& opAssign(const FVM_PVP_TDM_KDAListEntry &inout Other)
    {
        this.m_PlayerEntity = Other.m_PlayerEntity;
        this.m_PlayerDisplayName = Other.m_PlayerDisplayName;
        this.m_PlayerIdText = Other.m_PlayerIdText;
        this.m_Kills = int(Other.m_Kills);
        this.m_Deaths = int(Other.m_Deaths);
        this.m_Assists = int(Other.m_Assists);
        this.m_KDAText = Other.m_KDAText;
        this.m_TeamId = int(Other.m_TeamId);
        this.m_DamageDealt = int(Other.m_DamageDealt);
        this.m_DamageTaken = int(Other.m_DamageTaken);
        this.m_bIsLocalPlayer = Other.m_bIsLocalPlayer;
        return Other.m_LastRowRefreshTime;
    }
    void PostConstruct()
    {
        this.RefreshDisplay();
        this.SetLastRowRefreshTime(this.GetContext().Time);
        return;
    }
    void TickRow()
    {
        if (!(::FVMS_PVP_TDM_HUD::Get(this.GetContext().Manager).GetbScoreboardVisible()))
        {
            return;
        }
        if ((FFPTime(this.GetContext().Time) - this.GetLastRowRefreshTime()).ToSeconds() < 2.0)
        {
            return;
        }
        this.RefreshDisplay();
        this.SetLastRowRefreshTime(this.GetContext().Time);
        return;
    }
    void RefreshDisplay()
    {
        bool local_12;
        int local_22 = 0;
        int local_32 = 0;
        int local_48 = 0;
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        FGameModePlayerScoreDataBase local_10;
        bool local_11 = false;
        if (FGameModeUtils::CVar_GameMode_UseUniversalSystem.GetBool())
        {
            Has local_16;
            local_12 = local_16.opCall();
            if (local_12)
            {
                if (local_22.GetPlayerScores().Contains(this.GetPlayerEntity()))
                {
                    local_10 = local_22.GetPlayerScores()[this.GetPlayerEntity()];
                    local_11 = true;
                }
            }
        }
        else
        {
            Has local_26;
            local_12 = local_26.opCall();
            if (local_12)
            {
                if (local_32.GetPlayerStatMap().Contains(this.GetPlayerEntity()))
                {
                    const FPVP_TDM_PlayerStat& local_34 = local_32.GetPlayerStatMap()[this.GetPlayerEntity()];
                    local_10.SetKills(local_34.GetKills());
                    local_10.SetDeaths(local_34.GetDeaths());
                    local_10.SetAssists(local_34.GetAssists());
                    local_10.SetDamageDealt(local_34.GetDamageDealt());
                    local_10.SetDamageTaken(local_34.GetDamageTaken());
                    local_11 = true;
                }
            }
            local_12 = !(local_11);
            if (!(local_12))
            {
                local_12 = false;
            }
            else
            {
                Has local_40;
                local_12 = local_40.opCall();
            }
            if (local_12)
            {
                if (local_48.GetPlayerStatMap().Contains(this.GetPlayerEntity()))
                {
                    const FPVP_TDM_PlayerStat& local_34_2 = local_48.GetPlayerStatMap()[this.GetPlayerEntity()];
                    local_10.SetKills(local_34_2.GetKills());
                    local_10.SetDeaths(local_34_2.GetDeaths());
                    local_10.SetAssists(local_34_2.GetAssists());
                    local_10.SetDamageDealt(local_34_2.GetDamageDealt());
                    local_10.SetDamageTaken(local_34_2.GetDamageTaken());
                    local_11 = true;
                }
            }
        }
        if (!(local_11))
        {
            return;
        }
        this.SetPlayerIdText(String::Conv_IntToString(::FASCommonUtils::GetPlayerUidFromPlayerEntity(this.GetPlayerEntity())));
        this.SetPlayerDisplayName(::FASCommonUtils::GetPlayerName(this.GetPlayerEntity()).ToString());
        FString local_66;
        if (this.GetPlayerDisplayName().IsEmpty())
        {
            if (this.GetPlayerIdText().IsEmpty())
            {
                local_66 = "зЋ©е®¶";
            }
            else
            {
                local_66 = FString().Append("зЋ©е®¶ ").Append(this.GetPlayerIdText());
            }
            this.SetPlayerDisplayName(local_66);
        }
        this.SetKills(local_10.GetKills());
        this.SetDeaths(local_10.GetDeaths());
        this.SetAssists(local_10.GetAssists());
        this.SetTeamId(this.GetPlayerTeamId(this.GetPlayerEntity()));
        this.SetDamageDealt(uint(local_10.GetDamageDealt()));
        this.SetDamageTaken(uint(local_10.GetDamageTaken()));
        FString local_54_2 = (((String::Conv_IntToString(this.GetKills()) + " / ") + String::Conv_IntToString(this.GetDeaths())) + " / ");
        this.SetKDAText(FText::FromString((local_54_2 + String::Conv_IntToString(this.GetAssists()))));
        this.SetbIsLocalPlayer(this.GetContext().GetLocalPlayer().IsValid() && (FECSEntity(this.GetPlayerEntity()) == this.GetContext().GetLocalPlayer()));
        return;
    }
    int GetPlayerTeamId(const FECSEntity &inout Entity) const
    {
        bool local_1;
        if (!(Entity.IsValid()))
        {
            local_1 = false;
        }
        else
        {
            Has local_6;
            local_1 = local_6.opCall();
        }
        if (local_1)
        {
            Get local_12;
            return local_12.opCall().GetTeam();
        }
        return 0;
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
    const FString GetPlayerDisplayName() const property
    {
        const FString __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FString GetModify_PlayerDisplayName() property
    {
        FString __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetPlayerDisplayName(const FString &inout __Value) property
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
    const FString GetPlayerIdText() const property
    {
        const FString __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FString GetModify_PlayerIdText() property
    {
        FString __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetPlayerIdText(const FString &inout __Value) property
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
    int GetDamageDealt() const property
    {
        this.TrackPropertyRead(8);
        return this.m_DamageDealt;
    }
    void SetDamageDealt(const int __Value) property
    {
        if (this.m_DamageDealt == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_DamageDealt = __Value;
        return;
    }
    int GetDamageTaken() const property
    {
        this.TrackPropertyRead(9);
        return this.m_DamageTaken;
    }
    void SetDamageTaken(const int __Value) property
    {
        if (this.m_DamageTaken == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_DamageTaken = __Value;
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
    const FFPTime GetLastRowRefreshTime() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    FFPTime GetModify_LastRowRefreshTime() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetLastRowRefreshTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_LastRowRefreshTime = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_PVP_TDM_KDAListEntry
{
    UPROPERTY()
    TEUIModelRef<FVM_PVP_TDM_KDAListEntry> Self;

    __GeneratedProperties_FVM_PVP_TDM_KDAListEntry()
    {
        return;
    }
}

namespace FVM_PVP_TDM_KDAListEntry
{
FVM_PVP_TDM_KDAListEntry& Create(const UObject ContextObject, const FECSEntity &inout PlayerEntity)
{
    return FVM_PVP_TDM_KDAListEntry::CreateByManager(EUIInternal::GetContextManager(ContextObject), PlayerEntity);
}
FVM_PVP_TDM_KDAListEntry CreateByManager(const UEUIManagerSubsystem Manager, const FECSEntity &inout PlayerEntity)
{
    FVM_PVP_TDM_KDAListEntry __r;
    TEUIModelRef<FVM_PVP_TDM_KDAListEntry> local_6 = TEUIModelRef<FVM_PVP_TDM_KDAListEntry>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_PVP_TDM_KDAListEntry::ModelId, 0, PlayerEntity));
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
    local_14.TypeName = "FString";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerIdText";
    local_14.TypeName = "FString";
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
    local_14.PropertyName = "DamageDealt";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DamageTaken";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsLocalPlayer";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_PVP_TDM_KDAListEntry>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_PVP_TDM_KDAListEntry;
    Result.TickFunction.FunctionName = "__TickRow";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_PVP_TDM_KDAListEntry;
}
void __TickRow(FVM_PVP_TDM_KDAListEntry &inout Model)
{
    Model.TickRow();
    return;
}
FString __UIGetter_PlayerDisplayName(const FVM_PVP_TDM_KDAListEntry &inout Model)
{
    return Model.GetPlayerDisplayName();
}
FString __UIGetter_PlayerIdText(const FVM_PVP_TDM_KDAListEntry &inout Model)
{
    return Model.GetPlayerIdText();
}
int __UIGetter_Kills(const FVM_PVP_TDM_KDAListEntry &inout Model)
{
    return Model.GetKills();
}
int __UIGetter_Deaths(const FVM_PVP_TDM_KDAListEntry &inout Model)
{
    return Model.GetDeaths();
}
int __UIGetter_Assists(const FVM_PVP_TDM_KDAListEntry &inout Model)
{
    return Model.GetAssists();
}
FText __UIGetter_KDAText(const FVM_PVP_TDM_KDAListEntry &inout Model)
{
    return Model.GetKDAText();
}
int __UIGetter_TeamId(const FVM_PVP_TDM_KDAListEntry &inout Model)
{
    return Model.GetTeamId();
}
int __UIGetter_DamageDealt(const FVM_PVP_TDM_KDAListEntry &inout Model)
{
    return Model.GetDamageDealt();
}
int __UIGetter_DamageTaken(const FVM_PVP_TDM_KDAListEntry &inout Model)
{
    return Model.GetDamageTaken();
}
bool __UIGetter_bIsLocalPlayer(const FVM_PVP_TDM_KDAListEntry &inout Model)
{
    return Model.GetbIsLocalPlayer();
}
TEUIModelRef<FVM_PVP_TDM_KDAListEntry> __UIGetter_Self(const FVM_PVP_TDM_KDAListEntry &inout Model)
{
    return TEUIModelRef<FVM_PVP_TDM_KDAListEntry>(Model);
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
int __IndexOf_DamageDealt()
{
    return 8;
}
int __IndexOf_DamageTaken()
{
    return 9;
}
int __IndexOf_bIsLocalPlayer()
{
    return 10;
}
int __IndexOf_LastRowRefreshTime()
{
    return 11;
}
}
namespace __GeneratedProperties_FVM_PVP_TDM_KDAListEntry
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
