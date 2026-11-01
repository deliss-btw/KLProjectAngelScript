namespace FMS_LocalPlayerTeamData
{
    const int ModelId = 0;

}
struct FLocalPlayerTeamMember
{
    UPROPERTY()
    TMap<ETeamType, TEUIModelRef<FM_TeamMember>> TeamMembers;

    FLocalPlayerTeamMember()
    {
        return;
    }
}

struct FMS_LocalPlayerTeamData : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TMap<TEUIModelRef<FM_Player>, FLocalPlayerTeamMember> m_LocalPlayerTeamMembers;
    UPROPERTY()
    TEUIModelWeakRef<FM_CombatTeam> m_LocalPlayerCombatTeam;
    UPROPERTY()
    TEUIModelWeakRef<FM_SocialTeam> m_LocalPlayerSocialTeam;

    FMS_LocalPlayerTeamData()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_LocalPlayerTeamData(const FMS_LocalPlayerTeamData &inout Other)
    {
        this.m_LocalPlayerTeamMembers = Other.m_LocalPlayerTeamMembers;
        this.m_LocalPlayerCombatTeam = Other.m_LocalPlayerCombatTeam;
        this.m_LocalPlayerSocialTeam = Other.m_LocalPlayerSocialTeam;
        return;
    }
    FMS_LocalPlayerTeamData& opAssign(const FMS_LocalPlayerTeamData &inout Other)
    {
        this.m_LocalPlayerTeamMembers = Other.m_LocalPlayerTeamMembers;
        this.m_LocalPlayerCombatTeam = Other.m_LocalPlayerCombatTeam;
        return Other.m_LocalPlayerSocialTeam;
    }
    bool IsInAnyTeam() const
    {
        if (::FTeamUtils::GetIsInCityTeamState())
        {
            return this.GetLocalPlayerSocialTeam().IsValid();
        }
        return this.GetLocalPlayerCombatTeam().IsValid() || this.GetLocalPlayerSocialTeam().IsValid();
    }
    bool IsInTeam(const ETeamType TeamType) const
    {
        switch (int(TeamType))
        {
        case 2:
        {
            return this.GetLocalPlayerCombatTeam().IsValid();
        }
        case 1:
        {
            return this.GetLocalPlayerSocialTeam().IsValid();
        }
        }
        return false;
    }
    bool SelfIsSocialTeamCaptain() const
    {
        if (!(this.GetLocalPlayerSocialTeam().IsValid()))
        {
            return false;
        }
        for (auto& local_18 : this.GetLocalPlayerSocialTeam().Get().GetMembers())
        {
            if (local_18.Get().GetPlayer().opArrow().GetPlayerUid() == ::FMS_PlayerData::Get(this.GetManager()).GetLocalPlayerData().opArrow().GetPlayerUid())
            {
                return local_18.Get().IsCaptain();
            }
        }
        return false;
    }
    bool IsAnyTeamMember(const TEUIModelRef<FM_Player> &inout Player) const
    {
        if (::FTeamUtils::GetIsInCityTeamState())
        {
            return this.IsTeamMember(Player, ETeamType(1));
        }
        return this.GetLocalPlayerTeamMembers().Contains(Player);
    }
    bool IsTeamMember(const TEUIModelRef<FM_Player> &inout Player, const ETeamType TeamType) const
    {
        TConstRawPtr<FLocalPlayerTeamMember> local_2 = this.GetLocalPlayerTeamMembers().Find(Player);
        if (local_2)
        {
            return local_2.opArrow().TeamMembers.Contains(TeamType);
        }
        return false;
    }
    bool IsTeamMember(const uint Uid, const ETeamType TeamType) const
    {
        for (auto& local_20 : this.GetLocalPlayerTeamMembers())
        {
            if (local_20.GetKey().opArrow().GetPlayerUid() == Uid)
            {
                return local_20.GetValue().TeamMembers.Contains(TeamType);
            }
        }
        return false;
    }
    int GetTeamMemberCount(const ETeamType TeamType) const
    {
        if (this.GetLocalPlayerSocialTeam().Get())
        {
            if (int(TeamType) == 2)
            {
                return this.GetLocalPlayerCombatTeam().Get().GetMembers().Num();
            }
            if (int(TeamType) == 1)
            {
                return this.GetLocalPlayerSocialTeam().Get().GetMembers().Num();
            }
        }
        return 0;
    }
    TEUIModelRef<FM_TeamMember> GetTeamMember(const TEUIModelRef<FM_Player> &inout Player, const ETeamType TeamType) const
    {
        TConstRawPtr<FLocalPlayerTeamMember> local_2 = this.GetLocalPlayerTeamMembers().Find(Player);
        if (local_2)
        {
            TConstRawPtr<TEUIModelRef<FM_TeamMember>> local_8 = local_2.opArrow().TeamMembers.Find(TeamType);
            if (local_8)
            {
                return local_8.Get();
            }
        }
        return TEUIModelRef<FM_TeamMember>();
    }
    TEUIModelRef<FM_TeamMember> GetTeamMemberInAnyTeam(const TEUIModelRef<FM_Player> &inout Player) const
    {
        TConstRawPtr<FLocalPlayerTeamMember> local_2 = this.GetLocalPlayerTeamMembers().Find(Player);
        if (local_2)
        {
            if (!(::FTeamUtils::GetIsInCityTeamState()))
            {
                TConstRawPtr<TEUIModelRef<FM_TeamMember>> local_8 = local_2.opArrow().TeamMembers.Find(ETeamType(2));
                if (local_8)
                {
                    return local_8.Get();
                }
            }
            TConstRawPtr<TEUIModelRef<FM_TeamMember>> local_10 = local_2.opArrow().TeamMembers.Find(ETeamType(1));
            if (local_10)
            {
                return local_10.Get();
            }
        }
        return TEUIModelRef<FM_TeamMember>();
    }
    bool IsAllSocialTeamMembersInSameDS() const
    {
        if (!(this.GetLocalPlayerSocialTeam().IsValid()))
        {
            return false;
        }
        for (auto& local_22 : this.GetLocalPlayerTeamMembers())
        {
            if (local_22.GetValue().TeamMembers.Contains(ETeamType(1)))
            {
                if (!(local_22.GetKey().opArrow().GetPlayerEntity().IsValid()))
                {
                    return false;
                }
            }
        }
        return true;
    }
    void ForgetMuteIfNotTeammate(const uint Uid)
    {
        if (!(::VOXUtils::IsPlayerMuted(Uid)))
        {
            return;
        }
        if (this.IsUidInSocialTeamSource(Uid))
        {
            return;
        }
        if ((int(::FTeamUtils::GetCombatTeamRule())) != 1 && this.IsUidInCombatTeamSource(Uid))
        {
            return;
        }
        XLog(ELog(16), FString().Append("[VOX][MuteClear] forget mute uid=").Append(Uid).Append(" (left all voice teams)"));
        ::VOXUtils::UnmutePlayer(Uid);
        return;
    }
    bool IsUidInSocialTeamSource(const uint Uid) const
    {
        TEUIModelRef<FM_SocialTeam> local_4 = ::FMS_PlayerSocialTeamData::Get(this.GetManager()).GetLocalPlayerTeam();
        if (!(local_4.IsValid()))
        {
            return false;
        }
        for (auto& local_22 : local_4.Get().GetMembers())
        {
            if (local_22.IsValid() && local_22.Get().GetPlayer().IsValid() && (local_22.Get().GetPlayer().opArrow().GetPlayerUid() == Uid))
            {
                return true;
            }
        }
        return false;
    }
    bool IsUidInCombatTeamSource(const uint Uid) const
    {
        TEUIModelRef<FM_CombatTeam> local_4 = ::FMS_PlayerCombatTeamData::Get(this.GetManager()).GetLocalPlayerCombatTeam();
        if (!(local_4.IsValid()))
        {
            return false;
        }
        for (auto& local_22 : local_4.Get().GetMembers())
        {
            if (local_22.IsValid() && local_22.Get().GetPlayer().IsValid() && (local_22.Get().GetPlayer().opArrow().GetPlayerUid() == Uid))
            {
                return true;
            }
        }
        return false;
    }
    void PostConstruct()
    {
        this.SetLocalPlayerCombatTeam(TEUIModelWeakRef<FM_CombatTeam>(::FMS_PlayerCombatTeamData::Get(this.GetManager()).GetLocalPlayerCombatTeam().Get()));
        this.SetLocalPlayerSocialTeam(TEUIModelWeakRef<FM_SocialTeam>(::FMS_PlayerSocialTeamData::Get(this.GetManager()).GetLocalPlayerTeam().Get()));
        this.FullyUpdateCombatTeam();
        this.FullyUpdateSocialTeam();
        return;
    }
    void OnLocalPlayerCombatTeamChanged(const FMsg_CombatTeamChanged &inout Msg)
    {
        TEUIModelWeakRef<FM_CombatTeam> local_6 = TEUIModelWeakRef<FM_CombatTeam>(::FMS_PlayerCombatTeamData::Get(this.GetManager()).GetLocalPlayerCombatTeam().Get());
        this.SetLocalPlayerCombatTeam(local_6);
        this.FullyUpdateCombatTeam();
        TEUIModelWeakRef<FM_CombatTeam> local_6_2 = this.GetLocalPlayerCombatTeam();
        if (local_6_2.IsValid())
        {
            TEUIModelWeakRef<FM_CombatTeam> local_6_3 = this.GetLocalPlayerCombatTeam();
            this.LogTeamInfo("CombatTeamChanged", local_6_3.opArrow().GetTeamCommonData());
            return;
        }
        XLog(ELog(16), FString().Append("[LocalPlayerTeamData] CombatTeam is invalid"));
        return;
    }
    void OnLocalPlayerCombatTeamMemberChanged(const FMsg_CombatTeamMemberChanged &inout Msg)
    {
        TEUIModelWeakRef<FM_CombatTeam> local_6 = TEUIModelWeakRef<FM_CombatTeam>(::FMS_PlayerCombatTeamData::Get(this.GetManager()).GetLocalPlayerCombatTeam().Get());
        this.SetLocalPlayerCombatTeam(local_6);
        this.FullyUpdateCombatTeam();
        TEUIModelWeakRef<FM_CombatTeam> local_6_2 = this.GetLocalPlayerCombatTeam();
        if (local_6_2.IsValid())
        {
            TEUIModelWeakRef<FM_CombatTeam> local_6_3 = this.GetLocalPlayerCombatTeam();
            this.LogTeamInfo("CombatTeamMemberChanged", local_6_3.opArrow().GetTeamCommonData());
            return;
        }
        XLog(ELog(16), FString().Append("[LocalPlayerTeamData] CombatTeam is invalid"));
        return;
    }
    void OnLocalPlayerSocialTeamChanged(const FMsg_SocialTeamChanged &inout Msg)
    {
        TEUIModelWeakRef<FM_SocialTeam> local_6 = TEUIModelWeakRef<FM_SocialTeam>(::FMS_PlayerSocialTeamData::Get(this.GetManager()).GetLocalPlayerTeam().Get());
        this.SetLocalPlayerSocialTeam(local_6);
        this.FullyUpdateSocialTeam();
        TEUIModelWeakRef<FM_SocialTeam> local_6_2 = this.GetLocalPlayerSocialTeam();
        if (local_6_2.IsValid())
        {
            TEUIModelWeakRef<FM_SocialTeam> local_6_3 = this.GetLocalPlayerSocialTeam();
            this.LogTeamInfo("SocialTeamChanged", local_6_3.opArrow().GetTeamCommonData());
            return;
        }
        XLog(ELog(16), FString().Append("[LocalPlayerTeamData] SocialTeam is invalid"));
        return;
    }
    void OnLocalPlayerSocialTeamMemberChanged(const FMsg_SocialTeamMemberChanged &inout Msg)
    {
        TEUIModelWeakRef<FM_SocialTeam> local_6 = TEUIModelWeakRef<FM_SocialTeam>(::FMS_PlayerSocialTeamData::Get(this.GetManager()).GetLocalPlayerTeam().Get());
        this.SetLocalPlayerSocialTeam(local_6);
        this.FullyUpdateSocialTeam();
        TEUIModelWeakRef<FM_SocialTeam> local_6_2 = this.GetLocalPlayerSocialTeam();
        if (local_6_2.IsValid())
        {
            TEUIModelWeakRef<FM_SocialTeam> local_6_3 = this.GetLocalPlayerSocialTeam();
            this.LogTeamInfo("SocialMemberChanged", local_6_3.opArrow().GetTeamCommonData());
            return;
        }
        XLog(ELog(16), FString().Append("[LocalPlayerTeamData] SocialTeam is invalid"));
        return;
    }
    void LogTeamInfo(const FString &inout TeamTypeName, const FTeamCommonData &inout TeamCommonData)
    {
        XLog(ELog(16), FString().Append("[LocalPlayerTeamData] ").Append(TeamTypeName).Append(" Team Updated, MemberCount: ").Append(TeamCommonData.Members.Num()));
        for (auto& local_22 : TeamCommonData.Members)
        {
            if (local_22.IsValid() && local_22.Get().GetPlayer().IsValid())
            {
                XLog(ELog(16), FString().Append("[LocalPlayerTeamData]   Member Index=").Append(local_22.Get().GetMemberIndex()).Append(", Name=").Append(local_22.Get().GetPlayer().opArrow().GetNickName()).Append(", Uid=").Append(local_22.Get().GetPlayer().opArrow().GetPlayerUid()));
            }
        }
        return;
    }
    void FullyUpdateCombatTeam()
    {
        if (!(this.GetLocalPlayerCombatTeam()))
        {
            if (!(this.GetLocalPlayerSocialTeam()))
            {
                this.GetModify_LocalPlayerTeamMembers().Empty(0);
                return;
            }
            this.ClearTeamMembersOfType(ETeamType(2));
            return;
        }
        this.FullyUpdateTeamMembers(ETeamType(2), this.GetLocalPlayerCombatTeam().opArrow().GetTeamCommonData());
        return;
    }
    void FullyUpdateSocialTeam()
    {
        if (!(this.GetLocalPlayerSocialTeam()))
        {
            if (!(this.GetLocalPlayerCombatTeam()))
            {
                this.GetModify_LocalPlayerTeamMembers().Empty(0);
                return;
            }
            this.ClearTeamMembersOfType(ETeamType(1));
            return;
        }
        this.FullyUpdateTeamMembers(ETeamType(1), this.GetLocalPlayerSocialTeam().opArrow().GetTeamCommonData());
        return;
    }
    void FullyUpdateTeamMembers(const ETeamType TeamType, const FTeamCommonData &inout TeamCommonData)
    {
        TMap<TEUIModelRef<FM_Player>, TEUIModelRef<FM_TeamMember>> local_20;
        for (auto& local_36 : TeamCommonData.Members)
        {
            local_20.Add(local_36.opArrow().GetPlayer(), local_36);
        }
        TArray<TEUIModelRef<FM_Player>> local_42;
        for (auto& local_60 : this.GetModify_LocalPlayerTeamMembers())
        {
            if (local_20.Contains(local_60.GetKey()))
            {
                continue;
            }
            local_60.GetValue().TeamMembers.Remove(TeamType);
            if (local_60.GetValue().TeamMembers.IsEmpty())
            {
                local_42.Add(local_60.GetKey());
            }
        }
        for (auto& local_76 : local_42)
        {
            this.GetModify_LocalPlayerTeamMembers().Remove(local_76);
        }
        for (auto& local_94 : local_20)
        {
            FLocalPlayerTeamMember& local_96 = this.GetModify_LocalPlayerTeamMembers().FindOrAdd(local_94.GetKey());
            if (local_96.TeamMembers.Contains(TeamType))
            {
                local_96.TeamMembers.Remove(TeamType);
            }
            local_96.TeamMembers.Add(TeamType, local_94.GetValue());
        }
        return;
    }
    void ClearTeamMembersOfType(const ETeamType TeamType)
    {
        TArray<TEUIModelRef<FM_Player>> local_4;
        for (auto& local_24 : this.GetModify_LocalPlayerTeamMembers())
        {
            local_24.GetValue().TeamMembers.Remove(TeamType);
            if (local_24.GetValue().TeamMembers.IsEmpty())
            {
                local_4.Add(local_24.GetKey());
            }
        }
        for (auto& local_40 : local_4)
        {
            this.GetModify_LocalPlayerTeamMembers().Remove(local_40);
        }
        return;
    }
    const TMap<TEUIModelRef<FM_Player>, FLocalPlayerTeamMember> GetLocalPlayerTeamMembers() const property
    {
        const TMap<TEUIModelRef<FM_Player>, FLocalPlayerTeamMember> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TMap<TEUIModelRef<FM_Player>, FLocalPlayerTeamMember> GetModify_LocalPlayerTeamMembers() property
    {
        TMap<TEUIModelRef<FM_Player>, FLocalPlayerTeamMember> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetLocalPlayerTeamMembers(const TMap<TEUIModelRef<FM_Player>, FLocalPlayerTeamMember> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_LocalPlayerTeamMembers = __Value;
        return;
    }
    TEUIModelWeakRef<FM_CombatTeam> GetLocalPlayerCombatTeam() const property
    {
        this.TrackPropertyRead(1);
        return this.m_LocalPlayerCombatTeam;
    }
    void SetLocalPlayerCombatTeam(const TEUIModelWeakRef<FM_CombatTeam> &inout __Value) property
    {
        TEUIModelWeakRef<FM_CombatTeam> local_2;
        local_2 = this.m_LocalPlayerCombatTeam;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_LocalPlayerCombatTeam = __Value;
        return;
    }
    TEUIModelWeakRef<FM_SocialTeam> GetLocalPlayerSocialTeam() const property
    {
        this.TrackPropertyRead(2);
        return this.m_LocalPlayerSocialTeam;
    }
    void SetLocalPlayerSocialTeam(const TEUIModelWeakRef<FM_SocialTeam> &inout __Value) property
    {
        TEUIModelWeakRef<FM_SocialTeam> local_2;
        local_2 = this.m_LocalPlayerSocialTeam;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_LocalPlayerSocialTeam = __Value;
        return;
    }
}

namespace FMS_LocalPlayerTeamData
{
FMS_LocalPlayerTeamData& Get(const UObject ContextObject)
{
    return FMS_LocalPlayerTeamData::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_LocalPlayerTeamData& GetByManager(const UEUIManagerSubsystem Manager)
{
    return TEUIModelRef<FMS_LocalPlayerTeamData>(EUIInternal::MakeModelWithManager(Manager, FMS_LocalPlayerTeamData::ModelId)).Get();
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMetaPropertyModelRef local_6;
    local_6.PropertyName = FName("LocalPlayerCombatTeam");
    local_6.PropertyRefModelTypeId = FM_CombatTeam::ModelId;
    Result.FunctionalPropertyModelRefs.Add(local_6);
    FEUIModelMsgHandleDefine local_18;
    local_18.FunctionName = "__OnLocalPlayerCombatTeamChanged";
    local_18.MessageTypeName = "Msg_CombatTeamChanged";
    local_18.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_18);
    local_18.FunctionName = "__OnLocalPlayerCombatTeamMemberChanged";
    local_18.MessageTypeName = "Msg_CombatTeamMemberChanged";
    local_18.SourcePropertyModelRefs = FBitSet64(1);
    Result.MessageHandleFunctions.Add(local_18);
    local_18.FunctionName = "__OnLocalPlayerSocialTeamChanged";
    local_18.MessageTypeName = "Msg_SocialTeamChanged";
    local_18.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_18);
    local_18.FunctionName = "__OnLocalPlayerSocialTeamMemberChanged";
    local_18.MessageTypeName = "Msg_SocialTeamMemberChanged";
    local_18.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_18);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_LocalPlayerTeamData;
}
void __OnLocalPlayerCombatTeamChanged(FMS_LocalPlayerTeamData &inout Model, const FMsg_CombatTeamChanged &inout Message)
{
    Model.OnLocalPlayerCombatTeamChanged(Message);
    return;
}
void __OnLocalPlayerCombatTeamMemberChanged(FMS_LocalPlayerTeamData &inout Model, const FMsg_CombatTeamMemberChanged &inout Message)
{
    Model.OnLocalPlayerCombatTeamMemberChanged(Message);
    return;
}
void __OnLocalPlayerSocialTeamChanged(FMS_LocalPlayerTeamData &inout Model, const FMsg_SocialTeamChanged &inout Message)
{
    Model.OnLocalPlayerSocialTeamChanged(Message);
    return;
}
void __OnLocalPlayerSocialTeamMemberChanged(FMS_LocalPlayerTeamData &inout Model, const FMsg_SocialTeamMemberChanged &inout Message)
{
    Model.OnLocalPlayerSocialTeamMemberChanged(Message);
    return;
}
int __IndexOf_LocalPlayerTeamMembers()
{
    return 0;
}
int __IndexOf_LocalPlayerCombatTeam()
{
    return 1;
}
int __IndexOf_LocalPlayerSocialTeam()
{
    return 2;
}
}
