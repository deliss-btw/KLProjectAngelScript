
namespace FVM_TrainingItem
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnTrainingClick = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnTrainingHover = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnTrainingUnhover = FEUIModelCallbackSignature();

}
struct FVM_TrainingItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FTrainingInfoConfig> m_TrainingInfo;
    UPROPERTY()
    FText m_TrainingName;
    UPROPERTY()
    bool m_IsUnLock;
    UPROPERTY()
    int m_RewardState;
    UPROPERTY()
    bool m_bIsFinished;
    UPROPERTY()
    int m_HoverState;

    FVM_TrainingItem()
    {
        this.m_IsUnLock = false;
        this.m_RewardState = 0;
        this.m_bIsFinished = false;
        this.m_HoverState = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TrainingItem' by default constructor.");
        return;
    }
    FVM_TrainingItem(const FVM_TrainingItem &inout Other)
    {
        this.m_IsUnLock = false;
        this.m_RewardState = 0;
        this.m_bIsFinished = false;
        this.m_HoverState = 0;
        this.m_TrainingInfo = Other.m_TrainingInfo;
        this.m_TrainingName = Other.m_TrainingName;
        this.m_IsUnLock = Other.m_IsUnLock;
        this.m_RewardState = int(Other.m_RewardState);
        this.m_bIsFinished = Other.m_bIsFinished;
        this.m_HoverState = int(Other.m_HoverState);
        return;
    }
    FVM_TrainingItem(const TDataObjectPtr<FTrainingInfoConfig> &inout InTrainingInfo)
    {
        this.m_IsUnLock = false;
        this.m_RewardState = 0;
        this.m_bIsFinished = false;
        this.m_HoverState = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTrainingInfo(InTrainingInfo);
        return;
    }
    FVM_TrainingItem opAssign(const FVM_TrainingItem &inout Other)
    {
        FVM_TrainingItem __r;
        this.m_TrainingInfo = Other.m_TrainingInfo;
        this.m_TrainingName = Other.m_TrainingName;
        this.m_IsUnLock = Other.m_IsUnLock;
        this.m_RewardState = int(Other.m_RewardState);
        this.m_bIsFinished = Other.m_bIsFinished;
        this.m_HoverState = int(Other.m_HoverState);
        return __r;
    }
    void PostConstruct()
    {
        int local_8 = 0;
        if (!(this.GetTrainingInfo().IsSet()))
        {
            return;
        }
        this.SetHoverState(0);
        FMS_TrainingModel& local_6 = ::FMS_TrainingModel::Get(this.GetManager());
        int local_7 = local_8;
        this.SetIsUnLock(local_6.IsTrainingUnlock(this.GetTrainingInfo()));
        this.SetbIsFinished(local_6.IsTrainingFinished(local_7));
        int local_2 = this.GetbIsFinished() ? 1 : 0;
        this.SetRewardState(local_2);
        return;
    }
    void OnTrainingClick()
    {
        int local_11 = 0;
        if (!(this.GetTrainingInfo().IsSet()))
        {
            return;
        }
        FEUIModelRef local_8 = FEUIModelRef(this);
        FEUIMessageBus::Publish(EUIMessageBus);
        FMsg_TrainingItemClicked local_10;
        local_10.TrainingId = local_11;
        return;
    }
    void OnTrainingHover()
    {
        this.SetHoverState(1);
        return;
    }
    void OnTrainingUnhover()
    {
        this.SetHoverState(0);
        return;
    }
    const TDataObjectPtr<FTrainingInfoConfig> GetTrainingInfo() const property
    {
        const TDataObjectPtr<FTrainingInfoConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FTrainingInfoConfig> GetModify_TrainingInfo() property
    {
        TDataObjectPtr<FTrainingInfoConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTrainingInfo(const TDataObjectPtr<FTrainingInfoConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TrainingInfo = __Value;
        return;
    }
    const FText GetTrainingName() const property
    {
        const FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_TrainingName() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetTrainingName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TrainingName = __Value;
        return;
    }
    bool GetIsUnLock() const property
    {
        this.TrackPropertyRead(2);
        return this.m_IsUnLock;
    }
    void SetIsUnLock(const bool __Value) property
    {
        if (!(this.m_IsUnLock) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_IsUnLock = __Value;
        return;
    }
    int GetRewardState() const property
    {
        this.TrackPropertyRead(3);
        return this.m_RewardState;
    }
    void SetRewardState(const int __Value) property
    {
        if (this.m_RewardState == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_RewardState = __Value;
        return;
    }
    bool GetbIsFinished() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bIsFinished;
    }
    void SetbIsFinished(const bool __Value) property
    {
        if (!(this.m_bIsFinished) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bIsFinished = __Value;
        return;
    }
    int GetHoverState() const property
    {
        this.TrackPropertyRead(5);
        return this.m_HoverState;
    }
    void SetHoverState(const int __Value) property
    {
        if (this.m_HoverState == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_HoverState = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TrainingItem
{
    UPROPERTY()
    TEUIModelRef<FVM_TrainingItem> Self;

    __GeneratedProperties_FVM_TrainingItem()
    {
        return;
    }
}

namespace FVM_TrainingItem
{
FVM_TrainingItem& Create(const UObject ContextObject, const TDataObjectPtr<FTrainingInfoConfig> &inout TrainingInfo)
{
    return FVM_TrainingItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), TrainingInfo);
}
FVM_TrainingItem CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FTrainingInfoConfig> &inout TrainingInfo)
{
    FVM_TrainingItem __r;
    TEUIModelRef<FVM_TrainingItem> local_6 = TEUIModelRef<FVM_TrainingItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TrainingItem::ModelId, 0, TrainingInfo));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TrainingName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsUnLock";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RewardState";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsFinished";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HoverState";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TrainingItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TrainingItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TrainingItem;
}
FText __UIGetter_TrainingName(const FVM_TrainingItem &inout Model)
{
    return Model.GetTrainingName();
}
bool __UIGetter_IsUnLock(const FVM_TrainingItem &inout Model)
{
    return Model.GetIsUnLock();
}
int __UIGetter_RewardState(const FVM_TrainingItem &inout Model)
{
    return Model.GetRewardState();
}
bool __UIGetter_bIsFinished(const FVM_TrainingItem &inout Model)
{
    return Model.GetbIsFinished();
}
int __UIGetter_HoverState(const FVM_TrainingItem &inout Model)
{
    return Model.GetHoverState();
}
TEUIModelRef<FVM_TrainingItem> __UIGetter_Self(const FVM_TrainingItem &inout Model)
{
    return TEUIModelRef<FVM_TrainingItem>(Model);
}
int __IndexOf_TrainingInfo()
{
    return 0;
}
int __IndexOf_TrainingName()
{
    return 1;
}
int __IndexOf_IsUnLock()
{
    return 2;
}
int __IndexOf_RewardState()
{
    return 3;
}
int __IndexOf_bIsFinished()
{
    return 4;
}
int __IndexOf_HoverState()
{
    return 5;
}
}
namespace __GeneratedProperties_FVM_TrainingItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
