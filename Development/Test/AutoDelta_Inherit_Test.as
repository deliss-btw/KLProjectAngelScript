

struct FAutoDeltaInheritBaseAS
{
    FSubDirtyFlags40 __DirtyFlags;
    UPROPERTY()
    int m_BaseA;
    UPROPERTY()
    int m_BaseB;

    FAutoDeltaInheritBaseAS()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FAutoDeltaInheritBaseAS(const FAutoDeltaInheritBaseAS &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FAutoDeltaInheritBaseAS opAssign(const FAutoDeltaInheritBaseAS &inout Other)
    {
        FAutoDeltaInheritBaseAS __r;
        this.SetBaseA(Other.GetBaseA());
        this.SetBaseB(Other.GetBaseB());
        return __r;
    }
    int GetBaseA() const property
    {
        return this.m_BaseA;
    }
    void SetBaseA(const int __Value) property
    {
        if (this.m_BaseA == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_BaseA = __Value;
        return;
    }
    int GetBaseB() const property
    {
        return this.m_BaseB;
    }
    void SetBaseB(const int __Value) property
    {
        if (this.m_BaseB == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_BaseB = __Value;
        return;
    }
}

struct FAutoDeltaInheritDerivedAS : FAutoDeltaInheritBaseAS
{
    FAutoDeltaInheritBaseAS _base_FAutoDeltaInheritBaseAS;
    UPROPERTY()
    int m_DerivedX;

    FAutoDeltaInheritDerivedAS(const FAutoDeltaInheritDerivedAS &inout Other)
    {
        super();
        Super::opAssign(Other._base_FAutoDeltaInheritBaseAS);
        this.m_DerivedX = int(Other.m_DerivedX);
        return;
    }
    FAutoDeltaInheritDerivedAS opAssign(const FAutoDeltaInheritDerivedAS &inout Other)
    {
        FAutoDeltaInheritDerivedAS __r;
        Super::opAssign(Other._base_FAutoDeltaInheritBaseAS);
        this.SetDerivedX(Other.GetDerivedX());
        return __r;
    }
    int GetDerivedX() const property
    {
        return this.m_DerivedX;
    }
    void SetDerivedX(const int __Value) property
    {
        if (this.m_DerivedX == __Value)
        {
            return;
        }
        Super::__GetSharedDirtyFlags().MarkDirty(2);
        this.m_DerivedX = __Value;
        return;
    }
}

struct FAutoDeltaInheritMidAS : FAutoDeltaInheritBaseAS
{
    FAutoDeltaInheritBaseAS _base_FAutoDeltaInheritBaseAS;
    UPROPERTY()
    int m_MidValue;

    FAutoDeltaInheritMidAS(const FAutoDeltaInheritMidAS &inout Other)
    {
        super();
        Super::opAssign(Other._base_FAutoDeltaInheritBaseAS);
        this.m_MidValue = int(Other.m_MidValue);
        return;
    }
    FAutoDeltaInheritMidAS opAssign(const FAutoDeltaInheritMidAS &inout Other)
    {
        FAutoDeltaInheritMidAS __r;
        Super::opAssign(Other._base_FAutoDeltaInheritBaseAS);
        this.SetMidValue(Other.GetMidValue());
        return __r;
    }
    int GetMidValue() const property
    {
        return this.m_MidValue;
    }
    void SetMidValue(const int __Value) property
    {
        if (this.m_MidValue == __Value)
        {
            return;
        }
        Super::__GetSharedDirtyFlags().MarkDirty(2);
        this.m_MidValue = __Value;
        return;
    }
}

struct FAutoDeltaInheritChildAS : FAutoDeltaInheritMidAS
{
    FAutoDeltaInheritMidAS _base_FAutoDeltaInheritMidAS;
    UPROPERTY()
    int m_ChildValue;

    FAutoDeltaInheritChildAS(const FAutoDeltaInheritChildAS &inout Other)
    {
        super();
        Super::opAssign(Other._base_FAutoDeltaInheritMidAS);
        this.m_ChildValue = int(Other.m_ChildValue);
        return;
    }
    FAutoDeltaInheritChildAS opAssign(const FAutoDeltaInheritChildAS &inout Other)
    {
        FAutoDeltaInheritChildAS __r;
        Super::opAssign(Other._base_FAutoDeltaInheritMidAS);
        this.SetChildValue(Other.GetChildValue());
        return __r;
    }
    int GetChildValue() const property
    {
        return this.m_ChildValue;
    }
    void SetChildValue(const int __Value) property
    {
        if (this.m_ChildValue == __Value)
        {
            return;
        }
        Super::__GetSharedDirtyFlags().MarkDirty(3);
        this.m_ChildValue = __Value;
        return;
    }
}

struct FAutoDeltaInheritFromCppAS : FAutoDeltaInheritBase
{
    FAutoDeltaInheritBase _base_FAutoDeltaInheritBase;
    UPROPERTY()
    int m_ScriptValue;

    FAutoDeltaInheritFromCppAS()
    {
        this.m_ScriptValue = 0;
        return;
    }
    FAutoDeltaInheritFromCppAS(const FAutoDeltaInheritFromCppAS &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FAutoDeltaInheritFromCppAS opAssign(const FAutoDeltaInheritFromCppAS &inout Other)
    {
        FAutoDeltaInheritFromCppAS __r;
        this.SetScriptValue(Other.GetScriptValue());
        return __r;
    }
    int GetScriptValue() const property
    {
        return this.m_ScriptValue;
    }
    void SetScriptValue(const int __Value) property
    {
        if (this.m_ScriptValue == __Value)
        {
            return;
        }
        this.__GetSharedDirtyFlags().MarkDirty(3);
        this.m_ScriptValue = __Value;
        return;
    }
}

struct FAutoDeltaInheritRootHolderAS
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FAutoDeltaInheritDerivedAS m_Flatten;
    UPROPERTY()
    FAutoDeltaInheritDerivedAS m_Nested;
    UPROPERTY()
    int m_RootValue;

    FAutoDeltaInheritRootHolderAS()
    {
        this.m_RootValue = 0;
        this.__InitDirtyFlags();
        return;
    }
    FAutoDeltaInheritRootHolderAS(const FAutoDeltaInheritRootHolderAS &inout Other)
    {
        this.m_RootValue = 0;
        this.__InitDirtyFlags();
        this.m_Flatten = Other.m_Flatten;
        this.m_Nested = Other.m_Nested;
        this.m_RootValue = int(Other.m_RootValue);
        return;
    }
    FAutoDeltaInheritRootHolderAS opAssign(const FAutoDeltaInheritRootHolderAS &inout Other)
    {
        FAutoDeltaInheritRootHolderAS __r;
        this.SetFlatten(Other.GetFlatten());
        this.SetNested(Other.GetNested());
        this.SetRootValue(Other.GetRootValue());
        return __r;
    }
    const FAutoDeltaInheritDerivedAS GetFlatten() const property
    {
        const FAutoDeltaInheritDerivedAS __r;
        return __r;
    }
    FAutoDeltaInheritDerivedAS GetFlatten() property
    {
        FAutoDeltaInheritDerivedAS __r;
        return __r;
    }
    void SetFlatten(const FAutoDeltaInheritDerivedAS &inout __Value) property
    {
        this.m_Flatten = __Value;
        return;
    }
    const FAutoDeltaInheritDerivedAS GetNested() const property
    {
        const FAutoDeltaInheritDerivedAS __r;
        return __r;
    }
    FAutoDeltaInheritDerivedAS GetNested() property
    {
        FAutoDeltaInheritDerivedAS __r;
        return __r;
    }
    void SetNested(const FAutoDeltaInheritDerivedAS &inout __Value) property
    {
        this.m_Nested = __Value;
        return;
    }
    int GetRootValue() const property
    {
        return this.m_RootValue;
    }
    void SetRootValue(const int __Value) property
    {
        if (this.m_RootValue == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_RootValue = __Value;
        return;
    }
}

struct FAutoDeltaInheritMixedHolderAS
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FAutoDeltaInheritChildAS m_Child;
    UPROPERTY()
    FAutoDeltaInheritFromCppAS m_FromCpp;
    UPROPERTY()
    int m_RootTail;

    FAutoDeltaInheritMixedHolderAS()
    {
        this.m_RootTail = 0;
        this.__InitDirtyFlags();
        return;
    }
    FAutoDeltaInheritMixedHolderAS(const FAutoDeltaInheritMixedHolderAS &inout Other)
    {
        this.m_RootTail = 0;
        this.__InitDirtyFlags();
        this.m_Child = Other.m_Child;
        this.m_FromCpp = Other.m_FromCpp;
        this.m_RootTail = int(Other.m_RootTail);
        return;
    }
    FAutoDeltaInheritMixedHolderAS opAssign(const FAutoDeltaInheritMixedHolderAS &inout Other)
    {
        FAutoDeltaInheritMixedHolderAS __r;
        this.SetChild(Other.GetChild());
        this.SetFromCpp(Other.GetFromCpp());
        this.SetRootTail(Other.GetRootTail());
        return __r;
    }
    const FAutoDeltaInheritChildAS GetChild() const property
    {
        const FAutoDeltaInheritChildAS __r;
        return __r;
    }
    FAutoDeltaInheritChildAS GetChild() property
    {
        FAutoDeltaInheritChildAS __r;
        return __r;
    }
    void SetChild(const FAutoDeltaInheritChildAS &inout __Value) property
    {
        this.m_Child = __Value;
        return;
    }
    const FAutoDeltaInheritFromCppAS GetFromCpp() const property
    {
        const FAutoDeltaInheritFromCppAS __r;
        return __r;
    }
    FAutoDeltaInheritFromCppAS GetFromCpp() property
    {
        FAutoDeltaInheritFromCppAS __r;
        return __r;
    }
    void SetFromCpp(const FAutoDeltaInheritFromCppAS &inout __Value) property
    {
        this.m_FromCpp = __Value;
        return;
    }
    int GetRootTail() const property
    {
        return this.m_RootTail;
    }
    void SetRootTail(const int __Value) property
    {
        if (this.m_RootTail == __Value)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_RootTail = __Value;
        return;
    }
}

struct FMultiLevelNestedHolderAS
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FAutoDeltaInheritChildAS m_FlattenChild;
    UPROPERTY()
    FAutoDeltaInheritChildAS m_NestedChild;
    UPROPERTY()
    int m_HolderVal;

    FMultiLevelNestedHolderAS()
    {
        this.m_HolderVal = 0;
        this.__InitDirtyFlags();
        return;
    }
    FMultiLevelNestedHolderAS(const FMultiLevelNestedHolderAS &inout Other)
    {
        this.m_HolderVal = 0;
        this.__InitDirtyFlags();
        this.m_FlattenChild = Other.m_FlattenChild;
        this.m_NestedChild = Other.m_NestedChild;
        this.m_HolderVal = int(Other.m_HolderVal);
        return;
    }
    FMultiLevelNestedHolderAS opAssign(const FMultiLevelNestedHolderAS &inout Other)
    {
        FMultiLevelNestedHolderAS __r;
        this.SetFlattenChild(Other.GetFlattenChild());
        this.SetNestedChild(Other.GetNestedChild());
        this.SetHolderVal(Other.GetHolderVal());
        return __r;
    }
    const FAutoDeltaInheritChildAS GetFlattenChild() const property
    {
        const FAutoDeltaInheritChildAS __r;
        return __r;
    }
    FAutoDeltaInheritChildAS GetFlattenChild() property
    {
        FAutoDeltaInheritChildAS __r;
        return __r;
    }
    void SetFlattenChild(const FAutoDeltaInheritChildAS &inout __Value) property
    {
        this.m_FlattenChild = __Value;
        return;
    }
    const FAutoDeltaInheritChildAS GetNestedChild() const property
    {
        const FAutoDeltaInheritChildAS __r;
        return __r;
    }
    FAutoDeltaInheritChildAS GetNestedChild() property
    {
        FAutoDeltaInheritChildAS __r;
        return __r;
    }
    void SetNestedChild(const FAutoDeltaInheritChildAS &inout __Value) property
    {
        this.m_NestedChild = __Value;
        return;
    }
    int GetHolderVal() const property
    {
        return this.m_HolderVal;
    }
    void SetHolderVal(const int __Value) property
    {
        if (this.m_HolderVal == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_HolderVal = __Value;
        return;
    }
}

struct FAutoDeltaInheritEmptyDerivedAS : FAutoDeltaInheritBaseAS
{
    FAutoDeltaInheritBaseAS _base_FAutoDeltaInheritBaseAS;

    FAutoDeltaInheritEmptyDerivedAS()
    {
        super();
        return;
    }
    FAutoDeltaInheritEmptyDerivedAS(const FAutoDeltaInheritEmptyDerivedAS &inout Other)
    {
        super();
        Super::opAssign(Other._base_FAutoDeltaInheritBaseAS);
        return;
    }
    FAutoDeltaInheritEmptyDerivedAS& opAssign(const FAutoDeltaInheritEmptyDerivedAS &inout Other)
    {
        return Super::opAssign(Other._base_FAutoDeltaInheritBaseAS);
    }
}

struct FInheritBaseWithNameAS
{
    FSubDirtyFlags40 __DirtyFlags;
    UPROPERTY()
    FName m_BaseName;
    UPROPERTY()
    int m_BaseInt;

    FInheritBaseWithNameAS()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FInheritBaseWithNameAS(const FInheritBaseWithNameAS &inout Other)
    {
        this.m_BaseInt = 0;
        this.m_BaseName = Other.m_BaseName;
        this.m_BaseInt = int(Other.m_BaseInt);
        return;
    }
    FInheritBaseWithNameAS opAssign(const FInheritBaseWithNameAS &inout Other)
    {
        FInheritBaseWithNameAS __r;
        this.SetBaseName(Other.GetBaseName());
        this.SetBaseInt(Other.GetBaseInt());
        return __r;
    }
    FName GetBaseName() const property
    {
        return this.m_BaseName;
    }
    void SetBaseName(const FName &inout __Value) property
    {
        if ((this.m_BaseName == __Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_BaseName = __Value;
        return;
    }
    int GetBaseInt() const property
    {
        return this.m_BaseInt;
    }
    void SetBaseInt(const int __Value) property
    {
        if (this.m_BaseInt == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_BaseInt = __Value;
        return;
    }
}

struct FInheritDerivedWithNameAS : FInheritBaseWithNameAS
{
    FInheritBaseWithNameAS _base_FInheritBaseWithNameAS;
    UPROPERTY()
    FName m_DerivedName;

    FInheritDerivedWithNameAS()
    {
        super();
        return;
    }
    FInheritDerivedWithNameAS(const FInheritDerivedWithNameAS &inout Other)
    {
        super();
        Super::opAssign(Other._base_FInheritBaseWithNameAS);
        this.m_DerivedName = Other.m_DerivedName;
        return;
    }
    FInheritDerivedWithNameAS opAssign(const FInheritDerivedWithNameAS &inout Other)
    {
        FInheritDerivedWithNameAS __r;
        Super::opAssign(Other._base_FInheritBaseWithNameAS);
        this.SetDerivedName(Other.GetDerivedName());
        return __r;
    }
    FName GetDerivedName() const property
    {
        return this.m_DerivedName;
    }
    void SetDerivedName(const FName &inout __Value) property
    {
        if ((this.m_DerivedName == __Value))
        {
            return;
        }
        Super::__GetSharedDirtyFlags().MarkDirty(2);
        this.m_DerivedName = __Value;
        return;
    }
}

struct FInheritNameHolderAS
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FInheritDerivedWithNameAS m_NameData;
    UPROPERTY()
    int m_Tail;

    FInheritNameHolderAS()
    {
        this.m_Tail = 0;
        this.__InitDirtyFlags();
        return;
    }
    FInheritNameHolderAS(const FInheritNameHolderAS &inout Other)
    {
        this.m_Tail = 0;
        this.__InitDirtyFlags();
        this.m_NameData = Other.m_NameData;
        this.m_Tail = int(Other.m_Tail);
        return;
    }
    FInheritNameHolderAS opAssign(const FInheritNameHolderAS &inout Other)
    {
        FInheritNameHolderAS __r;
        this.SetNameData(Other.GetNameData());
        this.SetTail(Other.GetTail());
        return __r;
    }
    const FInheritDerivedWithNameAS GetNameData() const property
    {
        const FInheritDerivedWithNameAS __r;
        return __r;
    }
    FInheritDerivedWithNameAS GetNameData() property
    {
        FInheritDerivedWithNameAS __r;
        return __r;
    }
    void SetNameData(const FInheritDerivedWithNameAS &inout __Value) property
    {
        this.m_NameData = __Value;
        return;
    }
    int GetTail() const property
    {
        return this.m_Tail;
    }
    void SetTail(const int __Value) property
    {
        if (this.m_Tail == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_Tail = __Value;
        return;
    }
}

struct FInheritCapBaseAS
{
    FSubDirtyFlags40 __DirtyFlags;
    UPROPERTY()
    int m_B0;
    UPROPERTY()
    int m_B1;
    UPROPERTY()
    int m_B2;
    UPROPERTY()
    int m_B3;
    UPROPERTY()
    int m_B4;
    UPROPERTY()
    int m_B5;
    UPROPERTY()
    int m_B6;
    UPROPERTY()
    int m_B7;
    UPROPERTY()
    int m_B8;
    UPROPERTY()
    int m_B9;

    FInheritCapBaseAS()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FInheritCapBaseAS(const FInheritCapBaseAS &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FInheritCapBaseAS opAssign(const FInheritCapBaseAS &inout Other)
    {
        FInheritCapBaseAS __r;
        this.SetB0(Other.GetB0());
        this.SetB1(Other.GetB1());
        this.SetB2(Other.GetB2());
        this.SetB3(Other.GetB3());
        this.SetB4(Other.GetB4());
        this.SetB5(Other.GetB5());
        this.SetB6(Other.GetB6());
        this.SetB7(Other.GetB7());
        this.SetB8(Other.GetB8());
        this.SetB9(Other.GetB9());
        return __r;
    }
    int GetB0() const property
    {
        return this.m_B0;
    }
    void SetB0(const int __Value) property
    {
        if (this.m_B0 == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_B0 = __Value;
        return;
    }
    int GetB1() const property
    {
        return this.m_B1;
    }
    void SetB1(const int __Value) property
    {
        if (this.m_B1 == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_B1 = __Value;
        return;
    }
    int GetB2() const property
    {
        return this.m_B2;
    }
    void SetB2(const int __Value) property
    {
        if (this.m_B2 == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_B2 = __Value;
        return;
    }
    int GetB3() const property
    {
        return this.m_B3;
    }
    void SetB3(const int __Value) property
    {
        if (this.m_B3 == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_B3 = __Value;
        return;
    }
    int GetB4() const property
    {
        return this.m_B4;
    }
    void SetB4(const int __Value) property
    {
        if (this.m_B4 == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_B4 = __Value;
        return;
    }
    int GetB5() const property
    {
        return this.m_B5;
    }
    void SetB5(const int __Value) property
    {
        if (this.m_B5 == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_B5 = __Value;
        return;
    }
    int GetB6() const property
    {
        return this.m_B6;
    }
    void SetB6(const int __Value) property
    {
        if (this.m_B6 == __Value)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_B6 = __Value;
        return;
    }
    int GetB7() const property
    {
        return this.m_B7;
    }
    void SetB7(const int __Value) property
    {
        if (this.m_B7 == __Value)
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_B7 = __Value;
        return;
    }
    int GetB8() const property
    {
        return this.m_B8;
    }
    void SetB8(const int __Value) property
    {
        if (this.m_B8 == __Value)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_B8 = __Value;
        return;
    }
    int GetB9() const property
    {
        return this.m_B9;
    }
    void SetB9(const int __Value) property
    {
        if (this.m_B9 == __Value)
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_B9 = __Value;
        return;
    }
}

struct FInheritCapDerivedAS : FInheritCapBaseAS
{
    FInheritCapBaseAS _base_FInheritCapBaseAS;
    UPROPERTY()
    int m_D0;
    UPROPERTY()
    int m_D1;
    UPROPERTY()
    int m_D2;
    UPROPERTY()
    int m_D3;
    UPROPERTY()
    int m_D4;
    UPROPERTY()
    int m_D5;
    UPROPERTY()
    int m_D6;
    UPROPERTY()
    int m_D7;
    UPROPERTY()
    int m_D8;
    UPROPERTY()
    int m_D9;
    UPROPERTY()
    int m_D10;
    UPROPERTY()
    int m_D11;
    UPROPERTY()
    int m_D12;
    UPROPERTY()
    int m_D13;
    UPROPERTY()
    int m_D14;
    UPROPERTY()
    int m_D15;
    UPROPERTY()
    int m_D16;
    UPROPERTY()
    int m_D17;
    UPROPERTY()
    int m_D18;
    UPROPERTY()
    int m_D19;
    UPROPERTY()
    int m_D20;
    UPROPERTY()
    int m_D21;

    FInheritCapDerivedAS(const FInheritCapDerivedAS &inout Other)
    {
        super();
        Super::opAssign(Other._base_FInheritCapBaseAS);
        this.m_D0 = int(Other.m_D0);
        this.m_D1 = int(Other.m_D1);
        this.m_D2 = int(Other.m_D2);
        this.m_D3 = int(Other.m_D3);
        this.m_D4 = int(Other.m_D4);
        this.m_D5 = int(Other.m_D5);
        this.m_D6 = int(Other.m_D6);
        this.m_D7 = int(Other.m_D7);
        this.m_D8 = int(Other.m_D8);
        this.m_D9 = int(Other.m_D9);
        this.m_D10 = int(Other.m_D10);
        this.m_D11 = int(Other.m_D11);
        this.m_D12 = int(Other.m_D12);
        this.m_D13 = int(Other.m_D13);
        this.m_D14 = int(Other.m_D14);
        this.m_D15 = int(Other.m_D15);
        this.m_D16 = int(Other.m_D16);
        this.m_D17 = int(Other.m_D17);
        this.m_D18 = int(Other.m_D18);
        this.m_D19 = int(Other.m_D19);
        this.m_D20 = int(Other.m_D20);
        this.m_D21 = int(Other.m_D21);
        return;
    }
    FInheritCapDerivedAS opAssign(const FInheritCapDerivedAS &inout Other)
    {
        FInheritCapDerivedAS __r;
        Super::opAssign(Other._base_FInheritCapBaseAS);
        this.SetD0(Other.GetD0());
        this.SetD1(Other.GetD1());
        this.SetD2(Other.GetD2());
        this.SetD3(Other.GetD3());
        this.SetD4(Other.GetD4());
        this.SetD5(Other.GetD5());
        this.SetD6(Other.GetD6());
        this.SetD7(Other.GetD7());
        this.SetD8(Other.GetD8());
        this.SetD9(Other.GetD9());
        this.SetD10(Other.GetD10());
        this.SetD11(Other.GetD11());
        this.SetD12(Other.GetD12());
        this.SetD13(Other.GetD13());
        this.SetD14(Other.GetD14());
        this.SetD15(Other.GetD15());
        this.SetD16(Other.GetD16());
        this.SetD17(Other.GetD17());
        this.SetD18(Other.GetD18());
        this.SetD19(Other.GetD19());
        this.SetD20(Other.GetD20());
        this.SetD21(Other.GetD21());
        return __r;
    }
    int GetD0() const property
    {
        return this.m_D0;
    }
    void SetD0(const int __Value) property
    {
        if (this.m_D0 == __Value)
        {
            return;
        }
        Super::__GetSharedDirtyFlags().MarkDirty(10);
        this.m_D0 = __Value;
        return;
    }
    int GetD1() const property
    {
        return this.m_D1;
    }
    void SetD1(const int __Value) property
    {
        if (this.m_D1 == __Value)
        {
            return;
        }
        Super::__GetSharedDirtyFlags().MarkDirty(11);
        this.m_D1 = __Value;
        return;
    }
    int GetD2() const property
    {
        return this.m_D2;
    }
    void SetD2(const int __Value) property
    {
        if (this.m_D2 == __Value)
        {
            return;
        }
        Super::__GetSharedDirtyFlags().MarkDirty(12);
        this.m_D2 = __Value;
        return;
    }
    int GetD3() const property
    {
        return this.m_D3;
    }
    void SetD3(const int __Value) property
    {
        if (this.m_D3 == __Value)
        {
            return;
        }
        Super::__GetSharedDirtyFlags().MarkDirty(13);
        this.m_D3 = __Value;
        return;
    }
    int GetD4() const property
    {
        return this.m_D4;
    }
    void SetD4(const int __Value) property
    {
        if (this.m_D4 == __Value)
        {
            return;
        }
        Super::__GetSharedDirtyFlags().MarkDirty(14);
        this.m_D4 = __Value;
        return;
    }
    int GetD5() const property
    {
        return this.m_D5;
    }
    void SetD5(const int __Value) property
    {
        if (this.m_D5 == __Value)
        {
            return;
        }
        Super::__GetSharedDirtyFlags().MarkDirty(15);
        this.m_D5 = __Value;
        return;
    }
    int GetD6() const property
    {
        return this.m_D6;
    }
    void SetD6(const int __Value) property
    {
        if (this.m_D6 == __Value)
        {
            return;
        }
        Super::__GetSharedDirtyFlags().MarkDirty(16);
        this.m_D6 = __Value;
        return;
    }
    int GetD7() const property
    {
        return this.m_D7;
    }
    void SetD7(const int __Value) property
    {
        if (this.m_D7 == __Value)
        {
            return;
        }
        Super::__GetSharedDirtyFlags().MarkDirty(17);
        this.m_D7 = __Value;
        return;
    }
    int GetD8() const property
    {
        return this.m_D8;
    }
    void SetD8(const int __Value) property
    {
        if (this.m_D8 == __Value)
        {
            return;
        }
        Super::__GetSharedDirtyFlags().MarkDirty(18);
        this.m_D8 = __Value;
        return;
    }
    int GetD9() const property
    {
        return this.m_D9;
    }
    void SetD9(const int __Value) property
    {
        if (this.m_D9 == __Value)
        {
            return;
        }
        Super::__GetSharedDirtyFlags().MarkDirty(19);
        this.m_D9 = __Value;
        return;
    }
    int GetD10() const property
    {
        return this.m_D10;
    }
    void SetD10(const int __Value) property
    {
        if (this.m_D10 == __Value)
        {
            return;
        }
        Super::__GetSharedDirtyFlags().MarkDirty(20);
        this.m_D10 = __Value;
        return;
    }
    int GetD11() const property
    {
        return this.m_D11;
    }
    void SetD11(const int __Value) property
    {
        if (this.m_D11 == __Value)
        {
            return;
        }
        Super::__GetSharedDirtyFlags().MarkDirty(21);
        this.m_D11 = __Value;
        return;
    }
    int GetD12() const property
    {
        return this.m_D12;
    }
    void SetD12(const int __Value) property
    {
        if (this.m_D12 == __Value)
        {
            return;
        }
        Super::__GetSharedDirtyFlags().MarkDirty(22);
        this.m_D12 = __Value;
        return;
    }
    int GetD13() const property
    {
        return this.m_D13;
    }
    void SetD13(const int __Value) property
    {
        if (this.m_D13 == __Value)
        {
            return;
        }
        Super::__GetSharedDirtyFlags().MarkDirty(23);
        this.m_D13 = __Value;
        return;
    }
    int GetD14() const property
    {
        return this.m_D14;
    }
    void SetD14(const int __Value) property
    {
        if (this.m_D14 == __Value)
        {
            return;
        }
        Super::__GetSharedDirtyFlags().MarkDirty(24);
        this.m_D14 = __Value;
        return;
    }
    int GetD15() const property
    {
        return this.m_D15;
    }
    void SetD15(const int __Value) property
    {
        if (this.m_D15 == __Value)
        {
            return;
        }
        Super::__GetSharedDirtyFlags().MarkDirty(25);
        this.m_D15 = __Value;
        return;
    }
    int GetD16() const property
    {
        return this.m_D16;
    }
    void SetD16(const int __Value) property
    {
        if (this.m_D16 == __Value)
        {
            return;
        }
        Super::__GetSharedDirtyFlags().MarkDirty(26);
        this.m_D16 = __Value;
        return;
    }
    int GetD17() const property
    {
        return this.m_D17;
    }
    void SetD17(const int __Value) property
    {
        if (this.m_D17 == __Value)
        {
            return;
        }
        Super::__GetSharedDirtyFlags().MarkDirty(27);
        this.m_D17 = __Value;
        return;
    }
    int GetD18() const property
    {
        return this.m_D18;
    }
    void SetD18(const int __Value) property
    {
        if (this.m_D18 == __Value)
        {
            return;
        }
        Super::__GetSharedDirtyFlags().MarkDirty(28);
        this.m_D18 = __Value;
        return;
    }
    int GetD19() const property
    {
        return this.m_D19;
    }
    void SetD19(const int __Value) property
    {
        if (this.m_D19 == __Value)
        {
            return;
        }
        Super::__GetSharedDirtyFlags().MarkDirty(29);
        this.m_D19 = __Value;
        return;
    }
    int GetD20() const property
    {
        return this.m_D20;
    }
    void SetD20(const int __Value) property
    {
        if (this.m_D20 == __Value)
        {
            return;
        }
        Super::__GetSharedDirtyFlags().MarkDirty(30);
        this.m_D20 = __Value;
        return;
    }
    int GetD21() const property
    {
        return this.m_D21;
    }
    void SetD21(const int __Value) property
    {
        if (this.m_D21 == __Value)
        {
            return;
        }
        Super::__GetSharedDirtyFlags().MarkDirty(31);
        this.m_D21 = __Value;
        return;
    }
}

struct FInheritCapHolderAS
{
    FRootDirtyFlags64 __DirtyFlags;
    UPROPERTY()
    FInheritCapDerivedAS m_CapData;
    UPROPERTY()
    int m_CapTail;

    FInheritCapHolderAS()
    {
        this.m_CapTail = 0;
        this.__InitDirtyFlags();
        return;
    }
    FInheritCapHolderAS(const FInheritCapHolderAS &inout Other)
    {
        this.m_CapTail = 0;
        this.__InitDirtyFlags();
        this.m_CapData = Other.m_CapData;
        this.m_CapTail = int(Other.m_CapTail);
        return;
    }
    FInheritCapHolderAS opAssign(const FInheritCapHolderAS &inout Other)
    {
        FInheritCapHolderAS __r;
        this.SetCapData(Other.GetCapData());
        this.SetCapTail(Other.GetCapTail());
        return __r;
    }
    const FInheritCapDerivedAS GetCapData() const property
    {
        const FInheritCapDerivedAS __r;
        return __r;
    }
    FInheritCapDerivedAS GetCapData() property
    {
        FInheritCapDerivedAS __r;
        return __r;
    }
    void SetCapData(const FInheritCapDerivedAS &inout __Value) property
    {
        this.m_CapData = __Value;
        return;
    }
    int GetCapTail() const property
    {
        return this.m_CapTail;
    }
    void SetCapTail(const int __Value) property
    {
        if (this.m_CapTail == __Value)
        {
            return;
        }
        this.__MarkDirty(32);
        this.m_CapTail = __Value;
        return;
    }
}

struct FCppNestedHolderAS
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FAutoDeltaInheritFromCppAS m_FlattenCpp;
    UPROPERTY()
    FAutoDeltaInheritFromCppAS m_NestedCpp;
    UPROPERTY()
    int m_HolderVal;

    FCppNestedHolderAS()
    {
        this.m_HolderVal = 0;
        this.__InitDirtyFlags();
        return;
    }
    FCppNestedHolderAS(const FCppNestedHolderAS &inout Other)
    {
        this.m_HolderVal = 0;
        this.__InitDirtyFlags();
        this.m_FlattenCpp = Other.m_FlattenCpp;
        this.m_NestedCpp = Other.m_NestedCpp;
        this.m_HolderVal = int(Other.m_HolderVal);
        return;
    }
    FCppNestedHolderAS opAssign(const FCppNestedHolderAS &inout Other)
    {
        FCppNestedHolderAS __r;
        this.SetFlattenCpp(Other.GetFlattenCpp());
        this.SetNestedCpp(Other.GetNestedCpp());
        this.SetHolderVal(Other.GetHolderVal());
        return __r;
    }
    const FAutoDeltaInheritFromCppAS GetFlattenCpp() const property
    {
        const FAutoDeltaInheritFromCppAS __r;
        return __r;
    }
    FAutoDeltaInheritFromCppAS GetFlattenCpp() property
    {
        FAutoDeltaInheritFromCppAS __r;
        return __r;
    }
    void SetFlattenCpp(const FAutoDeltaInheritFromCppAS &inout __Value) property
    {
        this.m_FlattenCpp = __Value;
        return;
    }
    const FAutoDeltaInheritFromCppAS GetNestedCpp() const property
    {
        const FAutoDeltaInheritFromCppAS __r;
        return __r;
    }
    FAutoDeltaInheritFromCppAS GetNestedCpp() property
    {
        FAutoDeltaInheritFromCppAS __r;
        return __r;
    }
    void SetNestedCpp(const FAutoDeltaInheritFromCppAS &inout __Value) property
    {
        this.m_NestedCpp = __Value;
        return;
    }
    int GetHolderVal() const property
    {
        return this.m_HolderVal;
    }
    void SetHolderVal(const int __Value) property
    {
        if (this.m_HolderVal == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_HolderVal = __Value;
        return;
    }
}

struct FInheritBase64AS
{
    FSubDirtyFlags72 __DirtyFlags;
    UPROPERTY()
    int m_Base64A;
    UPROPERTY()
    int m_Base64B;

    FInheritBase64AS()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FInheritBase64AS(const FInheritBase64AS &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FInheritBase64AS opAssign(const FInheritBase64AS &inout Other)
    {
        FInheritBase64AS __r;
        this.SetBase64A(Other.GetBase64A());
        this.SetBase64B(Other.GetBase64B());
        return __r;
    }
    int GetBase64A() const property
    {
        return this.m_Base64A;
    }
    void SetBase64A(const int __Value) property
    {
        if (this.m_Base64A == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Base64A = __Value;
        return;
    }
    int GetBase64B() const property
    {
        return this.m_Base64B;
    }
    void SetBase64B(const int __Value) property
    {
        if (this.m_Base64B == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_Base64B = __Value;
        return;
    }
}

struct FInheritDerived64AS : FInheritBase64AS
{
    FInheritBase64AS _base_FInheritBase64AS;
    UPROPERTY()
    int m_Derived64X;

    FInheritDerived64AS(const FInheritDerived64AS &inout Other)
    {
        super();
        Super::opAssign(Other._base_FInheritBase64AS);
        this.m_Derived64X = int(Other.m_Derived64X);
        return;
    }
    FInheritDerived64AS opAssign(const FInheritDerived64AS &inout Other)
    {
        FInheritDerived64AS __r;
        Super::opAssign(Other._base_FInheritBase64AS);
        this.SetDerived64X(Other.GetDerived64X());
        return __r;
    }
    int GetDerived64X() const property
    {
        return this.m_Derived64X;
    }
    void SetDerived64X(const int __Value) property
    {
        if (this.m_Derived64X == __Value)
        {
            return;
        }
        Super::__GetSharedDirtyFlags().MarkDirty(2);
        this.m_Derived64X = __Value;
        return;
    }
}

struct FInheritHolder64AS
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FInheritDerived64AS m_Data;
    UPROPERTY()
    int m_Tail;

    FInheritHolder64AS()
    {
        this.m_Tail = 0;
        this.__InitDirtyFlags();
        return;
    }
    FInheritHolder64AS(const FInheritHolder64AS &inout Other)
    {
        this.m_Tail = 0;
        this.__InitDirtyFlags();
        this.m_Data = Other.m_Data;
        this.m_Tail = int(Other.m_Tail);
        return;
    }
    FInheritHolder64AS opAssign(const FInheritHolder64AS &inout Other)
    {
        FInheritHolder64AS __r;
        this.SetData(Other.GetData());
        this.SetTail(Other.GetTail());
        return __r;
    }
    const FInheritDerived64AS GetData() const property
    {
        const FInheritDerived64AS __r;
        return __r;
    }
    FInheritDerived64AS GetData() property
    {
        FInheritDerived64AS __r;
        return __r;
    }
    void SetData(const FInheritDerived64AS &inout __Value) property
    {
        this.m_Data = __Value;
        return;
    }
    int GetTail() const property
    {
        return this.m_Tail;
    }
    void SetTail(const int __Value) property
    {
        if (this.m_Tail == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_Tail = __Value;
        return;
    }
}

struct FInheritBase96AS
{
    FSubDirtyFlags104 __DirtyFlags;
    UPROPERTY()
    int m_Base96A;
    UPROPERTY()
    int m_Base96B;

    FInheritBase96AS()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FInheritBase96AS(const FInheritBase96AS &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FInheritBase96AS opAssign(const FInheritBase96AS &inout Other)
    {
        FInheritBase96AS __r;
        this.SetBase96A(Other.GetBase96A());
        this.SetBase96B(Other.GetBase96B());
        return __r;
    }
    int GetBase96A() const property
    {
        return this.m_Base96A;
    }
    void SetBase96A(const int __Value) property
    {
        if (this.m_Base96A == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Base96A = __Value;
        return;
    }
    int GetBase96B() const property
    {
        return this.m_Base96B;
    }
    void SetBase96B(const int __Value) property
    {
        if (this.m_Base96B == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_Base96B = __Value;
        return;
    }
}

struct FInheritDerived96AS : FInheritBase96AS
{
    FInheritBase96AS _base_FInheritBase96AS;
    UPROPERTY()
    int m_Derived96X;

    FInheritDerived96AS(const FInheritDerived96AS &inout Other)
    {
        super();
        Super::opAssign(Other._base_FInheritBase96AS);
        this.m_Derived96X = int(Other.m_Derived96X);
        return;
    }
    FInheritDerived96AS opAssign(const FInheritDerived96AS &inout Other)
    {
        FInheritDerived96AS __r;
        Super::opAssign(Other._base_FInheritBase96AS);
        this.SetDerived96X(Other.GetDerived96X());
        return __r;
    }
    int GetDerived96X() const property
    {
        return this.m_Derived96X;
    }
    void SetDerived96X(const int __Value) property
    {
        if (this.m_Derived96X == __Value)
        {
            return;
        }
        Super::__GetSharedDirtyFlags().MarkDirty(2);
        this.m_Derived96X = __Value;
        return;
    }
}

struct FInheritHolder96AS
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FInheritDerived96AS m_Data;
    UPROPERTY()
    int m_Tail;

    FInheritHolder96AS()
    {
        this.m_Tail = 0;
        this.__InitDirtyFlags();
        return;
    }
    FInheritHolder96AS(const FInheritHolder96AS &inout Other)
    {
        this.m_Tail = 0;
        this.__InitDirtyFlags();
        this.m_Data = Other.m_Data;
        this.m_Tail = int(Other.m_Tail);
        return;
    }
    FInheritHolder96AS opAssign(const FInheritHolder96AS &inout Other)
    {
        FInheritHolder96AS __r;
        this.SetData(Other.GetData());
        this.SetTail(Other.GetTail());
        return __r;
    }
    const FInheritDerived96AS GetData() const property
    {
        const FInheritDerived96AS __r;
        return __r;
    }
    FInheritDerived96AS GetData() property
    {
        FInheritDerived96AS __r;
        return __r;
    }
    void SetData(const FInheritDerived96AS &inout __Value) property
    {
        this.m_Data = __Value;
        return;
    }
    int GetTail() const property
    {
        return this.m_Tail;
    }
    void SetTail(const int __Value) property
    {
        if (this.m_Tail == __Value)
        {
            return;
        }
        this.__MarkDirty(3);
        this.m_Tail = __Value;
        return;
    }
}

struct FSubDataForRisk2Test
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_SubVal1;
    UPROPERTY()
    int m_SubVal2;
    UPROPERTY()
    int m_SubVal3;

    FSubDataForRisk2Test()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FSubDataForRisk2Test(const FSubDataForRisk2Test &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FSubDataForRisk2Test opAssign(const FSubDataForRisk2Test &inout Other)
    {
        FSubDataForRisk2Test __r;
        this.SetSubVal1(Other.GetSubVal1());
        this.SetSubVal2(Other.GetSubVal2());
        this.SetSubVal3(Other.GetSubVal3());
        return __r;
    }
    int GetSubVal1() const property
    {
        return this.m_SubVal1;
    }
    void SetSubVal1(const int __Value) property
    {
        if (this.m_SubVal1 == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_SubVal1 = __Value;
        return;
    }
    int GetSubVal2() const property
    {
        return this.m_SubVal2;
    }
    void SetSubVal2(const int __Value) property
    {
        if (this.m_SubVal2 == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_SubVal2 = __Value;
        return;
    }
    int GetSubVal3() const property
    {
        return this.m_SubVal3;
    }
    void SetSubVal3(const int __Value) property
    {
        if (this.m_SubVal3 == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_SubVal3 = __Value;
        return;
    }
}

struct FBaseWithSubDataAS
{
    FSubDirtyFlags40 __DirtyFlags;
    UPROPERTY()
    int m_BaseVal;
    UPROPERTY()
    FSubDataForRisk2Test m_BaseSub;

    FBaseWithSubDataAS()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FBaseWithSubDataAS(const FBaseWithSubDataAS &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FBaseWithSubDataAS opAssign(const FBaseWithSubDataAS &inout Other)
    {
        FBaseWithSubDataAS __r;
        this.SetBaseVal(Other.GetBaseVal());
        this.SetBaseSub(Other.GetBaseSub());
        return __r;
    }
    int GetBaseVal() const property
    {
        return this.m_BaseVal;
    }
    void SetBaseVal(const int __Value) property
    {
        if (this.m_BaseVal == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_BaseVal = __Value;
        return;
    }
    const FSubDataForRisk2Test GetBaseSub() const property
    {
        const FSubDataForRisk2Test __r;
        return __r;
    }
    FSubDataForRisk2Test GetBaseSub() property
    {
        FSubDataForRisk2Test __r;
        return __r;
    }
    void SetBaseSub(const FSubDataForRisk2Test &inout __Value) property
    {
        this.m_BaseSub = __Value;
        return;
    }
}

struct FDerivedWithSubDataAS : FBaseWithSubDataAS
{
    FBaseWithSubDataAS _base_FBaseWithSubDataAS;
    UPROPERTY()
    int m_DerivedVal;
    UPROPERTY()
    FSubDataForRisk2Test m_DerivedSub;

    FDerivedWithSubDataAS(const FDerivedWithSubDataAS &inout Other)
    {
        super();
        Super::opAssign(Other._base_FBaseWithSubDataAS);
        this.m_DerivedVal = int(Other.m_DerivedVal);
        this.m_DerivedSub = Other.m_DerivedSub;
        return;
    }
    FDerivedWithSubDataAS opAssign(const FDerivedWithSubDataAS &inout Other)
    {
        FDerivedWithSubDataAS __r;
        Super::opAssign(Other._base_FBaseWithSubDataAS);
        this.SetDerivedVal(Other.GetDerivedVal());
        this.SetDerivedSub(Other.GetDerivedSub());
        return __r;
    }
    int GetDerivedVal() const property
    {
        return this.m_DerivedVal;
    }
    void SetDerivedVal(const int __Value) property
    {
        if (this.m_DerivedVal == __Value)
        {
            return;
        }
        Super::__GetSharedDirtyFlags().MarkDirty(4);
        this.m_DerivedVal = __Value;
        return;
    }
    const FSubDataForRisk2Test GetDerivedSub() const property
    {
        const FSubDataForRisk2Test __r;
        return __r;
    }
    FSubDataForRisk2Test GetDerivedSub() property
    {
        FSubDataForRisk2Test __r;
        return __r;
    }
    void SetDerivedSub(const FSubDataForRisk2Test &inout __Value) property
    {
        this.m_DerivedSub = __Value;
        return;
    }
}

struct FRootForRisk2TestAS
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FDerivedWithSubDataAS m_Flatten;
    UPROPERTY()
    FDerivedWithSubDataAS m_Nested;
    UPROPERTY()
    int m_RootVal;

    FRootForRisk2TestAS()
    {
        this.m_RootVal = 0;
        this.__InitDirtyFlags();
        return;
    }
    FRootForRisk2TestAS(const FRootForRisk2TestAS &inout Other)
    {
        this.m_RootVal = 0;
        this.__InitDirtyFlags();
        this.m_Flatten = Other.m_Flatten;
        this.m_Nested = Other.m_Nested;
        this.m_RootVal = int(Other.m_RootVal);
        return;
    }
    FRootForRisk2TestAS opAssign(const FRootForRisk2TestAS &inout Other)
    {
        FRootForRisk2TestAS __r;
        this.SetFlatten(Other.GetFlatten());
        this.SetNested(Other.GetNested());
        this.SetRootVal(Other.GetRootVal());
        return __r;
    }
    const FDerivedWithSubDataAS GetFlatten() const property
    {
        const FDerivedWithSubDataAS __r;
        return __r;
    }
    FDerivedWithSubDataAS GetFlatten() property
    {
        FDerivedWithSubDataAS __r;
        return __r;
    }
    void SetFlatten(const FDerivedWithSubDataAS &inout __Value) property
    {
        this.m_Flatten = __Value;
        return;
    }
    const FDerivedWithSubDataAS GetNested() const property
    {
        const FDerivedWithSubDataAS __r;
        return __r;
    }
    FDerivedWithSubDataAS GetNested() property
    {
        FDerivedWithSubDataAS __r;
        return __r;
    }
    void SetNested(const FDerivedWithSubDataAS &inout __Value) property
    {
        this.m_Nested = __Value;
        return;
    }
    int GetRootVal() const property
    {
        return this.m_RootVal;
    }
    void SetRootVal(const int __Value) property
    {
        if (this.m_RootVal == __Value)
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_RootVal = __Value;
        return;
    }
}

struct FBaseWithNestedSubAS
{
    FSubDirtyFlags40 __DirtyFlags;
    UPROPERTY()
    int m_BaseVal;
    UPROPERTY()
    FSubDataForRisk2Test m_BaseNested;

    FBaseWithNestedSubAS()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FBaseWithNestedSubAS(const FBaseWithNestedSubAS &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FBaseWithNestedSubAS opAssign(const FBaseWithNestedSubAS &inout Other)
    {
        FBaseWithNestedSubAS __r;
        this.SetBaseVal(Other.GetBaseVal());
        this.SetBaseNested(Other.GetBaseNested());
        return __r;
    }
    int GetBaseVal() const property
    {
        return this.m_BaseVal;
    }
    void SetBaseVal(const int __Value) property
    {
        if (this.m_BaseVal == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_BaseVal = __Value;
        return;
    }
    const FSubDataForRisk2Test GetBaseNested() const property
    {
        const FSubDataForRisk2Test __r;
        return __r;
    }
    FSubDataForRisk2Test GetBaseNested() property
    {
        FSubDataForRisk2Test __r;
        return __r;
    }
    void SetBaseNested(const FSubDataForRisk2Test &inout __Value) property
    {
        this.m_BaseNested = __Value;
        return;
    }
}

struct FDerivedWithBothNestedAS : FBaseWithNestedSubAS
{
    FBaseWithNestedSubAS _base_FBaseWithNestedSubAS;
    UPROPERTY()
    int m_DerivedVal;
    UPROPERTY()
    FSubDataForRisk2Test m_DerivedNested;

    FDerivedWithBothNestedAS(const FDerivedWithBothNestedAS &inout Other)
    {
        super();
        Super::opAssign(Other._base_FBaseWithNestedSubAS);
        this.m_DerivedVal = int(Other.m_DerivedVal);
        this.m_DerivedNested = Other.m_DerivedNested;
        return;
    }
    FDerivedWithBothNestedAS opAssign(const FDerivedWithBothNestedAS &inout Other)
    {
        FDerivedWithBothNestedAS __r;
        Super::opAssign(Other._base_FBaseWithNestedSubAS);
        this.SetDerivedVal(Other.GetDerivedVal());
        this.SetDerivedNested(Other.GetDerivedNested());
        return __r;
    }
    int GetDerivedVal() const property
    {
        return this.m_DerivedVal;
    }
    void SetDerivedVal(const int __Value) property
    {
        if (this.m_DerivedVal == __Value)
        {
            return;
        }
        Super::__GetSharedDirtyFlags().MarkDirty(2);
        this.m_DerivedVal = __Value;
        return;
    }
    const FSubDataForRisk2Test GetDerivedNested() const property
    {
        const FSubDataForRisk2Test __r;
        return __r;
    }
    FSubDataForRisk2Test GetDerivedNested() property
    {
        FSubDataForRisk2Test __r;
        return __r;
    }
    void SetDerivedNested(const FSubDataForRisk2Test &inout __Value) property
    {
        this.m_DerivedNested = __Value;
        return;
    }
}

struct FRootWithNestedSubHolderAS
{
    FRootDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    FDerivedWithBothNestedAS m_SubFlatten;
    UPROPERTY()
    FDerivedWithBothNestedAS m_SubNested;
    UPROPERTY()
    int m_HolderVal;

    FRootWithNestedSubHolderAS()
    {
        this.m_HolderVal = 0;
        this.__InitDirtyFlags();
        return;
    }
    FRootWithNestedSubHolderAS(const FRootWithNestedSubHolderAS &inout Other)
    {
        this.m_HolderVal = 0;
        this.__InitDirtyFlags();
        this.m_SubFlatten = Other.m_SubFlatten;
        this.m_SubNested = Other.m_SubNested;
        this.m_HolderVal = int(Other.m_HolderVal);
        return;
    }
    FRootWithNestedSubHolderAS opAssign(const FRootWithNestedSubHolderAS &inout Other)
    {
        FRootWithNestedSubHolderAS __r;
        this.SetSubFlatten(Other.GetSubFlatten());
        this.SetSubNested(Other.GetSubNested());
        this.SetHolderVal(Other.GetHolderVal());
        return __r;
    }
    const FDerivedWithBothNestedAS GetSubFlatten() const property
    {
        const FDerivedWithBothNestedAS __r;
        return __r;
    }
    FDerivedWithBothNestedAS GetSubFlatten() property
    {
        FDerivedWithBothNestedAS __r;
        return __r;
    }
    void SetSubFlatten(const FDerivedWithBothNestedAS &inout __Value) property
    {
        this.m_SubFlatten = __Value;
        return;
    }
    const FDerivedWithBothNestedAS GetSubNested() const property
    {
        const FDerivedWithBothNestedAS __r;
        return __r;
    }
    FDerivedWithBothNestedAS GetSubNested() property
    {
        FDerivedWithBothNestedAS __r;
        return __r;
    }
    void SetSubNested(const FDerivedWithBothNestedAS &inout __Value) property
    {
        this.m_SubNested = __Value;
        return;
    }
    int GetHolderVal() const property
    {
        return this.m_HolderVal;
    }
    void SetHolderVal(const int __Value) property
    {
        if (this.m_HolderVal == __Value)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_HolderVal = __Value;
        return;
    }
}

void Test_AutoDeltaASInheritance(FUnitTest &inout UnitTest)
{
    FAutoDeltaInheritRootHolderAS local_16;
    AutoDelta::InitDirtyFlags(local_16);
    AutoDelta::ClearDirtyFlags(local_16);
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(local_16), "INH1: init+clear should be clean");
    local_16.GetFlatten().SetBaseA(11);
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_16, 0), "INH1: Flatten.BaseA -> root idx 0");
    UnitTest.AssertFalse(AutoDelta::IsDirty(local_16, 2), "INH1: BaseA must not touch derived idx 2");
    local_16.GetFlatten().SetDerivedX(22);
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_16, 2), "INH1: Flatten.DerivedX -> root idx 2");
    UnitTest.AssertFalse(AutoDelta::IsDirty(local_16, 3), "INH1: must not touch Nested slot 3");
    AutoDelta::InitDirtyFlags(local_16);
    AutoDelta::ClearDirtyFlags(local_16);
    local_16.GetNested().SetDerivedX(99);
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_16, 3), "INH2: Nested write -> root single slot 3");
    UnitTest.AssertFalse(AutoDelta::IsDirty(local_16, 0), "INH2: Nested must not bleed to Flatten seg");
    UnitTest.AssertTrue((AutoDelta::IsDirty(local_16.GetNested(), 2)), "INH2: Nested own bitmap idx 2 = DerivedX");
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_16.GetNested(), 2), "INH2: Nested own bitmap tracks derived prop");
    FAutoDeltaInheritRootHolderAS local_34;
    AutoDelta::InitDirtyFlags(local_16);
    AutoDelta::InitDirtyFlags(local_34);
    AutoDelta::ClearDirtyFlags(local_16);
    AutoDelta::ClearDirtyFlags(local_34);
    local_34.GetFlatten().SetBaseB(-1);
    local_34.GetFlatten().SetDerivedX(-2);
    AutoDelta::ClearDirtyFlags(local_34);
    local_16.GetFlatten().SetBaseA(100);
    local_16.GetFlatten().SetDerivedX(200);
    local_16.SetRootValue(300);
    AutoDelta::DummyNetSerialize(local_16, local_34, FAutoDeltaInheritRootHolderAS);
    UnitTest.AssertEquals(100, local_34.GetFlatten().GetBaseA(), "INH3: base prop synced");
    UnitTest.AssertEquals(200, local_34.GetFlatten().GetDerivedX(), "INH3: derived prop synced");
    UnitTest.AssertEquals(300, local_34.GetRootValue(), "INH3: root prop synced");
    UnitTest.AssertEquals(-1, local_34.GetFlatten().GetBaseB(), "INH3: unchanged base prop preserved local");
    FAutoDeltaInheritDerivedAS local_44;
    local_44.SetBaseA(1);
    local_44.SetBaseB(2);
    local_44.SetDerivedX(3);
    FAutoDeltaInheritDerivedAS local_50 = local_44;
    UnitTest.AssertEquals(1, local_50.GetBaseA(), "INH4: copy ctor base prop A");
    UnitTest.AssertEquals(2, local_50.GetBaseB(), "INH4: copy ctor base prop B");
    UnitTest.AssertEquals(3, local_50.GetDerivedX(), "INH4: copy ctor derived prop");
    FAutoDeltaInheritDerivedAS local_56;
    local_56 = local_44;
    UnitTest.AssertEquals(1, local_56.GetBaseA(), "INH4: opAssign base prop A");
    UnitTest.AssertEquals(3, local_56.GetDerivedX(), "INH4: opAssign derived prop");
    FAutoDeltaInheritMixedHolderAS local_74;
    AutoDelta::InitDirtyFlags(local_74);
    AutoDelta::ClearDirtyFlags(local_74);
    local_74.GetChild().SetBaseA(1);
    local_74.GetChild().SetMidValue(2);
    local_74.GetChild().SetChildValue(3);
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_74, 0), "INH5: Child.BaseA -> root idx 0");
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_74, 2), "INH5: Child.MidValue -> root idx 2");
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_74, 3), "INH5: Child.ChildValue -> root idx 3");
    UnitTest.AssertFalse(AutoDelta::IsDirty(local_74, 4), "INH5: must not touch FromCpp seg");
    AutoDelta::InitDirtyFlags(local_74);
    AutoDelta::ClearDirtyFlags(local_74);
    local_74.GetFromCpp().SetBaseA(10);
    local_74.GetFromCpp().SetScriptValue(40);
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_74, 4), "INH6: FromCpp.BaseA (C++ base) -> root idx 4");
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_74, 7), "INH6: FromCpp.ScriptValue (AS derived) -> root idx 7");
    UnitTest.AssertFalse(AutoDelta::IsDirty(local_74, 0), "INH6: must not bleed to Child seg");
    FAutoDeltaInheritMixedHolderAS local_92;
    AutoDelta::InitDirtyFlags(local_74);
    AutoDelta::InitDirtyFlags(local_92);
    AutoDelta::ClearDirtyFlags(local_74);
    AutoDelta::ClearDirtyFlags(local_92);
    local_92.GetChild().SetBaseB(-5);
    local_92.GetFromCpp().SetBaseC(-6);
    AutoDelta::ClearDirtyFlags(local_92);
    local_74.GetChild().SetBaseA(1);
    local_74.GetChild().SetChildValue(4);
    local_74.GetFromCpp().SetScriptValue(7);
    local_74.SetRootTail(8);
    AutoDelta::DummyNetSerialize(local_74, local_92, FAutoDeltaInheritMixedHolderAS);
    UnitTest.AssertEquals(1, local_92.GetChild().GetBaseA(), "INH7: multi-level base prop synced");
    UnitTest.AssertEquals(4, local_92.GetChild().GetChildValue(), "INH7: multi-level child prop synced");
    UnitTest.AssertEquals(7, local_92.GetFromCpp().GetScriptValue(), "INH7: cpp-base AS derived prop synced");
    UnitTest.AssertEquals(8, local_92.GetRootTail(), "INH7: root tail synced");
    UnitTest.AssertEquals(-5, local_92.GetChild().GetBaseB(), "INH7: unchanged preserved local (Child.BaseB)");
    UnitTest.AssertEquals(-6, local_92.GetFromCpp().GetBaseC(), "INH7: unchanged preserved local (FromCpp.BaseC)");
    AutoDelta::InitDirtyFlags(local_16);
    AutoDelta::ClearDirtyFlags(local_16);
    local_16.GetNested().SetBaseA(5);
    UnitTest.AssertFalse(AutoDelta::IsNoDirty(local_16.GetNested()), "INH8: nested dirty before clear");
    AutoDelta::ClearDirtyFlags(local_16);
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(local_16), "INH8: root clean after clear");
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(local_16.GetNested()), "INH8: nested cascade-cleared");
    AutoDelta::InitDirtyFlags(local_34);
    AutoDelta::ClearDirtyFlags(local_34);
    local_34.GetFlatten().SetDerivedX(42);
    UnitTest.AssertFalse(AutoDelta::IsNoDirty(local_34.GetFlatten()), "RISK1: Flattenе­ђж•°жЌ®и„Џдє†жґѕз”џе±ћжЂ§пјЊIsNoDirtyеє”иї”е›ћfalse");
    AutoDelta::InitDirtyFlags(local_16);
    AutoDelta::ClearDirtyFlags(local_16);
    local_16.GetFlatten().SetDerivedX(0);
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(local_16), "INH11: same-value write must not dirty");
    local_16.GetFlatten().SetBaseA(0);
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(local_16), "INH11: base same-value also clean");
    AutoDelta::InitDirtyFlags(local_34);
    AutoDelta::ClearDirtyFlags(local_34);
    local_34.GetFlatten().SetBaseA(11);
    local_34.GetFlatten().SetDerivedX(22);
    local_34.SetRootValue(99);
    local_34.GetNested().SetBaseA(33);
    UnitTest.AssertFalse(AutoDelta::IsNoDirty(local_34.GetFlatten()), "INH12: Flatten dirty before clear");
    UnitTest.AssertFalse(AutoDelta::IsNoDirty(local_34), "INH12: root dirty before clear");
    AutoDelta::ClearDirtyFlags(local_34.GetFlatten());
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(local_34.GetFlatten()), "INH12: Flatten clean after direct clear");
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_34, 4), "INH12: RootValue(idx=4) still dirty after clearing Flatten");
    UnitTest.AssertFalse(AutoDelta::IsNoDirty(local_34.GetNested()), "INH12: Nested still dirty after clearing Flatten");
    AutoDelta::InitDirtyFlags(local_16);
    AutoDelta::InitDirtyFlags(local_34);
    AutoDelta::ClearDirtyFlags(local_16);
    AutoDelta::ClearDirtyFlags(local_34);
    local_34.GetNested().SetBaseB(-1);
    local_34.GetNested().SetDerivedX(-2);
    AutoDelta::ClearDirtyFlags(local_34);
    local_16.GetNested().SetBaseA(50);
    local_16.GetNested().SetDerivedX(60);
    AutoDelta::DummyNetSerialize(local_16, local_34, FAutoDeltaInheritRootHolderAS);
    UnitTest.AssertEquals(50, local_34.GetNested().GetBaseA(), "INH13: Nested base prop synced");
    UnitTest.AssertEquals(60, local_34.GetNested().GetDerivedX(), "INH13: Nested derived prop synced");
    UnitTest.AssertEquals(-1, local_34.GetNested().GetBaseB(), "INH13: Nested unchanged preserved");
    FMultiLevelNestedHolderAS local_112;
    AutoDelta::InitDirtyFlags(local_112);
    AutoDelta::ClearDirtyFlags(local_112);
    local_112.GetNestedChild().SetBaseA(1);
    local_112.GetNestedChild().SetMidValue(2);
    local_112.GetNestedChild().SetChildValue(3);
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_112, 4), "INH14: NestedChild -> root slot 4");
    UnitTest.AssertFalse(AutoDelta::IsDirty(local_112, 0), "INH14: NestedChild not bleed to FlattenChild");
    UnitTest.AssertTrue((AutoDelta::IsDirty(local_112.GetNestedChild(), 0)), "INH14: Nested own bitmap idx 0 = BaseA");
    UnitTest.AssertTrue((AutoDelta::IsDirty(local_112.GetNestedChild(), 2)), "INH14: Nested own bitmap idx 2 = MidValue");
    UnitTest.AssertTrue((AutoDelta::IsDirty(local_112.GetNestedChild(), 3)), "INH14: Nested own bitmap idx 3 = ChildValue");
    UnitTest.AssertFalse(AutoDelta::IsDirty(local_112.GetNestedChild(), 1), "INH14: Nested BaseB untouched");
    AutoDelta::InitDirtyFlags(local_34);
    int local_113 = 0;
    for (; local_113 < 3; )
    {
        AutoDelta::ClearDirtyFlags(local_34);
        UnitTest.AssertTrue(AutoDelta::IsNoDirty(local_34), "INH15: clean at cycle start");
        local_34.GetFlatten().SetBaseA(local_113 + 1);
        local_34.GetFlatten().SetDerivedX(local_113 + 10);
        UnitTest.AssertTrue(AutoDelta::IsDirty(local_34, 0), "INH15: BaseA dirty in cycle");
        UnitTest.AssertTrue(AutoDelta::IsDirty(local_34, 2), "INH15: DerivedX dirty in cycle");
        ++local_113;
    }
    FInheritNameHolderAS local_126;
    AutoDelta::InitDirtyFlags(local_126);
    AutoDelta::ClearDirtyFlags(local_126);
    local_126.GetNameData().SetBaseName(n"TestBase");
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_126, 0), "INH16: base FName dirty -> root idx 0");
    local_126.GetNameData().SetDerivedName(n"TestDerived");
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_126, 2), "INH16: derived FName dirty -> root idx 2");
    AutoDelta::ClearDirtyFlags(local_126);
    local_126.GetNameData().SetDerivedName(n"TestDerived");
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(local_126), "INH16: same FName no dirty");
    FAutoDeltaInheritEmptyDerivedAS local_130;
    local_130.SetBaseA(42);
    local_130.SetBaseB(99);
    FAutoDeltaInheritEmptyDerivedAS local_134 = local_130;
    UnitTest.AssertEquals(42, local_134.GetBaseA(), "INH17: empty derived copy base prop A");
    UnitTest.AssertEquals(99, local_134.GetBaseB(), "INH17: empty derived copy base prop B");
    FInheritCapHolderAS local_172;
    AutoDelta::InitDirtyFlags(local_172);
    AutoDelta::ClearDirtyFlags(local_172);
    local_172.GetCapData().SetB0(1);
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_172, 0), "INH18: first bit (B0) dirty");
    local_172.GetCapData().SetD21(999);
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_172, 31), "INH18: last bit (D21 idx=31) dirty");
    AutoDelta::ClearDirtyFlags(local_172);
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(local_172), "INH18: all clean after clear at capacity boundary");
    FInheritCapHolderAS local_210;
    FInheritCapHolderAS local_248;
    AutoDelta::InitDirtyFlags(local_210);
    AutoDelta::InitDirtyFlags(local_248);
    AutoDelta::ClearDirtyFlags(local_210);
    AutoDelta::ClearDirtyFlags(local_248);
    local_210.GetCapData().SetB0(1);
    local_210.GetCapData().SetD21(999);
    local_210.SetCapTail(777);
    AutoDelta::DummyNetSerialize(local_210, local_248, FInheritCapHolderAS);
    UnitTest.AssertEquals(1, local_248.GetCapData().GetB0(), "INH18: first base prop synced");
    UnitTest.AssertEquals(999, local_248.GetCapData().GetD21(), "INH18: last derived prop synced");
    UnitTest.AssertEquals(777, local_248.GetCapTail(), "INH18: root tail synced");
    FCppNestedHolderAS local_264;
    AutoDelta::InitDirtyFlags(local_264);
    AutoDelta::ClearDirtyFlags(local_264);
    local_264.GetNestedCpp().SetBaseA(10);
    local_264.GetNestedCpp().SetScriptValue(40);
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_264, 4), "INH19: NestedCpp -> root slot 4");
    UnitTest.AssertFalse(AutoDelta::IsDirty(local_264, 0), "INH19: NestedCpp not bleed to FlattenCpp");
    UnitTest.AssertTrue((AutoDelta::IsDirty(local_264.GetNestedCpp(), 0)), "INH19: Nested own idx 0 = BaseA");
    UnitTest.AssertTrue((AutoDelta::IsDirty(local_264.GetNestedCpp(), 3)), "INH19: Nested own idx 3 = ScriptValue");
    UnitTest.AssertFalse(AutoDelta::IsDirty(local_264.GetNestedCpp(), 1), "INH19: Nested BaseB untouched");
    FCppNestedHolderAS local_280;
    FCppNestedHolderAS local_296;
    AutoDelta::InitDirtyFlags(local_280);
    AutoDelta::InitDirtyFlags(local_296);
    AutoDelta::ClearDirtyFlags(local_280);
    AutoDelta::ClearDirtyFlags(local_296);
    local_296.GetNestedCpp().SetBaseB(-1);
    AutoDelta::ClearDirtyFlags(local_296);
    local_280.GetNestedCpp().SetBaseA(10);
    local_280.GetNestedCpp().SetScriptValue(40);
    AutoDelta::DummyNetSerialize(local_280, local_296, FCppNestedHolderAS);
    UnitTest.AssertEquals(10, local_296.GetNestedCpp().GetBaseA(), "INH19: Nested C++ base prop synced");
    UnitTest.AssertEquals(40, local_296.GetNestedCpp().GetScriptValue(), "INH19: Nested AS derived prop synced");
    UnitTest.AssertEquals(-1, local_296.GetNestedCpp().GetBaseB(), "INH19: Nested unchanged preserved");
    FMultiLevelNestedHolderAS local_316;
    AutoDelta::InitDirtyFlags(local_112);
    AutoDelta::InitDirtyFlags(local_316);
    AutoDelta::ClearDirtyFlags(local_112);
    AutoDelta::ClearDirtyFlags(local_316);
    local_316.GetNestedChild().SetBaseB(-1);
    local_316.GetNestedChild().SetMidValue(-2);
    AutoDelta::ClearDirtyFlags(local_316);
    local_112.GetNestedChild().SetBaseA(100);
    local_112.GetNestedChild().SetChildValue(400);
    AutoDelta::DummyNetSerialize(local_112, local_316, FMultiLevelNestedHolderAS);
    UnitTest.AssertEquals(100, local_316.GetNestedChild().GetBaseA(), "INH20: Nested multi-level base synced");
    UnitTest.AssertEquals(400, local_316.GetNestedChild().GetChildValue(), "INH20: Nested multi-level child synced");
    UnitTest.AssertEquals(-1, local_316.GetNestedChild().GetBaseB(), "INH20: Nested unchanged BaseB preserved");
    UnitTest.AssertEquals(-2, local_316.GetNestedChild().GetMidValue(), "INH20: Nested unchanged MidValue preserved");
    AutoDelta::InitDirtyFlags(local_16);
    AutoDelta::ClearDirtyFlags(local_16);
    local_16.GetNested().SetBaseA(11);
    local_16.GetNested().SetDerivedX(22);
    local_16.GetFlatten().SetBaseA(33);
    local_16.SetRootValue(99);
    UnitTest.AssertFalse(AutoDelta::IsNoDirty(local_16.GetNested()), "INH21: Nested dirty before clear");
    AutoDelta::ClearDirtyFlags(local_16.GetNested());
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(local_16.GetNested()), "INH21: Nested clean after direct clear");
    UnitTest.AssertFalse(AutoDelta::IsNoDirty(local_16.GetFlatten()), "INH21: Flatten still dirty after clearing Nested");
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_16, 4), "INH21: RootValue(idx=4) still dirty after clearing Nested");
    AutoDelta::InitDirtyFlags(local_34);
    AutoDelta::InitDirtyFlags(local_16);
    AutoDelta::ClearDirtyFlags(local_34);
    AutoDelta::ClearDirtyFlags(local_16);
    local_16.GetFlatten().SetBaseB(-1);
    local_16.GetNested().SetBaseB(-2);
    AutoDelta::ClearDirtyFlags(local_16);
    local_34.GetFlatten().SetBaseA(10);
    local_34.GetFlatten().SetDerivedX(20);
    local_34.GetNested().SetBaseA(30);
    local_34.GetNested().SetDerivedX(40);
    local_34.SetRootValue(50);
    AutoDelta::DummyNetSerialize(local_34, local_16, FAutoDeltaInheritRootHolderAS);
    UnitTest.AssertEquals(10, local_16.GetFlatten().GetBaseA(), "INH22: Flatten base synced");
    UnitTest.AssertEquals(20, local_16.GetFlatten().GetDerivedX(), "INH22: Flatten derived synced");
    UnitTest.AssertEquals(30, local_16.GetNested().GetBaseA(), "INH22: Nested base synced");
    UnitTest.AssertEquals(40, local_16.GetNested().GetDerivedX(), "INH22: Nested derived synced");
    UnitTest.AssertEquals(50, local_16.GetRootValue(), "INH22: root value synced");
    UnitTest.AssertEquals(-1, local_16.GetFlatten().GetBaseB(), "INH22: Flatten unchanged preserved");
    UnitTest.AssertEquals(-2, local_16.GetNested().GetBaseB(), "INH22: Nested unchanged preserved");
    AutoDelta::InitDirtyFlags(local_16);
    AutoDelta::InitDirtyFlags(local_34);
    AutoDelta::ClearDirtyFlags(local_16);
    AutoDelta::ClearDirtyFlags(local_34);
    local_34.GetNested().SetBaseA(-10);
    local_34.GetNested().SetDerivedX(-20);
    AutoDelta::ClearDirtyFlags(local_34);
    local_16.GetNested().SetBaseA(11);
    local_16.GetNested().SetDerivedX(22);
    AutoDelta::ClearDirtyFlags(local_16.GetNested());
    local_16.GetNested().SetBaseB(33);
    AutoDelta::DummyNetSerialize(local_16, local_34, FAutoDeltaInheritRootHolderAS);
    UnitTest.AssertEquals(33, local_34.GetNested().GetBaseB(), "INH23: re-dirtied BaseB synced");
    UnitTest.AssertEquals(-10, local_34.GetNested().GetBaseA(), "INH23: cleared BaseA preserved");
    UnitTest.AssertEquals(-20, local_34.GetNested().GetDerivedX(), "INH23: cleared DerivedX preserved");
    AutoDelta::InitDirtyFlags(local_34);
    AutoDelta::ClearDirtyFlags(local_34);
    AutoDelta::SetAllDirty(local_34.GetNested());
    int local_113_2 = 0;
    for (; local_113_2 < 3; )
    {
        UnitTest.AssertTrue(AutoDelta::IsDirty(local_34.GetNested(), local_113_2), (FString("INH24-1: Nested SetAllDirty bit ") + local_113_2));
        ++local_113_2;
    }
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_34, 3), "INH24-1: Nested slot propagated to root");
    AutoDelta::ClearDirtyFlags(local_34);
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(local_34.GetNested()), "INH24-1: clean after clear");
    AutoDelta::SetAllDirty(local_34.GetFlatten());
    int local_113_3 = 0;
    for (; local_113_3 < 3; )
    {
        UnitTest.AssertTrue(AutoDelta::IsDirty(local_34, local_113_3), (FString("INH24-2: Flatten SetAllDirty -> root bit ") + local_113_3));
        ++local_113_3;
    }
    UnitTest.AssertFalse(AutoDelta::IsDirty(local_34, 3), "INH24-2: must not touch Nested slot");
    UnitTest.AssertFalse(AutoDelta::IsDirty(local_34, 4), "INH24-2: must not touch RootValue");
    FInheritHolder64AS local_336;
    AutoDelta::InitDirtyFlags(local_336);
    AutoDelta::ClearDirtyFlags(local_336);
    local_336.GetData().SetBase64A(10);
    local_336.GetData().SetDerived64X(20);
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_336, 0), "INH25: Base64A idx 0");
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_336, 2), "INH25: Derived64X idx 2");
    UnitTest.AssertFalse(AutoDelta::IsDirty(local_336, 1), "INH25: Base64B untouched");
    AutoDelta::ClearDirtyFlags(local_336);
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(local_336), "INH25: clean after clear");
    FInheritHolder64AS local_348;
    FInheritHolder64AS local_360;
    AutoDelta::InitDirtyFlags(local_348);
    AutoDelta::InitDirtyFlags(local_360);
    AutoDelta::ClearDirtyFlags(local_348);
    AutoDelta::ClearDirtyFlags(local_360);
    local_348.GetData().SetBase64A(10);
    local_348.GetData().SetDerived64X(20);
    local_348.SetTail(99);
    AutoDelta::DummyNetSerialize(local_348, local_360, FInheritHolder64AS);
    UnitTest.AssertEquals(10, local_360.GetData().GetBase64A(), "INH25: RT base synced");
    UnitTest.AssertEquals(20, local_360.GetData().GetDerived64X(), "INH25: RT derived synced");
    UnitTest.AssertEquals(99, local_360.GetTail(), "INH25: RT tail synced");
    FInheritHolder96AS local_372;
    AutoDelta::InitDirtyFlags(local_372);
    AutoDelta::ClearDirtyFlags(local_372);
    local_372.GetData().SetBase96A(10);
    local_372.GetData().SetDerived96X(20);
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_372, 0), "INH26: Base96A idx 0");
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_372, 2), "INH26: Derived96X idx 2");
    UnitTest.AssertFalse(AutoDelta::IsDirty(local_372, 1), "INH26: Base96B untouched");
    AutoDelta::ClearDirtyFlags(local_372);
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(local_372), "INH26: clean after clear");
    FInheritHolder96AS local_384;
    FInheritHolder96AS local_396;
    AutoDelta::InitDirtyFlags(local_384);
    AutoDelta::InitDirtyFlags(local_396);
    AutoDelta::ClearDirtyFlags(local_384);
    AutoDelta::ClearDirtyFlags(local_396);
    local_384.GetData().SetBase96A(10);
    local_384.GetData().SetDerived96X(20);
    local_384.SetTail(88);
    AutoDelta::DummyNetSerialize(local_384, local_396, FInheritHolder96AS);
    UnitTest.AssertEquals(10, local_396.GetData().GetBase96A(), "INH26: RT base synced");
    UnitTest.AssertEquals(20, local_396.GetData().GetDerived96X(), "INH26: RT derived synced");
    UnitTest.AssertEquals(88, local_396.GetTail(), "INH26: RT tail synced");
    return;
}
void Test_AutoDeltaRisk2(FUnitTest &inout UnitTest)
{
    FRootForRisk2TestAS local_32;
    AutoDelta::InitDirtyFlags(local_32);
    AutoDelta::ClearDirtyFlags(local_32);
    local_32.GetFlatten().GetDerivedSub().SetSubVal1(100);
    UnitTest.AssertFalse(AutoDelta::IsNoDirty(local_32), "RISK2-Init: DerivedSub.SubVal1 и„Џ в†’ root дёЌе№Іе‡Ђ");
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_32, 5), "RISK2-Init: DerivedSub.SubVal1 в†’ root idx 5");
    AutoDelta::InitDirtyFlags(local_32);
    AutoDelta::ClearDirtyFlags(local_32);
    local_32.GetNested().GetDerivedSub().SetSubVal2(200);
    UnitTest.AssertFalse(AutoDelta::IsNoDirty(local_32.GetNested()), "RISK2-Clear: Nested и„Џ");
    AutoDelta::ClearDirtyFlags(local_32);
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(local_32.GetNested()), "RISK2-Clear: Nested cascade clear еђЋеє”е№Іе‡Ђ");
    local_32.GetFlatten().GetBaseSub().SetSubVal3(300);
    AutoDelta::ClearDirtyFlags(local_32);
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(local_32), "RISK2-Clear: BaseSub жё…зђ†еђЋ root еє”е№Іе‡Ђ");
    FRootForRisk2TestAS local_66;
    AutoDelta::InitDirtyFlags(local_32);
    AutoDelta::InitDirtyFlags(local_66);
    AutoDelta::ClearDirtyFlags(local_32);
    AutoDelta::ClearDirtyFlags(local_66);
    local_66.GetFlatten().GetDerivedSub().SetSubVal2(-2);
    AutoDelta::ClearDirtyFlags(local_66);
    local_32.GetFlatten().GetDerivedSub().SetSubVal1(111);
    local_32.GetFlatten().GetBaseSub().SetSubVal1(222);
    local_32.SetRootVal(333);
    int local_67 = 0;
    int local_67_2 = AutoDelta::DummyNetSerialize(local_32, local_66, FRootForRisk2TestAS);
    UnitTest.AssertEquals(111, local_66.GetFlatten().GetDerivedSub().GetSubVal1(), "RISK2-RT: derived sub-data synced");
    UnitTest.AssertEquals(222, local_66.GetFlatten().GetBaseSub().GetSubVal1(), "RISK2-RT: base sub-data synced");
    UnitTest.AssertEquals(333, local_66.GetRootVal(), "RISK2-RT: root val synced");
    UnitTest.AssertEquals(-2, local_66.GetFlatten().GetDerivedSub().GetSubVal2(), "RISK2-RT: жњЄи„Џе±ћжЂ§дїќз•™жњ¬ењ°еЂј");
    AutoDelta::InitDirtyFlags(local_66);
    AutoDelta::InitDirtyFlags(local_32);
    AutoDelta::ClearDirtyFlags(local_66);
    AutoDelta::ClearDirtyFlags(local_32);
    local_32.GetNested().GetDerivedSub().SetSubVal1(-10);
    AutoDelta::ClearDirtyFlags(local_32);
    local_66.GetNested().GetDerivedSub().SetSubVal2(500);
    local_66.GetNested().GetBaseSub().SetSubVal3(600);
    int local_67_3 = 0;
    int local_67_4 = AutoDelta::DummyNetSerialize(local_66, local_32, FRootForRisk2TestAS);
    UnitTest.AssertEquals(500, local_32.GetNested().GetDerivedSub().GetSubVal2(), "RISK2-NestRT: nested derived sub-data synced");
    UnitTest.AssertEquals(600, local_32.GetNested().GetBaseSub().GetSubVal3(), "RISK2-NestRT: nested base sub-data synced");
    UnitTest.AssertEquals(-10, local_32.GetNested().GetDerivedSub().GetSubVal1(), "RISK2-NestRT: nested unchanged preserved");
    return;
}
void Test_AutoDeltaRisk3(FUnitTest &inout UnitTest)
{
    FRootWithNestedSubHolderAS local_32;
    AutoDelta::InitDirtyFlags(local_32);
    AutoDelta::ClearDirtyFlags(local_32);
    local_32.GetSubFlatten().GetBaseNested().SetSubVal1(100);
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_32, 1), "RISK3-Init: BaseNested slot idx 1 dirty");
    UnitTest.AssertFalse(AutoDelta::IsDirty(local_32, 3), "RISK3-Init: DerivedNested not touched");
    local_32.GetSubFlatten().GetDerivedNested().SetSubVal1(200);
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_32, 3), "RISK3-Init: DerivedNested slot idx 3 dirty");
    AutoDelta::InitDirtyFlags(local_32);
    AutoDelta::ClearDirtyFlags(local_32);
    local_32.GetSubFlatten().GetBaseNested().SetSubVal1(100);
    local_32.GetSubFlatten().GetDerivedNested().SetSubVal2(200);
    AutoDelta::ClearDirtyFlags(local_32);
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(local_32), "RISK3-Clear: root clean after cascade clear");
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(local_32.GetSubFlatten().GetBaseNested()), "RISK3-Clear: BaseNested cascade-cleared");
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(local_32.GetSubFlatten().GetDerivedNested()), "RISK3-Clear: DerivedNested cascade-cleared");
    FRootWithNestedSubHolderAS local_66;
    AutoDelta::InitDirtyFlags(local_32);
    AutoDelta::InitDirtyFlags(local_66);
    AutoDelta::ClearDirtyFlags(local_32);
    AutoDelta::ClearDirtyFlags(local_66);
    local_32.GetSubNested().GetBaseNested().SetSubVal1(111);
    local_32.GetSubNested().GetDerivedNested().SetSubVal2(222);
    local_32.SetHolderVal(333);
    AutoDelta::DummyNetSerialize(local_32, local_66, FRootWithNestedSubHolderAS);
    UnitTest.AssertEquals(111, local_66.GetSubNested().GetBaseNested().GetSubVal1(), "RISK3-RT: base nested synced");
    UnitTest.AssertEquals(222, local_66.GetSubNested().GetDerivedNested().GetSubVal2(), "RISK3-RT: derived nested synced");
    UnitTest.AssertEquals(333, local_66.GetHolderVal(), "RISK3-RT: holder val synced");
    return;
}
void Test_AutoDeltaCopyCtorSafety(FUnitTest &inout UnitTest)
{
    FAutoDeltaInheritDerivedAS local_6;
    local_6.SetBaseA(10);
    local_6.SetBaseB(20);
    local_6.SetDerivedX(30);
    FAutoDeltaInheritDerivedAS local_14 = local_6;
    UnitTest.AssertEquals(10, local_14.GetBaseA(), "CC-A1: base A");
    UnitTest.AssertEquals(20, local_14.GetBaseB(), "CC-A1: base B");
    UnitTest.AssertEquals(30, local_14.GetDerivedX(), "CC-A1: derived X");
    FAutoDeltaInheritChildAS local_24;
    local_24.SetBaseA(1);
    local_24.SetBaseB(2);
    local_24.SetMidValue(3);
    local_24.SetChildValue(4);
    FAutoDeltaInheritChildAS local_32 = local_24;
    UnitTest.AssertEquals(1, local_32.GetBaseA(), "CC-A2: base A");
    UnitTest.AssertEquals(2, local_32.GetBaseB(), "CC-A2: base B");
    UnitTest.AssertEquals(3, local_32.GetMidValue(), "CC-A2: mid");
    UnitTest.AssertEquals(4, local_32.GetChildValue(), "CC-A2: child");
    FAutoDeltaInheritFromCppAS local_38;
    local_38.SetBaseA(10);
    local_38.SetBaseB(20);
    local_38.SetBaseC(30);
    local_38.SetScriptValue(40);
    FAutoDeltaInheritFromCppAS local_44 = local_38;
    UnitTest.AssertEquals(10, local_44.GetBaseA(), "CC-A3: cpp A");
    UnitTest.AssertEquals(30, local_44.GetBaseC(), "CC-A3: cpp C");
    UnitTest.AssertEquals(40, local_44.GetScriptValue(), "CC-A3: script");
    FInheritDerivedWithNameAS local_52;
    local_52.SetBaseName(n"TestBase");
    local_52.SetBaseInt(42);
    local_52.SetDerivedName(n"TestDerived");
    FInheritDerivedWithNameAS local_60 = local_52;
    UnitTest.AssertEquals(n"TestBase", local_60.GetBaseName(), "CC-A4: base name");
    UnitTest.AssertEquals(42, local_60.GetBaseInt(), "CC-A4: base int");
    UnitTest.AssertEquals(n"TestDerived", local_60.GetDerivedName(), "CC-A4: derived name");
    FAutoDeltaInheritEmptyDerivedAS local_66;
    local_66.SetBaseA(99);
    local_66.SetBaseB(88);
    FAutoDeltaInheritEmptyDerivedAS local_70 = local_66;
    UnitTest.AssertEquals(99, local_70.GetBaseA(), "CC-A5: empty A");
    UnitTest.AssertEquals(88, local_70.GetBaseB(), "CC-A5: empty B");
    FInheritCapDerivedAS local_104;
    local_104.SetB0(1);
    local_104.SetD21(999);
    FInheritCapDerivedAS local_138 = local_104;
    UnitTest.AssertEquals(1, local_138.GetB0(), "CC-A6: first");
    UnitTest.AssertEquals(999, local_138.GetD21(), "CC-A6: last");
    FAutoDeltaInheritRootHolderAS local_154;
    AutoDelta::InitDirtyFlags(local_154);
    local_154.GetFlatten().SetBaseA(10);
    local_154.GetFlatten().SetDerivedX(20);
    local_154.GetNested().SetBaseA(30);
    local_154.SetRootValue(40);
    FAutoDeltaInheritRootHolderAS local_170 = local_154;
    UnitTest.AssertEquals(10, local_170.GetFlatten().GetBaseA(), "CC-B1: flatten base A");
    UnitTest.AssertEquals(20, local_170.GetFlatten().GetDerivedX(), "CC-B1: flatten derived X");
    UnitTest.AssertEquals(30, local_170.GetNested().GetBaseA(), "CC-B1: nested base A");
    UnitTest.AssertEquals(40, local_170.GetRootValue(), "CC-B1: root val");
    AutoDelta::InitDirtyFlags(local_170);
    AutoDelta::ClearDirtyFlags(local_170);
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(local_170), "CC-B1: clean after copy+init+clear");
    local_170.GetFlatten().SetBaseA(99);
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_170, 0), "CC-B1: tracking works post-copy");
    AutoDelta::InitDirtyFlags(local_170);
    AutoDelta::ClearDirtyFlags(local_170);
    local_170.SetRootValue(200);
    local_154 = local_170;
    UnitTest.AssertFalse(AutoDelta::IsDirty(local_154, 4), "CC-B2: root simple prop NOT dirty by copy ctor");
    FAutoDeltaInheritMixedHolderAS local_190;
    AutoDelta::InitDirtyFlags(local_190);
    local_190.GetChild().SetBaseA(1);
    local_190.GetChild().SetChildValue(4);
    local_190.GetFromCpp().SetScriptValue(40);
    local_190.SetRootTail(99);
    FAutoDeltaInheritMixedHolderAS local_208;
    UnitTest.AssertEquals(1, local_208.GetChild().GetBaseA(), "CC-B3: child base A");
    UnitTest.AssertEquals(4, local_208.GetChild().GetChildValue(), "CC-B3: child val");
    UnitTest.AssertEquals(40, local_208.GetFromCpp().GetScriptValue(), "CC-B3: cpp script");
    UnitTest.AssertEquals(99, local_208.GetRootTail(), "CC-B3: root tail");
    UnitTest.AssertFalse(AutoDelta::IsDirty(local_208, 8), "CC-B3: root simple prop NOT dirty by copy ctor");
    AutoDelta::InitDirtyFlags(local_170);
    local_170.GetFlatten().SetBaseA(10);
    local_170.SetRootValue(30);
    AutoDelta::InitDirtyFlags(local_154);
    AutoDelta::ClearDirtyFlags(local_154);
    local_154 = local_170;
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_154, 0), "CC-C1: BaseA dirty");
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_154, 4), "CC-C1: RootValue dirty");
    UnitTest.AssertFalse(AutoDelta::IsDirty(local_154, 1), "CC-C1: BaseB not dirty");
    AutoDelta::InitDirtyFlags(local_154);
    AutoDelta::InitDirtyFlags(local_170);
    AutoDelta::ClearDirtyFlags(local_170);
    FAutoDeltaInheritRootHolderAS local_170_2 = local_154;
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(local_170_2), "CC-C2: same-value no dirty");
    AutoDelta::InitDirtyFlags(local_170_2);
    local_170_2.GetFlatten().SetBaseA(10);
    AutoDelta::InitDirtyFlags(local_154);
    local_154.GetFlatten().SetBaseA(10);
    local_154.GetFlatten().SetDerivedX(99);
    AutoDelta::ClearDirtyFlags(local_154);
    local_154 = local_170_2;
    UnitTest.AssertFalse(AutoDelta::IsDirty(local_154, 0), "CC-C3: same BaseA not dirty");
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_154, 2), "CC-C3: changed DerivedX dirty");
    AutoDelta::InitDirtyFlags(local_154);
    AutoDelta::InitDirtyFlags(local_170_2);
    AutoDelta::ClearDirtyFlags(local_154);
    AutoDelta::ClearDirtyFlags(local_170_2);
    FAutoDeltaInheritRootHolderAS local_224;
    AutoDelta::InitDirtyFlags(local_224);
    local_224.GetFlatten().SetBaseA(10);
    local_224.GetFlatten().SetDerivedX(20);
    local_224.SetRootValue(30);
    AutoDelta::DummyNetSerialize(local_224, local_170_2, FAutoDeltaInheritRootHolderAS);
    UnitTest.AssertEquals(10, local_170_2.GetFlatten().GetBaseA(), "CC-C4: RT base A");
    UnitTest.AssertEquals(20, local_170_2.GetFlatten().GetDerivedX(), "CC-C4: RT derived X");
    UnitTest.AssertEquals(30, local_170_2.GetRootValue(), "CC-C4: RT root val");
    return;
}
namespace AutoDelta
{
FSubDirtyFlags40 GetDirtyFlags(FAutoDeltaInheritBaseAS &inout Data)
{
    FSubDirtyFlags40 __r;
    return __r;
}
void ClearDirtyFlags(FAutoDeltaInheritBaseAS &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FAutoDeltaInheritBaseAS
{
int __IndexOf_BaseA()
{
    return 0;
}
int __IndexOf_BaseB()
{
    return 1;
}
}
namespace AutoDelta
{
FSubDirtyFlags40& GetDirtyFlags(FAutoDeltaInheritDerivedAS &inout Data)
{
    return Data.__GetSharedDirtyFlags();
}
void ClearDirtyFlags(FAutoDeltaInheritDerivedAS &inout Data)
{
    Data.__ClearOwnChildren_FAutoDeltaInheritDerivedAS(false);
    Data.__ClearAllDirtyFlags();
    if (!(Data.__GetSharedDirtyFlags().IsBitmapOwner()))
    {
        int local_2 = 0;
        for (; local_2 < 3; )
        {
            Data.__GetSharedDirtyFlags().ClearDirty(local_2);
            ++local_2;
        }
    }
    return;
}
}
namespace FAutoDeltaInheritDerivedAS
{
int __IndexOf_DerivedX()
{
    return 2;
}
}
namespace AutoDelta
{
FSubDirtyFlags40& GetDirtyFlags(FAutoDeltaInheritMidAS &inout Data)
{
    return Data.__GetSharedDirtyFlags();
}
void ClearDirtyFlags(FAutoDeltaInheritMidAS &inout Data)
{
    Data.__ClearOwnChildren_FAutoDeltaInheritMidAS(false);
    Data.__ClearAllDirtyFlags();
    if (!(Data.__GetSharedDirtyFlags().IsBitmapOwner()))
    {
        int local_2 = 0;
        for (; local_2 < 3; )
        {
            Data.__GetSharedDirtyFlags().ClearDirty(local_2);
            ++local_2;
        }
    }
    return;
}
}
namespace FAutoDeltaInheritMidAS
{
int __IndexOf_MidValue()
{
    return 2;
}
}
namespace AutoDelta
{
FSubDirtyFlags40& GetDirtyFlags(FAutoDeltaInheritChildAS &inout Data)
{
    return Data.__GetSharedDirtyFlags();
}
void ClearDirtyFlags(FAutoDeltaInheritChildAS &inout Data)
{
    Data.__ClearOwnChildren_FAutoDeltaInheritChildAS(false);
    Data.__ClearAllDirtyFlags();
    if (!(Data.__GetSharedDirtyFlags().IsBitmapOwner()))
    {
        int local_2 = 0;
        for (; local_2 < 4; )
        {
            Data.__GetSharedDirtyFlags().ClearDirty(local_2);
            ++local_2;
        }
    }
    return;
}
}
namespace FAutoDeltaInheritChildAS
{
int __IndexOf_ChildValue()
{
    return 3;
}
}
namespace AutoDelta
{
FSubDirtyFlags40& GetDirtyFlags(FAutoDeltaInheritFromCppAS &inout Data)
{
    return Data.__GetSharedDirtyFlags();
}
void ClearDirtyFlags(FAutoDeltaInheritFromCppAS &inout Data)
{
    Data.__ClearOwnChildren_FAutoDeltaInheritFromCppAS(false);
    Data.__ClearAllDirtyFlags();
    if (!(Data.__GetSharedDirtyFlags().IsBitmapOwner()))
    {
        int local_2 = 0;
        for (; local_2 < 4; )
        {
            Data.__GetSharedDirtyFlags().ClearDirty(local_2);
            ++local_2;
        }
    }
    return;
}
}
namespace FAutoDeltaInheritFromCppAS
{
int __IndexOf_ScriptValue()
{
    return 3;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FAutoDeltaInheritRootHolderAS &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FAutoDeltaInheritRootHolderAS &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FAutoDeltaInheritRootHolderAS &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FAutoDeltaInheritRootHolderAS
{
int __IndexOf_Flatten()
{
    return 0;
}
int __IndexOf_Nested()
{
    return 3;
}
int __IndexOf_RootValue()
{
    return 4;
}
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FAutoDeltaInheritMixedHolderAS &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FAutoDeltaInheritMixedHolderAS &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FAutoDeltaInheritMixedHolderAS &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FAutoDeltaInheritMixedHolderAS
{
int __IndexOf_Child()
{
    return 0;
}
int __IndexOf_FromCpp()
{
    return 4;
}
int __IndexOf_RootTail()
{
    return 8;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FMultiLevelNestedHolderAS &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FMultiLevelNestedHolderAS &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FMultiLevelNestedHolderAS &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FMultiLevelNestedHolderAS
{
int __IndexOf_FlattenChild()
{
    return 0;
}
int __IndexOf_NestedChild()
{
    return 4;
}
int __IndexOf_HolderVal()
{
    return 5;
}
}
namespace AutoDelta
{
FSubDirtyFlags40& GetDirtyFlags(FAutoDeltaInheritEmptyDerivedAS &inout Data)
{
    return Data.__GetSharedDirtyFlags();
}
void ClearDirtyFlags(FAutoDeltaInheritEmptyDerivedAS &inout Data)
{
    Data.__ClearOwnChildren_FAutoDeltaInheritEmptyDerivedAS(false);
    Data.__ClearAllDirtyFlags();
    if (!(Data.__GetSharedDirtyFlags().IsBitmapOwner()))
    {
        int local_2 = 0;
        for (; local_2 < 2; )
        {
            Data.__GetSharedDirtyFlags().ClearDirty(local_2);
            ++local_2;
        }
    }
    return;
}
FSubDirtyFlags40 GetDirtyFlags(FInheritBaseWithNameAS &inout Data)
{
    FSubDirtyFlags40 __r;
    return __r;
}
void ClearDirtyFlags(FInheritBaseWithNameAS &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FInheritBaseWithNameAS
{
int __IndexOf_BaseName()
{
    return 0;
}
int __IndexOf_BaseInt()
{
    return 1;
}
}
namespace AutoDelta
{
FSubDirtyFlags40& GetDirtyFlags(FInheritDerivedWithNameAS &inout Data)
{
    return Data.__GetSharedDirtyFlags();
}
void ClearDirtyFlags(FInheritDerivedWithNameAS &inout Data)
{
    Data.__ClearOwnChildren_FInheritDerivedWithNameAS(false);
    Data.__ClearAllDirtyFlags();
    if (!(Data.__GetSharedDirtyFlags().IsBitmapOwner()))
    {
        int local_2 = 0;
        for (; local_2 < 3; )
        {
            Data.__GetSharedDirtyFlags().ClearDirty(local_2);
            ++local_2;
        }
    }
    return;
}
}
namespace FInheritDerivedWithNameAS
{
int __IndexOf_DerivedName()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FInheritNameHolderAS &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FInheritNameHolderAS &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FInheritNameHolderAS &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FInheritNameHolderAS
{
int __IndexOf_NameData()
{
    return 0;
}
int __IndexOf_Tail()
{
    return 3;
}
}
namespace AutoDelta
{
FSubDirtyFlags40 GetDirtyFlags(FInheritCapBaseAS &inout Data)
{
    FSubDirtyFlags40 __r;
    return __r;
}
void ClearDirtyFlags(FInheritCapBaseAS &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FInheritCapBaseAS
{
int __IndexOf_B0()
{
    return 0;
}
int __IndexOf_B1()
{
    return 1;
}
int __IndexOf_B2()
{
    return 2;
}
int __IndexOf_B3()
{
    return 3;
}
int __IndexOf_B4()
{
    return 4;
}
int __IndexOf_B5()
{
    return 5;
}
int __IndexOf_B6()
{
    return 6;
}
int __IndexOf_B7()
{
    return 7;
}
int __IndexOf_B8()
{
    return 8;
}
int __IndexOf_B9()
{
    return 9;
}
}
namespace AutoDelta
{
FSubDirtyFlags40& GetDirtyFlags(FInheritCapDerivedAS &inout Data)
{
    return Data.__GetSharedDirtyFlags();
}
void ClearDirtyFlags(FInheritCapDerivedAS &inout Data)
{
    Data.__ClearOwnChildren_FInheritCapDerivedAS(false);
    Data.__ClearAllDirtyFlags();
    if (!(Data.__GetSharedDirtyFlags().IsBitmapOwner()))
    {
        int local_2 = 0;
        for (; local_2 < 32; )
        {
            Data.__GetSharedDirtyFlags().ClearDirty(local_2);
            ++local_2;
        }
    }
    return;
}
}
namespace FInheritCapDerivedAS
{
int __IndexOf_D0()
{
    return 10;
}
int __IndexOf_D1()
{
    return 11;
}
int __IndexOf_D2()
{
    return 12;
}
int __IndexOf_D3()
{
    return 13;
}
int __IndexOf_D4()
{
    return 14;
}
int __IndexOf_D5()
{
    return 15;
}
int __IndexOf_D6()
{
    return 16;
}
int __IndexOf_D7()
{
    return 17;
}
int __IndexOf_D8()
{
    return 18;
}
int __IndexOf_D9()
{
    return 19;
}
int __IndexOf_D10()
{
    return 20;
}
int __IndexOf_D11()
{
    return 21;
}
int __IndexOf_D12()
{
    return 22;
}
int __IndexOf_D13()
{
    return 23;
}
int __IndexOf_D14()
{
    return 24;
}
int __IndexOf_D15()
{
    return 25;
}
int __IndexOf_D16()
{
    return 26;
}
int __IndexOf_D17()
{
    return 27;
}
int __IndexOf_D18()
{
    return 28;
}
int __IndexOf_D19()
{
    return 29;
}
int __IndexOf_D20()
{
    return 30;
}
int __IndexOf_D21()
{
    return 31;
}
}
namespace AutoDelta
{
FRootDirtyFlags64 GetDirtyFlags(FInheritCapHolderAS &inout Data)
{
    FRootDirtyFlags64 __r;
    return __r;
}
void InitDirtyFlags(FInheritCapHolderAS &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FInheritCapHolderAS &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FInheritCapHolderAS
{
int __IndexOf_CapData()
{
    return 0;
}
int __IndexOf_CapTail()
{
    return 32;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FCppNestedHolderAS &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FCppNestedHolderAS &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FCppNestedHolderAS &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FCppNestedHolderAS
{
int __IndexOf_FlattenCpp()
{
    return 0;
}
int __IndexOf_NestedCpp()
{
    return 4;
}
int __IndexOf_HolderVal()
{
    return 5;
}
}
namespace AutoDelta
{
FSubDirtyFlags72 GetDirtyFlags(FInheritBase64AS &inout Data)
{
    FSubDirtyFlags72 __r;
    return __r;
}
void ClearDirtyFlags(FInheritBase64AS &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FInheritBase64AS
{
int __IndexOf_Base64A()
{
    return 0;
}
int __IndexOf_Base64B()
{
    return 1;
}
}
namespace AutoDelta
{
FSubDirtyFlags72& GetDirtyFlags(FInheritDerived64AS &inout Data)
{
    return Data.__GetSharedDirtyFlags();
}
void ClearDirtyFlags(FInheritDerived64AS &inout Data)
{
    Data.__ClearOwnChildren_FInheritDerived64AS(false);
    Data.__ClearAllDirtyFlags();
    if (!(Data.__GetSharedDirtyFlags().IsBitmapOwner()))
    {
        int local_2 = 0;
        for (; local_2 < 3; )
        {
            Data.__GetSharedDirtyFlags().ClearDirty(local_2);
            ++local_2;
        }
    }
    return;
}
}
namespace FInheritDerived64AS
{
int __IndexOf_Derived64X()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FInheritHolder64AS &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FInheritHolder64AS &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FInheritHolder64AS &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FInheritHolder64AS
{
int __IndexOf_Data()
{
    return 0;
}
int __IndexOf_Tail()
{
    return 3;
}
}
namespace AutoDelta
{
FSubDirtyFlags104 GetDirtyFlags(FInheritBase96AS &inout Data)
{
    FSubDirtyFlags104 __r;
    return __r;
}
void ClearDirtyFlags(FInheritBase96AS &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FInheritBase96AS
{
int __IndexOf_Base96A()
{
    return 0;
}
int __IndexOf_Base96B()
{
    return 1;
}
}
namespace AutoDelta
{
FSubDirtyFlags104& GetDirtyFlags(FInheritDerived96AS &inout Data)
{
    return Data.__GetSharedDirtyFlags();
}
void ClearDirtyFlags(FInheritDerived96AS &inout Data)
{
    Data.__ClearOwnChildren_FInheritDerived96AS(false);
    Data.__ClearAllDirtyFlags();
    if (!(Data.__GetSharedDirtyFlags().IsBitmapOwner()))
    {
        int local_2 = 0;
        for (; local_2 < 3; )
        {
            Data.__GetSharedDirtyFlags().ClearDirty(local_2);
            ++local_2;
        }
    }
    return;
}
}
namespace FInheritDerived96AS
{
int __IndexOf_Derived96X()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FInheritHolder96AS &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FInheritHolder96AS &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FInheritHolder96AS &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FInheritHolder96AS
{
int __IndexOf_Data()
{
    return 0;
}
int __IndexOf_Tail()
{
    return 3;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FSubDataForRisk2Test &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FSubDataForRisk2Test &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FSubDataForRisk2Test
{
int __IndexOf_SubVal1()
{
    return 0;
}
int __IndexOf_SubVal2()
{
    return 1;
}
int __IndexOf_SubVal3()
{
    return 2;
}
}
namespace AutoDelta
{
FSubDirtyFlags40 GetDirtyFlags(FBaseWithSubDataAS &inout Data)
{
    FSubDirtyFlags40 __r;
    return __r;
}
void ClearDirtyFlags(FBaseWithSubDataAS &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FBaseWithSubDataAS
{
int __IndexOf_BaseVal()
{
    return 0;
}
int __IndexOf_BaseSub()
{
    return 1;
}
}
namespace AutoDelta
{
FSubDirtyFlags40& GetDirtyFlags(FDerivedWithSubDataAS &inout Data)
{
    return Data.__GetSharedDirtyFlags();
}
void ClearDirtyFlags(FDerivedWithSubDataAS &inout Data)
{
    Data.__ClearOwnChildren_FDerivedWithSubDataAS(false);
    Data.__ClearAllDirtyFlags();
    if (!(Data.__GetSharedDirtyFlags().IsBitmapOwner()))
    {
        int local_2 = 0;
        for (; local_2 < 8; )
        {
            Data.__GetSharedDirtyFlags().ClearDirty(local_2);
            ++local_2;
        }
    }
    return;
}
}
namespace FDerivedWithSubDataAS
{
int __IndexOf_DerivedVal()
{
    return 4;
}
int __IndexOf_DerivedSub()
{
    return 5;
}
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FRootForRisk2TestAS &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FRootForRisk2TestAS &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FRootForRisk2TestAS &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FRootForRisk2TestAS
{
int __IndexOf_Flatten()
{
    return 0;
}
int __IndexOf_Nested()
{
    return 8;
}
int __IndexOf_RootVal()
{
    return 9;
}
}
namespace AutoDelta
{
FSubDirtyFlags40 GetDirtyFlags(FBaseWithNestedSubAS &inout Data)
{
    FSubDirtyFlags40 __r;
    return __r;
}
void ClearDirtyFlags(FBaseWithNestedSubAS &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FBaseWithNestedSubAS
{
int __IndexOf_BaseVal()
{
    return 0;
}
int __IndexOf_BaseNested()
{
    return 1;
}
}
namespace AutoDelta
{
FSubDirtyFlags40& GetDirtyFlags(FDerivedWithBothNestedAS &inout Data)
{
    return Data.__GetSharedDirtyFlags();
}
void ClearDirtyFlags(FDerivedWithBothNestedAS &inout Data)
{
    Data.__ClearOwnChildren_FDerivedWithBothNestedAS(false);
    Data.__ClearAllDirtyFlags();
    if (!(Data.__GetSharedDirtyFlags().IsBitmapOwner()))
    {
        int local_2 = 0;
        for (; local_2 < 4; )
        {
            Data.__GetSharedDirtyFlags().ClearDirty(local_2);
            ++local_2;
        }
    }
    return;
}
}
namespace FDerivedWithBothNestedAS
{
int __IndexOf_DerivedVal()
{
    return 2;
}
int __IndexOf_DerivedNested()
{
    return 3;
}
}
namespace AutoDelta
{
FRootDirtyFlags8 GetDirtyFlags(FRootWithNestedSubHolderAS &inout Data)
{
    FRootDirtyFlags8 __r;
    return __r;
}
void InitDirtyFlags(FRootWithNestedSubHolderAS &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FRootWithNestedSubHolderAS &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FRootWithNestedSubHolderAS
{
int __IndexOf_SubFlatten()
{
    return 0;
}
int __IndexOf_SubNested()
{
    return 4;
}
int __IndexOf_HolderVal()
{
    return 5;
}
}
