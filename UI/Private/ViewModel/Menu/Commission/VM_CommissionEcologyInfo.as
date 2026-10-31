enum EEcologyElementType
{
    Weather,
    IntrusionPolicy,
}

namespace FVM_CommissionEcologyInfo
{
    const int ModelId = 0;

}
struct FVM_CommissionEcologyInfo : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Commission> m_CommissionModel;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_CommissionEcologyElement>> m_EcologyElementList;
    UPROPERTY()
    TEUIModelRef<FVM_CommissionEcologyElement> m_SelectedEcologyElement;

    FVM_CommissionEcologyInfo()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommissionEcologyInfo' by default constructor.");
        return;
    }
    FVM_CommissionEcologyInfo(const FVM_CommissionEcologyInfo &inout Other)
    {
        this.m_CommissionModel = Other.m_CommissionModel;
        this.m_EcologyElementList = Other.m_EcologyElementList;
        this.m_SelectedEcologyElement = Other.m_SelectedEcologyElement;
        return;
    }
    FVM_CommissionEcologyInfo(const TEUIModelRef<FM_Commission> &inout InCommissionModel)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetCommissionModel(InCommissionModel);
        return;
    }
    FVM_CommissionEcologyInfo& opAssign(const FVM_CommissionEcologyInfo &inout Other)
    {
        this.m_CommissionModel = Other.m_CommissionModel;
        this.m_EcologyElementList = Other.m_EcologyElementList;
        return Other.m_SelectedEcologyElement;
    }
    void PostConstruct()
    {
        this.RefreshEcologyElementList();
        return;
    }
    void OnCommissionModelInstanceDataChanged()
    {
        this.RefreshEcologyElementList();
        return;
    }
    TDataObjectPtr<FTODStageConfig> GetTODStage() const
    {
        return ::FTimeOfDayUtils::GetTODStage(this.GetCommissionModel().opArrow().GetStartTimeInHours());
    }
    FSoftBrush GetTODStageIcon() const
    {
        TDataObjectPtr<FTODStageConfig> local_24 = this.GetTODStage();
        if (local_24)
        {
            return local_24.opArrow().DisplayIcon;
        }
        return FSoftBrush();
    }
    bool IsBadWeather() const
    {
        if (!(this.GetSelectedEcologyElement()) || (int(this.GetSelectedEcologyElement().opArrow().GetElementType()) != 0))
        {
            return false;
        }
        TDataObjectPtr<FWeatherConfig> local_34 = this.GetCommissionModel().opArrow().GetWeatherConfig();
        if (local_34)
        {
            return local_34.opArrow().bBadWeather;
        }
        return false;
    }
    bool HasAnyEcologyElement() const
    {
        return !(this.GetEcologyElementList().IsEmpty());
    }
    void RefreshEcologyElementList()
    {
        int local_40 = 0;
        this.GetModify_EcologyElementList().Empty(0);
        TEUIModelRef<FM_Commission> local_4 = this.GetCommissionModel();
        if (local_4.opArrow().GetWeatherConfig())
        {
            TEUIModelRef<FVM_CommissionEcologyElement> local_36 = TEUIModelRef<FVM_CommissionEcologyElement>(::FVM_CommissionEcologyElement::Create(this.GetManager(), (TEUIModelWeakRef<FVM_CommissionEcologyInfo>(this)), EEcologyElementType(0)));
            this.GetModify_EcologyElementList().Add(local_36);
        }
        TEUIModelRef<FM_Commission> local_4_2 = this.GetCommissionModel();
        if (int(local_4_2.opArrow().GetCommissionConfig().opArrow().CommissionType) == 4)
        {
            TEUIModelWeakRef<FVM_CommissionEcologyInfo> local_32 = TEUIModelWeakRef<FVM_CommissionEcologyInfo>(this);
            UEUIManagerSubsystem local_34 = this.GetManager();
            local_40.SetIsUnknown(true, NSLOCTEXT("CommissionEcologyInfo", "UnknownWeatherDescription", "局内第二阶段会切换随机天气"));
            TEUIModelRef<FVM_CommissionEcologyElement> local_36_2 = TEUIModelRef<FVM_CommissionEcologyElement>(local_40);
            this.GetModify_EcologyElementList().Add(local_36_2);
        }
        TEUIModelRef<FVM_CommissionEcologyElement> local_46;
        if (this.GetEcologyElementList().IsValidIndex(0))
        {
            local_46 = this.GetEcologyElementList()[0];
        }
        else
        {
            local_46 = TEUIModelRef<FVM_CommissionEcologyElement>();
        }
        this.SetSelectedEcologyElement(local_46);
        return;
    }
    TEUIModelRef<FM_Commission> GetCommissionModel() const property
    {
        this.TrackPropertyRead(0);
        return this.m_CommissionModel;
    }
    void SetCommissionModel(const TEUIModelRef<FM_Commission> &inout __Value) property
    {
        TEUIModelRef<FM_Commission> local_2;
        local_2 = this.m_CommissionModel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CommissionModel = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_CommissionEcologyElement>> GetEcologyElementList() const property
    {
        const TArray<TEUIModelRef<FVM_CommissionEcologyElement>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TEUIModelRef<FVM_CommissionEcologyElement>> GetModify_EcologyElementList() property
    {
        TArray<TEUIModelRef<FVM_CommissionEcologyElement>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetEcologyElementList(const TArray<TEUIModelRef<FVM_CommissionEcologyElement>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_EcologyElementList = __Value;
        return;
    }
    TEUIModelRef<FVM_CommissionEcologyElement> GetSelectedEcologyElement() const property
    {
        this.TrackPropertyRead(2);
        return this.m_SelectedEcologyElement;
    }
    void SetSelectedEcologyElement(const TEUIModelRef<FVM_CommissionEcologyElement> &inout __Value) property
    {
        TEUIModelRef<FVM_CommissionEcologyElement> local_2;
        local_2 = this.m_SelectedEcologyElement;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_SelectedEcologyElement = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommissionEcologyInfo
{
    UPROPERTY()
    TDataObjectPtr<FTODStageConfig> TODStage;
    UPROPERTY()
    FSoftBrush TODStageIcon;
    UPROPERTY()
    bool IsBadWeather;
    UPROPERTY()
    bool HasAnyEcologyElement;
    UPROPERTY()
    TEUIModelRef<FVM_CommissionEcologyInfo> Self;

}

namespace FVM_CommissionEcologyInfo
{
FVM_CommissionEcologyInfo& Create(const UObject ContextObject, const TEUIModelRef<FM_Commission> &inout CommissionModel)
{
    return FVM_CommissionEcologyInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject), CommissionModel);
}
FVM_CommissionEcologyInfo& CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Commission> &inout CommissionModel)
{
    return TEUIModelRef<FVM_CommissionEcologyInfo>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommissionEcologyInfo::ModelId, 0, CommissionModel)).Get();
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "EcologyElementList";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_CommissionEcologyElement>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedEcologyElement";
    local_14.TypeName = "TEUIModelRef<FVM_CommissionEcologyElement>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TODStage";
    local_14.TypeName = "TDataObjectPtr<FTODStageConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TODStageIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsBadWeather";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasAnyEcologyElement";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommissionEcologyInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommissionEcologyInfo;
    FEUIModelRefPropertyDirtyIndexer local_22 = FEUIModelRefPropertyDirtyIndexer(3);
    local_22.AddRefPropertyDirty(0, 0, FM_Commission::__IndexOf_InstanceData());
    local_22.ApplySort();
    FEUIModelRefPropertyDirty local_30;
    local_30.PropertyName = FName("CommissionModel");
    int local_2_2 = FM_Commission::ModelId;
    int local_2_3 = local_22.GetMappingDirtyOffset(0);
    local_30.RelatedDirtyMask.SetBit(FM_Commission::__IndexOf_InstanceData(), true);
    Result.ListeningModelRefDirties.Add(local_30);
    FEUIModelDirtyDefine local_40;
    local_40.FunctionName = "__OnCommissionModelInstanceDataChanged";
    local_40.DirtyFlags.Set(FVM_CommissionEcologyInfo::__IndexOf_CommissionModel());
    local_40.DirtyFlags.Set(local_22.GetMappingDirtyIndex(0));
    Result.DirtyFunctions.Add(local_40);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommissionEcologyInfo;
}
void __OnCommissionModelInstanceDataChanged(FVM_CommissionEcologyInfo &inout Model)
{
    Model.OnCommissionModelInstanceDataChanged();
    return;
}
TArray<TEUIModelRef<FVM_CommissionEcologyElement>> __UIGetter_EcologyElementList(const FVM_CommissionEcologyInfo &inout Model)
{
    return Model.GetEcologyElementList();
}
TEUIModelRef<FVM_CommissionEcologyElement> __UIGetter_SelectedEcologyElement(const FVM_CommissionEcologyInfo &inout Model)
{
    return Model.GetSelectedEcologyElement();
}
TDataObjectPtr<FTODStageConfig> __UIGetter_TODStage(const FVM_CommissionEcologyInfo &inout Model)
{
    return Model.GetTODStage();
}
FSoftBrush __UIGetter_TODStageIcon(const FVM_CommissionEcologyInfo &inout Model)
{
    return Model.GetTODStageIcon();
}
bool __UIGetter_IsBadWeather(const FVM_CommissionEcologyInfo &inout Model)
{
    return Model.IsBadWeather();
}
bool __UIGetter_HasAnyEcologyElement(const FVM_CommissionEcologyInfo &inout Model)
{
    return Model.HasAnyEcologyElement();
}
TEUIModelRef<FVM_CommissionEcologyInfo> __UIGetter_Self(const FVM_CommissionEcologyInfo &inout Model)
{
    return TEUIModelRef<FVM_CommissionEcologyInfo>(Model);
}
int __IndexOf_CommissionModel()
{
    return 0;
}
int __IndexOf_EcologyElementList()
{
    return 1;
}
int __IndexOf_SelectedEcologyElement()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_CommissionEcologyInfo
{
UScriptStruct StaticStruct()
{
    return __GeneratedProperties_FVM_CommissionEcologyInfo.Get();
}
}
