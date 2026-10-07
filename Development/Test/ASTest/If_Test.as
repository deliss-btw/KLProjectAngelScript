
int IfTest1(const int X)
{
    int local_1 = 0;
    bool local_3 = (X > 12);
    if (local_3)
    {
        int local_5 = local_3 ? 1 : 2;
        local_1 = local_1 + local_5;
    }
    else
    {
        local_1 = local_1 + (local_3 ? 10 : 20);
    }
    return local_1;
}
int IfTest2(const UObject Obj)
{
    UObject local_2;
    if (local_2 != nullptr)
    {
        return 12;
    }
    else
    {
        return -1;
    }
}
void Test_If(FUnitTest &inout T)
{
    T.AssertEquals(1, IfTest1(20), "");
    T.AssertEquals(20, IfTest1(10), "");
    T.AssertEquals(-1, IfTest2(nullptr), "");
    T.AssertEquals(12, IfTest2(Cast<AActor>(NewObject(nullptr, AActor, NAME_None, false))), "");
    return;
}
