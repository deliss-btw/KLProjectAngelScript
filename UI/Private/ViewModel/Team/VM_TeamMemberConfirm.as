
namespace FVM_TeamMemberConfirm
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnAgree = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnReject = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnCancel = FEUIModelCallbackSignature();

}
struct FVM_TeamMemberConfirm : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FEUIModelRef m_BusinessData;
    UPROPERTY()
    TSubclassOf<UTeamMemberConfirmSourceBase> m_SourceClass;
    UPROPERTY()
    UTeamMemberConfirmSourceBase m_Source;
    UPROPERTY()
    FText m_TitleName;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_TeamMemberPrepareItem>> m_TeamMembers;
    UPROPERTY()
    FMW_TimeProgress m_ReplyCountdown;
    UPROPERTY()
    int m_ReplyCountdownSeconds;
    UPROPERTY()
    float32 m_ReplyTimeout;
    UPROPERTY()
    bool m_bIsOpen;
    UPROPERTY()
    int m_ReplyStatusIndex;
    UPROPERTY()
    bool m_bClosing;
    UPROPERTY()
    FFPTime m_CloseCountdown;
    UPROPERTY()
    bool m_bCloseHandled;

    FVM_TeamMemberConfirm()
    {
        this.m_Source = nullptr;
        this.m_ReplyCountdownSeconds = 0;
        this.m_ReplyTimeout = 0.0f;
        this.m_bIsOpen = true;
        this.m_ReplyStatusIndex = 0;
        this.m_bClosing = false;
        this.m_bCloseHandled = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TeamMemberConfirm' by default constructor.");
        return;
    }
    FVM_TeamMemberConfirm(const FVM_TeamMemberConfirm &inout Other)
    {
        this.m_Source = nullptr;
        this.m_ReplyCountdownSeconds = 0;
        this.m_ReplyTimeout = 0.0f;
        this.m_bIsOpen = true;
        this.m_ReplyStatusIndex = 0;
        this.m_bClosing = false;
        this.m_bCloseHandled = false;
        this.m_BusinessData = Other.m_BusinessData;
        this.m_SourceClass = Other.m_SourceClass;
        this.m_Source = Other.m_Source;
        this.m_TitleName = Other.m_TitleName;
        this.m_TeamMembers = Other.m_TeamMembers;
        this.m_ReplyCountdown = Other.m_ReplyCountdown;
        this.m_ReplyCountdownSeconds = int(Other.m_ReplyCountdownSeconds);
        this.m_ReplyTimeout = Other.m_ReplyTimeout;
        this.m_bIsOpen = Other.m_bIsOpen;
        this.m_ReplyStatusIndex = int(Other.m_ReplyStatusIndex);
        this.m_bClosing = Other.m_bClosing;
        this.m_CloseCountdown = Other.m_CloseCountdown;
        this.m_bCloseHandled = Other.m_bCloseHandled;
        return;
    }
    FVM_TeamMemberConfirm(const FEUIModelRef &inout InBusinessData, const TSubclassOf<UTeamMemberConfirmSourceBase> &inout InSourceClass)
    {
        this.m_Source = nullptr;
        this.m_ReplyCountdownSeconds = 0;
        this.m_ReplyTimeout = 0.0f;
        this.m_bIsOpen = true;
        this.m_ReplyStatusIndex = 0;
        this.m_bClosing = false;
        this.m_bCloseHandled = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetBusinessData(InBusinessData);
        this.SetSourceClass(InSourceClass);
        return;
    }
    FVM_TeamMemberConfirm opAssign(const FVM_TeamMemberConfirm &inout Other)
    {
        FVM_TeamMemberConfirm __r;
        this.m_BusinessData = Other.m_BusinessData;
        this.m_SourceClass = Other.m_SourceClass;
        this.m_Source = Other.m_Source;
        this.m_TitleName = Other.m_TitleName;
        this.m_TeamMembers = Other.m_TeamMembers;
        this.m_ReplyCountdown = Other.m_ReplyCountdown;
        this.m_ReplyCountdownSeconds = int(Other.m_ReplyCountdownSeconds);
        this.m_ReplyTimeout = Other.m_ReplyTimeout;
        this.m_bIsOpen = Other.m_bIsOpen;
        this.m_ReplyStatusIndex = int(Other.m_ReplyStatusIndex);
        this.m_bClosing = Other.m_bClosing;
        this.m_CloseCountdown = Other.m_CloseCountdown;
        this.m_bCloseHandled = Other.m_bCloseHandled;
        return __r;
    }
    void PostConstruct()
    {
        this.SetSource(this.GetSourceClass().GetDefaultObject());
        this.SetbIsOpen(true);
        if (this.GetSource() == nullptr)
        {
            return;
        }
        this.SetReplyTimeout(this.GetSource().GetReplyTimeout(this.GetContext(), this.GetBusinessData()));
        if (this.GetReplyTimeout() > 0.0f)
        {
            this.GetModify_ReplyCountdown().RestartSmooth(FFPTime(this.GetReplyTimeout()));
        }
        this.SetTitleName(this.GetSource().GetTitleName(this.GetContext(), this.GetBusinessData()));
        this.SetTeamMembers(this.GetSource().BuildMembers(this.GetContext(), this.GetBusinessData()));
        return;
    }
    void BeginDestroy()
    {
        if (this.GetSource() != nullptr)
        {
            this.GetSource().OnDestroy(this.GetContext(), this.GetBusinessData());
        }
        return;
    }
    void Tick()
    {
        if (this.GetSource() == nullptr || !(this.GetbIsOpen()))
        {
            return;
        }
        this.GetSource().RefreshMembers(this.GetContext(), this.GetBusinessData(), this.GetTeamMembers());
        if (!(this.GetbClosing()))
        {
            int local_6 = this.GetSource().GetCloseRequest(this.GetContext(), this.GetBusinessData());
            if (local_6 == 1)
            {
                this.HandleClose();
            }
            else
            {
                if (local_6 == 2)
                {
                    this.SetbClosing(true);
                    this.SetCloseCountdown(FFPTime(this.GetSource().GetCloseDelay(this.GetContext(), this.GetBusinessData())));
                }
            }
            return;
        }
        FFPTime local_10 = (this.GetCloseCountdown() - this.GetContext().DeltaTime);
        this.SetCloseCountdown(local_10);
        if (FFPTime(this.GetCloseCountdown()).opCmp(0.0) <= 0)
        {
            this.HandleClose();
        }
        return;
    }
    void HandleClose()
    {
        if (!(this.GetbCloseHandled()))
        {
            this.SetbCloseHandled(true);
            this.GetSource().OnBeforeClose(this.GetContext(), this.GetBusinessData());
        }
        this.SetbIsOpen(false);
        return;
    }
    void RefreshReactiveState()
    {
        this.SetReplyCountdownSeconds(FMath::RoundToInt(this.GetReplyCountdown().GetRemainedTime().ToSeconds()));
        if (this.GetSource() != nullptr)
        {
            this.SetReplyStatusIndex(this.GetSource().GetReplyStatusIndex(this.GetContext(), this.GetBusinessData()));
        }
        return;
    }
    float32 GetReplyCountdownPercentage() const
    {
        return this.GetReplyCountdown().GetRemainingRatio();
    }
    FText GetReplyProgressText() const
    {
        FText local_16 = this.GetSource() != nullptr ? this.GetSource().GetReplyProgressText(this.GetContext(), this.GetBusinessData()) : FText();
        return local_16;
    }
    FText GetWarningText() const
    {
        FText local_16 = this.GetSource() != nullptr ? this.GetSource().GetWarningText(this.GetContext(), this.GetBusinessData()) : FText();
        return local_16;
    }
    bool IsNoneReject() const
    {
        bool local_5;
        if (this.GetSource() != nullptr)
        {
            local_5 = this.GetSource().IsNoneReject(this.GetContext(), this.GetBusinessData());
        }
        else
        {
            local_5 = true;
        }
        return local_5;
    }
    TSoftClassPtr<UEUIUserWidget> GetContentWidgetClass() const
    {
        TSoftClassPtr<UEUIUserWidget> local_34;
        if (this.GetSource() != nullptr)
        {
            local_34 = this.GetSource().GetContentWidgetClass(this.GetContext(), this.GetBusinessData());
        }
        else
        {
            local_34 = TSoftClassPtr<UEUIUserWidget>();
        }
        return local_34;
    }
    FEUIModelContainer GetContentModel() const
    {
        FEUIModelContainer local_46 = this.GetSource() != nullptr ? this.GetSource().GetContentModel(this.GetContext(), this.GetBusinessData()) : FEUIModelContainer();
        return local_46;
    }
    void OnAgree()
    {
        if (this.GetSource() != nullptr)
        {
            this.GetSource().OnAgree(this.GetContext(), this.GetBusinessData());
        }
        return;
    }
    void OnReject()
    {
        if (this.GetSource() != nullptr)
        {
            this.GetSource().OnReject(this.GetContext(), this.GetBusinessData());
        }
        return;
    }
    void OnCancel()
    {
        if (this.GetSource() != nullptr)
        {
            this.GetSource().OnCancel(this.GetContext(), this.GetBusinessData());
        }
        return;
    }
    const FEUIModelRef GetBusinessData() const property
    {
        const FEUIModelRef __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FEUIModelRef GetModify_BusinessData() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetBusinessData(const FEUIModelRef &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_BusinessData = __Value;
        return;
    }
    TSubclassOf<UTeamMemberConfirmSourceBase> GetSourceClass() const property
    {
        this.TrackPropertyRead(1);
        return this.m_SourceClass;
    }
    void SetSourceClass(const TSubclassOf<UTeamMemberConfirmSourceBase> &inout __Value) property
    {
        if ((this.m_SourceClass == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SourceClass = __Value;
        return;
    }
    UTeamMemberConfirmSourceBase GetSource() const property
    {
        this.TrackPropertyRead(2);
        return this.m_Source;
    }
    void SetSource(const UTeamMemberConfirmSourceBase __Value) property
    {
        if (this.m_Source == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        return;
    }
    FText GetTitleName() const property
    {
        FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_TitleName() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetTitleName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_TitleName = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_TeamMemberPrepareItem>> GetTeamMembers() const property
    {
        const TArray<TEUIModelRef<FVM_TeamMemberPrepareItem>> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TArray<TEUIModelRef<FVM_TeamMemberPrepareItem>> GetModify_TeamMembers() property
    {
        TArray<TEUIModelRef<FVM_TeamMemberPrepareItem>> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetTeamMembers(const TArray<TEUIModelRef<FVM_TeamMemberPrepareItem>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_TeamMembers = __Value;
        return;
    }
    const FMW_TimeProgress GetReplyCountdown() const property
    {
        const FMW_TimeProgress __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FMW_TimeProgress GetModify_ReplyCountdown() property
    {
        FMW_TimeProgress __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetReplyCountdown(const FMW_TimeProgress &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_ReplyCountdown = __Value;
        return;
    }
    int GetReplyCountdownSeconds() const property
    {
        this.TrackPropertyRead(6);
        return this.m_ReplyCountdownSeconds;
    }
    void SetReplyCountdownSeconds(const int __Value) property
    {
        if (this.m_ReplyCountdownSeconds == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_ReplyCountdownSeconds = __Value;
        return;
    }
    float32 GetReplyTimeout() const property
    {
        float32 __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    float32 GetModify_ReplyTimeout() property
    {
        float32 __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetReplyTimeout(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_ReplyTimeout = __Value;
        return;
    }
    bool GetbIsOpen() const property
    {
        this.TrackPropertyRead(8);
        return this.m_bIsOpen;
    }
    void SetbIsOpen(const bool __Value) property
    {
        if (!(this.m_bIsOpen) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_bIsOpen = __Value;
        return;
    }
    int GetReplyStatusIndex() const property
    {
        this.TrackPropertyRead(9);
        return this.m_ReplyStatusIndex;
    }
    void SetReplyStatusIndex(const int __Value) property
    {
        if (this.m_ReplyStatusIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_ReplyStatusIndex = __Value;
        return;
    }
    bool GetbClosing() const property
    {
        this.TrackPropertyRead(10);
        return this.m_bClosing;
    }
    void SetbClosing(const bool __Value) property
    {
        if (!(this.m_bClosing) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_bClosing = __Value;
        return;
    }
    const FFPTime GetCloseCountdown() const property
    {
        const FFPTime __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    FFPTime GetModify_CloseCountdown() property
    {
        FFPTime __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetCloseCountdown(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        this.m_CloseCountdown = __Value;
        return;
    }
    bool GetbCloseHandled() const property
    {
        this.TrackPropertyRead(12);
        return this.m_bCloseHandled;
    }
    void SetbCloseHandled(const bool __Value) property
    {
        if (!(this.m_bCloseHandled) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(12);
        this.m_bCloseHandled = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TeamMemberConfirm
{
    UPROPERTY()
    float32 ReplyCountdownPercentage;
    UPROPERTY()
    FText ReplyProgressText;
    UPROPERTY()
    FText WarningText;
    UPROPERTY()
    bool IsNoneReject;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> ContentWidgetClass;
    UPROPERTY()
    FEUIModelContainer ContentModel;
    UPROPERTY()
    TEUIModelRef<FVM_TeamMemberConfirm> Self;


}

namespace FVM_TeamMemberConfirm
{
FVM_TeamMemberConfirm& Create(const UObject ContextObject, const FEUIModelRef &inout BusinessData, const TSubclassOf<UTeamMemberConfirmSourceBase> &inout SourceClass)
{
    return FVM_TeamMemberConfirm::CreateByManager(EUIInternal::GetContextManager(ContextObject), BusinessData, SourceClass);
}
FVM_TeamMemberConfirm CreateByManager(const UEUIManagerSubsystem Manager, const FEUIModelRef &inout BusinessData, const TSubclassOf<UTeamMemberConfirmSourceBase> &inout SourceClass)
{
    FVM_TeamMemberConfirm __r;
    TEUIModelRef<FVM_TeamMemberConfirm> local_6 = TEUIModelRef<FVM_TeamMemberConfirm>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TeamMemberConfirm::ModelId, 0, BusinessData, SourceClass));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TitleName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TeamMembers";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_TeamMemberPrepareItem>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ReplyStatusIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ReplyCountdownPercentage";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ReplyProgressText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "WarningText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsNoneReject";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ContentWidgetClass";
    local_14.TypeName = "TSoftClassPtr<UEUIUserWidget>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ContentModel";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TeamMemberConfirm>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TeamMemberConfirm;
    FEUIModelWatcherProperty local_19;
    local_19.PropertyName = FName("ReplyCountdown");
    int local_2_2 = FVM_TeamMemberConfirm::__IndexOf_ReplyCountdown();
    Result.WatcherProperties.Add(local_19);
    Result.TickFunction.FunctionName = "__Tick";
    FEUIModelEffectDefine local_26;
    local_26.FunctionName = "RefreshReactiveState";
    Result.EffectFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TeamMemberConfirm;
}
void __Tick(FVM_TeamMemberConfirm &inout Model)
{
    Model.Tick();
    return;
}
FText __UIGetter_TitleName(const FVM_TeamMemberConfirm &inout Model)
{
    return Model.GetTitleName();
}
TArray<TEUIModelRef<FVM_TeamMemberPrepareItem>> __UIGetter_TeamMembers(const FVM_TeamMemberConfirm &inout Model)
{
    return Model.GetTeamMembers();
}
int __UIGetter_ReplyStatusIndex(const FVM_TeamMemberConfirm &inout Model)
{
    return Model.GetReplyStatusIndex();
}
float32 __UIGetter_ReplyCountdownPercentage(const FVM_TeamMemberConfirm &inout Model)
{
    return Model.GetReplyCountdownPercentage();
}
FText __UIGetter_ReplyProgressText(const FVM_TeamMemberConfirm &inout Model)
{
    return Model.GetReplyProgressText();
}
FText __UIGetter_WarningText(const FVM_TeamMemberConfirm &inout Model)
{
    return Model.GetWarningText();
}
bool __UIGetter_IsNoneReject(const FVM_TeamMemberConfirm &inout Model)
{
    return Model.IsNoneReject();
}
TSoftClassPtr<UEUIUserWidget> __UIGetter_ContentWidgetClass(const FVM_TeamMemberConfirm &inout Model)
{
    return Model.GetContentWidgetClass();
}
FEUIModelContainer __UIGetter_ContentModel(const FVM_TeamMemberConfirm &inout Model)
{
    return Model.GetContentModel();
}
TEUIModelRef<FVM_TeamMemberConfirm> __UIGetter_Self(const FVM_TeamMemberConfirm &inout Model)
{
    return TEUIModelRef<FVM_TeamMemberConfirm>(Model);
}
int __IndexOf_BusinessData()
{
    return 0;
}
int __IndexOf_SourceClass()
{
    return 1;
}
int __IndexOf_Source()
{
    return 2;
}
int __IndexOf_TitleName()
{
    return 3;
}
int __IndexOf_TeamMembers()
{
    return 4;
}
int __IndexOf_ReplyCountdown()
{
    return 5;
}
int __IndexOf_ReplyCountdownSeconds()
{
    return 6;
}
int __IndexOf_ReplyTimeout()
{
    return 7;
}
int __IndexOf_bIsOpen()
{
    return 8;
}
int __IndexOf_ReplyStatusIndex()
{
    return 9;
}
int __IndexOf_bClosing()
{
    return 10;
}
int __IndexOf_CloseCountdown()
{
    return 11;
}
int __IndexOf_bCloseHandled()
{
    return 12;
}
}
namespace __GeneratedProperties_FVM_TeamMemberConfirm
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
