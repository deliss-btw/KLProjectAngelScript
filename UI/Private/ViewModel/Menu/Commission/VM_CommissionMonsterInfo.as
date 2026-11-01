namespace FVM_CommissionMonsterInfo
{
    const int ModelId = 0;

}
struct FVM_CommissionMonsterInfo : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Commission> m_CommissionModel;
    UPROPERTY()
    TEUIModelRef<FVM_DynamicWidgetSelector> m_MonsterSelector;
    UPROPERTY()
    TEUIModelRef<FVM_DropPreview> m_DropPreview;

    FVM_CommissionMonsterInfo()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommissionMonsterInfo' by default constructor.");
        return;
    }
    FVM_CommissionMonsterInfo(const FVM_CommissionMonsterInfo &inout Other)
    {
        this.m_CommissionModel = Other.m_CommissionModel;
        this.m_MonsterSelector = Other.m_MonsterSelector;
        this.m_DropPreview = Other.m_DropPreview;
        return;
    }
    FVM_CommissionMonsterInfo(const TEUIModelRef<FM_Commission> &inout InCommissionModel)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetCommissionModel(InCommissionModel);
        return;
    }
    FVM_CommissionMonsterInfo& opAssign(const FVM_CommissionMonsterInfo &inout Other)
    {
        this.m_CommissionModel = Other.m_CommissionModel;
        this.m_MonsterSelector = Other.m_MonsterSelector;
        return Other.m_DropPreview;
    }
    void PostConstruct()
    {
        TArray<FEUIDynamicWidgetData> local_4;
        for (auto& local_22 : this.GetCommissionModel().opArrow().GetCommissionConfig().opArrow().DisplayMonsters)
        {
            FEUIDynamicWidgetData local_46;
            local_46.ModelContainer = FEUIModelContainer(::FVM_MonsterInfo::Create(this.GetContext().Manager, local_22.MonsterConfig));
            local_46.WidgetClass = local_22.DisplayWidget;
            local_4.Add(local_46);
        }
        this.SetMonsterSelector(TEUIModelRef<FVM_DynamicWidgetSelector>(::FVM_DynamicWidgetSelector::Create(this.GetContext().Manager, local_4)));
        this.UpdateDropPreview();
        return;
    }
    TEUIModelRef<FVM_MonsterInfo> GetSelectedMonsterInfo() const
    {
        FEUIModelContainer local_16 = this.GetMonsterSelector().opArrow().GetSelectedModel();
        return TEUIModelRef<FVM_MonsterInfo>(FEUIModelContainer::GetModel(local_16).opCall());
    }
    TArray<TEUIModelRef<FVM_DamageType>> GetAttributeDamageTypes() const
    {
        FVM_MonsterInfo& local_36 = FEUIModelContainer::GetModel(this.GetMonsterSelector().opArrow().GetSelectedModel()).opCall();
        if (local_36)
        {
            return local_36.GetAttributeDamageTypes();
        }
        return TArray<TEUIModelRef<FVM_DamageType>>();
    }
    TArray<TEUIModelRef<FVM_DamageType>> GetWeaknessDamageTypes() const
    {
        FVM_MonsterInfo& local_36 = FEUIModelContainer::GetModel(this.GetMonsterSelector().opArrow().GetSelectedModel()).opCall();
        if (local_36)
        {
            return local_36.GetWeaknessDamageTypes();
        }
        return TArray<TEUIModelRef<FVM_DamageType>>();
    }
    void OnMonsterSelectorSelectedModelChanged()
    {
        this.UpdateDropPreview();
        return;
    }
    void OnCommissionModelInstanceDataChanged()
    {
        this.UpdateDropPreview();
        return;
    }
    void UpdateDropPreview()
    {
        TEUIModelRef<FVM_MonsterInfo> local_2 = this.GetSelectedMonsterInfo();
        if (local_2)
        {
            if (!(local_2.opArrow().GetMonsterConfig().opArrow().GetDropItems().IsEmpty()))
            {
                bool local_57 = this.GetCommissionModel().opArrow().GetWeatherConfig();
                if (!(local_57))
                {
                    local_57 = false;
                }
                else
                {
                    local_57 = this.GetCommissionModel().opArrow().GetWeatherConfig().opArrow().bCommissionRewardUp;
                }
                this.SetDropPreview(TEUIModelRef<FVM_DropPreview>(::FVM_DropPreview::Create(this.GetContext().Manager, local_2.opArrow().GetMonsterConfig().opArrow().GetDropItems()[0], local_57)));
                return;
            }
        }
        this.SetDropPreview(TEUIModelRef<FVM_DropPreview>());
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
    TEUIModelRef<FVM_DynamicWidgetSelector> GetMonsterSelector() const property
    {
        this.TrackPropertyRead(1);
        return this.m_MonsterSelector;
    }
    void SetMonsterSelector(const TEUIModelRef<FVM_DynamicWidgetSelector> &inout __Value) property
    {
        TEUIModelRef<FVM_DynamicWidgetSelector> local_2;
        local_2 = this.m_MonsterSelector;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_MonsterSelector = __Value;
        return;
    }
    TEUIModelRef<FVM_DropPreview> GetDropPreview() const property
    {
        this.TrackPropertyRead(2);
        return this.m_DropPreview;
    }
    void SetDropPreview(const TEUIModelRef<FVM_DropPreview> &inout __Value) property
    {
        TEUIModelRef<FVM_DropPreview> local_2;
        local_2 = this.m_DropPreview;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_DropPreview = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommissionMonsterInfo
{
    UPROPERTY()
    TEUIModelRef<FVM_MonsterInfo> SelectedMonsterInfo;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_DamageType>> AttributeDamageTypes;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_DamageType>> WeaknessDamageTypes;
    UPROPERTY()
    TEUIModelRef<FVM_CommissionMonsterInfo> Self;

    __GeneratedProperties_FVM_CommissionMonsterInfo()
    {
        return;
    }
}

namespace FVM_CommissionMonsterInfo
{
FVM_CommissionMonsterInfo& Create(const UObject ContextObject, const TEUIModelRef<FM_Commission> &inout CommissionModel)
{
    return FVM_CommissionMonsterInfo::CreateByManager(EUIInternal::GetContextManager(ContextObject), CommissionModel);
}
FVM_CommissionMonsterInfo& CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Commission> &inout CommissionModel)
{
    return TEUIModelRef<FVM_CommissionMonsterInfo>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommissionMonsterInfo::ModelId, 0, CommissionModel)).Get();
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "MonsterSelector";
    local_14.TypeName = "TEUIModelRef<FVM_DynamicWidgetSelector>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DropPreview";
    local_14.TypeName = "TEUIModelRef<FVM_DropPreview>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedMonsterInfo";
    local_14.TypeName = "TEUIModelRef<FVM_MonsterInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "AttributeDamageTypes";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_DamageType>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "WeaknessDamageTypes";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_DamageType>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommissionMonsterInfo>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommissionMonsterInfo;
    FEUIModelRefPropertyDirtyIndexer local_22 = FEUIModelRefPropertyDirtyIndexer(3);
    local_22.AddRefPropertyDirty(0, 1, FVM_DynamicWidgetSelector::__IndexOf_SelectedIndex());
    local_22.AddRefPropertyDirty(1, 0, FM_Commission::__IndexOf_InstanceData());
    local_22.ApplySort();
    FEUIModelRefPropertyDirty local_30;
    local_30.PropertyName = FName("MonsterSelector");
    local_30.PropertyModelId = FVM_DynamicWidgetSelector::ModelId;
    local_30.MappingDirtyOffset = local_22.GetMappingDirtyOffset(1);
    local_30.RelatedDirtyMask.SetBit(FVM_DynamicWidgetSelector::__IndexOf_SelectedIndex(), true);
    Result.ListeningModelRefDirties.Add(local_30);
    local_30.PropertyName = FName("CommissionModel");
    local_30.PropertyModelId = FM_Commission::ModelId;
    local_30.MappingDirtyOffset = local_22.GetMappingDirtyOffset(0);
    local_30.RelatedDirtyMask.SetBit(FM_Commission::__IndexOf_InstanceData(), true);
    Result.ListeningModelRefDirties.Add(local_30);
    FEUIModelDirtyDefine local_40;
    local_40.FunctionName = "__OnMonsterSelectorSelectedModelChanged";
    local_40.DirtyFlags.Set(FVM_CommissionMonsterInfo::__IndexOf_MonsterSelector());
    local_40.DirtyFlags.Set(local_22.GetMappingDirtyIndex(0));
    Result.DirtyFunctions.Add(local_40);
    local_40.FunctionName = "__OnCommissionModelInstanceDataChanged";
    local_40.DirtyFlags.Set(FVM_CommissionMonsterInfo::__IndexOf_CommissionModel());
    local_40.DirtyFlags.Set(local_22.GetMappingDirtyIndex(1));
    Result.DirtyFunctions.Add(local_40);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommissionMonsterInfo;
}
void __OnMonsterSelectorSelectedModelChanged(FVM_CommissionMonsterInfo &inout Model)
{
    Model.OnMonsterSelectorSelectedModelChanged();
    return;
}
void __OnCommissionModelInstanceDataChanged(FVM_CommissionMonsterInfo &inout Model)
{
    Model.OnCommissionModelInstanceDataChanged();
    return;
}
TEUIModelRef<FVM_DynamicWidgetSelector> __UIGetter_MonsterSelector(const FVM_CommissionMonsterInfo &inout Model)
{
    return Model.GetMonsterSelector();
}
TEUIModelRef<FVM_DropPreview> __UIGetter_DropPreview(const FVM_CommissionMonsterInfo &inout Model)
{
    return Model.GetDropPreview();
}
TEUIModelRef<FVM_MonsterInfo> __UIGetter_SelectedMonsterInfo(const FVM_CommissionMonsterInfo &inout Model)
{
    return Model.GetSelectedMonsterInfo();
}
TArray<TEUIModelRef<FVM_DamageType>> __UIGetter_AttributeDamageTypes(const FVM_CommissionMonsterInfo &inout Model)
{
    return Model.GetAttributeDamageTypes();
}
TArray<TEUIModelRef<FVM_DamageType>> __UIGetter_WeaknessDamageTypes(const FVM_CommissionMonsterInfo &inout Model)
{
    return Model.GetWeaknessDamageTypes();
}
TEUIModelRef<FVM_CommissionMonsterInfo> __UIGetter_Self(const FVM_CommissionMonsterInfo &inout Model)
{
    return TEUIModelRef<FVM_CommissionMonsterInfo>(Model);
}
int __IndexOf_CommissionModel()
{
    return 0;
}
int __IndexOf_MonsterSelector()
{
    return 1;
}
int __IndexOf_DropPreview()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_CommissionMonsterInfo
{
UScriptStruct StaticStruct()
{
    return __GeneratedProperties_FVM_CommissionMonsterInfo.Get();
}
}
