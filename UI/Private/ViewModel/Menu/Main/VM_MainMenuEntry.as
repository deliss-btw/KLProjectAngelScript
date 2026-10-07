
namespace FVM_MainMenuEntry
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature EnterMenuPage = FEUIModelCallbackSignature();

}
struct FVM_MainMenuEntry : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TDataObjectPtr<FMenuConfig> m_MenuConfig;
    UPROPERTY()
    FMenuOperation m_MenuOperation;
    UPROPERTY()
    TEUIModelRef<FVM_RedDot> m_MenuRedDot;

    FVM_MainMenuEntry()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_MainMenuEntry' by default constructor.");
        return;
    }
    FVM_MainMenuEntry(const FVM_MainMenuEntry &inout Other)
    {
        this.m_MenuConfig = Other.m_MenuConfig;
        this.m_MenuRedDot = Other.m_MenuRedDot;
        return;
    }
    FVM_MainMenuEntry(const TDataObjectPtr<FMenuConfig> &inout InMenuConfig, const FMenuOperation &inout InMenuOperation)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetMenuConfig(InMenuConfig);
        this.SetMenuOperation(InMenuOperation);
        return;
    }
    FVM_MainMenuEntry& opAssign(const FVM_MainMenuEntry &inout Other)
    {
        this.m_MenuConfig = Other.m_MenuConfig;
        return Other.m_MenuRedDot;
    }
    void PostConstruct()
    {
        if (this.GetMenuConfig())
        {
            FRedDotNodeData local_4;
            if (local_4.NodeTag.IsValid())
            {
                this.SetMenuRedDot(TEUIModelRef<FVM_RedDot>(::FVM_RedDot::Create(this.GetManager(), local_4)));
            }
        }
        return;
    }
    FSoftBrush GetMenuIcon() const
    {
        if (this.GetMenuConfig())
        {
            return this.GetMenuConfig().opArrow().MenuIcon;
        }
        return this.GetMenuOperation().OperationIcon;
    }
    FText GetMenuName() const
    {
        if (this.GetMenuConfig())
        {
            return this.GetMenuConfig().opArrow().MenuName;
        }
        return this.GetMenuOperation().OperationName;
    }
    TArray<FEUIInputAction> GetInputActions() const
    {
        TArray<FEUIInputAction> local_4;
        if (this.GetMenuConfig())
        {
            const TDataObjectPtr<FSystemControlConfig>& local_8 = this.GetMenuConfig().opArrow().GetSystemControlConfig();
            if (local_8)
            {
                local_4.Add(local_8.opArrow().EntranceInput);
            }
            else
            {
                local_4.Add(this.GetMenuConfig().opArrow().EntryAction);
            }
        }
        return local_4;
    }
    void EnterMenuPage() const
    {
        if (this.GetMenuConfig())
        {
            FEUIWidgetRef local_4 = FEUIWidget::FindWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_Menu);
            if (local_4)
            {
                FEUIWidget::RemoveWidget(local_4);
            }
            FEUIWidgetTag local_8 = this.GetMenuConfig().opArrow().GetEntranceWidget();
            return;
        }
        switch (int(this.GetMenuOperation().Function))
        {
        case 0:
        {
            ::FVMS_ExitGame::Get(this.GetManager()).ExitGame();
            return;
        }
        case 1:
        {
            ::FMS_Unstuck::Get(this.GetManager()).Unstuck();
            return;
        }
        case 2:
        {
            ::FMS_Feedback::Get(this.GetManager()).Feedback();
            return;
        }
        }
        return;
    }
    const TDataObjectPtr<FMenuConfig> GetMenuConfig() const property
    {
        const TDataObjectPtr<FMenuConfig> __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    TDataObjectPtr<FMenuConfig> GetModify_MenuConfig() property
    {
        TDataObjectPtr<FMenuConfig> __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetMenuConfig(const TDataObjectPtr<FMenuConfig> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_MenuConfig = __Value;
        return;
    }
    const FMenuOperation GetMenuOperation() const property
    {
        const FMenuOperation __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FMenuOperation GetModify_MenuOperation() property
    {
        FMenuOperation __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetMenuOperation(const FMenuOperation &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        return;
    }
    TEUIModelRef<FVM_RedDot> GetMenuRedDot() const property
    {
        this.TrackPropertyRead(2);
        return this.m_MenuRedDot;
    }
    void SetMenuRedDot(const TEUIModelRef<FVM_RedDot> &inout __Value) property
    {
        TEUIModelRef<FVM_RedDot> local_2;
        local_2 = this.m_MenuRedDot;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_MenuRedDot = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_MainMenuEntry
{
    UPROPERTY()
    FSoftBrush MenuIcon;
    UPROPERTY()
    FText MenuName;
    UPROPERTY()
    TArray<FEUIInputAction> InputActions;
    UPROPERTY()
    TEUIModelRef<FVM_MainMenuEntry> Self;

    __GeneratedProperties_FVM_MainMenuEntry()
    {
        return;
    }
}

namespace FVM_MainMenuEntry
{
FVM_MainMenuEntry& Create(const UObject ContextObject, const TDataObjectPtr<FMenuConfig> &inout MenuConfig, const FMenuOperation &inout MenuOperation)
{
    return FVM_MainMenuEntry::CreateByManager(EUIInternal::GetContextManager(ContextObject), MenuConfig, MenuOperation);
}
FVM_MainMenuEntry CreateByManager(const UEUIManagerSubsystem Manager, const TDataObjectPtr<FMenuConfig> &inout MenuConfig, const FMenuOperation &inout MenuOperation)
{
    FVM_MainMenuEntry __r;
    TEUIModelRef<FVM_MainMenuEntry> local_6 = TEUIModelRef<FVM_MainMenuEntry>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_MainMenuEntry::ModelId, 0, MenuConfig, MenuOperation));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "MenuRedDot";
    local_14.TypeName = "TEUIModelRef<FVM_RedDot>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MenuIcon";
    local_14.TypeName = "FSoftBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MenuName";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "InputActions";
    local_14.TypeName = "TArray<FEUIInputAction>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MainMenuEntry>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MainMenuEntry;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MainMenuEntry;
}
TEUIModelRef<FVM_RedDot> __UIGetter_MenuRedDot(const FVM_MainMenuEntry &inout Model)
{
    return Model.GetMenuRedDot();
}
FSoftBrush __UIGetter_MenuIcon(const FVM_MainMenuEntry &inout Model)
{
    return Model.GetMenuIcon();
}
FText __UIGetter_MenuName(const FVM_MainMenuEntry &inout Model)
{
    return Model.GetMenuName();
}
TArray<FEUIInputAction> __UIGetter_InputActions(const FVM_MainMenuEntry &inout Model)
{
    return Model.GetInputActions();
}
TEUIModelRef<FVM_MainMenuEntry> __UIGetter_Self(const FVM_MainMenuEntry &inout Model)
{
    return TEUIModelRef<FVM_MainMenuEntry>(Model);
}
int __IndexOf_MenuConfig()
{
    return 0;
}
int __IndexOf_MenuOperation()
{
    return 1;
}
int __IndexOf_MenuRedDot()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_MainMenuEntry
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
