
namespace FMS_BossTrackingAreaDisplay
{
    const int ModelId = 0;

}
struct FMS_BossTrackingAreaDisplay : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    FMinimapIconHandle m_IconHandle;
    UPROPERTY()
    bool m_bCurrentlyVisible;
    UPROPERTY()
    float32 m_DiagCheckElapsed;
    UPROPERTY()
    float32 m_DiagCheckInterval;

    FMS_BossTrackingAreaDisplay()
    {
        this.m_bCurrentlyVisible = false;
        this.m_DiagCheckElapsed = 0.0f;
        this.m_DiagCheckInterval = 0.5f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_BossTrackingAreaDisplay(const FMS_BossTrackingAreaDisplay &inout Other)
    {
        this.m_bCurrentlyVisible = false;
        this.m_DiagCheckElapsed = 0.0f;
        this.m_DiagCheckInterval = 0.5f;
        this.m_IconHandle = Other.m_IconHandle;
        this.m_bCurrentlyVisible = Other.m_bCurrentlyVisible;
        this.m_DiagCheckElapsed = Other.m_DiagCheckElapsed;
        this.m_DiagCheckInterval = Other.m_DiagCheckInterval;
        return;
    }
    FMS_BossTrackingAreaDisplay opAssign(const FMS_BossTrackingAreaDisplay &inout Other)
    {
        FMS_BossTrackingAreaDisplay __r;
        this.m_IconHandle = Other.m_IconHandle;
        this.m_bCurrentlyVisible = Other.m_bCurrentlyVisible;
        this.m_DiagCheckElapsed = Other.m_DiagCheckElapsed;
        this.m_DiagCheckInterval = Other.m_DiagCheckInterval;
        return __r;
    }
    void DS_OnBossTrackingAreaChanged(const FCS_BossTrackingArea &inout TrackingArea)
    {
        bool local_4;
        float local_10;
        bool local_2 = !(!(TrackingArea));
        if (local_2)
        {
            local_4 = TrackingArea.GetbVisible();
        }
        else
        {
            local_4 = false;
        }
        if (local_2)
        {
            float32 local_17 = TrackingArea.GetRadius();
        }
        else
        {
        }
        if (local_2)
        {
            float local_14 = TrackingArea.GetWorldCenter().Y;
        }
        else
        {
        }
        if (local_2)
        {
            local_10 = TrackingArea.GetWorldCenter().X;
        }
        else
        {
            local_10 = 0.0;
        }
        XLog(ELog(51), FString().Append("[DIAG-BossTrack] Monitor FIRED: valid=").Append(local_2).Append(", ECS.bVisible=").Append(local_4).Append(", UI.bCurrentlyVisible=").Append(this.GetbCurrentlyVisible()).Append(", center=(").Append(local_10).Append().Append().Append().Append());
        if (!(TrackingArea) || !(TrackingArea.GetbVisible()))
        {
            this.RemoveIcon();
            return;
        }
        if (!(this.GetbCurrentlyVisible()))
        {
            this.CreateIcon(TrackingArea);
            return;
        }
        this.UpdateIcon(TrackingArea);
        return;
    }
    void DiagTick()
    {
        int local_14 = 0;
        bool local_17;
        float32 local_4 = this.GetDiagCheckElapsed();
        float32 local_3 = float32(this.GetContext().DeltaTime.ToSeconds());
        local_4 = local_4 + local_3;
        this.SetDiagCheckElapsed(local_4);
        if (this.GetDiagCheckElapsed() < this.GetDiagCheckInterval())
        {
            return;
        }
        this.SetDiagCheckElapsed(0.0f);
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        if (local_14)
        {
            local_17 = local_14.GetbVisible();
        }
        else
        {
            local_17 = false;
        }
        if (!(local_17) != !(this.GetbCurrentlyVisible()))
        {
            XWarning(ELog(51), FString().Append("[DIAG-BossTrack] DESYNC DETECTED! ECS.bVisible=").Append(local_17).Append(", UI.bCurrentlyVisible=").Append(this.GetbCurrentlyVisible()).Append(" вЂ” Monitor missed, forcing sync"));
            this.DS_OnBossTrackingAreaChanged(local_14);
        }
        return;
    }
    void BeginDestroy()
    {
        XLog(ELog(51), FString().Append("[DIAG-BossTrack] BeginDestroy: bCurrentlyVisible=").Append(this.GetbCurrentlyVisible()));
        this.RemoveIcon();
        return;
    }
    void CreateIcon(const FCS_BossTrackingArea &inout TrackingArea)
    {
        XLog(ELog(51), FString().Append("[DIAG-BossTrack] CreateIcon: enter, bCurrentlyVisible=").Append(this.GetbCurrentlyVisible()).Append(", center=(").Append(TrackingArea.GetWorldCenter().X).Append(", ").Append(TrackingArea.GetWorldCenter().Y).Append("), radius=").Append(TrackingArea.GetRadius()));
        UMinimapGlobalConfig local_12 = ::MinimapUtils::GetMinimapGlobalConfig();
        if (local_12 == nullptr || local_12.BossTrackingAreaIconWidget.IsNull())
        {
            XWarning(ELog(51), "[DIAG-BossTrack] CreateIcon: FAILED вЂ” BossTrackingAreaIconWidget not configured in MinimapGlobalConfig");
            return;
        }
        FMinimapIconInfo local_56;
        local_56.WorldPosition = TrackingArea.GetWorldCenter();
        local_56.IconSize = FVector2D((TrackingArea.GetRadius() * 2.0f), (TrackingArea.GetRadius() * 2.0f));
        local_56.IconWidget = local_12.BossTrackingAreaIconWidget;
        local_56.DisplaySettings.ScaleRule = (3 != 0);
        local_56.DisplaySettings.IconAlignment = FVector2D(0.5, 0.5);
        this.SetIconHandle(::MinimapUtils::AddSystemIcon(local_56));
        this.SetbCurrentlyVisible(true);
        XLog(ELog(51), FString().Append("[DIAG-BossTrack] CreateIcon: SUCCESS, handleValid=").Append(::MinimapUtils::IsValidHandle(this.GetIconHandle())));
        return;
    }
    void UpdateIcon(const FCS_BossTrackingArea &inout TrackingArea)
    {
        bool local_2 = ::MinimapUtils::IsValidHandle(this.GetIconHandle());
        XLog(ELog(51), FString().Append("[DIAG-BossTrack] UpdateIcon: enter, handleValid=").Append(local_2).Append(", center=(").Append(TrackingArea.GetWorldCenter().X).Append(", ").Append(TrackingArea.GetWorldCenter().Y).Append("), radius=").Append(TrackingArea.GetRadius()));
        if (!(local_2))
        {
            XWarning(ELog(51), "[DIAG-BossTrack] UpdateIcon: handle invalid, fallback to CreateIcon");
            this.CreateIcon(TrackingArea);
            return;
        }
        FMinimapIconInfo local_50 = ::MinimapUtils::GetIconInfo(this.GetIconHandle());
        local_50.WorldPosition = TrackingArea.GetWorldCenter();
        local_50.IconSize = FVector2D((TrackingArea.GetRadius() * 2.0f), (TrackingArea.GetRadius() * 2.0f));
        ::MinimapUtils::UpdateIconInfo(this.GetIconHandle(), local_50);
        return;
    }
    void RemoveIcon()
    {
        bool local_2 = ::MinimapUtils::IsValidHandle(this.GetIconHandle());
        XLog(ELog(51), FString().Append("[DIAG-BossTrack] RemoveIcon: enter, bCurrentlyVisible=").Append(this.GetbCurrentlyVisible()).Append(", handleValid=").Append(local_2));
        if (local_2)
        {
            ::MinimapUtils::UnregisterIcon(this.GetIconHandle());
        }
        this.SetIconHandle(FMinimapIconHandle());
        this.SetbCurrentlyVisible(false);
        return;
    }
    const FMinimapIconHandle GetIconHandle() const property
    {
        const FMinimapIconHandle __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FMinimapIconHandle GetModify_IconHandle() property
    {
        FMinimapIconHandle __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetIconHandle(const FMinimapIconHandle &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_IconHandle = __Value;
        return;
    }
    bool GetbCurrentlyVisible() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bCurrentlyVisible;
    }
    void SetbCurrentlyVisible(const bool __Value) property
    {
        if (!(this.m_bCurrentlyVisible) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bCurrentlyVisible = __Value;
        return;
    }
    const float32 GetDiagCheckElapsed() const property
    {
        const float32 __r;
        this.TrackPropertyRead(2);
        return __r;
    }
    float32 GetModify_DiagCheckElapsed() property
    {
        float32 __r;
        this.MarkPropertyDirty(2);
        return __r;
    }
    void SetDiagCheckElapsed(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_DiagCheckElapsed = __Value;
        return;
    }
    const float32 GetDiagCheckInterval() const property
    {
        const float32 __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    float32 GetModify_DiagCheckInterval() property
    {
        float32 __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetDiagCheckInterval(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_DiagCheckInterval = __Value;
        return;
    }
}

namespace FMS_BossTrackingAreaDisplay
{
FMS_BossTrackingAreaDisplay& Get(const UObject ContextObject)
{
    return FMS_BossTrackingAreaDisplay::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_BossTrackingAreaDisplay GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_BossTrackingAreaDisplay __r;
    TEUIModelRef<FMS_BossTrackingAreaDisplay> local_6 = TEUIModelRef<FMS_BossTrackingAreaDisplay>(EUIInternal::MakeModelWithManager(Manager, FMS_BossTrackingAreaDisplay::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasBeginDestroy(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    FEUIModelMonitorDefine local_14;
    local_14.FunctionName = "__DS_OnBossTrackingAreaChanged";
    local_14.ComponentType = FCS_BossTrackingArea;
    Result.MonitorFunctions.Add(local_14);
    Result.TickFunction.FunctionName = "__DiagTick";
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_BossTrackingAreaDisplay;
}
void __DS_OnBossTrackingAreaChanged(FMS_BossTrackingAreaDisplay &inout Model, const FECSEntity &inout Entity, const FCS_BossTrackingArea &inout Component)
{
    Get local_4;
    Model.DS_OnBossTrackingAreaChanged(local_4.opCall());
    return;
}
void __DiagTick(FMS_BossTrackingAreaDisplay &inout Model)
{
    Model.DiagTick();
    return;
}
void __Register_Monitor__(const FECSWorldPtr &inout ECSWorld)
{
    // body not fully recovered вЂ” stub [argmismatch:argtype]
}
int __IndexOf_IconHandle()
{
    return 0;
}
int __IndexOf_bCurrentlyVisible()
{
    return 1;
}
int __IndexOf_DiagCheckElapsed()
{
    return 2;
}
int __IndexOf_DiagCheckInterval()
{
    return 3;
}
}
