
enum EPresentationDisplayRuleIndex
{
    HeadsUpDisplay_NameDisplayRule,
    HeadsUpDisplay_AlwaysShowIconRule,
    HeadsUpDisplay_EnergyDisplayRule,
    Indicator_DistanceTextDisplayRule,
}

namespace FVM_PresentationDisplayRule
{
    const int ModelId = 0;

}
struct FVM_PresentationDisplayRule : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Spot> m_Spot;
    UPROPERTY()
    EPresentationDisplayRuleIndex m_Index;
    UPROPERTY()
    bool m_bMatchesDisplayRule;

    FVM_PresentationDisplayRule()
    {
        this.m_Index = EPresentationDisplayRuleIndex(0);
        this.m_bMatchesDisplayRule = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_PresentationDisplayRule' by default constructor.");
        return;
    }
    FVM_PresentationDisplayRule(const FVM_PresentationDisplayRule &inout Other)
    {
        this.m_Index = EPresentationDisplayRuleIndex(0);
        this.m_bMatchesDisplayRule = false;
        this.m_Spot = Other.m_Spot;
        this.m_Index = Other.m_Index;
        this.m_bMatchesDisplayRule = Other.m_bMatchesDisplayRule;
        return;
    }
    FVM_PresentationDisplayRule(const TEUIModelRef<FM_Spot> &inout InSpot, const EPresentationDisplayRuleIndex InIndex)
    {
        this.m_Index = EPresentationDisplayRuleIndex(0);
        this.m_bMatchesDisplayRule = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetSpot(InSpot);
        this.SetIndex(EPresentationDisplayRuleIndex(InIndex));
        return;
    }
    FVM_PresentationDisplayRule opAssign(const FVM_PresentationDisplayRule &inout Other)
    {
        FVM_PresentationDisplayRule __r;
        this.m_Spot = Other.m_Spot;
        this.m_Index = Other.m_Index;
        this.m_bMatchesDisplayRule = Other.m_bMatchesDisplayRule;
        return __r;
    }
    void RefreshMatchesDisplayRule()
    {
        if (!(this.GetSpot()))
        {
            this.SetbMatchesDisplayRule(false);
            return;
        }
        this.SetbMatchesDisplayRule(this.ComputeMatchesDisplayRule(this.GetRule()));
        return;
    }
    void ManualAsyncTick()
    {
        this.RefreshMatchesDisplayRule();
        return;
    }
    const FPresentationDisplayRule GetRule()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        const FPresentationDisplayRule __r; return __r;
    }
    bool ComputeMatchesDisplayRule(const FPresentationDisplayRule &inout DisplayRule)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        bool __r; return __r;
    }
    bool MatchesDisplayRuleBasic(const FPresentationDisplayRuleBasic &inout BasicRule, const FVector &inout RulePlayerPosition)
    {
        if (!(BasicRule.bEnableDisplay))
        {
            return false;
        }
        return this.MatchesDistanceRule(BasicRule.MinDistance, BasicRule.MaxDistance, RulePlayerPosition);
    }
    bool MatchesDistanceRule(const float MinDistance, const float MaxDistance, const FVector &inout RulePlayerPosition)
    {
        float local_10 = ::PresentationSpotUtils::GetSpotLocation(this.GetSpot()).DistSquared(RulePlayerPosition);
        if (local_10 < FMath::Square(MinDistance))
        {
            return false;
        }
        if (MaxDistance > 0.0 && (local_10 > FMath::Square(MaxDistance)))
        {
            return false;
        }
        return true;
    }
    int FindFirstMatchDisplayRuleIndex(const TArray<FPresentationDisplayConditionalRule> &inout ConditionalRules)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
    }
    bool ConditionRequirementToBool(const EPresentationDisplayConditionRequirement Requirement)
    {
        switch (int(Requirement))
        {
            case 1:
                return true;
            case 2:
                return false;
            default:
                return false;
        }
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
    EPresentationDisplayRuleIndex GetIndex() const property
    {
        this.TrackPropertyRead(1);
        return this.m_Index;
    }
    void SetIndex(const EPresentationDisplayRuleIndex __Value) property
    {
        if (int(this.m_Index) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Index = __Value;
        return;
    }
    bool GetbMatchesDisplayRule() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bMatchesDisplayRule;
    }
    void SetbMatchesDisplayRule(const bool __Value) property
    {
        if (!(this.m_bMatchesDisplayRule) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bMatchesDisplayRule = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_PresentationDisplayRule
{
    UPROPERTY()
    TEUIModelRef<FVM_PresentationDisplayRule> Self;

    __GeneratedProperties_FVM_PresentationDisplayRule()
    {
        return;
    }
}

namespace FVM_PresentationDisplayRule
{
FVM_PresentationDisplayRule& Create(const UObject ContextObject, const TEUIModelRef<FM_Spot> &inout Spot, const EPresentationDisplayRuleIndex Index)
{
    return FVM_PresentationDisplayRule::CreateByManager(EUIInternal::GetContextManager(ContextObject), Spot);
}
FVM_PresentationDisplayRule CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Spot> &inout Spot, const EPresentationDisplayRuleIndex Index)
{
    FVM_PresentationDisplayRule __r;
    TEUIModelRef<FVM_PresentationDisplayRule> local_6 = TEUIModelRef<FVM_PresentationDisplayRule>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_PresentationDisplayRule::ModelId, 0, Spot, Index));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "bMatchesDisplayRule";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_PresentationDisplayRule>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_PresentationDisplayRule;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_PresentationDisplayRule;
}
bool __UIGetter_bMatchesDisplayRule(const FVM_PresentationDisplayRule &inout Model)
{
    return Model.GetbMatchesDisplayRule();
}
TEUIModelRef<FVM_PresentationDisplayRule> __UIGetter_Self(const FVM_PresentationDisplayRule &inout Model)
{
    return TEUIModelRef<FVM_PresentationDisplayRule>(Model);
}
int __IndexOf_Spot()
{
    return 0;
}
int __IndexOf_Index()
{
    return 1;
}
int __IndexOf_bMatchesDisplayRule()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_PresentationDisplayRule
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
