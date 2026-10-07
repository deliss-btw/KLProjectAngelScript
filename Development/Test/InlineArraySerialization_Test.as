

struct FInlineArraySerializationTestAS
{
    UPROPERTY()
    TInlineArray<int, auto> Value1;
    UPROPERTY()
    TInlineArray<FString, auto> Value2;

    FInlineArraySerializationTestAS()
    {
        return;
    }
}

void Test_InlineArraySerialization(FUnitTest &inout T)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
