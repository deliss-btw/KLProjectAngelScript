
namespace FVM_TeamPanelTypeItem
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature ChangeToTeamType = FEUIModelCallbackSignature();

}
struct FVM_TeamPanelTypeItem : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelWeakRef<FVM_TeamPanel> m_TeamPanel;
    UPROPERTY()
    ETeamType m_TeamType;

    FVM_TeamPanelTypeItem()
    {
        this.m_TeamType = ETeamType(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_TeamPanelTypeItem' by default constructor.");
        return;
    }
    FVM_TeamPanelTypeItem(const FVM_TeamPanelTypeItem &inout Other)
    {
        this.m_TeamType = ETeamType(0);
        this.m_TeamPanel = Other.m_TeamPanel;
        this.m_TeamType = Other.m_TeamType;
        return;
    }
    FVM_TeamPanelTypeItem(const TEUIModelWeakRef<FVM_TeamPanel> &inout InTeamPanel, const ETeamType InTeamType)
    {
        this.m_TeamType = ETeamType(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTeamPanel(InTeamPanel);
        this.SetTeamType(ETeamType(InTeamType));
        return;
    }
    FVM_TeamPanelTypeItem opAssign(const FVM_TeamPanelTypeItem &inout Other)
    {
        FVM_TeamPanelTypeItem __r;
        this.m_TeamPanel = Other.m_TeamPanel;
        this.m_TeamType = Other.m_TeamType;
        return __r;
    }
    bool IsSelected() const
    {
        int local_5 = int(this.GetTeamPanel().opArrow().GetTeamType());
        int local_6 = int(this.GetTeamType());
        return (local_5 == local_6);
    }
    void ChangeToTeamType()
    {
        int local_3 = int(this.GetTeamType());
        this.GetTeamPanel().opArrow().SetTeamType();
        return;
    }
    TEUIModelWeakRef<FVM_TeamPanel> GetTeamPanel() const property
    {
        this.TrackPropertyRead(0);
        return this.m_TeamPanel;
    }
    void SetTeamPanel(const TEUIModelWeakRef<FVM_TeamPanel> &inout __Value) property
    {
        TEUIModelWeakRef<FVM_TeamPanel> local_2;
        local_2 = this.m_TeamPanel;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TeamPanel = __Value;
        return;
    }
    ETeamType GetTeamType() const property
    {
        this.TrackPropertyRead(1);
        return this.m_TeamType;
    }
    void SetTeamType(const ETeamType __Value) property
    {
        if (int(this.m_TeamType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TeamType = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_TeamPanelTypeItem
{
    UPROPERTY()
    bool IsSelected;
    UPROPERTY()
    TEUIModelRef<FVM_TeamPanelTypeItem> Self;


}

namespace FVM_TeamPanelTypeItem
{
FVM_TeamPanelTypeItem& Create(const UObject ContextObject, const TEUIModelWeakRef<FVM_TeamPanel> &inout TeamPanel, const ETeamType TeamType)
{
    return FVM_TeamPanelTypeItem::CreateByManager(EUIInternal::GetContextManager(ContextObject), TeamPanel);
}
FVM_TeamPanelTypeItem CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelWeakRef<FVM_TeamPanel> &inout TeamPanel, const ETeamType TeamType)
{
    FVM_TeamPanelTypeItem __r;
    TEUIModelRef<FVM_TeamPanelTypeItem> local_6 = TEUIModelRef<FVM_TeamPanelTypeItem>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_TeamPanelTypeItem::ModelId, 0, TeamPanel, TeamType));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "IsSelected";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_TeamPanelTypeItem>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_TeamPanelTypeItem;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_TeamPanelTypeItem;
}
bool __UIGetter_IsSelected(const FVM_TeamPanelTypeItem &inout Model)
{
    return Model.IsSelected();
}
TEUIModelRef<FVM_TeamPanelTypeItem> __UIGetter_Self(const FVM_TeamPanelTypeItem &inout Model)
{
    return TEUIModelRef<FVM_TeamPanelTypeItem>(Model);
}
int __IndexOf_TeamPanel()
{
    return 0;
}
int __IndexOf_TeamType()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_TeamPanelTypeItem
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
