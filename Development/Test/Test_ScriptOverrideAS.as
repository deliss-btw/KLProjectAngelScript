

// NOTE: class defaults are not authored in this module: FTest_ScriptOverrideAS (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

struct FTest_ScriptOverrideAS : FTest_ScriptOverride
{
    FTest_ScriptOverride _base_FTest_ScriptOverride;
    UPROPERTY()
    AActor SomeActor;
    UPROPERTY()
    FVector3f SomeVector;
    UPROPERTY()
    TArray<int> SomeArray;

    FTest_ScriptOverrideAS()
    {
        this.SomeActor = nullptr;
        this.__InitDefaults();
        return;
    }
    void TestEvent_Implementation()
    {
        XLog(ELog(0), "TestScriptOverrideAS::TestEvent() иў«и°ѓз”Ё");
        return;
    }
    void TestEventConst_Implementation() const
    {
        XLog(ELog(0), "TestScriptOverrideAS::TestEventConst() иў«и°ѓз”Ё");
        return;
    }
    void TestEventWithParam_Implementation(const int Param0, const uint8 Param1, const int16 Param2, const bool Param3)
    {
        XLog(ELog(0), FString().Append("TestScriptOverrideAS::TestEventWithParam() иў«и°ѓз”Ё - Param0: ").Append(Param0).Append(", Param1: ").Append(Param1).Append(", Param2: ").Append(Param2).Append(" Param3: ").Append(Param3));
        return;
    }
    void TestEventWithRefParam_Implementation(int &inout Param0)
    {
        int local_2 = Param0 + 100;
        XLog(ELog(0), FString().Append("TestScriptOverrideAS::TestEventWithRefParam() иў«и°ѓз”Ё - Param0: ").Append(Param0).Append(" -> ").Append(local_2));
        Param0 = local_2;
        return;
    }
    void TestEventWithObjectParam_Implementation(const AActor Param0)
    {
        if (Param0 != nullptr)
        {
            XLog(ELog(0), FString().Append("TestScriptOverrideAS::TestEventWithObjectParam() иў«и°ѓз”Ё - Param0: ").Append(Param0));
            return;
        }
        XLog(ELog(0), "TestScriptOverrideAS::TestEventWithObjectParam() иў«и°ѓз”Ё - Param0: nullptr");
        return;
    }
    void TestEventWithStructParam_Implementation(const FVector3f &inout Param0, FVector3f &inout Param1)
    {
        XLog(ELog(0), "TestScriptOverrideAS::TestEventWithStructParam() иў«и°ѓз”Ё");
        ELog local_10;
        (FString("  Param0: X=") + local_10);
        FString local_6 = (local_10 + ", Y=");
        (local_6 + local_10);
        FString local_6_2 = (local_10 + ", Z=");
        (local_6_2 + local_10);
        (FString("  Param1: X=") + local_10);
        FString local_6_3 = (local_10 + ", Y=");
        (local_6_3 + local_10);
        FString local_6_4 = (local_10 + ", Z=");
        (local_6_4 + local_10);
        XLog(ELog(0), "  е·Ідї®ж”№ Param2 дёє: X=100.0, Y=200.0, Z=300.0");
        return;
    }
    void TestEventWithArrayParam_Implementation(const TArray<int> &inout Param0)
    {
        XLog(ELog(0), "TestScriptOverrideAS::TestEventWithArrayParam() иў«и°ѓз”Ё");
        XLog(ELog(0), (FString("  ж•°з»„е¤§е°Џ: ") + Param0.Num()));
        if (Param0.Num() > 0)
        {
            FString local_16 = "[";
            int local_17 = 0;
            for (; local_17 < Param0.Num(); )
            {
                if (local_17 > 0)
                {
                    local_16 += ", ";
                }
                local_16 += Param0[local_17];
                ++local_17;
            }
            local_16 += "]";
            XLog(ELog(0), (FString("  ж•°з»„е†…е®№: ") + local_16));
            return;
        }
        XLog(ELog(0), "  ж•°з»„дёєз©є");
        return;
    }
    int TestFunc_Implementation() const
    {
        XLog(ELog(0), "TestScriptOverrideAS::TestFunc() иў«и°ѓз”Ё");
        int local_2 = 42;
        XLog(ELog(0), FString().Append("  иї”е›ћз»“жћњ: ").Append(local_2));
        return local_2;
    }
    AActor TestFunc_Obj_Implementation()
    {
        XLog(ELog(0), "TestScriptOverrideAS::TestFunc_Obj() иў«и°ѓз”Ё");
        if (this.SomeActor != nullptr)
        {
            XLog(ELog(0), FString().Append("  иї”е›ћз»“жћњ: ").Append(this.SomeActor));
        }
        else
        {
            XLog(ELog(0), "  иї”е›ћз»“жћњ: nullptr");
        }
        return this.SomeActor;
    }
    FString TestFunc_Struct_Implementation()
    {
        XLog(ELog(0), "TestScriptOverrideAS::TestFunc_Struct() иў«и°ѓз”Ё");
        FString local_6 = "Hello from Script!";
        XLog(ELog(0), FString().Append("  иї”е›ћз»“жћњ: ").Append(local_6));
        return local_6;
    }
    FVector3f TestFunc_Ref_Implementation()
    {
        FVector3f __r;
        XLog(ELog(0), "TestScriptOverrideAS::TestFunc_Ref() иў«и°ѓз”Ё");
        this.SomeVector.X = 1065353216;
        this.SomeVector.Y = 1073741824;
        this.SomeVector.Z = 1077936128;
        XLog(ELog(0), FString().Append("  иї”е›ћз»“жћњ: X=").Append(this.SomeVector.X).Append(", Y=").Append(this.SomeVector.Y).Append(", Z=").Append(this.SomeVector.Z));
        return __r;
    }
    const TArray<int> TestFunc_ConstRef_Implementation() const
    {
        const TArray<int> __r;
        XLog(ELog(0), "TestScriptOverrideAS::TestFunc_ConstRef() иў«и°ѓз”Ё");
        return __r;
    }
}

struct FTest_ScriptOverrideAS_A : FTest_ScriptOverrideNativeDerivedEmpty
{
    FTest_ScriptOverrideNativeDerivedEmpty _base_FTest_ScriptOverrideNativeDerivedEmpty;

    FTest_ScriptOverrideAS_A()
    {
        this.__InitDefaults();
        return;
    }
    FString TestFunc_Struct_Implementation()
    {
        FString local_4 = "TestScriptOverrideAS_A";
        XLog(ELog(0), FString().Append(local_4).Append("::TestFunc_Struct() иў«и°ѓз”Ё"));
        return local_4;
    }
}

struct FTest_ScriptOverrideAS_B : FTest_ScriptOverrideNativeDerivedEmpty
{
    FTest_ScriptOverrideNativeDerivedEmpty _base_FTest_ScriptOverrideNativeDerivedEmpty;

    FTest_ScriptOverrideAS_B()
    {
        return;
    }
}

