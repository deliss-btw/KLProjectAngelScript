
namespace FVMS_PVP_Lobby
{
    const int ModelId = 0;

}
struct FVMS_PVP_Lobby : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    FText m_RoomIDText;
    UPROPERTY()
    bool m_bIsHost;
    UPROPERTY()
    bool m_bAllReady;
    UPROPERTY()
    bool m_bShouldHide;
    UPROPERTY()
    int m_SelectedGameRuleIndex;
    UPROPERTY()
    bool m_bPendingReady;
    UPROPERTY()
    bool m_bPendingGo;
    UPROPERTY()
    bool m_bPendingSwitchTeam;
    UPROPERTY()
    uint8 m_PendingSwitchTeamID;
    UPROPERTY()
    bool m_bPendingExit;
    UPROPERTY()
    bool m_bPendingGameRuleChange;
    UPROPERTY()
    EPVPGameRuleType m_PendingGameRuleType;
    UPROPERTY()
    bool m_bPendingAddBot;
    UPROPERTY()
    uint8 m_PendingAddBotTeamID;
    UPROPERTY()
    bool m_bPendingRemoveBot;
    UPROPERTY()
    uint8 m_PendingRemoveBotTeamID;

    FVMS_PVP_Lobby()
    {
        this.m_bIsHost = false;
        this.m_bAllReady = false;
        this.m_bShouldHide = false;
        this.m_SelectedGameRuleIndex = 0;
        this.m_bPendingReady = false;
        this.m_bPendingGo = false;
        this.m_bPendingSwitchTeam = false;
        this.m_PendingSwitchTeamID = false;
        this.m_bPendingExit = false;
        this.m_bPendingGameRuleChange = false;
        this.m_PendingGameRuleType = EPVPGameRuleType(1);
        this.m_bPendingAddBot = false;
        this.m_PendingAddBotTeamID = false;
        this.m_bPendingRemoveBot = false;
        this.m_PendingRemoveBotTeamID = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_PVP_Lobby(const FVMS_PVP_Lobby &inout Other)
    {
        this.m_bIsHost = false;
        this.m_bAllReady = false;
        this.m_bShouldHide = false;
        this.m_SelectedGameRuleIndex = 0;
        this.m_bPendingReady = false;
        this.m_bPendingGo = false;
        this.m_bPendingSwitchTeam = false;
        this.m_PendingSwitchTeamID = false;
        this.m_bPendingExit = false;
        this.m_bPendingGameRuleChange = false;
        this.m_PendingGameRuleType = EPVPGameRuleType(1);
        this.m_bPendingAddBot = false;
        this.m_PendingAddBotTeamID = false;
        this.m_bPendingRemoveBot = false;
        this.m_PendingRemoveBotTeamID = false;
        this.m_RoomIDText = Other.m_RoomIDText;
        this.m_bIsHost = Other.m_bIsHost;
        this.m_bAllReady = Other.m_bAllReady;
        this.m_bShouldHide = Other.m_bShouldHide;
        this.m_SelectedGameRuleIndex = int(Other.m_SelectedGameRuleIndex);
        this.m_bPendingReady = Other.m_bPendingReady;
        this.m_bPendingGo = Other.m_bPendingGo;
        this.m_bPendingSwitchTeam = Other.m_bPendingSwitchTeam;
        this.m_PendingSwitchTeamID = (int(Other.m_PendingSwitchTeamID) != 0);
        this.m_bPendingExit = Other.m_bPendingExit;
        this.m_bPendingGameRuleChange = Other.m_bPendingGameRuleChange;
        this.m_PendingGameRuleType = Other.m_PendingGameRuleType;
        this.m_bPendingAddBot = Other.m_bPendingAddBot;
        this.m_PendingAddBotTeamID = (int(Other.m_PendingAddBotTeamID) != 0);
        this.m_bPendingRemoveBot = Other.m_bPendingRemoveBot;
        this.m_PendingRemoveBotTeamID = (int(Other.m_PendingRemoveBotTeamID) != 0);
        return;
    }
    FVMS_PVP_Lobby opAssign(const FVMS_PVP_Lobby &inout Other)
    {
        FVMS_PVP_Lobby __r;
        this.m_RoomIDText = Other.m_RoomIDText;
        this.m_bIsHost = Other.m_bIsHost;
        this.m_bAllReady = Other.m_bAllReady;
        this.m_bShouldHide = Other.m_bShouldHide;
        this.m_SelectedGameRuleIndex = int(Other.m_SelectedGameRuleIndex);
        this.m_bPendingReady = Other.m_bPendingReady;
        this.m_bPendingGo = Other.m_bPendingGo;
        this.m_bPendingSwitchTeam = Other.m_bPendingSwitchTeam;
        this.m_PendingSwitchTeamID = (int(Other.m_PendingSwitchTeamID) != 0);
        this.m_bPendingExit = Other.m_bPendingExit;
        this.m_bPendingGameRuleChange = Other.m_bPendingGameRuleChange;
        this.m_PendingGameRuleType = Other.m_PendingGameRuleType;
        this.m_bPendingAddBot = Other.m_bPendingAddBot;
        this.m_PendingAddBotTeamID = (int(Other.m_PendingAddBotTeamID) != 0);
        this.m_bPendingRemoveBot = Other.m_bPendingRemoveBot;
        this.m_PendingRemoveBotTeamID = (int(Other.m_PendingRemoveBotTeamID) != 0);
        return __r;
    }
    void OnGameStatesChanged(const FCS_GameStates &inout Data)
    {
        this.SetbShouldHide((int(Data.GetStageType()) >= 2));
        return;
    }
    void OnMatchDataChanged(const FCS_PVP_MatchData &inout Data)
    {
        this.OnLobbyDataRefresh();
        return;
    }
    void OnSessionDataChanged(const FCS_PVP_SessionData &inout Data)
    {
        this.OnLobbyDataRefresh();
        return;
    }
    void OnMatchDataChanged_Universal(const FCS_GameMode_MatchData &inout Data)
    {
        this.OnLobbyDataRefresh();
        return;
    }
    void OnLobbyDataRefresh()
    {
        bool local_5 = !(this.GetContext().GetLocalPlayer().IsValid());
        if (local_5)
        {
            return;
        }
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        TMap<uint, FPVPLobbyPlayerEntry> local_30;
        bool local_5_2 = !(::FGameModeDataBridge::GetPVPLobbyPlayerEntries(local_8, local_30));
        if (local_5_2)
        {
            return;
        }
        int local_32 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(this.GetContext().GetLocalPlayer());
        bool local_5_3 = false;
        bool local_33 = local_5_3;
        for (auto& local_52 : local_30)
        {
            local_52;
            if (local_5_3)
            {
                local_5_3 = true;
                local_33 = local_5_3;
                break;
            }
        }
        if (local_33)
        {
            bool local_5_4 = local_30.Contains(local_32);
            if (!(local_5_4))
            {
                local_5_4 = false;
            }
            else
            {
                local_5_4 = local_30[local_32].bWantsBackToRoom;
            }
            if (local_5_4)
            {
                this.SetbShouldHide(false);
            }
        }
        return;
    }
    void TickLobby()
    {
        bool local_69;
        int local_76 = 0;
        bool local_5 = !(this.GetContext().GetLocalPlayer().IsValid());
        if (local_5)
        {
            return;
        }
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        bool local_5_2 = !(::FGameModeDataBridge::HasPVPLobbyData(local_8));
        if (local_5_2)
        {
            return;
        }
        if (this.GetbPendingExit())
        {
            this.SetbPendingExit(false);
            ::FGameConnectionUtils::UICallBackToCityLevel(this.GetContext().GetLocalPlayer());
            return;
        }
        int local_12 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(this.GetContext().GetLocalPlayer());
        int local_11 = ::FGameModeDataBridge::GetPVPHostPlayerUID(local_8);
        int local_13 = ::FGameModeDataBridge::GetPVPMatchRoomID(local_8);
        EPVPGameRuleType local_16 = ::FGameModeDataBridge::GetPVPSelectedGameRule(local_8);
        bool local_5_3 = (local_12 == local_11);
        this.SetbIsHost(local_5_3);
        this.SetRoomIDText(FText::FromString(FString().Append("ROOM ID: ").Append(local_13)));
        int local_27 = int(local_16) == 2 ? 1 : 0;
        this.SetSelectedGameRuleIndex(local_27);
        TMap<uint, FPVPLobbyPlayerEntry> local_48;
        ::FGameModeDataBridge::GetPVPLobbyPlayerEntries(local_8, local_48);
        bool local_5_4 = false;
        bool local_49 = local_5_4;
        for (auto& local_68 : local_48)
        {
            if (local_5_4)
            {
                local_5_4 = true;
                local_49 = local_5_4;
                break;
            }
        }
        if (local_49)
        {
            bool local_5_5 = local_48.Contains(local_12);
            if (!(local_5_5))
            {
                local_5_5 = false;
            }
            else
            {
                local_5_5 = local_48[local_12].bWantsBackToRoom;
            }
            this.SetbShouldHide(!(local_5_5));
        }
        if (this.GetbPendingReady())
        {
            this.SetbPendingReady(false);
            FECSEntity local_4 = this.GetContext().GetLocalPlayer();
            FFPTime local_82 = FFPTime(-1);
            FECSEntity local_4_2 = this.GetContext().GetLocalPlayer();
            FCE_PlayerSetReady local_84;
            local_84.bReady = !(local_76.GetbReady());
        }
        if (this.GetbPendingGo())
        {
            this.SetbPendingGo(false);
            FFPTime local_82_2 = FFPTime(-1);
            FECSEntity local_4_3 = this.GetContext().GetLocalPlayer();
            SendEvent local_88;
            local_88.opCall(local_82_2);
        }
        if (this.GetbPendingSwitchTeam())
        {
            this.SetbPendingSwitchTeam(false);
            if (local_48.Contains(local_12) && (local_48[local_12].TeamID != this.GetPendingSwitchTeamID()))
            {
                FFPTime local_82_3 = FFPTime(-1);
                FECSEntity local_4_4 = this.GetContext().GetLocalPlayer();
                int local_90 = this.GetPendingSwitchTeamID();
                FCE_PVPPlayerSwitchTeam local_96;
                local_96.NewTeamID = (local_90 != 0);
            }
        }
        if (this.GetbPendingGameRuleChange())
        {
            this.SetbPendingGameRuleChange(false);
            if (this.GetbIsHost() && (int(this.GetPendingGameRuleType()) != int(local_16)))
            {
                FFPTime local_82_4 = FFPTime(-1);
                FECSEntity local_4_5 = this.GetContext().GetLocalPlayer();
                EPVPGameRuleType local_15 = this.GetPendingGameRuleType();
                FCE_PVPPlayerSwitchGameRule local_102;
                local_102.NewGameRuleType = EPVPGameRuleType(local_15);
            }
        }
        if (this.GetbPendingAddBot())
        {
            this.SetbPendingAddBot(false);
            FFPTime local_82_5 = FFPTime(-1);
            FECSEntity local_4_6 = this.GetContext().GetLocalPlayer();
            int local_89 = this.GetPendingAddBotTeamID();
            FCE_PVPAddBot local_108;
            local_108.TeamID = (local_89 != 0);
        }
        if (this.GetbPendingRemoveBot())
        {
            this.SetbPendingRemoveBot(false);
            FFPTime local_82_6 = FFPTime(-1);
            FECSEntity local_4_7 = this.GetContext().GetLocalPlayer();
            int local_90_2 = this.GetPendingRemoveBotTeamID();
            FCE_PVPRemoveBot local_114;
            local_114.TeamID = (local_90_2 != 0);
        }
        TMap<uint, FECSEntity> local_134;
        FECSRuntimeView local_172 = local_8.GetRuntimeView(EECSRuntimeViewType(2));
        Include local_176;
        local_176.opCall();
        Include local_180;
        local_180.opCall();
        FECSRuntimeViewIterator local_214 = local_172.Iterator();
        for (; local_214.CanProceed;)
        {
            const FECSEntity& local_250 = local_214.Proceed();
            int local_14 = ::FASCommonUtils::GetPlayerUidFromPlayerEntity(local_250);
            if (local_14 > 0)
            {
                local_134.Add(local_14, local_250);
            }
        }
        bool local_70 = true;
        bool local_5_6 = local_70;
        Get local_256;
        for (auto& local_68_2 : local_48)
        {
            if (local_70)
            {
                continue;
            }
            local_69 = !(local_134.Contains(local_68_2.GetKey()));
            if (local_69)
            {
                continue;
            }
            if (!(local_49))
            {
                local_69 = false;
            }
            else
            {
                local_70 = !local_70;
                local_69 = local_70;
            }
            if (local_69)
            {
                continue;
            }
            if (!(local_256.opCall().GetbReady()))
            {
                local_5_6 = false;
            }
        }
        this.SetbAllReady(local_5_6);
        return;
    }
    void RequestReady()
    {
        this.SetbPendingReady(true);
        return;
    }
    void RequestGo()
    {
        this.SetbPendingGo(true);
        return;
    }
    void RequestSwitchTeam(const uint8 NewTeamID)
    {
        this.SetbPendingSwitchTeam(true);
        this.SetPendingSwitchTeamID(uint8(NewTeamID));
        return;
    }
    void RequestExit()
    {
        this.SetbPendingExit(true);
        return;
    }
    void RequestSwitchGameRule(const EPVPGameRuleType NewRule)
    {
        this.SetbPendingGameRuleChange(true);
        this.SetPendingGameRuleType(EPVPGameRuleType(NewRule));
        return;
    }
    void RequestAddBot(const uint8 TeamID)
    {
        this.SetbPendingAddBot(true);
        this.SetPendingAddBotTeamID(uint8(TeamID));
        return;
    }
    void RequestRemoveBot(const uint8 TeamID)
    {
        this.SetbPendingRemoveBot(true);
        this.SetPendingRemoveBotTeamID(uint8(TeamID));
        return;
    }
    const FText GetRoomIDText() const property
    {
        const FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_RoomIDText() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetRoomIDText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_RoomIDText = __Value;
        return;
    }
    bool GetbIsHost() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bIsHost;
    }
    void SetbIsHost(const bool __Value) property
    {
        if (!(this.m_bIsHost) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bIsHost = __Value;
        return;
    }
    bool GetbAllReady() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bAllReady;
    }
    void SetbAllReady(const bool __Value) property
    {
        if (!(this.m_bAllReady) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bAllReady = __Value;
        return;
    }
    bool GetbShouldHide() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bShouldHide;
    }
    void SetbShouldHide(const bool __Value) property
    {
        if (!(this.m_bShouldHide) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bShouldHide = __Value;
        return;
    }
    int GetSelectedGameRuleIndex() const property
    {
        this.TrackPropertyRead(4);
        return this.m_SelectedGameRuleIndex;
    }
    void SetSelectedGameRuleIndex(const int __Value) property
    {
        if (this.m_SelectedGameRuleIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_SelectedGameRuleIndex = __Value;
        return;
    }
    bool GetbPendingReady() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bPendingReady;
    }
    void SetbPendingReady(const bool __Value) property
    {
        if (!(this.m_bPendingReady) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bPendingReady = __Value;
        return;
    }
    bool GetbPendingGo() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bPendingGo;
    }
    void SetbPendingGo(const bool __Value) property
    {
        if (!(this.m_bPendingGo) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bPendingGo = __Value;
        return;
    }
    bool GetbPendingSwitchTeam() const property
    {
        this.TrackPropertyRead(7);
        return this.m_bPendingSwitchTeam;
    }
    void SetbPendingSwitchTeam(const bool __Value) property
    {
        if (!(this.m_bPendingSwitchTeam) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_bPendingSwitchTeam = __Value;
        return;
    }
    uint8 GetPendingSwitchTeamID() const property
    {
        this.TrackPropertyRead(8);
        return this.m_PendingSwitchTeamID;
    }
    void SetPendingSwitchTeamID(const uint8 __Value) property
    {
        if (this.m_PendingSwitchTeamID == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_PendingSwitchTeamID = (__Value != 0);
        return;
    }
    bool GetbPendingExit() const property
    {
        this.TrackPropertyRead(9);
        return this.m_bPendingExit;
    }
    void SetbPendingExit(const bool __Value) property
    {
        if (!(this.m_bPendingExit) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_bPendingExit = __Value;
        return;
    }
    bool GetbPendingGameRuleChange() const property
    {
        this.TrackPropertyRead(10);
        return this.m_bPendingGameRuleChange;
    }
    void SetbPendingGameRuleChange(const bool __Value) property
    {
        if (!(this.m_bPendingGameRuleChange) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_bPendingGameRuleChange = __Value;
        return;
    }
    EPVPGameRuleType GetPendingGameRuleType() const property
    {
        this.TrackPropertyRead(11);
        return this.m_PendingGameRuleType;
    }
    void SetPendingGameRuleType(const EPVPGameRuleType __Value) property
    {
        if (int(this.m_PendingGameRuleType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_PendingGameRuleType = __Value;
        return;
    }
    bool GetbPendingAddBot() const property
    {
        this.TrackPropertyRead(12);
        return this.m_bPendingAddBot;
    }
    void SetbPendingAddBot(const bool __Value) property
    {
        if (!(this.m_bPendingAddBot) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_bPendingAddBot = __Value;
        return;
    }
    uint8 GetPendingAddBotTeamID() const property
    {
        this.TrackPropertyRead(13);
        return this.m_PendingAddBotTeamID;
    }
    void SetPendingAddBotTeamID(const uint8 __Value) property
    {
        if (this.m_PendingAddBotTeamID == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_PendingAddBotTeamID = (__Value != 0);
        return;
    }
    bool GetbPendingRemoveBot() const property
    {
        this.TrackPropertyRead(14);
        return this.m_bPendingRemoveBot;
    }
    void SetbPendingRemoveBot(const bool __Value) property
    {
        if (!(this.m_bPendingRemoveBot) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_bPendingRemoveBot = __Value;
        return;
    }
    uint8 GetPendingRemoveBotTeamID() const property
    {
        this.TrackPropertyRead(15);
        return this.m_PendingRemoveBotTeamID;
    }
    void SetPendingRemoveBotTeamID(const uint8 __Value) property
    {
        if (this.m_PendingRemoveBotTeamID == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(15);
        this.m_PendingRemoveBotTeamID = (__Value != 0);
        return;
    }
}

struct __GeneratedProperties_FVMS_PVP_Lobby
{
    UPROPERTY()
    TEUIModelRef<FVMS_PVP_Lobby> Self;

    __GeneratedProperties_FVMS_PVP_Lobby()
    {
        return;
    }
}

namespace FVMS_PVP_Lobby
{
FVMS_PVP_Lobby& Get(const UObject ContextObject)
{
    return FVMS_PVP_Lobby::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_PVP_Lobby GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_PVP_Lobby __r;
    TEUIModelRef<FVMS_PVP_Lobby> local_6 = TEUIModelRef<FVMS_PVP_Lobby>(EUIInternal::MakeModelWithManager(Manager, FVMS_PVP_Lobby::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "RoomIDText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsHost";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bAllReady";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bShouldHide";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedGameRuleIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_PVP_Lobby>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_PVP_Lobby;
    FEUIModelMonitorDefine local_26;
    local_26.FunctionName = "__OnGameStatesChanged";
    local_26.ComponentType = FCS_GameStates;
    Result.MonitorFunctions.Add(local_26);
    local_26.FunctionName = "__OnMatchDataChanged";
    local_26.ComponentType = FCS_PVP_MatchData;
    Result.MonitorFunctions.Add(local_26);
    local_26.FunctionName = "__OnSessionDataChanged";
    local_26.ComponentType = FCS_PVP_SessionData;
    Result.MonitorFunctions.Add(local_26);
    local_26.FunctionName = "__OnMatchDataChanged_Universal";
    local_26.ComponentType = FCS_GameMode_MatchData;
    Result.MonitorFunctions.Add(local_26);
    Result.TickFunction.FunctionName = "__TickLobby";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_PVP_Lobby;
}
void __OnGameStatesChanged(FVMS_PVP_Lobby &inout Model, const FECSEntity &inout Entity, const FCS_GameStates &inout Component)
{
    Get local_4;
    Model.OnGameStatesChanged(local_4.opCall());
    return;
}
void __OnMatchDataChanged(FVMS_PVP_Lobby &inout Model, const FECSEntity &inout Entity, const FCS_PVP_MatchData &inout Component)
{
    Get local_4;
    Model.OnMatchDataChanged(local_4.opCall());
    return;
}
void __OnSessionDataChanged(FVMS_PVP_Lobby &inout Model, const FECSEntity &inout Entity, const FCS_PVP_SessionData &inout Component)
{
    Get local_4;
    Model.OnSessionDataChanged(local_4.opCall());
    return;
}
void __OnMatchDataChanged_Universal(FVMS_PVP_Lobby &inout Model, const FECSEntity &inout Entity, const FCS_GameMode_MatchData &inout Component)
{
    Get local_4;
    Model.OnMatchDataChanged_Universal(local_4.opCall());
    return;
}
void __TickLobby(FVMS_PVP_Lobby &inout Model)
{
    Model.TickLobby();
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
FText __UIGetter_RoomIDText(const FVMS_PVP_Lobby &inout Model)
{
    return Model.GetRoomIDText();
}
bool __UIGetter_bIsHost(const FVMS_PVP_Lobby &inout Model)
{
    return Model.GetbIsHost();
}
bool __UIGetter_bAllReady(const FVMS_PVP_Lobby &inout Model)
{
    return Model.GetbAllReady();
}
bool __UIGetter_bShouldHide(const FVMS_PVP_Lobby &inout Model)
{
    return Model.GetbShouldHide();
}
int __UIGetter_SelectedGameRuleIndex(const FVMS_PVP_Lobby &inout Model)
{
    return Model.GetSelectedGameRuleIndex();
}
TEUIModelRef<FVMS_PVP_Lobby> __UIGetter_Self(const FVMS_PVP_Lobby &inout Model)
{
    return TEUIModelRef<FVMS_PVP_Lobby>(Model);
}
int __IndexOf_RoomIDText()
{
    return 0;
}
int __IndexOf_bIsHost()
{
    return 1;
}
int __IndexOf_bAllReady()
{
    return 2;
}
int __IndexOf_bShouldHide()
{
    return 3;
}
int __IndexOf_SelectedGameRuleIndex()
{
    return 4;
}
int __IndexOf_bPendingReady()
{
    return 5;
}
int __IndexOf_bPendingGo()
{
    return 6;
}
int __IndexOf_bPendingSwitchTeam()
{
    return 7;
}
int __IndexOf_PendingSwitchTeamID()
{
    return 8;
}
int __IndexOf_bPendingExit()
{
    return 9;
}
int __IndexOf_bPendingGameRuleChange()
{
    return 10;
}
int __IndexOf_PendingGameRuleType()
{
    return 11;
}
int __IndexOf_bPendingAddBot()
{
    return 12;
}
int __IndexOf_PendingAddBotTeamID()
{
    return 13;
}
int __IndexOf_bPendingRemoveBot()
{
    return 14;
}
int __IndexOf_PendingRemoveBotTeamID()
{
    return 15;
}
}
namespace __GeneratedProperties_FVMS_PVP_Lobby
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
