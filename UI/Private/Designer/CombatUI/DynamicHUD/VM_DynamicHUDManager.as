
namespace FVMS_DynamicHUDManager
{
    const int ModelId = 0;

}
struct FVMS_DynamicHUDManager : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    ESlateVisibility m_Visibility_CrossHair;
    UPROPERTY()
    TArray<FECSEntity> m_SelectTargetEntityArray;
    UPROPERTY()
    TArray<FECSEntity> m_CurrentSelectTargetEntityArray;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> m_CurrentSelectIconWidget;
    UPROPERTY()
    TArray<FEUIModelRef> m_SelectTargetModelArray;
    UPROPERTY()
    FECSEntity m_LocalPlayerPawnEntity;

    FVMS_DynamicHUDManager()
    {
        this.m_Visibility_CrossHair = ESlateVisibility(2);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_DynamicHUDManager(const FVMS_DynamicHUDManager &inout Other)
    {
        this.m_Visibility_CrossHair = ESlateVisibility(2);
        this.m_Visibility_CrossHair = Other.m_Visibility_CrossHair;
        this.m_SelectTargetEntityArray = Other.m_SelectTargetEntityArray;
        this.m_CurrentSelectTargetEntityArray = Other.m_CurrentSelectTargetEntityArray;
        this.m_CurrentSelectIconWidget = Other.m_CurrentSelectIconWidget;
        this.m_SelectTargetModelArray = Other.m_SelectTargetModelArray;
        this.m_LocalPlayerPawnEntity = Other.m_LocalPlayerPawnEntity;
        return;
    }
    FVMS_DynamicHUDManager& opAssign(const FVMS_DynamicHUDManager &inout Other)
    {
        this.m_Visibility_CrossHair = Other.m_Visibility_CrossHair;
        this.m_SelectTargetEntityArray = Other.m_SelectTargetEntityArray;
        this.m_CurrentSelectTargetEntityArray = Other.m_CurrentSelectTargetEntityArray;
        this.m_CurrentSelectIconWidget = Other.m_CurrentSelectIconWidget;
        this.m_SelectTargetModelArray = Other.m_SelectTargetModelArray;
        return Other.m_LocalPlayerPawnEntity;
    }
    void RefreshSelectTargets()
    {
        this.SetLocalPlayerPawnEntity(this.GetContext().GetLocalPlayerPawn());
        if (!(this.GetLocalPlayerPawnEntity().IsValid()))
        {
            this.ClearSelectTargets();
            return;
        }
        TDataObjectPtr<FViewportSelectTargetParams> local_30;
        this.SetSelectTargetEntityArray(::FTargetSelectUtils::GetSelectTargetEntitiesWithSelectParamsForView(this.GetLocalPlayerPawnEntity(), NAME_None, local_30));
        TSoftClassPtr<UEUIUserWidget> local_64;
        if (local_30)
        {
        }
        else
        {
            local_64 = TSoftClassPtr<UEUIUserWidget>();
        }
        if ((this.GetCurrentSelectTargetEntityArray() == this.GetSelectTargetEntityArray()) && (this.GetCurrentSelectIconWidget() == local_64))
        {
            return;
        }
        this.SetCurrentSelectTargetEntityArray(this.GetSelectTargetEntityArray());
        this.SetCurrentSelectIconWidget(local_64);
        this.GetModify_SelectTargetModelArray().Empty(0);
        for (auto& local_80 : this.GetSelectTargetEntityArray())
        {
            local_80;
            FEUIModelRef local_82;
            this.GetModify_SelectTargetModelArray().Add(local_82);
        }
        return;
    }
    void ClearSelectTargets()
    {
        this.GetModify_SelectTargetEntityArray().Reset(0);
        this.GetModify_CurrentSelectTargetEntityArray().Reset(0);
        this.SetCurrentSelectIconWidget(TSoftClassPtr<UEUIUserWidget>());
        this.GetModify_SelectTargetModelArray().Empty(0);
        return;
    }
    void OnMonitorShowCrosshairEvent(const FC_HUDShowHideCrosshair &inout ShowCrosshairEvent)
    {
        if (ShowCrosshairEvent.GetbIsShow())
        {
            this.SetVisibility_CrossHair(ESlateVisibility(3));
            return;
        }
        this.SetVisibility_CrossHair(ESlateVisibility(2));
        return;
    }
    ESlateVisibility GetVisibility_CrossHair() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Visibility_CrossHair;
    }
    void SetVisibility_CrossHair(const ESlateVisibility __Value) property
    {
        if (int(this.m_Visibility_CrossHair) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Visibility_CrossHair = __Value;
        return;
    }
    const TArray<FECSEntity> GetSelectTargetEntityArray() const property
    {
        const TArray<FECSEntity> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<FECSEntity> GetModify_SelectTargetEntityArray() property
    {
        TArray<FECSEntity> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetSelectTargetEntityArray(const TArray<FECSEntity> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SelectTargetEntityArray = __Value;
        return;
    }
    const TArray<FECSEntity> GetCurrentSelectTargetEntityArray() const property
    {
        const TArray<FECSEntity> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<FECSEntity> GetModify_CurrentSelectTargetEntityArray() property
    {
        TArray<FECSEntity> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetCurrentSelectTargetEntityArray(const TArray<FECSEntity> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CurrentSelectTargetEntityArray = __Value;
        return;
    }
    TSoftClassPtr<UEUIUserWidget> GetCurrentSelectIconWidget() const property
    {
        this.TrackPropertyRead(3);
        return this.m_CurrentSelectIconWidget;
    }
    void SetCurrentSelectIconWidget(const TSoftClassPtr<UEUIUserWidget> &inout __Value) property
    {
        if ((this.m_CurrentSelectIconWidget == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_CurrentSelectIconWidget = __Value;
        return;
    }
    const TArray<FEUIModelRef> GetSelectTargetModelArray() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_SelectTargetModelArray() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetSelectTargetModelArray(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_SelectTargetModelArray = __Value;
        return;
    }
    const FECSEntity GetLocalPlayerPawnEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    FECSEntity GetModify_LocalPlayerPawnEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetLocalPlayerPawnEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_LocalPlayerPawnEntity = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_DynamicHUDManager
{
    UPROPERTY()
    TEUIModelRef<FVMS_DynamicHUDManager> Self;

    __GeneratedProperties_FVMS_DynamicHUDManager()
    {
        return;
    }
}

namespace FVMS_DynamicHUDManager
{
FVMS_DynamicHUDManager& Get(const UObject ContextObject)
{
    return FVMS_DynamicHUDManager::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_DynamicHUDManager GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_DynamicHUDManager __r;
    TEUIModelRef<FVMS_DynamicHUDManager> local_6 = TEUIModelRef<FVMS_DynamicHUDManager>(EUIInternal::MakeModelWithManager(Manager, FVMS_DynamicHUDManager::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Visibility_CrossHair";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectTargetModelArray";
    local_14.TypeName = "TArray<FEUIModelRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_DynamicHUDManager>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_DynamicHUDManager;
    FEUIModelEffectDefine local_20;
    local_20.FunctionName = "RefreshSelectTargets";
    Result.EffectFunctions.Add(local_20);
    FEUIModelMonitorDefine local_30;
    local_30.FunctionName = "__OnMonitorShowCrosshairEvent";
    local_30.ComponentType = FC_HUDShowHideCrosshair;
    Result.MonitorFunctions.Add(local_30);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_DynamicHUDManager;
}
void __OnMonitorShowCrosshairEvent(FVMS_DynamicHUDManager &inout Model, const FECSEntity &inout Entity, const FC_HUDShowHideCrosshair &inout Component)
{
    Model.OnMonitorShowCrosshairEvent(Component);
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
ESlateVisibility __UIGetter_Visibility_CrossHair(const FVMS_DynamicHUDManager &inout Model)
{
    return Model.GetVisibility_CrossHair();
}
TArray<FEUIModelRef> __UIGetter_SelectTargetModelArray(const FVMS_DynamicHUDManager &inout Model)
{
    return Model.GetSelectTargetModelArray();
}
TEUIModelRef<FVMS_DynamicHUDManager> __UIGetter_Self(const FVMS_DynamicHUDManager &inout Model)
{
    return TEUIModelRef<FVMS_DynamicHUDManager>(Model);
}
int __IndexOf_Visibility_CrossHair()
{
    return 0;
}
int __IndexOf_SelectTargetEntityArray()
{
    return 1;
}
int __IndexOf_CurrentSelectTargetEntityArray()
{
    return 2;
}
int __IndexOf_CurrentSelectIconWidget()
{
    return 3;
}
int __IndexOf_SelectTargetModelArray()
{
    return 4;
}
int __IndexOf_LocalPlayerPawnEntity()
{
    return 5;
}
}
namespace __GeneratedProperties_FVMS_DynamicHUDManager
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
