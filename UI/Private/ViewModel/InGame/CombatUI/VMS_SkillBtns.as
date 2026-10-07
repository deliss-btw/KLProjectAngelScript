
namespace FVMS_SkillBts
{
    const int ModelId = 0;

}
struct FVMS_SkillBts : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    ESlateVisibility m_CachedVisibility;

    FVMS_SkillBts()
    {
        this.m_CachedVisibility = ESlateVisibility(1);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_SkillBts(const FVMS_SkillBts &inout Other)
    {
        this.m_CachedVisibility = ESlateVisibility(1);
        this.m_CachedVisibility = Other.m_CachedVisibility;
        return;
    }
    FVMS_SkillBts opAssign(const FVMS_SkillBts &inout Other)
    {
        FVMS_SkillBts __r;
        this.m_CachedVisibility = Other.m_CachedVisibility;
        return __r;
    }
    void PostConstruct()
    {
        return;
    }
    void Tick()
    {
        return;
    }
    ESlateVisibility SkillBtnsPanelVisibility() const
    {
        int local_2;
        if (UICommonUtil::CVar_UI_DebugEnableNewSkillBtns.GetBool())
        {
            local_2 = 0;
        }
        else
        {
            local_2 = 2;
        }
        return ESlateVisibility(local_2);
    }
    ESlateVisibility GetCachedVisibility() const property
    {
        this.TrackPropertyRead(0);
        return this.m_CachedVisibility;
    }
    void SetCachedVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_CachedVisibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_CachedVisibility = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_SkillBts
{
    UPROPERTY()
    ESlateVisibility SkillBtnsPanelVisibility;
    UPROPERTY()
    TEUIModelRef<FVMS_SkillBts> Self;


}

namespace FVMS_SkillBts
{
FVMS_SkillBts& Get(const UObject ContextObject)
{
    return FVMS_SkillBts::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_SkillBts GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_SkillBts __r;
    TEUIModelRef<FVMS_SkillBts> local_6 = TEUIModelRef<FVMS_SkillBts>(EUIInternal::MakeModelWithManager(Manager, FVMS_SkillBts::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "SkillBtnsPanelVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_SkillBts>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_SkillBts;
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_SkillBts;
}
void __Tick(FVMS_SkillBts &inout Model)
{
    Model.Tick();
    return;
}
ESlateVisibility __UIGetter_SkillBtnsPanelVisibility(const FVMS_SkillBts &inout Model)
{
    return Model.SkillBtnsPanelVisibility();
}
TEUIModelRef<FVMS_SkillBts> __UIGetter_Self(const FVMS_SkillBts &inout Model)
{
    return TEUIModelRef<FVMS_SkillBts>(Model);
}
int __IndexOf_CachedVisibility()
{
    return 0;
}
}
namespace __GeneratedProperties_FVMS_SkillBts
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
