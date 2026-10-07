
namespace FVM_MinimapIcon
{
    const int ModelId = 0;

}
struct FVM_MinimapIcon : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_Spot> m_Spot;
    UPROPERTY()
    TWeakObjectPtr<UEUIMinimap> m_OwningMinimap;
    UPROPERTY()
    TWeakObjectPtr<UEUIUserWidget> m_OwningIcon;
    UPROPERTY()
    TDataObjectPtr<FMinimapIconConfig> m_MinimapIconConfig;
    UPROPERTY()
    bool m_bIsSelected;

    FVM_MinimapIcon()
    {
        this.m_bIsSelected = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_MinimapIcon' by default constructor.");
        return;
    }
    FVM_MinimapIcon(const FVM_MinimapIcon &inout Other)
    {
        this.m_bIsSelected = false;
        this.m_Spot = Other.m_Spot;
        this.m_OwningMinimap = Other.m_OwningMinimap;
        this.m_OwningIcon = Other.m_OwningIcon;
        this.m_MinimapIconConfig = Other.m_MinimapIconConfig;
        this.m_bIsSelected = Other.m_bIsSelected;
        return;
    }
    FVM_MinimapIcon(const TEUIModelRef<FM_Spot> &inout InSpot, const TWeakObjectPtr<UEUIMinimap> &inout InOwningMinimap, const TWeakObjectPtr<UEUIUserWidget> &inout InOwningIcon)
    {
        this.m_bIsSelected = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetSpot(InSpot);
        this.SetOwningMinimap(InOwningMinimap);
        this.SetOwningIcon(InOwningIcon);
        return;
    }
    FVM_MinimapIcon opAssign(const FVM_MinimapIcon &inout Other)
    {
        FVM_MinimapIcon __r;
        this.m_Spot = Other.m_Spot;
        this.m_OwningMinimap = Other.m_OwningMinimap;
        this.m_OwningIcon = Other.m_OwningIcon;
        this.m_MinimapIconConfig = Other.m_MinimapIconConfig;
        this.m_bIsSelected = Other.m_bIsSelected;
        return __r;
    }
    void PostConstruct()
    {
        FSpotViewAdapter local_10;
        this.SetMinimapIconConfig(::GetMinimapIconConfig(this.GetSpot().opArrow(), local_10));
        return;
    }
    void HandleSelectionChanged(const FMsg_OnItemSelectionChanged &inout Changed)
    {
        this.SetbIsSelected((int(Changed.bIsSelected) != 0));
        return;
    }
    void HandleSpotChanged(const FMsg_SpotPresentationDataModified &inout Msg)
    {
        if (int(Msg.DataType) == 1)
        {
            FSpotViewAdapter local_14;
            this.SetMinimapIconConfig(::GetMinimapIconConfig(this.GetSpot().opArrow(), local_14));
        }
        return;
    }
    TEUIModelRef<FM_Spot> GetSpot() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Spot;
    }
    void SetSpot(const TEUIModelRef<FM_Spot> &inout __Value) property
    {
        TEUIModelRef<FM_Spot> local_2;
        local_2 = this.m_Spot;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Spot = __Value;
        return;
    }
    TWeakObjectPtr<UEUIMinimap> GetOwningMinimap() const property
    {
        this.TrackPropertyRead(1);
        return this.m_OwningMinimap;
    }
    void SetOwningMinimap(const TWeakObjectPtr<UEUIMinimap> &inout __Value) property
    {
        if ((this.m_OwningMinimap == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_OwningMinimap = __Value;
        return;
    }
    TWeakObjectPtr<UEUIUserWidget> GetOwningIcon() const property
    {
        this.TrackPropertyRead(2);
        return this.m_OwningIcon;
    }
    void SetOwningIcon(const TWeakObjectPtr<UEUIUserWidget> &inout __Value) property
    {
        if ((this.m_OwningIcon == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_OwningIcon = __Value;
        return;
    }
    const TDataObjectPtr<FMinimapIconConfig> GetMinimapIconConfig() const property
    {
        const TDataObjectPtr<FMinimapIconConfig> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TDataObjectPtr<FMinimapIconConfig> GetModify_MinimapIconConfig() property
    {
        TDataObjectPtr<FMinimapIconConfig> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetMinimapIconConfig(const TDataObjectPtr<FMinimapIconConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_MinimapIconConfig = __Value;
        return;
    }
    bool GetbIsSelected() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bIsSelected;
    }
    void SetbIsSelected(const bool __Value) property
    {
        if (!(this.m_bIsSelected) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bIsSelected = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_MinimapIcon
{
    UPROPERTY()
    TEUIModelRef<FVM_MinimapIcon> Self;

    __GeneratedProperties_FVM_MinimapIcon()
    {
        return;
    }
}

namespace FVM_MinimapIcon
{
FVM_MinimapIcon& Create(const UObject ContextObject, const TEUIModelRef<FM_Spot> &inout Spot, const TWeakObjectPtr<UEUIMinimap> &inout OwningMinimap, const TWeakObjectPtr<UEUIUserWidget> &inout OwningIcon)
{
    return FVM_MinimapIcon::CreateByManager(EUIInternal::GetContextManager(ContextObject), Spot, OwningMinimap, OwningIcon);
}
FVM_MinimapIcon CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_Spot> &inout Spot, const TWeakObjectPtr<UEUIMinimap> &inout OwningMinimap, const TWeakObjectPtr<UEUIUserWidget> &inout OwningIcon)
{
    FVM_MinimapIcon __r;
    TEUIModelRef<FVM_MinimapIcon> local_6 = TEUIModelRef<FVM_MinimapIcon>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_MinimapIcon::ModelId, 0, Spot, OwningMinimap, OwningIcon));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UScriptStruct GetModelStruct()
{
    return FVM_MinimapIcon;
}
void __HandleSelectionChanged(FVM_MinimapIcon &inout Model, const FMsg_OnItemSelectionChanged &inout Message)
{
    Model.HandleSelectionChanged(Message);
    return;
}
void __HandleSpotChanged(FVM_MinimapIcon &inout Model, const FMsg_SpotPresentationDataModified &inout Message)
{
    Model.HandleSpotChanged(Message);
    return;
}
TDataObjectPtr<FMinimapIconConfig> __UIGetter_MinimapIconConfig(const FVM_MinimapIcon &inout Model)
{
    return Model.GetMinimapIconConfig();
}
bool __UIGetter_bIsSelected(const FVM_MinimapIcon &inout Model)
{
    return Model.GetbIsSelected();
}
TEUIModelRef<FVM_MinimapIcon> __UIGetter_Self(const FVM_MinimapIcon &inout Model)
{
    return TEUIModelRef<FVM_MinimapIcon>(Model);
}
int __IndexOf_Spot()
{
    return 0;
}
int __IndexOf_OwningMinimap()
{
    return 1;
}
int __IndexOf_OwningIcon()
{
    return 2;
}
int __IndexOf_MinimapIconConfig()
{
    return 3;
}
int __IndexOf_bIsSelected()
{
    return 4;
}
}
namespace __GeneratedProperties_FVM_MinimapIcon
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
