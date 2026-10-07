

struct FTestProperty1
{
    UPROPERTY()
    int _IntValue = 0;
    UPROPERTY()
    FVector _VectorValue = FVector();


    int GetIntValue() property
    {
        return this._IntValue;
    }
    void SetIntValue(const int NewValue) property
    {
        this._IntValue = NewValue;
        return;
    }
    const FVector GetVectorValue() property
    {
        const FVector __r;
        return __r;
    }
    void SetVectorValue(const FVector &inout NewValue) property
    {
        this._VectorValue = NewValue;
        return;
    }
}

void Test_Property(FUnitTest &inout T)
{
    FTestProperty1 local_8;
    local_8.SetIntValue(123);
    T.AssertEquals(123, local_8.GetIntValue(), "");
    local_8.SetVectorValue(FVector(1.0, 2.0, 3.0));
    T.AssertEquals(FVector(1.0, 2.0, 3.0), local_8.GetVectorValue(), "");
    return;
}
