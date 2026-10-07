
namespace FVM_TimeOfDay
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature ShowHover = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature HideHover = FEUIModelCallbackSignature();

}
struct FVM_TimeOfDay : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    int m_CurrentTimeOfDayInSeconds;
    UPROPERTY()
    FCommonHoverHandle m_HoverHandle;
    UPROPERTY()
    TDataObjectPtr<FTODStageConfig> m_CurrentStage;

    FVM_TimeOfDay()
    {
        this.m_CurrentTimeOfDayInSeconds = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_TimeOfDay(const FVM_TimeOfDay &inout Other)
    {
        this.m_CurrentTimeOfDayInSeconds = 0;
        this.m_CurrentTimeOfDayInSeconds = int(Other.m_CurrentTimeOfDayInSeconds);
        this.m_CurrentStage = Other.m_CurrentStage;
        return;
    }
    FVM_TimeOfDay& opAssign(const FVM_TimeOfDay &inout Other)
    {
        this.m_CurrentTimeOfDayInSeconds = int(Other.m_CurrentTimeOfDayInSeconds);
        return Other.m_CurrentStage;
    }
    void OnTimeOfDayChanged(const FCS_TimeOfDay &inout C_TimeOfDay)
    {
        if (!(C_TimeOfDay))
        {
            return;
        }
        this.SetCurrentTimeOfDayInSeconds((C_TimeOfDay.GetTimeOfDaySeconds() % int(FTimespan::FromDays(1.0).GetTotalSeconds())));
        this.SetCurrentStage(::FTimeOfDayUtils::GetTODStage(::FTimeOfDayUtils::GetTimeOfDayInHours(this.GetCurrentTimeOfDayInSeconds())));
        return;
    }
    FSlateBrush GetDisplayIcon() const
    {
        if (this.GetCurrentStage())
        {
            return this.GetCurrentStage().opArrow().DisplayIcon.LoadBrush();
        }
        return FSlateBrush();
    }
    float32 GetTimeOfDayStagePercentage() const
    {
        const UTimeOfDaySettings local_2;
        GetGameplaySettings<UTimeOfDaySettings> local_4;
        local_2 = local_4;
        int local_7 = local_2.GetStageStartTimeInHours(this.GetCurrentStage());
        float32 local_12 = this.DeltaHours(::FTimeOfDayUtils::GetTimeOfDayInHours(this.GetCurrentTimeOfDayInSeconds()), local_7);
        float32 local_13 = local_2.GetStageEndTimeInHours(this.GetCurrentStage());
        float32 local_10 = this.DeltaHours(local_13, local_7);
        if (local_10 > 0.0f)
        {
            local_13 = local_12 / local_10;
        }
        else
        {
            local_13 = 0.0f;
        }
        return local_13;
    }
    float32 GetTimeOfDayPercentageToAngle() const
    {
        const UTimeOfDaySettings local_2;
        GetGameplaySettings<UTimeOfDaySettings> local_4;
        local_2 = local_4;
        if (local_2.TimeOfDayDefines.Num() <= 0)
        {
            return 0.0f;
        }
        float32 local_11 = local_2.TimeOfDayDefines[0].StartTime;
        local_11 = ::FTimeOfDayUtils::GetTimeOfDayInHours(this.GetCurrentTimeOfDayInSeconds()) - local_11;
        if (local_11 < 0.0f)
        {
            local_11 = local_11 + 24.0f;
        }
        return ((local_11 / 24.0f) * 180.0f) - 90.0f;
    }
    FWidgetTransform GetTimeOfDayPercentageToTransform() const
    {
        float32 local_15 = this.GetTimeOfDayPercentageToAngle();
        return FWidgetTransform();
    }
    FDateTime GetTimeOfDay() const
    {
        return FDateTime::FromUnixTimestamp(this.GetCurrentTimeOfDayInSeconds());
    }
    float32 DeltaHours(const float32 EndHours, const float32 StartHours) const
    {
        float32 local_1 = EndHours - StartHours;
        if (local_1 < 0.0f)
        {
            return local_1 + 24.0f;
        }
        return local_1;
    }
    void ShowHover(const UWidget Widget)
    {
        const UUtilitySettings local_22;
        FCommonHoverHandle local_2;
        if (local_2.opCmp(FCommonHoverHandle::InvalidHandle) == 0)
        {
            FEUIModelContainer local_18;
            local_18.AddModel(FEUIModelRef(this), false);
            GetGameplaySettings<UUtilitySettings> local_24;
            local_22 = local_24;
            local_2 = ::CommonPopup::HoverCustom(Widget, local_22.TimeOfDayInfoHover, local_18, false, true, ECommonHoverLayout(0), EEUILayoutLayer(0), false);
            this.SetHoverHandle(local_2);
        }
        return;
    }
    void HideHover()
    {
        ::CommonPopup::CloseHover(this.GetHoverHandle(), this.GetContext().Manager, true);
        this.SetHoverHandle(FCommonHoverHandle::InvalidHandle);
        return;
    }
    int GetCurrentTimeOfDayInSeconds() const property
    {
        this.TrackPropertyRead(0);
        return this.m_CurrentTimeOfDayInSeconds;
    }
    void SetCurrentTimeOfDayInSeconds(const int __Value) property
    {
        if (this.m_CurrentTimeOfDayInSeconds == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CurrentTimeOfDayInSeconds = __Value;
        return;
    }
    const FCommonHoverHandle GetHoverHandle() const property
    {
        const FCommonHoverHandle __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FCommonHoverHandle GetModify_HoverHandle() property
    {
        FCommonHoverHandle __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetHoverHandle(const FCommonHoverHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        return;
    }
    const TDataObjectPtr<FTODStageConfig> GetCurrentStage() const property
    {
        const TDataObjectPtr<FTODStageConfig> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TDataObjectPtr<FTODStageConfig> GetModify_CurrentStage() property
    {
        TDataObjectPtr<FTODStageConfig> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetCurrentStage(const TDataObjectPtr<FTODStageConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CurrentStage = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TimeOfDay
{
    UPROPERTY()
    FSlateBrush DisplayIcon;
    UPROPERTY()
    float32 TimeOfDayStagePercentage;
    UPROPERTY()
    float32 TimeOfDayPercentageToAngle;
    UPROPERTY()
    FWidgetTransform TimeOfDayPercentageToTransform;
    UPROPERTY()
    FDateTime TimeOfDay;
    UPROPERTY()
    TEUIModelRef<FVM_TimeOfDay> Self;


}

namespace FVM_TimeOfDay
{
FVM_TimeOfDay& Get(const UObject ContextObject)
{
    return FVM_TimeOfDay::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_TimeOfDay GetByManager(const UEUIManagerSubsystem Manager)
{
    FVM_TimeOfDay __r;
    TEUIModelRef<FVM_TimeOfDay> local_6 = TEUIModelRef<FVM_TimeOfDay>(EUIInternal::MakeModelWithManager(Manager, FVM_TimeOfDay::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "CurrentStage";
    local_14.TypeName = "TDataObjectPtr<FTODStageConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayIcon";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TimeOfDayStagePercentage";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TimeOfDayPercentageToAngle";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TimeOfDayPercentageToTransform";
    local_14.TypeName = "FWidgetTransform";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TimeOfDay";
    local_14.TypeName = "FDateTime";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TimeOfDay>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TimeOfDay;
    FEUIModelMonitorDefine local_26;
    local_26.FunctionName = "__OnTimeOfDayChanged";
    local_26.ComponentType = FCS_TimeOfDay;
    Result.MonitorFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TimeOfDay;
}
void __OnTimeOfDayChanged(FVM_TimeOfDay &inout Model, const FECSEntity &inout Entity, const FCS_TimeOfDay &inout Component)
{
    Get local_4;
    Model.OnTimeOfDayChanged(local_4.opCall());
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
TDataObjectPtr<FTODStageConfig> __UIGetter_CurrentStage(const FVM_TimeOfDay &inout Model)
{
    return Model.GetCurrentStage();
}
FSlateBrush __UIGetter_DisplayIcon(const FVM_TimeOfDay &inout Model)
{
    return Model.GetDisplayIcon();
}
float32 __UIGetter_TimeOfDayStagePercentage(const FVM_TimeOfDay &inout Model)
{
    return Model.GetTimeOfDayStagePercentage();
}
float32 __UIGetter_TimeOfDayPercentageToAngle(const FVM_TimeOfDay &inout Model)
{
    return Model.GetTimeOfDayPercentageToAngle();
}
FWidgetTransform __UIGetter_TimeOfDayPercentageToTransform(const FVM_TimeOfDay &inout Model)
{
    return Model.GetTimeOfDayPercentageToTransform();
}
FDateTime __UIGetter_TimeOfDay(const FVM_TimeOfDay &inout Model)
{
    return Model.GetTimeOfDay();
}
TEUIModelRef<FVM_TimeOfDay> __UIGetter_Self(const FVM_TimeOfDay &inout Model)
{
    return TEUIModelRef<FVM_TimeOfDay>(Model);
}
int __IndexOf_CurrentTimeOfDayInSeconds()
{
    return 0;
}
int __IndexOf_HoverHandle()
{
    return 1;
}
int __IndexOf_CurrentStage()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_TimeOfDay
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
