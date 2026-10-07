
namespace FM_DraftPlayer
{
    const int ModelId = 0;

}
struct FM_DraftPlayer : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    TEUIModelRef<FM_Player> m_Player;
    UPROPERTY()
    uint m_DraftInviteReply;

    FM_DraftPlayer()
    {
        this.m_DraftInviteReply = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FM_DraftPlayer(const FM_DraftPlayer &inout Other)
    {
        this.m_DraftInviteReply = 0;
        this.m_Player = Other.m_Player;
        this.m_DraftInviteReply = int(Other.m_DraftInviteReply);
        return;
    }
    FM_DraftPlayer opAssign(const FM_DraftPlayer &inout Other)
    {
        FM_DraftPlayer __r;
        this.m_Player = Other.m_Player;
        this.m_DraftInviteReply = int(Other.m_DraftInviteReply);
        return __r;
    }
    bool HasReply() const
    {
        int local_1 = this.GetDraftInviteReply();
        return (local_1 != 0);
    }
    TEUIModelRef<FM_Player> GetPlayer() const property
    {
        this.TrackPropertyRead(0);
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
        this.MarkPropertyDirty(0);
        this.m_Player = __Value;
        return;
    }
    uint GetDraftInviteReply() const property
    {
        this.TrackPropertyRead(1);
        return this.m_DraftInviteReply;
    }
    void SetDraftInviteReply(const uint __Value) property
    {
        if (this.m_DraftInviteReply == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_DraftInviteReply = __Value;
        return;
    }
}

namespace DraftPlayerUtils
{
FText FormatDraftPlayerNames(const TArray<TEUIModelRef<FM_DraftPlayer>> &inout DraftPlayers)
{
    TArray<FText> local_4;
    for (auto& local_20 : DraftPlayers)
    {
        if (local_20)
        {
            TEUIModelRef<FM_Player> local_24 = local_20.opArrow().GetPlayer();
            TEUIModelRef<FM_Player> local_22;
            if (local_22)
            {
                local_4.Add(FText::FromString(local_22.opArrow().GetNickName()));
            }
            else
            {
                XError(ELog(27), FString().Append("Draft player in model ").Append(local_20.opArrow().GetUniqueNameString()).Append(" is empty."));
            }
        }
    }
    return FText::Join(UICommonUtil::PlayerNameSeparator, local_4);
}
}
namespace FM_DraftPlayer
{
FM_DraftPlayer& Create(const UObject ContextObject)
{
    return FM_DraftPlayer::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FM_DraftPlayer CreateByManager(const UEUIManagerSubsystem Manager)
{
    FM_DraftPlayer __r;
    TEUIModelRef<FM_DraftPlayer> local_6 = TEUIModelRef<FM_DraftPlayer>(EUIInternal::MakeModelWithManager(Manager, FM_DraftPlayer::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_DraftPlayer;
}
int __IndexOf_Player()
{
    return 0;
}
int __IndexOf_DraftInviteReply()
{
    return 1;
}
}
