

struct FTestRefOut
{
    UPROPERTY()
    int X;
    UPROPERTY()
    int Y;

    FTestRefOut()
    {
        this.X = 1;
        this.Y = 2;
        return;
    }
    FTestRefOut(const int InX, const int InY)
    {
        this.X = InX;
        this.Y = InY;
        return;
    }
}

void RefOutTest1(FUnitTest &inout T, int &out A, float32 &out B, FString &out C, FTestRefOut &out D, AActor &out E)
{
    A = 0;
    B = 0.0f;
    FString local_6;
    C = local_6;
    FTestRefOut local_8;
    D = local_8;
    T.AssertEquals(0, A, "");
    T.AssertEquals(0.0, B, "");
    T.AssertEquals("", C, "");
    T.AssertEquals(1, int(D.X), "");
    T.AssertEquals(2, int(D.Y), "");
    T.AssertTrue((E == nullptr), "");
    A = 456;
    B = 2.4f;
    C = "DEF";
    D.X = 5;
    D.Y = 6;
    E = Cast<AActor>(NewObject(nullptr, AActor, NAME_None, false));
    return;
}
void Test_RefOut(FUnitTest &inout T)
{
    int local_1 = 123;
    float32 local_3 = 4.2f;
    FString local_8 = "ABC";
    FTestRefOut local_12 = FTestRefOut(3, 4);
    AActor local_16 = Cast<AActor>(NewObject(nullptr, AActor, NAME_None, false));
    RefOutTest1(T, local_1, local_3, local_8, local_12, local_16);
    T.AssertEquals(456, local_1, "");
    T.AssertEquals(2.4f, local_3, "");
    T.AssertEquals("DEF", local_8, "");
    T.AssertEquals(5, int(local_12.X), "");
    T.AssertEquals(6, int(local_12.Y), "");
    T.AssertTrue((local_16 != nullptr), "");
    RefOutTest1(T, local_1, local_3, local_8, local_12, local_16);
    return;
}
