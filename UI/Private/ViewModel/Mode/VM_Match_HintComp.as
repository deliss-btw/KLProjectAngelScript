
namespace FVM_Match_HintComp
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature JumpToMatch = FEUIModelCallbackSignature();

}
struct FVM_Match_HintComp : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_MatchHintName;
    UPROPERTY()
    uint m_MatchMode;
    UPROPERTY()
    uint m_MatchId;
    UPROPERTY()
    uint m_CommissionId;
    UPROPERTY()
    TEUIModelRef<FMS_Mode> m_ModeMS;

    FVM_Match_HintComp()
    {
        this.m_MatchMode = 0;
        this.m_MatchId = 0;
        this.m_CommissionId = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_Match_HintComp(const FVM_Match_HintComp &inout Other)
    {
        this.m_MatchMode = 0;
        this.m_MatchId = 0;
        this.m_CommissionId = 0;
        this.m_MatchHintName = Other.m_MatchHintName;
        this.m_MatchMode = int(Other.m_MatchMode);
        this.m_MatchId = int(Other.m_MatchId);
        this.m_CommissionId = int(Other.m_CommissionId);
        this.m_ModeMS = Other.m_ModeMS;
        return;
    }
    FVM_Match_HintComp& opAssign(const FVM_Match_HintComp &inout Other)
    {
        this.m_MatchHintName = Other.m_MatchHintName;
        this.m_MatchMode = int(Other.m_MatchMode);
        this.m_MatchId = int(Other.m_MatchId);
        this.m_CommissionId = int(Other.m_CommissionId);
        return Other.m_ModeMS;
    }
    void PostConstruct()
    {
        this.SetModeMS(TEUIModelRef<FMS_Mode>(::FMS_Mode::Get(this.GetContext().Manager)));
        return;
    }
    bool IsMatching() const
    {
        TEUIModelRef<FMS_Mode> local_2 = this.GetModeMS();
        return GetbMatching();
    }
    void SetMatchContext(const uint InMatchMode, const uint InMatchId, const uint InCommissionId)
    {
        this.SetMatchMode(InMatchMode);
        this.SetMatchId(InMatchId);
        this.SetCommissionId(InCommissionId);
        this.RefreshHintName();
        return;
    }
    void SetModeData(const TEUIModelRef<FM_ModeItem> &inout InMode)
    {
        if (InMode.IsValid())
        {
            this.SetMatchContext(1, GetDataId(), 0);
        }
        return;
    }
    void RefreshHintName()
    {
        if (this.GetMatchMode() == 2)
        {
            if (::FMS_CommissionData::Get(this.GetContext().Manager).FindCommissionByConfigDataId(this.GetCommissionId()).IsValid() && GetCommissionConfig().IsSet())
            {
            }
            return;
        }
        int local_2 = this.GetMatchId();
        if (local_2 != 0)
        {
            FM_ModeItem& local_12 = ::FM_ModeItem::Create(this.GetContext().Manager, this.GetMatchId());
            if (local_12.GetMatchConfig().IsSet())
            {
            }
        }
        return;
    }
    void JumpToMatch()
    {
        int local_24 = 0;
        if (this.GetMatchMode() == 2)
        {
            if (::FMS_CommissionData::Get(this.GetContext().Manager).FindCommissionByConfigDataId(this.GetCommissionId()).IsValid() && GetCommissionConfig().IsSet())
            {
                int local_2 = this.GetCommissionId();
                FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_CommissionPanel, FEUIModelRef());
            }
            return;
        }
        int local_1 = this.GetMatchId();
        if (local_1 != 0)
        {
            TEUIModelRef<FM_ModeItem> local_22 = TEUIModelRef<FM_ModeItem>(::FM_ModeItem::Create(this.GetContext().Manager, this.GetMatchId()));
            FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_Mode_PVX_Match, FEUIModelRef(local_24));
        }
        return;
    }
    FText GetMatchHintTime() const
    {
        TEUIModelRef<FMS_Mode> local_2 = this.GetModeMS();
        return FText::AsTimespan(FTimespan::FromSeconds(GetMatchWaitTime().ToSeconds()));
    }
    const FText GetMatchHintName() const property
    {
        const FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_MatchHintName() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetMatchHintName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_MatchHintName = __Value;
        return;
    }
    uint GetMatchMode() const property
    {
        this.TrackPropertyRead(1);
        return this.m_MatchMode;
    }
    void SetMatchMode(const uint __Value) property
    {
        if (this.m_MatchMode == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_MatchMode = __Value;
        return;
    }
    uint GetMatchId() const property
    {
        this.TrackPropertyRead(2);
        return this.m_MatchId;
    }
    void SetMatchId(const uint __Value) property
    {
        if (this.m_MatchId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_MatchId = __Value;
        return;
    }
    uint GetCommissionId() const property
    {
        this.TrackPropertyRead(3);
        return this.m_CommissionId;
    }
    void SetCommissionId(const uint __Value) property
    {
        if (this.m_CommissionId == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CommissionId = __Value;
        return;
    }
    TEUIModelRef<FMS_Mode> GetModeMS() const property
    {
        this.TrackPropertyRead(4);
        return this.m_ModeMS;
    }
    void SetModeMS(const TEUIModelRef<FMS_Mode> &inout __Value) property
    {
        TEUIModelRef<FMS_Mode> local_2;
        local_2 = this.m_ModeMS;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_ModeMS = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_Match_HintComp
{
    UPROPERTY()
    bool IsMatching;
    UPROPERTY()
    FText MatchHintTime;
    UPROPERTY()
    TEUIModelRef<FVM_Match_HintComp> Self;


}

namespace FVM_Match_HintComp
{
FVM_Match_HintComp& Create(const UObject ContextObject)
{
    return FVM_Match_HintComp::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_Match_HintComp CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_Match_HintComp __r;
    TEUIModelRef<FVM_Match_HintComp> local_6 = TEUIModelRef<FVM_Match_HintComp>(EUIInternal::MakeModelWithManager(Manager, FVM_Match_HintComp::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "MatchHintName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsMatching";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MatchHintTime";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_Match_HintComp>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_Match_HintComp;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_Match_HintComp;
}
FText __UIGetter_MatchHintName(const FVM_Match_HintComp &inout Model)
{
    return Model.GetMatchHintName();
}
bool __UIGetter_IsMatching(const FVM_Match_HintComp &inout Model)
{
    return Model.IsMatching();
}
FText __UIGetter_MatchHintTime(const FVM_Match_HintComp &inout Model)
{
    return Model.GetMatchHintTime();
}
TEUIModelRef<FVM_Match_HintComp> __UIGetter_Self(const FVM_Match_HintComp &inout Model)
{
    return TEUIModelRef<FVM_Match_HintComp>(Model);
}
int __IndexOf_MatchHintName()
{
    return 0;
}
int __IndexOf_MatchMode()
{
    return 1;
}
int __IndexOf_MatchId()
{
    return 2;
}
int __IndexOf_CommissionId()
{
    return 3;
}
int __IndexOf_ModeMS()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_Match_HintComp
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
