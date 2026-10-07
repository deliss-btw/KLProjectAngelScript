
namespace FMS_Login
{
    const int ModelId = 0;

}
struct FMsg_CGPlayerEnd : FEUIMessage
{
    UPROPERTY()
    TDataObjectPtr<FCGConfig> CGConfig;

    FMsg_CGPlayerEnd()
    {
        return;
    }
}

struct FMsg_LoginNextPhase : FEUIMessage
{
    UPROPERTY()
    ELoginShowPhase NextPhase;


}

struct FMsg_CreatePlayerFailed : FEUIMessage
{
    UPROPERTY()
    int Retcode = 0;


}

struct FMS_Login : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    ULoginSettings m_LoginSettings;
    UPROPERTY()
    bool m_bIsOfficialLogin;
    UPROPERTY()
    bool m_bIsCreatePlayerPreOpen;

    FMS_Login()
    {
        this.m_LoginSettings = nullptr;
        this.m_bIsOfficialLogin = false;
        this.m_bIsCreatePlayerPreOpen = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_Login(const FMS_Login &inout Other)
    {
        this.m_LoginSettings = nullptr;
        this.m_bIsOfficialLogin = false;
        this.m_bIsCreatePlayerPreOpen = false;
        this.m_LoginSettings = Other.m_LoginSettings;
        this.m_bIsOfficialLogin = Other.m_bIsOfficialLogin;
        this.m_bIsCreatePlayerPreOpen = Other.m_bIsCreatePlayerPreOpen;
        return;
    }
    FMS_Login opAssign(const FMS_Login &inout Other)
    {
        FMS_Login __r;
        this.m_LoginSettings = Other.m_LoginSettings;
        this.m_bIsOfficialLogin = Other.m_bIsOfficialLogin;
        this.m_bIsCreatePlayerPreOpen = Other.m_bIsCreatePlayerPreOpen;
        return __r;
    }
    void PostConstruct()
    {
        GetGameplaySettings<ULoginSettings> local_2;
        this.SetLoginSettings(local_2);
        return;
    }
    void OnPlayerCreateRsp(const FPbCreatePlayerRsp &inout Rsp)
    {
        XLog(ELog(78), FString().Append("OnPlayerCreateRsp"));
        if (Rsp.GetRetcode() != 0)
        {
            XLog(ELog(78), FString().Append("[OnPlayerCreateRsp] failed retcode=").Append(Rsp.GetRetcode()));
            FEUIModelRef local_16 = FEUIModelRef(this);
            FEUIMessageBus::Publish(EUIMessageBus);
            FMsg_CreatePlayerFailed local_10;
            local_10.Retcode = Rsp.GetRetcode();
            return;
        }
        this.GoToLoginNextPhase(ELoginShowPhase(5));
        return;
    }
    void HandlEnterInitSceneRsp(const FPbEnterInitSceneRsp &inout Rsp)
    {
        if (Rsp.GetRetcode() != 0)
        {
            XLog(ELog(78), FString().Append("[HandleEnterInitSceneRsp] failed retcode=").Append(Rsp.GetRetcode()));
            return;
        }
        return;
    }
    void HandleCGPlayerEnd(const FMsg_CGPlayerEnd &inout Msg)
    {
        if (!(this.GetbIsOfficialLogin()))
        {
            return;
        }
        if (this.GetLoginSettings() != nullptr && Msg.CGConfig.IsSet())
        {
            if (this.GetLoginSettings().LoginCGConfig.GetUniqueID() == GetUniqueID())
            {
                this.GoToLoginNextPhase(ELoginShowPhase(4));
            }
        }
        return;
    }
    void SetCanCreatePlayer(const bool bIsOfficial)
    {
        this.SetbIsOfficialLogin(bIsOfficial);
        return;
    }
    void RequestCreatePlayer(const FString &inout Nickname, const uint Gender, const uint FaceID, const uint HairID, const uint UpperID, const uint LowerID, const uint SuitID)
    {
        XLog(ELog(78), FString().Append("RequestCreatePlayer Nickname=").Append(Nickname).Append(" Gender=").Append(Gender).Append(" FaceID=").Append(FaceID).Append(" HairID=").Append(HairID).Append(" UpperID=").Append(UpperID).Append(" LowerID=").Append(LowerID).Append(" SuitID=").Append(SuitID));
        FPbCreatePlayerReq local_10;
        local_10.SetNickname(Nickname);
        local_10.SetGender(Gender);
        FPbCreateAppearanceInfo local_30 = local_10.GetAppearanceInfo();
        local_30.SetGender(Gender);
        local_30.SetFacePresetId(FaceID);
        local_30.SetHairId(HairID);
        local_30.SetTopId(UpperID);
        local_30.SetBottomId(LowerID);
        local_30.SetSuitId(SuitID);
        this.SendProto(local_10.ToWrapper());
        return;
    }
    void HandleLoginNextPhase(const FMsg_LoginNextPhase &inout Msg)
    {
        this.GoToLoginNextPhase(Msg.NextPhase);
        return;
    }
    void GoToLoginNextPhase(const ELoginShowPhase NextPhase)
    {
        int local_2 = int(NextPhase);
        bool local_5 = true;
        bool local_4 = local_5;
        if (this.GetLoginSettings().LoginPhaseInfos.Contains(NextPhase))
        {
            local_5 = this.GetLoginSettings().LoginPhaseInfos[NextPhase].bIsSkip;
            local_4 = local_5;
        }
        if (local_4)
        {
            if (local_2 < 5)
            {
                int local_10 = (local_2 + 1);
                this.GoToLoginNextPhase(ELoginShowPhase(local_10));
                return;
            }
            else
            {
                return;
            }
        }
        else
        {
            switch (int(NextPhase))
            {
            case 1:
            {
                FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_LoginOfficial);
                return;
            }
            case 2:
            {
                FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_LoginGamma);
                return;
            }
            case 3:
            {
                int local_9 = (int(NextPhase) + 1);
                if (local_9 == 4)
                {
                    if (this.GetLoginSettings().LoginPhaseInfos.Contains(ELoginShowPhase(local_9)))
                    {
                        ULoginSettings local_8 = this.GetLoginSettings();
                        this.SetbIsCreatePlayerPreOpen(local_5);
                    }
                    if (this.GetbIsCreatePlayerPreOpen())
                    {
                        FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_CreatePlayer);
                    }
                }
                this.SetbIsOfficialLogin(true);
                ::CGPlayerUtils::OpenCGPlayerByDataObject(this.GetContext().UELocalPlayer, this.GetLoginSettings().LoginCGConfig);
                return;
            }
            case 4:
            {
                this.SetbIsOfficialLogin(false);
                if (!(this.GetbIsCreatePlayerPreOpen()))
                {
                    FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_CreatePlayer);
                }
                this.SetbIsCreatePlayerPreOpen(false);
                return;
            }
            case 5:
            {
                UGameClientConnectionSubsystem local_18 = ::UGameClientConnectionSubsystem::Get();
                if (local_18 != nullptr)
                {
                    if (local_18.IsConnectedToGameServer())
                    {
                        local_18.EnterInitScene();
                    }
                }
                return;
            }
            }
        }
        return;
    }
    ULoginSettings GetLoginSettings() const property
    {
        this.TrackPropertyRead(0);
        return this.m_LoginSettings;
    }
    void SetLoginSettings(const ULoginSettings __Value) property
    {
        if (this.m_LoginSettings == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        return;
    }
    bool GetbIsOfficialLogin() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bIsOfficialLogin;
    }
    void SetbIsOfficialLogin(const bool __Value) property
    {
        if (!(this.m_bIsOfficialLogin) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bIsOfficialLogin = __Value;
        return;
    }
    bool GetbIsCreatePlayerPreOpen() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bIsCreatePlayerPreOpen;
    }
    void SetbIsCreatePlayerPreOpen(const bool __Value) property
    {
        if (!(this.m_bIsCreatePlayerPreOpen) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bIsCreatePlayerPreOpen = __Value;
        return;
    }
}

