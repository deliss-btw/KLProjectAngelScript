

struct FTestString
{
    UPROPERTY()
    int A;
    UPROPERTY()
    int B;

    FTestString(const int A_, const int B_)
    {
        this.A = A_;
        this.B = B_;
        return;
    }
    bool opConv() const
    {
        return this.A != 0 || (this.B != 0);
    }
    FString ToString() const
    {
        return FString().Append("A = ").Append(this.A).Append(", B = ").Append(this.B);
    }
}

void Test_String(FUnitTest &inout T)
{
    FTestString local_2;
    T.AssertEquals("A = 123, B = 456", FString().Append(local_2), "");
    T.AssertEquals("true", FString().Append(local_2), "");
    return;
}
