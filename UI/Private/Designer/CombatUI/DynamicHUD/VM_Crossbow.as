
namespace FVMS_Crossbow
{
    const int ModelId = 0;

}
struct FVMS_Crossbow : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    bool m_PanelVisible;
    UPROPERTY()
    int m_ItemNumber;

    FVMS_Crossbow()
    {
        this.m_PanelVisible = false;
        this.m_ItemNumber = -1;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_Crossbow(const FVMS_Crossbow &inout Other)
    {
        this.m_PanelVisible = false;
        this.m_ItemNumber = -1;
        this.m_PanelVisible = Other.m_PanelVisible;
        this.m_ItemNumber = int(Other.m_ItemNumber);
        return;
    }
    FVMS_Crossbow opAssign(const FVMS_Crossbow &inout Other)
    {
        FVMS_Crossbow __r;
        this.m_PanelVisible = Other.m_PanelVisible;
        this.m_ItemNumber = int(Other.m_ItemNumber);
        return __r;
    }
    void Tick()
    {
        FECSEntity local_12 = ::FASCommonUtils::GetUniqueAvatarPawnEntity(this.GetContext().GetLocalPlayerPawn());
        if (!(local_12.IsValid()))
        {
            this.SetPanelVisible(false);
            return;
        }
        if (local_12.MatchGameplayTag(GameplayTags::CombatState_Special_Crossbow))
        {
            this.SetPanelVisible(true);
            UCombatGlobalSettings local_16 = ::UCombatGlobalSettings::Get();
            TDataObjectPtr<FItemConfig> local_40;
            this.SetItemNumber(::InventoryUtils::GetInventoryItemNumber(local_12, local_40));
        }
        else
        {
            this.SetPanelVisible(false);
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
    int GetItemNumber() const property
    {
        this.TrackPropertyRead(1);
        return this.m_ItemNumber;
    }
    void SetItemNumber(const int __Value) property
    {
        if (this.m_ItemNumber == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ItemNumber = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_Crossbow
{
    UPROPERTY()
    TEUIModelRef<FVMS_Crossbow> Self;

    __GeneratedProperties_FVMS_Crossbow()
    {
        return;
    }
}

namespace FVMS_Crossbow
{
FVMS_Crossbow& Get(const UObject ContextObject)
{
    return FVMS_Crossbow::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_Crossbow GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_Crossbow __r;
    TEUIModelRef<FVMS_Crossbow> local_6 = TEUIModelRef<FVMS_Crossbow>(EUIInternal::MakeModelWithManager(Manager, FVMS_Crossbow::ModelId));
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
    local_14.TypeName = "TEUIModelRef<FVMS_Crossbow>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_Crossbow;
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_Crossbow;
}
void __Tick(FVMS_Crossbow &inout Model)
{
    Model.Tick();
    return;
}
bool __UIGetter_PanelVisible(const FVMS_Crossbow &inout Model)
{
    return Model.GetPanelVisible();
}
TEUIModelRef<FVMS_Crossbow> __UIGetter_Self(const FVMS_Crossbow &inout Model)
{
    return TEUIModelRef<FVMS_Crossbow>(Model);
}
int __IndexOf_PanelVisible()
{
    return 0;
}
int __IndexOf_ItemNumber()
{
    return 1;
}
}
namespace __GeneratedProperties_FVMS_Crossbow
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
