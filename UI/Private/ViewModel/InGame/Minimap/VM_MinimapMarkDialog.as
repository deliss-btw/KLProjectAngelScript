
namespace FVM_MinimapMarkDialogOption
{
    const int ModelId = 0;
}
namespace FVM_MinimapMarkDialog
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature OnOptionSelected = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature OnConfirmSelection = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature GuideToMark = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature DeleteMark = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature ConfirmChangeMarkConfig = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature MarkAndGuide = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature Cancel = FEUIModelCallbackSignature();

}
struct FVM_MinimapMarkDialogOption : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    int m_OptionIndex;
    UPROPERTY()
    FSlateBrush m_MarkIcon;
    UPROPERTY()
    bool m_bSelected;

    FVM_MinimapMarkDialogOption()
    {
        this.m_OptionIndex = 0;
        this.m_bSelected = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_MinimapMarkDialogOption' by default constructor.");
        return;
    }
    FVM_MinimapMarkDialogOption(const FVM_MinimapMarkDialogOption &inout Other)
    {
        this.m_OptionIndex = 0;
        this.m_bSelected = false;
        this.m_OptionIndex = int(Other.m_OptionIndex);
        this.m_MarkIcon = Other.m_MarkIcon;
        this.m_bSelected = Other.m_bSelected;
        return;
    }
    FVM_MinimapMarkDialogOption(const int InOptionIndex)
    {
        this.m_OptionIndex = 0;
        this.m_bSelected = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetOptionIndex(InOptionIndex);
        return;
    }
    FVM_MinimapMarkDialogOption opAssign(const FVM_MinimapMarkDialogOption &inout Other)
    {
        FVM_MinimapMarkDialogOption __r;
        this.m_OptionIndex = int(Other.m_OptionIndex);
        this.m_MarkIcon = Other.m_MarkIcon;
        this.m_bSelected = Other.m_bSelected;
        return __r;
    }
    void PostConstruct()
    {
        TDataObjectPtr<FMarkConfig> local_26 = ::MarkUtil::GetUserSelectableMinimapMarkAt(this.GetOptionIndex());
        if (local_26)
        {
            TDataObjectPtr<FPresentationConfig> local_76 = local_26.opArrow().GetPresentationConfig();
            if (local_76)
            {
                this.SetMarkIcon(local_76.opArrow().GetDefaultIcon().LoadBrush());
            }
        }
        return;
    }
    ESlateVisibility bSelectedAsSlateVisibility() const
    {
        int local_2;
        if (this.bSelectedAsBool())
        {
            local_2 = 0;
        }
        else
        {
            local_2 = 1;
        }
        return ESlateVisibility(local_2);
    }
    bool bSelectedAsBool() const
    {
        return this.GetbSelected() || false;
    }
    int GetOptionIndex() const property
    {
        this.TrackPropertyRead(0);
        return this.m_OptionIndex;
    }
    void SetOptionIndex(const int __Value) property
    {
        if (this.m_OptionIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_OptionIndex = __Value;
        return;
    }
    FSlateBrush GetMarkIcon() const property
    {
        FSlateBrush __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FSlateBrush GetModify_MarkIcon() property
    {
        FSlateBrush __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetMarkIcon(const FSlateBrush &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_MarkIcon = __Value;
        return;
    }
    bool GetbSelected() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bSelected;
    }
    void SetbSelected(const bool __Value) property
    {
        if (!(this.m_bSelected) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bSelected = __Value;
        return;
    }
}

struct FVM_MinimapMarkDialog : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FECSEntityId m_MarkEntityID;
    UPROPERTY()
    FVector2D m_MarkWorldPosition;
    UPROPERTY()
    TArray<FEUIModelRef> m_Options;
    UPROPERTY()
    bool m_bHasSelect;
    UPROPERTY()
    int m_CurrentSelectedIndex;
    UPROPERTY()
    bool m_bPendingClose;

    FVM_MinimapMarkDialog()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_MinimapMarkDialog(const FVM_MinimapMarkDialog &inout Other)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_MinimapMarkDialog(const FECSEntityId &inout InMarkEntityID, const FVector2D &inout InMarkWorldPosition)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    FVM_MinimapMarkDialog opAssign(const FVM_MinimapMarkDialog &inout Other)
    {
        FVM_MinimapMarkDialog __r;
        this.m_MarkEntityID = Other.m_MarkEntityID;
        this.m_MarkWorldPosition = Other.m_MarkWorldPosition;
        this.m_Options = Other.m_Options;
        this.m_bHasSelect = Other.m_bHasSelect;
        this.m_CurrentSelectedIndex = int(Other.m_CurrentSelectedIndex);
        this.m_bPendingClose = Other.m_bPendingClose;
        return __r;
    }
    void PostConstruct()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    bool HasSelectableOptions() const
    {
        return (this.GetOptions().Num() > 0);
    }
    void OnOptionSelected(const int Index)
    {
        if (Index == this.GetCurrentSelectedIndex())
        {
            return;
        }
        this.SetSelectedIndex(Index);
        if (::MarkUtil::IsSelfCreateMark(this.GetContext().GetLocalPlayer(), this.GetMarkEntityID()))
        {
            this.ConfirmChangeMarkConfig();
        }
        return;
    }
    void OnConfirmSelection()
    {
        if (this.GetbPendingClose())
        {
            return;
        }
        TDataObjectPtr<FMarkConfig> local_26 = ::MarkUtil::GetUserSelectableMinimapMarkAt(this.GetCurrentSelectedIndex());
        if ((FECSEntityId(this.GetMarkEntityID()) == ENTITY_ID_NULL))
        {
            ::MarkUtil::RequestMarkPositionFromMinimap(this.GetContext().GetLocalPlayer(), this.GetMarkWorldPosition(), local_26, false);
        }
        else
        {
            if (::MarkUtil::IsSelfCreateMark(this.GetContext().GetLocalPlayer(), this.GetMarkEntityID()))
            {
                ::MarkUtil::RequestChangeMarkConfig(this.GetContext().GetLocalPlayer(), this.GetMarkEntityID(), local_26);
            }
            else
            {
                ::MarkUtil::RequestMarkEntityFromMinimap(this.GetContext().GetLocalPlayer(), this.GetMarkEntityID(), local_26);
            }
        }
        this.ClosePageOrHover();
        return;
    }
    void GuideToMark()
    {
        if (!(::MarkUtil::IsSelfCreateMark(this.GetContext().GetLocalPlayer(), this.GetMarkEntityID())))
        {
            XError(ELog(53), FString().Append("GuideToMark: ").Append(this.GetMarkEntityID().GetIdValue()).Append(" is not self create mark entity"));
            return;
        }
        if ((::FGuidingPathUtils::GetGuidingPathTargetEntityID(this.GetContext().GetLocalPlayer()) == this.GetMarkEntityID()))
        {
            ::FGuidingPathUtils::RequestGuidingPathCancel(this.GetContext().GetLocalPlayer());
            return;
        }
        ::FGuidingPathUtils::RequestGuidingPathToEntityID(this.GetMarkEntityID(), this.GetContext().GetLocalPlayer());
        return;
    }
    void DeleteMark()
    {
        if (!(::MarkUtil::IsSelfCreateMark(this.GetContext().GetLocalPlayer(), this.GetMarkEntityID())))
        {
            XError(ELog(53), FString().Append("GuideToMark: ").Append(this.GetMarkEntityID().GetIdValue()).Append(" is not self create mark entity"));
            return;
        }
        ::MarkUtil::RequestRemoveMark(this.GetContext().GetLocalPlayer(), this.GetMarkEntityID());
        this.ClosePageOrHover();
        return;
    }
    void ConfirmChangeMarkConfig()
    {
        if (!(::MarkUtil::IsSelfCreateMark(this.GetContext().GetLocalPlayer(), this.GetMarkEntityID())))
        {
            XError(ELog(53), FString().Append("GuideToMark: ").Append(this.GetMarkEntityID().GetIdValue()).Append(" is not self create mark entity"));
            return;
        }
        TDataObjectPtr<FMarkConfig> local_36 = ::MarkUtil::GetUserSelectableMinimapMarkAt(this.GetCurrentSelectedIndex());
        if (local_36)
        {
            ::MarkUtil::RequestChangeMarkConfig(this.GetContext().GetLocalPlayer(), this.GetMarkEntityID(), local_36);
        }
        return;
    }
    bool IsGuidingTarget() const
    {
        if ((FECSEntityId(this.GetMarkEntityID()) == ENTITY_ID_NULL))
        {
            return false;
        }
        return (::FGuidingPathUtils::GetGuidingPathTargetEntityID(this.GetContext().GetLocalPlayer()) == this.GetMarkEntityID());
    }
    void MarkAndGuide()
    {
        TDataObjectPtr<FMarkConfig> local_26 = ::MarkUtil::GetUserSelectableMinimapMarkAt(this.GetCurrentSelectedIndex());
        if (!(local_26))
        {
            XError(ELog(53), FString().Append("MarkAndGuide: ").Append(this.GetCurrentSelectedIndex()).Append(" is not a valid mark config"));
            return;
        }
        if ((FECSEntityId(this.GetMarkEntityID()) == ENTITY_ID_NULL))
        {
            ::MarkUtil::RequestMarkPositionFromMinimap(this.GetContext().GetLocalPlayer(), this.GetMarkWorldPosition(), local_26, true);
        }
        else
        {
            if (!(::MarkUtil::IsSelfCreateMark(this.GetContext().GetLocalPlayer(), this.GetMarkEntityID())))
            {
                XError(ELog(53), FString().Append(this.GetMarkEntityID().GetIdValue()).Append(" is not self create mark entity"));
                return;
            }
            ::MarkUtil::RequestChangeMarkConfig(this.GetContext().GetLocalPlayer(), this.GetMarkEntityID(), local_26);
            ::FGuidingPathUtils::RequestGuidingPathToEntityID(this.GetMarkEntityID(), this.GetContext().GetLocalPlayer());
        }
        this.ClosePageOrHover();
        return;
    }
    void Cancel()
    {
        this.ClosePageOrHover();
        return;
    }
    void SetOptionSelectedState(const int Index, const bool bSelected)
    {
        Get local_4;
        local_4.opCall().SetbSelected(bSelected);
        return;
    }
    void ClosePageOrHover()
    {
        this.SetbPendingClose(true);
        ::CommonPopup::CloseAllHover();
        return;
    }
    void SetSelectedIndex(const int Index)
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    const FECSEntityId GetMarkEntityID() const property
    {
        const FECSEntityId __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FECSEntityId GetModify_MarkEntityID() property
    {
        FECSEntityId __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetMarkEntityID(const FECSEntityId &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_MarkEntityID = __Value;
        return;
    }
    const FVector2D GetMarkWorldPosition() const property
    {
        const FVector2D __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FVector2D GetModify_MarkWorldPosition() property
    {
        FVector2D __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetMarkWorldPosition(const FVector2D &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_MarkWorldPosition = __Value;
        return;
    }
    TArray<FEUIModelRef> GetOptions() const property
    {
        TArray<FEUIModelRef> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<FEUIModelRef> GetModify_Options() property
    {
        TArray<FEUIModelRef> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetOptions(const TArray<FEUIModelRef> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_Options = __Value;
        return;
    }
    bool GetbHasSelect() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bHasSelect;
    }
    void SetbHasSelect(const bool __Value) property
    {
        if (!(this.m_bHasSelect) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bHasSelect = __Value;
        return;
    }
    int GetCurrentSelectedIndex() const property
    {
        this.TrackPropertyRead(4);
        return this.m_CurrentSelectedIndex;
    }
    void SetCurrentSelectedIndex(const int __Value) property
    {
        if (this.m_CurrentSelectedIndex == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_CurrentSelectedIndex = __Value;
        return;
    }
    bool GetbPendingClose() const property
    {
        this.TrackPropertyRead(5);
        return this.m_bPendingClose;
    }
    void SetbPendingClose(const bool __Value) property
    {
        if (!(this.m_bPendingClose) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_bPendingClose = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_MinimapMarkDialogOption
{
    UPROPERTY()
    TEUIModelRef<FVM_MinimapMarkDialogOption> Self;

    __GeneratedProperties_FVM_MinimapMarkDialogOption()
    {
        return;
    }
}

struct __GeneratedProperties_FVM_MinimapMarkDialog
{
    UPROPERTY()
    bool HasSelectableOptions;
    UPROPERTY()
    bool IsGuidingTarget;
    UPROPERTY()
    TEUIModelRef<FVM_MinimapMarkDialog> Self;


}

namespace FVM_MinimapMarkDialogOption
{
FVM_MinimapMarkDialogOption& Create(const UObject ContextObject, const int OptionIndex)
{
    return FVM_MinimapMarkDialogOption::CreateByManager(EUIInternal::GetContextManager(ContextObject), OptionIndex);
}
FVM_MinimapMarkDialogOption CreateByManager(const UEUIManagerSubsystem Manager, const int OptionIndex)
{
    FVM_MinimapMarkDialogOption __r;
    TEUIModelRef<FVM_MinimapMarkDialogOption> local_6 = TEUIModelRef<FVM_MinimapMarkDialogOption>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_MinimapMarkDialogOption::ModelId, 0, OptionIndex));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "MarkIcon";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bSelected";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MinimapMarkDialogOption>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MinimapMarkDialogOption;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MinimapMarkDialogOption;
}
FSlateBrush __UIGetter_MarkIcon(const FVM_MinimapMarkDialogOption &inout Model)
{
    return Model.GetMarkIcon();
}
bool __UIGetter_bSelected(const FVM_MinimapMarkDialogOption &inout Model)
{
    return Model.GetbSelected();
}
TEUIModelRef<FVM_MinimapMarkDialogOption> __UIGetter_Self(const FVM_MinimapMarkDialogOption &inout Model)
{
    return TEUIModelRef<FVM_MinimapMarkDialogOption>(Model);
}
int __IndexOf_OptionIndex()
{
    return 0;
}
int __IndexOf_MarkIcon()
{
    return 1;
}
int __IndexOf_bSelected()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_MinimapMarkDialogOption
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
namespace FVM_MinimapMarkDialog
{
FVM_MinimapMarkDialog& Create(const UObject ContextObject, const FECSEntityId &inout MarkEntityID, const FVector2D &inout MarkWorldPosition)
{
    return FVM_MinimapMarkDialog::CreateByManager(EUIInternal::GetContextManager(ContextObject), MarkEntityID, MarkWorldPosition);
}
FVM_MinimapMarkDialog CreateByManager(const UEUIManagerSubsystem Manager, const FECSEntityId &inout MarkEntityID, const FVector2D &inout MarkWorldPosition)
{
    FVM_MinimapMarkDialog __r;
    TEUIModelRef<FVM_MinimapMarkDialog> local_6 = TEUIModelRef<FVM_MinimapMarkDialog>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_MinimapMarkDialog::ModelId, 0, MarkEntityID, MarkWorldPosition));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Options";
    local_14.TypeName = "TArray<FEUIModelRef>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bHasSelect";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "HasSelectableOptions";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsGuidingTarget";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MinimapMarkDialog>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MinimapMarkDialog;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MinimapMarkDialog;
}
TArray<FEUIModelRef> __UIGetter_Options(const FVM_MinimapMarkDialog &inout Model)
{
    return Model.GetOptions();
}
bool __UIGetter_bHasSelect(const FVM_MinimapMarkDialog &inout Model)
{
    return Model.GetbHasSelect();
}
bool __UIGetter_HasSelectableOptions(const FVM_MinimapMarkDialog &inout Model)
{
    return Model.HasSelectableOptions();
}
bool __UIGetter_IsGuidingTarget(const FVM_MinimapMarkDialog &inout Model)
{
    return Model.IsGuidingTarget();
}
TEUIModelRef<FVM_MinimapMarkDialog> __UIGetter_Self(const FVM_MinimapMarkDialog &inout Model)
{
    return TEUIModelRef<FVM_MinimapMarkDialog>(Model);
}
int __IndexOf_MarkEntityID()
{
    return 0;
}
int __IndexOf_MarkWorldPosition()
{
    return 1;
}
int __IndexOf_Options()
{
    return 2;
}
int __IndexOf_bHasSelect()
{
    return 3;
}
int __IndexOf_CurrentSelectedIndex()
{
    return 4;
}
int __IndexOf_bPendingClose()
{
    return 5;
}
}
namespace __GeneratedProperties_FVM_MinimapMarkDialog
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
