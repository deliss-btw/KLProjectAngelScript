
namespace FM_Draft
{
    const int ModelId = 0;

}
struct FM_Draft : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    uint64 m_InstId;
    UPROPERTY()
    uint m_DraftInviteResult;
    UPROPERTY()
    TArray<TEUIModelRef<FM_DraftPlayer>> m_DraftPlayers;
    UPROPERTY()
    FEUIModelRef m_TypedDraftData;

    FM_Draft()
    {
        this.m_InstId = 0;
        this.m_DraftInviteResult = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FM_Draft' by default constructor.");
        return;
    }
    FM_Draft(const FM_Draft &inout Other)
    {
        this.m_InstId = 0;
        this.m_DraftInviteResult = 0;
        this.m_InstId = Other.m_InstId;
        this.m_DraftInviteResult = int(Other.m_DraftInviteResult);
        this.m_DraftPlayers = Other.m_DraftPlayers;
        this.m_TypedDraftData = Other.m_TypedDraftData;
        return;
    }
    FM_Draft(const uint64 InInstId)
    {
        this.m_InstId = 0;
        this.m_DraftInviteResult = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetInstId(InInstId);
        return;
    }
    FM_Draft& opAssign(const FM_Draft &inout Other)
    {
        this.m_InstId = Other.m_InstId;
        this.m_DraftInviteResult = int(Other.m_DraftInviteResult);
        this.m_DraftPlayers = Other.m_DraftPlayers;
        return Other.m_TypedDraftData;
    }
    void RequestReplyDraftInvite(const bool bAgree)
    {
        FMS_DraftData& local_2 = ::FMS_DraftData::Get(this.GetContext().Manager);
        int local_3 = bAgree ? 1 : 2;
        local_2.GS_RequestReplyDraftInvite(TEUIModelRef<FM_Draft>(this), local_3);
        return;
    }
    void DeleteDraft()
    {
        ::FMS_DraftData::Get(this.GetContext().Manager).DeleteDraft(TEUIModelRef<FM_Draft>(this));
        return;
    }
    TEUIModelRef<FM_DraftPlayer> GetLocalDraftPlayer() const
    {
        TEUIModelRef<FM_DraftPlayer> local_10;
        TEUIModelRef<FM_Player> local_2 = ::FMS_PlayerData::Get(this.GetContext().Manager).GetLocalPlayerData();
        if (!(local_2.IsValid()))
        {
            return local_10;
        }
        for (auto& local_24 : this.GetDraftPlayers())
        {
            if ((local_24.opArrow().GetPlayer() == local_2.opImplConv()))
            {
                return local_24;
            }
        }
        return local_10;
    }
    TEUIModelRef<FM_DraftPlayer> GetDraftPlayerByUid(const uint PlayerUid) const
    {
        for (auto& local_16 : this.GetDraftPlayers())
        {
            if (local_16.opArrow().GetPlayer().opArrow().GetPlayerUid() == PlayerUid)
            {
                return local_16;
            }
        }
        return TEUIModelRef<FM_DraftPlayer>();
    }
    TArray<TEUIModelRef<FM_DraftPlayer>> FindDraftPlayersWithReplyType(const uint DraftInviteReply) const
    {
        TArray<TEUIModelRef<FM_DraftPlayer>> local_4;
        for (auto& local_20 : this.GetDraftPlayers())
        {
            if (local_20.opArrow().GetDraftInviteReply() == DraftInviteReply)
            {
                local_4.Add(local_20);
            }
        }
        return local_4;
    }
    uint64 GetInstId() const property
    {
        this.TrackPropertyRead(0);
        return this.m_InstId;
    }
    void SetInstId(const uint64 __Value) property
    {
        if (this.m_InstId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_InstId = __Value;
        return;
    }
    uint GetDraftInviteResult() const property
    {
        this.TrackPropertyRead(1);
        return this.m_DraftInviteResult;
    }
    void SetDraftInviteResult(const uint __Value) property
    {
        if (this.m_DraftInviteResult == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_DraftInviteResult = __Value;
        return;
    }
    TArray<TEUIModelRef<FM_DraftPlayer>> GetDraftPlayers() const property
    {
        TArray<TEUIModelRef<FM_DraftPlayer>> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<TEUIModelRef<FM_DraftPlayer>> GetModify_DraftPlayers() property
    {
        TArray<TEUIModelRef<FM_DraftPlayer>> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetDraftPlayers(const TArray<TEUIModelRef<FM_DraftPlayer>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_DraftPlayers = __Value;
        return;
    }
    FEUIModelRef GetTypedDraftData() const property
    {
        FEUIModelRef __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FEUIModelRef GetModify_TypedDraftData() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetTypedDraftData(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_TypedDraftData = __Value;
        return;
    }
}

namespace FM_Draft
{
FM_Draft& Create(const UObject ContextObject, const uint64 InstId)
{
    return FM_Draft::CreateByManager(EUIInternal::GetContextManager(ContextObject), InstId);
}
FM_Draft CreateByManager(const UEUIManagerSubsystem Manager, const uint64 InstId)
{
    FM_Draft __r;
    TEUIModelRef<FM_Draft> local_6 = TEUIModelRef<FM_Draft>(EUIInternal::MakeModelWithManager_Generic(Manager, FM_Draft::ModelId, 0, InstId));
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
    return FM_Draft;
}
int __IndexOf_InstId()
{
    return 0;
}
int __IndexOf_DraftInviteResult()
{
    return 1;
}
int __IndexOf_DraftPlayers()
{
    return 2;
}
int __IndexOf_TypedDraftData()
{
    return 3;
}
}
