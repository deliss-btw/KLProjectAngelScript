
namespace FVM_HeadsUpDisplay
{
    const int ModelId = 0;

}
struct FVM_HeadsUpDisplay : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Spot> m_Spot;
    UPROPERTY()
    FEUIModelContainer m_SpotData;
    UPROPERTY()
    TEUIModelRef<FVM_PresentationDisplayRule> m_AlwaysShowIconRule;
    UPROPERTY()
    TEUIModelRef<FVM_PresentationDisplayRule> m_NameDisplayRule;
    UPROPERTY()
    TEUIModelRef<FVM_PresentationDisplayRule> m_EnergyDisplayRule;
    UPROPERTY()
    TEUIModelRef<FVMS_HeadsUpDisplayItem_Interaction_InternalCache> m_InternalCache;

    FVM_HeadsUpDisplay()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_HeadsUpDisplay' by default constructor.");
        return;
    }
    FVM_HeadsUpDisplay(const FVM_HeadsUpDisplay &inout Other)
    {
        this.m_Spot = Other.m_Spot;
        this.m_SpotData = Other.m_SpotData;
        this.m_AlwaysShowIconRule = Other.m_AlwaysShowIconRule;
        this.m_NameDisplayRule = Other.m_NameDisplayRule;
        this.m_EnergyDisplayRule = Other.m_EnergyDisplayRule;
        this.m_InternalCache = Other.m_InternalCache;
        return;
    }
    FVM_HeadsUpDisplay(const TEUIModelRef<FM_Spot> &inout InSpot)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetSpot(InSpot);
        return;
    }
    FVM_HeadsUpDisplay& opAssign(const FVM_HeadsUpDisplay &inout Other)
    {
        this.m_Spot = Other.m_Spot;
        this.m_SpotData = Other.m_SpotData;
        this.m_AlwaysShowIconRule = Other.m_AlwaysShowIconRule;
        this.m_NameDisplayRule = Other.m_NameDisplayRule;
        this.m_EnergyDisplayRule = Other.m_EnergyDisplayRule;
        return Other.m_InternalCache;
    }
    void PostConstruct()
    {
        FPresentationSpotDisplayModelData local_4;
        local_4.Spot = this.GetSpot();
        local_4.SpotUsage = EPresentationSpotUsage(3);
        Make local_22;
        this.SetSpotData(local_22.opImplConv());
        this.SetAlwaysShowIconRule(TEUIModelRef<FVM_PresentationDisplayRule>(::FVM_PresentationDisplayRule::Create(this.GetContext().Manager, this.GetSpot(), EPresentationDisplayRuleIndex(1))));
        this.SetNameDisplayRule(TEUIModelRef<FVM_PresentationDisplayRule>(::FVM_PresentationDisplayRule::Create(this.GetContext().Manager, this.GetSpot(), EPresentationDisplayRuleIndex(0))));
        this.SetEnergyDisplayRule(TEUIModelRef<FVM_PresentationDisplayRule>(::FVM_PresentationDisplayRule::Create(this.GetContext().Manager, this.GetSpot(), EPresentationDisplayRuleIndex(2))));
        this.SetInternalCache(TEUIModelRef<FVMS_HeadsUpDisplayItem_Interaction_InternalCache>(::FVMS_HeadsUpDisplayItem_Interaction_InternalCache::Get(this.GetManager())));
        return;
    }
    EHeadsUpDisplayType GetDisplayType() const
    {
        FSpotViewAdapter local_10;
        TDataObjectPtr<FHeadsUpDisplayConfig> local_34 = ::GetHeadsUpDisplayConfig(this.GetSpot().opArrow(), local_10);
        if (local_34)
        {
            return local_34.opArrow().DisplayType;
        }
        return EHeadsUpDisplayType(1);
    }
    float GetDistanceToPlayer() const
    {
        return ::PresentationSpotUtils::GetDistanceToPlayer2D(this.GetSpot());
    }
    FText GetDistanceText() const
    {
        FDistanceFormattingOptions local_4;
        return ::CommonPropertyConversions::DistanceToText(this.GetDistanceToPlayer(), local_4);
    }
    bool ShouldShowIcon() const
    {
        return this.GetAlwaysShowIconRule() && this.GetAlwaysShowIconRule().opArrow().GetbMatchesDisplayRule();
    }
    bool ShouldShowName() const
    {
        FSpotViewAdapter local_10;
        TEUIModelRef<FM_Spot> local_2 = this.GetSpot();
        TDataObjectPtr<FHeadsUpDisplayConfig> local_34 = ::GetHeadsUpDisplayConfig(local_2.opArrow(), local_10);
        if (local_34)
        {
            if (local_34.opArrow().bOnlyShowNameWhenSocialInteraction)
            {
                if (!(this.GetInternalCache().opArrow().HasSocialInteraction(::GetOwnerEntityId(this.GetSpot().opArrow()))))
                {
                    return false;
                }
            }
            return this.GetNameDisplayRule() && this.GetNameDisplayRule().opArrow().GetbMatchesDisplayRule();
        }
        return false;
    }
    bool ShouldShowHPBar() const
    {
        return true;
    }
    bool ShouldShowEnergy() const
    {
        return this.GetEnergyDisplayRule() && this.GetEnergyDisplayRule().opArrow().GetbMatchesDisplayRule();
    }
    bool ShouldShowHitStunDetach() const
    {
        int local_13;
        int local_22 = 0;
        bool local_26;
        TEUIModelRef<FM_Spot> local_6 = this.GetSpot();
        FECSEntity local_12 = FECSEntity(::GetOwnerEntityId());
        if (local_12.IsValid())
        {
            FECSWorldPtr local_16 = local_12.GetWorld();
            if (!(local_22))
            {
                local_26 = false;
            }
            else
            {
                if ((int(local_22.GetGameModeType())) == 2)
                {
                    local_13 = 1;
                }
                else
                {
                    local_26 = (int(local_22.GetGameModeType()) == 1);
                    local_13 = local_26;
                }
                local_26 = (local_13 != 0);
            }
            return local_26;
        }
        return false;
    }
    TEUIModelRef<FM_Spot> GetSpot() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Spot;
    }
    void SetSpot(const TEUIModelRef<FM_Spot> &inout __Value) property
    {
        TEUIModelRef<FM_Spot> local_2;
        local_2 = this.m_Spot;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Spot = __Value;
        return;
    }
    const FEUIModelContainer GetSpotData() const property
    {
        const FEUIModelContainer __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FEUIModelContainer GetModify_SpotData() property
    {
        FEUIModelContainer __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetSpotData(const FEUIModelContainer &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SpotData = __Value;
        return;
    }
    TEUIModelRef<FVM_PresentationDisplayRule> GetAlwaysShowIconRule() const property
    {
        this.TrackPropertyRead(2);
        return this.m_AlwaysShowIconRule;
    }
    void SetAlwaysShowIconRule(const TEUIModelRef<FVM_PresentationDisplayRule> &inout __Value) property
    {
        TEUIModelRef<FVM_PresentationDisplayRule> local_2;
        local_2 = this.m_AlwaysShowIconRule;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_AlwaysShowIconRule = __Value;
        return;
    }
    TEUIModelRef<FVM_PresentationDisplayRule> GetNameDisplayRule() const property
    {
        this.TrackPropertyRead(3);
        return this.m_NameDisplayRule;
    }
    void SetNameDisplayRule(const TEUIModelRef<FVM_PresentationDisplayRule> &inout __Value) property
    {
        TEUIModelRef<FVM_PresentationDisplayRule> local_2;
        local_2 = this.m_NameDisplayRule;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_NameDisplayRule = __Value;
        return;
    }
    TEUIModelRef<FVM_PresentationDisplayRule> GetEnergyDisplayRule() const property
    {
        this.TrackPropertyRead(4);
        return this.m_EnergyDisplayRule;
    }
    void SetEnergyDisplayRule(const TEUIModelRef<FVM_PresentationDisplayRule> &inout __Value) property
    {
        TEUIModelRef<FVM_PresentationDisplayRule> local_2;
        local_2 = this.m_EnergyDisplayRule;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_EnergyDisplayRule = __Value;
        return;
    }
    TEUIModelRef<FVMS_HeadsUpDisplayItem_Interaction_InternalCache> GetInternalCache() const property
    {
        this.TrackPropertyRead(5);
        return this.m_InternalCache;
    }
    void SetInternalCache(const TEUIModelRef<FVMS_HeadsUpDisplayItem_Interaction_InternalCache> &inout __Value) property
    {
        TEUIModelRef<FVMS_HeadsUpDisplayItem_Interaction_InternalCache> local_2;
        local_2 = this.m_InternalCache;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_InternalCache = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_HeadsUpDisplay
{
    UPROPERTY()
    EHeadsUpDisplayType DisplayType;
    UPROPERTY()
    float DistanceToPlayer;
    UPROPERTY()
    FText DistanceText;
    UPROPERTY()
    bool ShouldShowIcon;
    UPROPERTY()
    bool ShouldShowName;
    UPROPERTY()
    bool ShouldShowHPBar;
    UPROPERTY()
    bool ShouldShowEnergy;
    UPROPERTY()
    bool ShouldShowHitStunDetach;
    UPROPERTY()
    TEUIModelRef<FVM_HeadsUpDisplay> Self;


}

namespace FVM_HeadsUpDisplay
{
FVM_HeadsUpDisplay& Create(const UObject ContextObject, const TEUIModelRef<FM_Spot> &inout Spot)
{
    return FVM_HeadsUpDisplay::CreateByManager(EUIInternal::GetContextManager(ContextObject), Spot);
}
FVM_HeadsUpDisplay CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Spot> &inout Spot)
{
    FVM_HeadsUpDisplay __r;
    TEUIModelRef<FVM_HeadsUpDisplay> local_6 = TEUIModelRef<FVM_HeadsUpDisplay>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_HeadsUpDisplay::ModelId, 0, Spot));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "SpotData";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayType";
    local_14.TypeName = "EHeadsUpDisplayType";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DistanceToPlayer";
    local_14.TypeName = "float64";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DistanceText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShouldShowIcon";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShouldShowName";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShouldShowHPBar";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShouldShowEnergy";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShouldShowHitStunDetach";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_HeadsUpDisplay>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_HeadsUpDisplay;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_HeadsUpDisplay;
}
FEUIModelContainer __UIGetter_SpotData(const FVM_HeadsUpDisplay &inout Model)
{
    return Model.GetSpotData();
}
EHeadsUpDisplayType __UIGetter_DisplayType(const FVM_HeadsUpDisplay &inout Model)
{
    return Model.GetDisplayType();
}
float __UIGetter_DistanceToPlayer(const FVM_HeadsUpDisplay &inout Model)
{
    return Model.GetDistanceToPlayer();
}
FText __UIGetter_DistanceText(const FVM_HeadsUpDisplay &inout Model)
{
    return Model.GetDistanceText();
}
bool __UIGetter_ShouldShowIcon(const FVM_HeadsUpDisplay &inout Model)
{
    return Model.ShouldShowIcon();
}
bool __UIGetter_ShouldShowName(const FVM_HeadsUpDisplay &inout Model)
{
    return Model.ShouldShowName();
}
bool __UIGetter_ShouldShowHPBar(const FVM_HeadsUpDisplay &inout Model)
{
    return Model.ShouldShowHPBar();
}
bool __UIGetter_ShouldShowEnergy(const FVM_HeadsUpDisplay &inout Model)
{
    return Model.ShouldShowEnergy();
}
bool __UIGetter_ShouldShowHitStunDetach(const FVM_HeadsUpDisplay &inout Model)
{
    return Model.ShouldShowHitStunDetach();
}
TEUIModelRef<FVM_HeadsUpDisplay> __UIGetter_Self(const FVM_HeadsUpDisplay &inout Model)
{
    return TEUIModelRef<FVM_HeadsUpDisplay>(Model);
}
int __IndexOf_Spot()
{
    return 0;
}
int __IndexOf_SpotData()
{
    return 1;
}
int __IndexOf_AlwaysShowIconRule()
{
    return 2;
}
int __IndexOf_NameDisplayRule()
{
    return 3;
}
int __IndexOf_EnergyDisplayRule()
{
    return 4;
}
int __IndexOf_InternalCache()
{
    return 5;
}
}
namespace __GeneratedProperties_FVM_HeadsUpDisplay
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
