

struct FTestAutoDeltaAS
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_InnerValue1;
    UPROPERTY()
    int m_InnerValue2;
    UPROPERTY()
    int m_InnerValue3;

    FTestAutoDeltaAS()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FTestAutoDeltaAS(const FTestAutoDeltaAS &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FTestAutoDeltaAS(const int SomeInValue)
    {
        this.m_InnerValue1 = 0;
        this.m_InnerValue2 = 0;
        this.m_InnerValue3 = 0;
        this.SetInnerValue1(SomeInValue);
        return;
    }
    FTestAutoDeltaAS opAssign(const FTestAutoDeltaAS &inout Other)
    {
        FTestAutoDeltaAS __r;
        this.SetInnerValue1(Other.GetInnerValue1());
        this.SetInnerValue2(Other.GetInnerValue2());
        this.SetInnerValue3(Other.GetInnerValue3());
        return __r;
    }
    int GetInnerValue1() const property
    {
        return this.m_InnerValue1;
    }
    void SetInnerValue1(const int __Value) property
    {
        if (this.m_InnerValue1 == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_InnerValue1 = __Value;
        return;
    }
    int GetInnerValue2() const property
    {
        return this.m_InnerValue2;
    }
    void SetInnerValue2(const int __Value) property
    {
        if (this.m_InnerValue2 == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_InnerValue2 = __Value;
        return;
    }
    int GetInnerValue3() const property
    {
        return this.m_InnerValue3;
    }
    void SetInnerValue3(const int __Value) property
    {
        if (this.m_InnerValue3 == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_InnerValue3 = __Value;
        return;
    }
}

struct FTestAutoDeltaNestedAS
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_InnerValue10;
    UPROPERTY()
    FTestAutoDeltaAS m_InnerNested;
    UPROPERTY()
    int m_InnerValue14;

    FTestAutoDeltaNestedAS()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FTestAutoDeltaNestedAS(const FTestAutoDeltaNestedAS &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FTestAutoDeltaNestedAS opAssign(const FTestAutoDeltaNestedAS &inout Other)
    {
        FTestAutoDeltaNestedAS __r;
        this.SetInnerValue10(Other.GetInnerValue10());
        this.SetInnerNested(Other.GetInnerNested());
        this.SetInnerValue14(Other.GetInnerValue14());
        return __r;
    }
    int GetInnerValue10() const property
    {
        return this.m_InnerValue10;
    }
    void SetInnerValue10(const int __Value) property
    {
        if (this.m_InnerValue10 == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_InnerValue10 = __Value;
        return;
    }
    const FTestAutoDeltaAS GetInnerNested() const property
    {
        const FTestAutoDeltaAS __r;
        return __r;
    }
    FTestAutoDeltaAS GetInnerNested() property
    {
        FTestAutoDeltaAS __r;
        return __r;
    }
    void SetInnerNested(const FTestAutoDeltaAS &inout __Value) property
    {
        this.m_InnerNested = __Value;
        return;
    }
    int GetInnerValue14() const property
    {
        return this.m_InnerValue14;
    }
    void SetInnerValue14(const int __Value) property
    {
        if (this.m_InnerValue14 == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_InnerValue14 = __Value;
        return;
    }
}

struct FAutoDeltaTestTooFewPropertiesAS
{
    UPROPERTY()
    int m_InnerValue;
    UPROPERTY()
    int m_InnerValue1;


    int GetInnerValue() const property
    {
        return this.m_InnerValue;
    }
    void SetInnerValue(const int __Value) property
    {
        this.m_InnerValue = __Value;
        return;
    }
    int GetInnerValue1() const property
    {
        return this.m_InnerValue1;
    }
    void SetInnerValue1(const int __Value) property
    {
        this.m_InnerValue1 = __Value;
        return;
    }
}

struct FTestAutoDeltaLayoutHolderAS
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FTestAutoDeltaNestedAS m_NestedComposite_Flatten;
    UPROPERTY()
    FTestAutoDeltaNestedAS m_NestedComposite_Nested;
    UPROPERTY()
    int m_SimpleInt;
    UPROPERTY()
    FTestAutoDeltaAS m_AutoDelta_Flatten;
    UPROPERTY()
    FTestAutoDeltaAS m_AutoDelta_Nested;

    FTestAutoDeltaLayoutHolderAS()
    {
        this.m_SimpleInt = 0;
        this.__InitDirtyFlags();
        return;
    }
    FTestAutoDeltaLayoutHolderAS(const FTestAutoDeltaLayoutHolderAS &inout Other)
    {
        this.m_SimpleInt = 0;
        this.__InitDirtyFlags();
        this.m_NestedComposite_Flatten = Other.m_NestedComposite_Flatten;
        this.m_NestedComposite_Nested = Other.m_NestedComposite_Nested;
        this.m_SimpleInt = int(Other.m_SimpleInt);
        this.m_AutoDelta_Flatten = Other.m_AutoDelta_Flatten;
        this.m_AutoDelta_Nested = Other.m_AutoDelta_Nested;
        return;
    }
    FTestAutoDeltaLayoutHolderAS opAssign(const FTestAutoDeltaLayoutHolderAS &inout Other)
    {
        FTestAutoDeltaLayoutHolderAS __r;
        this.SetNestedComposite_Flatten(Other.GetNestedComposite_Flatten());
        this.SetNestedComposite_Nested(Other.GetNestedComposite_Nested());
        this.SetSimpleInt(Other.GetSimpleInt());
        this.SetAutoDelta_Flatten(Other.GetAutoDelta_Flatten());
        this.SetAutoDelta_Nested(Other.GetAutoDelta_Nested());
        return __r;
    }
    const FTestAutoDeltaNestedAS GetNestedComposite_Flatten() const property
    {
        const FTestAutoDeltaNestedAS __r;
        return __r;
    }
    FTestAutoDeltaNestedAS GetNestedComposite_Flatten() property
    {
        FTestAutoDeltaNestedAS __r;
        return __r;
    }
    void SetNestedComposite_Flatten(const FTestAutoDeltaNestedAS &inout __Value) property
    {
        this.m_NestedComposite_Flatten = __Value;
        return;
    }
    const FTestAutoDeltaNestedAS GetNestedComposite_Nested() const property
    {
        const FTestAutoDeltaNestedAS __r;
        return __r;
    }
    FTestAutoDeltaNestedAS GetNestedComposite_Nested() property
    {
        FTestAutoDeltaNestedAS __r;
        return __r;
    }
    void SetNestedComposite_Nested(const FTestAutoDeltaNestedAS &inout __Value) property
    {
        this.m_NestedComposite_Nested = __Value;
        return;
    }
    int GetSimpleInt() const property
    {
        return this.m_SimpleInt;
    }
    void SetSimpleInt(const int __Value) property
    {
        if (this.m_SimpleInt == __Value)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_SimpleInt = __Value;
        return;
    }
    const FTestAutoDeltaAS GetAutoDelta_Flatten() const property
    {
        const FTestAutoDeltaAS __r;
        return __r;
    }
    FTestAutoDeltaAS GetAutoDelta_Flatten() property
    {
        FTestAutoDeltaAS __r;
        return __r;
    }
    void SetAutoDelta_Flatten(const FTestAutoDeltaAS &inout __Value) property
    {
        this.m_AutoDelta_Flatten = __Value;
        return;
    }
    const FTestAutoDeltaAS GetAutoDelta_Nested() const property
    {
        const FTestAutoDeltaAS __r;
        return __r;
    }
    FTestAutoDeltaAS GetAutoDelta_Nested() property
    {
        FTestAutoDeltaAS __r;
        return __r;
    }
    void SetAutoDelta_Nested(const FTestAutoDeltaAS &inout __Value) property
    {
        this.m_AutoDelta_Nested = __Value;
        return;
    }
}

struct FAutoDeltaDeepLeafAS
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_Leaf_0;
    UPROPERTY()
    int m_Leaf_1;
    UPROPERTY()
    int m_Leaf_2;

    FAutoDeltaDeepLeafAS()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FAutoDeltaDeepLeafAS(const FAutoDeltaDeepLeafAS &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FAutoDeltaDeepLeafAS opAssign(const FAutoDeltaDeepLeafAS &inout Other)
    {
        FAutoDeltaDeepLeafAS __r;
        this.SetLeaf_0(Other.GetLeaf_0());
        this.SetLeaf_1(Other.GetLeaf_1());
        this.SetLeaf_2(Other.GetLeaf_2());
        return __r;
    }
    int GetLeaf_0() const property
    {
        return this.m_Leaf_0;
    }
    void SetLeaf_0(const int __Value) property
    {
        if (this.m_Leaf_0 == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Leaf_0 = __Value;
        return;
    }
    int GetLeaf_1() const property
    {
        return this.m_Leaf_1;
    }
    void SetLeaf_1(const int __Value) property
    {
        if (this.m_Leaf_1 == __Value)
        {
            return;
        }
        this.__MarkDirty(1);
        this.m_Leaf_1 = __Value;
        return;
    }
    int GetLeaf_2() const property
    {
        return this.m_Leaf_2;
    }
    void SetLeaf_2(const int __Value) property
    {
        if (this.m_Leaf_2 == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_Leaf_2 = __Value;
        return;
    }
}

struct FAutoDeltaMidWithFlattenLeafAS
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_Mid_Local;
    UPROPERTY()
    FAutoDeltaDeepLeafAS m_FlattenLeaf;
    UPROPERTY()
    int m_Mid_Extra;

    FAutoDeltaMidWithFlattenLeafAS()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FAutoDeltaMidWithFlattenLeafAS(const FAutoDeltaMidWithFlattenLeafAS &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FAutoDeltaMidWithFlattenLeafAS opAssign(const FAutoDeltaMidWithFlattenLeafAS &inout Other)
    {
        FAutoDeltaMidWithFlattenLeafAS __r;
        this.SetMid_Local(Other.GetMid_Local());
        this.SetFlattenLeaf(Other.GetFlattenLeaf());
        this.SetMid_Extra(Other.GetMid_Extra());
        return __r;
    }
    int GetMid_Local() const property
    {
        return this.m_Mid_Local;
    }
    void SetMid_Local(const int __Value) property
    {
        if (this.m_Mid_Local == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Mid_Local = __Value;
        return;
    }
    const FAutoDeltaDeepLeafAS GetFlattenLeaf() const property
    {
        const FAutoDeltaDeepLeafAS __r;
        return __r;
    }
    FAutoDeltaDeepLeafAS GetFlattenLeaf() property
    {
        FAutoDeltaDeepLeafAS __r;
        return __r;
    }
    void SetFlattenLeaf(const FAutoDeltaDeepLeafAS &inout __Value) property
    {
        this.m_FlattenLeaf = __Value;
        return;
    }
    int GetMid_Extra() const property
    {
        return this.m_Mid_Extra;
    }
    void SetMid_Extra(const int __Value) property
    {
        if (this.m_Mid_Extra == __Value)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_Mid_Extra = __Value;
        return;
    }
}

struct FAutoDeltaMidWithNestedLeafAS
{
    FSubDirtyFlags8 __DirtyFlags;
    UPROPERTY()
    int m_Mid_Local;
    UPROPERTY()
    FAutoDeltaDeepLeafAS m_NestedLeaf;
    UPROPERTY()
    int m_Mid_Extra;

    FAutoDeltaMidWithNestedLeafAS()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FAutoDeltaMidWithNestedLeafAS(const FAutoDeltaMidWithNestedLeafAS &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FAutoDeltaMidWithNestedLeafAS opAssign(const FAutoDeltaMidWithNestedLeafAS &inout Other)
    {
        FAutoDeltaMidWithNestedLeafAS __r;
        this.SetMid_Local(Other.GetMid_Local());
        this.SetNestedLeaf(Other.GetNestedLeaf());
        this.SetMid_Extra(Other.GetMid_Extra());
        return __r;
    }
    int GetMid_Local() const property
    {
        return this.m_Mid_Local;
    }
    void SetMid_Local(const int __Value) property
    {
        if (this.m_Mid_Local == __Value)
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Mid_Local = __Value;
        return;
    }
    const FAutoDeltaDeepLeafAS GetNestedLeaf() const property
    {
        const FAutoDeltaDeepLeafAS __r;
        return __r;
    }
    FAutoDeltaDeepLeafAS GetNestedLeaf() property
    {
        FAutoDeltaDeepLeafAS __r;
        return __r;
    }
    void SetNestedLeaf(const FAutoDeltaDeepLeafAS &inout __Value) property
    {
        this.m_NestedLeaf = __Value;
        return;
    }
    int GetMid_Extra() const property
    {
        return this.m_Mid_Extra;
    }
    void SetMid_Extra(const int __Value) property
    {
        if (this.m_Mid_Extra == __Value)
        {
            return;
        }
        this.__MarkDirty(2);
        this.m_Mid_Extra = __Value;
        return;
    }
}

struct FAutoDeltaDeepHolderAS
{
    FRootDirtyFlags16 __DirtyFlags;
    UPROPERTY()
    FAutoDeltaMidWithFlattenLeafAS m_NestedWithFlatten;
    UPROPERTY()
    FAutoDeltaMidWithNestedLeafAS m_NestedWithNested;
    UPROPERTY()
    FAutoDeltaMidWithFlattenLeafAS m_FlattenWithFlatten;
    UPROPERTY()
    FAutoDeltaMidWithNestedLeafAS m_FlattenWithNested;

    FAutoDeltaDeepHolderAS()
    {
        this.__InitDirtyFlags();
        return;
    }
    FAutoDeltaDeepHolderAS(const FAutoDeltaDeepHolderAS &inout Other)
    {
        this.__InitDirtyFlags();
        this.m_NestedWithFlatten = Other.m_NestedWithFlatten;
        this.m_NestedWithNested = Other.m_NestedWithNested;
        this.m_FlattenWithFlatten = Other.m_FlattenWithFlatten;
        this.m_FlattenWithNested = Other.m_FlattenWithNested;
        return;
    }
    FAutoDeltaDeepHolderAS opAssign(const FAutoDeltaDeepHolderAS &inout Other)
    {
        FAutoDeltaDeepHolderAS __r;
        this.SetNestedWithFlatten(Other.GetNestedWithFlatten());
        this.SetNestedWithNested(Other.GetNestedWithNested());
        this.SetFlattenWithFlatten(Other.GetFlattenWithFlatten());
        this.SetFlattenWithNested(Other.GetFlattenWithNested());
        return __r;
    }
    const FAutoDeltaMidWithFlattenLeafAS GetNestedWithFlatten() const property
    {
        const FAutoDeltaMidWithFlattenLeafAS __r;
        return __r;
    }
    FAutoDeltaMidWithFlattenLeafAS GetNestedWithFlatten() property
    {
        FAutoDeltaMidWithFlattenLeafAS __r;
        return __r;
    }
    void SetNestedWithFlatten(const FAutoDeltaMidWithFlattenLeafAS &inout __Value) property
    {
        this.m_NestedWithFlatten = __Value;
        return;
    }
    const FAutoDeltaMidWithNestedLeafAS GetNestedWithNested() const property
    {
        const FAutoDeltaMidWithNestedLeafAS __r;
        return __r;
    }
    FAutoDeltaMidWithNestedLeafAS GetNestedWithNested() property
    {
        FAutoDeltaMidWithNestedLeafAS __r;
        return __r;
    }
    void SetNestedWithNested(const FAutoDeltaMidWithNestedLeafAS &inout __Value) property
    {
        this.m_NestedWithNested = __Value;
        return;
    }
    const FAutoDeltaMidWithFlattenLeafAS GetFlattenWithFlatten() const property
    {
        const FAutoDeltaMidWithFlattenLeafAS __r;
        return __r;
    }
    FAutoDeltaMidWithFlattenLeafAS GetFlattenWithFlatten() property
    {
        FAutoDeltaMidWithFlattenLeafAS __r;
        return __r;
    }
    void SetFlattenWithFlatten(const FAutoDeltaMidWithFlattenLeafAS &inout __Value) property
    {
        this.m_FlattenWithFlatten = __Value;
        return;
    }
    const FAutoDeltaMidWithNestedLeafAS GetFlattenWithNested() const property
    {
        const FAutoDeltaMidWithNestedLeafAS __r;
        return __r;
    }
    FAutoDeltaMidWithNestedLeafAS GetFlattenWithNested() property
    {
        FAutoDeltaMidWithNestedLeafAS __r;
        return __r;
    }
    void SetFlattenWithNested(const FAutoDeltaMidWithNestedLeafAS &inout __Value) property
    {
        this.m_FlattenWithNested = __Value;
        return;
    }
}

struct FTestAutoDeltaRootAS
{
    FRootDirtyFlags32 __DirtyFlags;
    UPROPERTY()
    FName m_Name_0;
    UPROPERTY()
    FAutoDeltaTest m_AutoDelta_1;
    UPROPERTY()
    TArray<int> m_Array_4;
    UPROPERTY()
    TSet<int> m_Set_5;
    UPROPERTY()
    TMap<int, FVector3f> m_Map_6;
    UPROPERTY()
    FString m_String_7;
    UPROPERTY()
    FAutoDeltaTestTooFewPropertiesAS m_FewProperties_8;
    UPROPERTY()
    FVector3f m_SimpleStruct_9;
    UPROPERTY()
    FTestAutoDeltaNestedAS m_NestedAutoDelta_10;
    UPROPERTY()
    int m_IntNotReplicated;
    UPROPERTY()
    int m_Int_15;

    FTestAutoDeltaRootAS()
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FTestAutoDeltaRootAS(const FTestAutoDeltaRootAS &inout Other)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
    FTestAutoDeltaRootAS opAssign(const FTestAutoDeltaRootAS &inout Other)
    {
        FTestAutoDeltaRootAS __r;
        this.SetName_0(Other.GetName_0());
        this.SetAutoDelta_1(Other.GetAutoDelta_1());
        this.SetArray_4(Other.GetArray_4());
        this.SetSet_5(Other.GetSet_5());
        this.SetMap_6(Other.GetMap_6());
        this.SetString_7(Other.GetString_7());
        this.SetFewProperties_8(Other.GetFewProperties_8());
        this.SetSimpleStruct_9(Other.GetSimpleStruct_9());
        this.SetNestedAutoDelta_10(Other.GetNestedAutoDelta_10());
        this.SetIntNotReplicated(Other.GetIntNotReplicated());
        this.SetInt_15(Other.GetInt_15());
        return __r;
    }
    FName GetName_0() const property
    {
        return this.m_Name_0;
    }
    void SetName_0(const FName &inout __Value) property
    {
        if ((this.m_Name_0 == __Value))
        {
            return;
        }
        this.__MarkDirty(0);
        this.m_Name_0 = __Value;
        return;
    }
    const FAutoDeltaTest GetAutoDelta_1() const property
    {
        const FAutoDeltaTest __r;
        return __r;
    }
    FAutoDeltaTest GetAutoDelta_1() property
    {
        FAutoDeltaTest __r;
        return __r;
    }
    void SetAutoDelta_1(const FAutoDeltaTest &inout __Value) property
    {
        this.m_AutoDelta_1 = __Value;
        return;
    }
    const TArray<int> GetArray_4() const property
    {
        const TArray<int> __r;
        return __r;
    }
    TArray<int> GetModify_Array_4() property
    {
        TArray<int> __r;
        this.__MarkDirty(4);
        return __r;
    }
    void SetArray_4(const TArray<int> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(4);
        this.m_Array_4 = __Value;
        return;
    }
    const TSet<int> GetSet_5() const property
    {
        const TSet<int> __r;
        return __r;
    }
    TSet<int> GetModify_Set_5() property
    {
        TSet<int> __r;
        this.__MarkDirty(5);
        return __r;
    }
    void SetSet_5(const TSet<int> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(5);
        this.m_Set_5 = __Value;
        return;
    }
    const TMap<int, FVector3f> GetMap_6() const property
    {
        const TMap<int, FVector3f> __r;
        return __r;
    }
    TMap<int, FVector3f> GetModify_Map_6() property
    {
        TMap<int, FVector3f> __r;
        this.__MarkDirty(6);
        return __r;
    }
    void SetMap_6(const TMap<int, FVector3f> &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(6);
        this.m_Map_6 = __Value;
        return;
    }
    FString GetString_7() const property
    {
        return this.m_String_7;
    }
    void SetString_7(const FString &inout __Value) property
    {
        if ((this.m_String_7 == __Value))
        {
            return;
        }
        this.__MarkDirty(7);
        this.m_String_7 = __Value;
        return;
    }
    const FAutoDeltaTestTooFewPropertiesAS GetFewProperties_8() const property
    {
        const FAutoDeltaTestTooFewPropertiesAS __r;
        return __r;
    }
    FAutoDeltaTestTooFewPropertiesAS GetModify_FewProperties_8() property
    {
        FAutoDeltaTestTooFewPropertiesAS __r;
        this.__MarkDirty(8);
        return __r;
    }
    void SetFewProperties_8(const FAutoDeltaTestTooFewPropertiesAS &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(8);
        this.m_FewProperties_8 = __Value;
        return;
    }
    const FVector3f GetSimpleStruct_9() const property
    {
        const FVector3f __r;
        return __r;
    }
    FVector3f GetModify_SimpleStruct_9() property
    {
        FVector3f __r;
        this.__MarkDirty(9);
        return __r;
    }
    void SetSimpleStruct_9(const FVector3f &inout __Value) property
    {
        AutoDelta::IsSame local_1;
        if (local_1)
        {
            return;
        }
        this.__MarkDirty(9);
        this.m_SimpleStruct_9 = __Value;
        return;
    }
    const FTestAutoDeltaNestedAS GetNestedAutoDelta_10() const property
    {
        const FTestAutoDeltaNestedAS __r;
        return __r;
    }
    FTestAutoDeltaNestedAS GetNestedAutoDelta_10() property
    {
        FTestAutoDeltaNestedAS __r;
        return __r;
    }
    void SetNestedAutoDelta_10(const FTestAutoDeltaNestedAS &inout __Value) property
    {
        this.m_NestedAutoDelta_10 = __Value;
        return;
    }
    int GetIntNotReplicated() const property
    {
        return this.m_IntNotReplicated;
    }
    void SetIntNotReplicated(const int __Value) property
    {
        this.m_IntNotReplicated = __Value;
        return;
    }
    int GetInt_15() const property
    {
        return this.m_Int_15;
    }
    void SetInt_15(const int __Value) property
    {
        if (this.m_Int_15 == __Value)
        {
            return;
        }
        this.__MarkDirty(15);
        this.m_Int_15 = __Value;
        return;
    }
}

void AssertDeepChainDirtyFlagsClean(FUnitTest &inout UnitTest, FAutoDeltaDeepHolderAS &inout Data)
{
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(Data), "Deep clear: root dirty flags should be clean");
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(Data.GetNestedWithFlatten()), "Deep clear: NestedWithFlatten dirty flags should be clean");
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(Data.GetNestedWithFlatten().GetFlattenLeaf()), "Deep clear: NestedWithFlatten.FlattenLeaf dirty flags should be clean");
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(Data.GetNestedWithNested()), "Deep clear: NestedWithNested dirty flags should be clean");
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(Data.GetNestedWithNested().GetNestedLeaf()), "Deep clear: NestedWithNested.NestedLeaf dirty flags should be clean");
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(Data.GetFlattenWithFlatten()), "Deep clear: FlattenWithFlatten dirty flags should be clean");
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(Data.GetFlattenWithFlatten().GetFlattenLeaf()), "Deep clear: FlattenWithFlatten.FlattenLeaf dirty flags should be clean");
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(Data.GetFlattenWithNested()), "Deep clear: FlattenWithNested dirty flags should be clean");
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(Data.GetFlattenWithNested().GetNestedLeaf()), "Deep clear: FlattenWithNested.NestedLeaf dirty flags should be clean");
    return;
}
void Test_AutoDeltaASUnitTest(FUnitTest &inout UnitTest)
{
    FTestAutoDeltaRootAS local_72;
    AutoDelta::InitDirtyFlags(local_72);
    FSubDirtyFlags8 local_73 = AutoDelta::GetDirtyFlags(local_72.GetAutoDelta_1());
    FSubDirtyFlags8 local_74 = AutoDelta::GetDirtyFlags(local_72.GetNestedAutoDelta_10());
    FSubDirtyFlags8 local_75 = AutoDelta::GetDirtyFlags(local_72.GetNestedAutoDelta_10().GetInnerNested());
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(local_72), "init dirtyflags error");
    AutoDelta::SetAllDirty(local_72);
    UnitTest.AssertTrue(AutoDelta::IsAllDirty(local_72), "init dirtyflags error");
    AutoDelta::ClearDirtyFlags(local_72);
    FRootDirtyFlags32 local_77 = AutoDelta::GetDirtyFlags(local_72);
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(local_72), FString().Append("clear all error, dirtyflags not empty"));
    FTestAutoDeltaRootAS local_154;
    AutoDelta::InitDirtyFlags(local_154);
    UnitTest.AssertEquals(1897, local_154.GetInt_15(), "default value error");
    local_154.SetName_0(n"Actor");
    local_72.SetInt_15(999);
    local_77 = AutoDelta::GetDirtyFlags(local_72);
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_72, 15), FString().Append("set dirty mask error, 15 should be true, ").Append(local_77));
    UnitTest.AssertEquals(9, AutoDelta::DummyNetSerialize(local_72, local_154, FTestAutoDeltaRootAS), "delta compress error");
    UnitTest.AssertEquals(999, local_154.GetInt_15(), "delta sync error, modified data should be override to sync value");
    UnitTest.AssertEquals(n"Actor", local_154.GetName_0(), "delta sync error, unchanged data should remain local value");
    AutoDelta::ClearDirtyFlags(local_72);
    local_72.GetNestedAutoDelta_10().SetInnerValue10(10);
    local_72.GetNestedAutoDelta_10().GetInnerNested().SetInnerValue3(13);
    local_77 = AutoDelta::GetDirtyFlags(local_72);
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_72, 10), FString().Append("set dirty mask error, 10 should be true, ").Append(local_77.ToString()).Append(", ").Append(local_73.ToString()).Append(", ").Append(local_74.ToString()).Append(", ").Append(local_75.ToString()));
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_72, 13), FString().Append("set dirty mask error, 13 should be true, ").Append(local_77.ToString()).Append(", ").Append(local_73.ToString()).Append(", ").Append(local_74.ToString()).Append(", ").Append(local_75.ToString()));
    local_154.GetNestedAutoDelta_10().SetInnerValue14(-14);
    local_154.GetNestedAutoDelta_10().GetInnerNested().SetInnerValue1(-11);
    UnitTest.AssertEquals(13, AutoDelta::DummyNetSerialize(local_72, local_154, FTestAutoDeltaRootAS), "delta compress error");
    UnitTest.AssertEquals(10, local_154.GetNestedAutoDelta_10().GetInnerValue10(), "delta sync error, modified data should be override to sync value");
    UnitTest.AssertEquals(13, local_154.GetNestedAutoDelta_10().GetInnerNested().GetInnerValue3(), "delta sync error, modified data should be override to sync value");
    UnitTest.AssertEquals(-14, local_154.GetNestedAutoDelta_10().GetInnerValue14(), "delta sync error, unchanged data should remain local value");
    UnitTest.AssertEquals(-11, local_154.GetNestedAutoDelta_10().GetInnerNested().GetInnerValue1(), "delta sync error, unchanged data should remain local value");
    AutoDelta::ClearDirtyFlags(local_72);
    UnitTest.AssertEquals(2, local_72.GetAutoDelta_1().GetInnerValue2(), "default value error");
    FAutoDeltaTest local_182;
    local_182.SetInnerValue1(1);
    local_182.SetInnerValue2(2);
    local_182.SetInnerValue3(3);
    local_72.SetAutoDelta_1(local_182);
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_72, 1), "set dirty mask error, compare and write change 1, %x");
    UnitTest.AssertFalse(AutoDelta::IsDirty(local_72, 2), "set dirty mask error, compare and write dont change 2, %x");
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_72, 3), "set dirty mask error, compare and write change 3, %x");
    local_154.GetAutoDelta_1().SetInnerValue2(-1);
    UnitTest.AssertEquals(13, AutoDelta::DummyNetSerialize(local_72, local_154, FTestAutoDeltaRootAS), "delta compress error");
    UnitTest.AssertEquals(1, local_154.GetAutoDelta_1().GetInnerValue1(), "delta sync error, modified data should be override to sync value");
    UnitTest.AssertEquals(3, local_154.GetAutoDelta_1().GetInnerValue3(), "delta sync error, modified data should be override to sync value");
    UnitTest.AssertEquals(-1, local_154.GetAutoDelta_1().GetInnerValue2(), "delta sync error, unchanged data should remain local value");
    FTestAutoDeltaLayoutHolderAS local_210;
    AutoDelta::InitDirtyFlags(local_210);
    AutoDelta::ClearDirtyFlags(local_210);
    local_210.GetNestedComposite_Flatten().SetInnerValue10(11);
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_210, 0), "Flatten inner -> parent idx 0 dirty");
    UnitTest.AssertFalse(AutoDelta::IsDirty(local_210, 5), "Flatten е†™дёЌеє”ж±Ўжџ“ Nested ж§ЅдЅЌ 5");
    AutoDelta::ClearDirtyFlags(local_210);
    UnitTest.AssertFalse(AutoDelta::GetDirtyFlags(local_210.GetNestedComposite_Nested()).IsNewData(), "Nested clear should clear NewData");
    local_210.GetNestedComposite_Nested().SetInnerValue10(110);
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_210, 5), "Nested inner -> з€¶еЏЄдє® idx 5");
    UnitTest.AssertFalse(AutoDelta::IsDirty(local_210, 0), "Nested е†™дёЌеє”иЇЇжџ“ Flatten ж®µ idx 0");
    UnitTest.AssertFalse(AutoDelta::IsDirty(local_210, 6), "Nested е†™дёЌеє”и¶Љз•Њдє® idx 6");
    UnitTest.AssertTrue((AutoDelta::IsDirty(local_210.GetNestedComposite_Nested(), 0)), "Composite_Nested и‡Єиє« bitmap idx 0 = InnerValue10 dirty");
    FTestAutoDeltaLayoutHolderAS local_238;
    AutoDelta::InitDirtyFlags(local_238);
    AutoDelta::ClearDirtyFlags(local_238);
    UnitTest.AssertFalse(AutoDelta::GetDirtyFlags(local_238.GetNestedComposite_Nested()).IsNewData(), "Recv nested clear should clear NewData");
    local_238.GetNestedComposite_Flatten().SetInnerValue14(-1);
    local_238.GetNestedComposite_Nested().SetInnerValue14(-2);
    local_210.GetNestedComposite_Flatten().SetInnerValue10(100);
    local_210.GetNestedComposite_Nested().SetInnerValue10(200);
    UnitTest.AssertFalse(AutoDelta::GetDirtyFlags(local_210.GetNestedComposite_Nested()).IsNewData(), "Send nested dirty delta should not be NewData");
    AutoDelta::DummyNetSerialize(local_210, local_238, FTestAutoDeltaLayoutHolderAS);
    UnitTest.AssertEquals(100, local_238.GetNestedComposite_Flatten().GetInnerValue10(), "Flatten е†…е­—ж®µеђЊж­Ґ");
    UnitTest.AssertEquals(200, local_238.GetNestedComposite_Nested().GetInnerValue10(), "Nested е†…е­—ж®µеђЊж­Ґ");
    UnitTest.AssertEquals(-1, local_238.GetNestedComposite_Flatten().GetInnerValue14(), "Flatten жњЄи„Џе­—ж®µдїќз•™жњ¬ењ°");
    UnitTest.AssertEquals(-2, local_238.GetNestedComposite_Nested().GetInnerValue14(), "Nested жњЄи„Џе­—ж®µдїќз•™жњ¬ењ°");
    AutoDelta::ClearDirtyFlags(local_210);
    AutoDelta::ClearDirtyFlags(local_238);
    local_210.GetAutoDelta_Flatten().SetInnerValue1(7);
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_210, 7), "AutoDelta_Flatten.InnerValue1 -> parent idx 7");
    UnitTest.AssertFalse(AutoDelta::IsDirty(local_210, 10), "дёЌеє”зў°е€° AutoDelta_Nested ж§ЅдЅЌ 10");
    local_210.GetAutoDelta_Nested().SetInnerValue3(9);
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_210, 10), "AutoDelta_Nested.InnerValue3 -> parent idx 10");
    UnitTest.AssertTrue((AutoDelta::IsDirty(local_210.GetAutoDelta_Nested(), 2)), "AutoDelta_Nested и‡Єиє« bitmap idx 2 = InnerValue3 dirty");
    local_238.GetAutoDelta_Flatten().SetInnerValue2(-10);
    local_238.GetAutoDelta_Nested().SetInnerValue1(-11);
    AutoDelta::DummyNetSerialize(local_210, local_238, FTestAutoDeltaLayoutHolderAS);
    UnitTest.AssertEquals(7, local_238.GetAutoDelta_Flatten().GetInnerValue1(), "Flatten AutoDelta еђЊж­Ґ InnerValue1");
    UnitTest.AssertEquals(9, local_238.GetAutoDelta_Nested().GetInnerValue3(), "Nested AutoDelta еђЊж­Ґ InnerValue3");
    UnitTest.AssertEquals(-10, local_238.GetAutoDelta_Flatten().GetInnerValue2(), "Flatten AutoDelta жњЄи„Џе­—ж®µдїќз•™жњ¬ењ°");
    UnitTest.AssertEquals(-11, local_238.GetAutoDelta_Nested().GetInnerValue1(), "Nested AutoDelta жњЄи„Џе­—ж®µдїќз•™жњ¬ењ°");
    UnitTest.AssertFalse(AutoDelta::IsNoDirty(local_210.GetAutoDelta_Nested()), "Pre-clear: nested still dirty");
    AutoDelta::ClearDirtyFlags(local_210);
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(local_210), "ClearAll: parent bitmap empty");
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(local_210.GetNestedComposite_Nested()), "ClearAll cascades into Composite_Nested");
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(local_210.GetAutoDelta_Nested()), "ClearAll cascades into AutoDelta_Nested");
    FAutoDeltaDeepHolderAS local_272;
    AutoDelta::InitDirtyFlags(local_272);
    AutoDelta::ClearDirtyFlags(local_272);
    AutoDelta::GetDirtyFlags(local_272.GetNestedWithFlatten().GetFlattenLeaf()).MarkDirty(1);
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_272, 0), "NestedWithFlatten should propagate to Root idx 0");
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_272.GetNestedWithFlatten(), 2), "NestedWithFlatten.FlattenLeaf.Leaf_1 -> NestedWithFlatten idx 2");
    UnitTest.AssertFalse(AutoDelta::IsDirty(local_272, 1), "NestedWithFlatten should not touch Root idx 1");
    AutoDelta::ClearDirtyFlags(local_272);
    AutoDelta::GetDirtyFlags(local_272.GetNestedWithNested().GetNestedLeaf()).MarkDirty(2);
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_272, 1), "NestedWithNested should propagate to Root idx 1");
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_272.GetNestedWithNested(), 1), "NestedWithNested.NestedLeaf should mark middle idx 1");
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_272.GetNestedWithNested().GetNestedLeaf(), 2), "NestedWithNested.NestedLeaf.Leaf_2 should mark leaf idx 2");
    AutoDelta::ClearDirtyFlags(local_272);
    AutoDelta::GetDirtyFlags(local_272.GetFlattenWithFlatten().GetFlattenLeaf()).MarkDirty(0);
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_272, 3), "FlattenWithFlatten.FlattenLeaf.Leaf_0 -> Root idx 3");
    UnitTest.AssertFalse(AutoDelta::IsDirty(local_272, 2), "FlattenWithFlatten leaf write should not mark Mid_Local idx 2");
    AutoDelta::ClearDirtyFlags(local_272);
    AutoDelta::GetDirtyFlags(local_272.GetFlattenWithNested().GetNestedLeaf()).MarkDirty(1);
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_272, 8), "FlattenWithNested.NestedLeaf should propagate to Root idx 8");
    UnitTest.AssertFalse(AutoDelta::IsDirty(local_272, 7), "Nested leaf write should not mark FlattenWithNested.Mid_Local idx 7");
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_272.GetFlattenWithNested().GetNestedLeaf(), 1), "FlattenWithNested.NestedLeaf.Leaf_1 should mark leaf idx 1");
    AutoDelta::InitDirtyFlags(local_272);
    AutoDelta::ClearDirtyFlags(local_272);
    AssertDeepChainDirtyFlagsClean(UnitTest, local_272);
    AutoDelta::GetDirtyFlags(local_272.GetNestedWithFlatten()).MarkDirty(0);
    AutoDelta::GetDirtyFlags(local_272.GetNestedWithFlatten().GetFlattenLeaf()).MarkDirty(1);
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_272, 0), "Clear NF: root slot should be dirty before clear");
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_272.GetNestedWithFlatten(), 0), "Clear NF: nested mid local bit should be dirty before clear");
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_272.GetNestedWithFlatten().GetFlattenLeaf(), 1), "Clear NF: flatten leaf bit should be dirty before clear");
    AutoDelta::ClearDirtyFlags(local_272);
    AssertDeepChainDirtyFlagsClean(UnitTest, local_272);
    AutoDelta::GetDirtyFlags(local_272.GetNestedWithNested()).MarkDirty(0);
    AutoDelta::GetDirtyFlags(local_272.GetNestedWithNested().GetNestedLeaf()).MarkDirty(2);
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_272, 1), "Clear NN: root slot should be dirty before clear");
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_272.GetNestedWithNested(), 0), "Clear NN: nested mid local bit should be dirty before clear");
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_272.GetNestedWithNested().GetNestedLeaf(), 2), "Clear NN: nested leaf bit should be dirty before clear");
    AutoDelta::ClearDirtyFlags(local_272);
    AssertDeepChainDirtyFlagsClean(UnitTest, local_272);
    AutoDelta::GetDirtyFlags(local_272.GetFlattenWithFlatten()).MarkDirty(0);
    AutoDelta::GetDirtyFlags(local_272.GetFlattenWithFlatten().GetFlattenLeaf()).MarkDirty(1);
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_272, 2), "Clear FF: flattened mid local bit should be dirty before clear");
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_272, 4), "Clear FF: flattened leaf bit should be dirty before clear");
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_272.GetFlattenWithFlatten(), 0), "Clear FF: flatten mid view should see dirty bit before clear");
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_272.GetFlattenWithFlatten().GetFlattenLeaf(), 1), "Clear FF: flatten leaf view should see dirty bit before clear");
    AutoDelta::ClearDirtyFlags(local_272);
    AssertDeepChainDirtyFlagsClean(UnitTest, local_272);
    AutoDelta::GetDirtyFlags(local_272.GetFlattenWithNested()).MarkDirty(2);
    AutoDelta::GetDirtyFlags(local_272.GetFlattenWithNested().GetNestedLeaf()).MarkDirty(1);
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_272, 9), "Clear FN: flattened mid extra bit should be dirty before clear");
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_272, 8), "Clear FN: nested leaf root slot should be dirty before clear");
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_272.GetFlattenWithNested(), 2), "Clear FN: flatten mid view should see dirty bit before clear");
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_272.GetFlattenWithNested().GetNestedLeaf(), 1), "Clear FN: nested leaf bit should be dirty before clear");
    AutoDelta::ClearDirtyFlags(local_272);
    AssertDeepChainDirtyFlagsClean(UnitTest, local_272);
    FTestAutoDeltaRootAS local_344;
    AutoDelta::InitDirtyFlags(local_344);
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(local_344), "bNewData: Init no property bit dirty");
    UnitTest.AssertTrue(AutoDelta::GetDirtyFlags(local_344).IsNewData(), "bNewData: Init IsNewData true");
    AutoDelta::ClearDirtyFlags(local_344);
    UnitTest.AssertFalse(AutoDelta::GetDirtyFlags(local_344).IsNewData(), "bNewData: Clear IsNewData false");
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(local_344), "bNewData: Clear remains no dirty");
    FTestAutoDeltaRootAS local_416;
    AutoDelta::InitDirtyFlags(local_344);
    AutoDelta::InitDirtyFlags(local_416);
    AutoDelta::ClearDirtyFlags(local_344);
    AutoDelta::ClearDirtyFlags(local_416);
    local_344.SetIntNotReplicated(999);
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(local_344), "NotReplicated assign: no property bit should be dirty");
    local_416.SetIntNotReplicated(-1);
    local_344.SetInt_15(1);
    AutoDelta::DummyNetSerialize(local_344, local_416, FTestAutoDeltaRootAS);
    UnitTest.AssertEquals(-1, local_416.GetIntNotReplicated(), "NotReplicated keeps local after sync");
    UnitTest.AssertEquals(1, local_416.GetInt_15(), "Normal field syncs");
    AutoDelta::InitDirtyFlags(local_416);
    AutoDelta::InitDirtyFlags(local_344);
    AutoDelta::ClearDirtyFlags(local_416);
    AutoDelta::ClearDirtyFlags(local_344);
    FAutoDeltaTestTooFewPropertiesAS local_418;
    local_418.SetInnerValue(88);
    local_418.SetInnerValue1(99);
    local_416.SetFewProperties_8(local_418);
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_416, 8), "TooFewProperties assign -> idx 8 dirty");
    AutoDelta::DummyNetSerialize(local_416, local_344, FTestAutoDeltaRootAS);
    UnitTest.AssertEquals(88, local_344.GetFewProperties_8().GetInnerValue(), "TooFewProperties.InnerValue sync");
    UnitTest.AssertEquals(99, local_344.GetFewProperties_8().GetInnerValue1(), "TooFewProperties.InnerValue1 sync");
    AutoDelta::InitDirtyFlags(local_344);
    AutoDelta::InitDirtyFlags(local_416);
    AutoDelta::ClearDirtyFlags(local_344);
    AutoDelta::ClearDirtyFlags(local_416);
    TArray<int> local_422;
    local_422.Add(10);
    local_422.Add(20);
    local_422.Add(30);
    local_344.SetArray_4(local_422);
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_344, 4), "TArray assign -> idx 4 dirty");
    TSet<int> local_442;
    local_442.Add(1);
    local_442.Add(2);
    local_442.Add(3);
    local_344.SetSet_5(local_442);
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_344, 5), "TSet assign -> idx 5 dirty");
    TMap<int, FVector3f> local_462;
    local_462.Add(1, FVector3f(1.0f, 2.0f, 3.0f));
    local_344.SetMap_6(local_462);
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_344, 6), "TMap assign -> idx 6 dirty");
    AutoDelta::DummyNetSerialize(local_344, local_416, FTestAutoDeltaRootAS);
    UnitTest.AssertEquals(3, local_416.GetArray_4().Num(), "TArray sync count");
    UnitTest.AssertEquals(10, local_416.GetArray_4()[0], "TArray sync element 0");
    UnitTest.AssertEquals(3, local_416.GetSet_5().Num(), "TSet sync count");
    int local_156 = 2;
    UnitTest.AssertTrue(local_416.GetSet_5().Contains(local_156), "TSet sync contains 2");
    UnitTest.AssertEquals(1, local_416.GetMap_6().Num(), "TMap sync count");
    int local_155 = 1;
    UnitTest.AssertTrue(local_416.GetMap_6().Contains(local_155), "TMap sync contains key 1");
    AutoDelta::InitDirtyFlags(local_416);
    AutoDelta::InitDirtyFlags(local_344);
    local_416.SetInt_15(100);
    AutoDelta::DummyNetSerialize(local_416, local_344, FTestAutoDeltaRootAS);
    UnitTest.AssertEquals(100, local_344.GetInt_15(), "Round 1: Int_15 sync");
    AutoDelta::ClearDirtyFlags(local_416);
    AutoDelta::ClearDirtyFlags(local_344);
    local_416.SetName_0(n"Actor");
    AutoDelta::DummyNetSerialize(local_416, local_344, FTestAutoDeltaRootAS);
    UnitTest.AssertEquals(n"Actor", local_344.GetName_0(), "Round 2: Name_0 sync");
    UnitTest.AssertEquals(100, local_344.GetInt_15(), "Round 2: Int_15 unchanged");
    AutoDelta::ClearDirtyFlags(local_416);
    AutoDelta::ClearDirtyFlags(local_344);
    AutoDelta::DummyNetSerialize(local_416, local_344, FTestAutoDeltaRootAS);
    UnitTest.AssertEquals(n"Actor", local_344.GetName_0(), "Round 3 empty: Name_0 unchanged");
    UnitTest.AssertEquals(100, local_344.GetInt_15(), "Round 3 empty: Int_15 unchanged");
    FAutoDeltaDeepHolderAS local_502;
    AutoDelta::InitDirtyFlags(local_272);
    AutoDelta::InitDirtyFlags(local_502);
    AutoDelta::ClearDirtyFlags(local_272);
    AutoDelta::ClearDirtyFlags(local_502);
    local_502.GetNestedWithFlatten().GetFlattenLeaf().SetLeaf_0(-100);
    local_502.GetNestedWithFlatten().SetMid_Extra(-200);
    AutoDelta::ClearDirtyFlags(local_502);
    local_272.GetNestedWithFlatten().GetFlattenLeaf().SetLeaf_1(42);
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_272, 0), "E2E NF: leaf write -> Root idx 0");
    UnitTest.AssertFalse(AutoDelta::IsDirty(local_272, 1), "E2E NF: no bleed to Root idx 1");
    AutoDelta::DummyNetSerialize(local_272, local_502, FAutoDeltaDeepHolderAS);
    UnitTest.AssertEquals(42, local_502.GetNestedWithFlatten().GetFlattenLeaf().GetLeaf_1(), "E2E NF: Leaf_1 synced");
    UnitTest.AssertEquals(-100, local_502.GetNestedWithFlatten().GetFlattenLeaf().GetLeaf_0(), "E2E NF: Leaf_0 preserved");
    UnitTest.AssertEquals(-200, local_502.GetNestedWithFlatten().GetMid_Extra(), "E2E NF: Mid_Extra preserved");
    AutoDelta::ClearDirtyFlags(local_272);
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(local_272), "E2E NF: ClearAll empties root");
    AutoDelta::InitDirtyFlags(local_502);
    AutoDelta::InitDirtyFlags(local_272);
    AutoDelta::ClearDirtyFlags(local_502);
    AutoDelta::ClearDirtyFlags(local_272);
    local_272.GetNestedWithNested().GetNestedLeaf().SetLeaf_0(-300);
    local_272.GetNestedWithNested().SetMid_Local(-400);
    AutoDelta::ClearDirtyFlags(local_272);
    local_502.GetNestedWithNested().GetNestedLeaf().SetLeaf_2(77);
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_502, 1), "E2E NN: leaf write -> Root idx 1");
    UnitTest.AssertFalse(AutoDelta::IsDirty(local_502, 0), "E2E NN: no bleed to Root idx 0");
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_502.GetNestedWithNested(), 1), "E2E NN: mid Nested slot dirty");
    AutoDelta::DummyNetSerialize(local_502, local_272, FAutoDeltaDeepHolderAS);
    UnitTest.AssertEquals(77, local_272.GetNestedWithNested().GetNestedLeaf().GetLeaf_2(), "E2E NN: Leaf_2 synced");
    UnitTest.AssertEquals(-300, local_272.GetNestedWithNested().GetNestedLeaf().GetLeaf_0(), "E2E NN: Leaf_0 preserved");
    UnitTest.AssertEquals(-400, local_272.GetNestedWithNested().GetMid_Local(), "E2E NN: Mid_Local preserved");
    AutoDelta::ClearDirtyFlags(local_502);
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(local_502.GetNestedWithNested().GetNestedLeaf()), "E2E NN: ClearAll cascades to nested leaf");
    AutoDelta::InitDirtyFlags(local_272);
    AutoDelta::InitDirtyFlags(local_502);
    AutoDelta::ClearDirtyFlags(local_272);
    AutoDelta::ClearDirtyFlags(local_502);
    local_502.GetFlattenWithFlatten().GetFlattenLeaf().SetLeaf_1(-500);
    local_502.GetFlattenWithFlatten().SetMid_Local(-600);
    AutoDelta::ClearDirtyFlags(local_502);
    local_272.GetFlattenWithFlatten().GetFlattenLeaf().SetLeaf_0(55);
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_272, 3), "E2E FF: Leaf_0 -> Root idx 3");
    UnitTest.AssertFalse(AutoDelta::IsDirty(local_272, 2), "E2E FF: no bleed to Mid_Local idx 2");
    AutoDelta::DummyNetSerialize(local_272, local_502, FAutoDeltaDeepHolderAS);
    UnitTest.AssertEquals(55, local_502.GetFlattenWithFlatten().GetFlattenLeaf().GetLeaf_0(), "E2E FF: Leaf_0 synced");
    UnitTest.AssertEquals(-500, local_502.GetFlattenWithFlatten().GetFlattenLeaf().GetLeaf_1(), "E2E FF: Leaf_1 preserved");
    UnitTest.AssertEquals(-600, local_502.GetFlattenWithFlatten().GetMid_Local(), "E2E FF: Mid_Local preserved");
    AutoDelta::InitDirtyFlags(local_502);
    AutoDelta::InitDirtyFlags(local_272);
    AutoDelta::ClearDirtyFlags(local_502);
    AutoDelta::ClearDirtyFlags(local_272);
    local_272.GetFlattenWithNested().GetNestedLeaf().SetLeaf_2(-700);
    local_272.GetFlattenWithNested().SetMid_Extra(-800);
    AutoDelta::ClearDirtyFlags(local_272);
    local_502.GetFlattenWithNested().GetNestedLeaf().SetLeaf_1(88);
    UnitTest.AssertTrue(AutoDelta::IsDirty(local_502, 8), "E2E FN: Leaf_1 -> Root idx 8");
    UnitTest.AssertFalse(AutoDelta::IsDirty(local_502, 7), "E2E FN: no bleed to Mid_Local idx 7");
    AutoDelta::DummyNetSerialize(local_502, local_272, FAutoDeltaDeepHolderAS);
    UnitTest.AssertEquals(88, local_272.GetFlattenWithNested().GetNestedLeaf().GetLeaf_1(), "E2E FN: Leaf_1 synced");
    UnitTest.AssertEquals(-700, local_272.GetFlattenWithNested().GetNestedLeaf().GetLeaf_2(), "E2E FN: Leaf_2 preserved");
    UnitTest.AssertEquals(-800, local_272.GetFlattenWithNested().GetMid_Extra(), "E2E FN: Mid_Extra preserved");
    AutoDelta::ClearDirtyFlags(local_502);
    UnitTest.AssertTrue(AutoDelta::IsNoDirty(local_502.GetFlattenWithNested().GetNestedLeaf()), "E2E FN: ClearAll cascades to nested leaf in flatten parent");
    return;
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FTestAutoDeltaAS &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FTestAutoDeltaAS &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FTestAutoDeltaAS
{
int __IndexOf_InnerValue1()
{
    return 0;
}
int __IndexOf_InnerValue2()
{
    return 1;
}
int __IndexOf_InnerValue3()
{
    return 2;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FTestAutoDeltaNestedAS &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FTestAutoDeltaNestedAS &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FTestAutoDeltaNestedAS
{
int __IndexOf_InnerValue10()
{
    return 0;
}
int __IndexOf_InnerNested()
{
    return 1;
}
int __IndexOf_InnerValue14()
{
    return 4;
}
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FTestAutoDeltaLayoutHolderAS &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FTestAutoDeltaLayoutHolderAS &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FTestAutoDeltaLayoutHolderAS &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FTestAutoDeltaLayoutHolderAS
{
int __IndexOf_NestedComposite_Flatten()
{
    return 0;
}
int __IndexOf_NestedComposite_Nested()
{
    return 5;
}
int __IndexOf_SimpleInt()
{
    return 6;
}
int __IndexOf_AutoDelta_Flatten()
{
    return 7;
}
int __IndexOf_AutoDelta_Nested()
{
    return 10;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FAutoDeltaDeepLeafAS &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FAutoDeltaDeepLeafAS &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FAutoDeltaDeepLeafAS
{
int __IndexOf_Leaf_0()
{
    return 0;
}
int __IndexOf_Leaf_1()
{
    return 1;
}
int __IndexOf_Leaf_2()
{
    return 2;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FAutoDeltaMidWithFlattenLeafAS &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FAutoDeltaMidWithFlattenLeafAS &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FAutoDeltaMidWithFlattenLeafAS
{
int __IndexOf_Mid_Local()
{
    return 0;
}
int __IndexOf_FlattenLeaf()
{
    return 1;
}
int __IndexOf_Mid_Extra()
{
    return 4;
}
}
namespace AutoDelta
{
FSubDirtyFlags8 GetDirtyFlags(FAutoDeltaMidWithNestedLeafAS &inout Data)
{
    FSubDirtyFlags8 __r;
    return __r;
}
void ClearDirtyFlags(FAutoDeltaMidWithNestedLeafAS &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FAutoDeltaMidWithNestedLeafAS
{
int __IndexOf_Mid_Local()
{
    return 0;
}
int __IndexOf_NestedLeaf()
{
    return 1;
}
int __IndexOf_Mid_Extra()
{
    return 2;
}
}
namespace AutoDelta
{
FRootDirtyFlags16 GetDirtyFlags(FAutoDeltaDeepHolderAS &inout Data)
{
    FRootDirtyFlags16 __r;
    return __r;
}
void InitDirtyFlags(FAutoDeltaDeepHolderAS &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FAutoDeltaDeepHolderAS &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FAutoDeltaDeepHolderAS
{
int __IndexOf_NestedWithFlatten()
{
    return 0;
}
int __IndexOf_NestedWithNested()
{
    return 1;
}
int __IndexOf_FlattenWithFlatten()
{
    return 2;
}
int __IndexOf_FlattenWithNested()
{
    return 7;
}
}
namespace AutoDelta
{
FRootDirtyFlags32 GetDirtyFlags(FTestAutoDeltaRootAS &inout Data)
{
    FRootDirtyFlags32 __r;
    return __r;
}
void InitDirtyFlags(FTestAutoDeltaRootAS &inout Data)
{
    Data.__InitDirtyFlags();
    return;
}
void ClearDirtyFlags(FTestAutoDeltaRootAS &inout Data)
{
    Data.__ClearAllDirtyFlags();
    return;
}
}
namespace FTestAutoDeltaRootAS
{
int __IndexOf_Name_0()
{
    return 0;
}
int __IndexOf_AutoDelta_1()
{
    return 1;
}
int __IndexOf_Array_4()
{
    return 4;
}
int __IndexOf_Set_5()
{
    return 5;
}
int __IndexOf_Map_6()
{
    return 6;
}
int __IndexOf_String_7()
{
    return 7;
}
int __IndexOf_FewProperties_8()
{
    return 8;
}
int __IndexOf_SimpleStruct_9()
{
    return 9;
}
int __IndexOf_NestedAutoDelta_10()
{
    return 10;
}
int __IndexOf_Int_15()
{
    return 15;
}
}
