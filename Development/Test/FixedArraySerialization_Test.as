

struct FFixedArraySerializationTestAS
{
    UPROPERTY()
    TFixedArray<int, auto> m_Value1;
    UPROPERTY()
    TFixedArray<FString, auto> m_Value2;

    FFixedArraySerializationTestAS()
    {
        return;
    }
    const TFixedArray<int, auto> GetValue1() const property
    {
        const TFixedArray<int, auto> __r;
        return __r;
    }
    TFixedArray<int, auto> GetValue1() property
    {
        TFixedArray<int, auto> __r;
        return __r;
    }
    void SetValue1(const TFixedArray<int, auto> &inout __Value) property
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    const TFixedArray<FString, auto> GetValue2() const property
    {
        const TFixedArray<FString, auto> __r;
        return __r;
    }
    TFixedArray<FString, auto> GetValue2() property
    {
        TFixedArray<FString, auto> __r;
        return __r;
    }
    void SetValue2(const TFixedArray<FString, auto> &inout __Value) property
    {
        this.m_Value2 = __Value;
        return;
    }
}

void Test_FixedArraySerialization(FUnitTest &inout T)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
