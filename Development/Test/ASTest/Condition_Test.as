

struct FConditionTest1
{
    UPROPERTY()
    int Value;

    FConditionTest1(const int Value_)
    {
        this.Value = Value_;
        return;
    }
    bool opImplConv() const
    {
        return (this.Value >= 0);
    }
}

struct FConditionTest2
{
    UPROPERTY()
    int Value;

    FConditionTest2(const int Value_)
    {
        this.Value = Value_;
        return;
    }
    bool opConv() const
    {
        return (this.Value >= 0);
    }
}

struct FConditionTest3
{
    UPROPERTY()
    UObject Value;

    FConditionTest3()
    {
        return;
    }
    FConditionTest3(const UObject Value_)
    {
        this.Value = nullptr;
        return;
    }
}

int ConditionTest1(const FConditionTest1 &inout Test)
{
    return Test ? 123 : 456;
}
int ConditionTest2(const FConditionTest2 &inout Test)
{
    return Test ? 123 : 456;
}
int ConditionTest3(const UObject Obj)
{
    return Obj != nullptr ? 123 : 456;
}
int ConditionTest4(const FConditionTest3 &inout Obj)
{
    return Obj.Value != nullptr ? 123 : 456;
}
void Test_Condition(FUnitTest &inout T)
{
    AActor local_6 = Cast<AActor>(NewObject(nullptr, AActor, NAME_None, false));
    T.AssertEquals(123, ConditionTest1(FConditionTest1(1)), "");
    T.AssertEquals(456, ConditionTest1(FConditionTest1(-1)), "");
    T.AssertEquals(123, ConditionTest2(FConditionTest2(1)), "");
    T.AssertEquals(456, ConditionTest2(FConditionTest2(-1)), "");
    T.AssertEquals(456, ConditionTest3(nullptr), "");
    T.AssertEquals(123, ConditionTest3(local_6), "");
    T.AssertEquals(456, ConditionTest4(FConditionTest3(nullptr)), "");
    T.AssertEquals(123, ConditionTest4(FConditionTest3(local_6)), "");
    return;
}
