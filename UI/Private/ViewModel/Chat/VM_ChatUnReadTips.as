
namespace FVM_ChatUnReadTips
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnReadBtnClicked = FEUIModelCallbackSignature();

}
struct FVM_ChatUnReadTips : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FMS_ChatDataModel> m_ChatDataModel;
    UPROPERTY()
    TEUIModelRef<FMS_ChatRuntimeData> m_ChatMainRuntimeData;
    UPROPERTY()
    int m_InnerUnReadMessageCount;
    UPROPERTY()
    FText m_InnerUnReadMessageTips;
    UPROPERTY()
    bool m_bIsShowUnReadMessageTips;

    FVM_ChatUnReadTips()
    {
        this.m_InnerUnReadMessageCount = 0;
        this.m_bIsShowUnReadMessageTips = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_ChatUnReadTips(const FVM_ChatUnReadTips &inout Other)
    {
        this.m_InnerUnReadMessageCount = 0;
        this.m_bIsShowUnReadMessageTips = false;
        this.m_ChatDataModel = Other.m_ChatDataModel;
        this.m_ChatMainRuntimeData = Other.m_ChatMainRuntimeData;
        this.m_InnerUnReadMessageCount = int(Other.m_InnerUnReadMessageCount);
        this.m_InnerUnReadMessageTips = Other.m_InnerUnReadMessageTips;
        this.m_bIsShowUnReadMessageTips = Other.m_bIsShowUnReadMessageTips;
        return;
    }
    FVM_ChatUnReadTips opAssign(const FVM_ChatUnReadTips &inout Other)
    {
        FVM_ChatUnReadTips __r;
        this.m_ChatDataModel = Other.m_ChatDataModel;
        this.m_ChatMainRuntimeData = Other.m_ChatMainRuntimeData;
        this.m_InnerUnReadMessageCount = int(Other.m_InnerUnReadMessageCount);
        this.m_InnerUnReadMessageTips = Other.m_InnerUnReadMessageTips;
        this.m_bIsShowUnReadMessageTips = Other.m_bIsShowUnReadMessageTips;
        return __r;
    }
    void PostConstruct()
    {
        this.SetChatDataModel(TEUIModelRef<FMS_ChatDataModel>(::FMS_ChatDataModel::Get(this.GetContext().Manager)));
        this.SetChatMainRuntimeData(TEUIModelRef<FMS_ChatRuntimeData>(::FMS_ChatRuntimeData::Get(this.GetContext().Manager)));
        this.RefreshUnReadMessageCount();
        return;
    }
    void OnReadBtnClicked()
    {
        FEUIModelRef local_8 = this.GetChatDataModel().opImplConv();
        FEUIMessageBus::Publish(EUIMessageBus);
        EChatChannelTab local_13 = this.GetChatMainRuntimeData().opArrow().GetSelectChannelTab();
        FMsg_ChatReadAllMessages local_10;
        local_10.ChannelTab = EChatChannelTab(local_13);
        if ((int(this.GetChatMainRuntimeData().opArrow().GetSelectChannelTab())) == 6)
        {
            local_10.PeerUid = this.GetChatMainRuntimeData().opArrow().GetSelectedPrivateChatPeerUid();
        }
        return;
    }
    void OnChatReadAllMessagesUpdate(const FMsg_ChatReadAllMessagesUpdate &inout Msg)
    {
        this.RefreshUnReadMessageCount();
        return;
    }
    int GetUnReadMessageCount() const
    {
        return this.GetInnerUnReadMessageCount();
    }
    FText GetUnReadMessageTips() const
    {
        return this.GetInnerUnReadMessageTips();
    }
    void OnRecentMessagesUpdated()
    {
        this.RefreshUnReadMessageCount();
        return;
    }
    void RefreshUnReadMessageCount()
    {
        const UChatSettings local_22;
        int local_1 = 0;
        for (auto& local_20 : this.GetChatDataModel().opArrow().GetRecentMessages())
        {
            local_20;
            if (!(GetbIsRead()))
            {
                ++local_1;
            }
        }
        this.SetInnerUnReadMessageCount(local_1);
        this.SetbIsShowUnReadMessageTips((local_1 > 0));
        if (this.GetbIsShowUnReadMessageTips())
        {
            GetGameplaySettings<UChatSettings> local_24;
            local_22 = local_24;
            if (local_22 != nullptr)
            {
                FText local_48;
                int local_27;
                local_27 = local_22.ShowChatUnreadTipsMaxMessageCount;
                FString local_44;
                if (this.GetInnerUnReadMessageCount() >= local_27)
                {
                    local_44 = FString().Append(local_27).Append("+");
                }
                else
                {
                    local_44 = FString().Append(this.GetInnerUnReadMessageCount());
                }
                FText local_52 = ::ChatSystemUtil::ResolveKLTextData(local_22.ChatUnreadTipsTextData);
                FText::FromString(local_48);
                this.SetInnerUnReadMessageTips(FText::Format(local_52, local_48));
            }
        }
        return;
    }
    TEUIModelRef<FMS_ChatDataModel> GetChatDataModel() const property
    {
        this.TrackPropertyRead(0);
        return this.m_ChatDataModel;
    }
    void SetChatDataModel(const TEUIModelRef<FMS_ChatDataModel> &inout __Value) property
    {
        TEUIModelRef<FMS_ChatDataModel> local_2;
        local_2 = this.m_ChatDataModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ChatDataModel = __Value;
        return;
    }
    TEUIModelRef<FMS_ChatRuntimeData> GetChatMainRuntimeData() const property
    {
        this.TrackPropertyRead(1);
        return this.m_ChatMainRuntimeData;
    }
    void SetChatMainRuntimeData(const TEUIModelRef<FMS_ChatRuntimeData> &inout __Value) property
    {
        TEUIModelRef<FMS_ChatRuntimeData> local_2;
        local_2 = this.m_ChatMainRuntimeData;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ChatMainRuntimeData = __Value;
        return;
    }
    int GetInnerUnReadMessageCount() const property
    {
        this.TrackPropertyRead(2);
        return this.m_InnerUnReadMessageCount;
    }
    void SetInnerUnReadMessageCount(const int __Value) property
    {
        if (this.m_InnerUnReadMessageCount == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_InnerUnReadMessageCount = __Value;
        return;
    }
    const FText GetInnerUnReadMessageTips() const property
    {
        const FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_InnerUnReadMessageTips() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetInnerUnReadMessageTips(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_InnerUnReadMessageTips = __Value;
        return;
    }
    bool GetbIsShowUnReadMessageTips() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bIsShowUnReadMessageTips;
    }
    void SetbIsShowUnReadMessageTips(const bool __Value) property
    {
        if (!(this.m_bIsShowUnReadMessageTips) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bIsShowUnReadMessageTips = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ChatUnReadTips
{
    UPROPERTY()
    int UnReadMessageCount;
    UPROPERTY()
    FText UnReadMessageTips;
    UPROPERTY()
    TEUIModelRef<FVM_ChatUnReadTips> Self;


}

namespace FVM_ChatUnReadTips
{
FVM_ChatUnReadTips& Create(const UObject ContextObject)
{
    return FVM_ChatUnReadTips::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_ChatUnReadTips CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_ChatUnReadTips __r;
    TEUIModelRef<FVM_ChatUnReadTips> local_6 = TEUIModelRef<FVM_ChatUnReadTips>(EUIInternal::MakeModelWithManager(Manager, FVM_ChatUnReadTips::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_ChatUnReadTips;
}
void __OnChatReadAllMessagesUpdate(FVM_ChatUnReadTips &inout Model, const FMsg_ChatReadAllMessagesUpdate &inout Message)
{
    Model.OnChatReadAllMessagesUpdate(Message);
    return;
}
void __OnRecentMessagesUpdated(FVM_ChatUnReadTips &inout Model)
{
    Model.OnRecentMessagesUpdated();
    return;
}
bool __UIGetter_bIsShowUnReadMessageTips(const FVM_ChatUnReadTips &inout Model)
{
    return Model.GetbIsShowUnReadMessageTips();
}
int __UIGetter_UnReadMessageCount(const FVM_ChatUnReadTips &inout Model)
{
    return Model.GetUnReadMessageCount();
}
FText __UIGetter_UnReadMessageTips(const FVM_ChatUnReadTips &inout Model)
{
    return Model.GetUnReadMessageTips();
}
TEUIModelRef<FVM_ChatUnReadTips> __UIGetter_Self(const FVM_ChatUnReadTips &inout Model)
{
    return TEUIModelRef<FVM_ChatUnReadTips>(Model);
}
int __IndexOf_ChatDataModel()
{
    return 0;
}
int __IndexOf_ChatMainRuntimeData()
{
    return 1;
}
int __IndexOf_InnerUnReadMessageCount()
{
    return 2;
}
int __IndexOf_InnerUnReadMessageTips()
{
    return 3;
}
int __IndexOf_bIsShowUnReadMessageTips()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_ChatUnReadTips
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
