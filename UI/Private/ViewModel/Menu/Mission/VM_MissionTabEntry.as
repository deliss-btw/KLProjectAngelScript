
namespace FVM_MissionTabEntry
{
    const int ModelId = 0;

}
struct FVM_MissionTabEntry : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_TabTittle;
    UPROPERTY()
    EMissionTabType m_TabType;
    UPROPERTY()
    bool m_bIsSelected;
    UPROPERTY()
    TEUIModelRef<FVM_RedDot> m_RedDotVM;

    FVM_MissionTabEntry()
    {
        this.m_TabType = EMissionTabType(0);
        this.m_bIsSelected = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_MissionTabEntry' by default constructor.");
        return;
    }
    FVM_MissionTabEntry(const FVM_MissionTabEntry &inout Other)
    {
        this.m_TabType = EMissionTabType(0);
        this.m_bIsSelected = false;
        this.m_TabTittle = Other.m_TabTittle;
        this.m_TabType = Other.m_TabType;
        this.m_bIsSelected = Other.m_bIsSelected;
        this.m_RedDotVM = Other.m_RedDotVM;
        return;
    }
    FVM_MissionTabEntry(const FText &inout InTabTittle, const EMissionTabType InTabType)
    {
        this.m_TabType = EMissionTabType(0);
        this.m_bIsSelected = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetTabTittle(InTabTittle);
        this.SetTabType(EMissionTabType(InTabType));
        return;
    }
    FVM_MissionTabEntry& opAssign(const FVM_MissionTabEntry &inout Other)
    {
        this.m_TabTittle = Other.m_TabTittle;
        this.m_TabType = Other.m_TabType;
        this.m_bIsSelected = Other.m_bIsSelected;
        return Other.m_RedDotVM;
    }
    void PostConstruct()
    {
        if (int(this.GetTabType()) == 2)
        {
            this.SetRedDotVM(TEUIModelRef<FVM_RedDot>(::FVM_RedDot::Create(this.GetContext().Manager, FRedDotNodeData(GameplayTags::RedDotSystem_Mission_NewMainMissionTab, 0))));
            return;
        }
        if (int(this.GetTabType()) == 3)
        {
            this.SetRedDotVM(TEUIModelRef<FVM_RedDot>(::FVM_RedDot::Create(this.GetContext().Manager, FRedDotNodeData(GameplayTags::RedDotSystem_Mission_NewSideMissionTab, 0))));
        }
        return;
    }
    int GetSwitcherIndex() const
    {
        return this.GetbIsSelected() ? 1 : 0;
    }
    const FText GetTabTittle() const property
    {
        const FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_TabTittle() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTabTittle(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TabTittle = __Value;
        return;
    }
    EMissionTabType GetTabType() const property
    {
        this.TrackPropertyRead(1);
        return this.m_TabType;
    }
    void SetTabType(const EMissionTabType __Value) property
    {
        if (int(this.m_TabType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_TabType = __Value;
        return;
    }
    bool GetbIsSelected() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bIsSelected;
    }
    void SetbIsSelected(const bool __Value) property
    {
        if (!(this.m_bIsSelected) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bIsSelected = __Value;
        return;
    }
    TEUIModelRef<FVM_RedDot> GetRedDotVM() const property
    {
        this.TrackPropertyRead(3);
        return this.m_RedDotVM;
    }
    void SetRedDotVM(const TEUIModelRef<FVM_RedDot> &inout __Value) property
    {
        TEUIModelRef<FVM_RedDot> local_2;
        local_2 = this.m_RedDotVM;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_RedDotVM = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_MissionTabEntry
{
    UPROPERTY()
    int SwitcherIndex;
    UPROPERTY()
    TEUIModelRef<FVM_MissionTabEntry> Self;


}

namespace FVM_MissionTabEntry
{
FVM_MissionTabEntry& Create(const UObject ContextObject, const FText &inout TabTittle, const EMissionTabType TabType)
{
    return FVM_MissionTabEntry::CreateByManager(EUIInternal::GetContextManager(ContextObject), TabTittle);
}
FVM_MissionTabEntry CreateByManager(const UEUIManagerSubsystem Manager, const FText &inout TabTittle, const EMissionTabType TabType)
{
    FVM_MissionTabEntry __r;
    TEUIModelRef<FVM_MissionTabEntry> local_6 = TEUIModelRef<FVM_MissionTabEntry>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_MissionTabEntry::ModelId, 0, TabTittle, TabType));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "TabTittle";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TabType";
    local_14.TypeName = "EMissionTabType";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsSelected";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RedDotVM";
    local_14.TypeName = "TEUIModelRef<FVM_RedDot>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SwitcherIndex";
    local_14.TypeName = "int32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MissionTabEntry>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MissionTabEntry;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MissionTabEntry;
}
FText __UIGetter_TabTittle(const FVM_MissionTabEntry &inout Model)
{
    return Model.GetTabTittle();
}
EMissionTabType __UIGetter_TabType(const FVM_MissionTabEntry &inout Model)
{
    return Model.GetTabType();
}
bool __UIGetter_bIsSelected(const FVM_MissionTabEntry &inout Model)
{
    return Model.GetbIsSelected();
}
TEUIModelRef<FVM_RedDot> __UIGetter_RedDotVM(const FVM_MissionTabEntry &inout Model)
{
    return Model.GetRedDotVM();
}
int __UIGetter_SwitcherIndex(const FVM_MissionTabEntry &inout Model)
{
    return Model.GetSwitcherIndex();
}
TEUIModelRef<FVM_MissionTabEntry> __UIGetter_Self(const FVM_MissionTabEntry &inout Model)
{
    return TEUIModelRef<FVM_MissionTabEntry>(Model);
}
int __IndexOf_TabTittle()
{
    return 0;
}
int __IndexOf_TabType()
{
    return 1;
}
int __IndexOf_bIsSelected()
{
    return 2;
}
int __IndexOf_RedDotVM()
{
    return 3;
}
}
namespace __GeneratedProperties_FVM_MissionTabEntry
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
