
namespace FVM_BindCompPosition
{
    const int ModelId = 0;

}
struct FVM_BindCompPosition : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    FName m_TagName;
    UPROPERTY()
    bool m_bDebugDraw;
    UPROPERTY()
    FWidgetTransform m_RenderTransform;
    UPROPERTY()
    USceneComponent m_BoundComponent;
    UPROPERTY()
    USceneComponent m_BoundsMinComponent;
    UPROPERTY()
    USceneComponent m_BoundsMaxComponent;
    UPROPERTY()
    UWidget m_BoundWidget;
    UPROPERTY()
    bool m_bIsBound;

    FVM_BindCompPosition()
    {
        this.m_BoundComponent = nullptr;
        this.m_BoundsMinComponent = nullptr;
        this.m_BoundsMaxComponent = nullptr;
        this.m_BoundWidget = nullptr;
        this.m_bDebugDraw = false;
        this.m_bIsBound = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_BindCompPosition(const FVM_BindCompPosition &inout Other)
    {
        this.m_BoundComponent = nullptr;
        this.m_BoundsMinComponent = nullptr;
        this.m_BoundsMaxComponent = nullptr;
        this.m_BoundWidget = nullptr;
        this.m_bDebugDraw = false;
        this.m_bIsBound = false;
        this.m_TagName = Other.m_TagName;
        this.m_bDebugDraw = Other.m_bDebugDraw;
        this.m_RenderTransform = Other.m_RenderTransform;
        this.m_BoundComponent = Other.m_BoundComponent;
        this.m_BoundsMinComponent = Other.m_BoundsMinComponent;
        this.m_BoundsMaxComponent = Other.m_BoundsMaxComponent;
        this.m_BoundWidget = Other.m_BoundWidget;
        this.m_bIsBound = Other.m_bIsBound;
        return;
    }
    FVM_BindCompPosition opAssign(const FVM_BindCompPosition &inout Other)
    {
        FVM_BindCompPosition __r;
        this.m_TagName = Other.m_TagName;
        this.m_bDebugDraw = Other.m_bDebugDraw;
        this.m_RenderTransform = Other.m_RenderTransform;
        this.m_BoundComponent = Other.m_BoundComponent;
        this.m_BoundsMinComponent = Other.m_BoundsMinComponent;
        this.m_BoundsMaxComponent = Other.m_BoundsMaxComponent;
        this.m_BoundWidget = Other.m_BoundWidget;
        this.m_bIsBound = Other.m_bIsBound;
        return __r;
    }
    void LoadConfig(const FConfigVM_BindCompPosition &inout InConfig)
    {
        this.SetbDebugDraw(InConfig.bDebugDraw);
        this.SetTagName(InConfig.TagName);
        return;
    }
    void PostLoad()
    {
        const AActor local_26;
        if (this.GetTagName().IsNone())
        {
            return;
        }
        FString local_10 = this.GetTagName().ToString();
        FVM_InteractTarget& local_18 = FEUIWidgetRef::GetViewModel(this.GetOwnerWidget()).opCall(NAME_None);
        if (local_18)
        {
            FECSEntity local_22 = FECSEntity(local_18.GetTargetEntity());
            if (local_22)
            {
                local_26 = local_22.GetActor();
                if (local_26 != nullptr)
                {
                    FString local_6 = (local_10 + "Min");
                    FName local_30 = FName(local_6);
                    FString local_6_2 = (local_10 + "Max");
                    FName local_28 = FName(local_6_2);
                    TArray<USceneComponent> local_36 = local_26.GetComponentsByClass(USceneComponent);
                    for (auto local_54 : local_36)
                    {
                        if (local_54.ComponentHasTag(this.GetTagName()))
                        {
                            this.SetBoundComponent(local_54);
                            this.SetbIsBound(true);
                        }
                        if (local_54.ComponentHasTag(local_30))
                        {
                            this.SetBoundsMinComponent(local_54);
                        }
                        if (local_54.ComponentHasTag(local_28))
                        {
                            this.SetBoundsMaxComponent(local_54);
                        }
                    }
                }
            }
        }
        return;
    }
    void Tick()
    {
        UPanelSlot local_82;
        UCanvasPanelSlot local_86;
        USizeBox local_92;
        if (!(this.GetbIsBound()))
        {
            return;
        }
        if (this.GetBoundComponent() == nullptr)
        {
            this.SetbIsBound(false);
            return;
        }
        FECSEntity local_10 = this.GetContext().GetLocalPlayer();
        GetDefaulted local_14;
        TWeakObjectPtr<AECSPlayerController> local_16 = local_14.opCall().GetUEPlayerController();
        AECSPlayerController local_18;
        APlayerController local_6 = local_18;
        if (local_6 == nullptr)
        {
            return;
        }
        FVector local_30 = this.GetBoundComponent().GetWorldLocation();
        FVector2D local_34;
        if (local_6.ProjectWorldLocationToScreen(local_30, local_34, false))
        {
            float32 local_39 = WidgetLayout::GetViewportScale(__GetWorldContext());
            FVector2D local_44 = (WorldUtils::GetViewportSize() * 0.5);
            FVector2D local_52 = (local_34 - local_44);
            float local_54 = local_39;
            FVector2D local_62 = (local_52 / local_54);
            if (this.GetBoundsMinComponent() != nullptr && (this.GetBoundsMaxComponent() != nullptr))
            {
                FVector2D local_66;
                FVector2D local_70;
                bool local_1 = local_6.ProjectWorldLocationToScreen(this.GetBoundsMinComponent().GetWorldLocation(), local_66, false);
                if (local_1 && local_6.ProjectWorldLocationToScreen(this.GetBoundsMaxComponent().GetWorldLocation(), local_70, false))
                {
                    FVector2D local_58 = FVector2D(0.5, 0.5);
                    if (this.GetBoundWidget() != nullptr)
                    {
                        local_82 = this.GetBoundWidget().Slot;
                        local_86 = (Cast<UCanvasPanelSlot>(local_82));
                        if (local_86 != nullptr)
                        {
                            local_58 = local_86.GetAlignment();
                        }
                    }
                    local_54 = FMath::Lerp(local_66.Y, local_70.Y, local_58.Y);
                    local_54 = local_54 - local_44.Y;
                    float local_88 = local_39;
                    local_62 = (FVector2D(((FMath::Lerp(local_66.X, local_70.X, local_58.X)) - local_44.X), local_54) / local_88);
                    if (this.GetBoundWidget() != nullptr)
                    {
                        local_92 = (Cast<USizeBox>(this.GetBoundWidget()));
                        if (local_92 != nullptr)
                        {
                            local_88 = local_70.X;
                            local_88 = FMath::Abs((local_88 - local_66.X)) / local_39;
                            local_92.SetWidthOverride(float32(local_88));
                            local_88 = local_70.Y;
                            local_88 = FMath::Abs((local_88 - local_66.Y)) / local_39;
                            local_92.SetHeightOverride(float32(local_88));
                        }
                    }
                }
            }
            if (this.GetBoundWidget() != nullptr)
            {
                this.GetBoundWidget().SetRenderTranslation(local_62);
                return;
            }
            FWidgetTransform local_108;
            local_108.Translation = local_62;
            this.SetRenderTransform(local_108);
        }
        return;
    }
    FName GetTagName() const property
    {
        FName __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FName GetModify_TagName() property
    {
        FName __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetTagName(const FName &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_TagName = __Value;
        return;
    }
    bool GetbDebugDraw() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bDebugDraw;
    }
    void SetbDebugDraw(const bool __Value) property
    {
        if (!(this.m_bDebugDraw) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bDebugDraw = __Value;
        return;
    }
    FWidgetTransform GetRenderTransform() const property
    {
        FWidgetTransform __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    FWidgetTransform GetModify_RenderTransform() property
    {
        FWidgetTransform __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetRenderTransform(const FWidgetTransform &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_RenderTransform = __Value;
        return;
    }
    USceneComponent GetBoundComponent() const property
    {
        this.TrackPropertyRead(3);
        return this.m_BoundComponent;
    }
    void SetBoundComponent(const USceneComponent __Value) property
    {
        if (this.m_BoundComponent == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        return;
    }
    USceneComponent GetBoundsMinComponent() const property
    {
        this.TrackPropertyRead(4);
        return this.m_BoundsMinComponent;
    }
    void SetBoundsMinComponent(const USceneComponent __Value) property
    {
        if (this.m_BoundsMinComponent == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        return;
    }
    USceneComponent GetBoundsMaxComponent() const property
    {
        this.TrackPropertyRead(5);
        return this.m_BoundsMaxComponent;
    }
    void SetBoundsMaxComponent(const USceneComponent __Value) property
    {
        if (this.m_BoundsMaxComponent == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        return;
    }
    UWidget GetBoundWidget() const property
    {
        this.TrackPropertyRead(6);
        return this.m_BoundWidget;
    }
    void SetBoundWidget(const UWidget __Value) property
    {
        if (this.m_BoundWidget == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        return;
    }
    bool GetbIsBound() const property
    {
        this.TrackPropertyRead(7);
        return this.m_bIsBound;
    }
    void SetbIsBound(const bool __Value) property
    {
        if (!(this.m_bIsBound) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_bIsBound = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_BindCompPosition
{
    UPROPERTY()
    TEUIModelRef<FVM_BindCompPosition> Self;

    __GeneratedProperties_FVM_BindCompPosition()
    {
        return;
    }
}

namespace FVM_BindCompPosition
{
FVM_BindCompPosition& Create(const UObject ContextObject)
{
    return FVM_BindCompPosition::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_BindCompPosition CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_BindCompPosition __r;
    TEUIModelRef<FVM_BindCompPosition> local_6 = TEUIModelRef<FVM_BindCompPosition>(EUIInternal::MakeModelWithManager(Manager, FVM_BindCompPosition::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostLoad(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(true);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "RenderTransform";
    local_14.TypeName = "FWidgetTransform";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (1 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsBound";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_BindCompPosition>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_BindCompPosition;
    Result.TickFunction.FunctionName = "__Tick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_BindCompPosition;
}
void __Tick(FVM_BindCompPosition &inout Model)
{
    Model.Tick();
    return;
}
FWidgetTransform __UIGetter_RenderTransform(const FVM_BindCompPosition &inout Model)
{
    return Model.GetRenderTransform();
}
void __UISetter_RenderTransform(FVM_BindCompPosition &inout Model, const FWidgetTransform &inout Value)
{
    Model.SetRenderTransform(Value);
    return;
}
bool __UIGetter_bIsBound(const FVM_BindCompPosition &inout Model)
{
    return Model.GetbIsBound();
}
TEUIModelRef<FVM_BindCompPosition> __UIGetter_Self(const FVM_BindCompPosition &inout Model)
{
    return TEUIModelRef<FVM_BindCompPosition>(Model);
}
int __IndexOf_TagName()
{
    return 0;
}
int __IndexOf_bDebugDraw()
{
    return 1;
}
int __IndexOf_RenderTransform()
{
    return 2;
}
int __IndexOf_BoundComponent()
{
    return 3;
}
int __IndexOf_BoundsMinComponent()
{
    return 4;
}
int __IndexOf_BoundsMaxComponent()
{
    return 5;
}
int __IndexOf_BoundWidget()
{
    return 6;
}
int __IndexOf_bIsBound()
{
    return 7;
}
}
namespace __GeneratedProperties_FVM_BindCompPosition
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
