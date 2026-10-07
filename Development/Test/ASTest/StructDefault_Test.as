

// NOTE: class defaults are not authored in this module: FTestStructDefault1 (temporary `local_2` did not fold: B = local_2;).
// They are carried over byte-exact when this module is recompiled.

struct FTestStructDefault1
{
    UPROPERTY()
    int A;
    UPROPERTY()
    int B;

    FTestStructDefault1()
    {
        this.A = 0;
        this.B = 0;
        this.__InitDefaults();
        return;
    }
}

struct FTestStructDefault2
{
    UPROPERTY()
    FString A;
    UPROPERTY()
    FString B;
    UPROPERTY()
    FString C;

    FTestStructDefault2()
    {
        this.__InitDefaults();
        return;
    }
    FTestStructDefault2(const FString &inout InA, const FString &inout InB)
    {
        this.B = InB;
        this.__InitDefaults();
        return;
    }
}

void Test_StructDefault(FUnitTest &inout T)
{
    FTestStructDefault1 local_2;
    T.AssertEquals(42, int(local_2.A), "");
    T.AssertEquals(4, int(local_2.B), "");
    T.AssertEquals("ABCDEF", FTestStructDefault2("ABC", "DEF").C, "");
    return;
}
