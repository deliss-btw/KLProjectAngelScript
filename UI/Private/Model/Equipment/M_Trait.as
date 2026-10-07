
namespace FM_Trait
{
    const int ModelId = 0;

}
struct FM_Trait : FEUIModel
{
    FEUIModel _base_FEUIModel;
    UPROPERTY()
    TDataObjectPtr<FTraitConfig> m_TraitConfig;
    UPROPERTY()
    int m_TraitLevel;
    UPROPERTY()
    bool m_bIsRandomTrait;

    FM_Trait()
    {
        this.m_TraitLevel = 0;
        this.m_bIsRandomTrait = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FM_Trait' by default constructor.");
        return;
    }
    FM_Trait(const FM_Trait &inout Other)
    {
        this.m_TraitLevel = 0;
        this.m_bIsRandomTrait = false;
        this.m_TraitConfig = Other.m_TraitConfig;
        this.m_TraitLevel = int(Other.m_TraitLevel);
        this.m_bIsRandomTrait = Other.m_bIsRandomTrait;
        return;
    }
    FM_Trait(const TDataObjectPtr<FTraitConfig> &inout InTraitConfig, const int InTraitLevel)
    {
        this.m_TraitLevel = 0;
        this.m_bIsRandomTrait = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTraitConfig(InTraitConfig);
        this.SetTraitLevel(InTraitLevel);
        return;
    }
    FM_Trait opAssign(const FM_Trait &inout Other)
    {
        FM_Trait __r;
        this.m_TraitConfig = Other.m_TraitConfig;
        this.m_TraitLevel = int(Other.m_TraitLevel);
        this.m_bIsRandomTrait = Other.m_bIsRandomTrait;
        return __r;
    }
    FText GetTraitDescription() const
    {
        FText __return;
        if (unresolved.ModifiersByLevel.Contains(this.GetTraitLevel()))
        {
            int local_1 = this.GetTraitLevel();
        }
        else
        {
            if (unresolved.CapabilitiesByLevel.Contains(this.GetTraitLevel()))
            {
                int local_1_2 = this.GetTraitLevel();
            }
            else
            {
                __return = FText();
            }
        }
        return __return;
    }
    TDataObjectPtr<FTraitConfig> GetTraitConfig() const property
    {
        TDataObjectPtr<FTraitConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FTraitConfig> GetModify_TraitConfig() property
    {
        TDataObjectPtr<FTraitConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTraitConfig(const TDataObjectPtr<FTraitConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TraitConfig = __Value;
        return;
    }
    int GetTraitLevel() const property
    {
        this.TrackPropertyRead(1);
        return this.m_TraitLevel;
    }
    void SetTraitLevel(const int __Value) property
    {
        if (this.m_TraitLevel == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TraitLevel = __Value;
        return;
    }
    bool GetbIsRandomTrait() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bIsRandomTrait;
    }
    void SetbIsRandomTrait(const bool __Value) property
    {
        if (!(this.m_bIsRandomTrait) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bIsRandomTrait = __Value;
        return;
    }
}

namespace FM_Trait
{
FM_Trait& Create(const UObject ContextObject, const TDataObjectPtr<FTraitConfig> &inout TraitConfig, const int TraitLevel)
{
    return FM_Trait::CreateByManager(EUIInternal::GetContextManager(ContextObject), TraitConfig, TraitLevel);
}
FM_Trait CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FTraitConfig> &inout TraitConfig, const int TraitLevel)
{
    FM_Trait __r;
    TEUIModelRef<FM_Trait> local_6 = TEUIModelRef<FM_Trait>(EUIInternal::MakeModelWithManager_Generic(Manager, FM_Trait::ModelId, 0, TraitConfig, TraitLevel));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    return;
}
UScriptStruct GetModelStruct()
{
    return FM_Trait;
}
int __IndexOf_TraitConfig()
{
    return 0;
}
int __IndexOf_TraitLevel()
{
    return 1;
}
int __IndexOf_bIsRandomTrait()
{
    return 2;
}
}
