
namespace FVM_CommissionTier
{
    const int ModelId = 0;

}
struct FVM_CommissionTier : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_CommissionTier> m_CommissionTier;
    UPROPERTY()
    ECommissionTier m_SpecifiedHighlightedTier;

    FVM_CommissionTier()
    {
        this.m_SpecifiedHighlightedTier = ECommissionTier(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommissionTier' by default constructor.");
        return;
    }
    FVM_CommissionTier(const FVM_CommissionTier &inout Other)
    {
        this.m_SpecifiedHighlightedTier = ECommissionTier(0);
        this.m_CommissionTier = Other.m_CommissionTier;
        this.m_SpecifiedHighlightedTier = Other.m_SpecifiedHighlightedTier;
        return;
    }
    FVM_CommissionTier(const TEUIModelRef<FM_CommissionTier> &inout InCommissionTier)
    {
        this.m_SpecifiedHighlightedTier = ECommissionTier(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetCommissionTier(InCommissionTier);
        this.SetSpecifiedHighlightedTier(ECommissionTier(0));
        return;
    }
    FVM_CommissionTier(const TEUIModelRef<FM_CommissionTier> &inout InCommissionTier, const ECommissionTier InSpecifiedHighlightedTier)
    {
        this.m_SpecifiedHighlightedTier = ECommissionTier(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetCommissionTier(InCommissionTier);
        this.SetSpecifiedHighlightedTier(ECommissionTier(InSpecifiedHighlightedTier));
        return;
    }
    FVM_CommissionTier opAssign(const FVM_CommissionTier &inout Other)
    {
        FVM_CommissionTier __r;
        this.m_CommissionTier = Other.m_CommissionTier;
        this.m_SpecifiedHighlightedTier = Other.m_SpecifiedHighlightedTier;
        return __r;
    }
    FText GetTierName() const
    {
        if (!(this.GetCommissionTier().opArrow().GetCommissionTierConfig()))
        {
            return FText();
        }
        return this.GetCommissionTier().opArrow().GetCommissionTierConfig().opArrow().TierName;
    }
    FLinearColor GetTierColor() const
    {
        if (!(this.GetCommissionTier().opArrow().GetCommissionTierConfig()))
        {
            return FLinearColor::White;
        }
        return this.GetCommissionTier().opArrow().GetCommissionTierConfig().opArrow().TierColor;
    }
    bool IsHighestAchieved() const
    {
        return this.GetCommissionTier().opArrow().GetbIsHighestAchieved();
    }
    bool IsHighlighted() const
    {
        if (int(this.GetSpecifiedHighlightedTier()) == 0)
        {
            return this.IsHighestAchieved();
        }
        int local_2 = int(this.GetCommissionTier().opArrow().GetTier());
        int local_3 = int(this.GetSpecifiedHighlightedTier());
        return (local_2 == local_3);
    }
    FText GetTimeLimitText() const
    {
        return this.GetCommissionTier().opArrow().GetTimeLimitText();
    }
    int GetTierIndex() const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        int __r; return __r;
    }
    TEUIModelRef<FM_CommissionTier> GetCommissionTier() const property
    {
        this.TrackPropertyRead(0);
        return this.m_CommissionTier;
    }
    void SetCommissionTier(const TEUIModelRef<FM_CommissionTier> &inout __Value) property
    {
        TEUIModelRef<FM_CommissionTier> local_2;
        local_2 = this.m_CommissionTier;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CommissionTier = __Value;
        return;
    }
    ECommissionTier GetSpecifiedHighlightedTier() const property
    {
        this.TrackPropertyRead(1);
        return this.m_SpecifiedHighlightedTier;
    }
    void SetSpecifiedHighlightedTier(const ECommissionTier __Value) property
    {
        if (int(this.m_SpecifiedHighlightedTier) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SpecifiedHighlightedTier = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_CommissionTier
{
    UPROPERTY()
    FText TierName;
    UPROPERTY()
    FLinearColor TierColor;
    UPROPERTY()
    bool IsHighestAchieved;
    UPROPERTY()
    bool IsHighlighted;
    UPROPERTY()
    FText TimeLimitText;
    UPROPERTY()
    int TierIndex;
    UPROPERTY()
    TEUIModelRef<FVM_CommissionTier> Self;


}

namespace FVM_CommissionTier
{
FVM_CommissionTier& Create(const UObject ContextObject, const TEUIModelRef<FM_CommissionTier> &inout CommissionTier)
{
    return FVM_CommissionTier::CreateByManager(EUIInternal::GetContextManager(ContextObject), CommissionTier);
}
FVM_CommissionTier CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_CommissionTier> &inout CommissionTier)
{
    FVM_CommissionTier __r;
    TEUIModelRef<FVM_CommissionTier> local_6 = TEUIModelRef<FVM_CommissionTier>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommissionTier::ModelId, 0, CommissionTier));
    return __r;
}
FVM_CommissionTier& Create(const UObject ContextObject, const TEUIModelRef<FM_CommissionTier> &inout CommissionTier, const ECommissionTier SpecifiedHighlightedTier)
{
    return FVM_CommissionTier::CreateByManager(EUIInternal::GetContextManager(ContextObject), CommissionTier);
}
FVM_CommissionTier CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_CommissionTier> &inout CommissionTier, const ECommissionTier SpecifiedHighlightedTier)
{
    FVM_CommissionTier __r;
    TEUIModelRef<FVM_CommissionTier> local_6 = TEUIModelRef<FVM_CommissionTier>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommissionTier::ModelId, 1, CommissionTier, SpecifiedHighlightedTier));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TierName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TierColor";
    local_14.TypeName = "FLinearColor";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsHighestAchieved";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsHighlighted";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TimeLimitText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TierIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommissionTier>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommissionTier;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommissionTier;
}
FText __UIGetter_TierName(const FVM_CommissionTier &inout Model)
{
    return Model.GetTierName();
}
FLinearColor __UIGetter_TierColor(const FVM_CommissionTier &inout Model)
{
    return Model.GetTierColor();
}
bool __UIGetter_IsHighestAchieved(const FVM_CommissionTier &inout Model)
{
    return Model.IsHighestAchieved();
}
bool __UIGetter_IsHighlighted(const FVM_CommissionTier &inout Model)
{
    return Model.IsHighlighted();
}
FText __UIGetter_TimeLimitText(const FVM_CommissionTier &inout Model)
{
    return Model.GetTimeLimitText();
}
int __UIGetter_TierIndex(const FVM_CommissionTier &inout Model)
{
    return Model.GetTierIndex();
}
TEUIModelRef<FVM_CommissionTier> __UIGetter_Self(const FVM_CommissionTier &inout Model)
{
    return TEUIModelRef<FVM_CommissionTier>(Model);
}
int __IndexOf_CommissionTier()
{
    return 0;
}
int __IndexOf_SpecifiedHighlightedTier()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_CommissionTier
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
