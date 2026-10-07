
namespace FVM_MinimapTempMarkDialog
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature MarkAndGuide = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature SwitchToConstantMark = FEUIModelCallbackSignature();

}
struct FVM_MinimapTempMarkDialog : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FVector2D m_MarkWorldPosition;
    UPROPERTY()
    FVector2D m_HoverPosition;

    FVM_MinimapTempMarkDialog()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_MinimapTempMarkDialog' by default constructor.");
        return;
    }
    FVM_MinimapTempMarkDialog(const FVM_MinimapTempMarkDialog &inout Other)
    {
        this.m_MarkWorldPosition = Other.m_MarkWorldPosition;
        this.m_HoverPosition = Other.m_HoverPosition;
        return;
    }
    FVM_MinimapTempMarkDialog(const FVector2D &inout InMarkWorldPosition, const FVector2D &inout InHoverPosition)
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetMarkWorldPosition(InMarkWorldPosition);
        this.SetHoverPosition(InHoverPosition);
        return;
    }
    FVM_MinimapTempMarkDialog& opAssign(const FVM_MinimapTempMarkDialog &inout Other)
    {
        this.m_MarkWorldPosition = Other.m_MarkWorldPosition;
        return Other.m_HoverPosition;
    }
    void MarkAndGuide()
    {
        UMarkSettings local_2 = ::MarkUtil::GetMarkConfigSetting();
        ::MarkUtil::RequestMarkPositionFromMinimap(this.GetContext().GetLocalPlayer(), this.GetMarkWorldPosition(), local_2.MinimapTempMark, true);
        ::CommonPopup::CloseAllHover();
        return;
    }
    void SwitchToConstantMark()
    {
        ::CommonPopup::CloseAllHover();
        ::CommonPopup::HoverCustom(this.GetHoverPosition(), ::MarkUtil::GetMarkConfigSetting().MinimapMarkDialog, EEUILayoutLayer(4), FEUIModelContainer(), ECommonHoverLayout(0));
        return;
    }
    const FVector2D GetMarkWorldPosition() const property
    {
        const FVector2D __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FVector2D GetModify_MarkWorldPosition() property
    {
        FVector2D __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetMarkWorldPosition(const FVector2D &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_MarkWorldPosition = __Value;
        return;
    }
    const FVector2D GetHoverPosition() const property
    {
        const FVector2D __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FVector2D GetModify_HoverPosition() property
    {
        FVector2D __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetHoverPosition(const FVector2D &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_HoverPosition = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_MinimapTempMarkDialog
{
    UPROPERTY()
    TEUIModelRef<FVM_MinimapTempMarkDialog> Self;

    __GeneratedProperties_FVM_MinimapTempMarkDialog()
    {
        return;
    }
}

namespace FVM_MinimapTempMarkDialog
{
FVM_MinimapTempMarkDialog& Create(const UObject ContextObject, const FVector2D &inout MarkWorldPosition, const FVector2D &inout HoverPosition)
{
    return FVM_MinimapTempMarkDialog::CreateByManager(EUIInternal::GetContextManager(ContextObject), MarkWorldPosition, HoverPosition);
}
FVM_MinimapTempMarkDialog CreateByManager(const UEUIManagerSubsystem Manager, const FVector2D &inout MarkWorldPosition, const FVector2D &inout HoverPosition)
{
    FVM_MinimapTempMarkDialog __r;
    TEUIModelRef<FVM_MinimapTempMarkDialog> local_6 = TEUIModelRef<FVM_MinimapTempMarkDialog>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_MinimapTempMarkDialog::ModelId, 0, MarkWorldPosition, HoverPosition));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MinimapTempMarkDialog>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MinimapTempMarkDialog;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MinimapTempMarkDialog;
}
TEUIModelRef<FVM_MinimapTempMarkDialog> __UIGetter_Self(const FVM_MinimapTempMarkDialog &inout Model)
{
    return TEUIModelRef<FVM_MinimapTempMarkDialog>(Model);
}
int __IndexOf_MarkWorldPosition()
{
    return 0;
}
int __IndexOf_HoverPosition()
{
    return 1;
}
}
namespace __GeneratedProperties_FVM_MinimapTempMarkDialog
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
