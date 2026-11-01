void Test_InlineArray_Fixed(FUnitTest &inout T)
{
    TInlineArray<int, 10> local_14;
    T.AssertEquals(0, local_14.Num(), "");
    T.AssertEquals(10, local_14.Max(), "");
    local_14.SetNum(6);
    T.AssertEquals(6, local_14.Num(), "");
    T.AssertFalse(local_14.IsEmpty(), "");
    local_14.Empty();
    T.AssertEquals(0, local_14.Num(), "");
    T.AssertTrue(local_14.IsEmpty(), "");
    local_14.Add(123);
    local_14.Add(456);
    local_14.Add(789);
    T.AssertEquals(3, local_14.Num(), "");
    T.AssertEquals(123, local_14[0], "");
    T.AssertEquals(456, local_14[1], "");
    T.AssertEquals(789, local_14[2], "");
    local_14[1] = 246;
    T.AssertEquals(246, local_14[1], "");
    T.AssertEquals(3, local_14.Num(), "");
    T.AssertEquals(10, local_14.Max(), "");
    T.AssertEquals(123, local_14[0], "");
    T.AssertEquals(246, local_14[1], "");
    T.AssertEquals(789, local_14[2], "");
    local_14[0] = 999;
    local_14.Add(147);
    local_14.Add(258);
    T.AssertEquals(5, local_14.Num(), "");
    T.AssertEquals(999, local_14[0], "");
    T.AssertEquals(147, local_14[3], "");
    T.AssertEquals(258, local_14[4], "");
    TInlineArray<FString, 2> local_44 = {"Foo", "Bar", "Baz"};
    T.AssertEquals(3, local_44.Num(), "");
    T.AssertEquals(3, local_44.Max(), "");
    T.AssertEquals("Foo", local_44[0], "");
    T.AssertEquals("Bar", local_44[1], "");
    T.AssertEquals("Baz", local_44[2], "");
    return;
}
void Test_InlineArray_Extended(FUnitTest &inout T)
{
    TInlineArray<int, 5> local_10;
    int local_11 = 0;
    for (; local_11 < 10; )
    {
        local_10.Add(local_11 * local_11);
        ++local_11;
    }
    T.AssertEquals(10, local_10.Num(), "");
    T.AssertEquals(81, local_10[9], "");
    return;
}
