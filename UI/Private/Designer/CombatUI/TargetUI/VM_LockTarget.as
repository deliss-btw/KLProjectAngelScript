
namespace FVMS_LockTarget
{
    const int ModelId = 0;

}
struct FVMS_LockTarget : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    ESlateVisibility m_Visibility_LockTargetPoint;
    UPROPERTY()
    FVector2D m_ScreenPosition;

    FVMS_LockTarget()
    {
        this.m_Visibility_LockTargetPoint = ESlateVisibility(2);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_LockTarget(const FVMS_LockTarget &inout Other)
    {
        this.m_Visibility_LockTargetPoint = ESlateVisibility(2);
        this.m_Visibility_LockTargetPoint = Other.m_Visibility_LockTargetPoint;
        this.m_ScreenPosition = Other.m_ScreenPosition;
        return;
    }
    FVMS_LockTarget& opAssign(const FVMS_LockTarget &inout Other)
    {
        this.m_Visibility_LockTargetPoint = Other.m_Visibility_LockTargetPoint;
        return Other.m_ScreenPosition;
    }
    ESlateVisibility GetVisibility_LockTargetPoint() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Visibility_LockTargetPoint;
    }
    void SetVisibility_LockTargetPoint(const ESlateVisibility __Value) property
    {
        if (int(this.m_Visibility_LockTargetPoint) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Visibility_LockTargetPoint = __Value;
        return;
    }
    const FVector2D GetScreenPosition() const property
    {
        const FVector2D __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FVector2D GetModify_ScreenPosition() property
    {
        FVector2D __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetScreenPosition(const FVector2D &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ScreenPosition = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_LockTarget
{
    UPROPERTY()
    TEUIModelRef<FVMS_LockTarget> Self;

    __GeneratedProperties_FVMS_LockTarget()
    {
        return;
    }
}

namespace FVMS_LockTarget
{
FVMS_LockTarget& Get(const UObject ContextObject)
{
    return FVMS_LockTarget::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_LockTarget GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_LockTarget __r;
    TEUIModelRef<FVMS_LockTarget> local_6 = TEUIModelRef<FVMS_LockTarget>(EUIInternal::MakeModelWithManager(Manager, FVMS_LockTarget::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Visibility_LockTargetPoint";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_LockTarget>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_LockTarget;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_LockTarget;
}
ESlateVisibility __UIGetter_Visibility_LockTargetPoint(const FVMS_LockTarget &inout Model)
{
    return Model.GetVisibility_LockTargetPoint();
}
TEUIModelRef<FVMS_LockTarget> __UIGetter_Self(const FVMS_LockTarget &inout Model)
{
    return TEUIModelRef<FVMS_LockTarget>(Model);
}
int __IndexOf_Visibility_LockTargetPoint()
{
    return 0;
}
int __IndexOf_ScreenPosition()
{
    return 1;
}
}
namespace __GeneratedProperties_FVMS_LockTarget
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
