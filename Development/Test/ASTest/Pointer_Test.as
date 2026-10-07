

class UPointerTestClass1 : UObject
{
    int A;

    UPointerTestClass1()
    {
        return;
    }
    int GetA() const
    {
        return this.A;
    }
}

int PointerTest1(const TObjectPtr<UPointerTestClass1> &inout Ptr)
{
    UPointerTestClass1 local_2;
    if (local_2 != nullptr)
    {
        return Ptr.opArrow().GetA();
    }
    return -1;
}
void Test_Pointer(FUnitTest &inout T)
{
    T.AssertEquals(-1, PointerTest1(TObjectPtr<UPointerTestClass1>(nullptr)), "");
    TObjectPtr<UPointerTestClass1> local_6 = UPointerTestClass1();
    local_6.opArrow().A = 12;
    T.AssertEquals(12, PointerTest1(local_6), "");
    return;
}
