

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
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
