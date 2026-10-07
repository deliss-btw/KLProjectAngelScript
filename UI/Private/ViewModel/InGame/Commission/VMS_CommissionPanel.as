
namespace FVMS_CommissionPanel
{
    const int ModelId = 0;

}
struct FVMS_CommissionPanel : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    TArray<FEUIModelRef> m_CommissionList;

    FVMS_CommissionPanel()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        TArray<TEUIModelRef<FM_Commission>> local_14 = ::FMS_CommissionData::Get(this.GetContext().Manager).GetCommissionListByType(ECommissionType(1));
        for (auto& local_30 : local_14)
        {
            this.GetModify_CommissionList().Add(FEUIModelRef(::FVM_CommissionInfo::Create(this.GetContext().Manager, local_30)));
        }
        return;
    }
    FVMS_CommissionPanel(const FVMS_CommissionPanel &inout Other)
    {
        this.m_CommissionList = Other.m_CommissionList;
        return;
    }
    FVMS_CommissionPanel& opAssign(const FVMS_CommissionPanel &inout Other)
    {
        return Other.m_CommissionList;
    }
    const TArray<FEUIModelRef> GetCommissionList() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_CommissionList() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetCommissionList(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CommissionList = __Value;
        return;
    }
}

struct __Lambda_UI_Private_ViewModel_InGame_Commission_VMS_CommissionPanel_11
{
    __Lambda_UI_Private_ViewModel_InGame_Commission_VMS_CommissionPanel_11()
    {
        return;
    }
    bool opCall(const TEUIModelRef<FM_Commission> &inout A, const TEUIModelRef<FM_Commission> &inout B)
    {
        if (!(!(A.opArrow().GetCommissionConfig())) && B.opArrow().GetCommissionConfig())
        {
            return (A.opArrow().GetCommissionConfig().opArrow().CommissionStars > B.opArrow().GetCommissionConfig().opArrow().CommissionStars);
        }
        return false;
    }
}

struct __GeneratedProperties_FVMS_CommissionPanel
{
    UPROPERTY()
    TEUIModelRef<FVMS_CommissionPanel> Self;

    __GeneratedProperties_FVMS_CommissionPanel()
    {
        return;
    }
}

namespace FVMS_CommissionPanel
{
FVMS_CommissionPanel& Get(const UObject ContextObject)
{
    return FVMS_CommissionPanel::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_CommissionPanel GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_CommissionPanel __r;
    TEUIModelRef<FVMS_CommissionPanel> local_6 = TEUIModelRef<FVMS_CommissionPanel>(EUIInternal::MakeModelWithManager(Manager, FVMS_CommissionPanel::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "CommissionList";
    local_14.TypeName = "TArray<FEUIModelRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_CommissionPanel>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_CommissionPanel;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_CommissionPanel;
}
TArray<FEUIModelRef> __UIGetter_CommissionList(const FVMS_CommissionPanel &inout Model)
{
    return Model.GetCommissionList();
}
TEUIModelRef<FVMS_CommissionPanel> __UIGetter_Self(const FVMS_CommissionPanel &inout Model)
{
    return TEUIModelRef<FVMS_CommissionPanel>(Model);
}
int __IndexOf_CommissionList()
{
    return 0;
}
}
namespace __GeneratedProperties_FVMS_CommissionPanel
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
