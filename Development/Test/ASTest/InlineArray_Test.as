
void Test_InlineArray_Fixed(FUnitTest &inout T)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
void Test_InlineArray_Extended(FUnitTest &inout T)
{
    TInlineArray<int, auto> local_10;
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
