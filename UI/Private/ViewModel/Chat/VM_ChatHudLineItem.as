
namespace FVM_ChatHudLineItem
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnClick = FEUIModelCallbackSignature();

}
struct FVM_ChatHudLineItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_ChannelPrefix;
    UPROPERTY()
    FString m_SenderDisplayName;
    UPROPERTY()
    FString m_BodyTextStr;
    UPROPERTY()
    FName m_SenderNameStyle;
    UPROPERTY()
    FString m_BodyTextRich;
    UPROPERTY()
    float m_ExpireAtWorldSeconds;
    UPROPERTY()
    TEUIModelRef<FM_ChatMessage> m_LinkedSourceMessage;

    FVM_ChatHudLineItem()
    {
        this.m_ExpireAtWorldSeconds = 0.0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_ChatHudLineItem(const FVM_ChatHudLineItem &inout Other)
    {
        this.m_ExpireAtWorldSeconds = 0.0;
        this.m_ChannelPrefix = Other.m_ChannelPrefix;
        this.m_SenderDisplayName = Other.m_SenderDisplayName;
        this.m_BodyTextStr = Other.m_BodyTextStr;
        this.m_SenderNameStyle = Other.m_SenderNameStyle;
        this.m_BodyTextRich = Other.m_BodyTextRich;
        this.m_ExpireAtWorldSeconds = Other.m_ExpireAtWorldSeconds;
        this.m_LinkedSourceMessage = Other.m_LinkedSourceMessage;
        return;
    }
    FVM_ChatHudLineItem& opAssign(const FVM_ChatHudLineItem &inout Other)
    {
        this.m_ChannelPrefix = Other.m_ChannelPrefix;
        this.m_SenderDisplayName = Other.m_SenderDisplayName;
        this.m_BodyTextStr = Other.m_BodyTextStr;
        this.m_SenderNameStyle = Other.m_SenderNameStyle;
        this.m_BodyTextRich = Other.m_BodyTextRich;
        this.m_ExpireAtWorldSeconds = Other.m_ExpireAtWorldSeconds;
        return Other.m_LinkedSourceMessage;
    }
    void SetupHudLine(const TEUIModelRef<FM_ChatMessage> &inout MessageRef, const float ExpireAtSeconds, const uint LocalPlayerUid)
    {
        this.SetLinkedSourceMessage(MessageRef);
        this.SetExpireAtWorldSeconds(ExpireAtSeconds);
        FM_ChatMessage local_2;
        this.SetChannelPrefix(::ChatSystemUtil::GetChatHudChannelPrefixFromPbChannelType(local_2.GetChannelType()));
        FString local_18;
        int local_3 = local_2.GetSenderBrief().GetUid();
        if (local_3 != 0)
        {
            local_18 = local_2.GetSenderBrief().GetNickname();
        }
        else
        {
            local_18 = "";
        }
        this.SetSenderDisplayName(local_18);
        int local_3_2 = local_2.GetSystemContentDataId();
        if (local_3_2 != 0)
        {
            local_18 = ::FMS_ChatDataModel::Get(this.GetContext().Manager).BuildSystemBodyText(local_2.GetSystemContentDataId(), local_2.GetSystemContentArgs()).ToString();
            this.SetBodyTextStr(local_18);
        }
        else
        {
            this.SetBodyTextStr(local_2.GetBodyText().ToString());
        }
        FString local_22 = "";
        if (!(this.GetSenderDisplayName().IsEmpty()))
        {
            this.SetSenderNameStyle(::ChatSystemUtil::ResolveChatHudSenderNameStyle(local_2.GetSenderBrief().GetUid(), LocalPlayerUid, (local_2.GetChannelType() == 2)));
            local_22 = ::ChatSystemUtil::WrapStringWithRichTextStyleRow(this.GetSenderDisplayName(), this.GetSenderNameStyle());
        }
        FString local_30;
        if (local_22.IsEmpty())
        {
            local_30 = FString().Append("[").Append(this.GetChannelPrefix()).Append("] ").Append(this.GetBodyTextStr());
        }
        else
        {
            local_30 = FString().Append("[").Append(this.GetChannelPrefix()).Append("] ").Append(local_22).Append(": ").Append(this.GetBodyTextStr());
        }
        this.SetBodyTextRich(local_30);
        return;
    }
    FString GetFullLineText() const
    {
        return this.GetBodyTextRich();
    }
    void OnClick()
    {
        if (!(this.GetLinkedSourceMessage().IsValid()))
        {
            return;
        }
        ::FVMS_ChatMain::Get(this.GetContext().Manager).NavigateOpenAndScrollToHudMessage(this.GetLinkedSourceMessage());
        return;
    }
    const FText GetChannelPrefix() const property
    {
        const FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_ChannelPrefix() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetChannelPrefix(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ChannelPrefix = __Value;
        return;
    }
    const FString GetSenderDisplayName() const property
    {
        const FString __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FString GetModify_SenderDisplayName() property
    {
        FString __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetSenderDisplayName(const FString &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SenderDisplayName = __Value;
        return;
    }
    const FString GetBodyTextStr() const property
    {
        const FString __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FString GetModify_BodyTextStr() property
    {
        FString __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetBodyTextStr(const FString &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_BodyTextStr = __Value;
        return;
    }
    const FName GetSenderNameStyle() const property
    {
        const FName __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FName GetModify_SenderNameStyle() property
    {
        FName __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetSenderNameStyle(const FName &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_SenderNameStyle = __Value;
        return;
    }
    const FString GetBodyTextRich() const property
    {
        const FString __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FString GetModify_BodyTextRich() property
    {
        FString __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetBodyTextRich(const FString &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_BodyTextRich = __Value;
        return;
    }
    const float GetExpireAtWorldSeconds() const property
    {
        const float __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    float GetModify_ExpireAtWorldSeconds() property
    {
        float __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetExpireAtWorldSeconds(const float &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_ExpireAtWorldSeconds = __Value;
        return;
    }
    TEUIModelRef<FM_ChatMessage> GetLinkedSourceMessage() const property
    {
        this.TrackPropertyRead(6);
        return this.m_LinkedSourceMessage;
    }
    void SetLinkedSourceMessage(const TEUIModelRef<FM_ChatMessage> &inout __Value) property
    {
        TEUIModelRef<FM_ChatMessage> local_2;
        local_2 = this.m_LinkedSourceMessage;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_LinkedSourceMessage = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ChatHudLineItem
{
    UPROPERTY()
    FString FullLineText;
    UPROPERTY()
    TEUIModelRef<FVM_ChatHudLineItem> Self;

    __GeneratedProperties_FVM_ChatHudLineItem()
    {
        return;
    }
}

namespace FVM_ChatHudLineItem
{
FVM_ChatHudLineItem& Create(const UObject ContextObject)
{
    return FVM_ChatHudLineItem::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_ChatHudLineItem CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_ChatHudLineItem __r;
    TEUIModelRef<FVM_ChatHudLineItem> local_6 = TEUIModelRef<FVM_ChatHudLineItem>(EUIInternal::MakeModelWithManager(Manager, FVM_ChatHudLineItem::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "FullLineText";
    local_14.TypeName = "FString";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ChatHudLineItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ChatHudLineItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ChatHudLineItem;
}
FString __UIGetter_FullLineText(const FVM_ChatHudLineItem &inout Model)
{
    return Model.GetFullLineText();
}
TEUIModelRef<FVM_ChatHudLineItem> __UIGetter_Self(const FVM_ChatHudLineItem &inout Model)
{
    return TEUIModelRef<FVM_ChatHudLineItem>(Model);
}
int __IndexOf_ChannelPrefix()
{
    return 0;
}
int __IndexOf_SenderDisplayName()
{
    return 1;
}
int __IndexOf_BodyTextStr()
{
    return 2;
}
int __IndexOf_SenderNameStyle()
{
    return 3;
}
int __IndexOf_BodyTextRich()
{
    return 4;
}
int __IndexOf_ExpireAtWorldSeconds()
{
    return 5;
}
int __IndexOf_LinkedSourceMessage()
{
    return 6;
}
}
namespace __GeneratedProperties_FVM_ChatHudLineItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
