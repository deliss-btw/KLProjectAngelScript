
namespace FVM_TeamPlayerOperatorListHover
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnButtonClick = FEUIModelCallbackSignature();

}
struct FVM_TeamPlayerOperatorListHover : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_TeamMember> m_TeamMember;

    FVM_TeamPlayerOperatorListHover()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TeamPlayerOperatorListHover' by default constructor.");
        return;
    }
    FVM_TeamPlayerOperatorListHover(const FVM_TeamPlayerOperatorListHover &inout Other)
    {
        this.m_TeamMember = Other.m_TeamMember;
        return;
    }
    FVM_TeamPlayerOperatorListHover(const TEUIModelRef<FM_TeamMember> &inout InTeamMember)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTeamMember(InTeamMember);
        return;
    }
    FVM_TeamPlayerOperatorListHover& opAssign(const FVM_TeamPlayerOperatorListHover &inout Other)
    {
        return Other.m_TeamMember;
    }
    void PostConstruct()
    {
        if (this.GetTeamMember().IsValid())
        {
            TEUIModelRef<FM_TeamMember> local_2 = this.GetTeamMember();
            if (IsCaptain())
            {
            }
        }
        return;
    }
    void OnButtonClick()
    {
        return;
    }
    TEUIModelRef<FM_TeamMember> GetTeamMember() const property
    {
        this.TrackPropertyRead(0);
        return this.m_TeamMember;
    }
    void SetTeamMember(const TEUIModelRef<FM_TeamMember> &inout __Value) property
    {
        TEUIModelRef<FM_TeamMember> local_2;
        local_2 = this.m_TeamMember;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TeamMember = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TeamPlayerOperatorListHover
{
    UPROPERTY()
    TEUIModelRef<FVM_TeamPlayerOperatorListHover> Self;

    __GeneratedProperties_FVM_TeamPlayerOperatorListHover()
    {
        return;
    }
}

namespace FVM_TeamPlayerOperatorListHover
{
FVM_TeamPlayerOperatorListHover& Create(const UObject ContextObject, const TEUIModelRef<FM_TeamMember> &inout TeamMember)
{
    return FVM_TeamPlayerOperatorListHover::CreateByManager(EUIInternal::GetContextManager(ContextObject), TeamMember);
}
FVM_TeamPlayerOperatorListHover CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_TeamMember> &inout TeamMember)
{
    FVM_TeamPlayerOperatorListHover __r;
    TEUIModelRef<FVM_TeamPlayerOperatorListHover> local_6 = TEUIModelRef<FVM_TeamPlayerOperatorListHover>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TeamPlayerOperatorListHover::ModelId, 0, TeamMember));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TeamPlayerOperatorListHover>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TeamPlayerOperatorListHover;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TeamPlayerOperatorListHover;
}
TEUIModelRef<FVM_TeamPlayerOperatorListHover> __UIGetter_Self(const FVM_TeamPlayerOperatorListHover &inout Model)
{
    return TEUIModelRef<FVM_TeamPlayerOperatorListHover>(Model);
}
int __IndexOf_TeamMember()
{
    return 0;
}
}
namespace __GeneratedProperties_FVM_TeamPlayerOperatorListHover
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
