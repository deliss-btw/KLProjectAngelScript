
namespace FMS_GMTalk
{
    const int ModelId = 0;

}
struct FMS_GMTalk : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    int m_Nop;

    FMS_GMTalk()
    {
        this.m_Nop = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_GMTalk(const FMS_GMTalk &inout Other)
    {
        this.m_Nop = 0;
        this.m_Nop = int(Other.m_Nop);
        return;
    }
    FMS_GMTalk opAssign(const FMS_GMTalk &inout Other)
    {
        FMS_GMTalk __r;
        this.m_Nop = int(Other.m_Nop);
        return __r;
    }
    void GS_OnGMTalkResponse(const FPbGmTalkRsp &inout Notify)
    {
        FString local_8 = ((FString("GM Talk: ") + Notify.GetMsg()) + "\n");
        FString local_8_2 = ((local_8 + "GM Response: ") + Notify.GetRetMsg());
        FDialogCallback local_48;
        FCommonDialogParam local_58;
        ::CommonPopup::Dialog_Confirm(NSLOCTEXT("GMTalkResponse", "GMж¶€жЃЇ"), FText::FromString(local_8_2), local_48, FText(), local_58);
        return;
    }
    int GetNop() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Nop;
    }
    void SetNop(const int __Value) property
    {
        if (this.m_Nop == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Nop = __Value;
        return;
    }
}

namespace FMS_GMTalk
{
FMS_GMTalk& Get(const UObject ContextObject)
{
    return FMS_GMTalk::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_GMTalk GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_GMTalk __r;
    TEUIModelRef<FMS_GMTalk> local_6 = TEUIModelRef<FMS_GMTalk>(EUIInternal::MakeModelWithManager(Manager, FMS_GMTalk::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelProtoRspDefine local_10;
    local_10.FunctionName = "__GS_OnGMTalkResponse";
    Result.ProtoRspDefines.Add(local_10);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_GMTalk;
}
void __GS_OnGMTalkResponse(FMS_GMTalk &inout Model, const FProtoWrapper &inout ProtoWrapper)
{
    Model.GS_OnGMTalkResponse(FPbGmTalkRsp::FromWrapper(ProtoWrapper));
    return;
}
int __IndexOf_Nop()
{
    return 0;
}
}
