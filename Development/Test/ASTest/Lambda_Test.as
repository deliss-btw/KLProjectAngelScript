struct __Lambda_Development_Test_ASTest_Lambda_Test_43
{
    __Lambda_Development_Test_ASTest_Lambda_Test_43()
    {
        return;
    }
    bool opCall(const int &inout X)
    {
        return (X < 0);
    }
}

struct __Lambda_Development_Test_ASTest_Lambda_Test_44
{
    __Lambda_Development_Test_ASTest_Lambda_Test_44()
    {
        return;
    }
    bool opCall(const int &inout X)
    {
        return (X > 5);
    }
}

struct __Lambda_Development_Test_ASTest_Lambda_Test_46
{
    __Lambda_Development_Test_ASTest_Lambda_Test_46()
    {
        return;
    }
    bool opCall(const int &inout X)
    {
        return (X < 0);
    }
}

struct __Lambda_Development_Test_ASTest_Lambda_Test_47
{
    __Lambda_Development_Test_ASTest_Lambda_Test_47()
    {
        return;
    }
    bool opCall(const int &inout X)
    {
        return (X > 2);
    }
}

struct __Lambda_Development_Test_ASTest_Lambda_Test_49
{
    __Lambda_Development_Test_ASTest_Lambda_Test_49()
    {
        return;
    }
    bool opCall(const int &inout X)
    {
        return (X > 0);
    }
}

struct __Lambda_Development_Test_ASTest_Lambda_Test_50
{
    __Lambda_Development_Test_ASTest_Lambda_Test_50()
    {
        return;
    }
    bool opCall(const int &inout X)
    {
        return (X > 0);
    }
}

struct __Lambda_Development_Test_ASTest_Lambda_Test_51
{
    __Lambda_Development_Test_ASTest_Lambda_Test_51()
    {
        return;
    }
    bool opCall(const int &inout X)
    {
        return (X < 0);
    }
}

struct __Lambda_Development_Test_ASTest_Lambda_Test_53
{
    __Lambda_Development_Test_ASTest_Lambda_Test_53()
    {
        return;
    }
    bool opCall(const int &inout X)
    {
        return (X < 0);
    }
}

struct __Lambda_Development_Test_ASTest_Lambda_Test_54
{
    __Lambda_Development_Test_ASTest_Lambda_Test_54()
    {
        return;
    }
    bool opCall(const int &inout X)
    {
        return (X > 3);
    }
}

struct __Lambda_Development_Test_ASTest_Lambda_Test_55
{
    __Lambda_Development_Test_ASTest_Lambda_Test_55()
    {
        return;
    }
    bool opCall(const int &inout X)
    {
        return (X > 5);
    }
}

struct __Lambda_Development_Test_ASTest_Lambda_Test_59
{
    __Lambda_Development_Test_ASTest_Lambda_Test_59()
    {
        return;
    }
    bool opCall(const int &inout X, const int &inout Y)
    {
        return (X > Y);
    }
}

struct __Lambda_Development_Test_ASTest_Lambda_Test_79
{
    UPROPERTY()
    int __Int_0;
    TRawPtr<float32> __Float_0;

    __Lambda_Development_Test_ASTest_Lambda_Test_79(const int _InInt_0, float32 &inout _InFloat_0)
    {
        this.__Int_0 = _InInt_0;
        this.__Float_0 = _InFloat_0;
        return;
    }
    int GetInt_0() property
    {
        int __r;
        return __r;
    }
    float32 GetFloat_0() property
    {
        float32 __r;
        return __r;
    }
    void SetFloat_0(const float32 &inout Value) property
    {
        return;
    }
    int opCall(const int Other_0, const float32 Other_1)
    {
        this.SetFloat_0((this.GetFloat_0() * Other_1));
        return (this.GetInt_0() + Other_0);
    }
}

void Test_Lambda(FUnitTest &inout T)
{
    TArray<int> local_4 = {1, 2, -3, 4, 5};
    __Lambda_Development_Test_ASTest_Lambda_Test_43 local_8;
    T.AssertEquals(true, local_4.ContainsByPredicate(local_8), "");
    __Lambda_Development_Test_ASTest_Lambda_Test_44 local_12;
    T.AssertEquals(false, local_4.ContainsByPredicate(local_12), "");
    __Lambda_Development_Test_ASTest_Lambda_Test_46 local_14;
    T.AssertEquals(-3, local_4.FindByPredicate(local_14), "");
    __Lambda_Development_Test_ASTest_Lambda_Test_47 local_16;
    T.AssertEquals(4, local_4.FindByPredicate(local_16), "");
    __Lambda_Development_Test_ASTest_Lambda_Test_49 local_18;
    T.AssertEquals(4, local_4.FindLastByPredicate(local_18), "");
    __Lambda_Development_Test_ASTest_Lambda_Test_50 local_20;
    T.AssertEquals(1, local_4.FindLastByPredicate(local_20, 3), "");
    __Lambda_Development_Test_ASTest_Lambda_Test_51 local_22;
    T.AssertEquals(-1, local_4.FindLastByPredicate(local_22, 2), "");
    __Lambda_Development_Test_ASTest_Lambda_Test_53 local_24;
    T.AssertEquals(2, local_4.IndexOfByPredicate(local_24), "");
    __Lambda_Development_Test_ASTest_Lambda_Test_54 local_26;
    T.AssertEquals(3, local_4.IndexOfByPredicate(local_26), "");
    __Lambda_Development_Test_ASTest_Lambda_Test_55 local_28;
    T.AssertEquals(-1, local_4.IndexOfByPredicate(local_28), "");
    TArray<int> local_32 = {1, -2, 5, -4, 3};
    T.AssertEquals(5, local_32[0], "");
    T.AssertEquals(3, local_32[1], "");
    T.AssertEquals(1, local_32[2], "");
    T.AssertEquals(-2, local_32[3], "");
    T.AssertEquals(-4, local_32[4], "");
    TArray<int> local_38;
    local_38.Add(0);
    local_38[0] = 1;
    if (local_38.Num() > 0)
    {
        local_38[0] = 5;
    }
    int local_39 = 0;
    float32 local_40 = 1.0f;
    __Lambda_Development_Test_ASTest_Lambda_Test_79(local_39, local_40);
    return;
}
