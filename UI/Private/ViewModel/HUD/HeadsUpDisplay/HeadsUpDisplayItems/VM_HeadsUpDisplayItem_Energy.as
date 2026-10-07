
namespace FVM_HeadsUpDisplayItem_Energy
{
    const int ModelId = 0;

}
struct FVM_HeadsUpDisplayItem_Energy : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Spot> m_Spot;
    UPROPERTY()
    ESlateVisibility m_Visibility;
    UPROPERTY()
    float32 m_EnergyRatio;
    UPROPERTY()
    FMW_AttributeRatio m_EnergySource;
    UPROPERTY()
    FECSEntity m_ValidEntity;

    FVM_HeadsUpDisplayItem_Energy()
    {
        this.m_EnergyRatio = 0.0f;
        this.m_Visibility = ESlateVisibility(1);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_HeadsUpDisplayItem_Energy' by default constructor.");
        return;
    }
    FVM_HeadsUpDisplayItem_Energy(const FVM_HeadsUpDisplayItem_Energy &inout Other)
    {
        this.m_EnergyRatio = 0.0f;
        this.m_Visibility = ESlateVisibility(1);
        this.m_Spot = Other.m_Spot;
        this.m_Visibility = Other.m_Visibility;
        this.m_EnergyRatio = Other.m_EnergyRatio;
        this.m_EnergySource = Other.m_EnergySource;
        this.m_ValidEntity = Other.m_ValidEntity;
        return;
    }
    FVM_HeadsUpDisplayItem_Energy(const TEUIModelRef<FM_Spot> &inout InSpot)
    {
        this.m_EnergyRatio = 0.0f;
        this.m_Visibility = ESlateVisibility(1);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetSpot(InSpot);
        return;
    }
    FVM_HeadsUpDisplayItem_Energy& opAssign(const FVM_HeadsUpDisplayItem_Energy &inout Other)
    {
        this.m_Spot = Other.m_Spot;
        this.m_Visibility = Other.m_Visibility;
        this.m_EnergyRatio = Other.m_EnergyRatio;
        this.m_EnergySource = Other.m_EnergySource;
        return Other.m_ValidEntity;
    }
    void Tick()
    {
        FECSEntity local_4 = FECSEntity(ENTITY_NULL);
        TEUIModelRef<FM_Spot> local_6 = this.GetSpot();
        if ((!((::GetOwnerEntityId() == ENTITY_ID_NULL))))
        {
            TEUIModelRef<FM_Spot> local_6_2 = this.GetSpot();
            local_4 = FECSEntity(::GetOwnerEntityId());
        }
        if (local_4.IsValid())
        {
            FECSEntity local_12 = FECSEntity(this.GetValidEntity());
            if ((!((local_12 == local_4))))
            {
                this.SetValidEntity(local_4);
                this.BindEnergySources();
            }
        }
        else
        {
            if (this.GetValidEntity().IsValid())
            {
                this.SetValidEntity(ENTITY_NULL);
                this.GetModify_EnergySource().Reset();
            }
        }
        return;
    }
    void BindEnergySources()
    {
        bool local_79 = false;
        if ((!((::FASCommonUtils::GetUniquePlayerEntity(::BlueprintFunctions_Common::GetEntityOwner(FECSEntityAdapter(this.GetValidEntity()))) == this.GetContext().GetLocalPlayer()))))
        {
            this.GetModify_EnergySource().Reset();
            return;
        }
        TEUIModelRef<FM_Spot> local_22 = this.GetSpot();
        TDataObjectPtr<FHeadsUpDisplayConfig> local_54;
        bool local_19 = !(local_54);
        if (local_19)
        {
            local_19 = true;
        }
        else
        {
            local_79 = !local_79;
            local_19 = local_79;
        }
        if (local_19)
        {
            local_19 = true;
        }
        else
        {
            local_79 = !local_79;
            local_19 = local_79;
        }
        if (local_19)
        {
            this.GetModify_EnergySource().Reset();
            return;
        }
        return;
    }
    void RefreshEnergyDisplay()
    {
        if (this.GetEnergySource().GetMaxValue() <= 0.0f)
        {
            this.SetVisibility(ESlateVisibility(1));
            this.SetEnergyRatio(0.0f);
            return;
        }
        this.SetEnergyRatio(FMath::Clamp(this.GetEnergySource().GetRatioValue(), 0.0f, 1.0f));
        this.SetVisibility(ESlateVisibility(4));
        return;
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
    ESlateVisibility GetVisibility() const property
    {
        this.TrackPropertyRead(1);
        return this.m_Visibility;
    }
    void SetVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_Visibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Visibility = __Value;
        return;
    }
    float32 GetEnergyRatio() const property
    {
        float32 __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    float32 GetModify_EnergyRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetEnergyRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_EnergyRatio = __Value;
        return;
    }
    const FMW_AttributeRatio GetEnergySource() const property
    {
        const FMW_AttributeRatio __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FMW_AttributeRatio GetModify_EnergySource() property
    {
        FMW_AttributeRatio __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetEnergySource(const FMW_AttributeRatio &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_EnergySource = __Value;
        return;
    }
    const FECSEntity GetValidEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FECSEntity GetModify_ValidEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetValidEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_ValidEntity = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_HeadsUpDisplayItem_Energy
{
    UPROPERTY()
    TEUIModelRef<FVM_HeadsUpDisplayItem_Energy> Self;

    __GeneratedProperties_FVM_HeadsUpDisplayItem_Energy()
    {
        return;
    }
}

namespace FVM_HeadsUpDisplayItem_Energy
{
FVM_HeadsUpDisplayItem_Energy& Create(const UObject ContextObject, const TEUIModelRef<FM_Spot> &inout Spot)
{
    return FVM_HeadsUpDisplayItem_Energy::CreateByManager(EUIInternal::GetContextManager(ContextObject), Spot);
}
FVM_HeadsUpDisplayItem_Energy CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Spot> &inout Spot)
{
    FVM_HeadsUpDisplayItem_Energy __r;
    TEUIModelRef<FVM_HeadsUpDisplayItem_Energy> local_6 = TEUIModelRef<FVM_HeadsUpDisplayItem_Energy>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_HeadsUpDisplayItem_Energy::ModelId, 0, Spot));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Visibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "EnergyRatio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_HeadsUpDisplayItem_Energy>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_HeadsUpDisplayItem_Energy;
    FEUIModelWatcherProperty local_19;
    local_19.PropertyName = FName("EnergySource");
    int local_2_2 = FVM_HeadsUpDisplayItem_Energy::__IndexOf_EnergySource();
    Result.WatcherProperties.Add(local_19);
    Result.TickFunction.FunctionName = "__Tick";
    FEUIModelEffectDefine local_26;
    local_26.FunctionName = "RefreshEnergyDisplay";
    Result.EffectFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_HeadsUpDisplayItem_Energy;
}
void __Tick(FVM_HeadsUpDisplayItem_Energy &inout Model)
{
    Model.Tick();
    return;
}
ESlateVisibility __UIGetter_Visibility(const FVM_HeadsUpDisplayItem_Energy &inout Model)
{
    return Model.GetVisibility();
}
float32 __UIGetter_EnergyRatio(const FVM_HeadsUpDisplayItem_Energy &inout Model)
{
    return Model.GetEnergyRatio();
}
TEUIModelRef<FVM_HeadsUpDisplayItem_Energy> __UIGetter_Self(const FVM_HeadsUpDisplayItem_Energy &inout Model)
{
    return TEUIModelRef<FVM_HeadsUpDisplayItem_Energy>(Model);
}
int __IndexOf_Spot()
{
    return 0;
}
int __IndexOf_Visibility()
{
    return 1;
}
int __IndexOf_EnergyRatio()
{
    return 2;
}
int __IndexOf_EnergySource()
{
    return 3;
}
int __IndexOf_ValidEntity()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_HeadsUpDisplayItem_Energy
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
