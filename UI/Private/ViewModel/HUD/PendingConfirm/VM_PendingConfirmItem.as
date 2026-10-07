
namespace FVM_PendingConfirmItem
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnConfirm = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnCancel = FEUIModelCallbackSignature();

}
struct FPendingConfirmBubbleData
{
    UPROPERTY()
    int64 CommonPopupId;
    UPROPERTY()
    FPlayerBriefInfo SenderPlayerInfo;
    UPROPERTY()
    FFPTime StartTime;
    UPROPERTY()
    FFPTime EndTime;
    UPROPERTY()
    TDataObjectPtr<FPendingConfirmHintConfig> Config;


}

struct FVM_PendingConfirmItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int64 m_CommonPopupId;
    UPROPERTY()
    FPlayerBriefInfo m_SenderPlayerInfo;
    UPROPERTY()
    FFPTime m_StartTime;
    UPROPERTY()
    FFPTime m_EndTime;
    UPROPERTY()
    TDataObjectPtr<FPendingConfirmHintConfig> m_Config;
    UPROPERTY()
    TEUIModelRef<FVM_PlayerBasicItem> m_PlayerBasicItem;
    UPROPERTY()
    FMW_TimeProgress m_TimeProgress;

    FVM_PendingConfirmItem()
    {
        this.m_CommonPopupId = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_PendingConfirmItem' by default constructor.");
        return;
    }
    FVM_PendingConfirmItem(const FVM_PendingConfirmItem &inout Other)
    {
        this.m_CommonPopupId = 0;
        this.m_CommonPopupId = Other.m_CommonPopupId;
        this.m_SenderPlayerInfo = Other.m_SenderPlayerInfo;
        this.m_StartTime = Other.m_StartTime;
        this.m_EndTime = Other.m_EndTime;
        this.m_Config = Other.m_Config;
        this.m_PlayerBasicItem = Other.m_PlayerBasicItem;
        this.m_TimeProgress = Other.m_TimeProgress;
        return;
    }
    FVM_PendingConfirmItem(const int64 InCommonPopupId, const FPlayerBriefInfo &inout InSenderPlayerInfo, const FFPTime &inout InStartTime, const FFPTime &inout InEndTime, const TDataObjectPtr<FPendingConfirmHintConfig> &inout InConfig)
    {
        this.m_CommonPopupId = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetCommonPopupId(InCommonPopupId);
        this.SetSenderPlayerInfo(InSenderPlayerInfo);
        this.SetStartTime(InStartTime);
        this.SetEndTime(InEndTime);
        this.SetConfig(InConfig);
        return;
    }
    FVM_PendingConfirmItem& opAssign(const FVM_PendingConfirmItem &inout Other)
    {
        this.m_CommonPopupId = Other.m_CommonPopupId;
        this.m_SenderPlayerInfo = Other.m_SenderPlayerInfo;
        this.m_StartTime = Other.m_StartTime;
        this.m_EndTime = Other.m_EndTime;
        this.m_Config = Other.m_Config;
        this.m_PlayerBasicItem = Other.m_PlayerBasicItem;
        return Other.m_TimeProgress;
    }
    void PostConstruct()
    {
        this.SetPlayerBasicItem(TEUIModelRef<FVM_PlayerBasicItem>(::FVM_PlayerBasicItem::Create(this.GetContext().Manager, this.GetSenderPlayerInfo())));
        FFPTime local_8 = (FFPTime(this.GetEndTime()) - this.GetStartTime());
        if (local_8.opCmp(0.0) > 0)
        {
            this.GetModify_TimeProgress().EndAtSmooth(this.GetEndTime(), local_8);
        }
        return;
    }
    void OnConfirm()
    {
        ::FMS_PendingConfirmMessage::Get(this.GetContext().Manager).OnBubbleAction(this.GetCommonPopupId(), EPendingConfirmAction(1));
        return;
    }
    void OnCancel()
    {
        ::FMS_PendingConfirmMessage::Get(this.GetContext().Manager).OnBubbleAction(this.GetCommonPopupId(), EPendingConfirmAction(0));
        return;
    }
    bool HasAcceptButton() const
    {
        bool local_1 = !(this.GetConfig());
        if (local_1)
        {
            return false;
        }
        return local_1;
    }
    bool HasRefuseButton() const
    {
        bool local_1 = !(this.GetConfig());
        if (local_1)
        {
            return false;
        }
        return local_1;
    }
    bool HasTestButton() const
    {
        return true;
    }
    bool ShowAcceptCooldown() const
    {
        int local_2 = 0;
        if (!(this.GetConfig()))
        {
            return false;
        }
        if (!(this.HasAcceptButton()))
        {
            return false;
        }
        return (local_2 == 1);
    }
    bool ShowRefuseCooldown() const
    {
        int local_2 = 0;
        if (!(this.GetConfig()))
        {
            return false;
        }
        if (!(this.HasRefuseButton()))
        {
            return false;
        }
        int local_3 = local_2;
        return (local_3 == 0);
    }
    FText GetRemainingTimeText() const
    {
        return FText::Format(NSLOCTEXT("PendingConfirm", "RemainingTimeFormat", "({0})з§’"), FMath::CeilToInt(FMath::Max(this.GetTimeProgress().GetRemainedTime(), 0.0f)));
    }
    float32 GetRemainingTimePercent() const
    {
        return this.GetTimeProgress().GetRemainingRatio();
    }
    bool HasConfirmButton() const
    {
        bool local_1 = !(this.GetConfig());
        if (local_1)
        {
            return false;
        }
        return local_1;
    }
    bool HasDenyButton() const
    {
        bool local_1 = !(this.GetConfig());
        if (local_1)
        {
            return false;
        }
        return local_1;
    }
    FText GetContextText() const
    {
        FText __r;
        if (!(this.GetConfig()))
        {
            return FText();
        }
        return __r;
    }
    FText GetTitleText() const
    {
        FText __r;
        if (!(this.GetConfig()))
        {
            return FText();
        }
        return __r;
    }
    FSoftBrush GetTitleImage() const
    {
        FSoftBrush __r;
        if (!(this.GetConfig()))
        {
            return FSoftBrush();
        }
        return __r;
    }
    FText GetSenderPlayerName() const
    {
        return FText::FromString(this.GetSenderPlayerInfo().GetNickname());
    }
    int64 GetCommonPopupId() const property
    {
        this.TrackPropertyRead(0);
        return this.m_CommonPopupId;
    }
    void SetCommonPopupId(const int64 __Value) property
    {
        if (this.m_CommonPopupId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CommonPopupId = __Value;
        return;
    }
    const FPlayerBriefInfo GetSenderPlayerInfo() const property
    {
        const FPlayerBriefInfo __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FPlayerBriefInfo GetModify_SenderPlayerInfo() property
    {
        FPlayerBriefInfo __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetSenderPlayerInfo(const FPlayerBriefInfo &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SenderPlayerInfo = __Value;
        return;
    }
    FFPTime GetStartTime() const property
    {
        FFPTime __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FFPTime GetModify_StartTime() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetStartTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_StartTime = __Value;
        return;
    }
    FFPTime GetEndTime() const property
    {
        FFPTime __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FFPTime GetModify_EndTime() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetEndTime(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_EndTime = __Value;
        return;
    }
    TDataObjectPtr<FPendingConfirmHintConfig> GetConfig() const property
    {
        TDataObjectPtr<FPendingConfirmHintConfig> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TDataObjectPtr<FPendingConfirmHintConfig> GetModify_Config() property
    {
        TDataObjectPtr<FPendingConfirmHintConfig> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetConfig(const TDataObjectPtr<FPendingConfirmHintConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_Config = __Value;
        return;
    }
    TEUIModelRef<FVM_PlayerBasicItem> GetPlayerBasicItem() const property
    {
        this.TrackPropertyRead(5);
        return this.m_PlayerBasicItem;
    }
    void SetPlayerBasicItem(const TEUIModelRef<FVM_PlayerBasicItem> &inout __Value) property
    {
        TEUIModelRef<FVM_PlayerBasicItem> local_2;
        local_2 = this.m_PlayerBasicItem;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_PlayerBasicItem = __Value;
        return;
    }
    const FMW_TimeProgress GetTimeProgress() const property
    {
        const FMW_TimeProgress __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FMW_TimeProgress GetModify_TimeProgress() property
    {
        FMW_TimeProgress __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetTimeProgress(const FMW_TimeProgress &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_TimeProgress = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_PendingConfirmItem
{
    UPROPERTY()
    bool HasAcceptButton;
    UPROPERTY()
    bool HasRefuseButton;
    UPROPERTY()
    bool HasTestButton;
    UPROPERTY()
    bool ShowAcceptCooldown;
    UPROPERTY()
    bool ShowRefuseCooldown;
    UPROPERTY()
    FText RemainingTimeText;
    UPROPERTY()
    float32 RemainingTimePercent;
    UPROPERTY()
    bool HasConfirmButton;
    UPROPERTY()
    bool HasDenyButton;
    UPROPERTY()
    FText ContextText;
    UPROPERTY()
    FText TitleText;
    UPROPERTY()
    FSoftBrush TitleImage;
    UPROPERTY()
    FText SenderPlayerName;
    UPROPERTY()
    TEUIModelRef<FVM_PendingConfirmItem> Self;


}

namespace FVM_PendingConfirmItem
{
FVM_PendingConfirmItem& Create(const UObject ContextObject, const int64 CommonPopupId, const FPlayerBriefInfo &inout SenderPlayerInfo, const FFPTime &inout StartTime, const FFPTime &inout EndTime, const TDataObjectPtr<FPendingConfirmHintConfig> &inout Config)
{
    return FVM_PendingConfirmItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), CommonPopupId, SenderPlayerInfo, StartTime, EndTime, Config);
}
FVM_PendingConfirmItem CreateByManager(const UEUIManagerSubsystem Manager, const int64 CommonPopupId, const FPlayerBriefInfo &inout SenderPlayerInfo, const FFPTime &inout StartTime, const FFPTime &inout EndTime, const TDataObjectPtr<FPendingConfirmHintConfig> &inout Config)
{
    FVM_PendingConfirmItem __r;
    TEUIModelRef<FVM_PendingConfirmItem> local_6 = TEUIModelRef<FVM_PendingConfirmItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_PendingConfirmItem::ModelId, 0, CommonPopupId, SenderPlayerInfo, StartTime, EndTime, Config));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "CommonPopupId";
    local_14.TypeName = "int64";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "PlayerBasicItem";
    local_14.TypeName = "TEUIModelRef<FVM_PlayerBasicItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasAcceptButton";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasRefuseButton";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasTestButton";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShowAcceptCooldown";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShowRefuseCooldown";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RemainingTimeText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RemainingTimePercent";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasConfirmButton";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasDenyButton";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ContextText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TitleText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TitleImage";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SenderPlayerName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_PendingConfirmItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_PendingConfirmItem;
    FEUIModelWatcherProperty local_19;
    local_19.PropertyName = FName("TimeProgress");
    int local_2_2 = FVM_PendingConfirmItem::__IndexOf_TimeProgress();
    Result.WatcherProperties.Add(local_19);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_PendingConfirmItem;
}
int64 __UIGetter_CommonPopupId(const FVM_PendingConfirmItem &inout Model)
{
    return Model.GetCommonPopupId();
}
TEUIModelRef<FVM_PlayerBasicItem> __UIGetter_PlayerBasicItem(const FVM_PendingConfirmItem &inout Model)
{
    return Model.GetPlayerBasicItem();
}
bool __UIGetter_HasAcceptButton(const FVM_PendingConfirmItem &inout Model)
{
    return Model.HasAcceptButton();
}
bool __UIGetter_HasRefuseButton(const FVM_PendingConfirmItem &inout Model)
{
    return Model.HasRefuseButton();
}
bool __UIGetter_HasTestButton(const FVM_PendingConfirmItem &inout Model)
{
    return Model.HasTestButton();
}
bool __UIGetter_ShowAcceptCooldown(const FVM_PendingConfirmItem &inout Model)
{
    return Model.ShowAcceptCooldown();
}
bool __UIGetter_ShowRefuseCooldown(const FVM_PendingConfirmItem &inout Model)
{
    return Model.ShowRefuseCooldown();
}
FText __UIGetter_RemainingTimeText(const FVM_PendingConfirmItem &inout Model)
{
    return Model.GetRemainingTimeText();
}
float32 __UIGetter_RemainingTimePercent(const FVM_PendingConfirmItem &inout Model)
{
    return Model.GetRemainingTimePercent();
}
bool __UIGetter_HasConfirmButton(const FVM_PendingConfirmItem &inout Model)
{
    return Model.HasConfirmButton();
}
bool __UIGetter_HasDenyButton(const FVM_PendingConfirmItem &inout Model)
{
    return Model.HasDenyButton();
}
FText __UIGetter_ContextText(const FVM_PendingConfirmItem &inout Model)
{
    return Model.GetContextText();
}
FText __UIGetter_TitleText(const FVM_PendingConfirmItem &inout Model)
{
    return Model.GetTitleText();
}
FSoftBrush __UIGetter_TitleImage(const FVM_PendingConfirmItem &inout Model)
{
    return Model.GetTitleImage();
}
FText __UIGetter_SenderPlayerName(const FVM_PendingConfirmItem &inout Model)
{
    return Model.GetSenderPlayerName();
}
TEUIModelRef<FVM_PendingConfirmItem> __UIGetter_Self(const FVM_PendingConfirmItem &inout Model)
{
    return TEUIModelRef<FVM_PendingConfirmItem>(Model);
}
int __IndexOf_CommonPopupId()
{
    return 0;
}
int __IndexOf_SenderPlayerInfo()
{
    return 1;
}
int __IndexOf_StartTime()
{
    return 2;
}
int __IndexOf_EndTime()
{
    return 3;
}
int __IndexOf_Config()
{
    return 4;
}
int __IndexOf_PlayerBasicItem()
{
    return 5;
}
int __IndexOf_TimeProgress()
{
    return 6;
}
}
namespace __GeneratedProperties_FVM_PendingConfirmItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
