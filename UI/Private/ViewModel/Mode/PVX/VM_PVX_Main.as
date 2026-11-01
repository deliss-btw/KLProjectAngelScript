namespace FVM_PVX_Main
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnMenuBarIndexSelected = FEUIModelCallbackSignature();

}
struct FVM_PVX_Main : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_ModeItem> m_Mode;
    UPROPERTY()
    EPVXMenuCategoryType m_DefaultMenuType;
    UPROPERTY()
    int m_CurrentMenuIndex;
    UPROPERTY()
    FEUIDynamicWidgetData m_DynamicWidget;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_Text>> m_MenuBarEntries;
    UPROPERTY()
    TArray<EPVXMenuCategoryType> m_MenuCategoryKeys;
    UPROPERTY()
    FGameplayTag CurrentSubPageTag;

    FVM_PVX_Main()
    {
        this.m_DefaultMenuType = EPVXMenuCategoryType(0);
        this.m_CurrentMenuIndex = INDEX_NONE;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_PVX_Main' by default constructor.");
        return;
    }
    FVM_PVX_Main(const FVM_PVX_Main &inout Other)
    {
        this.m_DefaultMenuType = EPVXMenuCategoryType(0);
        this.m_CurrentMenuIndex = INDEX_NONE;
        this.m_Mode = Other.m_Mode;
        this.m_DefaultMenuType = Other.m_DefaultMenuType;
        this.m_CurrentMenuIndex = int(Other.m_CurrentMenuIndex);
        this.m_DynamicWidget = Other.m_DynamicWidget;
        this.m_MenuBarEntries = Other.m_MenuBarEntries;
        this.m_MenuCategoryKeys = Other.m_MenuCategoryKeys;
        return;
    }
    FVM_PVX_Main(const TEUIModelRef<FM_ModeItem> &inout InMode, const EPVXMenuCategoryType InDefaultMenuType)
    {
        this.m_DefaultMenuType = EPVXMenuCategoryType(0);
        this.m_CurrentMenuIndex = INDEX_NONE;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetMode(InMode);
        this.SetDefaultMenuType(EPVXMenuCategoryType(InDefaultMenuType));
        return;
    }
    FVM_PVX_Main& opAssign(const FVM_PVX_Main &inout Other)
    {
        this.m_Mode = Other.m_Mode;
        this.m_DefaultMenuType = Other.m_DefaultMenuType;
        this.m_CurrentMenuIndex = int(Other.m_CurrentMenuIndex);
        this.m_DynamicWidget = Other.m_DynamicWidget;
        this.m_MenuBarEntries = Other.m_MenuBarEntries;
        return Other.m_MenuCategoryKeys;
    }
    void PostConstruct()
    {
        this.GetModify_MenuBarEntries().Empty(0);
        this.GetModify_MenuCategoryKeys().Empty(0);
        for (auto& local_24 : ::PVXEntrySettings::Get().MenuCategories)
        {
            this.GetModify_MenuBarEntries().Add(TEUIModelRef<FVM_Text>(::FVM_Text::Create(this.GetContext().Manager, local_24.GetValue().CategoryName)));
            this.GetModify_MenuCategoryKeys().Add(local_24.GetKey());
        }
        this.SetCurrentMenuIndex(this.GetMenuCategoryKeys().IndexOfByKey(EPVXMenuCategoryType(this.GetDefaultMenuType())));
        if (this.GetCurrentMenuIndex() == INDEX_NONE)
        {
            this.SetCurrentMenuIndex(0);
        }
        return;
    }
    FEUIModelContainer CreateMenuPageModel(const EPVXMenuCategoryType Type)
    {
        switch (int(Type))
        {
        case 1:
        {
            TEUIModelWeakRef<FM_ModeItem> local_6 = TEUIModelWeakRef<FM_ModeItem>(this.GetMode().Get());
            return FEUIModelContainer(::FVM_PVX_Match::Create(this.GetContext().Manager, local_6));
        }
        case 0:
        {
            return FEUIModelContainer(::FVM_PVX_CombatPreparation::Create(this.GetContext().Manager));
        }
        }
        return FEUIModelContainer();
    }
    FEUIModelContainer GetSelectedMenuBarItem() const
    {
        if (this.GetMenuBarEntries().IsValidIndex(this.GetCurrentMenuIndex()))
        {
            FEUIModelRef local_18;
            int local_1 = this.GetCurrentMenuIndex();
            local_18;
            return FEUIModelContainer(local_18);
        }
        return FEUIModelContainer();
    }
    void OnMenuBarIndexSelected(const int Index)
    {
        this.SetCurrentMenuIndex(Index);
        return;
    }
    void OnSwitchMenuCategory(const FMsg_PVXSwitchMenuCategory &inout Msg)
    {
        int local_2 = this.GetMenuCategoryKeys().IndexOfByKey(Msg.TargetType);
        if (local_2 != INDEX_NONE)
        {
            this.SetCurrentMenuIndex(local_2);
        }
        return;
    }
    void OnCurrentMenuIndexChanged()
    {
        if (this.GetMenuBarEntries().IsValidIndex(this.GetCurrentMenuIndex()))
        {
            int local_3;
            local_3 = this.GetMenuCategoryKeys()[this.GetCurrentMenuIndex()];
            FPVXMenuCategorySettings local_20;
            UPVXEntrySettings local_22 = ::PVXEntrySettings::Get();
            TSoftClassPtr<UEUIUserWidget> local_32 = local_20.PVXPageWidget;
            if (!(local_32.IsNull()))
            {
                FEUIDynamicWidgetData local_56;
                local_56.WidgetClass = local_32;
                local_56.ModelContainer = this.CreateMenuPageModel(EPVXMenuCategoryType(local_3));
                this.SetDynamicWidget(local_56);
            }
        }
        return;
    }
    void UpdateSubPagePresence(const FGameplayTag &inout NewSubPageTag)
    {
        if ((this.CurrentSubPageTag == NewSubPageTag))
        {
            return;
        }
        if (this.CurrentSubPageTag.IsValid())
        {
            FMsg_SubPagePresence local_6;
            FEUIModelRef local_12 = FEUIModelRef(this);
            FEUIMessageBus::Publish(EUIMessageBus);
            local_6.WidgetTag = this.CurrentSubPageTag;
            local_6.bPresented = false;
        }
        if (NewSubPageTag.IsValid())
        {
            FMsg_SubPagePresence local_6;
            FEUIModelRef local_12_2 = FEUIModelRef(this);
            FEUIMessageBus::Publish(EUIMessageBus);
            local_6.WidgetTag = NewSubPageTag;
            local_6.bPresented = true;
        }
        this.CurrentSubPageTag = NewSubPageTag;
        return;
    }
    void BeginDestroy()
    {
        this.UpdateSubPagePresence(FGameplayTag());
        return;
    }
    TEUIModelRef<FM_ModeItem> GetMode() const property
    {
        this.TrackPropertyRead(0);
        return this.m_Mode;
    }
    void SetMode(const TEUIModelRef<FM_ModeItem> &inout __Value) property
    {
        TEUIModelRef<FM_ModeItem> local_2;
        local_2 = this.m_Mode;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Mode = __Value;
        return;
    }
    EPVXMenuCategoryType GetDefaultMenuType() const property
    {
        this.TrackPropertyRead(1);
        return this.m_DefaultMenuType;
    }
    void SetDefaultMenuType(const EPVXMenuCategoryType __Value) property
    {
        if (int(this.m_DefaultMenuType) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_DefaultMenuType = __Value;
        return;
    }
    int GetCurrentMenuIndex() const property
    {
        this.TrackPropertyRead(2);
        return this.m_CurrentMenuIndex;
    }
    void SetCurrentMenuIndex(const int __Value) property
    {
        if (this.m_CurrentMenuIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_CurrentMenuIndex = __Value;
        return;
    }
    const FEUIDynamicWidgetData GetDynamicWidget() const property
    {
        const FEUIDynamicWidgetData __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FEUIDynamicWidgetData GetModify_DynamicWidget() property
    {
        FEUIDynamicWidgetData __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetDynamicWidget(const FEUIDynamicWidgetData &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_DynamicWidget = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_Text>> GetMenuBarEntries() const property
    {
        const TArray<TEUIModelRef<FVM_Text>> __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    TArray<TEUIModelRef<FVM_Text>> GetModify_MenuBarEntries() property
    {
        TArray<TEUIModelRef<FVM_Text>> __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetMenuBarEntries(const TArray<TEUIModelRef<FVM_Text>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_MenuBarEntries = __Value;
        return;
    }
    const TArray<EPVXMenuCategoryType> GetMenuCategoryKeys() const property
    {
        const TArray<EPVXMenuCategoryType> __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    TArray<EPVXMenuCategoryType> GetModify_MenuCategoryKeys() property
    {
        TArray<EPVXMenuCategoryType> __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetMenuCategoryKeys(const TArray<EPVXMenuCategoryType> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_MenuCategoryKeys = __Value;
        return;
    }
}

struct FMsg_PVXSwitchMenuCategory : FEUIMessage
{
    UPROPERTY()
    EPVXMenuCategoryType TargetType = EPVXMenuCategoryType(1);

}

struct __GeneratedProperties_FVM_PVX_Main
{
    UPROPERTY()
    FEUIModelContainer SelectedMenuBarItem;
    UPROPERTY()
    TEUIModelRef<FVM_PVX_Main> Self;

    __GeneratedProperties_FVM_PVX_Main()
    {
        return;
    }
}

namespace FVM_PVX_Main
{
FVM_PVX_Main& Create(const UObject ContextObject, const TEUIModelRef<FM_ModeItem> &inout Mode, const EPVXMenuCategoryType DefaultMenuType)
{
    return FVM_PVX_Main::CreateByManager(EUIInternal::GetContextManager(ContextObject), Mode, EPVXMenuCategoryType(DefaultMenuType));
}
FVM_PVX_Main& CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FM_ModeItem> &inout Mode, const EPVXMenuCategoryType DefaultMenuType)
{
    return TEUIModelRef<FVM_PVX_Main>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_PVX_Main::ModelId, 0, Mode, DefaultMenuType)).Get();
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "MenuBarEntries";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_Text>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SelectedMenuBarItem";
    local_14.TypeName = "FEUIModelContainer";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_PVX_Main>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_PVX_Main;
    FEUIModelMsgHandleDefine local_26;
    local_26.FunctionName = "__OnSwitchMenuCategory";
    local_26.MessageTypeName = "Msg_PVXSwitchMenuCategory";
    local_26.SourcePropertyModelRefs = FBitSet64(0);
    Result.MessageHandleFunctions.Add(local_26);
    FEUIModelDirtyDefine local_38;
    local_38.FunctionName = "__OnCurrentMenuIndexChanged";
    local_38.DirtyFlags.Set(FVM_PVX_Main::__IndexOf_CurrentMenuIndex());
    Result.DirtyFunctions.Add(local_38);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_PVX_Main;
}
void __OnSwitchMenuCategory(FVM_PVX_Main &inout Model, const FMsg_PVXSwitchMenuCategory &inout Message)
{
    Model.OnSwitchMenuCategory(Message);
    return;
}
void __OnCurrentMenuIndexChanged(FVM_PVX_Main &inout Model)
{
    Model.OnCurrentMenuIndexChanged();
    return;
}
TArray<TEUIModelRef<FVM_Text>> __UIGetter_MenuBarEntries(const FVM_PVX_Main &inout Model)
{
    return Model.GetMenuBarEntries();
}
FEUIModelContainer __UIGetter_SelectedMenuBarItem(const FVM_PVX_Main &inout Model)
{
    return Model.GetSelectedMenuBarItem();
}
TEUIModelRef<FVM_PVX_Main> __UIGetter_Self(const FVM_PVX_Main &inout Model)
{
    return TEUIModelRef<FVM_PVX_Main>(Model);
}
int __IndexOf_Mode()
{
    return 0;
}
int __IndexOf_DefaultMenuType()
{
    return 1;
}
int __IndexOf_CurrentMenuIndex()
{
    return 2;
}
int __IndexOf_DynamicWidget()
{
    return 3;
}
int __IndexOf_MenuBarEntries()
{
    return 4;
}
int __IndexOf_MenuCategoryKeys()
{
    return 5;
}
}
namespace __GeneratedProperties_FVM_PVX_Main
{
UScriptStruct StaticStruct()
{
    return __GeneratedProperties_FVM_PVX_Main.Get();
}
}
