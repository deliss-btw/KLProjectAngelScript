
namespace FVM_TalentDivisionTypeIcon
{
    const int ModelId = 0;

}
struct FVM_TalentDivisionTypeIcon : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    ETalentDivision m_DivisionType;

    FVM_TalentDivisionTypeIcon()
    {
        this.m_DivisionType = ETalentDivision(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TalentDivisionTypeIcon' by default constructor.");
        return;
    }
    FVM_TalentDivisionTypeIcon(const FVM_TalentDivisionTypeIcon &inout Other)
    {
        this.m_DivisionType = ETalentDivision(0);
        this.m_DivisionType = Other.m_DivisionType;
        return;
    }
    FVM_TalentDivisionTypeIcon(const ETalentDivision InDivisionType)
    {
        this.m_DivisionType = ETalentDivision(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetDivisionType(ETalentDivision(InDivisionType));
        return;
    }
    FVM_TalentDivisionTypeIcon opAssign(const FVM_TalentDivisionTypeIcon &inout Other)
    {
        FVM_TalentDivisionTypeIcon __r;
        this.m_DivisionType = Other.m_DivisionType;
        return __r;
    }
    int GetDivisionSwitcherIndex() const
    {
        switch (int(this.GetDivisionType()))
        {
        case 1:
        {
            return 0;
        }
        case 2:
        {
            return 1;
        }
        case 3:
        {
            return 2;
        }
        default:
        {
        }
        }
        return 0;
    }
    ETalentDivision GetDivisionType() const property
    {
        this.TrackPropertyRead(0);
        return this.m_DivisionType;
    }
    void SetDivisionType(const ETalentDivision __Value) property
    {
        if (int(this.m_DivisionType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_DivisionType = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TalentDivisionTypeIcon
{
    UPROPERTY()
    int DivisionSwitcherIndex;
    UPROPERTY()
    TEUIModelRef<FVM_TalentDivisionTypeIcon> Self;


}

namespace FVM_TalentDivisionTypeIcon
{
FVM_TalentDivisionTypeIcon& Create(const UObject ContextObject, const ETalentDivision DivisionType)
{
    return FVM_TalentDivisionTypeIcon::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_TalentDivisionTypeIcon CreateByManager(const UEUIManagerSubsystem Manager, const ETalentDivision DivisionType)
{
    FVM_TalentDivisionTypeIcon __r;
    TEUIModelRef<FVM_TalentDivisionTypeIcon> local_6 = TEUIModelRef<FVM_TalentDivisionTypeIcon>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TalentDivisionTypeIcon::ModelId, 0, DivisionType));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "DivisionType";
    local_14.TypeName = "ETalentDivision";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DivisionSwitcherIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TalentDivisionTypeIcon>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TalentDivisionTypeIcon;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TalentDivisionTypeIcon;
}
ETalentDivision __UIGetter_DivisionType(const FVM_TalentDivisionTypeIcon &inout Model)
{
    return Model.GetDivisionType();
}
int __UIGetter_DivisionSwitcherIndex(const FVM_TalentDivisionTypeIcon &inout Model)
{
    return Model.GetDivisionSwitcherIndex();
}
TEUIModelRef<FVM_TalentDivisionTypeIcon> __UIGetter_Self(const FVM_TalentDivisionTypeIcon &inout Model)
{
    return TEUIModelRef<FVM_TalentDivisionTypeIcon>(Model);
}
int __IndexOf_DivisionType()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_TalentDivisionTypeIcon
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
