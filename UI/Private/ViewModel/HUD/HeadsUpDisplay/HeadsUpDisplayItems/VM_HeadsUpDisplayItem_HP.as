
namespace FVM_HeadsUpDisplayItem_HP
{
    const int ModelId = 0;

}
struct FVM_HeadsUpDisplayItem_HP : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Spot> m_Spot;
    UPROPERTY()
    TEUIModelRef<FVM_MiniHPBarV2> m_MiniHpBar;
    UPROPERTY()
    FECSEntity m_ValidPawnEntity;

    FVM_HeadsUpDisplayItem_HP()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_HeadsUpDisplayItem_HP' by default constructor.");
        return;
    }
    FVM_HeadsUpDisplayItem_HP(const FVM_HeadsUpDisplayItem_HP &inout Other)
    {
        this.m_Spot = Other.m_Spot;
        this.m_MiniHpBar = Other.m_MiniHpBar;
        this.m_ValidPawnEntity = Other.m_ValidPawnEntity;
        return;
    }
    FVM_HeadsUpDisplayItem_HP(const TEUIModelRef<FM_Spot> &inout InSpot)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetSpot(InSpot);
        return;
    }
    FVM_HeadsUpDisplayItem_HP& opAssign(const FVM_HeadsUpDisplayItem_HP &inout Other)
    {
        this.m_Spot = Other.m_Spot;
        this.m_MiniHpBar = Other.m_MiniHpBar;
        return Other.m_ValidPawnEntity;
    }
    void PostConstruct()
    {
        return;
    }
    ESlateVisibility GetHpBarVisibility() const
    {
        if (this.GetMiniHpBar())
        {
            return ESlateVisibility(4);
        }
        else
        {
            return ESlateVisibility(1);
        }
    }
    void Tick()
    {
        FECSEntity local_4 = FECSEntity(ENTITY_NULL);
        TEUIModelRef<FM_Spot> local_6 = this.GetSpot();
        if ((!((::GetOwnerEntityId() == ENTITY_ID_NULL))))
        {
            FECSEntity local_12 = FECSEntity(::GetOwnerEntityId(this.GetSpot().opArrow()));
            local_4 = ::FASCommonUtils::GetControlledPawnEntity(local_12);
        }
        if (local_4.IsValid())
        {
            if ((!((FECSEntity(this.GetValidPawnEntity()) == local_4))))
            {
                this.SetValidPawnEntity(local_4);
                this.RefreshShowMiniHpBar();
            }
        }
        else
        {
            this.SetValidPawnEntity(ENTITY_NULL);
            this.SetMiniHpBar(TEUIModelRef<FVM_MiniHPBarV2>(nullptr));
        }
        return;
    }
    void OnProjectileHealthConfigChanged(const FC_ProjectileHealthConfig &inout ProjectileHealthConfig)
    {
        this.RefreshShowMiniHpBar();
        return;
    }
    void OnMiniHPBarConfigChanged(const FC_MiniHPBarConfig &inout MiniHpBarConfig)
    {
        this.RefreshShowMiniHpBar();
        return;
    }
    void RefreshShowMiniHpBar()
    {
        if (!(this.GetValidPawnEntity().IsValid()))
        {
            return;
        }
        if (this.CheckValidPawnEntityShouldShowMiniHpBar())
        {
            if (!(this.GetMiniHpBar()) || !((FECSEntity(this.GetMiniHpBar().opArrow().GetEntity()) == this.GetValidPawnEntity())))
            {
                this.SetMiniHpBar(TEUIModelRef<FVM_MiniHPBarV2>(::FVM_MiniHPBarV2::Create(this.GetManager(), this.GetValidPawnEntity(), 0.7f)));
            }
            return;
        }
        this.SetMiniHpBar(TEUIModelRef<FVM_MiniHPBarV2>(nullptr));
        return;
    }
    bool CheckValidPawnEntityShouldShowMiniHpBar()
    {
        bool local_1;
        local_1 = true;
        FECSEntity local_6 = FECSEntity(this.GetValidPawnEntity());
        if (!(local_6.IsValid()))
        {
            local_1 = false;
        }
        else
        {
            Get local_10;
            const FC_ProjectileHealthConfig& local_12 = local_10.opCall();
            if (local_12)
            {
                local_1 = local_12.bShowUI;
            }
            else
            {
                FC_MiniHPBarConfig local_18;
                if (::FASCommonUtils::IsBossPrefab(local_6))
                {
                    local_1 = false;
                }
                if (!(local_18) || !(local_18.HasMiniHPBar))
                {
                    local_1 = false;
                }
                else
                {
                    Get local_24;
                    const FC_GameAttributeView& local_26 = local_24.opCall();
                    if (local_26)
                    {
                        FGameAttributeRef local_40;
                        FGameAttributeRef local_54;
                        if (local_18.bUseEnvBreakHPAttribute)
                        {
                            local_40 = Attribute::EnvBreakHPMax;
                            local_54 = Attribute::EnvBreakHP;
                        }
                        else
                        {
                            local_40 = Attribute::HPMax;
                            local_54 = Attribute::HP;
                        }
                        if (!(local_26.HasAttribute(local_54)) || !(local_26.HasAttribute(local_40)))
                        {
                        }
                    }
                    else
                    {
                        local_1 = false;
                    }
                }
            }
        }
        return local_1;
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
    TEUIModelRef<FVM_MiniHPBarV2> GetMiniHpBar() const property
    {
        this.TrackPropertyRead(1);
        return this.m_MiniHpBar;
    }
    void SetMiniHpBar(const TEUIModelRef<FVM_MiniHPBarV2> &inout __Value) property
    {
        TEUIModelRef<FVM_MiniHPBarV2> local_2;
        local_2 = this.m_MiniHpBar;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_MiniHpBar = __Value;
        return;
    }
    const FECSEntity GetValidPawnEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FECSEntity GetModify_ValidPawnEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetValidPawnEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_ValidPawnEntity = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_HeadsUpDisplayItem_HP
{
    UPROPERTY()
    ESlateVisibility HpBarVisibility;
    UPROPERTY()
    TEUIModelRef<FVM_HeadsUpDisplayItem_HP> Self;


}

namespace FVM_HeadsUpDisplayItem_HP
{
FVM_HeadsUpDisplayItem_HP& Create(const UObject ContextObject, const TEUIModelRef<FM_Spot> &inout Spot)
{
    return FVM_HeadsUpDisplayItem_HP::CreateByManager(EUIInternal::GetContextManager(ContextObject), Spot);
}
FVM_HeadsUpDisplayItem_HP CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Spot> &inout Spot)
{
    FVM_HeadsUpDisplayItem_HP __r;
    TEUIModelRef<FVM_HeadsUpDisplayItem_HP> local_6 = TEUIModelRef<FVM_HeadsUpDisplayItem_HP>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_HeadsUpDisplayItem_HP::ModelId, 0, Spot));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "MiniHpBar";
    local_14.TypeName = "TEUIModelRef<FVM_MiniHPBarV2>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HpBarVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_HeadsUpDisplayItem_HP>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_HeadsUpDisplayItem_HP;
    Result.TickFunction.FunctionName = "__Tick";
    FEUIModelMonitorDefine local_26;
    local_26.FunctionName = "__OnProjectileHealthConfigChanged";
    local_26.ComponentType = FC_ProjectileHealthConfig;
    local_26.MonitorPropertyName = FName("ValidPawnEntity");
    int local_2_2 = FVM_HeadsUpDisplayItem_HP::__IndexOf_ValidPawnEntity();
    Result.MonitorFunctions.Add(local_26);
    local_26.FunctionName = "__OnMiniHPBarConfigChanged";
    local_26.ComponentType = FC_MiniHPBarConfig;
    local_26.MonitorPropertyName = FName("ValidPawnEntity");
    int local_2_3 = FVM_HeadsUpDisplayItem_HP::__IndexOf_ValidPawnEntity();
    Result.MonitorFunctions.Add(local_26);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_HeadsUpDisplayItem_HP;
}
void __Tick(FVM_HeadsUpDisplayItem_HP &inout Model)
{
    Model.Tick();
    return;
}
void __OnProjectileHealthConfigChanged(FVM_HeadsUpDisplayItem_HP &inout Model, const FECSEntity &inout Entity, const FC_ProjectileHealthConfig &inout Component)
{
    Model.OnProjectileHealthConfigChanged(Component);
    return;
}
void __OnMiniHPBarConfigChanged(FVM_HeadsUpDisplayItem_HP &inout Model, const FECSEntity &inout Entity, const FC_MiniHPBarConfig &inout Component)
{
    Model.OnMiniHPBarConfigChanged(Component);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
TEUIModelRef<FVM_MiniHPBarV2> __UIGetter_MiniHpBar(const FVM_HeadsUpDisplayItem_HP &inout Model)
{
    return Model.GetMiniHpBar();
}
ESlateVisibility __UIGetter_HpBarVisibility(const FVM_HeadsUpDisplayItem_HP &inout Model)
{
    return Model.GetHpBarVisibility();
}
TEUIModelRef<FVM_HeadsUpDisplayItem_HP> __UIGetter_Self(const FVM_HeadsUpDisplayItem_HP &inout Model)
{
    return TEUIModelRef<FVM_HeadsUpDisplayItem_HP>(Model);
}
int __IndexOf_Spot()
{
    return 0;
}
int __IndexOf_MiniHpBar()
{
    return 1;
}
int __IndexOf_ValidPawnEntity()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_HeadsUpDisplayItem_HP
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
