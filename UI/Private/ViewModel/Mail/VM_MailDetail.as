
namespace FVM_MailDetail
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature ClaimAttachment = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature DeleteMail = FEUIModelCallbackSignature();

}
struct FVM_MailDetail : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FMS_MailModel> m_MailModel;
    UPROPERTY()
    TEUIModelRef<FM_MailData> m_CurrentMailData;
    UPROPERTY()
    bool m_bHasData;
    UPROPERTY()
    TEUIModelRef<FVM_CommonRewardList> m_RewardList;
    UPROPERTY()
    FText m_ExpireText;
    UPROPERTY()
    bool m_bCanClaimAttachment;
    UPROPERTY()
    bool m_bHasRewardDisplay;

    FVM_MailDetail()
    {
        this.m_bHasData = false;
        this.m_bCanClaimAttachment = false;
        this.m_bHasRewardDisplay = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_MailDetail(const FVM_MailDetail &inout Other)
    {
        this.m_bHasData = false;
        this.m_bCanClaimAttachment = false;
        this.m_bHasRewardDisplay = false;
        this.m_MailModel = Other.m_MailModel;
        this.m_CurrentMailData = Other.m_CurrentMailData;
        this.m_bHasData = Other.m_bHasData;
        this.m_RewardList = Other.m_RewardList;
        this.m_ExpireText = Other.m_ExpireText;
        this.m_bCanClaimAttachment = Other.m_bCanClaimAttachment;
        this.m_bHasRewardDisplay = Other.m_bHasRewardDisplay;
        return;
    }
    FVM_MailDetail opAssign(const FVM_MailDetail &inout Other)
    {
        FVM_MailDetail __r;
        this.m_MailModel = Other.m_MailModel;
        this.m_CurrentMailData = Other.m_CurrentMailData;
        this.m_bHasData = Other.m_bHasData;
        this.m_RewardList = Other.m_RewardList;
        this.m_ExpireText = Other.m_ExpireText;
        this.m_bCanClaimAttachment = Other.m_bCanClaimAttachment;
        this.m_bHasRewardDisplay = Other.m_bHasRewardDisplay;
        return __r;
    }
    void PostConstruct()
    {
        this.SetMailModel(TEUIModelRef<FMS_MailModel>(::FMS_MailModel::Get(this.GetContext().Manager)));
        return;
    }
    void SetCurrentMail(const uint MailId)
    {
        if (this.GetCurrentMailData() && (this.GetCurrentMailData().opArrow().GetMailId() == MailId) && !(this.GetCurrentMailData().opArrow().GetbDetailLoaded()))
        {
            return;
        }
        this.SetCurrentMailData(this.GetMailModel().opArrow().GetMailData(MailId));
        if (this.GetCurrentMailData())
        {
            this.SetbHasData(this.GetCurrentMailData().opArrow().GetbDetailLoaded());
            this.RefreshExpireText();
            this.RefreshActionState();
            if (!(this.GetbHasData()))
            {
                this.GetMailModel().opArrow().GS_RequestMailDetail(MailId);
            }
            else
            {
                this.RefreshRewardList();
            }
            return;
        }
        this.SetbHasData(false);
        this.SetExpireText(FText());
        this.RefreshActionState();
        return;
    }
    void ClearSelection()
    {
        this.SetCurrentMailData(TEUIModelRef<FM_MailData>());
        this.SetbHasData(false);
        this.SetExpireText(FText());
        this.RefreshActionState();
        return;
    }
    FText GetTitle() const
    {
        if (this.GetCurrentMailData())
        {
            return this.GetCurrentMailData().opArrow().GetTitle();
        }
        return FText();
    }
    FText GetContent() const
    {
        if (this.GetCurrentMailData())
        {
            return this.GetCurrentMailData().opArrow().GetContent();
        }
        return FText();
    }
    FText GetSender() const
    {
        if (this.GetCurrentMailData())
        {
            if (UICommonUtil::CVar_UI_DebugShowMailId.GetBool())
            {
                int local_17 = this.GetCurrentMailData().opArrow().GetMailId();
                return FText::FromString(FString().Append(this.GetCurrentMailData().opArrow().GetSender().ToString()).Append(" [ID:").Append(local_17).Append("]"));
            }
            return this.GetCurrentMailData().opArrow().GetSender();
        }
        return FText();
    }
    bool GetHasAttachment() const
    {
        if (this.GetCurrentMailData())
        {
            return this.GetCurrentMailData().opArrow().IsAttachmentClaimable();
        }
        return false;
    }
    bool GetHasReward() const
    {
        if (this.GetCurrentMailData())
        {
            return this.GetCurrentMailData().opArrow().HasReward();
        }
        return false;
    }
    FText GetSendTimeText() const
    {
        bool local_3 = !(this.GetCurrentMailData());
        if (local_3)
        {
            local_3 = true;
        }
        else
        {
            int local_4 = this.GetCurrentMailData().opArrow().GetSendTime();
            local_3 = (local_4 == 0);
        }
        if (local_3)
        {
            return FText();
        }
        int64 local_12 = this.GetCurrentMailData().opArrow().GetSendTime();
        FDateTime local_14 = FDateTime::FromUnixTimestamp(local_12 + (FDateTime::Now().ToUnixTimestamp() - FDateTime::UtcNow().ToUnixTimestamp()));
        return FText::FromString(FString().Append(local_14.GetYear()).Append(".").Append(local_14.GetMonth()).Append(".").Append(local_14.GetDay()));
    }
    TArray<TEUIModelRef<FVM_CommonRewardItem>> GetRewardItems() const
    {
        if (this.GetRewardList())
        {
            bool local_9 = this.GetCurrentMailData() && this.GetCurrentMailData().opArrow().IsClaimed();
            TEUIModelRef<FVM_CommonRewardList> local_2 = this.GetRewardList();
            for (auto& local_24 : GetRewards())
            {
                if (local_24)
                {
                    local_24.opArrow().SetIsClaimed(local_9);
                }
            }
            TEUIModelRef<FVM_CommonRewardList> local_2_2 = this.GetRewardList();
            return GetRewards();
        }
        return TArray<TEUIModelRef<FVM_CommonRewardItem>>();
    }
    void OnMailDetailLoaded(const FMsg_MailDetailLoaded &inout Msg)
    {
        if (this.GetCurrentMailData() && (int(Msg.MailId) == this.GetCurrentMailData().opArrow().GetMailId()))
        {
            this.SetbHasData(true);
            this.RefreshRewardList();
            this.RefreshActionState();
        }
        return;
    }
    void OnMailAttachmentClaimed(const FMsg_MailAttachmentClaimed &inout Msg)
    {
        if (this.GetCurrentMailData() && (int(Msg.MailId) == this.GetCurrentMailData().opArrow().GetMailId()))
        {
            this.GetMailModel().opArrow().RefreshMailDetail(this.GetCurrentMailData().opArrow().GetMailId());
        }
        return;
    }
    void ClaimAttachment()
    {
        if (this.GetCurrentMailData())
        {
            this.GetMailModel().opArrow().GS_RequestClaimAttachment(this.GetCurrentMailData().opArrow().GetMailId());
        }
        return;
    }
    void DeleteMail()
    {
        if (this.GetCurrentMailData())
        {
            this.GetMailModel().opArrow().GS_RequestDeleteMail(this.GetCurrentMailData().opArrow().GetMailId());
        }
        return;
    }
    void RefreshActionState()
    {
        bool local_4;
        bool local_5;
        if (this.GetCurrentMailData())
        {
            local_5 = this.GetCurrentMailData().opArrow().IsAttachmentClaimable();
        }
        else
        {
            local_5 = false;
        }
        this.SetbCanClaimAttachment(local_5);
        if (this.GetCurrentMailData())
        {
            local_4 = this.GetCurrentMailData().opArrow().HasReward();
        }
        else
        {
            local_4 = false;
        }
        this.SetbHasRewardDisplay(local_4);
        return;
    }
    void RefreshExpireText()
    {
        if (!(this.GetCurrentMailData()))
        {
            this.SetExpireText(FText());
            return;
        }
        this.SetExpireText(this.GetCurrentMailData().opArrow().GetCachedExpireText());
        return;
    }
    void RefreshRewardList()
    {
        if (!(this.GetCurrentMailData()) || !(this.GetCurrentMailData().opArrow().HasReward()))
        {
            this.SetRewardList(TEUIModelRef<FVM_CommonRewardList>());
            return;
        }
        TArray<FRewardItemEntry> local_10;
        this.GetCurrentMailData().opArrow().GetAttachmentItems(local_10);
        if (local_10.Num() > 0)
        {
            this.SetRewardList(TEUIModelRef<FVM_CommonRewardList>(::FVM_CommonRewardList::Create(this.GetContext().Manager, local_10)));
            return;
        }
        TDataObjectPtr<FRewardConfig> local_60 = this.GetCurrentMailData().opArrow().GetRewardConfig();
        if (local_60)
        {
            this.SetRewardList(TEUIModelRef<FVM_CommonRewardList>(::FVM_CommonRewardList::Create(this.GetContext().Manager, ::FCommonRewardListBuilder::BuildFromRewardConfig(local_60))));
            return;
        }
        TDataObjectPtr<FDropItemConfigBase> local_112 = this.GetCurrentMailData().opArrow().GetRewardConfigDeprecated();
        if (local_112)
        {
            this.SetRewardList(TEUIModelRef<FVM_CommonRewardList>(::FVM_CommonRewardList::Create(this.GetContext().Manager, ::FCommonRewardListBuilder::BuildFromDropConfig(local_112))));
            return;
        }
        this.SetRewardList(TEUIModelRef<FVM_CommonRewardList>());
        return;
    }
    TEUIModelRef<FMS_MailModel> GetMailModel() const property
    {
        this.TrackPropertyRead(0);
        return this.m_MailModel;
    }
    void SetMailModel(const TEUIModelRef<FMS_MailModel> &inout __Value) property
    {
        TEUIModelRef<FMS_MailModel> local_2;
        local_2 = this.m_MailModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_MailModel = __Value;
        return;
    }
    TEUIModelRef<FM_MailData> GetCurrentMailData() const property
    {
        this.TrackPropertyRead(1);
        return this.m_CurrentMailData;
    }
    void SetCurrentMailData(const TEUIModelRef<FM_MailData> &inout __Value) property
    {
        TEUIModelRef<FM_MailData> local_2;
        local_2 = this.m_CurrentMailData;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CurrentMailData = __Value;
        return;
    }
    bool GetbHasData() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bHasData;
    }
    void SetbHasData(const bool __Value) property
    {
        if (!(this.m_bHasData) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bHasData = __Value;
        return;
    }
    TEUIModelRef<FVM_CommonRewardList> GetRewardList() const property
    {
        this.TrackPropertyRead(3);
        return this.m_RewardList;
    }
    void SetRewardList(const TEUIModelRef<FVM_CommonRewardList> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonRewardList> local_2;
        local_2 = this.m_RewardList;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_RewardList = __Value;
        return;
    }
    const FText GetExpireText() const property
    {
        const FText __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FText GetModify_ExpireText() property
    {
        FText __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetExpireText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_ExpireText = __Value;
        return;
    }
    bool GetbCanClaimAttachment() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bCanClaimAttachment;
    }
    void SetbCanClaimAttachment(const bool __Value) property
    {
        if (!(this.m_bCanClaimAttachment) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bCanClaimAttachment = __Value;
        return;
    }
    bool GetbHasRewardDisplay() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bHasRewardDisplay;
    }
    void SetbHasRewardDisplay(const bool __Value) property
    {
        if (!(this.m_bHasRewardDisplay) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bHasRewardDisplay = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_MailDetail
{
    UPROPERTY()
    FText Title;
    UPROPERTY()
    FText Content;
    UPROPERTY()
    FText Sender;
    UPROPERTY()
    bool HasAttachment;
    UPROPERTY()
    bool HasReward;
    UPROPERTY()
    FText SendTimeText;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_CommonRewardItem>> RewardItems;
    UPROPERTY()
    TEUIModelRef<FVM_MailDetail> Self;


}

namespace FVM_MailDetail
{
FVM_MailDetail& Create(const UObject ContextObject)
{
    return FVM_MailDetail::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_MailDetail CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_MailDetail __r;
    TEUIModelRef<FVM_MailDetail> local_6 = TEUIModelRef<FVM_MailDetail>(EUIInternal::MakeModelWithManager(Manager, FVM_MailDetail::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "CurrentMailData";
    local_14.TypeName = "TEUIModelRef<FM_MailData>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bHasData";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RewardList";
    local_14.TypeName = "TEUIModelRef<FVM_CommonRewardList>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ExpireText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Title";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Content";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Sender";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasAttachment";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasReward";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SendTimeText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RewardItems";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_CommonRewardItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MailDetail>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MailDetail;
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__OnMailDetailLoaded";
    local_26.MessageTypeName = "Msg_MailDetailLoaded";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    local_26.FunctionName = "__OnMailAttachmentClaimed";
    local_26.MessageTypeName = "Msg_MailAttachmentClaimed";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MailDetail;
}
void __OnMailDetailLoaded(FVM_MailDetail &inout Model, const FMsg_MailDetailLoaded &inout Message)
{
    Model.OnMailDetailLoaded(Message);
    return;
}
void __OnMailAttachmentClaimed(FVM_MailDetail &inout Model, const FMsg_MailAttachmentClaimed &inout Message)
{
    Model.OnMailAttachmentClaimed(Message);
    return;
}
TEUIModelRef<FM_MailData> __UIGetter_CurrentMailData(const FVM_MailDetail &inout Model)
{
    return Model.GetCurrentMailData();
}
bool __UIGetter_bHasData(const FVM_MailDetail &inout Model)
{
    return Model.GetbHasData();
}
TEUIModelRef<FVM_CommonRewardList> __UIGetter_RewardList(const FVM_MailDetail &inout Model)
{
    return Model.GetRewardList();
}
FText __UIGetter_ExpireText(const FVM_MailDetail &inout Model)
{
    return Model.GetExpireText();
}
FText __UIGetter_Title(const FVM_MailDetail &inout Model)
{
    return Model.GetTitle();
}
FText __UIGetter_Content(const FVM_MailDetail &inout Model)
{
    return Model.GetContent();
}
FText __UIGetter_Sender(const FVM_MailDetail &inout Model)
{
    return Model.GetSender();
}
bool __UIGetter_HasAttachment(const FVM_MailDetail &inout Model)
{
    return Model.GetHasAttachment();
}
bool __UIGetter_HasReward(const FVM_MailDetail &inout Model)
{
    return Model.GetHasReward();
}
FText __UIGetter_SendTimeText(const FVM_MailDetail &inout Model)
{
    return Model.GetSendTimeText();
}
TArray<TEUIModelRef<FVM_CommonRewardItem>> __UIGetter_RewardItems(const FVM_MailDetail &inout Model)
{
    return Model.GetRewardItems();
}
TEUIModelRef<FVM_MailDetail> __UIGetter_Self(const FVM_MailDetail &inout Model)
{
    return TEUIModelRef<FVM_MailDetail>(Model);
}
int __IndexOf_MailModel()
{
    return 0;
}
int __IndexOf_CurrentMailData()
{
    return 1;
}
int __IndexOf_bHasData()
{
    return 2;
}
int __IndexOf_RewardList()
{
    return 3;
}
int __IndexOf_ExpireText()
{
    return 4;
}
int __IndexOf_bCanClaimAttachment()
{
    return 5;
}
int __IndexOf_bHasRewardDisplay()
{
    return 6;
}
}
namespace __GeneratedProperties_FVM_MailDetail
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
