
enum ETestEnum16
{
    A = 12345,
}

enum ETestEnum32
{
    A = 1234567890,
}

void Test_Enum(FUnitTest &inout T)
{
    T.AssertEquals(12345, 12345, "");
    T.AssertEquals(1234567890, 1234567890, "");
    return;
}
