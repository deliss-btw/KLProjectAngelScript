
namespace FVM_MarkViewportDisplayIcon
{
    const int ModelId = 0;

}
struct FVM_MarkViewportDisplayIcon : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FECSEntity m_MarkEntity;
    UPROPERTY()
    FEUIModelRef m_MarkIcon;
    UPROPERTY()
    FLinearColor m_BackgroundColor;
    UPROPERTY()
    bool m_bShowDistance;
    UPROPERTY()
    FText m_DistanceText;
    UPROPERTY()
    TSoftClassPtr<UEUIUserWidget> m_MarkIconWidget;
    UPROPERTY()
    TEUIModelRef<FM_Spot> m_Spot;

    FVM_MarkViewportDisplayIcon()
    {
        this.m_bShowDistance = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        XError(ELog(17), "Should not construct model'FVM_MarkViewportDisplayIcon' by default constructor.");
        return;
    }
    FVM_MarkViewportDisplayIcon(const FVM_MarkViewportDisplayIcon &inout Other)
    {
        this.m_bShowDistance = false;
        this.m_MarkEntity = Other.m_MarkEntity;
        this.m_MarkIcon = Other.m_MarkIcon;
        this.m_BackgroundColor = Other.m_BackgroundColor;
        this.m_bShowDistance = Other.m_bShowDistance;
        this.m_DistanceText = Other.m_DistanceText;
        this.m_MarkIconWidget = Other.m_MarkIconWidget;
        this.m_Spot = Other.m_Spot;
        return;
    }
    FVM_MarkViewportDisplayIcon(const FECSEntity &inout InMarkEntity)
    {
        this.m_bShowDistance = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        this.SetMarkEntity(InMarkEntity);
        return;
    }
    FVM_MarkViewportDisplayIcon& opAssign(const FVM_MarkViewportDisplayIcon &inout Other)
    {
        this.m_MarkEntity = Other.m_MarkEntity;
        this.m_MarkIcon = Other.m_MarkIcon;
        this.m_BackgroundColor = Other.m_BackgroundColor;
        this.m_bShowDistance = Other.m_bShowDistance;
        this.m_DistanceText = Other.m_DistanceText;
        this.m_MarkIconWidget = Other.m_MarkIconWidget;
        return Other.m_Spot;
    }
    void PostConstruct()
    {
        bool local_49 = false;
        if (::MarkUtil::GetMarkConfig(this.GetMarkEntity()))
        {
            this.SetbShowDistance(local_49);
        }
        return;
    }
    void Tick()
    {
        if (!(this.GetSpot()))
        {
            this.SetSpot(::PresentationSpotUtils::GetEntitySpot(this.GetContext().Manager, ::MarkUtil::GetMarkedEntity(this.GetMarkEntity()).GetId()));
            if (this.GetSpot())
            {
                bool local_3 = ::MarkUtil::IsSelfCreateMark(this.GetContext().GetLocalPlayer(), this.GetMarkEntity().GetId());
                FSpotViewAdapter local_22;
                TDataObjectPtr<FPresentationConfig> local_46 = ::GetPresentationConfig(this.GetSpot().opArrow(), local_22);
                this.SetMarkIcon(FEUIModelRef());
                this.SetMarkIconWidget(::UICommonUtil::EUIWidgetPathFromString("/Game/MoleRes/Dev/UI/UMG/System/Mark/MarkIcons/UI_SimpleMarkIcon.UI_SimpleMarkIcon"));
                Get local_62;
                this.SetBackgroundColor(local_62.opCall().GetIconBackgroundColor());
            }
        }
        if (!(this.GetbShowDistance()))
        {
            return;
        }
        Get local_66;
        const FC_Transform& local_68 = local_66.opCall();
        if (local_68)
        {
            FECSEntity local_12 = this.GetContext().GetLocalPlayerPawn();
            Get local_72;
            const FC_Transform& local_74 = local_72.opCall();
            if (local_74)
            {
                this.SetDistanceText(FText::FromString(FString().Append(FString::ApplyFormat(((FVector(local_68.GetPosition()) - local_74.GetPosition()).Size2D() / 100.0), ".0")).Append("m")));
            }
        }
        return;
    }
    bool IsVisible() const
    {
        if ((!((FECSEntity(this.GetMarkEntity()) == ENTITY_NULL))))
        {
            return ::MarkUtil::IsMarkVisible(this.GetContext().GetLocalPlayer(), this.GetMarkEntity().GetId());
        }
        return false;
    }
    ESlateVisibility bShowDistanceAsSlateVisibility() const
    {
        int local_2;
        if (this.bShowDistanceAsBool())
        {
            local_2 = 0;
        }
        else
        {
            local_2 = 1;
        }
        return ESlateVisibility(local_2);
    }
    bool bShowDistanceAsBool() const
    {
        return this.GetbShowDistance() || false;
    }
    const FECSEntity GetMarkEntity() const property
    {
        const FECSEntity __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FECSEntity GetModify_MarkEntity() property
    {
        FECSEntity __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetMarkEntity(const FECSEntity &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_MarkEntity = __Value;
        return;
    }
    FEUIModelRef GetMarkIcon() const property
    {
        FEUIModelRef __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    FEUIModelRef GetModify_MarkIcon() property
    {
        FEUIModelRef __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetMarkIcon(const FEUIModelRef &inout __Value) property
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
    const FLinearColor GetBackgroundColor() const property
    {
        const FLinearColor __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FLinearColor GetModify_BackgroundColor() property
    {
        FLinearColor __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetBackgroundColor(const FLinearColor &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_BackgroundColor = __Value;
        return;
    }
    bool GetbShowDistance() const property
    {
        this.TrackPropertyRead(3);
        return this.m_bShowDistance;
    }
    void SetbShowDistance(const bool __Value) property
    {
        if (!(this.m_bShowDistance) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_bShowDistance = __Value;
        return;
    }
    FText GetDistanceText() const property
    {
        FText __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    FText GetModify_DistanceText() property
    {
        FText __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetDistanceText(const FText &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_DistanceText = __Value;
        return;
    }
    TSoftClassPtr<UEUIUserWidget> GetMarkIconWidget() const property
    {
        this.TrackPropertyRead(5);
        return this.m_MarkIconWidget;
    }
    void SetMarkIconWidget(const TSoftClassPtr<UEUIUserWidget> &inout __Value) property
    {
        if ((this.m_MarkIconWidget == __Value))
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_MarkIconWidget = __Value;
        return;
    }
    TEUIModelRef<FM_Spot> GetSpot() const property
    {
        this.TrackPropertyRead(6);
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
        this.MarkPropertyDirty(6);
        this.m_Spot = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_MarkViewportDisplayIcon
{
    UPROPERTY()
    bool IsVisible;
    UPROPERTY()
    TEUIModelRef<FVM_MarkViewportDisplayIcon> Self;


}

namespace FVM_MarkViewportDisplayIcon
{
FVM_MarkViewportDisplayIcon& Create(const UObject ContextObject, const FECSEntity &inout MarkEntity)
{
    return FVM_MarkViewportDisplayIcon::CreateByManager(EUIInternal::GetContextManager(ContextObject), MarkEntity);
}
FVM_MarkViewportDisplayIcon CreateByManager(const UEUIManagerSubsystem Manager, const FECSEntity &inout MarkEntity)
{
    FVM_MarkViewportDisplayIcon __r;
    TEUIModelRef<FVM_MarkViewportDisplayIcon> local_6 = TEUIModelRef<FVM_MarkViewportDisplayIcon>(EUIInternal::MakeModelWithManager_Generic(Manager, FVM_MarkViewportDisplayIcon::ModelId, 0, MarkEntity));
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
    local_14.TypeName = "FEUIModelRef";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "BackgroundColor";
    local_14.TypeName = "FLinearColor";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bShowDistance";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "DistanceText";
    local_14.TypeName = "FText";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "MarkIconWidget";
    local_14.TypeName = "TSoftClassPtr<UEUIUserWidget>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "IsVisible";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_MarkViewportDisplayIcon>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_MarkViewportDisplayIcon;
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_MarkViewportDisplayIcon;
}
void __Tick(FVM_MarkViewportDisplayIcon &inout Model)
{
    Model.Tick();
    return;
}
FEUIModelRef __UIGetter_MarkIcon(const FVM_MarkViewportDisplayIcon &inout Model)
{
    return Model.GetMarkIcon();
}
FLinearColor __UIGetter_BackgroundColor(const FVM_MarkViewportDisplayIcon &inout Model)
{
    return Model.GetBackgroundColor();
}
bool __UIGetter_bShowDistance(const FVM_MarkViewportDisplayIcon &inout Model)
{
    return Model.GetbShowDistance();
}
FText __UIGetter_DistanceText(const FVM_MarkViewportDisplayIcon &inout Model)
{
    return Model.GetDistanceText();
}
TSoftClassPtr<UEUIUserWidget> __UIGetter_MarkIconWidget(const FVM_MarkViewportDisplayIcon &inout Model)
{
    return Model.GetMarkIconWidget();
}
bool __UIGetter_IsVisible(const FVM_MarkViewportDisplayIcon &inout Model)
{
    return Model.IsVisible();
}
TEUIModelRef<FVM_MarkViewportDisplayIcon> __UIGetter_Self(const FVM_MarkViewportDisplayIcon &inout Model)
{
    return TEUIModelRef<FVM_MarkViewportDisplayIcon>(Model);
}
int __IndexOf_MarkEntity()
{
    return 0;
}
int __IndexOf_MarkIcon()
{
    return 1;
}
int __IndexOf_BackgroundColor()
{
    return 2;
}
int __IndexOf_bShowDistance()
{
    return 3;
}
int __IndexOf_DistanceText()
{
    return 4;
}
int __IndexOf_MarkIconWidget()
{
    return 5;
}
int __IndexOf_Spot()
{
    return 6;
}
}
namespace __GeneratedProperties_FVM_MarkViewportDisplayIcon
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
