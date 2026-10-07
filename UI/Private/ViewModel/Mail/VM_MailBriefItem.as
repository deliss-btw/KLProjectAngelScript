
namespace FVM_MailBriefItem
{
    const int ModelId = 0;

}
struct FVM_MailBriefItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_MailData> m_MailData;
    UPROPERTY()
    FText m_ExpireText;
    UPROPERTY()
    TEUIModelRef<FVM_RedDot> m_RedDotVM;

    FVM_MailBriefItem()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_MailBriefItem' by default constructor.");
        return;
    }
    FVM_MailBriefItem(const FVM_MailBriefItem &inout Other)
    {
        this.m_MailData = Other.m_MailData;
        this.m_ExpireText = Other.m_ExpireText;
        this.m_RedDotVM = Other.m_RedDotVM;
        return;
    }
    FVM_MailBriefItem(const TEUIModelRef<FM_MailData> &inout InMailData)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetMailData(InMailData);
        return;
    }
    FVM_MailBriefItem& opAssign(const FVM_MailBriefItem &inout Other)
    {
        this.m_MailData = Other.m_MailData;
        this.m_ExpireText = Other.m_ExpireText;
        return Other.m_RedDotVM;
    }
    void PostConstruct()
    {
        bool local_13;
        this.RefreshExpireText();
        FRedDotNodeData local_4 = FRedDotNodeData(GameplayTags::RedDotSystem_Mail_NewMail, this.GetMailData().opArrow().GetMailId());
        this.SetRedDotVM(TEUIModelRef<FVM_RedDot>(::FVM_RedDot::Create(this.GetContext().Manager, local_4)));
        if (!(this.GetIsUnread()))
        {
            local_13 = false;
        }
        else
        {
            TEUIModelRef<FVM_RedDot> local_12 = this.GetRedDotVM();
            local_13 = !(HasRedDot());
        }
        if (local_13)
        {
            ::FMS_RedDotSystem::Get(this.GetContext().Manager).GenerateSpecificRedDot(local_4, 1, false);
        }
        return;
    }
    FText GetTitle() const
    {
        return this.GetMailData().opArrow().GetTitle();
    }
    FText GetSender() const
    {
        if (UICommonUtil::CVar_UI_DebugShowMailId.GetBool())
        {
            int local_17 = this.GetMailData().opArrow().GetMailId();
            return FText::FromString(FString().Append(this.GetMailData().opArrow().GetSender().ToString()).Append(" [ID:").Append(local_17).Append("]"));
        }
        return this.GetMailData().opArrow().GetSender();
    }
    bool GetIsUnread() const
    {
        return this.GetMailData().opArrow().IsUnread();
    }
    bool GetHasAttachment() const
    {
        return this.GetMailData().opArrow().IsAttachmentClaimable();
    }
    FText GetSendTimeText() const
    {
        int local_3 = this.GetMailData().opArrow().GetSendTime();
        if (local_3 == 0)
        {
            return FText();
        }
        int64 local_12 = this.GetMailData().opArrow().GetSendTime();
        FDateTime local_14 = FDateTime::FromUnixTimestamp(local_12 + (FDateTime::Now().ToUnixTimestamp() - FDateTime::UtcNow().ToUnixTimestamp()));
        return FText::FromString(FString().Append(local_14.GetYear()).Append(".").Append(local_14.GetMonth()).Append(".").Append(local_14.GetDay()));
    }
    uint GetMailId() const
    {
        return this.GetMailData().opArrow().GetMailId();
    }
    void OnMailDetailLoaded(const FMsg_MailDetailLoaded &inout Msg)
    {
        return;
    }
    void RefreshExpireText()
    {
        this.SetExpireText(this.GetMailData().opArrow().GetCachedExpireText());
        return;
    }
    TEUIModelRef<FM_MailData> GetMailData() const property
    {
        this.TrackPropertyRead(0);
        return this.m_MailData;
    }
    void SetMailData(const TEUIModelRef<FM_MailData> &inout __Value) property
    {
        TEUIModelRef<FM_MailData> local_2;
        local_2 = this.m_MailData;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_MailData = __Value;
        return;
    }
    const FText GetExpireText() const property
    {
        const FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_ExpireText() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetExpireText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ExpireText = __Value;
        return;
    }
    TEUIModelRef<FVM_RedDot> GetRedDotVM() const property
    {
        this.TrackPropertyRead(2);
        return this.m_RedDotVM;
    }
    void SetRedDotVM(const TEUIModelRef<FVM_RedDot> &inout __Value) property
    {
        TEUIModelRef<FVM_RedDot> local_2;
        local_2 = this.m_RedDotVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_RedDotVM = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_MailBriefItem
{
    UPROPERTY()
    FText Title;
    UPROPERTY()
    FText Sender;
    UPROPERTY()
    bool IsUnread;
    UPROPERTY()
    bool HasAttachment;
    UPROPERTY()
    FText SendTimeText;
    UPROPERTY()
    uint MailId;
    UPROPERTY()
    TEUIModelRef<FVM_MailBriefItem> Self;


}

namespace FVM_MailBriefItem
{
FVM_MailBriefItem& Create(const UObject ContextObject, const TEUIModelRef<FM_MailData> &inout MailData)
{
    return FVM_MailBriefItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), MailData);
}
FVM_MailBriefItem CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_MailData> &inout MailData)
{
    FVM_MailBriefItem __r;
    TEUIModelRef<FVM_MailBriefItem> local_6 = TEUIModelRef<FVM_MailBriefItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_MailBriefItem::ModelId, 0, MailData));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ExpireText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RedDotVM";
    local_14.TypeName = "TEUIModelRef<FVM_RedDot>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Title";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Sender";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsUnread";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasAttachment";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SendTimeText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MailId";
    local_14.TypeName = "uint32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MailBriefItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MailBriefItem;
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__OnMailDetailLoaded";
    local_26.MessageTypeName = "Msg_MailDetailLoaded";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MailBriefItem;
}
void __OnMailDetailLoaded(FVM_MailBriefItem &inout Model, const FMsg_MailDetailLoaded &inout Message)
{
    Model.OnMailDetailLoaded(Message);
    return;
}
FText __UIGetter_ExpireText(const FVM_MailBriefItem &inout Model)
{
    return Model.GetExpireText();
}
TEUIModelRef<FVM_RedDot> __UIGetter_RedDotVM(const FVM_MailBriefItem &inout Model)
{
    return Model.GetRedDotVM();
}
FText __UIGetter_Title(const FVM_MailBriefItem &inout Model)
{
    return Model.GetTitle();
}
FText __UIGetter_Sender(const FVM_MailBriefItem &inout Model)
{
    return Model.GetSender();
}
bool __UIGetter_IsUnread(const FVM_MailBriefItem &inout Model)
{
    return Model.GetIsUnread();
}
bool __UIGetter_HasAttachment(const FVM_MailBriefItem &inout Model)
{
    return Model.GetHasAttachment();
}
FText __UIGetter_SendTimeText(const FVM_MailBriefItem &inout Model)
{
    return Model.GetSendTimeText();
}
uint __UIGetter_MailId(const FVM_MailBriefItem &inout Model)
{
    return Model.GetMailId();
}
TEUIModelRef<FVM_MailBriefItem> __UIGetter_Self(const FVM_MailBriefItem &inout Model)
{
    return TEUIModelRef<FVM_MailBriefItem>(Model);
}
int __IndexOf_MailData()
{
    return 0;
}
int __IndexOf_ExpireText()
{
    return 1;
}
int __IndexOf_RedDotVM()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_MailBriefItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
