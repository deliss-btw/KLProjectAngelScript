
namespace FVM_ForgeWeaponItemAttribute
{
    const int ModelId = 0;

}
struct FVM_ForgeWeaponItemAttribute : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_Name;
    UPROPERTY()
    FText m_Value;

    FVM_ForgeWeaponItemAttribute()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_ForgeWeaponItemAttribute' by default constructor.");
        return;
    }
    FVM_ForgeWeaponItemAttribute(const FVM_ForgeWeaponItemAttribute &inout Other)
    {
        this.m_Name = Other.m_Name;
        this.m_Value = Other.m_Value;
        return;
    }
    FVM_ForgeWeaponItemAttribute(const FText &inout InName, const FText &inout InValue)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetName(InName);
        this.SetValue(InValue);
        return;
    }
    FVM_ForgeWeaponItemAttribute& opAssign(const FVM_ForgeWeaponItemAttribute &inout Other)
    {
        this.m_Name = Other.m_Name;
        return Other.m_Value;
    }
    FText GetName() const property
    {
        FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_Name() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Name = __Value;
        return;
    }
    FText GetValue() const property
    {
        FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_Value() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetValue(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_Value = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_ForgeWeaponItemAttribute
{
    UPROPERTY()
    TEUIModelRef<FVM_ForgeWeaponItemAttribute> Self;

    __GeneratedProperties_FVM_ForgeWeaponItemAttribute()
    {
        return;
    }
}

namespace FVM_ForgeWeaponItemAttribute
{
FVM_ForgeWeaponItemAttribute& Create(const UObject ContextObject, const FText &inout Name, const FText &inout Value)
{
    return FVM_ForgeWeaponItemAttribute::CreateByManager(EUIInternal::GetContextManager(ContextObject), Name, Value);
}
FVM_ForgeWeaponItemAttribute CreateByManager(const UEUIManagerSubsystem Manager, const FText &inout Name, const FText &inout Value)
{
    FVM_ForgeWeaponItemAttribute __r;
    TEUIModelRef<FVM_ForgeWeaponItemAttribute> local_6 = TEUIModelRef<FVM_ForgeWeaponItemAttribute>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_ForgeWeaponItemAttribute::ModelId, 0, Name, Value));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Name";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Value";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_ForgeWeaponItemAttribute>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_ForgeWeaponItemAttribute;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_ForgeWeaponItemAttribute;
}
FText __UIGetter_Name(const FVM_ForgeWeaponItemAttribute &inout Model)
{
    return Model.GetName();
}
FText __UIGetter_Value(const FVM_ForgeWeaponItemAttribute &inout Model)
{
    FText __r;
    return __r;
}
TEUIModelRef<FVM_ForgeWeaponItemAttribute> __UIGetter_Self(const FVM_ForgeWeaponItemAttribute &inout Model)
{
    return TEUIModelRef<FVM_ForgeWeaponItemAttribute>(Model);
}
int __IndexOf_Name()
{
    return 0;
}
int __IndexOf_Value()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_ForgeWeaponItemAttribute
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
