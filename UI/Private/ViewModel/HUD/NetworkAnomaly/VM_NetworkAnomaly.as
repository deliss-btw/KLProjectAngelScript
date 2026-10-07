
namespace FVM_NetworkAnomaly
{
    const int ModelId = 0;

}
struct FVM_NetworkAnomaly : FEUIViewModel
{
    FEUIViewModel _base_FEUIViewModel;
    UPROPERTY()
    bool m_bIsWave;
    UPROPERTY()
    bool m_bIsMissPacket;
    UPROPERTY()
    bool m_bIsDisconnect;
    UPROPERTY()
    TArray<float32> m_RttSamplesMs;
    UPROPERTY()
    float32 m_SampleAccumTime;
    UPROPERTY()
    float32 m_WaveHoldTimer;
    UPROPERTY()
    float32 m_MissHoldTimer;
    UPROPERTY()
    float32 m_NoAckAccumTime;
    UPROPERTY()
    int m_LastObservedInputAck;
    UPROPERTY()
    bool m_bInputAckInited;
    UPROPERTY()
    float32 m_ElapsedSinceStart;

    FVM_NetworkAnomaly()
    {
        this.m_bIsWave = false;
        this.m_bIsMissPacket = false;
        this.m_bIsDisconnect = false;
        this.m_SampleAccumTime = 0.0f;
        this.m_WaveHoldTimer = 0.0f;
        this.m_MissHoldTimer = 0.0f;
        this.m_NoAckAccumTime = 0.0f;
        this.m_LastObservedInputAck = -1;
        this.m_bInputAckInited = false;
        this.m_ElapsedSinceStart = 0.0f;
        if (EUIInternal::GetModelConstructBodyEnableCounter() == 0)
        {
            return;
        }
        return;
    }
    FVM_NetworkAnomaly(const FVM_NetworkAnomaly &inout Other)
    {
        this.m_bIsWave = false;
        this.m_bIsMissPacket = false;
        this.m_bIsDisconnect = false;
        this.m_SampleAccumTime = 0.0f;
        this.m_WaveHoldTimer = 0.0f;
        this.m_MissHoldTimer = 0.0f;
        this.m_NoAckAccumTime = 0.0f;
        this.m_LastObservedInputAck = -1;
        this.m_bInputAckInited = false;
        this.m_ElapsedSinceStart = 0.0f;
        this.m_bIsWave = Other.m_bIsWave;
        this.m_bIsMissPacket = Other.m_bIsMissPacket;
        this.m_bIsDisconnect = Other.m_bIsDisconnect;
        this.m_RttSamplesMs = Other.m_RttSamplesMs;
        this.m_SampleAccumTime = Other.m_SampleAccumTime;
        this.m_WaveHoldTimer = Other.m_WaveHoldTimer;
        this.m_MissHoldTimer = Other.m_MissHoldTimer;
        this.m_NoAckAccumTime = Other.m_NoAckAccumTime;
        this.m_LastObservedInputAck = int(Other.m_LastObservedInputAck);
        this.m_bInputAckInited = Other.m_bInputAckInited;
        this.m_ElapsedSinceStart = Other.m_ElapsedSinceStart;
        return;
    }
    FVM_NetworkAnomaly opAssign(const FVM_NetworkAnomaly &inout Other)
    {
        FVM_NetworkAnomaly __r;
        this.m_bIsWave = Other.m_bIsWave;
        this.m_bIsMissPacket = Other.m_bIsMissPacket;
        this.m_bIsDisconnect = Other.m_bIsDisconnect;
        this.m_RttSamplesMs = Other.m_RttSamplesMs;
        this.m_SampleAccumTime = Other.m_SampleAccumTime;
        this.m_WaveHoldTimer = Other.m_WaveHoldTimer;
        this.m_MissHoldTimer = Other.m_MissHoldTimer;
        this.m_NoAckAccumTime = Other.m_NoAckAccumTime;
        this.m_LastObservedInputAck = int(Other.m_LastObservedInputAck);
        this.m_bInputAckInited = Other.m_bInputAckInited;
        this.m_ElapsedSinceStart = Other.m_ElapsedSinceStart;
        return __r;
    }
    void PostConstruct()
    {
        this.SetbIsWave(false);
        this.SetbIsMissPacket(false);
        this.SetbIsDisconnect(false);
        this.GetModify_RttSamplesMs().Empty(0);
        this.SetSampleAccumTime(0.0f);
        this.SetWaveHoldTimer(0.0f);
        this.SetMissHoldTimer(0.0f);
        this.SetNoAckAccumTime(0.0f);
        this.SetLastObservedInputAck(-1);
        this.SetbInputAckInited(false);
        this.SetElapsedSinceStart(0.0f);
        return;
    }
    void WidgetTick(const float32 DeltaTime)
    {
        FCS_NetStats local_4;
        if (DeltaTime <= 0.0f)
        {
            return;
        }
        if (!(this.GetContext().World))
        {
            return;
        }
        int local_9 = 1084227584;
        this.SetElapsedSinceStart((this.GetElapsedSinceStart() + DeltaTime));
        if (this.GetElapsedSinceStart() < 5.0f)
        {
            this.ResetDetectionState(int(local_4.LatestInputAck));
            return;
        }
        int local_12 = 1073741824;
        int local_13 = 1065353216;
        int local_14 = 1065353216;
        int local_15 = 1;
        int local_16 = 1065353216;
        int local_17 = 1036831949;
        int local_18 = 1109393408;
        int local_11 = UMiscBPExport::GetNetStatRTTMs(local_4);
        int local_19 = UMiscBPExport::GetNetStatMissCount(local_4);
        this.UpdateMissPacket(DeltaTime, local_19, 1, 1.0f);
        this.UpdateDisconnect(DeltaTime, int(local_4.LatestInputAck), 1.0f);
        this.UpdateWave(DeltaTime, local_11, 0.1f, 2.0f, 40.0f, 1.0f);
        return;
    }
    void ResetDetectionState(const int CurInputAck)
    {
        this.SetbIsWave(false);
        this.SetbIsMissPacket(false);
        this.SetbIsDisconnect(false);
        this.GetModify_RttSamplesMs().Empty(0);
        this.SetSampleAccumTime(0.0f);
        this.SetWaveHoldTimer(0.0f);
        this.SetMissHoldTimer(0.0f);
        this.SetNoAckAccumTime(0.0f);
        this.SetLastObservedInputAck(CurInputAck);
        this.SetbInputAckInited(true);
        return;
    }
    void UpdateMissPacket(const float32 DeltaTime, const int CurMissCount, const int MissTriggerCount, const float32 MissDisplayHoldSeconds)
    {
        if (CurMissCount >= MissTriggerCount)
        {
            this.SetMissHoldTimer(MissDisplayHoldSeconds);
        }
        else
        {
            this.SetMissHoldTimer(FMath::Max(0.0f, (this.GetMissHoldTimer() - DeltaTime)));
        }
        this.SetbIsMissPacket((this.GetMissHoldTimer() > 0.0f));
        return;
    }
    void UpdateDisconnect(const float32 DeltaTime, const int CurInputAck, const float32 DisconnectNoAckSeconds)
    {
        if (!(this.GetbInputAckInited()))
        {
            this.SetLastObservedInputAck(CurInputAck);
            this.SetbInputAckInited(true);
            this.SetNoAckAccumTime(0.0f);
        }
        else
        {
            if (CurInputAck != this.GetLastObservedInputAck())
            {
                this.SetLastObservedInputAck(CurInputAck);
                this.SetNoAckAccumTime(0.0f);
            }
            else
            {
                this.SetNoAckAccumTime((this.GetNoAckAccumTime() + DeltaTime));
            }
        }
        this.SetbIsDisconnect((this.GetNoAckAccumTime() >= DisconnectNoAckSeconds));
        return;
    }
    void UpdateWave(const float32 DeltaTime, const int CurRttMs, const float32 SampleIntervalSeconds, const float32 WaveVarianceWindowSeconds, const float32 WaveJitterThresholdMs, const float32 WaveDisplayHoldSeconds)
    {
        this.SetSampleAccumTime((this.GetSampleAccumTime() + DeltaTime));
        if (this.GetSampleAccumTime() >= SampleIntervalSeconds)
        {
            this.SetSampleAccumTime(0.0f);
            this.GetModify_RttSamplesMs().Add(CurRttMs);
            int local_6 = FMath::Max(2, FMath::CeilToInt(WaveVarianceWindowSeconds / SampleIntervalSeconds));
            while (this.GetRttSamplesMs().Num() > local_6)
            {
                this.GetModify_RttSamplesMs().RemoveAt(0);
            }
            int local_5 = FMath::Max(2, FMath::FloorToInt((local_6 * 0.5f)));
            if (this.GetRttSamplesMs().Num() >= local_5)
            {
                if (this.ComputeStdDev(this.GetRttSamplesMs()) >= WaveJitterThresholdMs)
                {
                    this.SetWaveHoldTimer(WaveDisplayHoldSeconds);
                }
            }
        }
        this.SetWaveHoldTimer(FMath::Max(0.0f, this.GetWaveHoldTimer() - DeltaTime));
        this.SetbIsWave((this.GetWaveHoldTimer() > 0.0f));
        return;
    }
    float32 ComputeStdDev(const TArray<float32> &inout Samples) const
    {
        float32 local_19;
        int local_2 = Samples.Num();
        if (local_2 < 2)
        {
            return 0.0f;
        }
        float32 local_5 = 0.0f;
        auto local_12 = Samples.Iterator();
        for (; local_12.CanProceed;)
        {
            float32 local_4 = local_12.Proceed();
            local_5 = local_5 + local_4;
        }
        float32 local_20 = 0.0f;
        for (auto local_21 : Samples)
        {
            local_19 = local_21 - (local_5 / local_2);
            local_20 = local_20 + (local_19 * local_19);
        }
        return FMath::Sqrt((local_20 / local_2));
    }
    bool GetbIsWave() const property
    {
        this.TrackPropertyRead(0);
        return this.m_bIsWave;
    }
    void SetbIsWave(const bool __Value) property
    {
        if (!(this.m_bIsWave) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(0);
        this.m_bIsWave = __Value;
        return;
    }
    bool GetbIsMissPacket() const property
    {
        this.TrackPropertyRead(1);
        return this.m_bIsMissPacket;
    }
    void SetbIsMissPacket(const bool __Value) property
    {
        if (!(this.m_bIsMissPacket) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(1);
        this.m_bIsMissPacket = __Value;
        return;
    }
    bool GetbIsDisconnect() const property
    {
        this.TrackPropertyRead(2);
        return this.m_bIsDisconnect;
    }
    void SetbIsDisconnect(const bool __Value) property
    {
        if (!(this.m_bIsDisconnect) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(2);
        this.m_bIsDisconnect = __Value;
        return;
    }
    const TArray<float32> GetRttSamplesMs() const property
    {
        const TArray<float32> __r;
        this.TrackPropertyRead(3);
        return __r;
    }
    TArray<float32> GetModify_RttSamplesMs() property
    {
        TArray<float32> __r;
        this.MarkPropertyDirty(3);
        return __r;
    }
    void SetRttSamplesMs(const TArray<float32> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(3);
        this.m_RttSamplesMs = __Value;
        return;
    }
    const float32 GetSampleAccumTime() const property
    {
        const float32 __r;
        this.TrackPropertyRead(4);
        return __r;
    }
    float32 GetModify_SampleAccumTime() property
    {
        float32 __r;
        this.MarkPropertyDirty(4);
        return __r;
    }
    void SetSampleAccumTime(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(4);
        this.m_SampleAccumTime = __Value;
        return;
    }
    const float32 GetWaveHoldTimer() const property
    {
        const float32 __r;
        this.TrackPropertyRead(5);
        return __r;
    }
    float32 GetModify_WaveHoldTimer() property
    {
        float32 __r;
        this.MarkPropertyDirty(5);
        return __r;
    }
    void SetWaveHoldTimer(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(5);
        this.m_WaveHoldTimer = __Value;
        return;
    }
    const float32 GetMissHoldTimer() const property
    {
        const float32 __r;
        this.TrackPropertyRead(6);
        return __r;
    }
    float32 GetModify_MissHoldTimer() property
    {
        float32 __r;
        this.MarkPropertyDirty(6);
        return __r;
    }
    void SetMissHoldTimer(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(6);
        this.m_MissHoldTimer = __Value;
        return;
    }
    const float32 GetNoAckAccumTime() const property
    {
        const float32 __r;
        this.TrackPropertyRead(7);
        return __r;
    }
    float32 GetModify_NoAckAccumTime() property
    {
        float32 __r;
        this.MarkPropertyDirty(7);
        return __r;
    }
    void SetNoAckAccumTime(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(7);
        this.m_NoAckAccumTime = __Value;
        return;
    }
    int GetLastObservedInputAck() const property
    {
        this.TrackPropertyRead(8);
        return this.m_LastObservedInputAck;
    }
    void SetLastObservedInputAck(const int __Value) property
    {
        if (this.m_LastObservedInputAck == __Value)
        {
            return;
        }
        this.MarkPropertyDirty(8);
        this.m_LastObservedInputAck = __Value;
        return;
    }
    bool GetbInputAckInited() const property
    {
        this.TrackPropertyRead(9);
        return this.m_bInputAckInited;
    }
    void SetbInputAckInited(const bool __Value) property
    {
        if (!(this.m_bInputAckInited) == !(__Value))
        {
            return;
        }
        this.MarkPropertyDirty(9);
        this.m_bInputAckInited = __Value;
        return;
    }
    const float32 GetElapsedSinceStart() const property
    {
        const float32 __r;
        this.TrackPropertyRead(10);
        return __r;
    }
    float32 GetModify_ElapsedSinceStart() property
    {
        float32 __r;
        this.MarkPropertyDirty(10);
        return __r;
    }
    void SetElapsedSinceStart(const float32 &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.MarkPropertyDirty(10);
        this.m_ElapsedSinceStart = __Value;
        return;
    }
}

struct __GeneratedProperties_FVM_NetworkAnomaly
{
    UPROPERTY()
    TEUIModelRef<FVM_NetworkAnomaly> Self;

    __GeneratedProperties_FVM_NetworkAnomaly()
    {
        return;
    }
}

namespace FVM_NetworkAnomaly
{
FVM_NetworkAnomaly& Create(const UObject ContextObject)
{
    return FVM_NetworkAnomaly::CreateByManager(EUIInternal::GetContextManager(ContextObject));
}
FVM_NetworkAnomaly CreateByManager(const UEUIManagerSubsystem Manager)
{
    FVM_NetworkAnomaly __r;
    TEUIModelRef<FVM_NetworkAnomaly> local_6 = TEUIModelRef<FVM_NetworkAnomaly>(EUIInternal::MakeModelWithManager(Manager, FVM_NetworkAnomaly::ModelId));
    return __r;
}
void GetModelInfo(FEUIViewModelMetaInfo &inout Result)
{
    Result.SetbHasPostConstruct(true);
    Result.SetbHasLoadConfigDefault(false);
    Result.SetbCanDefaultConstruct(true);
    Result.SetbHasLoadConfig(false);
    FEUIModelPropertyDefine local_14;
    local_14.PropertyName = "bIsWave";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsMissPacket";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "bIsDisconnect";
    local_14.TypeName = "bool";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    local_14.PropertyName = "Self";
    local_14.TypeName = "TEUIModelRef<FVM_NetworkAnomaly>";
    local_14.bAllowGet = (1 != 0);
    local_14.bAllowSet = (0 != 0);
    Result.ExposeProperties.Add(local_14);
    Result.GeneratedPropertyStruct = __GeneratedProperties_FVM_NetworkAnomaly;
    return;
}
UScriptStruct GetModelStruct()
{
    return FVM_NetworkAnomaly;
}
bool __UIGetter_bIsWave(const FVM_NetworkAnomaly &inout Model)
{
    return Model.GetbIsWave();
}
bool __UIGetter_bIsMissPacket(const FVM_NetworkAnomaly &inout Model)
{
    return Model.GetbIsMissPacket();
}
bool __UIGetter_bIsDisconnect(const FVM_NetworkAnomaly &inout Model)
{
    return Model.GetbIsDisconnect();
}
TEUIModelRef<FVM_NetworkAnomaly> __UIGetter_Self(const FVM_NetworkAnomaly &inout Model)
{
    return TEUIModelRef<FVM_NetworkAnomaly>(Model);
}
int __IndexOf_bIsWave()
{
    return 0;
}
int __IndexOf_bIsMissPacket()
{
    return 1;
}
int __IndexOf_bIsDisconnect()
{
    return 2;
}
int __IndexOf_RttSamplesMs()
{
    return 3;
}
int __IndexOf_SampleAccumTime()
{
    return 4;
}
int __IndexOf_WaveHoldTimer()
{
    return 5;
}
int __IndexOf_MissHoldTimer()
{
    return 6;
}
int __IndexOf_NoAckAccumTime()
{
    return 7;
}
int __IndexOf_LastObservedInputAck()
{
    return 8;
}
int __IndexOf_bInputAckInited()
{
    return 9;
}
int __IndexOf_ElapsedSinceStart()
{
    return 10;
}
}
namespace __GeneratedProperties_FVM_NetworkAnomaly
{
UScriptStruct StaticStruct()
{
    UScriptStruct local_2;
    return local_2;
}
}
