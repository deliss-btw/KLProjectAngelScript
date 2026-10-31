struct FAimPoseCompensatorConfig
{
    UPROPERTY()
    FName Name;
    UPROPERTY()
    EAimPoseCompensateMethod Method = EAimPoseCompensateMethod(1);
    UPROPERTY()
    bool bEnabled = true;
    UPROPERTY()
    int Order = 0;
    UPROPERTY()
    FString BoneChainNames;
    UPROPERTY()
    FName SourceBoneName;
    UPROPERTY()
    FName EffectorBoneName;
    UPROPERTY()
    FCompensatorParams_Propagate PropagateParams;
    UPROPERTY()
    FCompensatorParams_Roll RollParams;
    UPROPERTY()
    FCompensatorParams_TwistSmooth TwistSmoothParams;
    UPROPERTY()
    bool bEnableDebugDraw = false;

}

struct FAimPoseCompensatorOverride
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FName m_Name;
    UPROPERTY()
    bool m_bOverrideEnabled;
    UPROPERTY()
    bool m_bEnabled;
    UPROPERTY()
    bool m_bOverrideWeight;
    UPROPERTY()
    float32 m_Weight;

    FAimPoseCompensatorOverride()
    {
        FSubDirtyFlags8 local_1;
        this.__DirtyFlags = local_1;
        this.m_bOverrideEnabled = false;
        this.m_bEnabled = true;
        this.m_bOverrideWeight = false;
        this.m_Weight = 1.0f;
        return;
    }
    FAimPoseCompensatorOverride(const FAimPoseCompensatorOverride &inout Other)
    {
        FSubDirtyFlags8 local_3;
        this.__DirtyFlags = local_3;
        this.m_bOverrideEnabled = false;
        this.m_bEnabled = true;
        this.m_bOverrideWeight = false;
        this.m_Weight = 1.0f;
        this.m_Name = Other.m_Name;
        this.m_bOverrideEnabled = Other.m_bOverrideEnabled;
        this.m_bEnabled = Other.m_bEnabled;
        this.m_bOverrideWeight = Other.m_bOverrideWeight;
        this.m_Weight = Other.m_Weight;
        return;
    }
    FAimPoseCompensatorOverride opAssign(const FAimPoseCompensatorOverride &inout Other)
    {
        FAimPoseCompensatorOverride __r;
        this.SetName(Other.GetName());
        this.SetbOverrideEnabled(Other.GetbOverrideEnabled());
        this.SetbEnabled(Other.GetbEnabled());
        this.SetbOverrideWeight(Other.GetbOverrideWeight());
        this.SetWeight(Other.GetWeight());
        return __r;
    }
    FName GetName() const property
    {
        return this.m_Name;
    }
    void SetName(const FName &inout __Value) property
    {
        if ((this.m_Name == __Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Name = __Value;
        return;
    }
    bool GetbOverrideEnabled() const property
    {
        return this.m_bOverrideEnabled;
    }
    void SetbOverrideEnabled(const bool __Value) property
    {
        if (!(this.m_bOverrideEnabled) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_bOverrideEnabled = __Value;
        return;
    }
    bool GetbEnabled() const property
    {
        return this.m_bEnabled;
    }
    void SetbEnabled(const bool __Value) property
    {
        if (!(this.m_bEnabled) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_bEnabled = __Value;
        return;
    }
    bool GetbOverrideWeight() const property
    {
        return this.m_bOverrideWeight;
    }
    void SetbOverrideWeight(const bool __Value) property
    {
        if (!(this.m_bOverrideWeight) == !(__Value))
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_bOverrideWeight = __Value;
        return;
    }
    float32 GetWeight() const property
    {
        return this.m_Weight;
    }
    void SetWeight(const float32 __Value) property
    {
        if (this.m_Weight == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_Weight = __Value;
        return;
    }
}

namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FAimPoseCompensatorOverride &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FAimPoseCompensatorOverride &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FAimPoseCompensatorOverride
{
int __IndexOf_Name()
{
    return 0;
}
int __IndexOf_bOverrideEnabled()
{
    return 1;
}
int __IndexOf_bEnabled()
{
    return 2;
}
int __IndexOf_bOverrideWeight()
{
    return 3;
}
int __IndexOf_Weight()
{
    return 4;
}
}
