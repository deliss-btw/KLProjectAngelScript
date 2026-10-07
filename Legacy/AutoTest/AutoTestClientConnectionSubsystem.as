

class UAutoTestClientConnectionSubsystem : UGameInstanceSubsystem
{
    bool IsInited = false;
    FProtoRspDelegate SearchPlayerRspDelegate;
    FProtoRspDelegate CommissionDataNotifyDelegate;


    void Initialize()
    {
        if (this.IsInited)
        {
            return;
        }
        XLog(ELog(50), "UAutoTestClientConnectionSubsystem::OnInitialize");
        this.SearchPlayerRspDelegate.BindUFunction(this, n"OnSearchPlayerRsp");
        ::UGameClientConnectionSubsystem::Get().RegisterProtoRsp(uint16(2315), this.SearchPlayerRspDelegate);
        this.CommissionDataNotifyDelegate.BindUFunction(this, n"OnCommissionDataNotify");
        ::UGameClientConnectionSubsystem::Get().RegisterProtoRsp(uint16(301), this.CommissionDataNotifyDelegate);
        this.IsInited = true;
        return;
    }
    void BuildErrorResponseJson(FJsonObject &inout JsonObject, const int ErrorCode, const FString &inout ErrorMsg = "") const
    {
        JsonObject.SetBoolField("success", false);
        JsonObject.SetStringField("error_code", FString().Append(ErrorCode));
        JsonObject.SetStringField("error_message", ErrorMsg);
        return;
    }
    void SearchPlayer(const FString &inout SearchText)
    {
        FPbSearchPlayerReq local_4;
        local_4.SetSearchText(SearchText);
        ::UGameClientConnectionSubsystem::Get().SendProtoWrapper(local_4.ToWrapper());
        return;
    }
    UFUNCTION()
    void OnSearchPlayerRsp(const FProtoWrapper &in ProtoWrapper)
    {
        int local_18 = 0;
        XLog(ELog(50), "UAutoTestClientConnectionSubsystem::OnSearchPlayerRsp");
        FJsonObject local_6;
        ThrowIf(!(ECS::GetECSWorld().IsValid()), "ECSWorld is null.");
        bool local_11 = !(local_18);
        ThrowIf(local_11, "FCS_AutoTestJobPool is null.");
        FPbSearchPlayerRsp local_26 = FPbSearchPlayerRsp::FromWrapper(ProtoWrapper);
        if (local_26.GetRetcode() != 0)
        {
            XLog(ELog(50), FString().Append("UAutoTestClientConnectionSubsystem::OnSearchPlayerRsp SearchPlayerRsp failed, Retcode: ").Append(local_26.GetRetcode()));
            this.BuildErrorResponseJson(local_6, local_26.GetRetcode(), "Search player request failed.");
            local_18.JobMap.Add(AutoTest::API::GS::GSPlayerAPI::GetPlayerUidByName_JobId, local_6.SaveToString(false));
            return;
        }
        int local_34 = local_26.GetPlayerSearchList_Num();
        if (local_34 == 0)
        {
            XLog(ELog(50), FString().Append("UAutoTestClientConnectionSubsystem::OnSearchPlayerRsp SearchPlayerRsp has no search result"));
            this.BuildErrorResponseJson(local_6, 0, "No player found with the given name.");
            local_18.JobMap.Add(AutoTest::API::GS::GSPlayerAPI::GetPlayerUidByName_JobId, local_6.SaveToString(false));
            return;
        }
        if (local_34 > 1)
        {
            XLog(ELog(50), FString().Append("UAutoTestClientConnectionSubsystem::OnSearchPlayerRsp search result num=").Append(local_34).Append(" too many"));
        }
        FPbPlayerSearchEntry local_54 = local_26.GetPlayerSearchList_Index(0);
        if (!(local_54.IsValid()))
        {
            XLog(ELog(50), FString().Append("UAutoTestClientConnectionSubsystem::OnSearchPlayerRsp PlayerSearchEntry is invalid"));
            this.BuildErrorResponseJson(local_6, 0, "Invalid player search entry.");
            local_18.JobMap.Add(AutoTest::API::GS::GSPlayerAPI::GetPlayerUidByName_JobId, local_6.SaveToString(false));
            return;
        }
        local_6.SetBoolField("success", true);
        local_6.SetNumberField("data", local_54.GetBrief().GetUid());
        local_18.JobMap.Add(AutoTest::API::GS::GSPlayerAPI::GetPlayerUidByName_JobId, local_6.SaveToString(false));
        return;
    }
    UFUNCTION()
    void OnCommissionDataNotify(const FProtoWrapper &in ProtoWrapper)
    {
        int local_14 = 0;
        XLog(ELog(50), "UAutoTestClientConnectionSubsystem::OnCommissionDataNotify");
        ThrowIf(!(ECS::GetECSWorld().IsValid()), "ECSWorld is null.");
        bool local_7 = !(local_14);
        ThrowIf(local_7, "FCS_AutoTestJobPool is null.");
        FPbCommissionDataNotify::FromWrapper(ProtoWrapper);
        FJsonObject local_26;
        local_26.SetBoolField("success", true);
        local_26.SetStringField("data", ProtoTool::MessageToJsonString(ProtoWrapper, false));
        local_14.JobMap.Add(AutoTest::API::GS::GSCommissionAPI::CommissionData_JobId, local_26.SaveToString(false));
        return;
    }
    void StartCommissionByInstId(const uint64 CommissionInstId)
    {
        FPbStartCommissionReq local_4;
        local_4.SetCommissionInstId(CommissionInstId);
        ::UGameClientConnectionSubsystem::Get().SendProtoWrapper(local_4.ToWrapper());
        return;
    }
}

