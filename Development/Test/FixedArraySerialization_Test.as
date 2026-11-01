struct FFixedArraySerializationTestAS
{
    UPROPERTY()
    TFixedArray<int, 10> m_Value1;
    UPROPERTY()
    TFixedArray<FString, 10> m_Value2;

    FFixedArraySerializationTestAS()
    {
        return;
    }
    const TFixedArray<int, 10> GetValue1() const property
    {
        const TFixedArray<int, 10> __r;
        return __r;
    }
    TFixedArray<int, 10> GetValue1() property
    {
        TFixedArray<int, 10> __r;
        return __r;
    }
    void SetValue1(const TFixedArray<int, 10> &inout __Value) property
    {
        this.m_Value1 = __Value;
        return;
    }
    const TFixedArray<FString, 10> GetValue2() const property
    {
        const TFixedArray<FString, 10> __r;
        return __r;
    }
    TFixedArray<FString, 10> GetValue2() property
    {
        TFixedArray<FString, 10> __r;
        return __r;
    }
    void SetValue2(const TFixedArray<FString, 10> &inout __Value) property
    {
        this.m_Value2 = __Value;
        return;
    }
}

void Test_FixedArraySerialization(FUnitTest &inout T)
{
    // body not fully recovered — stub [opcode-uncovered]
}
