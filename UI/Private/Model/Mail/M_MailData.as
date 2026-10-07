
namespace FM_MailData
{
    const int ModelId = 0;

}
struct FM_MailData : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    uint m_MailId;
    UPROPERTY()
    int m_MailType;
    UPROPERTY()
    int m_MailState;
    UPROPERTY()
    uint m_SendTime;
    UPROPERTY()
    uint m_ExpireTime;
    UPROPERTY()
    uint m_SenderUid;
    UPROPERTY()
    bool m_bHasAttachment;
    UPROPERTY()
    uint m_MailConfigId;
    UPROPERTY()
    TDataObjectPtr<FMailConfig> m_MailConfig;
    UPROPERTY()
    FText m_ServerTitle;
    UPROPERTY()
    FText m_ServerContent;
    UPROPERTY()
    FText m_ServerSender;
    UPROPERTY()
    FText m_CachedExpireText;
    UPROPERTY()
    bool m_bDetailLoaded;
    UPROPERTY()
    TArray<FRewardItemEntry> m_ServerAttachmentList;

    FM_MailData()
    {
        this.m_MailId = 0;
        this.m_MailType = 0;
        this.m_MailState = 0;
        this.m_SendTime = 0;
        this.m_ExpireTime = 0;
        this.m_SenderUid = 0;
        this.m_bHasAttachment = false;
        this.m_MailConfigId = 0;
        this.m_bDetailLoaded = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FM_MailData' by default constructor.");
        return;
    }
    FM_MailData(const FM_MailData &inout Other)
    {
        this.m_MailId = 0;
        this.m_MailType = 0;
        this.m_MailState = 0;
        this.m_SendTime = 0;
        this.m_ExpireTime = 0;
        this.m_SenderUid = 0;
        this.m_bHasAttachment = false;
        this.m_MailConfigId = 0;
        this.m_bDetailLoaded = false;
        this.m_MailId = int(Other.m_MailId);
        this.m_MailType = int(Other.m_MailType);
        this.m_MailState = int(Other.m_MailState);
        this.m_SendTime = int(Other.m_SendTime);
        this.m_ExpireTime = int(Other.m_ExpireTime);
        this.m_SenderUid = int(Other.m_SenderUid);
        this.m_bHasAttachment = Other.m_bHasAttachment;
        this.m_MailConfigId = int(Other.m_MailConfigId);
        this.m_MailConfig = Other.m_MailConfig;
        this.m_ServerTitle = Other.m_ServerTitle;
        this.m_ServerContent = Other.m_ServerContent;
        this.m_ServerSender = Other.m_ServerSender;
        this.m_CachedExpireText = Other.m_CachedExpireText;
        this.m_bDetailLoaded = Other.m_bDetailLoaded;
        this.m_ServerAttachmentList = Other.m_ServerAttachmentList;
        return;
    }
    FM_MailData(const uint InMailId)
    {
        this.m_MailId = 0;
        this.m_MailType = 0;
        this.m_MailState = 0;
        this.m_SendTime = 0;
        this.m_ExpireTime = 0;
        this.m_SenderUid = 0;
        this.m_bHasAttachment = false;
        this.m_MailConfigId = 0;
        this.m_bDetailLoaded = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetMailId(InMailId);
        return;
    }
    FM_MailData& opAssign(const FM_MailData &inout Other)
    {
        this.m_MailId = int(Other.m_MailId);
        this.m_MailType = int(Other.m_MailType);
        this.m_MailState = int(Other.m_MailState);
        this.m_SendTime = int(Other.m_SendTime);
        this.m_ExpireTime = int(Other.m_ExpireTime);
        this.m_SenderUid = int(Other.m_SenderUid);
        this.m_bHasAttachment = Other.m_bHasAttachment;
        this.m_MailConfigId = int(Other.m_MailConfigId);
        this.m_MailConfig = Other.m_MailConfig;
        this.m_ServerTitle = Other.m_ServerTitle;
        this.m_ServerContent = Other.m_ServerContent;
        this.m_ServerSender = Other.m_ServerSender;
        this.m_CachedExpireText = Other.m_CachedExpireText;
        this.m_bDetailLoaded = Other.m_bDetailLoaded;
        return Other.m_ServerAttachmentList;
    }
    void SetFromBrief(const FPbMailBrief &inout Brief)
    {
        this.SetMailType(::NumericUtils::AsInt32(Brief.GetMailType()));
        this.SetMailConfigId(Brief.GetMailConfigId());
        this.SetMailState(::NumericUtils::AsInt32(Brief.GetMailState()));
        this.SetbHasAttachment(Brief.GetHasAttachment());
        this.SetSendTime(Brief.GetSendTime());
        this.SetExpireTime(Brief.GetExpireTime());
        this.SetSenderUid(Brief.GetSenderUid());
        this.SetServerTitle(FText::FromString(Brief.GetTitle()));
        this.SetServerSender(FText::FromString(Brief.GetSender()));
        if (this.GetMailConfigId() > 0)
        {
            int local_13 = this.GetMailConfigId();
            GetDataObjectByGSDataId<FMailConfig> local_38;
            this.SetMailConfig(local_38.opImplConv());
        }
        this.RefreshCachedExpireText();
        return;
    }
    void SetFromDetail(const FPbMailDetail &inout Detail)
    {
        this.SetMailType(::NumericUtils::AsInt32(Detail.GetMailType()));
        this.SetMailConfigId(Detail.GetMailConfigId());
        this.SetMailState(::NumericUtils::AsInt32(Detail.GetMailState()));
        this.SetSenderUid(Detail.GetSenderUid());
        this.SetSendTime(Detail.GetSendTime());
        this.SetExpireTime(Detail.GetExpireTime());
        this.SetServerTitle(FText::FromString(Detail.GetTitle()));
        this.SetServerContent(FText::FromString(Detail.GetContent()));
        this.SetServerSender(FText::FromString(Detail.GetSender()));
        TArray<FPbItem> local_14;
        Detail.GetAttachmentList(local_14);
        TArray<FRewardItemEntry> local_18;
        ::FRewardItemEntry::FromPbItems(local_14, local_18);
        this.SetServerAttachmentList(local_18);
        this.SetbHasAttachment((this.GetServerAttachmentList().Num() > 0));
        this.SetbDetailLoaded(true);
        if (this.GetMailConfigId() > 0 && !(this.GetMailConfig()))
        {
            int local_21 = this.GetMailConfigId();
            GetDataObjectByGSDataId<FMailConfig> local_46;
            this.SetMailConfig(local_46.opImplConv());
        }
        this.RefreshCachedExpireText();
        return;
    }
    FText GetTitle() const
    {
        if (this.GetMailConfig())
        {
            return this.GetMailConfig().opArrow().MailTitle;
        }
        return this.GetServerTitle();
    }
    FText GetContent() const
    {
        if (this.GetMailConfig())
        {
            return this.GetMailConfig().opArrow().MailContent;
        }
        return this.GetServerContent();
    }
    FText GetSender() const
    {
        if (this.GetMailConfig())
        {
            return this.GetMailConfig().opArrow().MailSender;
        }
        return this.GetServerSender();
    }
    bool IsUnread() const
    {
        return (this.GetMailState() == 1);
    }
    bool IsClaimed() const
    {
        return (this.GetMailState() == 3);
    }
    bool IsAttachmentClaimable() const
    {
        return this.GetbHasAttachment() && !(this.IsClaimed());
    }
    bool HasReward() const
    {
        bool local_50;
        if (!(this.GetMailConfig()))
        {
            local_50 = false;
        }
        else
        {
            TDataObjectPtr<FRewardConfig> local_24;
            local_24 = this.GetMailConfig().opArrow().GetAttachmentRewardConfig();
            local_50 = !((local_24 == nullptr));
        }
        local_50 = local_50 || (this.GetServerAttachmentList().Num() > 0);
        return local_50;
    }
    TDataObjectPtr<FRewardConfig> GetRewardConfig() const
    {
        if (this.GetMailConfig())
        {
            return this.GetMailConfig().opArrow().GetAttachmentRewardConfig();
        }
        return TDataObjectPtr<FRewardConfig>(nullptr);
    }
    TDataObjectPtr<FDropItemConfigBase> GetRewardConfigDeprecated() const
    {
        return TDataObjectPtr<FDropItemConfigBase>(nullptr);
    }
    bool IsExpired() const
    {
        int local_1 = this.GetExpireTime();
        if (local_1 == 0)
        {
            return false;
        }
        int64 local_8 = this.GetExpireTime();
        return (::FASCommonUtils::GetTimestamp() >= local_8);
    }
    int64 GetRemainingSeconds() const
    {
        int local_1 = this.GetExpireTime();
        if (local_1 == 0)
        {
            return -1;
        }
        return (this.GetExpireTime() - ::FASCommonUtils::GetTimestamp());
    }
    void GetAttachmentItems(TArray<FRewardItemEntry> &inout OutItems) const
    {
        OutItems = this.GetServerAttachmentList();
        return;
    }
    void RefreshCachedExpireText()
    {
        int64 local_4 = this.GetRemainingSeconds();
        if (local_4 < 0)
        {
            FText local_10;
            this.SetCachedExpireText(local_10);
            return;
        }
        if (local_4 <= 0)
        {
            this.SetCachedExpireText(NSLOCTEXT("Mail", "Expired", "е·Іиї‡жњџ"));
            return;
        }
        int local_14 = uint((local_4 / 86400.0f));
        if (local_14 > 0)
        {
            this.SetCachedExpireText(FText::Format(NSLOCTEXT("Mail", "ExpireDays", "{0}е¤©еђЋиї‡жњџ"), local_14));
            return;
        }
        int local_11 = uint((local_4 / 3600.0f));
        if (local_11 > 0)
        {
            this.SetCachedExpireText(FText::Format(NSLOCTEXT("Mail", "ExpireHours", "{0}е°Џж—¶еђЋиї‡жњџ"), local_11));
            return;
        }
        int local_19 = uint((local_4 / 60.0f));
        if (local_19 > 0)
        {
            this.SetCachedExpireText(FText::Format(NSLOCTEXT("Mail", "ExpireMinutes", "{0}е€†й’џеђЋиї‡жњџ"), local_19));
            return;
        }
        this.SetCachedExpireText(NSLOCTEXT("Mail", "ExpireSoon", "еЌіе°†иї‡жњџ"));
        return;
    }
    uint GetMailId() const property
    {
        this.TrackPropertyRead(0);
        return this.m_MailId;
    }
    void SetMailId(const uint __Value) property
    {
        if (this.m_MailId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_MailId = __Value;
        return;
    }
    int GetMailType() const property
    {
        this.TrackPropertyRead(1);
        return this.m_MailType;
    }
    void SetMailType(const int __Value) property
    {
        if (this.m_MailType == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_MailType = __Value;
        return;
    }
    int GetMailState() const property
    {
        this.TrackPropertyRead(2);
        return this.m_MailState;
    }
    void SetMailState(const int __Value) property
    {
        if (this.m_MailState == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_MailState = __Value;
        return;
    }
    uint GetSendTime() const property
    {
        this.TrackPropertyRead(3);
        return this.m_SendTime;
    }
    void SetSendTime(const uint __Value) property
    {
        if (this.m_SendTime == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_SendTime = __Value;
        return;
    }
    uint GetExpireTime() const property
    {
        this.TrackPropertyRead(4);
        return this.m_ExpireTime;
    }
    void SetExpireTime(const uint __Value) property
    {
        if (this.m_ExpireTime == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_ExpireTime = __Value;
        return;
    }
    uint GetSenderUid() const property
    {
        this.TrackPropertyRead(5);
        return this.m_SenderUid;
    }
    void SetSenderUid(const uint __Value) property
    {
        if (this.m_SenderUid == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_SenderUid = __Value;
        return;
    }
    bool GetbHasAttachment() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bHasAttachment;
    }
    void SetbHasAttachment(const bool __Value) property
    {
        if (!(this.m_bHasAttachment) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bHasAttachment = __Value;
        return;
    }
    uint GetMailConfigId() const property
    {
        this.TrackPropertyRead(7);
        return this.m_MailConfigId;
    }
    void SetMailConfigId(const uint __Value) property
    {
        if (this.m_MailConfigId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_MailConfigId = __Value;
        return;
    }
    const TDataObjectPtr<FMailConfig> GetMailConfig() const property
    {
        const TDataObjectPtr<FMailConfig> __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    TDataObjectPtr<FMailConfig> GetModify_MailConfig() property
    {
        TDataObjectPtr<FMailConfig> __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetMailConfig(const TDataObjectPtr<FMailConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_MailConfig = __Value;
        return;
    }
    const FText GetServerTitle() const property
    {
        const FText __r;
        this.TrackPropertyRead(9);
        return __r;
    }
    FText GetModify_ServerTitle() property
    {
        FText __r;
        this.MarkPropertyDirty(9);
        return __r;
    }
    void SetServerTitle(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_ServerTitle = __Value;
        return;
    }
    const FText GetServerContent() const property
    {
        const FText __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    FText GetModify_ServerContent() property
    {
        FText __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetServerContent(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_ServerContent = __Value;
        return;
    }
    const FText GetServerSender() const property
    {
        const FText __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    FText GetModify_ServerSender() property
    {
        FText __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetServerSender(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_ServerSender = __Value;
        return;
    }
    const FText GetCachedExpireText() const property
    {
        const FText __r;
        this.TrackPropertyRead(12);
        return __r;
    }
    FText GetModify_CachedExpireText() property
    {
        FText __r;
        this.MarkPropertyDirty(12);
        return __r;
    }
    void SetCachedExpireText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_CachedExpireText = __Value;
        return;
    }
    bool GetbDetailLoaded() const property
    {
        this.TrackPropertyRead(13);
        return this.m_bDetailLoaded;
    }
    void SetbDetailLoaded(const bool __Value) property
    {
        if (!(this.m_bDetailLoaded) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(13);
        this.m_bDetailLoaded = __Value;
        return;
    }
    const TArray<FRewardItemEntry> GetServerAttachmentList() const property
    {
        const TArray<FRewardItemEntry> __r;
        this.TrackPropertyRead(14);
        return __r;
    }
    TArray<FRewardItemEntry> GetModify_ServerAttachmentList() property
    {
        TArray<FRewardItemEntry> __r;
        this.MarkPropertyDirty(14);
        return __r;
    }
    void SetServerAttachmentList(const TArray<FRewardItemEntry> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(14);
        this.m_ServerAttachmentList = __Value;
        return;
    }
}

namespace FM_MailData
{
FM_MailData& Create(const UObject ContextObject, const uint MailId)
{
    return FM_MailData::CreateByManager(EUIInternal::GetContextManager(ContextObject), MailId);
}
FM_MailData CreateByManager(const UEUIManagerSubsystem Manager, const uint MailId)
{
    FM_MailData __r;
    TEUIModelRef<FM_MailData> local_6 = TEUIModelRef<FM_MailData>(EUIInternal::MakeModelWithManager_Generic(Manager, FM_MailData::ModelId, 0, MailId));
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
    return FM_MailData;
}
int __IndexOf_MailId()
{
    return 0;
}
int __IndexOf_MailType()
{
    return 1;
}
int __IndexOf_MailState()
{
    return 2;
}
int __IndexOf_SendTime()
{
    return 3;
}
int __IndexOf_ExpireTime()
{
    return 4;
}
int __IndexOf_SenderUid()
{
    return 5;
}
int __IndexOf_bHasAttachment()
{
    return 6;
}
int __IndexOf_MailConfigId()
{
    return 7;
}
int __IndexOf_MailConfig()
{
    return 8;
}
int __IndexOf_ServerTitle()
{
    return 9;
}
int __IndexOf_ServerContent()
{
    return 10;
}
int __IndexOf_ServerSender()
{
    return 11;
}
int __IndexOf_CachedExpireText()
{
    return 12;
}
int __IndexOf_bDetailLoaded()
{
    return 13;
}
int __IndexOf_ServerAttachmentList()
{
    return 14;
}
}
