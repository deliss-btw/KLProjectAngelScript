class ABossTrackingVolume : AECSRegionVolumeBase
{
    FBoxSphereBounds CachedBounds;
    bool bCachedBounds = false;

    UFUNCTION()
    bool ShouldCreateDynamicEntity_Implementation()
    {
        return false;
    }
    FBoxSphereBounds GetVolumeBoundsWithCache()
    {
        if (!(this.bCachedBounds))
        {
            this.bCachedBounds = true;
            this.CachedBounds = this.GetBounds();
        }
        return this.CachedBounds;
    }
    bool QuickEncompassesPoint(const FVector &inout Point)
    {
        if (!(this.GetVolumeBoundsWithCache().GetBox().IsInside(Point)))
        {
            return false;
        }
        return this.EncompassesPoint(Point, 0.0f);
    }
    FVector2D GetBoundsCenter2D()
    {
        FBoxSphereBounds local_28 = this.GetVolumeBoundsWithCache();
        return FVector2D(local_28.Origin.X, local_28.Origin.Y);
    }
    float32 GetMinEnclosingCircleRadius()
    {
        FBoxSphereBounds local_28 = this.GetVolumeBoundsWithCache();
        return float32((FVector2D(local_28.BoxExtent.X, local_28.BoxExtent.Y).Size()));
    }
}

