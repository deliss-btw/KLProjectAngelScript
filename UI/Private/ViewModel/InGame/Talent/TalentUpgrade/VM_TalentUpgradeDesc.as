
namespace FVM_TalentUpgradeDesc
{
    const int ModelId = 0;

}
struct FVM_TalentUpgradeDesc : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_ContextDesc;
    UPROPERTY()
    bool m_bHighLight;

    FVM_TalentUpgradeDesc()
    {
        this.m_bHighLight = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_TalentUpgradeDesc(const FVM_TalentUpgradeDesc &inout Other)
    {
        this.m_bHighLight = false;
        this.m_ContextDesc = Other.m_ContextDesc;
        this.m_bHighLight = Other.m_bHighLight;
        return;
    }
    FVM_TalentUpgradeDesc opAssign(const FVM_TalentUpgradeDesc &inout Other)
    {
        FVM_TalentUpgradeDesc __r;
        this.m_ContextDesc = Other.m_ContextDesc;
        this.m_bHighLight = Other.m_bHighLight;
        return __r;
    }
    const FText GetContextDesc() const property
    {
        const FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_ContextDesc() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetContextDesc(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_ContextDesc = __Value;
        return;
    }
    bool GetbHighLight() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bHighLight;
    }
    void SetbHighLight(const bool __Value) property
    {
        if (!(this.m_bHighLight) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bHighLight = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TalentUpgradeDesc
{
    UPROPERTY()
    TEUIModelRef<FVM_TalentUpgradeDesc> Self;

    __GeneratedProperties_FVM_TalentUpgradeDesc()
    {
        return;
    }
}

namespace FVM_TalentUpgradeDesc
{
FVM_TalentUpgradeDesc& Create(const UObject ContextObject)
{
    return FVM_TalentUpgradeDesc::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_TalentUpgradeDesc CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_TalentUpgradeDesc __r;
    TEUIModelRef<FVM_TalentUpgradeDesc> local_6 = TEUIModelRef<FVM_TalentUpgradeDesc>(EUIInternal::MakeModelWithManager(Manager, FVM_TalentUpgradeDesc::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ContextDesc";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bHighLight";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TalentUpgradeDesc>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TalentUpgradeDesc;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TalentUpgradeDesc;
}
FText __UIGetter_ContextDesc(const FVM_TalentUpgradeDesc &inout Model)
{
    return Model.GetContextDesc();
}
bool __UIGetter_bHighLight(const FVM_TalentUpgradeDesc &inout Model)
{
    return Model.GetbHighLight();
}
TEUIModelRef<FVM_TalentUpgradeDesc> __UIGetter_Self(const FVM_TalentUpgradeDesc &inout Model)
{
    return TEUIModelRef<FVM_TalentUpgradeDesc>(Model);
}
int __IndexOf_ContextDesc()
{
    return 0;
}
int __IndexOf_bHighLight()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_TalentUpgradeDesc
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
