
namespace FVM_AvatarUnlockCondition
{
    const int ModelId = 0;
}
namespace FVM_AvatarAllUnlockConditions
{
    const int ModelId = 0;

}
struct FVM_AvatarUnlockCondition : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FServerConditionConfigBase> m_Condition;
    UPROPERTY()
    bool m_bIsUnlock;
    UPROPERTY()
    int m_Progress;
    UPROPERTY()
    int m_TargetValue;

    FVM_AvatarUnlockCondition()
    {
        this.m_bIsUnlock = false;
        this.m_Progress = 0;
        this.m_TargetValue = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_AvatarUnlockCondition' by default constructor.");
        return;
    }
    FVM_AvatarUnlockCondition(const FVM_AvatarUnlockCondition &inout Other)
    {
        this.m_bIsUnlock = false;
        this.m_Progress = 0;
        this.m_TargetValue = 0;
        this.m_Condition = Other.m_Condition;
        this.m_bIsUnlock = Other.m_bIsUnlock;
        this.m_Progress = int(Other.m_Progress);
        this.m_TargetValue = int(Other.m_TargetValue);
        return;
    }
    FVM_AvatarUnlockCondition(const TDataObjectPtr<FServerConditionConfigBase> &inout InCondition)
    {
        this.m_bIsUnlock = false;
        this.m_Progress = 0;
        this.m_TargetValue = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetCondition(InCondition);
        return;
    }
    FVM_AvatarUnlockCondition opAssign(const FVM_AvatarUnlockCondition &inout Other)
    {
        FVM_AvatarUnlockCondition __r;
        this.m_Condition = Other.m_Condition;
        this.m_bIsUnlock = Other.m_bIsUnlock;
        this.m_Progress = int(Other.m_Progress);
        this.m_TargetValue = int(Other.m_TargetValue);
        return __r;
    }
    FText GetConditionText() const
    {
        // body not fully recovered вЂ” stub [no-return]
        FText __r; return __r;
    }
    bool GetIsUnlock() const
    {
        return this.GetbIsUnlock();
    }
    int GetUnlockStateIndex() const
    {
        return this.GetbIsUnlock() ? 1 : 0;
    }
    void PostConstruct()
    {
        int local_54 = 0;
        int local_61 = 0;
        CastTo local_28;
        if (local_28.opCall())
        {
            this.SetTargetValue(local_54);
            TEUIModelRef<FMS_Condition> local_56 = TEUIModelRef<FMS_Condition>(::FMS_Condition::Get(this.GetManager()));
            this.SetbIsUnlock(local_56.opArrow().IsConditionFinish());
            this.SetProgress(local_56.opArrow().GetConditionProgress(local_61));
        }
        return;
    }
    const TDataObjectPtr<FServerConditionConfigBase> GetCondition() const property
    {
        const TDataObjectPtr<FServerConditionConfigBase> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FServerConditionConfigBase> GetModify_Condition() property
    {
        TDataObjectPtr<FServerConditionConfigBase> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetCondition(const TDataObjectPtr<FServerConditionConfigBase> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Condition = __Value;
        return;
    }
    bool GetbIsUnlock() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bIsUnlock;
    }
    void SetbIsUnlock(const bool __Value) property
    {
        if (!(this.m_bIsUnlock) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bIsUnlock = __Value;
        return;
    }
    int GetProgress() const property
    {
        this.TrackPropertyRead(2);
        return this.m_Progress;
    }
    void SetProgress(const int __Value) property
    {
        if (this.m_Progress == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_Progress = __Value;
        return;
    }
    int GetTargetValue() const property
    {
        this.TrackPropertyRead(3);
        return this.m_TargetValue;
    }
    void SetTargetValue(const int __Value) property
    {
        if (this.m_TargetValue == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_TargetValue = __Value;
        return;
    }
}

struct FVM_AvatarAllUnlockConditions : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Avatar> m_Avatar;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_AvatarUnlockCondition>> m_UnlockConditions;

    FVM_AvatarAllUnlockConditions()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_AvatarAllUnlockConditions' by default constructor.");
        return;
    }
    FVM_AvatarAllUnlockConditions(const FVM_AvatarAllUnlockConditions &inout Other)
    {
        this.m_Avatar = Other.m_Avatar;
        this.m_UnlockConditions = Other.m_UnlockConditions;
        return;
    }
    FVM_AvatarAllUnlockConditions(const TEUIModelRef<FM_Avatar> &inout InAvatar)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetAvatar(InAvatar);
        return;
    }
    FVM_AvatarAllUnlockConditions& opAssign(const FVM_AvatarAllUnlockConditions &inout Other)
    {
        this.m_Avatar = Other.m_Avatar;
        return Other.m_UnlockConditions;
    }
    void PostConstruct()
    {
        this.GetModify_UnlockConditions().Empty(0);
        TEUIModelRef<FM_Avatar> local_4 = this.GetAvatar();
        for (auto& local_20 : GetUnlockCondition())
        {
            TEUIModelRef<FVM_AvatarUnlockCondition> local_22 = TEUIModelRef<FVM_AvatarUnlockCondition>(::FVM_AvatarUnlockCondition::Create(this.GetManager(), local_20));
            this.GetModify_UnlockConditions().Add(local_22);
        }
        return;
    }
    TEUIModelRef<FM_Avatar> GetAvatar() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Avatar;
    }
    void SetAvatar(const TEUIModelRef<FM_Avatar> &inout __Value) property
    {
        TEUIModelRef<FM_Avatar> local_2;
        local_2 = this.m_Avatar;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Avatar = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_AvatarUnlockCondition>> GetUnlockConditions() const property
    {
        const TArray<TEUIModelRef<FVM_AvatarUnlockCondition>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TEUIModelRef<FVM_AvatarUnlockCondition>> GetModify_UnlockConditions() property
    {
        TArray<TEUIModelRef<FVM_AvatarUnlockCondition>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetUnlockConditions(const TArray<TEUIModelRef<FVM_AvatarUnlockCondition>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_UnlockConditions = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_AvatarUnlockCondition
{
    UPROPERTY()
    FText ConditionText;
    UPROPERTY()
    bool IsUnlock;
    UPROPERTY()
    int UnlockStateIndex;
    UPROPERTY()
    TEUIModelRef<FVM_AvatarUnlockCondition> Self;


}

struct __GeneratedProperties_FVM_AvatarAllUnlockConditions
{
    UPROPERTY()
    TEUIModelRef<FVM_AvatarAllUnlockConditions> Self;

    __GeneratedProperties_FVM_AvatarAllUnlockConditions()
    {
        return;
    }
}

namespace FVM_AvatarUnlockCondition
{
FVM_AvatarUnlockCondition& Create(const UObject ContextObject, const TDataObjectPtr<FServerConditionConfigBase> &inout Condition)
{
    return FVM_AvatarUnlockCondition::CreateByManager(EUIInternal::GetContextManager(ContextObject), Condition);
}
FVM_AvatarUnlockCondition CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FServerConditionConfigBase> &inout Condition)
{
    FVM_AvatarUnlockCondition __r;
    TEUIModelRef<FVM_AvatarUnlockCondition> local_6 = TEUIModelRef<FVM_AvatarUnlockCondition>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_AvatarUnlockCondition::ModelId, 0, Condition));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ConditionText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsUnlock";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "UnlockStateIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarUnlockCondition>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AvatarUnlockCondition;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AvatarUnlockCondition;
}
FText __UIGetter_ConditionText(const FVM_AvatarUnlockCondition &inout Model)
{
    return Model.GetConditionText();
}
bool __UIGetter_IsUnlock(const FVM_AvatarUnlockCondition &inout Model)
{
    return Model.GetIsUnlock();
}
int __UIGetter_UnlockStateIndex(const FVM_AvatarUnlockCondition &inout Model)
{
    return Model.GetUnlockStateIndex();
}
TEUIModelRef<FVM_AvatarUnlockCondition> __UIGetter_Self(const FVM_AvatarUnlockCondition &inout Model)
{
    return TEUIModelRef<FVM_AvatarUnlockCondition>(Model);
}
int __IndexOf_Condition()
{
    return 0;
}
int __IndexOf_bIsUnlock()
{
    return 1;
}
int __IndexOf_Progress()
{
    return 2;
}
int __IndexOf_TargetValue()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_AvatarUnlockCondition
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_AvatarAllUnlockConditions
{
FVM_AvatarAllUnlockConditions& Create(const UObject ContextObject, const TEUIModelRef<FM_Avatar> &inout Avatar)
{
    return FVM_AvatarAllUnlockConditions::CreateByManager(EUIInternal::GetContextManager(ContextObject), Avatar);
}
FVM_AvatarAllUnlockConditions CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Avatar> &inout Avatar)
{
    FVM_AvatarAllUnlockConditions __r;
    TEUIModelRef<FVM_AvatarAllUnlockConditions> local_6 = TEUIModelRef<FVM_AvatarAllUnlockConditions>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_AvatarAllUnlockConditions::ModelId, 0, Avatar));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "UnlockConditions";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_AvatarUnlockCondition>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_AvatarAllUnlockConditions>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_AvatarAllUnlockConditions;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_AvatarAllUnlockConditions;
}
TArray<TEUIModelRef<FVM_AvatarUnlockCondition>> __UIGetter_UnlockConditions(const FVM_AvatarAllUnlockConditions &inout Model)
{
    return Model.GetUnlockConditions();
}
TEUIModelRef<FVM_AvatarAllUnlockConditions> __UIGetter_Self(const FVM_AvatarAllUnlockConditions &inout Model)
{
    return TEUIModelRef<FVM_AvatarAllUnlockConditions>(Model);
}
int __IndexOf_Avatar()
{
    return 0;
}
int __IndexOf_UnlockConditions()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_AvatarAllUnlockConditions
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
