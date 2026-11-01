struct FInlineArraySerializationTestAS
{
    UPROPERTY()
    TInlineArray<int, 10> Value1;
    UPROPERTY()
    TInlineArray<FString, 10> Value2;

    FInlineArraySerializationTestAS()
    {
        return;
    }
}

void Test_InlineArraySerialization(FUnitTest &inout T)
{
    FInlineArraySerializationTestAS local_58;
    local_58.Value1 = {12, 34, 56};
    local_58.Value2.SetNum(9);
    local_58.Value2.Add("ABC");
    local_58.Value2.Add("DEF");
    local_58.Value2.Add("GHI");
    FInlineArraySerializationTestAS local_134;
    Serialization::DummyNetSerialize(local_58, local_134, FInlineArraySerializationTestAS);
    T.AssertEquals(3, local_134.Value1.Num(), "Serialization error");
    T.AssertEquals(12, local_134.Value1[0], "Serialization error");
    T.AssertEquals(34, local_134.Value1[1], "Serialization error");
    T.AssertEquals(56, local_134.Value1[2], "Serialization error");
    T.AssertEquals(12, local_134.Value2.Num(), "Serialization error");
    T.AssertEquals("ABC", local_134.Value2[9], "Serialization error");
    T.AssertEquals("DEF", local_134.Value2[10], "Serialization error");
    T.AssertEquals("GHI", local_134.Value2[11], "Serialization error");
    return;
}
