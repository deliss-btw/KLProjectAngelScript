
namespace FMS_CommissionData
{
    const int ModelId = 0;

}
struct FMsg_CommissionListUpdated : FEUIMessage
{
    FMsg_CommissionListUpdated()
    {
        return;
    }
}

struct FMsg_CommissionRefreshTimesUpdated : FEUIMessage
{
    FMsg_CommissionRefreshTimesUpdated()
    {
        return;
    }
}

struct FMsg_CommissionRecruitCdUpdated : FEUIMessage
{
    UPROPERTY()
    uint RecruitCdExpireTime = 0;


}

struct FMsg_CommissionRecruitSendUpdated : FEUIMessage
{
    UPROPERTY()
    TDataObjectPtr<FCommissionConfig> CommissionConfig;
    UPROPERTY()
    bool bSuccess = false;
    UPROPERTY()
    int Retcode = 0;
    UPROPERTY()
    uint RecruitCdExpireTime = 0;


}

struct FMS_CommissionData : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TMap<uint64, TEUIModelRef<FM_Commission>> m_CommissionMap;
    UPROPERTY()
    TMap<FEUIModelRef, uint64> m_CommissionInstIdMap;
    UPROPERTY()
    TMap<uint64, TEUIModelRef<FM_Player>> m_CachedCommissionFinishPlayerModel;
    UPROPERTY()
    TMap<ECommissionType, FDateTime> m_NextCommissionRefreshTimes;
    UPROPERTY()
    uint m_RecruitCdExpireTimeSec;
    UPROPERTY()
    bool m_bIsRecruitSending;
    UPROPERTY()
    int64 m_RecruitSendRequestTimeSec;

    FMS_CommissionData()
    {
        this.m_RecruitCdExpireTimeSec = 0;
        this.m_bIsRecruitSending = false;
        this.m_RecruitSendRequestTimeSec = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_CommissionData(const FMS_CommissionData &inout Other)
    {
        this.m_RecruitCdExpireTimeSec = 0;
        this.m_bIsRecruitSending = false;
        this.m_RecruitSendRequestTimeSec = 0;
        this.m_CommissionMap = Other.m_CommissionMap;
        this.m_CommissionInstIdMap = Other.m_CommissionInstIdMap;
        this.m_CachedCommissionFinishPlayerModel = Other.m_CachedCommissionFinishPlayerModel;
        this.m_NextCommissionRefreshTimes = Other.m_NextCommissionRefreshTimes;
        this.m_RecruitCdExpireTimeSec = int(Other.m_RecruitCdExpireTimeSec);
        this.m_bIsRecruitSending = Other.m_bIsRecruitSending;
        this.m_RecruitSendRequestTimeSec = Other.m_RecruitSendRequestTimeSec;
        return;
    }
    FMS_CommissionData opAssign(const FMS_CommissionData &inout Other)
    {
        FMS_CommissionData __r;
        this.m_CommissionMap = Other.m_CommissionMap;
        this.m_CommissionInstIdMap = Other.m_CommissionInstIdMap;
        this.m_CachedCommissionFinishPlayerModel = Other.m_CachedCommissionFinishPlayerModel;
        this.m_NextCommissionRefreshTimes = Other.m_NextCommissionRefreshTimes;
        this.m_RecruitCdExpireTimeSec = int(Other.m_RecruitCdExpireTimeSec);
        this.m_bIsRecruitSending = Other.m_bIsRecruitSending;
        this.m_RecruitSendRequestTimeSec = Other.m_RecruitSendRequestTimeSec;
        return __r;
    }
    int GetRecruitCooldownRemainingSec() const
    {
        int64 local_4 = ::FASCommonUtils::GetTimestamp();
        return FMath::Max(0, (this.GetRecruitCdExpireTimeSec() - local_4));
    }
    bool IsRecruitOnCooldown() const
    {
        return (this.GetRecruitCooldownRemainingSec() > 0);
    }
    void RequestSendCommissionRecruit(const TDataObjectPtr<FCommissionConfig> &inout CommissionConfig)
    {
        int local_27 = 0;
        UGameClientConnectionSubsystem local_4 = ::UGameClientConnectionSubsystem::Get();
        if (!((local_4 != nullptr)) || !(local_4.IsConnectedToGameServer()))
        {
            this.ResetRecruitSendingState();
            XLog(ELog(27), "SendCommissionRecruit skipped, not connected to game server");
            return;
        }
        bool local_6 = !(CommissionConfig);
        if (local_6)
        {
            XError(ELog(27), "SendCommissionRecruit failed, commission config is invalid");
            return;
        }
        if (local_6)
        {
            FString local_12 = FString();
            return;
        }
        if (this.GetbIsRecruitSending())
        {
            if ((this.GetRecruitSendRequestTimeSec() > 0 && ((::FASCommonUtils::GetTimestamp() - this.GetRecruitSendRequestTimeSec()) < 15)))
            {
                return;
            }
            this.ResetRecruitSendingState();
        }
        if (this.IsRecruitOnCooldown())
        {
            XLog(ELog(27), FString().Append("SendCommissionRecruit skipped, on cooldown remainingSec=").Append(this.GetRecruitCooldownRemainingSec()));
            return;
        }
        this.SetbIsRecruitSending(true);
        this.SetRecruitSendRequestTimeSec(::FASCommonUtils::GetTimestamp());
        FPbSendCommissionRecruitReq local_26;
        local_26.SetCommissionId(local_27);
        this.SendProto(local_26.ToWrapper());
        return;
    }
    void OnLocalPlayerChangedForRecruit(const FC_PlayerController &inout PlayerController)
    {
        if (!(PlayerController))
        {
            this.ResetRecruitSendingState();
            return;
        }
        UGameClientConnectionSubsystem local_6 = ::UGameClientConnectionSubsystem::Get();
        if (!((local_6 != nullptr)) || !(local_6.IsConnectedToGameServer()))
        {
            this.ResetRecruitSendingState();
        }
        return;
    }
    TArray<TEUIModelRef<FM_Commission>> GetCommissionListByType(const ECommissionType CommissionType) const
    {
        TArray<TEUIModelRef<FM_Commission>> local_4;
        for (auto& local_24 : this.GetCommissionMap())
        {
            local_24;
            if (int(opArrow().GetCommissionConfig().opArrow().CommissionType) == int(CommissionType))
            {
                UDataTable local_34;
                local_34 = Cast<UDataTable>(opArrow().GetCommissionConfig().GetRoot());
                if (::CommissionUtils::GetCommissionSettings().HiddenCommissionTables.Contains(local_34))
                {
                    continue;
                }
                if (opArrow().ShouldHideOnDashboard())
                {
                    continue;
                }
                local_4.Add();
            }
        }
        return local_4;
    }
    TEUIModelRef<FM_Commission> FindFirstCommissionsByConfig(const TDataObjectPtr<FCommissionConfig> &inout CommissionConfig) const
    {
        TEUIModelRef<FM_Commission> __r;
        for (auto& local_20 : this.GetCommissionMap())
        {
            local_20;
            TDataObjectPtr<FCommissionConfig> local_44;
            local_44 = opArrow().GetCommissionConfig();
            if ((local_44 == CommissionConfig.opImplConv()))
            {
                return __r;
            }
        }
        return TEUIModelRef<FM_Commission>();
    }
    TEUIModelRef<FM_Commission> FindCommissionByConfigDataId(const uint ConfigDataId) const
    {
        TEUIModelRef<FM_Commission> __r;
        for (auto& local_20 : this.GetCommissionMap())
        {
            local_20;
            if (opArrow().GetCommissionConfig() && (opArrow().GetCommissionConfig().opArrow().DataId == ConfigDataId))
            {
                return __r;
            }
        }
        return TEUIModelRef<FM_Commission>();
    }
    uint64 GetInstIdByCommissionId(const uint CommissionId) const
    {
        for (auto& local_20 : this.GetCommissionMap())
        {
            if (IsValid() && (opArrow().GetCommissionConfig().opArrow().DataId == CommissionId))
            {
                return local_20.GetKey();
            }
        }
        return 0;
    }
    TEUIModelRef<FM_Commission> FindCommissionByInstId(const uint64 CommissionInstId) const
    {
        if (this.GetCommissionMap().Contains(CommissionInstId))
        {
            return this.GetCommissionMap()[CommissionInstId];
        }
        return TEUIModelRef<FM_Commission>();
    }
    FTimespan GetRefreshRemainingTime(const ECommissionType CommissionType) const
    {
        FDateTime local_2;
        if (!(this.GetNextCommissionRefreshTimes().Find(CommissionType, local_2)))
        {
            return FTimespan::Zero();
        }
        return FTimespan::FromSeconds(FMath::Max(0, (local_2.ToUnixTimestamp() - ::FASCommonUtils::GetTimestamp())));
    }
    void GS_RequestStartCommission(const TEUIModelRef<FM_Commission> &inout CommissionModel)
    {
        int local_10;
        if (!(CommissionModel.IsValid()))
        {
            XError(ELog(27), FString().Append("Failed to start commission, commission model is invalid"));
            return;
        }
        if (!(this.TryGetCommissionInstanceId(CommissionModel, local_10)))
        {
            FString local_14;
            local_14.ToString();
            XError(ELog(27), FString().Append("Failed to start commission, commission id not cached for model ").Append(local_14));
        }
        FPbStartCommissionReq local_18;
        local_18.SetCommissionInstId(local_10);
        this.SendProto(local_18.ToWrapper());
        return;
    }
    void GS_OnCommissionDataNotify(const FPbCommissionDataNotify &inout Msg)
    {
        this.ResetRecruitSendingState();
        this.GetModify_CommissionMap().Empty(0);
        int local_2 = 0;
        for (; local_2 < Msg.GetActiveCommissionList_Num(); )
        {
            FPbCommissionInfo local_16 = Msg.GetActiveCommissionList_Index(local_2);
            this.AddCommissionModel(local_16.GetInstId(), local_16);
            ++local_2;
        }
        FEUIModelRef local_34 = FEUIModelRef(this);
        FEUIMessageBus::PublishOrPatch(EUIMessageBus).opCall(local_34);
        this.GetModify_NextCommissionRefreshTimes().Empty(0);
        int local_2_2 = 0;
        for (; local_2_2 < Msg.GetNextRefreshTimeList_Num(); )
        {
            FPbCommissionNextRefreshTimeInfo local_44 = Msg.GetNextRefreshTimeList_Index(local_2_2);
            int local_59 = local_44.GetCommissionType();
            this.GetModify_NextCommissionRefreshTimes().Add(ECommissionType(local_59), FDateTime::FromUnixTimestamp(local_44.GetNextRefreshTime()));
            ++local_2_2;
        }
        FEUIModelRef local_34_2 = FEUIModelRef(this);
        FEUIMessageBus::PublishOrPatch(EUIMessageBus).opCall(local_34_2);
        XLog(ELog(27), FString().Append("GS_OnCommissionDataNotify recruitCdExpireTime=").Append(Msg.GetRecruitCdExpireTime()).Append(" now=").Append(::FASCommonUtils::GetTimestamp()).Append(" remainingSec=").Append((Msg.GetRecruitCdExpireTime() - ::FASCommonUtils::GetTimestamp())));
        this.ApplyRecruitCdExpireTime(Msg.GetRecruitCdExpireTime());
        return;
    }
    void GS_OnSendCommissionRecruitRsp(const FPbSendCommissionRecruitRsp &inout Rsp)
    {
        this.ResetRecruitSendingState();
        int local_49 = Rsp.GetCommissionId();
        GetDataObjectByGSDataId<FCommissionConfig> local_48;
        TDataObjectPtr<FCommissionConfig> local_74 = local_48.opImplConv();
        bool local_102 = (Rsp.GetRetcode() == 0);
        if (Rsp.GetRecruitCdExpireTime() > 0)
        {
            this.ApplyRecruitCdExpireTime(Rsp.GetRecruitCdExpireTime());
        }
        if (local_102)
        {
            XLog(ELog(27), FString().Append("SendCommissionRecruit succ commissionId=").Append(Rsp.GetCommissionId()).Append(" recruitCdExpireTime=").Append(Rsp.GetRecruitCdExpireTime()));
            this.ShowRecruitSendSuccessTips();
        }
        else
        {
            XLog(ELog(27), FString().Append("SendCommissionRecruit failed retcode=").Append(Rsp.GetRetcode()).Append(" commissionId=").Append(Rsp.GetCommissionId()).Append(" recruitCdExpireTime=").Append(Rsp.GetRecruitCdExpireTime()));
        }
        FEUIModelRef local_118 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        FMsg_CommissionRecruitSendUpdated local_112;
        local_112.CommissionConfig = local_74;
        local_112.bSuccess = local_102;
        local_112.Retcode = Rsp.GetRetcode();
        local_112.RecruitCdExpireTime = this.GetRecruitCdExpireTimeSec();
        return;
    }
    void ShowRecruitSendSuccessTips()
    {
        const UChatSettings local_2;
        GetGameplaySettings<UChatSettings> local_4;
        local_2 = local_4;
        if ((!((local_2 != nullptr))))
        {
            return;
        }
        FText local_16 = ::ChatSystemUtil::ResolveKLTextData(local_2.RecruitSendSuccessTipsTextData);
        if (!(local_16.IsEmpty()))
        {
            FCommonTipsParam local_20;
            ::CommonPopup::Tips(local_16, local_20);
        }
        return;
    }
    void GS_OnCommissionDataUpdateNotify(const FPbCommissionDataUpdateNotify &inout Msg)
    {
        int local_41 = 0;
        bool local_49;
        bool local_5 = (::NumericUtils::AsInt32(Msg.GetActiveCommissionList_Num()) != this.GetCommissionMap().Num());
        int local_6 = 0;
        for (; local_6 < Msg.GetActiveCommissionList_Num(); )
        {
            FPbCommissionInfo local_18 = Msg.GetActiveCommissionList_Index(local_6);
            this.AddOrUpdateCommissionModel(local_18.GetInstId(), local_18);
            ++local_6;
        }
        if (local_5)
        {
            FEUIModelRef local_36 = FEUIModelRef(this);
            FEUIMessageBus::PublishOrPatch(EUIMessageBus).opCall(local_36);
        }
        if (Msg.GetNextRefreshTime() > 0)
        {
            local_41 = Msg.GetCommissionType();
            this.GetModify_NextCommissionRefreshTimes().Add(ECommissionType(local_41), FDateTime::FromUnixTimestamp(Msg.GetNextRefreshTime()));
            FEUIModelRef local_36_2 = FEUIModelRef(this);
            FEUIMessageBus::PublishOrPatch(EUIMessageBus).opCall(local_36_2);
        }
        FMS_Mode& local_48 = ::FMS_Mode::Get(this.GetContext().Manager);
        if (!(local_48.GetbMatching()))
        {
            local_49 = false;
        }
        else
        {
            int local_2 = local_48.GetCurMatchCommissionId();
            local_49 = (local_2 != 0);
        }
        if (local_49)
        {
            int local_6_2 = 0;
            for (; local_6_2 < Msg.GetActiveCommissionList_Num(); ++local_6_2)
            {
                FPbCommissionInfo local_28 = Msg.GetActiveCommissionList_Index(local_6_2);
                if (local_28.GetId() != local_48.GetCurMatchCommissionId())
                {
                    continue;
                }
                int local_50 = local_28.GetId();
                GetDataObjectByGSDataId<FCommissionConfig> local_98;
                if (local_98.opImplConv().IsSet() && (local_41 == 2))
                {
                    NSLOCTEXT("Commission", "ChallengeFactorRefreshed", "гЂЊ{0}жЊ‘ж€е› е­ђе·Іе€·ж–°гЂЌ");
                    FText local_154;
                    FCommonTipsParam local_158;
                    ::CommonPopup::Tips(local_154, local_158);
                }
                break;
            }
        }
        return;
    }
    void ResetRecruitSendingState()
    {
        this.SetbIsRecruitSending(false);
        this.SetRecruitSendRequestTimeSec(0);
        return;
    }
    void ApplyRecruitCdExpireTime(const uint ExpireTime)
    {
        if (this.GetRecruitCdExpireTimeSec() == ExpireTime)
        {
            return;
        }
        this.SetRecruitCdExpireTimeSec(ExpireTime);
        FEUIModelRef local_10 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        FMsg_CommissionRecruitCdUpdated local_4;
        local_4.RecruitCdExpireTime = ExpireTime;
        return;
    }
    void AddCommissionModel(const uint64 CommissionInstId, const FPbCommissionInfo &inout ServerInfo)
    {
        FM_Commission& local_2 = this.CreateCommission(CommissionInstId);
        if (!(local_2.SetFromServerData(ServerInfo, false)))
        {
            XError(ELog(27), FString().Append("Failed to add commission model, commission config not found for ").Append(ServerInfo.GetId()));
            this.DeleteCommissionModel(CommissionInstId);
        }
        return;
    }
    void AddOrUpdateCommissionModel(const uint64 CommissionInstId, const FPbCommissionInfo &inout ServerInfo)
    {
        FM_Commission& local_2 = this.GetOrCreateCommission(CommissionInstId);
        if (!(local_2.SetFromServerData(ServerInfo, false)))
        {
            XError(ELog(27), FString().Append("Failed to add or update commission model, commission config not found for ").Append(ServerInfo.GetId()));
            if (!(local_2.GetCommissionConfig()))
            {
                this.DeleteCommissionModel(CommissionInstId);
            }
        }
        return;
    }
    FM_Commission& CreateCommission(const uint64 CommissionInstId)
    {
        FM_Commission& local_2 = ::FM_Commission::Create(this.GetContext().Manager);
        this.GetModify_CommissionMap().Add(CommissionInstId, TEUIModelRef<FM_Commission>(local_2));
        this.GetModify_CommissionInstIdMap().Add(FEUIModelRef(local_2), CommissionInstId);
        return local_2;
    }
    FM_Commission& GetOrCreateCommission(const uint64 CommissionInstId)
    {
        if (this.GetCommissionMap().Contains(CommissionInstId))
        {
        }
        else
        {
            return this.CreateCommission(CommissionInstId);
        }
    }
    bool TryGetCommissionInstanceId(const TEUIModelRef<FM_Commission> &inout CommissionModel, uint64 &out CommissionInstId) const
    {
        CommissionInstId = 0;
        return this.GetCommissionInstIdMap().Find(CommissionModel.opImplConv(), CommissionInstId);
    }
    void DeleteCommissionModel(const uint64 CommissionInstId)
    {
        TEUIModelRef<FM_Commission> local_2;
        if (this.GetModify_CommissionMap().RemoveAndCopyValue(CommissionInstId, local_2))
        {
            FEUIModelRef local_6 = local_2.opImplConv();
        }
        return;
    }
    TEUIModelRef<FM_Player> GetCommissionFinishPlayerModel(const uint PlayerID)
    {
        if (this.GetCachedCommissionFinishPlayerModel().Contains(PlayerID))
        {
            int64 local_2 = PlayerID;
            return this.GetCachedCommissionFinishPlayerModel()[local_2];
        }
        return TEUIModelRef<FM_Player>();
    }
    void CacheAllFinishPlayerModel(const FCS_CommissionFinish &inout CommissionFinish)
    {
        if (!(CommissionFinish))
        {
            return;
        }
        if (CommissionFinish.GetFinishTeamers().Num() > 0)
        {
            this.GetModify_CachedCommissionFinishPlayerModel().Empty(0);
            for (auto& local_18 : CommissionFinish.GetFinishTeamers())
            {
                this.GetModify_CachedCommissionFinishPlayerModel().Add(local_18.GetPlayerID(), ::FMS_PlayerData::Get(this.GetContext().Manager).GetOrCreatePlayerByEntity(FECSEntity(local_18.GetPlayerEntityId())));
            }
        }
        return;
    }
    const TMap<uint64, TEUIModelRef<FM_Commission>> GetCommissionMap() const property
    {
        const TMap<uint64, TEUIModelRef<FM_Commission>> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TMap<uint64, TEUIModelRef<FM_Commission>> GetModify_CommissionMap() property
    {
        TMap<uint64, TEUIModelRef<FM_Commission>> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetCommissionMap(const TMap<uint64, TEUIModelRef<FM_Commission>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CommissionMap = __Value;
        return;
    }
    const TMap<FEUIModelRef, uint64> GetCommissionInstIdMap() const property
    {
        const TMap<FEUIModelRef, uint64> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TMap<FEUIModelRef, uint64> GetModify_CommissionInstIdMap() property
    {
        TMap<FEUIModelRef, uint64> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetCommissionInstIdMap(const TMap<FEUIModelRef, uint64> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CommissionInstIdMap = __Value;
        return;
    }
    const TMap<uint64, TEUIModelRef<FM_Player>> GetCachedCommissionFinishPlayerModel() const property
    {
        const TMap<uint64, TEUIModelRef<FM_Player>> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TMap<uint64, TEUIModelRef<FM_Player>> GetModify_CachedCommissionFinishPlayerModel() property
    {
        TMap<uint64, TEUIModelRef<FM_Player>> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetCachedCommissionFinishPlayerModel(const TMap<uint64, TEUIModelRef<FM_Player>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CachedCommissionFinishPlayerModel = __Value;
        return;
    }
    const TMap<ECommissionType, FDateTime> GetNextCommissionRefreshTimes() const property
    {
        const TMap<ECommissionType, FDateTime> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TMap<ECommissionType, FDateTime> GetModify_NextCommissionRefreshTimes() property
    {
        TMap<ECommissionType, FDateTime> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetNextCommissionRefreshTimes(const TMap<ECommissionType, FDateTime> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_NextCommissionRefreshTimes = __Value;
        return;
    }
    uint GetRecruitCdExpireTimeSec() const property
    {
        this.TrackPropertyRead(4);
        return this.m_RecruitCdExpireTimeSec;
    }
    void SetRecruitCdExpireTimeSec(const uint __Value) property
    {
        if (this.m_RecruitCdExpireTimeSec == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_RecruitCdExpireTimeSec = __Value;
        return;
    }
    bool GetbIsRecruitSending() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bIsRecruitSending;
    }
    void SetbIsRecruitSending(const bool __Value) property
    {
        if (!(this.m_bIsRecruitSending) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bIsRecruitSending = __Value;
        return;
    }
    int64 GetRecruitSendRequestTimeSec() const property
    {
        this.TrackPropertyRead(6);
        return this.m_RecruitSendRequestTimeSec;
    }
    void SetRecruitSendRequestTimeSec(const int64 __Value) property
    {
        if (this.m_RecruitSendRequestTimeSec == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_RecruitSendRequestTimeSec = __Value;
        return;
    }
}

namespace FMS_CommissionData
{
FMS_CommissionData& Get(const UObject ContextObject)
{
    return FMS_CommissionData::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_CommissionData GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_CommissionData __r;
    TEUIModelRef<FMS_CommissionData> local_6 = TEUIModelRef<FMS_CommissionData>(EUIInternal::MakeModelWithManager(Manager, FMS_CommissionData::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMonitorDefine local_14;
    local_14.FunctionName = "__OnLocalPlayerChangedForRecruit";
    local_14.ComponentType = FC_PlayerController;
    Result.MonitorFunctions.Add(local_14);
    FEUIModelProtoRspDefine local_24;
    local_24.FunctionName = "__GS_OnCommissionDataNotify";
    Result.ProtoRspDefines.Add(local_24);
    local_24.FunctionName = "__GS_OnSendCommissionRecruitRsp";
    Result.ProtoRspDefines.Add(local_24);
    local_24.FunctionName = "__GS_OnCommissionDataUpdateNotify";
    Result.ProtoRspDefines.Add(local_24);
    local_14.FunctionName = "__CacheAllFinishPlayerModel";
    local_14.ComponentType = FCS_CommissionFinish;
    Result.MonitorFunctions.Add(local_14);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_CommissionData;
}
void __OnLocalPlayerChangedForRecruit(FMS_CommissionData &inout Model, const FECSEntity &inout Entity, const FC_PlayerController &inout Component)
{
    Model.OnLocalPlayerChangedForRecruit(Component);
    return;
}
void __GS_OnCommissionDataNotify(FMS_CommissionData &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnCommissionDataNotify(FPbCommissionDataNotify::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnSendCommissionRecruitRsp(FMS_CommissionData &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnSendCommissionRecruitRsp(FPbSendCommissionRecruitRsp::FromWrapper(ProtoWrapper));
    return;
}
void __GS_OnCommissionDataUpdateNotify(FMS_CommissionData &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnCommissionDataUpdateNotify(FPbCommissionDataUpdateNotify::FromWrapper(ProtoWrapper));
    return;
}
void __CacheAllFinishPlayerModel(FMS_CommissionData &inout Model, const FECSEntity &inout Entity, const FCS_CommissionFinish &inout Component)
{
    Get local_4;
    Model.CacheAllFinishPlayerModel(local_4.opCall());
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
int __IndexOf_CommissionMap()
{
    return 0;
}
int __IndexOf_CommissionInstIdMap()
{
    return 1;
}
int __IndexOf_CachedCommissionFinishPlayerModel()
{
    return 2;
}
int __IndexOf_NextCommissionRefreshTimes()
{
    return 3;
}
int __IndexOf_RecruitCdExpireTimeSec()
{
    return 4;
}
int __IndexOf_bIsRecruitSending()
{
    return 5;
}
int __IndexOf_RecruitSendRequestTimeSec()
{
    return 6;
}
}
