
namespace FVM_MarkMinimapIconTips
{
    const int ModelId = 0;
    const FEUIModelCallbackSignature GuideToMark = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature CancelGuide = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature RemoveMark = FEUIModelCallbackSignature();
    const FEUIModelCallbackSignature ConvertToConstant = FEUIModelCallbackSignature();

}
struct FVM_MarkMinimapIconTips : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FECSEntityId m_MarkEntityID;
    UPROPERTY()
    UWidget m_MarkIconWidget;
    UPROPERTY()
    bool m_bCanConvertToConstant;

    FVM_MarkMinimapIconTips()
    {
        this.m_MarkIconWidget = nullptr;
        this.m_bCanConvertToConstant = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_MarkMinimapIconTips' by default constructor.");
        return;
    }
    FVM_MarkMinimapIconTips(const FVM_MarkMinimapIconTips &inout Other)
    {
        this.m_MarkIconWidget = nullptr;
        this.m_bCanConvertToConstant = false;
        this.m_MarkEntityID = Other.m_MarkEntityID;
        this.m_MarkIconWidget = Other.m_MarkIconWidget;
        this.m_bCanConvertToConstant = Other.m_bCanConvertToConstant;
        return;
    }
    FVM_MarkMinimapIconTips(const FECSEntityId &inout InMarkEntityID, const UWidget InMarkIconWidget)
    {
        this.m_MarkIconWidget = nullptr;
        this.m_bCanConvertToConstant = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetMarkEntityID(InMarkEntityID);
        this.SetMarkIconWidget(InMarkIconWidget);
        return;
    }
    FVM_MarkMinimapIconTips opAssign(const FVM_MarkMinimapIconTips &inout Other)
    {
        FVM_MarkMinimapIconTips __r;
        this.m_MarkEntityID = Other.m_MarkEntityID;
        this.m_MarkIconWidget = Other.m_MarkIconWidget;
        this.m_bCanConvertToConstant = Other.m_bCanConvertToConstant;
        return __r;
    }
    void PostConstruct()
    {
        if (::MarkUtil::GetMarkConfigSetting().bCanEditConstantMark && ::MarkUtil::IsSelfCreateMark(this.GetContext().GetLocalPlayer(), this.GetMarkEntityID()))
        {
            this.SetbCanConvertToConstant(true);
        }
        return;
    }
    void GuideToMark()
    {
        ::FGuidingPathUtils::RequestGuidingPathToEntityID(this.GetMarkEntityID(), this.GetContext().GetLocalPlayer());
        return;
    }
    void CancelGuide()
    {
        ::FGuidingPathUtils::RequestGuidingPathCancel(this.GetContext().GetLocalPlayer());
        ::CommonPopup::CloseAllHover();
        return;
    }
    void RemoveMark()
    {
        ::MarkUtil::RequestRemoveMark(this.GetContext().GetLocalPlayer(), this.GetMarkEntityID());
        ::CommonPopup::CloseAllHover();
        return;
    }
    void ConvertToConstant()
    {
        if (this.GetbCanConvertToConstant())
        {
            ::CommonPopup::CloseAllHover();
            ::CommonPopup::HoverCustom(this.GetMarkIconWidget(), ::MarkUtil::GetMarkConfigSetting().MinimapMarkDialog, FEUIModelContainer(), true, true, ECommonHoverLayout(0), EEUILayoutLayer(0), false);
        }
        return;
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
    UWidget GetMarkIconWidget() const property
    {
        this.TrackPropertyRead(1);
        return this.m_MarkIconWidget;
    }
    void SetMarkIconWidget(const UWidget __Value) property
    {
        if (this.m_MarkIconWidget == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        return;
    }
    bool GetbCanConvertToConstant() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bCanConvertToConstant;
    }
    void SetbCanConvertToConstant(const bool __Value) property
    {
        if (!(this.m_bCanConvertToConstant) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bCanConvertToConstant = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_MarkMinimapIconTips
{
    UPROPERTY()
    TEUIModelRef<FVM_MarkMinimapIconTips> Self;

    __GeneratedProperties_FVM_MarkMinimapIconTips()
    {
        return;
    }
}

namespace FVM_MarkMinimapIconTips
{
FVM_MarkMinimapIconTips& Create(const UObject ContextObject, const FECSEntityId &inout MarkEntityID, const UWidget MarkIconWidget)
{
    return FVM_MarkMinimapIconTips::CreateByManager(EUIInternal::GetContextManager(ContextObject), MarkEntityID, MarkIconWidget);
}
FVM_MarkMinimapIconTips CreateByManager(const UEUIManagerSubsystem Manager, const FECSEntityId &inout MarkEntityID, const UWidget MarkIconWidget)
{
    FVM_MarkMinimapIconTips __r;
    TEUIModelRef<FVM_MarkMinimapIconTips> local_6 = TEUIModelRef<FVM_MarkMinimapIconTips>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_MarkMinimapIconTips::ModelId, 0, MarkEntityID, MarkIconWidget));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "bCanConvertToConstant";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MarkMinimapIconTips>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MarkMinimapIconTips;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MarkMinimapIconTips;
}
bool __UIGetter_bCanConvertToConstant(const FVM_MarkMinimapIconTips &inout Model)
{
    return Model.GetbCanConvertToConstant();
}
TEUIModelRef<FVM_MarkMinimapIconTips> __UIGetter_Self(const FVM_MarkMinimapIconTips &inout Model)
{
    return TEUIModelRef<FVM_MarkMinimapIconTips>(Model);
}
int __IndexOf_MarkEntityID()
{
    return 0;
}
int __IndexOf_MarkIconWidget()
{
    return 1;
}
int __IndexOf_bCanConvertToConstant()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_MarkMinimapIconTips
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
