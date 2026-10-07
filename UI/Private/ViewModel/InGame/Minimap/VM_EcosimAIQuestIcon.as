
namespace FVM_EcosimAIQuestIcon
{
    const int ModelId = 0;

}
struct FVM_EcosimAIQuestIcon : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FECSEntityId m_EntityID;

    FVM_EcosimAIQuestIcon()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_EcosimAIQuestIcon' by default constructor.");
        return;
    }
    FVM_EcosimAIQuestIcon(const FVM_EcosimAIQuestIcon &inout Other)
    {
        this.m_EntityID = Other.m_EntityID;
        return;
    }
    FVM_EcosimAIQuestIcon(const FECSEntityId &inout InEntityID)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetEntityID(InEntityID);
        return;
    }
    FVM_EcosimAIQuestIcon& opAssign(const FVM_EcosimAIQuestIcon &inout Other)
    {
        return Other.m_EntityID;
    }
    const FECSEntityId GetEntityID() const property
    {
        const FECSEntityId __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FECSEntityId GetModify_EntityID() property
    {
        FECSEntityId __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetEntityID(const FECSEntityId &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_EntityID = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_EcosimAIQuestIcon
{
    UPROPERTY()
    TEUIModelRef<FVM_EcosimAIQuestIcon> Self;

    __GeneratedProperties_FVM_EcosimAIQuestIcon()
    {
        return;
    }
}

namespace FVM_EcosimAIQuestIcon
{
FVM_EcosimAIQuestIcon& Create(const UObject ContextObject, const FECSEntityId &inout EntityID)
{
    return FVM_EcosimAIQuestIcon::CreateByManager(EUIInternal::GetContextManager(ContextObject), EntityID);
}
FVM_EcosimAIQuestIcon CreateByManager(const UEUIManagerSubsystem Manager, const FECSEntityId &inout EntityID)
{
    FVM_EcosimAIQuestIcon __r;
    TEUIModelRef<FVM_EcosimAIQuestIcon> local_6 = TEUIModelRef<FVM_EcosimAIQuestIcon>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_EcosimAIQuestIcon::ModelId, 0, EntityID));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_EcosimAIQuestIcon>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_EcosimAIQuestIcon;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_EcosimAIQuestIcon;
}
TEUIModelRef<FVM_EcosimAIQuestIcon> __UIGetter_Self(const FVM_EcosimAIQuestIcon &inout Model)
{
    return TEUIModelRef<FVM_EcosimAIQuestIcon>(Model);
}
int __IndexOf_EntityID()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_EcosimAIQuestIcon
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
