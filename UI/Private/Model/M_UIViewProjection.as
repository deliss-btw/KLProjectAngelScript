
namespace FMS_UIViewProjection
{
    const int ModelId = 0;

}
struct FMS_UIViewProjection : FEUIModelSingleton
{
    FEUIModelSingleton _base_FEUIModelSingleton;
    UPROPERTY()
    FEUIViewProjectionSnapshot m_Snapshot;

    FMS_UIViewProjection()
    {
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FMS_UIViewProjection(const FMS_UIViewProjection &inout Other)
    {
        this.m_Snapshot = Other.m_Snapshot;
        return;
    }
    FMS_UIViewProjection& opAssign(const FMS_UIViewProjection &inout Other)
    {
        return Other.m_Snapshot;
    }
    void RefreshSnapshot()
    {
        APlayerController local_2;
        FECSEntity local_6 = this.GetContext().GetLocalPlayer();
        Get local_10;
        const FC_PlayerController& local_12 = local_10.opCall();
        if (local_12)
        {
            TWeakObjectPtr<AECSPlayerController> local_15 = local_12.GetUEPlayerController();
            AECSPlayerController local_18;
            local_2 = local_18;
        }
        this.GetModify_Snapshot().CaptureFromPlayer(local_2);
        return;
    }
    bool IsSnapshotValid() const
    {
        return this.GetSnapshot().bValid;
    }
    bool IsPositionOutOfScreen(const FVector &inout WorldLocation, const float32 ExtraPaddingRatio = 0.f) const
    {
        return this.GetSnapshot().IsPositionOutOfScreen(WorldLocation, ExtraPaddingRatio);
    }
    bool ProjectWorldToViewport(const FVector &inout WorldLocation, FVector2D &out OutViewportPosition) const
    {
        FVector2D local_4;
        OutViewportPosition = local_4;
        return this.GetSnapshot().ProjectWorldToViewport(WorldLocation, OutViewportPosition);
    }
    FVector GetCameraLocation() const
    {
        return this.GetSnapshot().CameraLocation;
    }
    FRotator GetCameraRotation() const
    {
        return this.GetSnapshot().CameraRotation;
    }
    float32 GetHalfFOVDegrees() const
    {
        return this.GetSnapshot().HalfFOVDegrees;
    }
    const FEUIViewProjectionSnapshot GetSnapshot() const property
    {
        const FEUIViewProjectionSnapshot __r;
        this.TrackPropertyRead(0);
        return __r;
    }
    FEUIViewProjectionSnapshot GetModify_Snapshot() property
    {
        FEUIViewProjectionSnapshot __r;
        this.MarkPropertyDirty(0);
        return __r;
    }
    void SetSnapshot(const FEUIViewProjectionSnapshot &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_Snapshot = __Value;
        return;
    }
}

namespace FMS_UIViewProjection
{
FMS_UIViewProjection& Get(const UObject ContextObject)
{
    return FMS_UIViewProjection::GetByManager(EUIInternal::GetContextManager(ContextObject));
}
FMS_UIViewProjection GetByManager(const UEUIManagerSubsystem Manager)
{
    FMS_UIViewProjection __r;
    TEUIModelRef<FMS_UIViewProjection> local_6 = TEUIModelRef<FMS_UIViewProjection>(EUIInternal::MakeModelWithManager(Manager, FMS_UIViewProjection::ModelId));
    return __r;
}
void GetModelInfo(FEUIModelOnlyMetaInfo &inout Result)
{
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    return;
}
UScriptStruct GetModelStruct()
{
    return FMS_UIViewProjection;
}
int __IndexOf_Snapshot()
{
    return 0;
}
}
