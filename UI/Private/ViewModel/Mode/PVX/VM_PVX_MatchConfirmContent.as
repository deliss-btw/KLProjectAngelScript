
namespace FVM_PVX_MatchConfirmContent
{
    const int ModelId = 0;

}
struct FVM_PVX_MatchConfirmContent : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_ModeMatchConfirm> m_MatchData;
    UPROPERTY()
    FText m_ModeName;

    FVM_PVX_MatchConfirmContent()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_PVX_MatchConfirmContent' by default constructor.");
        return;
    }
    FVM_PVX_MatchConfirmContent(const FVM_PVX_MatchConfirmContent &inout Other)
    {
        this.m_MatchData = Other.m_MatchData;
        this.m_ModeName = Other.m_ModeName;
        return;
    }
    FVM_PVX_MatchConfirmContent(const TEUIModelRef<FM_ModeMatchConfirm> &inout InMatchData)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetMatchData(InMatchData);
        return;
    }
    FVM_PVX_MatchConfirmContent& opAssign(const FVM_PVX_MatchConfirmContent &inout Other)
    {
        this.m_MatchData = Other.m_MatchData;
        return Other.m_ModeName;
    }
    void PostConstruct()
    {
        if (!(this.GetMatchData().IsValid()))
        {
            return;
        }
        TEUIModelRef<FM_ModeMatchConfirm> local_2 = this.GetMatchData();
        FM_ModeItem& local_6 = ::FM_ModeItem::Create(this.GetContext().Manager, GetMatchId());
        if (local_6.GetMatchConfig().IsSet())
        {
        }
        return;
    }
    TEUIModelRef<FM_ModeMatchConfirm> GetMatchData() const property
    {
        this.TrackPropertyRead(0);
        return this.m_MatchData;
    }
    void SetMatchData(const TEUIModelRef<FM_ModeMatchConfirm> &inout __Value) property
    {
        TEUIModelRef<FM_ModeMatchConfirm> local_2;
        local_2 = this.m_MatchData;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_MatchData = __Value;
        return;
    }
    const FText GetModeName() const property
    {
        const FText __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FText GetModify_ModeName() property
    {
        FText __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetModeName(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_ModeName = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_PVX_MatchConfirmContent
{
    UPROPERTY()
    TEUIModelRef<FVM_PVX_MatchConfirmContent> Self;

    __GeneratedProperties_FVM_PVX_MatchConfirmContent()
    {
        return;
    }
}

namespace FVM_PVX_MatchConfirmContent
{
FVM_PVX_MatchConfirmContent& Create(const UObject ContextObject, const TEUIModelRef<FM_ModeMatchConfirm> &inout MatchData)
{
    return FVM_PVX_MatchConfirmContent::CreateByManager(EUIInternal::GetContextManager(ContextObject), MatchData);
}
FVM_PVX_MatchConfirmContent CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_ModeMatchConfirm> &inout MatchData)
{
    FVM_PVX_MatchConfirmContent __r;
    TEUIModelRef<FVM_PVX_MatchConfirmContent> local_6 = TEUIModelRef<FVM_PVX_MatchConfirmContent>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_PVX_MatchConfirmContent::ModelId, 0, MatchData));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "ModeName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_PVX_MatchConfirmContent>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_PVX_MatchConfirmContent;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_PVX_MatchConfirmContent;
}
FText __UIGetter_ModeName(const FVM_PVX_MatchConfirmContent &inout Model)
{
    return Model.GetModeName();
}
TEUIModelRef<FVM_PVX_MatchConfirmContent> __UIGetter_Self(const FVM_PVX_MatchConfirmContent &inout Model)
{
    return TEUIModelRef<FVM_PVX_MatchConfirmContent>(Model);
}
int __IndexOf_MatchData()
{
    return 0;
}
int __IndexOf_ModeName()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_PVX_MatchConfirmContent
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