namespace FMS_Login
{
FMS_Login& Get(const UObject ContextObject)
{
    return FMS_Login::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_Login GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_Login __r;
    TEUIModelRef<FMS_Login> local_6 = TEUIModelRef<FMS_Login>(EUIInternal::MakeModelWithManager(Manager, FMS_Login::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelProtoRspDefine local_10;
    local_10.FunctionName = "__OnPlayerCreateRsp";
    Result.ProtoRspDefines.Add(local_10);
    local_10.FunctionName = "__HandlEnterInitSceneRsp";
    Result.ProtoRspDefines.Add(local_10);
    FEUIModelMsgHandleDefine local_22;
    local_22.FunctionName = "__HandleCGPlayerEnd";
    local_22.MessageTypeName = "Msg_CGPlayerEnd";
    local_22.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_22);
    local_22.FunctionName = "__HandleLoginNextPhase";
    local_22.MessageTypeName = "Msg_LoginNextPhase";
    local_22.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_22);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_Login;
}
void __OnPlayerCreateRsp(FMS_Login &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.OnPlayerCreateRsp(FPbCreatePlayerRsp::FromWrapper(ProtoWrapper));
    return;
}
void __HandlEnterInitSceneRsp(FMS_Login &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.HandlEnterInitSceneRsp(FPbEnterInitSceneRsp::FromWrapper(ProtoWrapper));
    return;
}
void __HandleCGPlayerEnd(FMS_Login &inout Model, const FMsg_CGPlayerEnd &inout Message)
{
    Model.HandleCGPlayerEnd(Message);
    return;
}
void __HandleLoginNextPhase(FMS_Login &inout Model, const FMsg_LoginNextPhase &inout Message)
{
    Model.HandleLoginNextPhase(Message);
    return;
}
int __IndexOf_LoginSettings()
{
    return 0;
}
int __IndexOf_bIsOfficialLogin()
{
    return 1;
}
int __IndexOf_bIsCreatePlayerPreOpen()
{
    return 2;
}
}
