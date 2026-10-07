

struct FTestArraySorter
{
    FTestArraySorter()
    {
        return;
    }
    bool opCall(const FString &inout A, const FString &inout B) const
    {
        return (((A + B).opCmp((B + A))) > 0);
    }
}

void Test_ArrayTemplateMethod(FUnitTest &inout T)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
void Test_ECSComponentTemplateMethod(FUnitTest &inout T)
{
    int local_38 = 0;
    int local_44 = 0;
    bool local_45;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    FECSEntity local_10 = local_2.Create(EEntityType(0), NAME_None);
    Has local_18;
    T.AssertFalse(local_18.opCall(), "");
    Get local_24;
    bool local_19 = local_24.opCall();
    T.AssertFalse(local_19, "");
    FC_TestTemplateMethod local_30;
    local_30.A = 123;
    local_30.B = "ABC";
    Assign local_36;
    local_36.opCall(local_30);
    if (local_38)
    {
        local_19 = true;
    }
    else
    {
        local_19 = local_44;
    }
    T.AssertTrue(local_19);
    if (!(local_38))
    {
        local_45 = false;
    }
    else
    {
        local_45 = local_44;
    }
    T.AssertFalse(local_45);
    T.AssertTrue(local_18.opCall(), "");
    T.AssertTrue(local_24.opCall(), "");
    FC_TestTemplateMethod local_48;
    T.AssertTrue(local_48, "");
    T.AssertEquals(123, int(local_48.A), "");
    T.AssertEquals("ABC", local_48.B, "");
    FC_TestTemplateMethod local_56;
    local_56.A = 456;
    T.AssertEquals(456, int(local_48.A), "");
    Has local_60;
    T.AssertFalse(local_60.opCall(), "");
    FC_TestTemplateMethodTag local_66;
    Assign local_64;
    local_64.opCall(local_66);
    T.AssertTrue(local_60.opCall(), "");
    Remove local_70;
    local_70.opCall();
    T.AssertFalse(local_60.opCall(), "");
    return;
}
void Test_ECSEventTemplateMethod(FUnitTest &inout T)
{
    int local_10 = 0;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    FECSEntity local_16 = local_2.Create(EEntityType(0), NAME_None);
    FFPTime local_28 = (FFPTime(local_10.LastTime) + FFPTime(1));
    FCE_TestTemplateMethodEvent local_36;
    local_36.A = 123;
    local_36.B = "ABC";
    T.AssertEquals(n"CE_TestTemplateMethodEvent", local_36.EventType, "");
    T.AssertEquals(local_16.GetIdValue(), local_36.Sender.GetIdValue(), "");
    T.AssertEquals(local_28.ToSeconds(), local_36.Time.ToSeconds(), "");
    T.AssertEquals(123, int(local_36.A), "");
    T.AssertEquals("ABC", local_36.B, "");
    FECSEntity local_20 = local_2.Create(EEntityType(0), NAME_None);
    FFPTime local_30 = (FFPTime(local_10.LastTime) + FFPTime(2));
    FCE_TestTemplateMethodEvent local_56;
    local_56.A = 456;
    local_56.B = "DEF";
    T.AssertEquals(n"CE_TestTemplateMethodEvent", local_56.EventType, "");
    T.AssertEquals(local_20.GetIdValue(), local_56.Sender.GetIdValue(), "");
    T.AssertEquals(local_30.ToSeconds(), local_56.Time.ToSeconds(), "");
    T.AssertEquals(456, int(local_56.A), "");
    T.AssertEquals("DEF", local_56.B, "");
    return;
}
