

struct FCerealWorldTimeStampTestAS
{
    FSubDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FFPTime m_TimeWorld;
    UPROPERTY()
    FFPTime m_TimeLocal;
    UPROPERTY()
    int m_FrameAsTimeStamp;
    UPROPERTY()
    int m_FrameAsPlainInt;
    UPROPERTY()
    int m_RegularInt;
    UPROPERTY()
    TArray<int> m_FrameArray;
    UPROPERTY()
    TArray<int> m_EndFrameArray;
    UPROPERTY()
    TSet<int> m_FrameSet;
    UPROPERTY()
    TMap<int, FFPTime> m_FrameToTime;

    FCerealWorldTimeStampTestAS()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCerealWorldTimeStampTestAS(const FCerealWorldTimeStampTestAS &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FCerealWorldTimeStampTestAS opAssign(const FCerealWorldTimeStampTestAS &inout Other)
    {
        FCerealWorldTimeStampTestAS __r;
        this.SetTimeWorld(Other.GetTimeWorld());
        this.SetTimeLocal(Other.GetTimeLocal());
        this.SetFrameAsTimeStamp(Other.GetFrameAsTimeStamp());
        this.SetFrameAsPlainInt(Other.GetFrameAsPlainInt());
        this.SetRegularInt(Other.GetRegularInt());
        this.SetFrameArray(Other.GetFrameArray());
        this.SetEndFrameArray(Other.GetEndFrameArray());
        this.SetFrameSet(Other.GetFrameSet());
        this.SetFrameToTime(Other.GetFrameToTime());
        return __r;
    }
    const FFPTime GetTimeWorld() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_TimeWorld() property
    {
        FFPTime __r;
        this.__MarkDirty(0);
        return __r;
    }
    void SetTimeWorld(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_TimeWorld = __Value;
        return;
    }
    const FFPTime GetTimeLocal() const property
    {
        const FFPTime __r;
        return __r;
    }
    FFPTime GetModify_TimeLocal() property
    {
        FFPTime __r;
        this.__MarkDirty(1);
        return __r;
    }
    void SetTimeLocal(const FFPTime &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_TimeLocal = __Value;
        return;
    }
    int GetFrameAsTimeStamp() const property
    {
        return this.m_FrameAsTimeStamp;
    }
    void SetFrameAsTimeStamp(const int __Value) property
    {
        if (this.m_FrameAsTimeStamp == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_FrameAsTimeStamp = __Value;
        return;
    }
    int GetFrameAsPlainInt() const property
    {
        return this.m_FrameAsPlainInt;
    }
    void SetFrameAsPlainInt(const int __Value) property
    {
        if (this.m_FrameAsPlainInt == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_FrameAsPlainInt = __Value;
        return;
    }
    int GetRegularInt() const property
    {
        return this.m_RegularInt;
    }
    void SetRegularInt(const int __Value) property
    {
        if (this.m_RegularInt == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_RegularInt = __Value;
        return;
    }
    const TArray<int> GetFrameArray() const property
    {
        const TArray<int> __r;
        return __r;
    }
    TArray<int> GetModify_FrameArray() property
    {
        TArray<int> __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetFrameArray(const TArray<int> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_FrameArray = __Value;
        return;
    }
    const TArray<int> GetEndFrameArray() const property
    {
        const TArray<int> __r;
        return __r;
    }
    TArray<int> GetModify_EndFrameArray() property
    {
        TArray<int> __r;
        this.__MarkDirty(6);
        return __r;
    }
    void SetEndFrameArray(const TArray<int> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_EndFrameArray = __Value;
        return;
    }
    const TSet<int> GetFrameSet() const property
    {
        const TSet<int> __r;
        return __r;
    }
    TSet<int> GetModify_FrameSet() property
    {
        TSet<int> __r;
        this.__MarkDirty(7);
        return __r;
    }
    void SetFrameSet(const TSet<int> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_FrameSet = __Value;
        return;
    }
    const TMap<int, FFPTime> GetFrameToTime() const property
    {
        const TMap<int, FFPTime> __r;
        return __r;
    }
    TMap<int, FFPTime> GetModify_FrameToTime() property
    {
        TMap<int, FFPTime> __r;
        this.__MarkDirty(8);
        return __r;
    }
    void SetFrameToTime(const TMap<int, FFPTime> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_FrameToTime = __Value;
        return;
    }
}

struct FCerealWorldTimeStampMissingMarkTestAS
{
    UPROPERTY()
    int FrameCount;
    UPROPERTY()
    TArray<int> FrameArray;
    UPROPERTY()
    TSet<int> FrameSet;
    UPROPERTY()
    TMap<int, int> FrameToCount;
    UPROPERTY()
    FFPTime TimeUnmarked;
    UPROPERTY()
    TArray<FFPTime> TimesUnmarked;


}

void Test_CerealWorldTimeStampASUnitTest(FUnitTest &inout UnitTest)
{
    int local_1 = FSerializationUtils::GetCerealWorldTimeStampFlag(FCerealWorldTimeStampTestAS, n"TimeWorld");
    UnitTest.AssertEquals(1, local_1, "TimeWorld should be WorldTimeStamp");
    int local_1_2 = FSerializationUtils::GetCerealWorldTimeStampFlag(FCerealWorldTimeStampTestAS, n"TimeLocal");
    UnitTest.AssertEquals(-1, local_1_2, "TimeLocal should be NotWorldTimeStamp");
    int local_1_3 = FSerializationUtils::GetCerealWorldTimeStampFlag(FCerealWorldTimeStampTestAS, n"FrameAsTimeStamp");
    UnitTest.AssertEquals(1, local_1_3, "FrameAsTimeStamp should be WorldTimeStamp");
    int local_1_4 = FSerializationUtils::GetCerealWorldTimeStampFlag(FCerealWorldTimeStampTestAS, n"FrameAsPlainInt");
    UnitTest.AssertEquals(-1, local_1_4, "name contains 'Frame' but NotWorldTimeStamp should win вЂ” old name heuristic regression");
    int local_1_5 = FSerializationUtils::GetCerealWorldTimeStampFlag(FCerealWorldTimeStampTestAS, n"RegularInt");
    UnitTest.AssertEquals(0, local_1_5, "RegularInt should be unmarked");
    int local_1_6 = FSerializationUtils::GetCerealWorldTimeStampFlag(FCerealWorldTimeStampTestAS, n"FrameArray");
    UnitTest.AssertEquals(1, local_1_6, "FrameArray should be WorldTimeStamp");
    int local_1_7 = FSerializationUtils::GetCerealWorldTimeStampFlag(FCerealWorldTimeStampTestAS, n"EndFrameArray");
    UnitTest.AssertEquals(-1, local_1_7, "EndFrameArray should be NotWorldTimeStamp");
    int local_1_8 = FSerializationUtils::GetCerealWorldTimeStampFlag(FCerealWorldTimeStampTestAS, n"FrameSet");
    UnitTest.AssertEquals(1, local_1_8, "FrameSet should be WorldTimeStamp");
    int local_1_9 = FSerializationUtils::GetCerealWorldTimeStampFlag(FCerealWorldTimeStampTestAS, n"FrameToTime");
    UnitTest.AssertEquals(1, local_1_9, "FrameToTime should be WorldTimeStamp");
    TArray<FString> local_10;
    FString local_14;
    bool local_17 = FSerializationUtils::CheckStructPropertySerializable(FCerealWorldTimeStampTestAS, true, local_10);
    int local_18 = 0;
    int local_1_10 = local_10.Num();
    for (; local_18 < local_1_10; )
    {
        if (local_18 > 0)
        {
            local_14 += " | ";
        }
        local_14 += local_10[local_18];
        ++local_18;
    }
    UnitTest.AssertTrue(local_17, FString().Append("WorldTimeStamp test struct must be cereal-serializable, errors: ").Append(local_14));
    TArray<FString> local_28;
    UnitTest.AssertFalse(FSerializationUtils::CheckStructPropertySerializable(FCerealWorldTimeStampMissingMarkTestAS, true, local_28), "unmarked struct must be rejected by CheckStructPropertySerializable");
    UnitTest.AssertTrue((local_28.Num() > 0), local_14.Append("unmarked struct should produce at least one error, got ").Append(local_28.Num()));
    return;
}
namespace AutoDelta
{
FSubDirtyFlags16 GetDirtyFlags(FCerealWorldTimeStampTestAS &inout Data)
{
    FSubDirtyFlags16 __r;
    return __r;
}
void ClearDirtyFlags(FCerealWorldTimeStampTestAS &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCerealWorldTimeStampTestAS
{
int __IndexOf_TimeWorld()
{
    return 0;
}
int __IndexOf_TimeLocal()
{
    return 1;
}
int __IndexOf_FrameAsTimeStamp()
{
    return 2;
}
int __IndexOf_FrameAsPlainInt()
{
    return 3;
}
int __IndexOf_RegularInt()
{
    return 4;
}
int __IndexOf_FrameArray()
{
    return 5;
}
int __IndexOf_EndFrameArray()
{
    return 6;
}
int __IndexOf_FrameSet()
{
    return 7;
}
int __IndexOf_FrameToTime()
{
    return 8;
}
}
