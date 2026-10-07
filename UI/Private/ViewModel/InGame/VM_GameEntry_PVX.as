
namespace FVMS_GameEntry_PVX
{
    const int ModelId = 0;

}
struct FVMS_GameEntry_PVX : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    int m_SelectedTeamID;
    UPROPERTY()
    bool m_bTeamIDInitiated;
    UPROPERTY()
    int m_SelectCharWidgetSwitcherIndex;

    FVMS_GameEntry_PVX()
    {
        this.m_SelectedTeamID = 0;
        this.m_bTeamIDInitiated = false;
        this.m_SelectCharWidgetSwitcherIndex = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_GameEntry_PVX(const FVMS_GameEntry_PVX &inout Other)
    {
        this.m_SelectedTeamID = 0;
        this.m_bTeamIDInitiated = false;
        this.m_SelectCharWidgetSwitcherIndex = 0;
        this.m_SelectedTeamID = int(Other.m_SelectedTeamID);
        this.m_bTeamIDInitiated = Other.m_bTeamIDInitiated;
        this.m_SelectCharWidgetSwitcherIndex = int(Other.m_SelectCharWidgetSwitcherIndex);
        return;
    }
    FVMS_GameEntry_PVX opAssign(const FVMS_GameEntry_PVX &inout Other)
    {
        FVMS_GameEntry_PVX __r;
        this.m_SelectedTeamID = int(Other.m_SelectedTeamID);
        this.m_bTeamIDInitiated = Other.m_bTeamIDInitiated;
        this.m_SelectCharWidgetSwitcherIndex = int(Other.m_SelectCharWidgetSwitcherIndex);
        return __r;
    }
    void Tick()
    {
        if (!(this.GetbTeamIDInitiated()))
        {
            this.SetbTeamIDInitiated(this.SendTeamIDChangeEvent());
        }
        return;
    }
    void OnSelectedTeamIDChanged()
    {
        this.SendTeamIDChangeEvent();
        if (this.GetSelectedTeamID() == 2)
        {
            this.SetSelectCharWidgetSwitcherIndex(1);
            return;
        }
        this.SetSelectCharWidgetSwitcherIndex(0);
        return;
    }
    bool SendTeamIDChangeEvent() const
    {
        FCE_ChangeSelectedTeamPVX local_14;
        FFPTime local_10 = FFPTime(-1);
        FECSEntity local_4 = this.GetContext().GetLocalPlayer();
        if (!(local_14))
        {
            return false;
        }
        local_14.NewTeamID = this.GetSelectedTeamID();
        return true;
    }
    int GetSelectedTeamID() const property
    {
        this.TrackPropertyRead(0);
        return this.m_SelectedTeamID;
    }
    void SetSelectedTeamID(const int __Value) property
    {
        if (this.m_SelectedTeamID == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_SelectedTeamID = __Value;
        return;
    }
    bool GetbTeamIDInitiated() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bTeamIDInitiated;
    }
    void SetbTeamIDInitiated(const bool __Value) property
    {
        if (!(this.m_bTeamIDInitiated) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bTeamIDInitiated = __Value;
        return;
    }
    int GetSelectCharWidgetSwitcherIndex() const property
    {
        this.TrackPropertyRead(2);
        return this.m_SelectCharWidgetSwitcherIndex;
    }
    void SetSelectCharWidgetSwitcherIndex(const int __Value) property
    {
        if (this.m_SelectCharWidgetSwitcherIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_SelectCharWidgetSwitcherIndex = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_GameEntry_PVX
{
    UPROPERTY()
    TEUIModelRef<FVMS_GameEntry_PVX> Self;

    __GeneratedProperties_FVMS_GameEntry_PVX()
    {
        return;
    }
}

namespace FVMS_GameEntry_PVX
{
FVMS_GameEntry_PVX& Get(const UObject ContextObject)
{
    return FVMS_GameEntry_PVX::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_GameEntry_PVX GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_GameEntry_PVX __r;
    TEUIModelRef<FVMS_GameEntry_PVX> local_6 = TEUIModelRef<FVMS_GameEntry_PVX>(EUIInternal::MakeModelWithManager(Manager, FVMS_GameEntry_PVX::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "SelectCharWidgetSwitcherIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_GameEntry_PVX>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_GameEntry_PVX;
    Result.TickFunction.FunctionName = "__Tick";
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__OnSelectedTeamIDChanged";
    local_24.DirtyFlags.Set(FVMS_GameEntry_PVX::__IndexOf_SelectedTeamID());
    Result.DirtyFunctions.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_GameEntry_PVX;
}
void __Tick(FVMS_GameEntry_PVX &inout Model)
{
    Model.Tick();
    return;
}
void __OnSelectedTeamIDChanged(FVMS_GameEntry_PVX &inout Model)
{
    Model.OnSelectedTeamIDChanged();
    return;
}
int __UIGetter_SelectCharWidgetSwitcherIndex(const FVMS_GameEntry_PVX &inout Model)
{
    return Model.GetSelectCharWidgetSwitcherIndex();
}
TEUIModelRef<FVMS_GameEntry_PVX> __UIGetter_Self(const FVMS_GameEntry_PVX &inout Model)
{
    return TEUIModelRef<FVMS_GameEntry_PVX>(Model);
}
int __IndexOf_SelectedTeamID()
{
    return 0;
}
int __IndexOf_bTeamIDInitiated()
{
    return 1;
}
int __IndexOf_SelectCharWidgetSwitcherIndex()
{
    return 2;
}
}
namespace __GeneratedProperties_FVMS_GameEntry_PVX
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
