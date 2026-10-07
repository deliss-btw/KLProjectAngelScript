
namespace FVM_PlayerHitStunDetachBar
{
    const int ModelId = 0;

}
struct FVM_PlayerHitStunDetachBar : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FECSEntity m_Entity;
    UPROPERTY()
    float32 m_DisplayDetachBarRatio;
    UPROPERTY()
    float32 m_DisplayPreviewDetachBarRatio;
    UPROPERTY()
    float32 m_PreviewDetachBarChaseSeconds;
    UPROPERTY()
    float32 m_PreviewDetachBarChaseSpeed;
    UPROPERTY()
    bool m_bInMaxMaintainState;
    UPROPERTY()
    int m_MaxMaintainTriggerCounter;
    UPROPERTY()
    ESlateVisibility m_DetachBarVisibility;
    UPROPERTY()
    float32 m_CachedDetachMax;

    FVM_PlayerHitStunDetachBar()
    {
        this.m_DisplayDetachBarRatio = 0.0f;
        this.m_DisplayPreviewDetachBarRatio = 0.0f;
        this.m_PreviewDetachBarChaseSpeed = 0.0f;
        this.m_PreviewDetachBarChaseSeconds = 0.7f;
        this.m_bInMaxMaintainState = false;
        this.m_MaxMaintainTriggerCounter = 0;
        this.m_DetachBarVisibility = ESlateVisibility(1);
        this.m_CachedDetachMax = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_PlayerHitStunDetachBar' by default constructor.");
        return;
    }
    FVM_PlayerHitStunDetachBar(const FVM_PlayerHitStunDetachBar &inout Other)
    {
        this.m_DisplayDetachBarRatio = 0.0f;
        this.m_DisplayPreviewDetachBarRatio = 0.0f;
        this.m_PreviewDetachBarChaseSpeed = 0.0f;
        this.m_PreviewDetachBarChaseSeconds = 0.7f;
        this.m_bInMaxMaintainState = false;
        this.m_MaxMaintainTriggerCounter = 0;
        this.m_DetachBarVisibility = ESlateVisibility(1);
        this.m_CachedDetachMax = 0.0f;
        this.m_Entity = Other.m_Entity;
        this.m_DisplayDetachBarRatio = Other.m_DisplayDetachBarRatio;
        this.m_DisplayPreviewDetachBarRatio = Other.m_DisplayPreviewDetachBarRatio;
        this.m_PreviewDetachBarChaseSeconds = Other.m_PreviewDetachBarChaseSeconds;
        this.m_PreviewDetachBarChaseSpeed = Other.m_PreviewDetachBarChaseSpeed;
        this.m_bInMaxMaintainState = Other.m_bInMaxMaintainState;
        this.m_MaxMaintainTriggerCounter = int(Other.m_MaxMaintainTriggerCounter);
        this.m_DetachBarVisibility = Other.m_DetachBarVisibility;
        this.m_CachedDetachMax = Other.m_CachedDetachMax;
        return;
    }
    FVM_PlayerHitStunDetachBar(const FECSEntity &inout InEntity)
    {
        this.m_DisplayDetachBarRatio = 0.0f;
        this.m_DisplayPreviewDetachBarRatio = 0.0f;
        this.m_PreviewDetachBarChaseSpeed = 0.0f;
        this.m_PreviewDetachBarChaseSeconds = 0.7f;
        this.m_bInMaxMaintainState = false;
        this.m_MaxMaintainTriggerCounter = 0;
        this.m_DetachBarVisibility = ESlateVisibility(1);
        this.m_CachedDetachMax = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetEntity(InEntity);
        return;
    }
    FVM_PlayerHitStunDetachBar opAssign(const FVM_PlayerHitStunDetachBar &inout Other)
    {
        FVM_PlayerHitStunDetachBar __r;
        this.m_Entity = Other.m_Entity;
        this.m_DisplayDetachBarRatio = Other.m_DisplayDetachBarRatio;
        this.m_DisplayPreviewDetachBarRatio = Other.m_DisplayPreviewDetachBarRatio;
        this.m_PreviewDetachBarChaseSeconds = Other.m_PreviewDetachBarChaseSeconds;
        this.m_PreviewDetachBarChaseSpeed = Other.m_PreviewDetachBarChaseSpeed;
        this.m_bInMaxMaintainState = Other.m_bInMaxMaintainState;
        this.m_MaxMaintainTriggerCounter = int(Other.m_MaxMaintainTriggerCounter);
        this.m_DetachBarVisibility = Other.m_DetachBarVisibility;
        this.m_CachedDetachMax = Other.m_CachedDetachMax;
        return __r;
    }
    void LoadConfigDefault(const FVM_PlayerHitStunDetachBarConfigDefault &inout InConfig)
    {
        this.SetPreviewDetachBarChaseSeconds(InConfig.PreviewDetachBarChaseSeconds);
        return;
    }
    void PostConstruct()
    {
        this.RefreshDetachBarRatio(true);
        return;
    }
    void Tick()
    {
        if (!(ECS::GetECSWorld().IsValid()))
        {
            return;
        }
        this.TickPreviewDetachBarChase();
        this.MonitorDetachValueChange();
        return;
    }
    void TickPreviewDetachBarChase()
    {
        if (this.GetDisplayPreviewDetachBarRatio() <= this.GetDisplayDetachBarRatio())
        {
            return;
        }
        this.SetDisplayPreviewDetachBarRatio(FMath::FInterpConstantTo(this.GetDisplayPreviewDetachBarRatio(), this.GetDisplayDetachBarRatio(), ECS::GetUEWorld().GetDeltaSeconds(), this.GetPreviewDetachBarChaseSpeed()));
        return;
    }
    void MonitorDetachValueChange()
    {
        this.RefreshDetachBarRatio(false);
        return;
    }
    void HandleEntityChanged()
    {
        this.RefreshDetachBarRatio(true);
        return;
    }
    void RefreshDetachBarRatio(const bool bFromEntityChange)
    {
        int local_14 = 0;
        float32 local_19;
        bool local_24;
        if (!(this.CheckFeatureActive()))
        {
            if (int(this.GetDetachBarVisibility()) != 1)
            {
                this.SetDetachBarVisibility(ESlateVisibility(ESlateVisibility(1)));
                this.SetDisplayDetachBarRatio(0.0f);
                this.SetDisplayPreviewDetachBarRatio(0.0f);
            }
            return;
        }
        this.SetDetachBarVisibility(ESlateVisibility(ESlateVisibility(4)));
        float32 local_6 = 0.0f;
        bool local_7 = false;
        if (local_14)
        {
            local_6 = local_14.GetAccumulatedDetachValue();
            local_7 = local_14.GetbInMaxMaintainState();
        }
        if (this.GetCachedDetachMax() > 0.0f)
        {
            float32 local_5 = local_6 / this.GetCachedDetachMax();
            local_19 = FMath::Clamp(local_5, 0.0f, 1.0f);
        }
        else
        {
            local_19 = 0.0f;
        }
        float32 local_20 = this.GetDisplayDetachBarRatio();
        float32 local_16 = local_20 * this.GetCachedDetachMax();
        int local_4 = FMath::CeilToInt(local_16);
        int local_3 = FMath::CeilToInt(local_6);
        int local_22 = FMath::CeilToInt(this.GetCachedDetachMax());
        this.SetDisplayDetachBarRatio(local_19);
        local_24 = this.GetbInMaxMaintainState();
        this.SetbInMaxMaintainState(local_7);
        if (this.GetbInMaxMaintainState() && !(local_24))
        {
            this.SetMaxMaintainTriggerCounter((this.GetMaxMaintainTriggerCounter() + 1));
        }
        if (bFromEntityChange)
        {
            this.SetDisplayPreviewDetachBarRatio(this.GetDisplayDetachBarRatio());
            return;
        }
        if (FMath::Abs((this.GetDisplayDetachBarRatio() - local_20)) > 0.001f)
        {
            if (this.GetDisplayDetachBarRatio() > this.GetDisplayPreviewDetachBarRatio())
            {
                this.SetDisplayPreviewDetachBarRatio(this.GetDisplayDetachBarRatio());
                return;
            }
            if (this.GetDisplayDetachBarRatio() < local_20)
            {
                float32 local_15_2 = this.GetDisplayPreviewDetachBarRatio();
                float32 local_16_2 = (local_15_2 - this.GetDisplayDetachBarRatio()) / this.GetPreviewDetachBarChaseSeconds();
                this.SetPreviewDetachBarChaseSpeed(local_16_2);
            }
        }
        return;
    }
    bool CheckFeatureActive()
    {
        int local_16 = 0;
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        if (!(local_4.IsValid()))
        {
            return false;
        }
        if (!(this.GetEntity().IsValid()))
        {
            return false;
        }
        FECSWorldPtr local_2 = this.GetEntity().GetWorld();
        Has local_10;
        if (!(local_10.opCall()))
        {
            return false;
        }
        FECSWorldPtr local_2_2 = this.GetEntity().GetWorld();
        if ((int(local_16.GetGameModeType())) != 2 && (int(local_16.GetGameModeType()) != 1))
        {
            return false;
        }
        if (int(::GetPrefabType(this.GetEntity())) == 2)
        {
            return false;
        }
        UDamageSettings local_24 = ::DamageSettings::Get();
        if ((local_24.HitStunDetachMax) <= 0.0f)
        {
            return false;
        }
        if (Cast<US_HitStunDetachSystem>(AECSGameManagerActor::GetSystem(ECS::GetUEWorld(), US_HitStunDetachSystem)) == nullptr)
        {
            return false;
        }
        this.SetCachedDetachMax(local_24.HitStunDetachMax);
        return true;
    }
    FECSEntity GetEntity() const property
    {
        FECSEntity __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FECSEntity GetModify_Entity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Entity = __Value;
        return;
    }
    const float32 GetDisplayDetachBarRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    float32 GetModify_DisplayDetachBarRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetDisplayDetachBarRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_DisplayDetachBarRatio = __Value;
        return;
    }
    const float32 GetDisplayPreviewDetachBarRatio() const property
    {
        const float32 __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    float32 GetModify_DisplayPreviewDetachBarRatio() property
    {
        float32 __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetDisplayPreviewDetachBarRatio(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_DisplayPreviewDetachBarRatio = __Value;
        return;
    }
    const float32 GetPreviewDetachBarChaseSeconds() const property
    {
        const float32 __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    float32 GetModify_PreviewDetachBarChaseSeconds() property
    {
        float32 __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetPreviewDetachBarChaseSeconds(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_PreviewDetachBarChaseSeconds = __Value;
        return;
    }
    const float32 GetPreviewDetachBarChaseSpeed() const property
    {
        const float32 __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    float32 GetModify_PreviewDetachBarChaseSpeed() property
    {
        float32 __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetPreviewDetachBarChaseSpeed(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_PreviewDetachBarChaseSpeed = __Value;
        return;
    }
    bool GetbInMaxMaintainState() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bInMaxMaintainState;
    }
    void SetbInMaxMaintainState(const bool __Value) property
    {
        if (!(this.m_bInMaxMaintainState) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bInMaxMaintainState = __Value;
        return;
    }
    int GetMaxMaintainTriggerCounter() const property
    {
        this.TrackPropertyRead(6);
        return this.m_MaxMaintainTriggerCounter;
    }
    void SetMaxMaintainTriggerCounter(const int __Value) property
    {
        if (this.m_MaxMaintainTriggerCounter == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_MaxMaintainTriggerCounter = __Value;
        return;
    }
    ESlateVisibility GetDetachBarVisibility() const property
    {
        this.TrackPropertyRead(7);
        return this.m_DetachBarVisibility;
    }
    void SetDetachBarVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_DetachBarVisibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_DetachBarVisibility = __Value;
        return;
    }
    const float32 GetCachedDetachMax() const property
    {
        const float32 __r;
        this.TrackPropertyRead(8);
        return __r;
    }
    float32 GetModify_CachedDetachMax() property
    {
        float32 __r;
        this.MarkPropertyDirty(8);
        return __r;
    }
    void SetCachedDetachMax(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_CachedDetachMax = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_PlayerHitStunDetachBar
{
    UPROPERTY()
    TEUIModelRef<FVM_PlayerHitStunDetachBar> Self;

    __GeneratedProperties_FVM_PlayerHitStunDetachBar()
    {
        return;
    }
}

namespace FVM_PlayerHitStunDetachBar
{
FVM_PlayerHitStunDetachBar& Create(const UObject ContextObject, const FECSEntity &inout Entity)
{
    return FVM_PlayerHitStunDetachBar::CreateByManager(EUIInternal::GetContextManager(ContextObject), Entity);
}
FVM_PlayerHitStunDetachBar CreateByManager(const UEUIManagerSubsystem Manager, const FECSEntity &inout Entity)
{
    FVM_PlayerHitStunDetachBar __r;
    TEUIModelRef<FVM_PlayerHitStunDetachBar> local_6 = TEUIModelRef<FVM_PlayerHitStunDetachBar>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_PlayerHitStunDetachBar::ModelId, 0, Entity));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(true);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "DisplayDetachBarRatio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DisplayPreviewDetachBarRatio";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bInMaxMaintainState";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MaxMaintainTriggerCounter";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DetachBarVisibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_PlayerHitStunDetachBar>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_PlayerHitStunDetachBar;
    Result.TickFunction.FunctionName = "__Tick";
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__HandleEntityChanged";
    local_24.DirtyFlags.Set(FVM_PlayerHitStunDetachBar::__IndexOf_Entity());
    Result.DirtyFunctions.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_PlayerHitStunDetachBar;
}
void __Tick(FVM_PlayerHitStunDetachBar &inout Model)
{
    Model.Tick();
    return;
}
void __HandleEntityChanged(FVM_PlayerHitStunDetachBar &inout Model)
{
    Model.HandleEntityChanged();
    return;
}
float32 __UIGetter_DisplayDetachBarRatio(const FVM_PlayerHitStunDetachBar &inout Model)
{
    return Model.GetDisplayDetachBarRatio();
}
float32 __UIGetter_DisplayPreviewDetachBarRatio(const FVM_PlayerHitStunDetachBar &inout Model)
{
    return Model.GetDisplayPreviewDetachBarRatio();
}
bool __UIGetter_bInMaxMaintainState(const FVM_PlayerHitStunDetachBar &inout Model)
{
    return Model.GetbInMaxMaintainState();
}
int __UIGetter_MaxMaintainTriggerCounter(const FVM_PlayerHitStunDetachBar &inout Model)
{
    return Model.GetMaxMaintainTriggerCounter();
}
ESlateVisibility __UIGetter_DetachBarVisibility(const FVM_PlayerHitStunDetachBar &inout Model)
{
    return Model.GetDetachBarVisibility();
}
TEUIModelRef<FVM_PlayerHitStunDetachBar> __UIGetter_Self(const FVM_PlayerHitStunDetachBar &inout Model)
{
    return TEUIModelRef<FVM_PlayerHitStunDetachBar>(Model);
}
int __IndexOf_Entity()
{
    return 0;
}
int __IndexOf_DisplayDetachBarRatio()
{
    return 1;
}
int __IndexOf_DisplayPreviewDetachBarRatio()
{
    return 2;
}
int __IndexOf_PreviewDetachBarChaseSeconds()
{
    return 3;
}
int __IndexOf_PreviewDetachBarChaseSpeed()
{
    return 4;
}
int __IndexOf_bInMaxMaintainState()
{
    return 5;
}
int __IndexOf_MaxMaintainTriggerCounter()
{
    return 6;
}
int __IndexOf_DetachBarVisibility()
{
    return 7;
}
int __IndexOf_CachedDetachMax()
{
    return 8;
}
}
namespace __GeneratedProperties_FVM_PlayerHitStunDetachBar
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
