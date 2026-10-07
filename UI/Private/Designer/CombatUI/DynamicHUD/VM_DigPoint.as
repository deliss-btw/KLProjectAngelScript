
namespace FVMS_DigPoint
{
    const int ModelId = 0;

}
struct FVMS_DigPoint : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    bool m_PanelVisible;

    FVMS_DigPoint()
    {
        this.m_PanelVisible = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_DigPoint(const FVMS_DigPoint &inout Other)
    {
        this.m_PanelVisible = false;
        this.m_PanelVisible = Other.m_PanelVisible;
        return;
    }
    FVMS_DigPoint opAssign(const FVMS_DigPoint &inout Other)
    {
        FVMS_DigPoint __r;
        this.m_PanelVisible = Other.m_PanelVisible;
        return __r;
    }
    void Tick()
    {
        this.SetPanelVisible(false);
        FECSEntity local_6 = FECSEntity(this.GetContext().GetLocalPlayerPawn());
        if (local_6.IsValid() && local_6.MatchGameplayTag(GameplayTags::Interact_Dig))
        {
            this.SetPanelVisible(true);
        }
        return;
    }
    ESlateVisibility PanelVisibleAsSlateVisibility() const
    {
        int local_2;
        if (this.PanelVisibleAsBool())
        {
            local_2 = 0;
        }
        else
        {
            local_2 = 1;
        }
        return ESlateVisibility(local_2);
    }
    bool PanelVisibleAsBool() const
    {
        return this.GetPanelVisible() || false;
    }
    bool GetPanelVisible() const property
    {
        this.TrackPropertyRead(0);
        return this.m_PanelVisible;
    }
    void SetPanelVisible(const bool __Value) property
    {
        if (!(this.m_PanelVisible) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_PanelVisible = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_DigPoint
{
    UPROPERTY()
    TEUIModelRef<FVMS_DigPoint> Self;

    __GeneratedProperties_FVMS_DigPoint()
    {
        return;
    }
}

namespace FVMS_DigPoint
{
FVMS_DigPoint& Get(const UObject ContextObject)
{
    return FVMS_DigPoint::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_DigPoint GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_DigPoint __r;
    TEUIModelRef<FVMS_DigPoint> local_6 = TEUIModelRef<FVMS_DigPoint>(EUIInternal::MakeModelWithManager(Manager, FVMS_DigPoint::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "PanelVisible";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_DigPoint>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_DigPoint;
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_DigPoint;
}
void __Tick(FVMS_DigPoint &inout Model)
{
    Model.Tick();
    return;
}
bool __UIGetter_PanelVisible(const FVMS_DigPoint &inout Model)
{
    return Model.GetPanelVisible();
}
TEUIModelRef<FVMS_DigPoint> __UIGetter_Self(const FVMS_DigPoint &inout Model)
{
    return TEUIModelRef<FVMS_DigPoint>(Model);
}
int __IndexOf_PanelVisible()
{
    return 0;
}
}
namespace __GeneratedProperties_FVMS_DigPoint
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
