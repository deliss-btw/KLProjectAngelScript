
namespace FVM_ChatInputPanel
{
    const int ModelId = 0;

}
struct FVM_ChatInputPanel : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FMS_ChatRuntimeData> m_ChatRuntimeData;
    UPROPERTY()
    TEUIModelRef<FVMS_ChatMain> m_ChatMain;
    UPROPERTY()
    FString m_AlreadyInputText;
    UPROPERTY()
    FString m_TempInputText;
    UPROPERTY()
    int m_InputStateIndex;
    UPROPERTY()
    FText m_BanTipsText;
    UPROPERTY()
    bool m_bInSocialTeam;
    UPROPERTY()
    FString m_ClampedInputText;
    UPROPERTY()
    int m_InputFocusRequestNonce;

    FVM_ChatInputPanel()
    {
        this.m_InputStateIndex = 0;
        this.m_bInSocialTeam = false;
        this.m_InputFocusRequestNonce = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_ChatInputPanel(const FVM_ChatInputPanel &inout Other)
    {
        this.m_InputStateIndex = 0;
        this.m_bInSocialTeam = false;
        this.m_InputFocusRequestNonce = 0;
        this.m_ChatRuntimeData = Other.m_ChatRuntimeData;
        this.m_ChatMain = Other.m_ChatMain;
        this.m_AlreadyInputText = Other.m_AlreadyInputText;
        this.m_TempInputText = Other.m_TempInputText;
        this.m_InputStateIndex = int(Other.m_InputStateIndex);
        this.m_BanTipsText = Other.m_BanTipsText;
        this.m_bInSocialTeam = Other.m_bInSocialTeam;
        this.m_ClampedInputText = Other.m_ClampedInputText;
        this.m_InputFocusRequestNonce = int(Other.m_InputFocusRequestNonce);
        return;
    }
    FVM_ChatInputPanel opAssign(const FVM_ChatInputPanel &inout Other)
    {
        FVM_ChatInputPanel __r;
        this.m_ChatRuntimeData = Other.m_ChatRuntimeData;
        this.m_ChatMain = Other.m_ChatMain;
        this.m_AlreadyInputText = Other.m_AlreadyInputText;
        this.m_TempInputText = Other.m_TempInputText;
        this.m_InputStateIndex = int(Other.m_InputStateIndex);
        this.m_BanTipsText = Other.m_BanTipsText;
        this.m_bInSocialTeam = Other.m_bInSocialTeam;
        this.m_ClampedInputText = Other.m_ClampedInputText;
        this.m_InputFocusRequestNonce = int(Other.m_InputFocusRequestNonce);
        return __r;
    }
    void PostConstruct()
    {
        this.SetChatRuntimeData(TEUIModelRef<FMS_ChatRuntimeData>(::FMS_ChatRuntimeData::Get(this.GetContext().Manager)));
        this.SetChatMain(TEUIModelRef<FVMS_ChatMain>(::FVMS_ChatMain::Get(this.GetContext().Manager)));
        this.RefreshInputState();
        this.SyncInputTextFromRuntimeCache();
        return;
    }
    void OnChatInputDeferredWeakTips(const FMsg_ChatInputDeferredWeakTips &inout Msg)
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void OnChatChannelChanged()
    {
        this.RefreshInputState();
        this.SyncInputTextFromRuntimeCache();
        return;
    }
    void OnPrivatePeerChangedForInputDraft()
    {
        this.SyncInputTextFromRuntimeCache();
        return;
    }
    void OnInputTextChanged(const FText &inout Text)
    {
        if (this.GetChatRuntimeData().IsValid())
        {
            this.SetTempInputText(Text.ToString());
            XLog(ELog(74), FString().Append("xxxxxx ModelChanged [OnInputTextChanged] TempInputText: ").Append(this.GetTempInputText()));
            TEUIModelRef<FMS_ChatRuntimeData> local_2 = this.GetChatRuntimeData();
            this.GetTempInputText().CacheCurrentChannelInputText();
        }
        return;
    }
    void OnPlayerInTeamChanged(const FC_PlayerInTeam &inout PlayerInTeam)
    {
        this.RefreshInputState();
        return;
    }
    void OnPlayerSocialTeamChanged(const FC_DSPlayerInfo &inout DSPlayerInfo)
    {
        bool local_7;
        if (!(DSPlayerInfo))
        {
            local_7 = true;
        }
        else
        {
            bool local_8 = !(this.GetbInSocialTeam());
            int64 local_4 = DSPlayerInfo.GetSocialTeamId();
            local_8 = (local_8 != (!((local_4 != 0))));
            local_7 = local_8;
        }
        if (local_7)
        {
            this.RefreshInputState();
        }
        return;
    }
    void SetClamped(const FString &inout Clamped)
    {
        this.SetClampedInputText(Clamped);
        this.SetTempInputText(Clamped);
        return;
    }
    void RequestChatInputFocus()
    {
        this.SetInputFocusRequestNonce((this.GetInputFocusRequestNonce() + 1));
        return;
    }
    bool TryCommitInputText(const ETextCommit CommitMethod)
    {
        if (int(CommitMethod) != 1)
        {
            return false;
        }
        if (this.GetInputStateIndex() != 0)
        {
            return false;
        }
        if (!(this.GetChatMain().IsValid()) || !(this.GetChatMain().opArrow().CanSendChat()))
        {
            return false;
        }
        FString local_16 = this.GetTempInputText().TrimStartAndEnd();
        if (local_16.IsEmpty())
        {
            return false;
        }
        this.GetChatMain().opArrow().SubmitChatText(local_16);
        this.SetTempInputText("");
        this.SetAlreadyInputText("");
        TEUIModelRef<FMS_ChatRuntimeData> local_18 = this.GetChatRuntimeData();
        this.GetTempInputText().CacheCurrentChannelInputText();
        return true;
    }
    void RefreshInputState()
    {
        int local_3;
        const UChatSettings local_14;
        bool local_23;
        bool local_24;
        int local_1 = 0;
        local_3 = int(this.GetChatRuntimeData().opArrow().GetSelectMainTab());
        int local_2 = local_3;
        if (local_2 == 2)
        {
            local_1 = this.GetInputStateIndex();
        }
        int local_8 = local_3;
        if (local_8 == 1)
        {
            local_1 = 0;
        }
        else
        {
            int local_10;
            local_10 = int(this.GetChatRuntimeData().opArrow().GetSelectChannelTab());
            GetGameplaySettings<UChatSettings> local_16;
            local_14 = local_16;
            int local_2_2 = local_10;
            if (local_2_2 == 3)
            {
                local_1 = this.IsInBattleTeam() ? 0 : 1;
                if (local_14 != nullptr)
                {
                    this.SetBanTipsText(::ChatSystemUtil::ResolveKLTextData(local_14.ChatInputBanTipsBattleTeamTextData));
                }
            }
            else
            {
                int local_8_2 = local_10;
                if (local_8_2 == 2)
                {
                    this.SetbInSocialTeam(this.IsInSocialTeam());
                    local_1 = this.GetbInSocialTeam() ? 0 : 1;
                    if (local_14 != nullptr)
                    {
                        this.SetBanTipsText(::ChatSystemUtil::ResolveKLTextData(local_14.ChatInputBanTipsSocialTeamTextData));
                    }
                }
                else
                {
                    int local_2_3 = local_10;
                    if (local_2_3 == 4)
                    {
                        local_1 = 1;
                        if (local_14 != nullptr)
                        {
                            this.SetBanTipsText(::ChatSystemUtil::ResolveKLTextData(local_14.ChatInputBanTipsSystemTabTextData));
                        }
                    }
                    else
                    {
                        int local_8_3 = local_10;
                        if (local_8_3 == 7)
                        {
                            local_1 = 1;
                            if (local_14 != nullptr)
                            {
                                this.SetBanTipsText(::ChatSystemUtil::ResolveKLTextData(local_14.ChatInputBanTipsRecruitTabTextData));
                            }
                        }
                    }
                }
            }
        }
        this.SetInputStateIndex(local_1);
        if (this.GetInputStateIndex() != 0)
        {
            local_24 = false;
        }
        else
        {
            int local_8_4 = local_3;
            if (local_8_4 == 1)
            {
                local_23 = true;
            }
            else
            {
                int local_8_5 = local_3;
                local_23 = (local_8_5 == 0);
            }
            local_24 = local_23;
        }
        if (local_24)
        {
            this.RequestChatInputFocus();
        }
        return;
    }
    void SyncInputTextFromRuntimeCache()
    {
        if (this.GetChatRuntimeData().IsValid())
        {
            TEUIModelRef<FMS_ChatRuntimeData> local_2 = this.GetChatRuntimeData();
            FString local_8;
            local_8.GetCachedInputTextForCurrentSelection();
            this.SetTempInputText(local_8);
            this.SetAlreadyInputText(this.GetTempInputText());
            XLog(ELog(74), local_8.Append("xxxxxx SyncInputTextFromRuntimeCache [SyncInputTextFromRuntimeCache] AlreadyInputText: ").Append(this.GetAlreadyInputText()));
        }
        return;
    }
    bool IsInBattleTeam() const
    {
        bool local_9;
        if (!(FECSEntity(this.GetContext().GetLocalPlayer()).IsValid()))
        {
            local_9 = false;
        }
        else
        {
            Has local_14;
            local_9 = local_14.opCall();
        }
        if (local_9)
        {
            Get local_20;
            const FC_PlayerInTeam& local_22 = local_20.opCall();
            if (local_22)
            {
                return (local_22.GetTeamMemberCount() > 0);
            }
        }
        return false;
    }
    bool IsInSocialTeam() const
    {
        int64 local_6 = ::FSocialTeamUtils::GetSocialTeamId(this.GetContext().GetLocalPlayer());
        return (local_6 != 0);
    }
    TEUIModelRef<FMS_ChatRuntimeData> GetChatRuntimeData() const property
    {
        this.TrackPropertyRead(0);
        return this.m_ChatRuntimeData;
    }
    void SetChatRuntimeData(const TEUIModelRef<FMS_ChatRuntimeData> &inout __Value) property
    {
        TEUIModelRef<FMS_ChatRuntimeData> local_2;
        local_2 = this.m_ChatRuntimeData;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ChatRuntimeData = __Value;
        return;
    }
    TEUIModelRef<FVMS_ChatMain> GetChatMain() const property
    {
        this.TrackPropertyRead(1);
        return this.m_ChatMain;
    }
    void SetChatMain(const TEUIModelRef<FVMS_ChatMain> &inout __Value) property
    {
        TEUIModelRef<FVMS_ChatMain> local_2;
        local_2 = this.m_ChatMain;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ChatMain = __Value;
        return;
    }
    const FString GetAlreadyInputText() const property
    {
        const FString __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FString GetModify_AlreadyInputText() property
    {
        FString __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetAlreadyInputText(const FString &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_AlreadyInputText = __Value;
        return;
    }
    const FString GetTempInputText() const property
    {
        const FString __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FString GetModify_TempInputText() property
    {
        FString __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetTempInputText(const FString &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_TempInputText = __Value;
        return;
    }
    int GetInputStateIndex() const property
    {
        this.TrackPropertyRead(4);
        return this.m_InputStateIndex;
    }
    void SetInputStateIndex(const int __Value) property
    {
        if (this.m_InputStateIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_InputStateIndex = __Value;
        return;
    }
    const FText GetBanTipsText() const property
    {
        const FText __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FText GetModify_BanTipsText() property
    {
        FText __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetBanTipsText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_BanTipsText = __Value;
        return;
    }
    bool GetbInSocialTeam() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bInSocialTeam;
    }
    void SetbInSocialTeam(const bool __Value) property
    {
        if (!(this.m_bInSocialTeam) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bInSocialTeam = __Value;
        return;
    }
    const FString GetClampedInputText() const property
    {
        const FString __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FString GetModify_ClampedInputText() property
    {
        FString __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetClampedInputText(const FString &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_ClampedInputText = __Value;
        return;
    }
    int GetInputFocusRequestNonce() const property
    {
        this.TrackPropertyRead(8);
        return this.m_InputFocusRequestNonce;
    }
    void SetInputFocusRequestNonce(const int __Value) property
    {
        if (this.m_InputFocusRequestNonce == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_InputFocusRequestNonce = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ChatInputPanel
{
    UPROPERTY()
    TEUIModelRef<FVM_ChatInputPanel> Self;

    __GeneratedProperties_FVM_ChatInputPanel()
    {
        return;
    }
}

namespace FVM_ChatInputPanel
{
FVM_ChatInputPanel& Create(const UObject ContextObject)
{
    return FVM_ChatInputPanel::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_ChatInputPanel CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_ChatInputPanel __r;
    TEUIModelRef<FVM_ChatInputPanel> local_6 = TEUIModelRef<FVM_ChatInputPanel>(EUIInternal::MakeModelWithManager(Manager, FVM_ChatInputPanel::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_ChatInputPanel;
}
void __OnChatInputDeferredWeakTips(FVM_ChatInputPanel &inout Model, const FMsg_ChatInputDeferredWeakTips &inout Message)
{
    Model.OnChatInputDeferredWeakTips(Message);
    return;
}
void __OnChatChannelChanged(FVM_ChatInputPanel &inout Model)
{
    Model.OnChatChannelChanged();
    return;
}
void __OnPrivatePeerChangedForInputDraft(FVM_ChatInputPanel &inout Model)
{
    Model.OnPrivatePeerChangedForInputDraft();
    return;
}
void __OnPlayerInTeamChanged(FVM_ChatInputPanel &inout Model, const FECSEntity &inout Entity, const FC_PlayerInTeam &inout Component)
{
    Model.OnPlayerInTeamChanged(Component);
    return;
}
void __OnPlayerSocialTeamChanged(FVM_ChatInputPanel &inout Model, const FECSEntity &inout Entity, const FC_DSPlayerInfo &inout Component)
{
    Model.OnPlayerSocialTeamChanged(Component);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
int __UIGetter_InputStateIndex(const FVM_ChatInputPanel &inout Model)
{
    return Model.GetInputStateIndex();
}
FText __UIGetter_BanTipsText(const FVM_ChatInputPanel &inout Model)
{
    return Model.GetBanTipsText();
}
TEUIModelRef<FVM_ChatInputPanel> __UIGetter_Self(const FVM_ChatInputPanel &inout Model)
{
    return TEUIModelRef<FVM_ChatInputPanel>(Model);
}
int __IndexOf_ChatRuntimeData()
{
    return 0;
}
int __IndexOf_ChatMain()
{
    return 1;
}
int __IndexOf_AlreadyInputText()
{
    return 2;
}
int __IndexOf_TempInputText()
{
    return 3;
}
int __IndexOf_InputStateIndex()
{
    return 4;
}
int __IndexOf_BanTipsText()
{
    return 5;
}
int __IndexOf_bInSocialTeam()
{
    return 6;
}
int __IndexOf_ClampedInputText()
{
    return 7;
}
int __IndexOf_InputFocusRequestNonce()
{
    return 8;
}
}
namespace __GeneratedProperties_FVM_ChatInputPanel
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
