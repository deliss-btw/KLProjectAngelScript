
namespace FVM_AbnormalIcon
{
    const int ModelId = 0;

}
struct FVM_AbnormalIcon : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    float32 m_ProgressRatio;
    UPROPERTY()
    EAbnormalState m_TargetAbnormal;
    UPROPERTY()
    TEUIModelWeakRef<FVMS_AbnormalInfo> m_AbnormalInfoOwner;
    UPROPERTY()
    UTexture2D m_AbnormalIcon;
    UPROPERTY()
    FLinearColor m_AccumulationColor;
    UPROPERTY()
    FAbnormalStateConfig m_AbnormalStateConfig;
    UPROPERTY()
    FMW_AttributeRatio m_Accumulation;
    UPROPERTY()
    FMW_GameplayTagHas m_ActiveState;
    UPROPERTY()
    FMW_TimeProgress m_ActiveTimeProgress;
    UPROPERTY()
    bool m_bHasValidSource;
    UPROPERTY()
    bool m_bShouldShowAbnormal;

    FVM_AbnormalIcon()
    {
        this.m_AbnormalIcon = nullptr;
        this.m_ProgressRatio = 0.0f;
        this.m_TargetAbnormal = EAbnormalState(0);
        this.m_bHasValidSource = false;
        this.m_bShouldShowAbnormal = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_AbnormalIcon' by default constructor.");
        return;
    }
    FVM_AbnormalIcon(const FVM_AbnormalIcon &inout Other)
    {
        this.m_AbnormalIcon = nullptr;
        this.m_ProgressRatio = 0.0f;
        this.m_TargetAbnormal = EAbnormalState(0);
        this.m_bHasValidSource = false;
        this.m_bShouldShowAbnormal = false;
        this.m_ProgressRatio = Other.m_ProgressRatio;
        this.m_TargetAbnormal = Other.m_TargetAbnormal;
        this.m_AbnormalInfoOwner = Other.m_AbnormalInfoOwner;
        this.m_AbnormalIcon = Other.m_AbnormalIcon;
        this.m_AccumulationColor = Other.m_AccumulationColor;
        this.m_Accumulation = Other.m_Accumulation;
        this.m_ActiveState = Other.m_ActiveState;
        this.m_ActiveTimeProgress = Other.m_ActiveTimeProgress;
        this.m_bHasValidSource = Other.m_bHasValidSource;
        this.m_bShouldShowAbnormal = Other.m_bShouldShowAbnormal;
        return;
    }
    FVM_AbnormalIcon(const EAbnormalState InTargetAbnormal, const TEUIModelWeakRef<FVMS_AbnormalInfo> &inout InAbnormalInfoOwner)
    {
        this.m_AbnormalIcon = nullptr;
        this.m_ProgressRatio = 0.0f;
        this.m_TargetAbnormal = EAbnormalState(0);
        this.m_bHasValidSource = false;
        this.m_bShouldShowAbnormal = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTargetAbnormal(EAbnormalState(InTargetAbnormal));
        this.SetAbnormalInfoOwner(InAbnormalInfoOwner);
        return;
    }
    FVM_AbnormalIcon opAssign(const FVM_AbnormalIcon &inout Other)
    {
        FVM_AbnormalIcon __r;
        this.m_ProgressRatio = Other.m_ProgressRatio;
        this.m_TargetAbnormal = Other.m_TargetAbnormal;
        this.m_AbnormalInfoOwner = Other.m_AbnormalInfoOwner;
        this.m_AbnormalIcon = Other.m_AbnormalIcon;
        this.m_AccumulationColor = Other.m_AccumulationColor;
        this.m_Accumulation = Other.m_Accumulation;
        this.m_ActiveState = Other.m_ActiveState;
        this.m_ActiveTimeProgress = Other.m_ActiveTimeProgress;
        this.m_bHasValidSource = Other.m_bHasValidSource;
        this.m_bShouldShowAbnormal = Other.m_bShouldShowAbnormal;
        return __r;
    }
    void PostConstruct()
    {
        FAbnormalStateConfig local_400;
        EAbnormalState local_403 = this.GetTargetAbnormal();
        ::UCombatGlobalSettings::Get().AbnormalData.AbnormalStateGlobalConfig.Find(local_403, local_400);
        this.SetAbnormalStateConfig(local_400);
        this.SetAbnormalIcon(this.GetAbnormalStateConfig().AbnormalImage);
        return;
    }
    bool ShouldDisplayInList() const
    {
        return this.GetbShouldShowAbnormal();
    }
    void SyncAbnormalWatchSources()
    {
        int local_16 = 0;
        FECSEntity local_8 = this.GetContext().GetLocalPlayerPawn();
        if (!(local_8.IsValid()) || !(this.GetAbnormalStateConfig().AccumulationAttribute.IsValid()) || !(this.GetAbnormalStateConfig().AccumulationAttributeMax.IsValid()))
        {
            this.ClearAbnormalWatchSources();
            return;
        }
        if (!(local_16) || !(local_16.HasAttribute(this.GetAbnormalStateConfig().AccumulationAttribute)) || !(local_16.HasAttribute(this.GetAbnormalStateConfig().AccumulationAttributeMax)))
        {
            this.ClearAbnormalWatchSources();
            return;
        }
        this.SetbHasValidSource(true);
        this.GetModify_Accumulation().SetAttribute(local_8, this.GetAbnormalStateConfig().AccumulationAttribute, this.GetAbnormalStateConfig().AccumulationAttributeMax);
        if (this.GetAbnormalStateConfig().StateTag.IsValid())
        {
            this.GetModify_ActiveState().SetTag(local_8, this.GetAbnormalStateConfig().StateTag);
        }
        else
        {
            this.GetModify_ActiveState().Reset();
        }
        return;
    }
    void SyncActiveTimeProgress()
    {
        bool local_10 = false;
        int local_16 = 0;
        int local_68 = 0;
        bool local_9 = !(this.GetbHasValidSource()) || !(this.GetContext().GetLocalPlayerPawn().IsValid());
        if (local_9)
        {
            local_9 = true;
        }
        else
        {
            local_10 = !local_10;
            local_9 = local_10;
        }
        if (local_9)
        {
            return;
        }
        if (!(local_16))
        {
            return;
        }
        if (!(this.GetAbnormalStateConfig().AbnormalStateBuffConfig.IsValid()))
        {
            return;
        }
        TDataObjectPtr<FBuffConfig> local_42;
        float32 local_17 = local_42.opArrow().BuffDuration;
        for (auto& local_58 : local_16.GetBuffData())
        {
            if (!(FECSEntity(local_58.BuffEntityId).IsValid()))
            {
                continue;
            }
            if (!(local_68) || !(local_68.GetConfig()))
            {
                continue;
            }
            if ((local_68.GetConfig().GetBuffName() == this.GetAbnormalStateConfig().AbnormalStateBuffConfig.GetBuffName()))
            {
                this.GetModify_ActiveTimeProgress().EndAt(local_68.GetEndTime(), FFPTime(local_17));
                return;
            }
        }
        return;
    }
    void RefreshAbnormalDisplay()
    {
        bool local_2 = false;
        float local_14;
        bool local_3 = false;
        if (this.GetbHasValidSource())
        {
            local_3 = !(local_2 && ::UCombatGlobalSettings::Get().AbnormalData.NotShowAbnormalActiveUI.Contains(EAbnormalState(this.GetTargetAbnormal()))) && (0.0f < this.GetAccumulation().GetMaxValue() || local_2);
        }
        if (local_2)
        {
            this.SetAccumulationColor(this.GetAbnormalStateConfig().TakeEffectColor);
            float32 local_11 = this.GetActiveTimeProgress().GetRemainingRatio();
            this.SetProgressRatio(local_11);
        }
        else
        {
            float32 local_11_2 = this.GetAccumulation().GetMaxValue();
            this.SetAccumulationColor(this.GetAbnormalStateConfig().AccumulationColor);
            if (local_11_2 > 0.0f)
            {
                local_14 = (1.0f - (0.0f / local_11_2));
            }
            else
            {
                local_14 = 0.0;
            }
            this.SetProgressRatio(float32(local_14));
        }
        if (!(this.GetbShouldShowAbnormal()) != !(local_3))
        {
            this.SetbShouldShowAbnormal(local_3);
            this.NotifyOwnerAbnormalDisplayChanged();
        }
        return;
    }
    void ClearAbnormalWatchSources()
    {
        this.SetbHasValidSource(false);
        this.GetModify_Accumulation().Reset();
        this.GetModify_ActiveState().Reset();
        return;
    }
    void NotifyOwnerAbnormalDisplayChanged()
    {
        FVMS_AbnormalInfo& local_2;
        TEUIModelWeakRef<FVMS_AbnormalInfo> local_4 = this.GetAbnormalInfoOwner();
        if (local_2)
        {
            local_2.RequestAbnormalModelsRefresh();
        }
        return;
    }
    float32 GetProgressRatio() const property
    {
        float32 __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    float32 GetModify_ProgressRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetProgressRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ProgressRatio = __Value;
        return;
    }
    EAbnormalState GetTargetAbnormal() const property
    {
        this.TrackPropertyRead(1);
        return this.m_TargetAbnormal;
    }
    void SetTargetAbnormal(const EAbnormalState __Value) property
    {
        if (int(this.m_TargetAbnormal) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TargetAbnormal = __Value;
        return;
    }
    TEUIModelWeakRef<FVMS_AbnormalInfo> GetAbnormalInfoOwner() const property
    {
        this.TrackPropertyRead(2);
        return this.m_AbnormalInfoOwner;
    }
    void SetAbnormalInfoOwner(const TEUIModelWeakRef<FVMS_AbnormalInfo> &inout __Value) property
    {
        TEUIModelWeakRef<FVMS_AbnormalInfo> local_2;
        local_2 = this.m_AbnormalInfoOwner;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_AbnormalInfoOwner = __Value;
        return;
    }
    UTexture2D GetAbnormalIcon() const property
    {
        this.TrackPropertyRead(3);
        return this.m_AbnormalIcon;
    }
    void SetAbnormalIcon(const UTexture2D __Value) property
    {
        if (this.m_AbnormalIcon == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        return;
    }
    const FLinearColor GetAccumulationColor() const property
    {
        const FLinearColor __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FLinearColor GetModify_AccumulationColor() property
    {
        FLinearColor __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetAccumulationColor(const FLinearColor &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_AccumulationColor = __Value;
        return;
    }
    const FAbnormalStateConfig GetAbnormalStateConfig() const property
    {
        const FAbnormalStateConfig __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FAbnormalStateConfig GetModify_AbnormalStateConfig() property
    {
        FAbnormalStateConfig __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetAbnormalStateConfig(const FAbnormalStateConfig &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        return;
    }
    const FMW_AttributeRatio GetAccumulation() const property
    {
        const FMW_AttributeRatio __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    FMW_AttributeRatio GetModify_Accumulation() property
    {
        FMW_AttributeRatio __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetAccumulation(const FMW_AttributeRatio &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_Accumulation = __Value;
        return;
    }
    FMW_GameplayTagHas GetActiveState() const property
    {
        FMW_GameplayTagHas __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    FMW_GameplayTagHas GetModify_ActiveState() property
    {
        FMW_GameplayTagHas __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetActiveState(const FMW_GameplayTagHas &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_ActiveState = __Value;
        return;
    }
    const FMW_TimeProgress GetActiveTimeProgress() const property
    {
        const FMW_TimeProgress __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    FMW_TimeProgress GetModify_ActiveTimeProgress() property
    {
        FMW_TimeProgress __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetActiveTimeProgress(const FMW_TimeProgress &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_ActiveTimeProgress = __Value;
        return;
    }
    bool GetbHasValidSource() const property
    {
        this.TrackPropertyRead(9);
        return this.m_bHasValidSource;
    }
    void SetbHasValidSource(const bool __Value) property
    {
        if (!(this.m_bHasValidSource) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_bHasValidSource = __Value;
        return;
    }
    bool GetbShouldShowAbnormal() const property
    {
        this.TrackPropertyRead(10);
        return this.m_bShouldShowAbnormal;
    }
    void SetbShouldShowAbnormal(const bool __Value) property
    {
        if (!(this.m_bShouldShowAbnormal) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_bShouldShowAbnormal = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_AbnormalIcon
{
    UPROPERTY()
    TEUIModelRef<FVM_AbnormalIcon> Self;

    __GeneratedProperties_FVM_AbnormalIcon()
    {
        return;
    }
}

namespace FVM_AbnormalIcon
{
FVM_AbnormalIcon Create(const UObject ContextObject, const EAbnormalState TargetAbnormal, const TEUIModelWeakRef<FVMS_AbnormalInfo> &inout AbnormalInfoOwner)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    FVM_AbnormalIcon __r; return __r;
}
FVM_AbnormalIcon CreateByManager(const UEUIManagerSubsystem Manager, const EAbnormalState TargetAbnormal, const TEUIModelWeakRef<FVMS_AbnormalInfo> &inout AbnormalInfoOwner)
{
    FVM_AbnormalIcon __r;
    TEUIModelRef<FVM_AbnormalIcon> local_6 = TEUIModelRef<FVM_AbnormalIcon>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_AbnormalIcon::ModelId, 0, TargetAbnormal, AbnormalInfoOwner));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ProgressRatio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AbnormalIcon";
    local_14.TypeName = "UTexture2D";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AccumulationColor";
    local_14.TypeName = "FLinearColor";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AbnormalIcon>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AbnormalIcon;
    FEUIModelWatcherProperty local_19;
    local_19.PropertyName = FName("Accumulation");
    int local_2_2 = FVM_AbnormalIcon::__IndexOf_Accumulation();
    Result.WatcherProperties.Add(local_19);
    local_19.PropertyName = FName("ActiveState");
    int local_2_3 = FVM_AbnormalIcon::__IndexOf_ActiveState();
    Result.WatcherProperties.Add(local_19);
    local_19.PropertyName = FName("ActiveTimeProgress");
    int local_2_4 = FVM_AbnormalIcon::__IndexOf_ActiveTimeProgress();
    Result.WatcherProperties.Add(local_19);
    FEUIModelEffectDefine local_26;
    local_26.FunctionName = "SyncAbnormalWatchSources";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "SyncActiveTimeProgress";
    Result.EffectFunctions.Add(local_26);
    local_26.FunctionName = "RefreshAbnormalDisplay";
    Result.EffectFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AbnormalIcon;
}
float32 __UIGetter_ProgressRatio(const FVM_AbnormalIcon &inout Model)
{
    return Model.GetProgressRatio();
}
UTexture2D __UIGetter_AbnormalIcon(const FVM_AbnormalIcon &inout Model)
{
    return Model.GetAbnormalIcon();
}
FLinearColor __UIGetter_AccumulationColor(const FVM_AbnormalIcon &inout Model)
{
    return Model.GetAccumulationColor();
}
TEUIModelRef<FVM_AbnormalIcon> __UIGetter_Self(const FVM_AbnormalIcon &inout Model)
{
    return TEUIModelRef<FVM_AbnormalIcon>(Model);
}
int __IndexOf_ProgressRatio()
{
    return 0;
}
int __IndexOf_TargetAbnormal()
{
    return 1;
}
int __IndexOf_AbnormalInfoOwner()
{
    return 2;
}
int __IndexOf_AbnormalIcon()
{
    return 3;
}
int __IndexOf_AccumulationColor()
{
    return 4;
}
int __IndexOf_AbnormalStateConfig()
{
    return 5;
}
int __IndexOf_Accumulation()
{
    return 6;
}
int __IndexOf_ActiveState()
{
    return 7;
}
int __IndexOf_ActiveTimeProgress()
{
    return 8;
}
int __IndexOf_bHasValidSource()
{
    return 9;
}
int __IndexOf_bShouldShowAbnormal()
{
    return 10;
}
}
namespace __GeneratedProperties_FVM_AbnormalIcon
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
