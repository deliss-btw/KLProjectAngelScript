
const FConsoleVariable CVar_DataTracker_DebugEnableInPIE = FConsoleVariable();
const FConsoleVariable CVar_DataTracker_FlushBatchSize = FConsoleVariable();
const FConsoleVariable CVar_DataTracker_FlushInterval = FConsoleVariable();

class US_ServerDataTrackerSystem : UECSScriptSystem
{
    US_ServerDataTrackerSystem()
    {
        return;
    }
    UFUNCTION()
    void ServerJob_StartupServerDataTracker() const
    {
        bool local_1 = true;
        if (ECS::GetUEWorld() != nullptr && WorldUtils::IsPlayInEditor(ECS::GetUEWorld()))
        {
            local_1 = local_1 && CVar_DataTracker_DebugEnableInPIE.GetBool();
        }
        if (local_1)
        {
            FServerDataTrackerUtils::Startup(FMath::Max(1, CVar_DataTracker_FlushBatchSize.GetInt()), FMath::Max(0.01f, CVar_DataTracker_FlushInterval.GetFloat()));
        }
        return;
    }
    UFUNCTION()
    void ServerJob_OnFinishPrepareGame(const FCE_FinishPrepareGameEvent &inout Event) const
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        FECSRuntimeView local_28 = ECS::GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_50;
        local_50.opCall();
        int local_51 = 0;
        FECSRuntimeViewIterator local_86 = local_28.Iterator();
        for (; local_86.CanProceed;)
        {
            local_86.Proceed();
            ++local_51;
        }
        FCS_GameModeDataTrack local_8;
        local_8.PlayerNumWhenGameModeStart = local_51;
        return;
    }
    UFUNCTION()
    void ServerJob_ShutdownServerDataTracker() const
    {
        FServerDataTrackerUtils::Shutdown();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_StartupServerDataTracker() const
    {
        ECS::GetContextJob();
        this.ServerJob_StartupServerDataTracker();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_OnFinishPrepareGame() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_FinishPrepareGameEvent> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_FinishPrepareGameEvent& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_OnFinishPrepareGame(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_ShutdownServerDataTracker() const
    {
        ECS::GetContextJob();
        this.ServerJob_ShutdownServerDataTracker();
        return;
    }
}

namespace ServerDataTrackerHelper
{
bool CheckServerAndCommissionConfig(uint &out ConfigId, uint64 &out CommissionInstId)
{
    int local_13 = 0;
    ConfigId = 0;
    CommissionInstId = 0;
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return false;
    }
    FECSWorldPtr local_6 = ECS::GetECSWorld();
    Get local_10;
    const FCS_CommissionInfo& local_12 = local_10.opCall();
    if (local_12)
    {
        if (local_12.CommissionConfig)
        {
            ConfigId = local_13;
        }
        FECSWorldPtr local_16 = ECS::GetECSWorld();
        Get local_20;
        const FCS_CommissionDSGlobalInfo& local_22 = local_20.opCall();
        if (local_22)
        {
            CommissionInstId = local_22.CommissionInstId;
        }
        return true;
    }
    return false;
}
bool GetUserIdFromPawn(const FECSEntity &inout Pawn, uint &out UserId)
{
    UserId = 0;
    FASCommonUtils::GetUniquePlayerEntity(Pawn);
    Get local_14;
    const FC_PlayerController& local_16 = local_14.opCall();
    if (local_16)
    {
        UserId = local_16.GetPlayerId();
        return true;
    }
    return false;
}
FPbPlayerLogHead InternalGetLogHead(const FECSEntity &inout PlayerEntity)
{
    int local_25;
    FPbPlayerLogHead local_10;
    FString local_18 = FPlatformMisc::GetEnvironmentVariable("MY_NAMESPACE");
    FString local_14 = local_18.Replace("-", "_", ESearchCase(1));
    local_10.SetRegionName(local_14);
    local_10.SetGameVersion(FString().Append(ECS::GetNetworkVersion()));
    GetDefaulted local_30;
    local_25 = local_30.opCall().GetPlayerId();
    int64 local_34 = local_25;
    local_10.SetUid(local_34);
    if (PlayerEntity.IsValid())
    {
        UGameDSConnectionSubsystem local_40 = UGameDSConnectionSubsystem::Get();
        if (local_40 != nullptr)
        {
            FPbDsPlayerInfo local_50 = local_40.GetPlayerInfo(local_25);
            local_10.SetAccountId(local_50.GetBasicCompInfo().GetAccountId());
            local_10.SetAccountType(local_50.GetBasicCompInfo().GetAccountType());
            local_10.SetPlatform(local_50.GetBasicCompInfo().GetPlatformType());
            local_10.SetCountryCode(local_50.GetBasicCompInfo().GetCountryCode());
            Get local_74;
            const FC_PlayerInGameState& local_76 = local_74.opCall();
            if (local_76)
            {
                local_10.SetLevel(local_76.GetCurLevel());
            }
            else
            {
                local_10.SetLevel(local_50.GetBasicCompInfo().GetPlayerLevel());
            }
        }
    }
    local_10.SetUuid(FGuid::NewGuid().ToString(EGuidFormats(3)));
    return local_10;
}
FPbPlayerLogHeadExt InternalGetLogHeadExt(const FECSEntity &inout PlayerEntity, const FECSEntity &inout PawnEntity)
{
    FPbPlayerLogHeadExt local_10;
    int local_61 = 0;
    int local_111 = 0;
    int local_191 = 0;
    if (PawnEntity.IsValid())
    {
        if (GetAvatarConfig(PawnEntity))
        {
            local_10.SetAvatarId(local_61);
        }
    }
    local_10.SetSceneId((FLevelUtils::GetCurrentLevelInfoConfig(nullptr) ? local_111 : 0));
    if (PawnEntity.IsValid())
    {
        Get local_116;
        const FC_Transform& local_118 = local_116.opCall();
        if (local_118)
        {
            local_10.SetXCoordinate(int(local_118.GetPosition().X));
            local_10.SetYCoordinate(int(local_118.GetPosition().Y));
            local_10.SetZCoordinate(int(local_118.GetPosition().Z));
        }
    }
    local_61 = FWeatherUtils::GetPlayerControllerWeatherDataId(PlayerEntity);
    local_10.SetWeather(local_61);
    local_10.SetDsId(UGameDSConnectionSubsystem::Get().GetDsID());
    if (PlayerEntity.IsValid())
    {
        Get local_132;
        const FC_DSPlayerInfo& local_134 = local_132.opCall();
        if (local_134)
        {
            local_10.SetTeamId(local_134.GetSocialTeamId());
        }
        else
        {
            int local_135;
            GetDefaulted local_140;
            local_135 = local_140.opCall().GetPlayerId();
            local_10.SetTeamId(UGameDSConnectionSubsystem::Get().GetPlayerInfo(local_135).GetTeamId());
        }
    }
    local_10.SetGameMode(int(FLevelUtils::GetCurrentLevelType()));
    if (PawnEntity.IsValid())
    {
        FECSWorldPtr local_164 = ECS::GetECSWorld();
        Get local_168;
        const FCS_FixedTime& local_170 = local_168.opCall();
        if (local_170)
        {
            local_10.SetCurrentHp(uint((FGameAttributeUtils::GetAttributeValue(PawnEntity, Attribute::HP, local_170.Time, false, 0.0f, false, FGameAttributeModificationValue()))));
            local_10.SetCurrentStamina(uint((FGameAttributeUtils::GetAttributeValue(PawnEntity, Attribute::Stamina, local_170.Time, false, 0.0f, false, FGameAttributeModificationValue()))));
        }
    }
    FECSWorldPtr local_164_2 = ECS::GetECSWorld();
    Get local_188;
    const FCS_CommissionInfo& local_190 = local_188.opCall();
    if (local_190)
    {
        if (local_190.CommissionConfig)
        {
            local_10.SetCommissionId(local_61);
            int local_121 = local_191;
            local_10.SetCommissionType(local_121);
        }
        FECSWorldPtr local_194 = ECS::GetECSWorld();
        Get local_198;
        const FCS_CommissionDSGlobalInfo& local_200 = local_198.opCall();
        if (local_200)
        {
            local_10.SetCommissionInstanceId(local_200.CommissionInstId);
        }
    }
    if (int(FLevelUtils::GetCurrentLevelType()) == 5)
    {
        local_10.SetCommissionInstanceId(UGameDSConnectionSubsystem::Get().GetDsID());
    }
    return local_10;
}
void LogProtoMessage3NoPlayer(const uint ActionId, const FProtoWrapper &inout Body)
{
    ServerDataTrackerHelper::LogProtoMessage4NoPlayer(ActionId, Body, FProtoWrapper());
    return;
}
void LogProtoMessage4NoPlayer(const uint ActionId, const FProtoWrapper &inout Body, const FProtoWrapper &inout BodyExt)
{
    ServerDataTrackerHelper::InternalLogProtoMessage(ENTITY_NULL, ENTITY_NULL, ActionId, Body, BodyExt);
    return;
}
void LogProtoMessage3WithPlayer(const FECSEntity &inout PlayerEntity, const uint ActionId, const FProtoWrapper &inout Body)
{
    ServerDataTrackerHelper::LogProtoMessage4WithPlayer(PlayerEntity, ActionId, Body, FProtoWrapper());
    return;
}
void LogProtoMessage4WithPlayer(const FECSEntity &inout PlayerEntity, const uint ActionId, const FProtoWrapper &inout Body, const FProtoWrapper &inout BodyExt)
{
    FECSEntity local_4;
    if (PlayerEntity.IsValid())
    {
        local_4 = FASCommonUtils::GetUniqueAvatarPawnEntity(PlayerEntity);
    }
    ServerDataTrackerHelper::InternalLogProtoMessage(PlayerEntity, local_4, ActionId, Body, BodyExt);
    return;
}
void LogProtoMessage3WithPawn(const FECSEntity &inout PawnEntity, const uint ActionId, const FProtoWrapper &inout Body)
{
    ServerDataTrackerHelper::LogProtoMessage4WithPawn(PawnEntity, ActionId, Body, FProtoWrapper());
    return;
}
void LogProtoMessage4WithPawn(const FECSEntity &inout PawnEntity, const uint ActionId, const FProtoWrapper &inout Body, const FProtoWrapper &inout BodyExt)
{
    FECSEntity local_4;
    if (PawnEntity.IsValid())
    {
        local_4 = FASCommonUtils::GetUniquePlayerEntity(PawnEntity);
    }
    ServerDataTrackerHelper::InternalLogProtoMessage(local_4, PawnEntity, ActionId, Body, BodyExt);
    return;
}
void InternalLogProtoMessage(const FECSEntity &inout PlayerEntity, const FECSEntity &inout PawnEntity, const uint ActionId, const FProtoWrapper &inout Body, const FProtoWrapper &inout BodyExt)
{
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    FDateTime local_6 = FDateTime::Now();
    FDateTime local_4 = FDateTime::UtcNow();
    FPbPlayerLogHead local_18 = ServerDataTrackerHelper::InternalGetLogHead(PlayerEntity);
    FPbPlayerLogHeadExt local_38 = ServerDataTrackerHelper::InternalGetLogHeadExt(PlayerEntity, PawnEntity);
    local_18.SetTime(local_6.ToString("%Y-%m-%d %H:%M:%S"));
    local_18.SetActionId(ActionId);
    local_18.SetActionName(FServerDataTrackerUtils::PlayerActionTypeToName(ActionId));
    local_38.SetTimestampMs(FMath::IntegerDivisionTrunc((local_4.GetTicks() - FDateTime(1970, 1, 1, 0, 0, 0, 0).GetTicks()), 10000));
    FServerDataTrackerUtils::LogProtoMessage4(local_18.ToWrapper(), local_38.ToWrapper(), Body, BodyExt);
    return;
}
}
