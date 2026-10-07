
namespace FVM_TutorialHint
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OpenManualDetail = FEUIModelCallbackSignature();

}
struct FVM_TutorialHint : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    uint m_GuideDataId;
    UPROPERTY()
    FText m_SystemText;
    UPROPERTY()
    float32 m_CountdownPercent;
    UPROPERTY()
    bool m_bShowAction;
    UPROPERTY()
    FEUIInputAction m_HintInputAction;
    UPROPERTY()
    float32 m_CountdownSeconds;
    UPROPERTY()
    float32 m_RemainingCountdownSeconds;
    UPROPERTY()
    FEUITimerHandle m_CountdownTimer;

    FVM_TutorialHint()
    {
        this.m_GuideDataId = 0;
        this.m_CountdownPercent = 1.0f;
        this.m_bShowAction = false;
        this.m_CountdownSeconds = 3.0f;
        this.m_RemainingCountdownSeconds = 3.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TutorialHint' by default constructor.");
        return;
    }
    FVM_TutorialHint(const FVM_TutorialHint &inout Other)
    {
        this.m_GuideDataId = 0;
        this.m_CountdownPercent = 1.0f;
        this.m_bShowAction = false;
        this.m_CountdownSeconds = 3.0f;
        this.m_RemainingCountdownSeconds = 3.0f;
        this.m_GuideDataId = int(Other.m_GuideDataId);
        this.m_SystemText = Other.m_SystemText;
        this.m_CountdownPercent = Other.m_CountdownPercent;
        this.m_bShowAction = Other.m_bShowAction;
        this.m_HintInputAction = Other.m_HintInputAction;
        this.m_CountdownSeconds = Other.m_CountdownSeconds;
        this.m_RemainingCountdownSeconds = Other.m_RemainingCountdownSeconds;
        this.m_CountdownTimer = Other.m_CountdownTimer;
        return;
    }
    FVM_TutorialHint(const uint InGuideDataId)
    {
        this.m_GuideDataId = 0;
        this.m_CountdownPercent = 1.0f;
        this.m_bShowAction = false;
        this.m_CountdownSeconds = 3.0f;
        this.m_RemainingCountdownSeconds = 3.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetGuideDataId(InGuideDataId);
        return;
    }
    FVM_TutorialHint& opAssign(const FVM_TutorialHint &inout Other)
    {
        this.m_GuideDataId = int(Other.m_GuideDataId);
        this.m_SystemText = Other.m_SystemText;
        this.m_CountdownPercent = Other.m_CountdownPercent;
        this.m_bShowAction = Other.m_bShowAction;
        this.m_HintInputAction = Other.m_HintInputAction;
        this.m_CountdownSeconds = Other.m_CountdownSeconds;
        this.m_RemainingCountdownSeconds = Other.m_RemainingCountdownSeconds;
        return Other.m_CountdownTimer;
    }
    void PostConstruct()
    {
        int local_49 = this.GetGuideDataId();
        GetDataObjectByGSDataId<FGuideGroupConfig> local_48;
        TDataObjectPtr<FGuideGroupConfig> local_74 = local_48.opImplConv();
        if (!(local_74))
        {
            this.CloseHint();
            return;
        }
        UGuideManualSettings local_104 = ::GuideManualSettings::Get();
        this.SetCountdownSeconds(FMath::Max(local_104.HintCountdownSeconds, 0.0f));
        this.SetRemainingCountdownSeconds(this.GetCountdownSeconds());
        this.SetHintInputAction(local_104.HintInputAction);
        this.SetbShowAction((0 == 2));
        FText::AsCultureInvariant("[{0}]");
        FText local_118;
        this.SetSystemText(local_118);
        ::FMS_GuideManual::Get(this.GetManager()).CompleteGuideOnShow(this.GetGuideDataId());
        if (this.GetCountdownSeconds() <= 0.0f)
        {
            this.SetCountdownPercent(0.0f);
            this.CloseHint();
            return;
        }
        this.ScheduleTick(this.GetModify_CountdownTimer(), n"TickCountdown", 0.0f, -1.0f);
        return;
    }
    void BeginDestroy()
    {
        this.ClearTimer(this.GetModify_CountdownTimer());
        return;
    }
    void TickCountdown()
    {
        this.SetRemainingCountdownSeconds(FMath::Max((this.GetRemainingCountdownSeconds() - float32(this.GetContext().DeltaTime.ToSeconds())), 0.0f));
        float32 local_4_2 = this.GetRemainingCountdownSeconds() / this.GetCountdownSeconds();
        this.SetCountdownPercent(FMath::Clamp(local_4_2, 0.0f, 1.0f));
        if (this.GetRemainingCountdownSeconds() <= 0.0f)
        {
            this.CloseHint();
        }
        return;
    }
    void OpenManualDetail()
    {
        if (!(this.GetbShowAction()))
        {
            return;
        }
        ::FMS_GuideManual::Get(this.GetManager()).OpenHandbookDetailForGuide(this.GetGuideDataId());
        this.CloseHint();
        return;
    }
    void CloseHint()
    {
        this.ClearTimer(this.GetModify_CountdownTimer());
        ::FMS_GuideManual::Get(this.GetManager()).CloseTutorialHint(this.GetGuideDataId());
        return;
    }
    uint GetGuideDataId() const property
    {
        this.TrackPropertyRead(0);
        return this.m_GuideDataId;
    }
    void SetGuideDataId(const uint __Value) property
    {
        if (this.m_GuideDataId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_GuideDataId = __Value;
        return;
    }
    const FText GetSystemText() const property
    {
        const FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_SystemText() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetSystemText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SystemText = __Value;
        return;
    }
    float32 GetCountdownPercent() const property
    {
        float32 __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    float32 GetModify_CountdownPercent() property
    {
        float32 __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetCountdownPercent(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CountdownPercent = __Value;
        return;
    }
    bool GetbShowAction() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bShowAction;
    }
    void SetbShowAction(const bool __Value) property
    {
        if (!(this.m_bShowAction) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bShowAction = __Value;
        return;
    }
    const FEUIInputAction GetHintInputAction() const property
    {
        const FEUIInputAction __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FEUIInputAction GetModify_HintInputAction() property
    {
        FEUIInputAction __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetHintInputAction(const FEUIInputAction &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_HintInputAction = __Value;
        return;
    }
    float32 GetCountdownSeconds() const property
    {
        float32 __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    float32 GetModify_CountdownSeconds() property
    {
        float32 __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetCountdownSeconds(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_CountdownSeconds = __Value;
        return;
    }
    const float32 GetRemainingCountdownSeconds() const property
    {
        const float32 __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    float32 GetModify_RemainingCountdownSeconds() property
    {
        float32 __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetRemainingCountdownSeconds(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_RemainingCountdownSeconds = __Value;
        return;
    }
    const FEUITimerHandle GetCountdownTimer() const property
    {
        const FEUITimerHandle __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FEUITimerHandle GetModify_CountdownTimer() property
    {
        FEUITimerHandle __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetCountdownTimer(const FEUITimerHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_CountdownTimer = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TutorialHint
{
    UPROPERTY()
    TEUIModelRef<FVM_TutorialHint> Self;

    __GeneratedProperties_FVM_TutorialHint()
    {
        return;
    }
}

namespace FVM_TutorialHint
{
FVM_TutorialHint& Create(const UObject ContextObject, const uint GuideDataId)
{
    return FVM_TutorialHint::CreateByManager(EUIInternal::GetContextManager(ContextObject), GuideDataId);
}
FVM_TutorialHint CreateByManager(const UEUIManagerSubsystem Manager, const uint GuideDataId)
{
    FVM_TutorialHint __r;
    TEUIModelRef<FVM_TutorialHint> local_6 = TEUIModelRef<FVM_TutorialHint>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TutorialHint::ModelId, 0, GuideDataId));
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
    local_14.PropertyName = "SystemText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CountdownPercent";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bShowAction";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HintInputAction";
    local_14.TypeName = "FEUIInputAction";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TutorialHint>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TutorialHint;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TutorialHint;
}
FText __UIGetter_SystemText(const FVM_TutorialHint &inout Model)
{
    return Model.GetSystemText();
}
float32 __UIGetter_CountdownPercent(const FVM_TutorialHint &inout Model)
{
    return Model.GetCountdownPercent();
}
bool __UIGetter_bShowAction(const FVM_TutorialHint &inout Model)
{
    return Model.GetbShowAction();
}
FEUIInputAction __UIGetter_HintInputAction(const FVM_TutorialHint &inout Model)
{
    return Model.GetHintInputAction();
}
TEUIModelRef<FVM_TutorialHint> __UIGetter_Self(const FVM_TutorialHint &inout Model)
{
    return TEUIModelRef<FVM_TutorialHint>(Model);
}
int __IndexOf_GuideDataId()
{
    return 0;
}
int __IndexOf_SystemText()
{
    return 1;
}
int __IndexOf_CountdownPercent()
{
    return 2;
}
int __IndexOf_bShowAction()
{
    return 3;
}
int __IndexOf_HintInputAction()
{
    return 4;
}
int __IndexOf_CountdownSeconds()
{
    return 5;
}
int __IndexOf_RemainingCountdownSeconds()
{
    return 6;
}
int __IndexOf_CountdownTimer()
{
    return 7;
}
}
namespace __GeneratedProperties_FVM_TutorialHint
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
