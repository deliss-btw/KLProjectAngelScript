
namespace FVM_CombatSettingPresetSelector
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnPresetSelected = FEUIModelCallbackSignature();
}
namespace FVMS_CombatSettingPresetSelectorCache
{
    const int ModelId = 0;

}
struct FVM_CombatSettingPresetSelector : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_CommonDropdown> m_PresetDropdown;
    UPROPERTY()
    TEUIModelRef<FMS_CombatSettingData> m_CombatSettingData;

    FVM_CombatSettingPresetSelector()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_CombatSettingPresetSelector(const FVM_CombatSettingPresetSelector &inout Other)
    {
        this.m_PresetDropdown = Other.m_PresetDropdown;
        this.m_CombatSettingData = Other.m_CombatSettingData;
        return;
    }
    FVM_CombatSettingPresetSelector& opAssign(const FVM_CombatSettingPresetSelector &inout Other)
    {
        this.m_PresetDropdown = Other.m_PresetDropdown;
        return Other.m_CombatSettingData;
    }
    void PostConstruct()
    {
        this.SetCombatSettingData(TEUIModelRef<FMS_CombatSettingData>(::FMS_CombatSettingData::Get(this.GetContext().Manager)));
        this.GetCombatSettingData().opArrow().ResetEditingPresetType();
        TArray<FEUIModelContainer> local_6;
        NSLOCTEXT("SingleAvatar", "еЌ•дєєжЁЎејЏ");
        local_6.Add(FEUIModelContainer());
        NSLOCTEXT("DoubleAvatar", "еЏЊдєєжЁЎејЏ");
        local_6.Add(FEUIModelContainer());
        FOnCommonDropdownSelected local_48;
        local_48.Add(this, FVM_CombatSettingPresetSelector::OnPresetSelected);
        this.SetPresetDropdown(TEUIModelRef<FVM_CommonDropdown>(::FVM_CommonDropdown::Create(this.GetContext().Manager, local_6, FCommonDropdownDefaultOption(int(this.GetCombatSettingData().opArrow().GetEditingPresetType())), local_48)));
        return;
    }
    void OnPresetSelected(const int Index)
    {
        this.GetCombatSettingData().opArrow().SetEditingPresetType();
        return;
    }
    TEUIModelRef<FVM_CommonDropdown> GetPresetDropdown() const property
    {
        this.TrackPropertyRead(0);
        return this.m_PresetDropdown;
    }
    void SetPresetDropdown(const TEUIModelRef<FVM_CommonDropdown> &inout __Value) property
    {
        TEUIModelRef<FVM_CommonDropdown> local_2;
        local_2 = this.m_PresetDropdown;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_PresetDropdown = __Value;
        return;
    }
    TEUIModelRef<FMS_CombatSettingData> GetCombatSettingData() const property
    {
        this.TrackPropertyRead(1);
        return this.m_CombatSettingData;
    }
    void SetCombatSettingData(const TEUIModelRef<FMS_CombatSettingData> &inout __Value) property
    {
        TEUIModelRef<FMS_CombatSettingData> local_2;
        local_2 = this.m_CombatSettingData;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_CombatSettingData = __Value;
        return;
    }
}

struct FVMS_CombatSettingPresetSelectorCache : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    TEUIModelRef<FVM_CombatSettingPresetSelector> m_CombatSettingPresetSelector;

    FVMS_CombatSettingPresetSelectorCache()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_CombatSettingPresetSelectorCache(const FVMS_CombatSettingPresetSelectorCache &inout Other)
    {
        this.m_CombatSettingPresetSelector = Other.m_CombatSettingPresetSelector;
        return;
    }
    FVMS_CombatSettingPresetSelectorCache& opAssign(const FVMS_CombatSettingPresetSelectorCache &inout Other)
    {
        return Other.m_CombatSettingPresetSelector;
    }
    TEUIModelRef<FVM_CombatSettingPresetSelector> GetCombatSettingPresetSelector() const property
    {
        this.TrackPropertyRead(0);
        return this.m_CombatSettingPresetSelector;
    }
    void SetCombatSettingPresetSelector(const TEUIModelRef<FVM_CombatSettingPresetSelector> &inout __Value) property
    {
        TEUIModelRef<FVM_CombatSettingPresetSelector> local_2;
        local_2 = this.m_CombatSettingPresetSelector;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CombatSettingPresetSelector = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CombatSettingPresetSelector
{
    UPROPERTY()
    TEUIModelRef<FVM_CombatSettingPresetSelector> Self;

    __GeneratedProperties_FVM_CombatSettingPresetSelector()
    {
        return;
    }
}

namespace FVM_CombatSettingPresetSelector
{
FVM_CombatSettingPresetSelector& Create(const UObject ContextObject)
{
    return FVM_CombatSettingPresetSelector::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_CombatSettingPresetSelector CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_CombatSettingPresetSelector __r;
    TEUIModelRef<FVM_CombatSettingPresetSelector> local_6 = TEUIModelRef<FVM_CombatSettingPresetSelector>(EUIInternal::MakeModelWithManager(Manager, FVM_CombatSettingPresetSelector::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "PresetDropdown";
    local_14.TypeName = "TEUIModelRef<FVM_CommonDropdown>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CombatSettingPresetSelector>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CombatSettingPresetSelector;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CombatSettingPresetSelector;
}
TEUIModelRef<FVM_CommonDropdown> __UIGetter_PresetDropdown(const FVM_CombatSettingPresetSelector &inout Model)
{
    return Model.GetPresetDropdown();
}
TEUIModelRef<FVM_CombatSettingPresetSelector> __UIGetter_Self(const FVM_CombatSettingPresetSelector &inout Model)
{
    return TEUIModelRef<FVM_CombatSettingPresetSelector>(Model);
}
int __IndexOf_PresetDropdown()
{
    return 0;
}
int __IndexOf_CombatSettingData()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_CombatSettingPresetSelector
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVMS_CombatSettingPresetSelectorCache
{
FVMS_CombatSettingPresetSelectorCache& Get(const UObject ContextObject)
{
    return FVMS_CombatSettingPresetSelectorCache::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_CombatSettingPresetSelectorCache GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_CombatSettingPresetSelectorCache __r;
    TEUIModelRef<FVMS_CombatSettingPresetSelectorCache> local_6 = TEUIModelRef<FVMS_CombatSettingPresetSelectorCache>(EUIInternal::MakeModelWithManager(Manager, FVMS_CombatSettingPresetSelectorCache::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_CombatSettingPresetSelectorCache;
}
int __IndexOf_CombatSettingPresetSelector()
{
    return 0;
}
}
