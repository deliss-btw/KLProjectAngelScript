
namespace FVM_NavigationBar
{
    const int ModelId = 0;

}
struct FVM_NavigationBar : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    TEUIModelRef<FM_SpotFilter> m_SpotFilter;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_NavigationBarIcon>> m_NavigationBarIcons;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_NavigationBarIcon>> m_LeftResidentIcons;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_NavigationBarIcon>> m_RightResidentIcons;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_NavigationBarIcon>> PendingNavigationBarIcons;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_NavigationBarIcon>> PendingLeftResidentIcons;
    UPROPERTY()
    TArray<TEUIModelRef<FVM_NavigationBarIcon>> PendingRightResidentIcons;
    UPROPERTY()
    bool m_bHasLockTarget;
    UPROPERTY()
    float32 m_DelayShowSeconds;
    UPROPERTY()
    float m_ShowDelayEndTime;
    UPROPERTY()
    bool m_bLastWasHardLock;

    FVM_NavigationBar()
    {
        this.m_bHasLockTarget = false;
        this.m_DelayShowSeconds = 1.5f;
        this.m_ShowDelayEndTime = -1.0;
        this.m_bLastWasHardLock = false;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_NavigationBar(const FVM_NavigationBar &inout Other)
    {
        this.m_bHasLockTarget = false;
        this.m_DelayShowSeconds = 1.5f;
        this.m_ShowDelayEndTime = -1.0;
        this.m_bLastWasHardLock = false;
        this.m_SpotFilter = Other.m_SpotFilter;
        this.m_NavigationBarIcons = Other.m_NavigationBarIcons;
        this.m_LeftResidentIcons = Other.m_LeftResidentIcons;
        this.m_RightResidentIcons = Other.m_RightResidentIcons;
        this.m_bHasLockTarget = Other.m_bHasLockTarget;
        this.m_DelayShowSeconds = Other.m_DelayShowSeconds;
        this.m_ShowDelayEndTime = Other.m_ShowDelayEndTime;
        this.m_bLastWasHardLock = Other.m_bLastWasHardLock;
        return;
    }
    FVM_NavigationBar opAssign(const FVM_NavigationBar &inout Other)
    {
        FVM_NavigationBar __r;
        this.m_SpotFilter = Other.m_SpotFilter;
        this.m_NavigationBarIcons = Other.m_NavigationBarIcons;
        this.m_LeftResidentIcons = Other.m_LeftResidentIcons;
        this.m_RightResidentIcons = Other.m_RightResidentIcons;
        this.m_bHasLockTarget = Other.m_bHasLockTarget;
        this.m_DelayShowSeconds = Other.m_DelayShowSeconds;
        this.m_ShowDelayEndTime = Other.m_ShowDelayEndTime;
        this.m_bLastWasHardLock = Other.m_bLastWasHardLock;
        return __r;
    }
    void LoadConfigDefault(const FVM_NavigationBarConfigDefault &inout InConfig)
    {
        this.SetDelayShowSeconds(InConfig.DelayShowSeconds);
        return;
    }
    void PostConstruct()
    {
        this.SetSpotFilter(::FMS_CommonSpotFilters::Get(this.GetContext().Manager).GetOrCreateFilter(this.GetContext().Manager, EPresentationSpotUsage(2)));
        return;
    }
    bool GetShouldDisplay() const
    {
        return !(this.GetbHasLockTarget());
    }
    void ManualAsyncTick()
    {
        int local_16 = 0;
        int local_22 = 0;
        int local_180 = 0;
        if (!(this.GetSpotFilter()))
        {
            return;
        }
        if (!(this.GetContext().GetLocalPlayer().IsValid()) || !(this.GetContext().GetLocalPlayerPawn().IsValid()))
        {
            return;
        }
        FECSEntity local_8 = this.GetContext().GetLocalPlayer();
        if (!(local_16) || !(local_22))
        {
            return;
        }
        FVector local_28(local_16.ViewPosition);
        FRotator local_34 = FRotator(local_16.ViewDir);
        FVector local_44 = FTransformUtils::GetLocation(this.GetContext().GetLocalPlayerPawn(), FFPTime(-1));
        FSpotViewAdapter local_58 = FSpotViewAdapter(this.GetSpotFilter().opArrow().GetSpotView());
        this.PendingNavigationBarIcons.Reset(0);
        this.PendingLeftResidentIcons.Reset(0);
        this.PendingRightResidentIcons.Reset(0);
        this.PendingNavigationBarIcons.Reserve(this.GetSpotFilter().opArrow().GetDisplayingSpots().Num());
        this.PendingLeftResidentIcons.Reserve(this.GetSpotFilter().opArrow().GetDisplayingSpots().Num());
        this.PendingRightResidentIcons.Reserve(this.GetSpotFilter().opArrow().GetDisplayingSpots().Num());
        for (auto& local_82 : this.GetSpotFilter().opArrow().GetDisplayingSpots())
        {
            if (!(local_82))
            {
                continue;
            }
            FVector local_50 = ::PresentationSpotUtils::GetSpotLocation(local_82);
            if (this.IsVisibleInIndicatorBar(local_28, local_34, local_44, local_50, local_22.GetFOV()))
            {
                this.PendingNavigationBarIcons.Add(TEUIModelRef<FVM_NavigationBarIcon>(::FVM_NavigationBarIcon::Create(this.GetContext().Manager, local_82)));
                continue;
            }
            TDataObjectPtr<FNavigationBarIconConfig> local_116 = ::GetNavigationBarIconConfig(local_82.opArrow(), local_58);
            if (!(local_116) || !(local_116.opArrow().bResident))
            {
                continue;
            }
            if (::NavigationBarUtils::ComputeHorizontalAngle(local_28, local_34, local_50) < 0.0)
            {
                this.PendingLeftResidentIcons.Add(TEUIModelRef<FVM_NavigationBarIcon>(::FVM_NavigationBarIcon::Create(this.GetContext().Manager, local_82)));
                continue;
            }
            this.PendingRightResidentIcons.Add(TEUIModelRef<FVM_NavigationBarIcon>(::FVM_NavigationBarIcon::Create(this.GetContext().Manager, local_82)));
        }
        __Lambda_UI_Private_ViewModel_HUD_NavigationBar_VM_NavigationBar_108(local_44);
        __Lambda_UI_Private_ViewModel_HUD_NavigationBar_VM_NavigationBar_111(local_28, local_34);
        __Lambda_UI_Private_ViewModel_HUD_NavigationBar_VM_NavigationBar_112(local_28, local_34);
        this.CommitNavigationBarIconsIfChanged(this.PendingNavigationBarIcons);
        this.CommitLeftResidentIconsIfChanged(this.PendingLeftResidentIcons);
        this.CommitRightResidentIconsIfChanged(this.PendingRightResidentIcons);
        FECSEntity local_8_2 = this.GetContext().GetLocalPlayerPawn();
        if (local_180 || false)
        {
            this.SetbHasLockTarget(true);
            this.SetShowDelayEndTime(-1.0);
            this.SetbLastWasHardLock((int(local_180.GetType()) == 2));
        }
        else
        {
            if (this.GetbHasLockTarget())
            {
                if (this.GetbLastWasHardLock())
                {
                    this.SetbHasLockTarget(false);
                }
                else
                {
                    float local_142 = ECS::GetUEWorld().GetTimeSeconds();
                    if (this.GetShowDelayEndTime() < 0.0)
                    {
                        float local_188 = this.GetDelayShowSeconds();
                        float local_144 = local_142 + local_188;
                        this.SetShowDelayEndTime(local_144);
                    }
                    else
                    {
                        if (local_142 >= this.GetShowDelayEndTime())
                        {
                            this.SetbHasLockTarget(false);
                            this.SetShowDelayEndTime(-1.0);
                        }
                    }
                }
            }
        }
        return;
    }
    void CommitNavigationBarIconsIfChanged(const TArray<TEUIModelRef<FVM_NavigationBarIcon>> &inout NextIcons)
    {
        TArray<TEUIModelRef<FVM_NavigationBarIcon>> local_4;
        local_4 = this.GetNavigationBarIcons();
        if ((local_4 == NextIcons))
        {
            return;
        }
        this.GetModify_NavigationBarIcons() = NextIcons;
        return;
    }
    void CommitLeftResidentIconsIfChanged(const TArray<TEUIModelRef<FVM_NavigationBarIcon>> &inout NextIcons)
    {
        TArray<TEUIModelRef<FVM_NavigationBarIcon>> local_4;
        local_4 = this.GetLeftResidentIcons();
        if ((local_4 == NextIcons))
        {
            return;
        }
        this.GetModify_LeftResidentIcons() = NextIcons;
        return;
    }
    void CommitRightResidentIconsIfChanged(const TArray<TEUIModelRef<FVM_NavigationBarIcon>> &inout NextIcons)
    {
        TArray<TEUIModelRef<FVM_NavigationBarIcon>> local_4;
        local_4 = this.GetRightResidentIcons();
        if ((local_4 == NextIcons))
        {
            return;
        }
        this.GetModify_RightResidentIcons() = NextIcons;
        return;
    }
    bool IsVisibleInIndicatorBar(const FVector &inout ViewPosition, const FRotator &inout ViewRotation, const FVector &inout PlayerPosition, const FVector &inout TargetPosition, const float32 FOV) const
    {
        if (ViewRotation.GetForwardVector().DotProduct((TargetPosition - PlayerPosition)) < 0.0)
        {
            return false;
        }
        float local_14 = ::NavigationBarUtils::ComputeHorizontalAngle(ViewPosition, ViewRotation, TargetPosition);
        float32 local_21 = FOV / 2.0f;
        float32 local_22 = -local_21;
        return local_14 >= local_22 && (local_14 <= local_21);
    }
    TEUIModelRef<FM_SpotFilter> GetSpotFilter() const property
    {
        this.TrackPropertyRead(0);
        return this.m_SpotFilter;
    }
    void SetSpotFilter(const TEUIModelRef<FM_SpotFilter> &inout __Value) property
    {
        TEUIModelRef<FM_SpotFilter> local_2;
        local_2 = this.m_SpotFilter;
        if ((local_2 == __Value.opImplConv()))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_SpotFilter = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_NavigationBarIcon>> GetNavigationBarIcons() const property
    {
        const TArray<TEUIModelRef<FVM_NavigationBarIcon>> __r;
        this.TrackPropertyRead(1);
        return __r;
    }
    TArray<TEUIModelRef<FVM_NavigationBarIcon>> GetModify_NavigationBarIcons() property
    {
        TArray<TEUIModelRef<FVM_NavigationBarIcon>> __r;
        this.MarkPropertyDirty(1);
        return __r;
    }
    void SetNavigationBarIcons(const TArray<TEUIModelRef<FVM_NavigationBarIcon>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_NavigationBarIcons = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_NavigationBarIcon>> GetLeftResidentIcons() const property
    {
        const TArray<TEUIModelRef<FVM_NavigationBarIcon>> __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    TArray<TEUIModelRef<FVM_NavigationBarIcon>> GetModify_LeftResidentIcons() property
    {
        TArray<TEUIModelRef<FVM_NavigationBarIcon>> __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetLeftResidentIcons(const TArray<TEUIModelRef<FVM_NavigationBarIcon>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_LeftResidentIcons = __Value;
        return;
    }
    const TArray<TEUIModelRef<FVM_NavigationBarIcon>> GetRightResidentIcons() const property
    {
        const TArray<TEUIModelRef<FVM_NavigationBarIcon>> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<TEUIModelRef<FVM_NavigationBarIcon>> GetModify_RightResidentIcons() property
    {
        TArray<TEUIModelRef<FVM_NavigationBarIcon>> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetRightResidentIcons(const TArray<TEUIModelRef<FVM_NavigationBarIcon>> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_RightResidentIcons = __Value;
        return;
    }
    bool GetbHasLockTarget() const property
    {
        this.TrackPropertyRead(4);
        return this.m_bHasLockTarget;
    }
    void SetbHasLockTarget(const bool __Value) property
    {
        if (!(this.m_bHasLockTarget) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_bHasLockTarget = __Value;
        return;
    }
    const float32 GetDelayShowSeconds() const property
    {
        const float32 __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    float32 GetModify_DelayShowSeconds() property
    {
        float32 __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetDelayShowSeconds(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_DelayShowSeconds = __Value;
        return;
    }
    const float GetShowDelayEndTime() const property
    {
        const float __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    float GetModify_ShowDelayEndTime() property
    {
        float __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetShowDelayEndTime(const float &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_ShowDelayEndTime = __Value;
        return;
    }
    bool GetbLastWasHardLock() const property
    {
        this.TrackPropertyRead(7);
        return this.m_bLastWasHardLock;
    }
    void SetbLastWasHardLock(const bool __Value) property
    {
        if (!(this.m_bLastWasHardLock) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_bLastWasHardLock = __Value;
        return;
    }
}

struct __Lambda_UI_Private_ViewModel_HUD_NavigationBar_VM_NavigationBar_108
{
    UPROPERTY()
    FVector __PlayerPosition;

    __Lambda_UI_Private_ViewModel_HUD_NavigationBar_VM_NavigationBar_108()
    {
        return;
    }
    __Lambda_UI_Private_ViewModel_HUD_NavigationBar_VM_NavigationBar_108(const FVector &inout _InPlayerPosition)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FVector GetPlayerPosition() property
    {
        FVector __r;
        return __r;
    }
    bool opCall(const TEUIModelRef<FVM_NavigationBarIcon> &inout A, const TEUIModelRef<FVM_NavigationBarIcon> &inout B)
    {
        return ::PresentationSpotUtils::CompareDistance(this.GetPlayerPosition(), A.opArrow().GetSpot(), B.opArrow().GetSpot(), false);
    }
}

struct __Lambda_UI_Private_ViewModel_HUD_NavigationBar_VM_NavigationBar_111
{
    UPROPERTY()
    FVector __ViewPosition;
    UPROPERTY()
    FRotator __ViewRotation;

    __Lambda_UI_Private_ViewModel_HUD_NavigationBar_VM_NavigationBar_111()
    {
        return;
    }
    __Lambda_UI_Private_ViewModel_HUD_NavigationBar_VM_NavigationBar_111(const FVector &inout _InViewPosition, const FRotator &inout _InViewRotation)
    {
        this.__ViewRotation = _InViewRotation;
        return;
    }
    FVector GetViewPosition() property
    {
        FVector __r;
        return __r;
    }
    FRotator GetViewRotation() property
    {
        FRotator __r;
        return __r;
    }
    bool opCall(const TEUIModelRef<FVM_NavigationBarIcon> &inout A, const TEUIModelRef<FVM_NavigationBarIcon> &inout B)
    {
        return (::NavigationBarUtils::GetSpotAbsHorizontalAngle(this.GetViewPosition(), this.GetViewRotation(), A.opArrow().GetSpot()) > ::NavigationBarUtils::GetSpotAbsHorizontalAngle(this.GetViewPosition(), this.GetViewRotation(), B.opArrow().GetSpot()));
    }
}

struct __Lambda_UI_Private_ViewModel_HUD_NavigationBar_VM_NavigationBar_112
{
    UPROPERTY()
    FVector __ViewPosition;
    UPROPERTY()
    FRotator __ViewRotation;

    __Lambda_UI_Private_ViewModel_HUD_NavigationBar_VM_NavigationBar_112()
    {
        return;
    }
    __Lambda_UI_Private_ViewModel_HUD_NavigationBar_VM_NavigationBar_112(const FVector &inout _InViewPosition, const FRotator &inout _InViewRotation)
    {
        this.__ViewRotation = _InViewRotation;
        return;
    }
    FVector GetViewPosition() property
    {
        FVector __r;
        return __r;
    }
    FRotator GetViewRotation() property
    {
        FRotator __r;
        return __r;
    }
    bool opCall(const TEUIModelRef<FVM_NavigationBarIcon> &inout A, const TEUIModelRef<FVM_NavigationBarIcon> &inout B)
    {
        return (::NavigationBarUtils::GetSpotAbsHorizontalAngle(this.GetViewPosition(), this.GetViewRotation(), A.opArrow().GetSpot()) > ::NavigationBarUtils::GetSpotAbsHorizontalAngle(this.GetViewPosition(), this.GetViewRotation(), B.opArrow().GetSpot()));
    }
}

struct __GeneratedProperties_FVM_NavigationBar
{
    UPROPERTY()
    bool ShouldDisplay;
    UPROPERTY()
    TEUIModelRef<FVM_NavigationBar> Self;


}

namespace NavigationBarUtils
{
float ComputeHorizontalAngle(const FVector &inout ViewPosition, const FRotator &inout ViewRotation, const FVector &inout TargetPosition)
{
    return FMath::UnwindDegrees(FMath::FindDeltaAngleDegrees(ViewRotation.Yaw, (FRotator::MakeFromX((TargetPosition - ViewPosition)).Yaw)));
}
float GetSpotAbsHorizontalAngle(const FVector &inout ViewPosition, const FRotator &inout ViewRotation, const TEUIModelRef<FM_Spot> &inout Spot)
{
    if (!(Spot))
    {
        return 180.0;
    }
    return FMath::Abs(NavigationBarUtils::ComputeHorizontalAngle(ViewPosition, ViewRotation, PresentationSpotUtils::GetSpotLocation(Spot)));
}
}
namespace FVM_NavigationBar
{
FVM_NavigationBar& Create(const UObject ContextObject)
{
    return FVM_NavigationBar::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_NavigationBar CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_NavigationBar __r;
    TEUIModelRef<FVM_NavigationBar> local_6 = TEUIModelRef<FVM_NavigationBar>(EUIInternal::MakeModelWithManager(Manager, FVM_NavigationBar::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(true);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "NavigationBarIcons";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_NavigationBarIcon>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "LeftResidentIcons";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_NavigationBarIcon>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "RightResidentIcons";
    local_14.TypeName = "TArray<TEUIModelRef<FVM_NavigationBarIcon>>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bHasLockTarget";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "ShouldDisplay";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_NavigationBar>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_NavigationBar;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_NavigationBar;
}
TArray<TEUIModelRef<FVM_NavigationBarIcon>> __UIGetter_NavigationBarIcons(const FVM_NavigationBar &inout Model)
{
    return Model.GetNavigationBarIcons();
}
TArray<TEUIModelRef<FVM_NavigationBarIcon>> __UIGetter_LeftResidentIcons(const FVM_NavigationBar &inout Model)
{
    return Model.GetLeftResidentIcons();
}
TArray<TEUIModelRef<FVM_NavigationBarIcon>> __UIGetter_RightResidentIcons(const FVM_NavigationBar &inout Model)
{
    return Model.GetRightResidentIcons();
}
bool __UIGetter_bHasLockTarget(const FVM_NavigationBar &inout Model)
{
    return Model.GetbHasLockTarget();
}
bool __UIGetter_ShouldDisplay(const FVM_NavigationBar &inout Model)
{
    return Model.GetShouldDisplay();
}
TEUIModelRef<FVM_NavigationBar> __UIGetter_Self(const FVM_NavigationBar &inout Model)
{
    return TEUIModelRef<FVM_NavigationBar>(Model);
}
int __IndexOf_SpotFilter()
{
    return 0;
}
int __IndexOf_NavigationBarIcons()
{
    return 1;
}
int __IndexOf_LeftResidentIcons()
{
    return 2;
}
int __IndexOf_RightResidentIcons()
{
    return 3;
}
int __IndexOf_bHasLockTarget()
{
    return 4;
}
int __IndexOf_DelayShowSeconds()
{
    return 5;
}
int __IndexOf_ShowDelayEndTime()
{
    return 6;
}
int __IndexOf_bLastWasHardLock()
{
    return 7;
}
}
namespace __GeneratedProperties_FVM_NavigationBar
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
