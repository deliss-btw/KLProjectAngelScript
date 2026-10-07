

UCLASS(Abstract)
class AProjectileBaseActor : AGameActor
{
    AProjectileBaseActor()
    {
        return;
    }
    UFUNCTION()
    void OnGroundSurfaceContactChangeEvent_Implementation(const FName &inout OldSurfaceName, const FName &inout NewSurfaceName, const int NewSurfaceIndex)
    {
        return;
    }
    void OnGroundSurfaceContactChangeEvent(const FName &inout OldSurfaceName, const FName &inout NewSurfaceName, const int NewSurfaceIndex)
    {
        __Evt_PushArgument__FName(OldSurfaceName);
        __Evt_PushArgument__FName(NewSurfaceName);
        __Evt_PushArgument__int(NewSurfaceIndex);
        __Evt_Execute(this, n"OnGroundSurfaceContactChangeEvent");
        return;
    }
}

