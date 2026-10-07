
namespace FVM_Comp_Matching
{
    const int ModelId = 0;

}
struct FVM_Comp_Matching : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    bool m_bMatching;
    UPROPERTY()
    TEUIModelRef<FVM_Match_HintComp> m_MatchHint;
    UPROPERTY()
    TEUIModelRef<FMS_Mode> m_ModeMS;

    FVM_Comp_Matching()
    {
        this.m_bMatching = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_Comp_Matching(const FVM_Comp_Matching &inout Other)
    {
        this.m_bMatching = false;
        this.m_bMatching = Other.m_bMatching;
        this.m_MatchHint = Other.m_MatchHint;
        this.m_ModeMS = Other.m_ModeMS;
        return;
    }
    FVM_Comp_Matching& opAssign(const FVM_Comp_Matching &inout Other)
    {
        this.m_bMatching = Other.m_bMatching;
        this.m_MatchHint = Other.m_MatchHint;
        return Other.m_ModeMS;
    }
    void PostConstruct()
    {
        this.SetModeMS(TEUIModelRef<FMS_Mode>(::FMS_Mode::Get(this.GetContext().Manager)));
        TEUIModelRef<FMS_Mode> local_2 = this.GetModeMS();
        this.SetbMatching(GetbMatching());
        this.SetMatchHint(TEUIModelRef<FVM_Match_HintComp>(::FVM_Match_HintComp::Create(this.GetContext().Manager)));
        return;
    }
    bool IsMatching() const
    {
        TEUIModelRef<FMS_Mode> local_2 = this.GetModeMS();
        return GetbMatching();
    }
    void OnModeMatchStatusUpdate(const FMsg_ModeMatchStatusUpdate &inout Msg)
    {
        if (!(this.GetbMatching()) != !(Msg.bMatching))
        {
            this.SetbMatching(Msg.bMatching);
            if (this.GetbMatching() && this.GetMatchHint().IsValid())
            {
                TEUIModelRef<FVM_Match_HintComp> local_4 = this.GetMatchHint();
                int(Msg.MatchMode).SetMatchContext(int(Msg.MatchId), int(Msg.CommissionId));
            }
        }
        return;
    }
    bool GetbMatching() const property
    {
        this.TrackPropertyRead(0);
        return this.m_bMatching;
    }
    void SetbMatching(const bool __Value) property
    {
        if (!(this.m_bMatching) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_bMatching = __Value;
        return;
    }
    TEUIModelRef<FVM_Match_HintComp> GetMatchHint() const property
    {
        this.TrackPropertyRead(1);
        return this.m_MatchHint;
    }
    void SetMatchHint(const TEUIModelRef<FVM_Match_HintComp> &inout __Value) property
    {
        TEUIModelRef<FVM_Match_HintComp> local_2;
        local_2 = this.m_MatchHint;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_MatchHint = __Value;
        return;
    }
    TEUIModelRef<FMS_Mode> GetModeMS() const property
    {
        this.TrackPropertyRead(2);
        return this.m_ModeMS;
    }
    void SetModeMS(const TEUIModelRef<FMS_Mode> &inout __Value) property
    {
        TEUIModelRef<FMS_Mode> local_2;
        local_2 = this.m_ModeMS;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ModeMS = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_Comp_Matching
{
    UPROPERTY()
    bool IsMatching;
    UPROPERTY()
    TEUIModelRef<FVM_Comp_Matching> Self;


}

namespace FVM_Comp_Matching
{
FVM_Comp_Matching& Get(const UObject ContextObject)
{
    return FVM_Comp_Matching::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_Comp_Matching GetByManager(const UEUIManagerSubsystem Manager)
{
    FVM_Comp_Matching __r;
    TEUIModelRef<FVM_Comp_Matching> local_6 = TEUIModelRef<FVM_Comp_Matching>(EUIInternal::MakeModelWithManager(Manager, FVM_Comp_Matching::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "bMatching";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MatchHint";
    local_14.TypeName = "TEUIModelRef<FVM_Match_HintComp>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsMatching";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_Comp_Matching>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_Comp_Matching;
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__OnModeMatchStatusUpdate";
    local_26.MessageTypeName = "Msg_ModeMatchStatusUpdate";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_Comp_Matching;
}
void __OnModeMatchStatusUpdate(FVM_Comp_Matching &inout Model, const FMsg_ModeMatchStatusUpdate &inout Message)
{
    Model.OnModeMatchStatusUpdate(Message);
    return;
}
bool __UIGetter_bMatching(const FVM_Comp_Matching &inout Model)
{
    return Model.GetbMatching();
}
TEUIModelRef<FVM_Match_HintComp> __UIGetter_MatchHint(const FVM_Comp_Matching &inout Model)
{
    return Model.GetMatchHint();
}
bool __UIGetter_IsMatching(const FVM_Comp_Matching &inout Model)
{
    return Model.IsMatching();
}
TEUIModelRef<FVM_Comp_Matching> __UIGetter_Self(const FVM_Comp_Matching &inout Model)
{
    return TEUIModelRef<FVM_Comp_Matching>(Model);
}
int __IndexOf_bMatching()
{
    return 0;
}
int __IndexOf_MatchHint()
{
    return 1;
}
int __IndexOf_ModeMS()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_Comp_Matching
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
