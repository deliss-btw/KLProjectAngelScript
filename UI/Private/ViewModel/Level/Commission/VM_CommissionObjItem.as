
enum ECommissionObjAnimState
{
    Normal,
    Appearing,
    Disappearing,
}

namespace FVM_CommissionObjItemModel
{
    const int ModelId = 0;

}
struct FCommissionObjItemModelData
{
    UPROPERTY()
    TDataObjectPtr<FObjectiveSingleConfig> SingleObjectiveConfig;
    UPROPERTY()
    EObjectiveItemUIState UIState;
    UPROPERTY()
    FCommissionTargetProgress Progress;
    UPROPERTY()
    bool SubObj;
    UPROPERTY()
    FText DefaultText;


}

struct FVM_CommissionObjItemModel : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FObjectiveSingleConfig> m_SingleObjectiveConfig;
    UPROPERTY()
    EObjectiveItemUIState m_UIState;
    UPROPERTY()
    FCommissionTargetProgress m_Progress;
    UPROPERTY()
    bool m_SubObj;
    UPROPERTY()
    FText m_DefaultText;
    UPROPERTY()
    EObjectiveProgressUIType m_UIType;
    UPROPERTY()
    ECommissionObjAnimState m_AnimState;
    UPROPERTY()
    TArray<FEUIModelContainer> m_SegmentProgressModels;

    FVM_CommissionObjItemModel()
    {
        this.m_UIState = EObjectiveItemUIState(0);
        this.m_SubObj = false;
        this.m_UIType = EObjectiveProgressUIType(0);
        this.m_AnimState = ECommissionObjAnimState(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommissionObjItemModel' by default constructor.");
        return;
    }
    FVM_CommissionObjItemModel(const FVM_CommissionObjItemModel &inout Other)
    {
        this.m_UIState = EObjectiveItemUIState(0);
        this.m_SubObj = false;
        this.m_UIType = EObjectiveProgressUIType(0);
        this.m_AnimState = ECommissionObjAnimState(0);
        this.m_SingleObjectiveConfig = Other.m_SingleObjectiveConfig;
        this.m_UIState = Other.m_UIState;
        this.m_Progress = Other.m_Progress;
        this.m_SubObj = Other.m_SubObj;
        this.m_DefaultText = Other.m_DefaultText;
        this.m_UIType = Other.m_UIType;
        this.m_AnimState = Other.m_AnimState;
        this.m_SegmentProgressModels = Other.m_SegmentProgressModels;
        return;
    }
    FVM_CommissionObjItemModel(const TDataObjectPtr<FObjectiveSingleConfig> &inout InSingleObjectiveConfig, const EObjectiveItemUIState InUIState, const FCommissionTargetProgress &inout InProgress, const bool InSubObj, const FText &inout InDefaultText)
    {
        this.m_UIState = EObjectiveItemUIState(0);
        this.m_SubObj = false;
        this.m_UIType = EObjectiveProgressUIType(0);
        this.m_AnimState = ECommissionObjAnimState(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetSingleObjectiveConfig(InSingleObjectiveConfig);
        this.SetUIState(EObjectiveItemUIState(InUIState));
        this.SetProgress(InProgress);
        this.SetSubObj(InSubObj);
        this.SetDefaultText(InDefaultText);
        return;
    }
    FVM_CommissionObjItemModel& opAssign(const FVM_CommissionObjItemModel &inout Other)
    {
        this.m_SingleObjectiveConfig = Other.m_SingleObjectiveConfig;
        this.m_UIState = Other.m_UIState;
        this.m_Progress = Other.m_Progress;
        this.m_SubObj = Other.m_SubObj;
        this.m_DefaultText = Other.m_DefaultText;
        this.m_UIType = Other.m_UIType;
        this.m_AnimState = Other.m_AnimState;
        return Other.m_SegmentProgressModels;
    }
    void PostConstruct()
    {
        int local_4;
        if (this.GetSingleObjectiveConfig())
        {
            if (int(this.GetUIType()) == 2)
            {
                int local_5;
                int local_3;
                local_5 = this.GetProgress().GetSuccessProgressValue();
                local_3 = ::ConditionUtils::GetTargetValue(GetFinishCondition());
                if ((local_3 > 20 || (local_3 < 0)))
                {
                    ELog local_12;
                    FString::Format(local_3, "CommissionObjItem: SegmentProgress TargetValue out of range: {0}, ConfigId: {1}", local_12);
                    local_3 = FMath::Clamp(local_3, 0, 20);
                }
                if (this.IsReverseProgress())
                {
                    local_4 = local_3 - local_5;
                }
                else
                {
                    local_4 = local_5;
                }
                this.GetModify_SegmentProgressModels().Empty(0);
                int local_16 = 0;
                for (; local_16 < local_3; )
                {
                    FSegmentBarItemData local_22;
                    local_22.IsFinish = (local_4 > local_16);
                    FEUIModelContainer::MakeCached local_36;
                    this.GetModify_SegmentProgressModels().Add(local_36.opImplConv());
                    ++local_16;
                }
            }
        }
        return;
    }
    void OnProgressChanged()
    {
        int local_6;
        int local_8;
        if (!(this.GetSingleObjectiveConfig()) || (int(this.GetUIType()) != 2))
        {
            return;
        }
        local_6 = this.GetProgress().GetSuccessProgressValue();
        if (this.IsReverseProgress())
        {
            local_8 = this.GetModify_SegmentProgressModels().Num() - local_6;
        }
        else
        {
            local_8 = local_6;
        }
        int local_9 = 0;
        for (; local_9 < this.GetModify_SegmentProgressModels().Num(); )
        {
            FEUIModelContainer::RequireModel(this.GetModify_SegmentProgressModels()[local_9]).opCall().SetIsFinish((local_8 > local_9));
            ++local_9;
        }
        return;
    }
    int GetObjectProgressUIType() const
    {
        int local_2 = 0;
        int local_4;
        if (this.GetSingleObjectiveConfig().IsSet())
        {
            local_4 = local_2;
        }
        else
        {
            local_4 = 0;
        }
        return local_4;
    }
    bool IsMonsterHPBar() const
    {
        if (!(this.GetSingleObjectiveConfig().IsSet()))
        {
            return false;
        }
        if (0 != 2)
        {
            return false;
        }
        Get local_8;
        const FCS_CommissionInfo& local_10 = local_8.opCall();
        if (local_10)
        {
            return local_10.bMonsterHPBar;
        }
        return false;
    }
    bool IsReverseProgress() const
    {
        int local_2 = 0;
        if (!(this.GetSingleObjectiveConfig().IsSet()))
        {
            return false;
        }
        return (local_2 == 1);
    }
    FText GetObjectProgressNumber() const
    {
        int local_19 = 0;
        ELog local_92;
        int local_126;
        if (this.IsMonsterHPBar())
        {
            return FText::Format(INVTEXT("{0}%"), FText::AsNumber(FMath::Clamp(this.GetProgress().GetSuccessProgressValue(), 0, 100), FNumberFormattingOptions::DefaultNoGrouping()));
        }
        FText local_18;
        if (this.GetSingleObjectiveConfig().IsSet())
        {
            if (local_19 == 1)
            {
                TArray<FInstancedStruct> local_22;
                if (!(local_22.IsEmpty()))
                {
                    FInstancedStruct local_26 = FInstancedStruct(local_22[0]);
                    FECSEntity local_30 = ::FASCommonUtils::GetLocalUniquePlayerEntity();
                    FECSEntity local_34 = ::FASCommonUtils::GetLocalPlayerPawnEntity();
                    float local_40 = 0.0;
                    bool local_1 = ::ObjectiveUtils::TryCalculateGuideDistance((TDataObjectPtr::CastTo<FObjectiveSingleConfig, FObjectiveConfig>(this.GetSingleObjectiveConfig())).opCall(), local_30, local_40);
                    if (local_1)
                    {
                        FInstancedStruct::GetPtr local_76;
                        if (local_76.opCall())
                        {
                            if (!(IsPoint()) && ::FASCommonUtils::GetEntityLocation(local_34).IsInRegion())
                            {
                                return FText(NSLOCTEXT("CommissionObjItem", "GuideObjHasInRegion", "е·Іиї›е…Ґд»»еЉЎеЊєеџџ"));
                            }
                        }
                        local_18 = FText::AsNumber(FMath::FloorToInt(local_40 / 100.0), FNumberFormattingOptions::DefaultNoGrouping());
                        return FText::Format(INVTEXT("{0}m"), local_18);
                    }
                    FString::Format("CommissionObjItem: TryCalculateGuideDistance failed, ObjectiveId:{0}", local_92);
                }
                else
                {
                    FString::Format("CommissionObjItem: ProgressTextType is Distance but GuideDataList is empty, ObjectiveId:{0}", local_92);
                }
                return local_18;
            }
            int local_2 = ::ConditionUtils::GetTargetValue(GetFinishCondition());
            int local_3 = ::ConditionUtils::GetTargetValue(GetFailCondition());
            TMap<FString, FFormatArgumentValue> local_114;
            local_114.Add("ProgressValue", FFormatArgumentValue(this.GetProgress().GetSuccessProgressValue()));
            local_114.Add("TargetValue", FFormatArgumentValue(local_2));
            local_114.Add("RemainValue", FFormatArgumentValue(FMath::Max(0, (local_2 - this.GetProgress().GetSuccessProgressValue()))));
            local_114.Add("FailProgressValue", FFormatArgumentValue(this.GetProgress().GetFailedProgressValue()));
            local_114.Add("FailTargetValue", FFormatArgumentValue(local_3));
            local_114.Add("FailRemainValue", FFormatArgumentValue(FMath::Max(0, local_3 - this.GetProgress().GetFailedProgressValue())));
            if (local_19 == 2)
            {
                if (local_2 > 0)
                {
                    local_126 = FMath::Clamp(FMath::FloorToInt(((this.GetProgress().GetSuccessProgressValue() * 100.0f) / local_2)), 0, 100);
                }
                else
                {
                    local_126 = 0;
                }
                if (this.IsReverseProgress())
                {
                    local_126 = 100 - local_126;
                }
                return FText::Format(INVTEXT("{0}%"), FText::AsNumber(local_126, FNumberFormattingOptions::DefaultNoGrouping()));
            }
            FText local_130;
            if (local_19 == 3)
            {
                local_130 = this.IsReverseProgress() ? INVTEXT("({RemainValue}/{TargetValue})") : INVTEXT("({ProgressValue}/{TargetValue})");
            }
            else
            {
                if (local_19 == 0)
                {
                }
            }
            if (local_130.IsEmpty())
            {
                return FText();
            }
            return FText::Format(local_130, local_114);
        }
        return FText();
    }
    FText GetObjectProgressDesc() const
    {
        FText local_42;
        if (this.GetSingleObjectiveConfig().IsSet())
        {
            int local_3 = ::ConditionUtils::GetTargetValue(GetFinishCondition());
            int local_2 = ::ConditionUtils::GetTargetValue(GetFailCondition());
            TMap<FString, FFormatArgumentValue> local_24;
            local_24.Add("ProgressValue", FFormatArgumentValue(this.GetProgress().GetSuccessProgressValue()));
            local_24.Add("TargetValue", FFormatArgumentValue(local_3));
            local_24.Add("RemainValue", FFormatArgumentValue(FMath::Max(0, (local_3 - this.GetProgress().GetSuccessProgressValue()))));
            local_24.Add("FailProgressValue", FFormatArgumentValue(this.GetProgress().GetFailedProgressValue()));
            local_24.Add("FailTargetValue", FFormatArgumentValue(local_2));
            local_24.Add("FailRemainValue", FFormatArgumentValue(FMath::Max(0, local_2 - this.GetProgress().GetFailedProgressValue())));
            if (this.GetSubObj())
            {
                local_42 = FText::Format(NSLOCTEXT("CommissionObjItem", "SubObjPreText", "[еЏЇйЂ‰]{0}"), local_42);
            }
            return local_42;
        }
        return this.GetDefaultText();
    }
    bool GetIsFinish() const
    {
        return (int(this.GetUIState()) == 1);
    }
    bool GetFinishOrFailed() const
    {
        return (int(this.GetUIState()) != 0);
    }
    bool GetIsPending() const
    {
        return (int(this.GetUIState()) == 0);
    }
    bool GetIsFailed() const
    {
        return (int(this.GetUIState()) == 2);
    }
    float32 GetTextTransparency() const
    {
        return this.GetIsFinish() ? 0.65f : 1.0f;
    }
    int GetIsSubTagSwitchIndex() const
    {
        return this.GetSubObj() ? 1 : 0;
    }
    float32 GetProgressBarPercent() const
    {
        int local_7;
        if (this.IsMonsterHPBar())
        {
            return FMath::Clamp((this.GetProgress().GetSuccessProgressValue() / 100.0f), 0.0f, 1.0f);
        }
        local_7 = this.GetProgress().GetSuccessProgressValue();
        int local_8 = 0;
        if (this.GetSingleObjectiveConfig())
        {
            local_8 = ::ConditionUtils::GetTargetValue(GetFinishCondition());
        }
        if (local_8 == 0)
        {
            return 0.0f;
        }
        float32 local_4 = local_8;
        local_4 = FMath::Clamp(local_7 / local_4, 0.0f, 1.0f);
        if (this.IsReverseProgress())
        {
            local_4 = 1.0f - local_4;
        }
        return local_4;
    }
    const TDataObjectPtr<FObjectiveSingleConfig> GetSingleObjectiveConfig() const property
    {
        const TDataObjectPtr<FObjectiveSingleConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FObjectiveSingleConfig> GetModify_SingleObjectiveConfig() property
    {
        TDataObjectPtr<FObjectiveSingleConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetSingleObjectiveConfig(const TDataObjectPtr<FObjectiveSingleConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_SingleObjectiveConfig = __Value;
        return;
    }
    EObjectiveItemUIState GetUIState() const property
    {
        this.TrackPropertyRead(1);
        return this.m_UIState;
    }
    void SetUIState(const EObjectiveItemUIState __Value) property
    {
        if (int(this.m_UIState) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_UIState = __Value;
        return;
    }
    FCommissionTargetProgress GetProgress() const property
    {
        FCommissionTargetProgress __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FCommissionTargetProgress GetModify_Progress() property
    {
        FCommissionTargetProgress __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetProgress(const FCommissionTargetProgress &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_Progress = __Value;
        return;
    }
    bool GetSubObj() const property
    {
        this.TrackPropertyRead(3);
        return this.m_SubObj;
    }
    void SetSubObj(const bool __Value) property
    {
        if (!(this.m_SubObj) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_SubObj = __Value;
        return;
    }
    const FText GetDefaultText() const property
    {
        const FText __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FText GetModify_DefaultText() property
    {
        FText __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetDefaultText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_DefaultText = __Value;
        return;
    }
    EObjectiveProgressUIType GetUIType() const property
    {
        this.TrackPropertyRead(5);
        return this.m_UIType;
    }
    void SetUIType(const EObjectiveProgressUIType __Value) property
    {
        if (int(this.m_UIType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_UIType = __Value;
        return;
    }
    ECommissionObjAnimState GetAnimState() const property
    {
        this.TrackPropertyRead(6);
        return this.m_AnimState;
    }
    void SetAnimState(const ECommissionObjAnimState __Value) property
    {
        if (int(this.m_AnimState) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_AnimState = __Value;
        return;
    }
    const TArray<FEUIModelContainer> GetSegmentProgressModels() const property
    {
        const TArray<FEUIModelContainer> __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    TArray<FEUIModelContainer> GetModify_SegmentProgressModels() property
    {
        TArray<FEUIModelContainer> __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetSegmentProgressModels(const TArray<FEUIModelContainer> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_SegmentProgressModels = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommissionObjItemModel
{
    UPROPERTY()
    int ObjectProgressUIType;
    UPROPERTY()
    FText ObjectProgressNumber;
    UPROPERTY()
    FText ObjectProgressDesc;
    UPROPERTY()
    bool IsFinish;
    UPROPERTY()
    bool FinishOrFailed;
    UPROPERTY()
    bool IsPending;
    UPROPERTY()
    bool IsFailed;
    UPROPERTY()
    float32 TextTransparency;
    UPROPERTY()
    int IsSubTagSwitchIndex;
    UPROPERTY()
    float32 ProgressBarPercent;
    UPROPERTY()
    TEUIModelRef<FVM_CommissionObjItemModel> Self;


}

namespace FVM_CommissionObjItemModel
{
FVM_CommissionObjItemModel Create(const UObject ContextObject, const TDataObjectPtr<FObjectiveSingleConfig> &inout SingleObjectiveConfig, const EObjectiveItemUIState UIState, const FCommissionTargetProgress &inout Progress, const bool SubObj, const FText &inout DefaultText)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
    FVM_CommissionObjItemModel __r; return __r;
}
FVM_CommissionObjItemModel CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FObjectiveSingleConfig> &inout SingleObjectiveConfig, const EObjectiveItemUIState UIState, const FCommissionTargetProgress &inout Progress, const bool SubObj, const FText &inout DefaultText)
{
    FVM_CommissionObjItemModel __r;
    TEUIModelRef<FVM_CommissionObjItemModel> local_6 = TEUIModelRef<FVM_CommissionObjItemModel>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommissionObjItemModel::ModelId, 0, SingleObjectiveConfig, UIState, Progress, SubObj, DefaultText));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "AnimState";
    local_14.TypeName = "ECommissionObjAnimState";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SegmentProgressModels";
    local_14.TypeName = "TArray<FEUIModelContainer>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ObjectProgressUIType";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ObjectProgressNumber";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ObjectProgressDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsFinish";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "FinishOrFailed";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsPending";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsFailed";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TextTransparency";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsSubTagSwitchIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ProgressBarPercent";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommissionObjItemModel>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommissionObjItemModel;
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__OnProgressChanged";
    local_24.DirtyFlags.Set(FVM_CommissionObjItemModel::__IndexOf_Progress());
    Result.DirtyFunctions.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommissionObjItemModel;
}
void __OnProgressChanged(FVM_CommissionObjItemModel &inout Model)
{
    Model.OnProgressChanged();
    return;
}
ECommissionObjAnimState __UIGetter_AnimState(const FVM_CommissionObjItemModel &inout Model)
{
    return Model.GetAnimState();
}
TArray<FEUIModelContainer> __UIGetter_SegmentProgressModels(const FVM_CommissionObjItemModel &inout Model)
{
    return Model.GetSegmentProgressModels();
}
int __UIGetter_ObjectProgressUIType(const FVM_CommissionObjItemModel &inout Model)
{
    return Model.GetObjectProgressUIType();
}
FText __UIGetter_ObjectProgressNumber(const FVM_CommissionObjItemModel &inout Model)
{
    return Model.GetObjectProgressNumber();
}
FText __UIGetter_ObjectProgressDesc(const FVM_CommissionObjItemModel &inout Model)
{
    return Model.GetObjectProgressDesc();
}
bool __UIGetter_IsFinish(const FVM_CommissionObjItemModel &inout Model)
{
    return Model.GetIsFinish();
}
bool __UIGetter_FinishOrFailed(const FVM_CommissionObjItemModel &inout Model)
{
    return Model.GetFinishOrFailed();
}
bool __UIGetter_IsPending(const FVM_CommissionObjItemModel &inout Model)
{
    return Model.GetIsPending();
}
bool __UIGetter_IsFailed(const FVM_CommissionObjItemModel &inout Model)
{
    return Model.GetIsFailed();
}
float32 __UIGetter_TextTransparency(const FVM_CommissionObjItemModel &inout Model)
{
    return Model.GetTextTransparency();
}
int __UIGetter_IsSubTagSwitchIndex(const FVM_CommissionObjItemModel &inout Model)
{
    return Model.GetIsSubTagSwitchIndex();
}
float32 __UIGetter_ProgressBarPercent(const FVM_CommissionObjItemModel &inout Model)
{
    return Model.GetProgressBarPercent();
}
TEUIModelRef<FVM_CommissionObjItemModel> __UIGetter_Self(const FVM_CommissionObjItemModel &inout Model)
{
    return TEUIModelRef<FVM_CommissionObjItemModel>(Model);
}
int __IndexOf_SingleObjectiveConfig()
{
    return 0;
}
int __IndexOf_UIState()
{
    return 1;
}
int __IndexOf_Progress()
{
    return 2;
}
int __IndexOf_SubObj()
{
    return 3;
}
int __IndexOf_DefaultText()
{
    return 4;
}
int __IndexOf_UIType()
{
    return 5;
}
int __IndexOf_AnimState()
{
    return 6;
}
int __IndexOf_SegmentProgressModels()
{
    return 7;
}
}
namespace __GeneratedProperties_FVM_CommissionObjItemModel
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
