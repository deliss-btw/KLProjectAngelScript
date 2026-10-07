
enum ECameraType
{
    None,
    LayerConduit,
    FixedCamera,
    TPCamera,
    AnimatedCamera,
    NATIVE_MAX = 4,
}


struct FCameraRuntimeDataBasic
{
    UPROPERTY()
    FCameraResult CameraResult;
    UPROPERTY()
    FCameraBlend Blend;

    FCameraRuntimeDataBasic()
    {
        return;
    }
    void SetBlendPhase(const ECameraBlendPhase Phase, const FFPTime &inout WorldTime, const FCameraBlendType &inout BlendType, const float32 Duration)
    {
        this.Blend.CameraBlendType = BlendType;
        this.Blend.SetBlendPhase(ECameraBlendPhase(Phase), WorldTime, Duration);
        return;
    }
    float32 UpdateBlend(const FFPTime &inout WorldTime) const
    {
        if (FFPTime(this.Blend.EndTime).opCmp(WorldTime) <= 0)
        {
            return 1.0f;
        }
        return this.Blend.UpdateBlend(WorldTime);
    }
    void ForceBlendFinish()
    {
        this.Blend.EndTime = this.Blend.StartTime;
        return;
    }
    bool IsFullyBlend(const FFPTime &inout WorldTime) const
    {
        return this.Blend.IsFullyBlend(WorldTime);
    }
}

struct FCameraParamsBasic
{
    UPROPERTY()
    FName m_CameraName;
    UPROPERTY()
    EPresentationCameraLayer m_Layer;


    FName GetCameraName() const property
    {
        return this;
    }
    void SetCameraName(const FName &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    EPresentationCameraLayer GetLayer() const property
    {
        return this.m_Layer;
    }
    void SetLayer(const EPresentationCameraLayer __Value) property
    {
        this.m_Layer = __Value;
        return;
    }
}

