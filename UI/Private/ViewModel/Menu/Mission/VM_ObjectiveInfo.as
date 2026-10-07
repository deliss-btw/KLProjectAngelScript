
namespace FVM_ObjectiveInfo
{
    const int ModelId = 0;

}
struct FVM_ObjectiveInfo : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    uint m_ObjectiveInstanceId;
    UPROPERTY()
    TDataObjectPtr<FObjectiveConfig> m_ObjectiveConfig;
    UPROPERTY()
    bool m_bIsFinished;
    UPROPERTY()
    FText m_ObjectiveTitle;
    UPROPERTY()
    FText m_FinishProgressText;
    UPROPERTY()
    FText m_FailProgressText;

    FVM_ObjectiveInfo()
    {
        this.m_ObjectiveInstanceId = 0;
        this.m_bIsFinished = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ObjectiveInfo' by default constructor.");
        return;
    }
    FVM_ObjectiveInfo(const FVM_ObjectiveInfo &inout Other)
    {
        this.m_ObjectiveInstanceId = 0;
        this.m_bIsFinished = false;
        this.m_ObjectiveInstanceId = int(Other.m_ObjectiveInstanceId);
        this.m_ObjectiveConfig = Other.m_ObjectiveConfig;
        this.m_bIsFinished = Other.m_bIsFinished;
        this.m_ObjectiveTitle = Other.m_ObjectiveTitle;
        this.m_FinishProgressText = Other.m_FinishProgressText;
        this.m_FailProgressText = Other.m_FailProgressText;
        return;
    }
    FVM_ObjectiveInfo(const uint InObjectiveInstanceId, const TDataObjectPtr<FObjectiveConfig> &inout InObjectiveConfig)
    {
        this.m_ObjectiveInstanceId = 0;
        this.m_bIsFinished = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetObjectiveInstanceId(InObjectiveInstanceId);
        this.SetObjectiveConfig(InObjectiveConfig);
        return;
    }
    FVM_ObjectiveInfo& opAssign(const FVM_ObjectiveInfo &inout Other)
    {
        this.m_ObjectiveInstanceId = int(Other.m_ObjectiveInstanceId);
        this.m_ObjectiveConfig = Other.m_ObjectiveConfig;
        this.m_bIsFinished = Other.m_bIsFinished;
        this.m_ObjectiveTitle = Other.m_ObjectiveTitle;
        this.m_FinishProgressText = Other.m_FinishProgressText;
        return Other.m_FailProgressText;
    }
    void UpdateTitle(const int InCommissionAllSteps = 0, const int InCurrentStep = 0)
    {
        FText local_8 = ::ObjectiveUtils::GetObjectiveTitle(this.GetObjectiveConfig());
        if ((InCommissionAllSteps > 0 && (InCurrentStep >= 0)))
        {
            local_8 = FText::Format(NSLOCTEXT("ObjectiveInfo", "ObjectiveTitle", "{0} <Yellow24F>й¶ж®µ{1}/{2}</>"), local_8, InCurrentStep, InCommissionAllSteps);
        }
        this.SetObjectiveTitle(local_8);
        return;
    }
    void UpdateProgress(const int InFinishProgressValue, const int InFailProgressValue)
    {
        int local_1;
        int local_2;
        ::ObjectiveUtils::GetObjectiveTargetValue(this.GetObjectiveConfig(), local_1, local_2);
        this.SetFinishProgressText(FText::Format(NSLOCTEXT("ObjectiveInfo", "ProgressText", "{0}/{1}"), InFinishProgressValue, local_1));
        this.SetFailProgressText(FText::Format(NSLOCTEXT("ObjectiveInfo", "ProgressText", "{0}/{1}"), InFailProgressValue, local_2));
        return;
    }
    uint GetObjectiveInstanceId() const property
    {
        this.TrackPropertyRead(0);
        return this.m_ObjectiveInstanceId;
    }
    void SetObjectiveInstanceId(const uint __Value) property
    {
        if (this.m_ObjectiveInstanceId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ObjectiveInstanceId = __Value;
        return;
    }
    const TDataObjectPtr<FObjectiveConfig> GetObjectiveConfig() const property
    {
        const TDataObjectPtr<FObjectiveConfig> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TDataObjectPtr<FObjectiveConfig> GetModify_ObjectiveConfig() property
    {
        TDataObjectPtr<FObjectiveConfig> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetObjectiveConfig(const TDataObjectPtr<FObjectiveConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ObjectiveConfig = __Value;
        return;
    }
    bool GetbIsFinished() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bIsFinished;
    }
    void SetbIsFinished(const bool __Value) property
    {
        if (!(this.m_bIsFinished) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bIsFinished = __Value;
        return;
    }
    const FText GetObjectiveTitle() const property
    {
        const FText __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FText GetModify_ObjectiveTitle() property
    {
        FText __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetObjectiveTitle(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_ObjectiveTitle = __Value;
        return;
    }
    const FText GetFinishProgressText() const property
    {
        const FText __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FText GetModify_FinishProgressText() property
    {
        FText __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetFinishProgressText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_FinishProgressText = __Value;
        return;
    }
    const FText GetFailProgressText() const property
    {
        const FText __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FText GetModify_FailProgressText() property
    {
        FText __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetFailProgressText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_FailProgressText = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ObjectiveInfo
{
    UPROPERTY()
    TEUIModelRef<FVM_ObjectiveInfo> Self;

    __GeneratedProperties_FVM_ObjectiveInfo()
    {
        return;
    }
}

namespace FVM_ObjectiveInfo
{
FVM_ObjectiveInfo& Create(const UObject ContextObject, const uint ObjectiveInstanceId, const TDataObjectPtr<FObjectiveConfig> &inout ObjectiveConfig)
{
    return FVM_ObjectiveInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject), ObjectiveInstanceId, ObjectiveConfig);
}
FVM_ObjectiveInfo CreateByManager(const UEUIManagerSubsystem Manager, const uint ObjectiveInstanceId, const TDataObjectPtr<FObjectiveConfig> &inout ObjectiveConfig)
{
    FVM_ObjectiveInfo __r;
    TEUIModelRef<FVM_ObjectiveInfo> local_6 = TEUIModelRef<FVM_ObjectiveInfo>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ObjectiveInfo::ModelId, 0, ObjectiveInstanceId, ObjectiveConfig));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "bIsFinished";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ObjectiveTitle";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "FinishProgressText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "FailProgressText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ObjectiveInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ObjectiveInfo;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ObjectiveInfo;
}
bool __UIGetter_bIsFinished(const FVM_ObjectiveInfo &inout Model)
{
    return Model.GetbIsFinished();
}
FText __UIGetter_ObjectiveTitle(const FVM_ObjectiveInfo &inout Model)
{
    return Model.GetObjectiveTitle();
}
FText __UIGetter_FinishProgressText(const FVM_ObjectiveInfo &inout Model)
{
    return Model.GetFinishProgressText();
}
FText __UIGetter_FailProgressText(const FVM_ObjectiveInfo &inout Model)
{
    return Model.GetFailProgressText();
}
TEUIModelRef<FVM_ObjectiveInfo> __UIGetter_Self(const FVM_ObjectiveInfo &inout Model)
{
    return TEUIModelRef<FVM_ObjectiveInfo>(Model);
}
int __IndexOf_ObjectiveInstanceId()
{
    return 0;
}
int __IndexOf_ObjectiveConfig()
{
    return 1;
}
int __IndexOf_bIsFinished()
{
    return 2;
}
int __IndexOf_ObjectiveTitle()
{
    return 3;
}
int __IndexOf_FinishProgressText()
{
    return 4;
}
int __IndexOf_FailProgressText()
{
    return 5;
}
}
namespace __GeneratedProperties_FVM_ObjectiveInfo
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
