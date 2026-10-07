

struct FTestInternal1
{
    UPROPERTY()
    int A;
    UPROPERTY()
    int B;


}

struct FTestInternal2
{
    UPROPERTY()
    FTestInternal1 Internal1;
    UPROPERTY()
    int A;
    UPROPERTY()
    int B;


}

void Test_Internal(FUnitTest &inout T)
{
    T.AssertEquals(0, __Internal::OffsetOf(), "");
    T.AssertEquals(4, __Internal::OffsetOf(), "");
    T.AssertEquals(0, __Internal::OffsetOf(), "");
    T.AssertEquals(8, __Internal::OffsetOf(), "");
    T.AssertEquals(12, __Internal::OffsetOf(), "");
    return;
}
