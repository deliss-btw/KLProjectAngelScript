
namespace FVM_CommonBGItemMenu
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnButtonClicked = FEUIModelCallbackSignature();

}
struct FVM_CommonBGItemMenu : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FText m_DisplayText;
    UPROPERTY()
    FName m_GroupName;
    UPROPERTY()
    int m_Index;
    UPROPERTY()
    FName m_Signal;
    UPROPERTY()
    bool m_bIsInteractItem;
    UPROPERTY()
    bool m_bSetVisibility;
    UPROPERTY()
    bool m_bForbidden;
    UPROPERTY()
    float32 m_ForbiddenOpacity;
    UPROPERTY()
    int m_HoveredIndex;
    UPROPERTY()
    ESlateVisibility m_Visibility;
    UPROPERTY()
    TSoftClassPtr<UEASAbility> m_AbilityClass;
    UPROPERTY()
    FUIInteractAbilityGroup m_AbilityGroup;

    FVM_CommonBGItemMenu()
    {
        this.m_Index = 0;
        this.m_bIsInteractItem = false;
        this.m_bSetVisibility = false;
        this.m_bForbidden = false;
        this.m_ForbiddenOpacity = 1.0f;
        this.m_HoveredIndex = 0;
        this.m_Visibility = ESlateVisibility(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_CommonBGItemMenu' by default constructor.");
        return;
    }
    FVM_CommonBGItemMenu(const FVM_CommonBGItemMenu &inout Other)
    {
        this.m_Index = 0;
        this.m_bIsInteractItem = false;
        this.m_bSetVisibility = false;
        this.m_bForbidden = false;
        this.m_ForbiddenOpacity = 1.0f;
        this.m_HoveredIndex = 0;
        this.m_Visibility = ESlateVisibility(0);
        this.m_DisplayText = Other.m_DisplayText;
        this.m_GroupName = Other.m_GroupName;
        this.m_Index = int(Other.m_Index);
        this.m_Signal = Other.m_Signal;
        this.m_bIsInteractItem = Other.m_bIsInteractItem;
        this.m_bSetVisibility = Other.m_bSetVisibility;
        this.m_bForbidden = Other.m_bForbidden;
        this.m_ForbiddenOpacity = Other.m_ForbiddenOpacity;
        this.m_HoveredIndex = int(Other.m_HoveredIndex);
        this.m_Visibility = Other.m_Visibility;
        this.m_AbilityClass = Other.m_AbilityClass;
        return;
    }
    FVM_CommonBGItemMenu(const FName &inout InGroupName, const int InIndex, const FName &inout InSignal, const bool InbIsInteractItem, const bool InbSetVisibility)
    {
        this.m_Index = 0;
        this.m_bIsInteractItem = false;
        this.m_bSetVisibility = false;
        this.m_bForbidden = false;
        this.m_ForbiddenOpacity = 1.0f;
        this.m_HoveredIndex = 0;
        this.m_Visibility = ESlateVisibility(0);
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetGroupName(InGroupName);
        this.SetIndex(InIndex);
        this.SetSignal(InSignal);
        this.SetbIsInteractItem(InbIsInteractItem);
        this.SetbSetVisibility(InbSetVisibility);
        return;
    }
    FVM_CommonBGItemMenu& opAssign(const FVM_CommonBGItemMenu &inout Other)
    {
        this.m_DisplayText = Other.m_DisplayText;
        this.m_GroupName = Other.m_GroupName;
        this.m_Index = int(Other.m_Index);
        this.m_Signal = Other.m_Signal;
        this.m_bIsInteractItem = Other.m_bIsInteractItem;
        this.m_bSetVisibility = Other.m_bSetVisibility;
        this.m_bForbidden = Other.m_bForbidden;
        this.m_ForbiddenOpacity = Other.m_ForbiddenOpacity;
        this.m_HoveredIndex = int(Other.m_HoveredIndex);
        this.m_Visibility = Other.m_Visibility;
        return Other.m_AbilityClass;
    }
    void PostConstruct()
    {
        float local_64;
        this.SetAbilityGroup(::UIInteractAbilityConfig::GetUIInteractAbilityGroup(this.GetGroupName()));
        this.SetDisplayText(this.GetAbilityGroup().GroupItems[this.GetIndex()].DisplayText);
        this.SetSignal(this.GetAbilityGroup().GroupItems[this.GetIndex()].Signal);
        this.SetbIsInteractItem(this.GetAbilityGroup().GroupItems[this.GetIndex()].bIsInteractTarget);
        this.SetbSetVisibility(this.GetAbilityGroup().GroupItems[this.GetIndex()].bSetVisibility);
        this.SetAbilityClass(this.GetAbilityGroup().GroupItems[this.GetIndex()].AbilityClass);
        if ((FName(this.GetSignal()) == n"Fuel"))
        {
            this.SetbForbidden((::InventoryUtils::GetInventoryItemNumber(this.GetContext().GetLocalPlayerPawn(), ::InventoryUtils::GetItemConfigByName(n"ConsumeDSItem_Wood")) <= 0));
        }
        if (this.GetbForbidden())
        {
            local_64 = 0.5;
        }
        else
        {
            local_64 = 1.0;
        }
        this.SetForbiddenOpacity(float32(local_64));
        return;
    }
    void OnForbiddenChanged()
    {
        float local_4;
        if (this.GetbForbidden())
        {
            local_4 = 0.5;
        }
        else
        {
            local_4 = 1.0;
        }
        this.SetForbiddenOpacity(float32(local_4));
        return;
    }
    void OnButtonClicked()
    {
        int local_80 = 0;
        if ((FName(this.GetSignal()) == n"Fuel"))
        {
            TDataObjectPtr<FItemConfig> local_28 = ::InventoryUtils::GetItemConfigByName(n"ConsumeDSItem_Wood");
            FECSEntity local_56 = this.GetContext().GetLocalPlayerPawn();
            this.SetbForbidden((::InventoryUtils::GetInventoryItemNumber(local_56, local_28) <= 0));
        }
        if (this.GetbForbidden())
        {
            return;
        }
        FECSEntity local_56_2 = this.GetContext().GetLocalPlayerPawn();
        GetDefaulted local_62;
        const FC_InteractionInfoForESM& local_64 = local_62.opCall();
        if (local_64)
        {
            if (local_64.GetTargetEntity().IsValid())
            {
                FECSEntity local_68 = FECSEntity(this.GetContext().GetLocalPlayerPawn());
                FFPTime local_78 = FFPTime(-1);
                local_80.AbilityOwner = local_64.GetTargetEntity();
                local_80.SignalName = this.GetSignal();
                local_80.InteractTargetPointAndBehaviorIndex = local_64.GetTargetPointAndBehaviorIndex();
            }
        }
        if ((FName(this.GetSignal()) == n"Fuel"))
        {
            this.SetbForbidden((::InventoryUtils::GetInventoryItemNumber(this.GetContext().GetLocalPlayerPawn(), ::InventoryUtils::GetItemConfigByName(n"ConsumeDSItem_Wood")) <= 0));
        }
        if ((FName(this.GetSignal()) == n"Skill"))
        {
            this.OpenSwitchSpecialtyPage();
            return;
        }
        if ((FName(this.GetSignal()) == n"Teleport"))
        {
            this.OpenTeleportPointPage();
        }
        return;
    }
    void OpenSwitchSpecialtyPage()
    {
        FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_Avatar_SwitchSpecialty_Main);
        return;
    }
    void OpenTeleportPointPage()
    {
        FEUIWidget::AddWidget(this.GetContext().UELocalPlayer, GameplayTags::UI_Type_WorldMap);
        return;
    }
    const FText GetDisplayText() const property
    {
        const FText __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FText GetModify_DisplayText() property
    {
        FText __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetDisplayText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_DisplayText = __Value;
        return;
    }
    const FName GetGroupName() const property
    {
        const FName __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FName GetModify_GroupName() property
    {
        FName __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetGroupName(const FName &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_GroupName = __Value;
        return;
    }
    int GetIndex() const property
    {
        this.TrackPropertyRead(2);
        return this.m_Index;
    }
    void SetIndex(const int __Value) property
    {
        if (this.m_Index == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_Index = __Value;
        return;
    }
    const FName GetSignal() const property
    {
        const FName __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    FName GetModify_Signal() property
    {
        FName __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetSignal(const FName &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_Signal = __Value;
        return;
    }
    bool GetbIsInteractItem() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bIsInteractItem;
    }
    void SetbIsInteractItem(const bool __Value) property
    {
        if (!(this.m_bIsInteractItem) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bIsInteractItem = __Value;
        return;
    }
    bool GetbSetVisibility() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bSetVisibility;
    }
    void SetbSetVisibility(const bool __Value) property
    {
        if (!(this.m_bSetVisibility) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bSetVisibility = __Value;
        return;
    }
    bool GetbForbidden() const property
    {
        this.TrackPropertyRead(6);
        return this.m_bForbidden;
    }
    void SetbForbidden(const bool __Value) property
    {
        if (!(this.m_bForbidden) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_bForbidden = __Value;
        return;
    }
    const float32 GetForbiddenOpacity() const property
    {
        const float32 __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    float32 GetModify_ForbiddenOpacity() property
    {
        float32 __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetForbiddenOpacity(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_ForbiddenOpacity = __Value;
        return;
    }
    int GetHoveredIndex() const property
    {
        this.TrackPropertyRead(8);
        return this.m_HoveredIndex;
    }
    void SetHoveredIndex(const int __Value) property
    {
        if (this.m_HoveredIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_HoveredIndex = __Value;
        return;
    }
    ESlateVisibility GetVisibility() const property
    {
        this.TrackPropertyRead(9);
        return this.m_Visibility;
    }
    void SetVisibility(const ESlateVisibility __Value) property
    {
        if (int(this.m_Visibility) == int(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_Visibility = __Value;
        return;
    }
    TSoftClassPtr<UEASAbility> GetAbilityClass() const property
    {
        this.TrackPropertyRead(10);
        return this.m_AbilityClass;
    }
    void SetAbilityClass(const TSoftClassPtr<UEASAbility> &inout __Value) property
    {
        if ((this.m_AbilityClass == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_AbilityClass = __Value;
        return;
    }
    const FUIInteractAbilityGroup GetAbilityGroup() const property
    {
        const FUIInteractAbilityGroup __r;
        this.TrackPropertyRead(11);
        return __r;
    }
    FUIInteractAbilityGroup GetModify_AbilityGroup() property
    {
        FUIInteractAbilityGroup __r;
        this.MarkPropertyDirty(11);
        return __r;
    }
    void SetAbilityGroup(const FUIInteractAbilityGroup &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(11);
        return;
    }
}

struct __GeneratedProperties_FVM_CommonBGItemMenu
{
    UPROPERTY()
    TEUIModelRef<FVM_CommonBGItemMenu> Self;

    __GeneratedProperties_FVM_CommonBGItemMenu()
    {
        return;
    }
}

namespace FVM_CommonBGItemMenu
{
FVM_CommonBGItemMenu& Create(const UObject ContextObject, const FName &inout GroupName, const int Index, const FName &inout Signal, const bool bIsInteractItem, const bool bSetVisibility)
{
    return FVM_CommonBGItemMenu::CreateByManager(EUIInternal::GetContextManager(ContextObject), GroupName, Index, Signal, bIsInteractItem, bSetVisibility);
}
FVM_CommonBGItemMenu CreateByManager(const UEUIManagerSubsystem Manager, const FName &inout GroupName, const int Index, const FName &inout Signal, const bool bIsInteractItem, const bool bSetVisibility)
{
    FVM_CommonBGItemMenu __r;
    TEUIModelRef<FVM_CommonBGItemMenu> local_6 = TEUIModelRef<FVM_CommonBGItemMenu>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_CommonBGItemMenu::ModelId, 0, GroupName, Index, Signal, bIsInteractItem, bSetVisibility));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "DisplayText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ForbiddenOpacity";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HoveredIndex";
    local_14.TypeName = "int";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Visibility";
    local_14.TypeName = "ESlateVisibility";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_CommonBGItemMenu>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_CommonBGItemMenu;
    FEUIModelDirtyDefine local_24;
    local_24.FunctionName = "__OnForbiddenChanged";
    local_24.DirtyFlags.Set(FVM_CommonBGItemMenu::__IndexOf_bForbidden());
    Result.DirtyFunctions.Add(local_24);
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_CommonBGItemMenu;
}
void __OnForbiddenChanged(FVM_CommonBGItemMenu &inout Model)
{
    Model.OnForbiddenChanged();
    return;
}
FText __UIGetter_DisplayText(const FVM_CommonBGItemMenu &inout Model)
{
    return Model.GetDisplayText();
}
float32 __UIGetter_ForbiddenOpacity(const FVM_CommonBGItemMenu &inout Model)
{
    return Model.GetForbiddenOpacity();
}
int __UIGetter_HoveredIndex(const FVM_CommonBGItemMenu &inout Model)
{
    return Model.GetHoveredIndex();
}
ESlateVisibility __UIGetter_Visibility(const FVM_CommonBGItemMenu &inout Model)
{
    return Model.GetVisibility();
}
TEUIModelRef<FVM_CommonBGItemMenu> __UIGetter_Self(const FVM_CommonBGItemMenu &inout Model)
{
    return TEUIModelRef<FVM_CommonBGItemMenu>(Model);
}
int __IndexOf_DisplayText()
{
    return 0;
}
int __IndexOf_GroupName()
{
    return 1;
}
int __IndexOf_Index()
{
    return 2;
}
int __IndexOf_Signal()
{
    return 3;
}
int __IndexOf_bIsInteractItem()
{
    return 4;
}
int __IndexOf_bSetVisibility()
{
    return 5;
}
int __IndexOf_bForbidden()
{
    return 6;
}
int __IndexOf_ForbiddenOpacity()
{
    return 7;
}
int __IndexOf_HoveredIndex()
{
    return 8;
}
int __IndexOf_Visibility()
{
    return 9;
}
int __IndexOf_AbilityClass()
{
    return 10;
}
int __IndexOf_AbilityGroup()
{
    return 11;
}
}
namespace __GeneratedProperties_FVM_CommonBGItemMenu
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
