
namespace FVMS_CommonLoading
{
    const int ModelId = 0;

}
struct FVMS_CommonLoading : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    float32 m_DefaultBlendInSpeed;
    UPROPERTY()
    float32 m_DefaultBlendOutSpeed;
    UPROPERTY()
    float32 m_RenderOpacity;
    UPROPERTY()
    bool m_bPendingClose;

    FVMS_CommonLoading()
    {
        this.m_RenderOpacity = 0.0f;
        this.m_DefaultBlendInSpeed = 8.0f;
        this.m_DefaultBlendOutSpeed = 2.0f;
        this.m_bPendingClose = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_CommonLoading(const FVMS_CommonLoading &inout Other)
    {
        this.m_RenderOpacity = 0.0f;
        this.m_DefaultBlendInSpeed = 8.0f;
        this.m_DefaultBlendOutSpeed = 2.0f;
        this.m_bPendingClose = false;
        this.m_DefaultBlendInSpeed = Other.m_DefaultBlendInSpeed;
        this.m_DefaultBlendOutSpeed = Other.m_DefaultBlendOutSpeed;
        this.m_RenderOpacity = Other.m_RenderOpacity;
        this.m_bPendingClose = Other.m_bPendingClose;
        return;
    }
    FVMS_CommonLoading opAssign(const FVMS_CommonLoading &inout Other)
    {
        FVMS_CommonLoading __r;
        this.m_DefaultBlendInSpeed = Other.m_DefaultBlendInSpeed;
        this.m_DefaultBlendOutSpeed = Other.m_DefaultBlendOutSpeed;
        this.m_RenderOpacity = Other.m_RenderOpacity;
        this.m_bPendingClose = Other.m_bPendingClose;
        return __r;
    }
    void Tick()
    {
        float32 local_1 = 0.0f;
        float32 local_3 = this.GetDefaultBlendInSpeed();
        float32 local_4 = this.GetDefaultBlendOutSpeed();
        Get local_8;
        const FCS_CommonLoadingManager& local_10 = local_8.opCall();
        if (local_10)
        {
            local_1 = local_10.DisplayingPopupRemainingTime;
            float32 local_2 = local_10.BlendInSpeed;
            if (local_2 > 0.0f)
            {
                local_3 = local_10.BlendInSpeed;
            }
            local_2 = local_10.BlendOutSpeed;
            if (local_2 > 0.0f)
            {
                local_4 = local_10.BlendOutSpeed;
            }
            this.SetbPendingClose(false);
        }
        if (this.GetbPendingClose())
        {
            return;
        }
        float32 local_12 = float32(this.GetContext().DeltaTime.ToSeconds());
        if (local_1 > 0.0f)
        {
            if (this.GetRenderOpacity() < 1.0f)
            {
                this.SetRenderOpacity(FMath::Clamp((this.GetRenderOpacity() + (local_3 * local_12)), 0.0f, 1.0f));
            }
            return;
        }
        if (this.GetRenderOpacity() > 0.0f)
        {
            float32 local_13_2 = this.GetRenderOpacity();
            float32 local_2_3 = local_4 * local_12;
            this.SetRenderOpacity(FMath::Clamp(local_13_2 - local_2_3, 0.0f, 1.0f));
            if (this.GetRenderOpacity() <= 0.0f)
            {
                this.SetbPendingClose(true);
            }
        }
        return;
    }
    const float32 GetDefaultBlendInSpeed() const property
    {
        const float32 __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    float32 GetModify_DefaultBlendInSpeed() property
    {
        float32 __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetDefaultBlendInSpeed(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_DefaultBlendInSpeed = __Value;
        return;
    }
    const float32 GetDefaultBlendOutSpeed() const property
    {
        const float32 __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    float32 GetModify_DefaultBlendOutSpeed() property
    {
        float32 __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetDefaultBlendOutSpeed(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_DefaultBlendOutSpeed = __Value;
        return;
    }
    float32 GetRenderOpacity() const property
    {
        float32 __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    float32 GetModify_RenderOpacity() property
    {
        float32 __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetRenderOpacity(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_RenderOpacity = __Value;
        return;
    }
    bool GetbPendingClose() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bPendingClose;
    }
    void SetbPendingClose(const bool __Value) property
    {
        if (!(this.m_bPendingClose) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bPendingClose = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_CommonLoading
{
    UPROPERTY()
    TEUIModelRef<FVMS_CommonLoading> Self;

    __GeneratedProperties_FVMS_CommonLoading()
    {
        return;
    }
}

namespace FVMS_CommonLoading
{
FVMS_CommonLoading& Get(const UObject ContextObject)
{
    return FVMS_CommonLoading::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_CommonLoading GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_CommonLoading __r;
    TEUIModelRef<FVMS_CommonLoading> local_6 = TEUIModelRef<FVMS_CommonLoading>(EUIInternal::MakeModelWithManager(Manager, FVMS_CommonLoading::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "RenderOpacity";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_CommonLoading>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_CommonLoading;
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_CommonLoading;
}
void __Tick(FVMS_CommonLoading &inout Model)
{
    Model.Tick();
    return;
}
float32 __UIGetter_RenderOpacity(const FVMS_CommonLoading &inout Model)
{
    return Model.GetRenderOpacity();
}
TEUIModelRef<FVMS_CommonLoading> __UIGetter_Self(const FVMS_CommonLoading &inout Model)
{
    return TEUIModelRef<FVMS_CommonLoading>(Model);
}
int __IndexOf_DefaultBlendInSpeed()
{
    return 0;
}
int __IndexOf_DefaultBlendOutSpeed()
{
    return 1;
}
int __IndexOf_RenderOpacity()
{
    return 2;
}
int __IndexOf_bPendingClose()
{
    return 3;
}
}
namespace __GeneratedProperties_FVMS_CommonLoading
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
