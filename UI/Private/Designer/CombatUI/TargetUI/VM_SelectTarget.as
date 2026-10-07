
namespace FVM_SelectTarget
{
    const int ModelId = 0;

}
struct FVM_SelectTarget : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FECSEntity m_SelectTargetEntity;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> m_SelectIconWidget;

    FVM_SelectTarget()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_SelectTarget' by default constructor.");
        return;
    }
    FVM_SelectTarget(const FVM_SelectTarget &inout Other)
    {
        this.m_SelectTargetEntity = Other.m_SelectTargetEntity;
        this.m_SelectIconWidget = Other.m_SelectIconWidget;
        return;
    }
    FVM_SelectTarget(const FECSEntity &inout InSelectTargetEntity, const TSoftClassPtr<UEUIUserWidget> &inout InSelectIconWidget)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetSelectTargetEntity(InSelectTargetEntity);
        this.SetSelectIconWidget(InSelectIconWidget);
        return;
    }
    FVM_SelectTarget& opAssign(const FVM_SelectTarget &inout Other)
    {
        this.m_SelectTargetEntity = Other.m_SelectTargetEntity;
        return Other.m_SelectIconWidget;
    }
    const FECSEntity GetSelectTargetEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FECSEntity GetModify_SelectTargetEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetSelectTargetEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_SelectTargetEntity = __Value;
        return;
    }
    TSoftClassPtr<UEUIUserWidget> GetSelectIconWidget() const property
    {
        this.TrackPropertyRead(1);
        return this.m_SelectIconWidget;
    }
    void SetSelectIconWidget(const TSoftClassPtr<UEUIUserWidget> &inout __Value) property
    {
        if ((this.m_SelectIconWidget == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SelectIconWidget = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_SelectTarget
{
    UPROPERTY()
    TEUIModelRef<FVM_SelectTarget> Self;

    __GeneratedProperties_FVM_SelectTarget()
    {
        return;
    }
}

namespace FVM_SelectTarget
{
FVM_SelectTarget& Create(const UObject ContextObject, const FECSEntity &inout SelectTargetEntity, const TSoftClassPtr<UEUIUserWidget> &inout SelectIconWidget)
{
    return FVM_SelectTarget::CreateByManager(EUIInternal::GetContextManager(ContextObject), SelectTargetEntity, SelectIconWidget);
}
FVM_SelectTarget CreateByManager(const UEUIManagerSubsystem Manager, const FECSEntity &inout SelectTargetEntity, const TSoftClassPtr<UEUIUserWidget> &inout SelectIconWidget)
{
    FVM_SelectTarget __r;
    TEUIModelRef<FVM_SelectTarget> local_6 = TEUIModelRef<FVM_SelectTarget>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_SelectTarget::ModelId, 0, SelectTargetEntity, SelectIconWidget));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "SelectIconWidget";
    local_14.TypeName = "TSoftClassPtr<UEUIUserWidget>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_SelectTarget>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_SelectTarget;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_SelectTarget;
}
TSoftClassPtr<UEUIUserWidget> __UIGetter_SelectIconWidget(const FVM_SelectTarget &inout Model)
{
    return Model.GetSelectIconWidget();
}
TEUIModelRef<FVM_SelectTarget> __UIGetter_Self(const FVM_SelectTarget &inout Model)
{
    return TEUIModelRef<FVM_SelectTarget>(Model);
}
int __IndexOf_SelectTargetEntity()
{
    return 0;
}
int __IndexOf_SelectIconWidget()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_SelectTarget
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
