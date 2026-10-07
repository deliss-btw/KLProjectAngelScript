
namespace FVMS_SocialSelectTarget
{
    const int ModelId = 0;

}
struct FVMS_SocialSelectTarget : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    ESlateVisibility m_Visibility_LockTargetPoint;
    UPROPERTY()
    FECSEntity m_TargetPawn;

    FVMS_SocialSelectTarget()
    {
        this.m_Visibility_LockTargetPoint = ESlateVisibility(2);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_SocialSelectTarget(const FVMS_SocialSelectTarget &inout Other)
    {
        this.m_Visibility_LockTargetPoint = ESlateVisibility(2);
        this.m_Visibility_LockTargetPoint = Other.m_Visibility_LockTargetPoint;
        this.m_TargetPawn = Other.m_TargetPawn;
        return;
    }
    FVMS_SocialSelectTarget& opAssign(const FVMS_SocialSelectTarget &inout Other)
    {
        this.m_Visibility_LockTargetPoint = Other.m_Visibility_LockTargetPoint;
        return Other.m_TargetPawn;
    }
    void Tick()
    {
        if ((FECSEntity(this.GetContext().GetLocalPlayer()) == ENTITY_NULL))
        {
            return;
        }
        Get local_14;
        const FC_SelectSocialInteractionInfo& local_16 = local_14.opCall();
        if (local_16)
        {
            this.SetTargetPawn(::FASCommonUtils::GetUniqueAvatarPawnEntity(local_16.InteractTarget));
        }
        else
        {
            this.SetTargetPawn(ENTITY_NULL);
        }
        Get local_20;
        const FC_SocialInteractionInfo& local_22 = local_20.opCall();
        if (local_22)
        {
            if ((!((FECSEntity(local_22.GetRequestInteractActionTargetPlayerEntity()) == ENTITY_NULL))))
            {
                this.SetTargetPawn(::FASCommonUtils::GetUniqueAvatarPawnEntity(local_22.GetRequestInteractActionTargetPlayerEntity()));
            }
        }
        if ((!((FECSEntity(this.GetTargetPawn()) == ENTITY_NULL))))
        {
            this.SetVisibility_LockTargetPoint(ESlateVisibility(0));
        }
        else
        {
            this.SetVisibility_LockTargetPoint(ESlateVisibility(2));
        }
        return;
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
    const FECSEntity GetTargetPawn() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FECSEntity GetModify_TargetPawn() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetTargetPawn(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TargetPawn = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_SocialSelectTarget
{
    UPROPERTY()
    TEUIModelRef<FVMS_SocialSelectTarget> Self;

    __GeneratedProperties_FVMS_SocialSelectTarget()
    {
        return;
    }
}

namespace FVMS_SocialSelectTarget
{
FVMS_SocialSelectTarget& Get(const UObject ContextObject)
{
    return FVMS_SocialSelectTarget::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_SocialSelectTarget GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_SocialSelectTarget __r;
    TEUIModelRef<FVMS_SocialSelectTarget> local_6 = TEUIModelRef<FVMS_SocialSelectTarget>(EUIInternal::MakeModelWithManager(Manager, FVMS_SocialSelectTarget::ModelId));
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
    local_14.TypeName = "TEUIModelRef<FVMS_SocialSelectTarget>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_SocialSelectTarget;
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_SocialSelectTarget;
}
void __Tick(FVMS_SocialSelectTarget &inout Model)
{
    Model.Tick();
    return;
}
ESlateVisibility __UIGetter_Visibility_LockTargetPoint(const FVMS_SocialSelectTarget &inout Model)
{
    return Model.GetVisibility_LockTargetPoint();
}
TEUIModelRef<FVMS_SocialSelectTarget> __UIGetter_Self(const FVMS_SocialSelectTarget &inout Model)
{
    return TEUIModelRef<FVMS_SocialSelectTarget>(Model);
}
int __IndexOf_Visibility_LockTargetPoint()
{
    return 0;
}
int __IndexOf_TargetPawn()
{
    return 1;
}
}
namespace __GeneratedProperties_FVMS_SocialSelectTarget
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
