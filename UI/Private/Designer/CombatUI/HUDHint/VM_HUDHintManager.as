
namespace FVMS_HUDHintManager
{
    const int ModelId = 0;

}
struct FVMS_HUDHintManager : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    ESlateVisibility m_Visibility_CrossHair;

    FVMS_HUDHintManager()
    {
        this.m_Visibility_CrossHair = ESlateVisibility(2);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_HUDHintManager(const FVMS_HUDHintManager &inout Other)
    {
        this.m_Visibility_CrossHair = ESlateVisibility(2);
        this.m_Visibility_CrossHair = Other.m_Visibility_CrossHair;
        return;
    }
    FVMS_HUDHintManager opAssign(const FVMS_HUDHintManager &inout Other)
    {
        FVMS_HUDHintManager __r;
        this.m_Visibility_CrossHair = Other.m_Visibility_CrossHair;
        return __r;
    }
    void HandleHintData(const FSideHintData &inout HintData)
    {
        if ((!((FECSEntity(HintData.GetSpecifiedShowEntity()) == this.GetContext().GetLocalPlayer()))))
        {
            return;
        }
        else
        {
            if (HintData.GetbIsShow())
            {
                int local_11 = int(HintData.GetHUDHintType());
                if (local_11 <= 1)
                {
                    if (local_11 != 0)
                    {
                        if (local_11 != 1)
                        {
                        }
                    }
                    else
                    {
                        if (HintData.GetHintTextData())
                        {
                            FCommonTipsParam local_16;
                            local_16.LifetimeOverride = HintData.GetShowHintTime();
                            ::CommonPopup::WeakTips(HintData.GetHintTextData().opArrow().Text, local_16);
                        }
                        return;
                    }
                }
                return;
            }
        }
    }
    void HandleHintEvent(const FCE_HUDHint &inout Event)
    {
        this.HandleHintData(Event.SideHintData);
        return;
    }
    void HandleLocalHintEvent(const FCE_LocalHUDHint &inout Event)
    {
        this.HandleHintData(Event.SideHintData);
        return;
    }
    void HandleCommonPopupLargeHint(const FSoftBrush &inout Icon, const FText &inout Title, const FText &inout Content, const FCommonHintParam &inout ExtraParam)
    {
        float32 local_6;
        FVMS_SideHint& local_2 = ::FVMS_SideHint::Get(this.GetContext().Manager);
        if (ExtraParam.LifetimeOverride > 0.0f)
        {
            local_6 = ExtraParam.LifetimeOverride;
        }
        else
        {
            local_6 = 3.0f;
        }
        UObject local_54 = Icon.LoadBrush().ResourceObject;
        local_2.AddSideHintItemNew(EHUDSideHintType(1), Title, Content, Cast<UTexture2D>(local_54), local_6);
        return;
    }
    void HandleCommonPopupSmallHint(const FSoftBrush &inout Icon, const FText &inout Content, const FCommonHintParam &inout ExtraParam)
    {
        float32 local_6;
        FVMS_SideHint& local_2 = ::FVMS_SideHint::Get(this.GetContext().Manager);
        if (ExtraParam.LifetimeOverride > 0.0f)
        {
            local_6 = ExtraParam.LifetimeOverride;
        }
        else
        {
            local_6 = 3.0f;
        }
        UObject local_54 = Icon.LoadBrush().ResourceObject;
        local_2.AddSideHintItemNew(EHUDSideHintType(0), FText(), Content, Cast<UTexture2D>(local_54), local_6);
        return;
    }
    void ShowCombatHint(const TDataObjectPtr<FKLTextData> &inout HintText, const float32 ShowHintTime)
    {
        if (HintText)
        {
            FCommonTipsParam local_6;
            local_6.LifetimeOverride = ShowHintTime;
            ::CommonPopup::WeakTips(HintText.opArrow().Text, local_6);
        }
        return;
    }
    void Tick()
    {
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
}

struct __GeneratedProperties_FVMS_HUDHintManager
{
    UPROPERTY()
    TEUIModelRef<FVMS_HUDHintManager> Self;

    __GeneratedProperties_FVMS_HUDHintManager()
    {
        return;
    }
}

namespace FVMS_HUDHintManager
{
FVMS_HUDHintManager& Get(const UObject ContextObject)
{
    return FVMS_HUDHintManager::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_HUDHintManager GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_HUDHintManager __r;
    TEUIModelRef<FVMS_HUDHintManager> local_6 = TEUIModelRef<FVMS_HUDHintManager>(EUIInternal::MakeModelWithManager(Manager, FVMS_HUDHintManager::ModelId));
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
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_HUDHintManager>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_HUDHintManager;
    FEUIModelEventDefine local_22;
    local_22.FunctionName = "__HandleHintEvent";
    local_22.EventType = FCE_HUDHint;
    Result.EventFunctions.Add(local_22);
    local_22.FunctionName = "__HandleLocalHintEvent";
    local_22.EventType = FCE_LocalHUDHint;
    Result.EventFunctions.Add(local_22);
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_HUDHintManager;
}
void __HandleHintEvent(FVMS_HUDHintManager &inout Model, const FCE_HUDHint &inout Event)
{
    Model.HandleHintEvent(Event);
    return;
}
void __HandleLocalHintEvent(FVMS_HUDHintManager &inout Model, const FCE_LocalHUDHint &inout Event)
{
    Model.HandleLocalHintEvent(Event);
    return;
}
void __Tick(FVMS_HUDHintManager &inout Model)
{
    Model.Tick();
    return;
}
ESlateVisibility __UIGetter_Visibility_CrossHair(const FVMS_HUDHintManager &inout Model)
{
    return Model.GetVisibility_CrossHair();
}
TEUIModelRef<FVMS_HUDHintManager> __UIGetter_Self(const FVMS_HUDHintManager &inout Model)
{
    return TEUIModelRef<FVMS_HUDHintManager>(Model);
}
int __IndexOf_Visibility_CrossHair()
{
    return 0;
}
}
namespace __GeneratedProperties_FVMS_HUDHintManager
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
