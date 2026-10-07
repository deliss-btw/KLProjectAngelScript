
namespace FM_SocialTeam
{
    const int ModelId = 0;

}
struct FM_SocialTeam : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    uint64 m_TeamId;
    UPROPERTY()
    FTeamCommonData m_TeamCommonData;

    FM_SocialTeam()
    {
        this.m_TeamId = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FM_SocialTeam' by default constructor.");
        return;
    }
    FM_SocialTeam(const FM_SocialTeam &inout Other)
    {
        this.m_TeamId = 0;
        this.m_TeamId = Other.m_TeamId;
        return;
    }
    FM_SocialTeam(const uint64 InTeamId)
    {
        this.m_TeamId = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTeamId(InTeamId);
        return;
    }
    FM_SocialTeam opAssign(const FM_SocialTeam &inout Other)
    {
        FM_SocialTeam __r;
        this.m_TeamId = Other.m_TeamId;
        return __r;
    }
    const TArray<TEUIModelRef<FM_TeamMember>> GetMembers() const property
    {
        const TArray<TEUIModelRef<FM_TeamMember>> __r;
        return __r;
    }
    uint64 GetTeamId() const property
    {
        this.TrackPropertyRead(0);
        return this.m_TeamId;
    }
    void SetTeamId(const uint64 __Value) property
    {
        if (this.m_TeamId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TeamId = __Value;
        return;
    }
    FTeamCommonData GetTeamCommonData() const property
    {
        FTeamCommonData __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FTeamCommonData GetModify_TeamCommonData() property
    {
        FTeamCommonData __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetTeamCommonData(const FTeamCommonData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        return;
    }
}

namespace FM_SocialTeam
{
FM_SocialTeam& Create(const UObject ContextObject, const uint64 TeamId)
{
    return FM_SocialTeam::CreateByManager(EUIInternal::GetContextManager(ContextObject), TeamId);
}
FM_SocialTeam CreateByManager(const UEUIManagerSubsystem Manager, const uint64 TeamId)
{
    FM_SocialTeam __r;
    TEUIModelRef<FM_SocialTeam> local_6 = TEUIModelRef<FM_SocialTeam>(EUIInternal::MakeModelWithManager_Generic(Manager, FM_SocialTeam::ModelId, 0, TeamId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_SocialTeam;
}
int __IndexOf_TeamId()
{
    return 0;
}
int __IndexOf_TeamCommonData()
{
    return 1;
}
}
