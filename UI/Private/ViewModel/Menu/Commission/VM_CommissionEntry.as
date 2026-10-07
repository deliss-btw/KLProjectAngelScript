
namespace FVM_CommissionEntry
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature GotoCommissionPanel = FEUIModelCallbackSignature();

}
struct FVM_CommissionEntry : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    ECommissionType m_CommissionType;
    UPROPERTY()
    FMW_CounterDown m_RefreshCounterDown;

    FVM_CommissionEntry()
    {
        this.m_CommissionType = ECommissionType(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_CommissionEntry(const FVM_CommissionEntry &inout Other)
    {
        this.m_CommissionType = ECommissionType(0);
        this.m_CommissionType = Other.m_CommissionType;
        this.m_RefreshCounterDown = Other.m_RefreshCounterDown;
        return;
    }
    FVM_CommissionEntry& opAssign(const FVM_CommissionEntry &inout Other)
    {
        this.m_CommissionType = Other.m_CommissionType;
        return Other.m_RefreshCounterDown;
    }
    void LoadConfig(const FConfigVM_CommissionEntry &inout InConfig)
    {
        this.SetCommissionType(InConfig.CommissionType);
        return;
    }
    void GotoCommissionPanel()
    {
        int local_2 = int(this.GetCommissionType());
        FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_CommissionPanel, FEUIModelRef());
        return;
    }
    void RefreshCounterDownState()
    {
        this.RefreshCounterDownFromSource();
        return;
    }
    void OnCommissionRefreshTimesUpdated(const FMsg_CommissionRefreshTimesUpdated &inout Msg)
    {
        this.RefreshCounterDownFromSource();
        return;
    }
    void RefreshCounterDownFromSource()
    {
        if (!(this.HasRefreshTime()))
        {
            return;
        }
        int local_5 = int(this.GetCommissionType());
        this.GetModify_RefreshCounterDown().SetRemainedTimeWithPrecision(FFPTime(::FMS_CommissionData::Get(this.GetContext().Manager).GetRefreshRemainingTime().GetTotalSeconds()), EMWCounterDownPrecision(1));
        return;
    }
    FTimespan GetRefreshRemainingTime() const
    {
        return FTimespan::FromSeconds(this.GetRefreshCounterDown().GetRemainedTime().ToSeconds());
    }
    bool HasRefreshTime() const
    {
        if (!(::CommissionUtils::IsCommissionTypeUnlocked(ECommissionType(this.GetCommissionType()), false)))
        {
            return false;
        }
        return (int(this.GetCommissionType())) == 2 || (int(this.GetCommissionType()) == 4);
    }
    bool GetIsUnlock() const
    {
        return ::CommissionUtils::IsCommissionTypeUnlocked(this.GetCommissionType(), false);
    }
    bool GetIsLock() const
    {
        return !(::CommissionUtils::IsCommissionTypeUnlocked(this.GetCommissionType(), false));
    }
    ECommissionType GetCommissionType() const property
    {
        this.TrackPropertyRead(0);
        return this.m_CommissionType;
    }
    void SetCommissionType(const ECommissionType __Value) property
    {
        if (int(this.m_CommissionType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CommissionType = __Value;
        return;
    }
    const FMW_CounterDown GetRefreshCounterDown() const property
    {
        const FMW_CounterDown __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FMW_CounterDown GetModify_RefreshCounterDown() property
    {
        FMW_CounterDown __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetRefreshCounterDown(const FMW_CounterDown &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_RefreshCounterDown = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommissionEntry
{
    UPROPERTY()
    FTimespan RefreshRemainingTime;
    UPROPERTY()
    bool HasRefreshTime;
    UPROPERTY()
    bool IsUnlock;
    UPROPERTY()
    bool IsLock;
    UPROPERTY()
    TEUIModelRef<FVM_CommissionEntry> Self;


}

namespace FVM_CommissionEntry
{
FVM_CommissionEntry& Create(const UObject ContextObject)
{
    return FVM_CommissionEntry::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_CommissionEntry CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_CommissionEntry __r;
    TEUIModelRef<FVM_CommissionEntry> local_6 = TEUIModelRef<FVM_CommissionEntry>(EUIInternal::MakeModelWithManager(Manager, FVM_CommissionEntry::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(true);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "RefreshRemainingTime";
    local_14.TypeName = "FTimespan";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasRefreshTime";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsUnlock";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsLock";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommissionEntry>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommissionEntry;
    FEUIModelWatcherProperty local_19;
    local_19.PropertyName = FName("RefreshCounterDown");
    int local_2_2 = FVM_CommissionEntry::__IndexOf_RefreshCounterDown();
    Result.WatcherProperties.Add(local_19);
    FEUIModelEffectDefine local_26;
    local_26.FunctionName = "RefreshCounterDownState";
    Result.EffectFunctions.Add(local_26);
    FEUIModelMsgHandleDefine local_36;
    local_36.FunctionName = "__OnCommissionRefreshTimesUpdated";
    local_36.MessageTypeName = "Msg_CommissionRefreshTimesUpdated";
    local_36.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_36);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommissionEntry;
}
void __OnCommissionRefreshTimesUpdated(FVM_CommissionEntry &inout Model, const FMsg_CommissionRefreshTimesUpdated &inout Message)
{
    Model.OnCommissionRefreshTimesUpdated(Message);
    return;
}
FTimespan __UIGetter_RefreshRemainingTime(const FVM_CommissionEntry &inout Model)
{
    return Model.GetRefreshRemainingTime();
}
bool __UIGetter_HasRefreshTime(const FVM_CommissionEntry &inout Model)
{
    return Model.HasRefreshTime();
}
bool __UIGetter_IsUnlock(const FVM_CommissionEntry &inout Model)
{
    return Model.GetIsUnlock();
}
bool __UIGetter_IsLock(const FVM_CommissionEntry &inout Model)
{
    return Model.GetIsLock();
}
TEUIModelRef<FVM_CommissionEntry> __UIGetter_Self(const FVM_CommissionEntry &inout Model)
{
    return TEUIModelRef<FVM_CommissionEntry>(Model);
}
int __IndexOf_CommissionType()
{
    return 0;
}
int __IndexOf_RefreshCounterDown()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_CommissionEntry
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
