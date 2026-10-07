
namespace FVMS_ChangeName
{
    const int ModelId = 0;

}
struct FVMS_ChangeName : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    bool m_bShouldClose;

    FVMS_ChangeName()
    {
        this.m_bShouldClose = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_ChangeName(const FVMS_ChangeName &inout Other)
    {
        this.m_bShouldClose = false;
        this.m_bShouldClose = Other.m_bShouldClose;
        return;
    }
    FVMS_ChangeName opAssign(const FVMS_ChangeName &inout Other)
    {
        FVMS_ChangeName __r;
        this.m_bShouldClose = Other.m_bShouldClose;
        return __r;
    }
    void PostConstruct()
    {
        this.SetbShouldClose(false);
        return;
    }
    FString GetPlayerNameString() const
    {
        return ::FM_LocalPlayerLevel::Get(this.GetContext().Manager).GetPlayerNameString();
    }
    void RequestChangePlayerName(const FString &inout NewPlayerName)
    {
        ::FM_LocalPlayerLevel::Get(this.GetContext().Manager).GS_RequestChangePlayerName(NewPlayerName);
        return;
    }
    void OnChangeNameResult(const FMsg_LocalPlayerChangeNameRsp &inout Msg)
    {
        if (int(Msg.RetCode) == 0)
        {
            this.SetbShouldClose(true);
            return;
        }
        FCommonTipsParam local_12;
        ::CommonPopup::Tips(NSLOCTEXT("ChangeName", "ChangeName_ChangeNameFailed", "дї®ж”№еђЌе­—е¤±иґҐ"), local_12);
        return;
    }
    bool GetbShouldClose() const property
    {
        this.TrackPropertyRead(0);
        return this.m_bShouldClose;
    }
    void SetbShouldClose(const bool __Value) property
    {
        if (!(this.m_bShouldClose) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_bShouldClose = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_ChangeName
{
    UPROPERTY()
    TEUIModelRef<FVMS_ChangeName> Self;

    __GeneratedProperties_FVMS_ChangeName()
    {
        return;
    }
}

namespace FVMS_ChangeName
{
FVMS_ChangeName& Get(const UObject ContextObject)
{
    return FVMS_ChangeName::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_ChangeName GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_ChangeName __r;
    TEUIModelRef<FVMS_ChangeName> local_6 = TEUIModelRef<FVMS_ChangeName>(EUIInternal::MakeModelWithManager(Manager, FVMS_ChangeName::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_ChangeName>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_ChangeName;
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__OnChangeNameResult";
    local_26.MessageTypeName = "Msg_LocalPlayerChangeNameRsp";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_ChangeName;
}
void __OnChangeNameResult(FVMS_ChangeName &inout Model, const FMsg_LocalPlayerChangeNameRsp &inout Message)
{
    Model.OnChangeNameResult(Message);
    return;
}
TEUIModelRef<FVMS_ChangeName> __UIGetter_Self(const FVMS_ChangeName &inout Model)
{
    return TEUIModelRef<FVMS_ChangeName>(Model);
}
int __IndexOf_bShouldClose()
{
    return 0;
}
}
namespace __GeneratedProperties_FVMS_ChangeName
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
