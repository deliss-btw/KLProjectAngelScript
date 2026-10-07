
namespace FVM_MinimapIconHelper
{
    const int ModelId = 0;

}
struct FVM_MinimapIconHelper : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FVM_MinimapIcon> m_MinimapIcon;
    UPROPERTY()
    bool m_bHasMouseHover;
    UPROPERTY()
    float32 m_MapScale;

    FVM_MinimapIconHelper()
    {
        this.m_bHasMouseHover = false;
        this.m_MapScale = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_MinimapIconHelper' by default constructor.");
        return;
    }
    FVM_MinimapIconHelper(const FVM_MinimapIconHelper &inout Other)
    {
        this.m_bHasMouseHover = false;
        this.m_MapScale = 0.0f;
        this.m_MinimapIcon = Other.m_MinimapIcon;
        this.m_bHasMouseHover = Other.m_bHasMouseHover;
        this.m_MapScale = Other.m_MapScale;
        return;
    }
    FVM_MinimapIconHelper(const TEUIModelRef<FVM_MinimapIcon> &inout InMinimapIcon)
    {
        this.m_bHasMouseHover = false;
        this.m_MapScale = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetMinimapIcon(InMinimapIcon);
        return;
    }
    FVM_MinimapIconHelper opAssign(const FVM_MinimapIconHelper &inout Other)
    {
        FVM_MinimapIconHelper __r;
        this.m_MinimapIcon = Other.m_MinimapIcon;
        this.m_bHasMouseHover = Other.m_bHasMouseHover;
        this.m_MapScale = Other.m_MapScale;
        return __r;
    }
    bool HasAnyFocus() const
    {
        return this.GetbHasMouseHover() || this.GetMinimapIcon().opArrow().GetbIsSelected();
    }
    FWidgetTransform GetRenderTransform() const
    {
        float32 local_5;
        if (this.HasAnyFocus())
        {
            local_5 = ::MinimapUtils::GetMinimapGlobalConfig().SelectedIconScale;
        }
        else
        {
            local_5 = 1.0f;
        }
        FWidgetTransform local_22;
        local_22.Scale = FVector2D(local_5, local_5);
        return local_22;
    }
    TDataObjectPtr<FMinimapIconSimplifiedDisplayRule> GetSimplifiedDisplayRule() const
    {
        FSpotViewAdapter local_12;
        TDataObjectPtr<FMinimapIconConfig> local_36 = ::GetMinimapIconConfig(this.GetMinimapIcon().opArrow().GetSpot().opArrow(), local_12);
        if (local_36)
        {
            return ::MinimapUtils::GetMinimapIconSimplifiedDisplayRule(local_36);
        }
        return TDataObjectPtr<FMinimapIconSimplifiedDisplayRule>();
    }
    FSlateBrush GetSimplifiedDisplayIcon() const
    {
        TDataObjectPtr<FMinimapIconSimplifiedDisplayRule> local_24 = this.GetSimplifiedDisplayRule();
        if (local_24)
        {
            return local_24.opArrow().DisplayIcon.LoadBrush();
        }
        return FSlateBrush();
    }
    float32 GetSimplifiedDisplayIconUserSpecifiedScale() const
    {
        UCurveFloat local_56;
        TDataObjectPtr<FMinimapIconSimplifiedDisplayRule> local_24 = this.GetSimplifiedDisplayRule();
        if (local_24)
        {
            if (int(local_24.opArrow().ScaleType) == 7 || (int(local_24.opArrow().ScaleType) == 8))
            {
                local_56 = local_24.opArrow().UserSpecifiedScaleByMapScale;
                if (local_56 != nullptr)
                {
                    return local_56.GetFloatValue(this.GetMapScale());
                }
            }
        }
        return 1.0f;
    }
    bool IsSimplifiedDisplayMode() const
    {
        if (this.HasAnyFocus() || ::MarkUtil::IsEntityMarkedBySelf(this.GetContext().GetLocalPlayer(), this.GetEntityId()) || (::FGuidingPathUtils::GetGuidingPathTargetEntityID(this.GetContext().GetLocalPlayer()) == this.GetEntityId()) || ::CommissionUtils::IsCommissionTarget(FECSEntity(this.GetEntityId())))
        {
            return false;
        }
        TDataObjectPtr<FMinimapIconSimplifiedDisplayRule> local_32 = this.GetSimplifiedDisplayRule();
        if (local_32)
        {
            return (this.GetMapScale() >= local_32.opArrow().DisplayMapScale);
        }
        return false;
    }
    FECSEntityId GetEntityId() const property
    {
        return ::GetOwnerEntityId(this.GetMinimapIcon().opArrow().GetSpot().opArrow());
    }
    TEUIModelRef<FVM_MinimapIcon> GetMinimapIcon() const property
    {
        this.TrackPropertyRead(0);
        return this.m_MinimapIcon;
    }
    void SetMinimapIcon(const TEUIModelRef<FVM_MinimapIcon> &inout __Value) property
    {
        TEUIModelRef<FVM_MinimapIcon> local_2;
        local_2 = this.m_MinimapIcon;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_MinimapIcon = __Value;
        return;
    }
    bool GetbHasMouseHover() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bHasMouseHover;
    }
    void SetbHasMouseHover(const bool __Value) property
    {
        if (!(this.m_bHasMouseHover) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bHasMouseHover = __Value;
        return;
    }
    float32 GetMapScale() const property
    {
        float32 __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    float32 GetModify_MapScale() property
    {
        float32 __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetMapScale(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_MapScale = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_MinimapIconHelper
{
    UPROPERTY()
    bool HasAnyFocus;
    UPROPERTY()
    FWidgetTransform RenderTransform;
    UPROPERTY()
    TDataObjectPtr<FMinimapIconSimplifiedDisplayRule> SimplifiedDisplayRule;
    UPROPERTY()
    FSlateBrush SimplifiedDisplayIcon;
    UPROPERTY()
    float32 SimplifiedDisplayIconUserSpecifiedScale;
    UPROPERTY()
    bool IsSimplifiedDisplayMode;
    UPROPERTY()
    TEUIModelRef<FVM_MinimapIconHelper> Self;


}

namespace FVM_MinimapIconHelper
{
FVM_MinimapIconHelper& Create(const UObject ContextObject, const TEUIModelRef<FVM_MinimapIcon> &inout MinimapIcon)
{
    return FVM_MinimapIconHelper::CreateByManager(EUIInternal::GetContextManager(ContextObject), MinimapIcon);
}
FVM_MinimapIconHelper CreateByManager(const UEUIManagerSubsystem Manager, const TEUIModelRef<FVM_MinimapIcon> &inout MinimapIcon)
{
    FVM_MinimapIconHelper __r;
    TEUIModelRef<FVM_MinimapIconHelper> local_6 = TEUIModelRef<FVM_MinimapIconHelper>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_MinimapIconHelper::ModelId, 0, MinimapIcon));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(false);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "HasAnyFocus";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RenderTransform";
    local_14.TypeName = "FWidgetTransform";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SimplifiedDisplayRule";
    local_14.TypeName = "TDataObjectPtr<FMinimapIconSimplifiedDisplayRule>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SimplifiedDisplayIcon";
    local_14.TypeName = "FSlateBrush";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "SimplifiedDisplayIconUserSpecifiedScale";
    local_14.TypeName = "float32";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsSimplifiedDisplayMode";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MinimapIconHelper>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MinimapIconHelper;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MinimapIconHelper;
}
bool __UIGetter_HasAnyFocus(const FVM_MinimapIconHelper &inout Model)
{
    return Model.HasAnyFocus();
}
FWidgetTransform __UIGetter_RenderTransform(const FVM_MinimapIconHelper &inout Model)
{
    return Model.GetRenderTransform();
}
TDataObjectPtr<FMinimapIconSimplifiedDisplayRule> __UIGetter_SimplifiedDisplayRule(const FVM_MinimapIconHelper &inout Model)
{
    return Model.GetSimplifiedDisplayRule();
}
FSlateBrush __UIGetter_SimplifiedDisplayIcon(const FVM_MinimapIconHelper &inout Model)
{
    return Model.GetSimplifiedDisplayIcon();
}
float32 __UIGetter_SimplifiedDisplayIconUserSpecifiedScale(const FVM_MinimapIconHelper &inout Model)
{
    return Model.GetSimplifiedDisplayIconUserSpecifiedScale();
}
bool __UIGetter_IsSimplifiedDisplayMode(const FVM_MinimapIconHelper &inout Model)
{
    return Model.IsSimplifiedDisplayMode();
}
TEUIModelRef<FVM_MinimapIconHelper> __UIGetter_Self(const FVM_MinimapIconHelper &inout Model)
{
    return TEUIModelRef<FVM_MinimapIconHelper>(Model);
}
int __IndexOf_MinimapIcon()
{
    return 0;
}
int __IndexOf_bHasMouseHover()
{
    return 1;
}
int __IndexOf_MapScale()
{
    return 2;
}
}
namespace __GeneratedProperties_FVM_MinimapIconHelper
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
