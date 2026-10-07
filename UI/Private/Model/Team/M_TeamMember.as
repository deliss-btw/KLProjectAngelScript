
enum ETeamType
{
    None,
    Social,
    Combat,
}

namespace FM_TeamMember
{
    const int ModelId = 0;

}
struct FM_TeamMember : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    FEUIModelWeakRef m_TeamRef;
    UPROPERTY()
    TEUIModelRef<FM_Player> m_Player;
    UPROPERTY()
    int m_MemberIndex;

    FM_TeamMember()
    {
        this.m_MemberIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FM_TeamMember' by default constructor.");
        return;
    }
    FM_TeamMember(const FM_TeamMember &inout Other)
    {
        this.m_MemberIndex = 0;
        this.m_TeamRef = Other.m_TeamRef;
        this.m_Player = Other.m_Player;
        this.m_MemberIndex = int(Other.m_MemberIndex);
        return;
    }
    FM_TeamMember(const FEUIModelWeakRef &inout InTeamRef)
    {
        this.m_MemberIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTeamRef(InTeamRef);
        return;
    }
    FM_TeamMember opAssign(const FM_TeamMember &inout Other)
    {
        FM_TeamMember __r;
        this.m_TeamRef = Other.m_TeamRef;
        this.m_Player = Other.m_Player;
        this.m_MemberIndex = int(Other.m_MemberIndex);
        return __r;
    }
    bool IsCaptain() const
    {
        TEUIModelRef<FM_TeamMember> local_4;
        local_4 = this.GetTeamCommonData().opArrow().Captain;
        return (local_4 == FEUIModelRef(this));
    }
    void RemoveFromTeam(const bool bRemoveEmptyItemFromMemberArray = true)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    ETeamType GetTeamType() const
    {
        FEUIModelRef local_2 = this.GetTeamRef().AsRef();
        if (!(local_2.IsValid()))
        {
            return ETeamType(0);
        }
        FEUIModelRef::IsA local_10;
        bool local_5 = local_10.opCall();
        if (local_5)
        {
            return ETeamType(1);
        }
        FEUIModelRef::IsA local_14;
        bool local_5_2 = local_14.opCall();
        if (local_5_2)
        {
            return ETeamType(2);
        }
        return ETeamType(0);
    }
    void OnCombatTeamChanged(const FMsg_CombatTeamChanged &inout Msg)
    {
        if (int(this.GetTeamType()) == 2)
        {
            this.SetMemberIndex(this.GetTeamCommonData().opArrow().Members.IndexOfByKey((TEUIModelRef<FM_TeamMember>(this))));
        }
        return;
    }
    void OnCombatTeamMemberChanged(const FMsg_CombatTeamMemberChanged &inout Msg)
    {
        if (int(this.GetTeamType()) == 2)
        {
            this.SetMemberIndex(this.GetTeamCommonData().opArrow().Members.IndexOfByKey((TEUIModelRef<FM_TeamMember>(this))));
        }
        return;
    }
    void OnSocialTeamChanged(const FMsg_SocialTeamChanged &inout Msg)
    {
        if (int(this.GetTeamType()) == 1)
        {
            this.SetMemberIndex(this.GetTeamCommonData().opArrow().Members.IndexOfByKey((TEUIModelRef<FM_TeamMember>(this))));
        }
        return;
    }
    void OnSocialTeamMemberChanged(const FMsg_SocialTeamMemberChanged &inout Msg)
    {
        if (int(this.GetTeamType()) == 1)
        {
            this.SetMemberIndex(this.GetTeamCommonData().opArrow().Members.IndexOfByKey((TEUIModelRef<FM_TeamMember>(this))));
        }
        return;
    }
    TConstRawPtr<FTeamCommonData> GetTeamCommonData() const
    {
        if (!(this.GetTeamRef().AsRef().IsValid()))
        {
            return TConstRawPtr<FTeamCommonData>(FTeamCommonData::Dummy);
        }
        FEUIModelRef::IsA local_14;
        bool local_5 = local_14.opCall();
        if (local_5)
        {
            Get local_18;
            return TConstRawPtr<FTeamCommonData>(local_18.opCall().GetTeamCommonData());
        }
        FEUIModelRef::IsA local_22;
        bool local_5_2 = local_22.opCall();
        if (local_5_2)
        {
            Get local_26;
            return TConstRawPtr<FTeamCommonData>(local_26.opCall().GetTeamCommonData());
        }
        return TConstRawPtr<FTeamCommonData>(FTeamCommonData::Dummy);
    }
    TRawPtr<FTeamCommonData> GetTeamCommonData()
    {
        if (!(this.GetTeamRef().AsRef().IsValid()))
        {
            return TRawPtr<FTeamCommonData>(nullptr);
        }
        FEUIModelRef::IsA local_14;
        bool local_5 = local_14.opCall();
        if (local_5)
        {
            Get local_18;
            return TRawPtr<FTeamCommonData>(local_18.opCall().GetModify_TeamCommonData());
        }
        FEUIModelRef::IsA local_22;
        bool local_5_2 = local_22.opCall();
        if (local_5_2)
        {
            Get local_26;
            return TRawPtr<FTeamCommonData>(local_26.opCall().GetModify_TeamCommonData());
        }
        return TRawPtr<FTeamCommonData>(nullptr);
    }
    const FEUIModelWeakRef GetTeamRef() const property
    {
        const FEUIModelWeakRef __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FEUIModelWeakRef GetModify_TeamRef() property
    {
        FEUIModelWeakRef __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTeamRef(const FEUIModelWeakRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TeamRef = __Value;
        return;
    }
    TEUIModelRef<FM_Player> GetPlayer() const property
    {
        this.TrackPropertyRead(1);
        return this.m_Player;
    }
    void SetPlayer(const TEUIModelRef<FM_Player> &inout __Value) property
    {
        TEUIModelRef<FM_Player> local_2;
        local_2 = this.m_Player;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Player = __Value;
        return;
    }
    int GetMemberIndex() const property
    {
        this.TrackPropertyRead(2);
        return this.m_MemberIndex;
    }
    void SetMemberIndex(const int __Value) property
    {
        if (this.m_MemberIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_MemberIndex = __Value;
        return;
    }
}

namespace FM_TeamMember
{
FM_TeamMember& Create(const UObject ContextObject, const FEUIModelWeakRef &inout TeamRef)
{
    return FM_TeamMember::CreateByManager(EUIInternal::GetContextManager(ContextObject), TeamRef);
}
FM_TeamMember CreateByManager(const UEUIManagerSubsystem Manager, const FEUIModelWeakRef &inout TeamRef)
{
    FM_TeamMember __r;
    TEUIModelRef<FM_TeamMember> local_6 = TEUIModelRef<FM_TeamMember>(EUIInternal::MakeModelWithManager_Generic(Manager, FM_TeamMember::ModelId, 0, TeamRef));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    FEUIModelMsgHandleDefine local_14;
    local_14.FunctionName = "__OnCombatTeamChanged";
    local_14.MessageTypeName = "Msg_CombatTeamChanged";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    local_14.FunctionName = "__OnCombatTeamMemberChanged";
    local_14.MessageTypeName = "Msg_CombatTeamMemberChanged";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    local_14.FunctionName = "__OnSocialTeamChanged";
    local_14.MessageTypeName = "Msg_SocialTeamChanged";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    local_14.FunctionName = "__OnSocialTeamMemberChanged";
    local_14.MessageTypeName = "Msg_SocialTeamMemberChanged";
    local_14.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_14);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_TeamMember;
}
void __OnCombatTeamChanged(FM_TeamMember &inout Model, const FMsg_CombatTeamChanged &inout Message)
{
    Model.OnCombatTeamChanged(Message);
    return;
}
void __OnCombatTeamMemberChanged(FM_TeamMember &inout Model, const FMsg_CombatTeamMemberChanged &inout Message)
{
    Model.OnCombatTeamMemberChanged(Message);
    return;
}
void __OnSocialTeamChanged(FM_TeamMember &inout Model, const FMsg_SocialTeamChanged &inout Message)
{
    Model.OnSocialTeamChanged(Message);
    return;
}
void __OnSocialTeamMemberChanged(FM_TeamMember &inout Model, const FMsg_SocialTeamMemberChanged &inout Message)
{
    Model.OnSocialTeamMemberChanged(Message);
    return;
}
int __IndexOf_TeamRef()
{
    return 0;
}
int __IndexOf_Player()
{
    return 1;
}
int __IndexOf_MemberIndex()
{
    return 2;
}
}
