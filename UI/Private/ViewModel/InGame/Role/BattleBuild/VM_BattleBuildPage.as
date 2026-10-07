
namespace FVMS_BattleBuildPage
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature ChangeQuickSlot = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature ResetQuickSlot = FEUIModelCallbackSignature();

}
struct FVMS_BattleBuildPage : FEUIViewModelSingleton
{
    FEUIViewModelSingleton _base_FEUIViewModelSingleton;
    UPROPERTY()
    TArray<FEUIModelRef> m_SelectListEntries;
    UPROPERTY()
    TDataObjectPtr<FItemQuickSlotConfig> m_SelectedQuickSlot;
    UPROPERTY()
    TDataObjectPtr<FItemConfig> m_SelectedItemConfig;
    UPROPERTY()
    int m_QuickSlotChanged;

    FVMS_BattleBuildPage()
    {
        this.m_QuickSlotChanged = 0;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVMS_BattleBuildPage(const FVMS_BattleBuildPage &inout Other)
    {
        this.m_QuickSlotChanged = 0;
        this.m_SelectListEntries = Other.m_SelectListEntries;
        this.m_SelectedQuickSlot = Other.m_SelectedQuickSlot;
        this.m_SelectedItemConfig = Other.m_SelectedItemConfig;
        this.m_QuickSlotChanged = int(Other.m_QuickSlotChanged);
        return;
    }
    FVMS_BattleBuildPage opAssign(const FVMS_BattleBuildPage &inout Other)
    {
        FVMS_BattleBuildPage __r;
        this.m_SelectListEntries = Other.m_SelectListEntries;
        this.m_SelectedQuickSlot = Other.m_SelectedQuickSlot;
        this.m_SelectedItemConfig = Other.m_SelectedItemConfig;
        this.m_QuickSlotChanged = int(Other.m_QuickSlotChanged);
        return __r;
    }
    void OnSelectedQuickSlotChanged()
    {
        this.UpdateSelectListEntries();
        return;
    }
    void OnQuickSlotItemChanged(const FCE_NotifyQuickSlotItemChanged &inout Event)
    {
        this.UpdateSelectListEntries();
        return;
    }
    void ChangeQuickSlot()
    {
        if (!(this.GetSelectedQuickSlot()) || !(this.GetSelectedItemConfig()))
        {
            return;
        }
        this.SetQuickSlotChanged((this.GetQuickSlotChanged() + 1));
        ::InventoryUtils::SetQuickSlotItem(this.GetContext().GetLocalPlayer(), this.GetSelectedQuickSlot(), this.GetSelectedItemConfig());
        return;
    }
    void ResetQuickSlot()
    {
        if (this.GetSelectedQuickSlot().opArrow().bAllowEmpty)
        {
            ::InventoryUtils::SetQuickSlotItem(this.GetContext().GetLocalPlayer(), this.GetSelectedQuickSlot(), TDataObjectPtr<FItemConfig>(nullptr));
            this.SetQuickSlotChanged((this.GetQuickSlotChanged() + 1));
        }
        return;
    }
    FSlateBrush GetMovieImage() const
    {
        return FSoftBrush().LoadBrush();
    }
    FText GetTypeDescription() const
    {
        return FText();
    }
    bool CanResetQuickSlot() const
    {
        if (!(this.GetSelectedQuickSlot()) || !(this.GetSelectedQuickSlot().opArrow().bAllowEmpty))
        {
            return false;
        }
        TDataObjectPtr<FItemConfig> local_30 = ::InventoryUtils::GetQuickSlotItem(this.GetContext().GetLocalPlayer(), this.GetSelectedQuickSlot());
        bool local_1 = !((local_30 == nullptr));
        if (!(local_1))
        {
            local_1 = false;
        }
        else
        {
            FDataObjectPtr local_78;
            local_78;
            local_1 = (local_30 == local_78);
        }
        return local_1;
    }
    bool CanChangeQuickSlot() const
    {
        bool local_1;
        if (!(this.GetSelectedQuickSlot()))
        {
            local_1 = false;
        }
        else
        {
            local_1 = this.GetSelectedItemConfig();
        }
        if (!(local_1))
        {
            local_1 = false;
        }
        else
        {
            TDataObjectPtr<FItemConfig> local_54;
            local_54 = this.GetSelectedItemConfig();
            local_1 = !((local_54 == ::InventoryUtils::GetQuickSlotItem(this.GetContext().GetLocalPlayer(), this.GetSelectedQuickSlot()).opImplConv()));
        }
        return local_1;
    }
    void UpdateSelectListEntries()
    {
        FEUIModelRef local_56;
        this.GetModify_SelectListEntries().Empty(0);
        if (!(this.GetSelectedQuickSlot()))
        {
            return;
        }
        if (::InventoryUtils::GetQuickSlotItem(this.GetContext().GetLocalPlayer(), this.GetSelectedQuickSlot()))
        {
            this.GetModify_SelectListEntries().Add(local_56);
        }
        for (auto& local_74 : ::InventoryUtils::GetAllValidItemsForQuickSlot(this.GetContext().GetLocalPlayer(), this.GetSelectedQuickSlot()))
        {
            local_74;
            this.GetModify_SelectListEntries().Add(local_56);
        }
        return;
    }
    const TArray<FEUIModelRef> GetSelectListEntries() const property
    {
        const TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_SelectListEntries() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetSelectListEntries(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_SelectListEntries = __Value;
        return;
    }
    const TDataObjectPtr<FItemQuickSlotConfig> GetSelectedQuickSlot() const property
    {
        const TDataObjectPtr<FItemQuickSlotConfig> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TDataObjectPtr<FItemQuickSlotConfig> GetModify_SelectedQuickSlot() property
    {
        TDataObjectPtr<FItemQuickSlotConfig> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetSelectedQuickSlot(const TDataObjectPtr<FItemQuickSlotConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_SelectedQuickSlot = __Value;
        return;
    }
    const TDataObjectPtr<FItemConfig> GetSelectedItemConfig() const property
    {
        const TDataObjectPtr<FItemConfig> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TDataObjectPtr<FItemConfig> GetModify_SelectedItemConfig() property
    {
        TDataObjectPtr<FItemConfig> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetSelectedItemConfig(const TDataObjectPtr<FItemConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_SelectedItemConfig = __Value;
        return;
    }
    int GetQuickSlotChanged() const property
    {
        this.TrackPropertyRead(3);
        return this.m_QuickSlotChanged;
    }
    void SetQuickSlotChanged(const int __Value) property
    {
        if (this.m_QuickSlotChanged == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_QuickSlotChanged = __Value;
        return;
    }
}

struct __GeneratedProperties_FVMS_BattleBuildPage
{
    UPROPERTY()
    FSlateBrush MovieImage;
    UPROPERTY()
    FText TypeDescription;
    UPROPERTY()
    bool CanResetQuickSlot;
    UPROPERTY()
    bool CanChangeQuickSlot;
    UPROPERTY()
    TEUIModelRef<FVMS_BattleBuildPage> Self;


}

namespace FVMS_BattleBuildPage
{
FVMS_BattleBuildPage& Get(const UObject ContextObject)
{
    return FVMS_BattleBuildPage::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FVMS_BattleBuildPage GetByManager(const UEUIManagerSubsystem Manager)
{
    FVMS_BattleBuildPage __r;
    TEUIModelRef<FVMS_BattleBuildPage> local_6 = TEUIModelRef<FVMS_BattleBuildPage>(EUIInternal::MakeModelWithManager(Manager, FVMS_BattleBuildPage::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "SelectListEntries";
    local_14.TypeName = "TArray<FEUIModelRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedItemConfig";
    local_14.TypeName = "TDataObjectPtr<FItemConfig>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MovieImage";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "TypeDescription";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CanResetQuickSlot";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "CanChangeQuickSlot";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVMS_BattleBuildPage>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVMS_BattleBuildPage;
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__OnSelectedQuickSlotChanged";
    local_24.DirtyFlags.Set(FVMS_BattleBuildPage::__IndexOf_SelectedQuickSlot());
    Result.DirtyFunctions.Add(local_24);
    FEUIModelEventDefine local_30;
    local_30.FunctionName = "__OnQuickSlotItemChanged";
    local_30.EventType = FCE_NotifyQuickSlotItemChanged;
    Result.EventFunctions.Add(local_30);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVMS_BattleBuildPage;
}
void __OnSelectedQuickSlotChanged(FVMS_BattleBuildPage &inout Model)
{
    Model.OnSelectedQuickSlotChanged();
    return;
}
void __OnQuickSlotItemChanged(FVMS_BattleBuildPage &inout Model, const FCE_NotifyQuickSlotItemChanged &inout Event)
{
    Model.OnQuickSlotItemChanged(Event);
    return;
}
TArray<FEUIModelRef> __UIGetter_SelectListEntries(const FVMS_BattleBuildPage &inout Model)
{
    return Model.GetSelectListEntries();
}
TDataObjectPtr<FItemConfig> __UIGetter_SelectedItemConfig(const FVMS_BattleBuildPage &inout Model)
{
    return Model.GetSelectedItemConfig();
}
FSlateBrush __UIGetter_MovieImage(const FVMS_BattleBuildPage &inout Model)
{
    return Model.GetMovieImage();
}
FText __UIGetter_TypeDescription(const FVMS_BattleBuildPage &inout Model)
{
    return Model.GetTypeDescription();
}
bool __UIGetter_CanResetQuickSlot(const FVMS_BattleBuildPage &inout Model)
{
    return Model.CanResetQuickSlot();
}
bool __UIGetter_CanChangeQuickSlot(const FVMS_BattleBuildPage &inout Model)
{
    return Model.CanChangeQuickSlot();
}
TEUIModelRef<FVMS_BattleBuildPage> __UIGetter_Self(const FVMS_BattleBuildPage &inout Model)
{
    return TEUIModelRef<FVMS_BattleBuildPage>(Model);
}
int __IndexOf_SelectListEntries()
{
    return 0;
}
int __IndexOf_SelectedQuickSlot()
{
    return 1;
}
int __IndexOf_SelectedItemConfig()
{
    return 2;
}
int __IndexOf_QuickSlotChanged()
{
    return 3;
}
}
namespace __GeneratedProperties_FVMS_BattleBuildPage
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
