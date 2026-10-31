void Test_PlayerInfoAttr(FUnitTest &inout T)
{
    TPlayerInfoAttr<int> local_2;
    T.AssertFalse(local_2.HasValue(), "");
    T.AssertTrue((int(local_2.GetTrust()) == 0), "");
    T.AssertTrue((int(local_2.GetMinTrust()) == 1), "");
    T.AssertEquals(0, local_2.Get(), "");
    T.AssertTrue(local_2.Set(EPlayerInfoTrust(1), 42), "");
    T.AssertTrue(local_2.HasValue(), "");
    T.AssertEquals(42, local_2.Get(), "");
    T.AssertTrue((int(local_2.GetTrust()) == 1), "");
    T.AssertTrue(local_2.Set(EPlayerInfoTrust(2), 100), "");
    T.AssertEquals(100, local_2.Get(), "");
    T.AssertTrue((int(local_2.GetTrust()) == 2), "");
    T.AssertFalse(local_2.Set(EPlayerInfoTrust(1), 200), "");
    T.AssertEquals(100, local_2.Get(), "");
    T.AssertTrue((int(local_2.GetTrust()) == 2), "");
    T.AssertTrue(local_2.Set(EPlayerInfoTrust(2), 150), "");
    T.AssertEquals(150, local_2.Get(), "");
    T.AssertTrue(local_2.Set(EPlayerInfoTrust(3), 999), "");
    T.AssertEquals(999, local_2.Get(), "");
    T.AssertTrue((int(local_2.GetTrust()) == 3), "");
    T.AssertTrue(local_2.Invalidate(EPlayerInfoTrust(3)), "");
    T.AssertTrue((int(local_2.GetTrust()) == 0), "");
    T.AssertFalse(local_2.HasValue(), "");
    T.AssertEquals(0, local_2.Get(), "");
    T.AssertTrue(local_2.Set(EPlayerInfoTrust(1), 50), "");
    T.AssertEquals(50, local_2.Get(), "");
    T.AssertTrue((int(local_2.GetTrust()) == 1), "");
    T.AssertFalse(local_2.Invalidate(EPlayerInfoTrust(3)), "");
    T.AssertTrue((int(local_2.GetTrust()) == 1), "");
    T.AssertEquals(50, local_2.Get(), "");
    TPlayerInfoAttr<int> local_8;
    local_8.SetMinTrust(EPlayerInfoTrust(2));
    T.AssertTrue((int(local_8.GetMinTrust()) == 2), "");
    T.AssertFalse(local_8.Set(EPlayerInfoTrust(1), 10), "");
    T.AssertFalse(local_8.HasValue(), "");
    T.AssertTrue(local_8.Set(EPlayerInfoTrust(2), 20), "");
    T.AssertEquals(20, local_8.Get(), "");
    TPlayerInfoAttr<int> local_10;
    T.AssertFalse(local_10.Set(EPlayerInfoTrust(0), 1), "");
    T.AssertFalse(local_10.HasValue(), "");
    return;
}
void Test_PlayerInfoAttr_String(FUnitTest &inout T)
{
    TPlayerInfoAttr<FString> local_6;
    T.AssertFalse(local_6.HasValue(), "");
    T.AssertEquals(FString(), local_6.Get(), "");
    T.AssertTrue(local_6.Set(EPlayerInfoTrust(2), "Hello"), "");
    T.AssertEquals("Hello", local_6.Get(), "");
    T.AssertTrue(local_6.HasValue(), "");
    T.AssertTrue(local_6.Set(EPlayerInfoTrust(2), "World"), "");
    T.AssertEquals("World", local_6.Get(), "");
    T.AssertTrue(local_6.Invalidate(EPlayerInfoTrust(2)), "");
    T.AssertEquals(FString(), local_6.Get(), "");
    T.AssertTrue((int(local_6.GetTrust()) == 0), "");
    T.AssertFalse(local_6.HasValue(), "");
    return;
}
void Test_PlayerInfoAttr_Equals(FUnitTest &inout T)
{
    TPlayerInfoAttr<int> local_2;
    TPlayerInfoAttr<int> local_4;
    T.AssertTrue((local_2 == local_4), "");
    local_2.Set(EPlayerInfoTrust(1), 10);
    T.AssertFalse((local_2 == local_4), "");
    local_4.Set(EPlayerInfoTrust(1), 10);
    T.AssertTrue((local_2 == local_4), "");
    local_4.Set(EPlayerInfoTrust(2), 10);
    T.AssertFalse((local_2 == local_4), "");
    local_2.Set(EPlayerInfoTrust(2), 10);
    T.AssertTrue((local_2 == local_4), "");
    return;
}
void Test_PlayerInfoAttr_Copy(FUnitTest &inout T)
{
    TPlayerInfoAttr<FString> local_6;
    local_6.Set(EPlayerInfoTrust(3), "CopyMe");
    local_6.SetMinTrust(EPlayerInfoTrust(2));
    TPlayerInfoAttr<FString> local_14;
    T.AssertTrue(local_14.HasValue(), "");
    T.AssertEquals("CopyMe", local_14.Get(), "");
    T.AssertTrue((int(local_14.GetTrust()) == 3), "");
    T.AssertTrue((int(local_14.GetMinTrust()) == 2), "");
    T.AssertTrue((local_14 == local_6), "");
    TPlayerInfoAttr<FString> local_22;
    local_22 = local_6;
    T.AssertEquals("CopyMe", local_22.Get(), "");
    T.AssertTrue((int(local_22.GetTrust()) == 3), "");
    T.AssertTrue((local_22 == local_6), "");
    return;
}
void Test_PlayerInfoAttr_ToString(FUnitTest &inout T)
{
    TPlayerInfoAttr<int> local_2;
    FString local_10 = local_2.ToString();
    T.AssertTrue(local_10.Contains("None", ESearchCase(1), ESearchDir(0)), "");
    T.AssertTrue(local_10.Contains("HasValue=false", ESearchCase(1), ESearchDir(0)), "");
    local_2.Set(EPlayerInfoTrust(2), 42);
    local_10 = local_2.ToString();
    T.AssertTrue(local_10.Contains("42", ESearchCase(1), ESearchDir(0)), "");
    T.AssertTrue(local_10.Contains("Reliable", ESearchCase(1), ESearchDir(0)), "");
    T.AssertTrue(local_10.Contains("HasValue=true", ESearchCase(1), ESearchDir(0)), "");
    return;
}
void Test_PlayerInfoAttr_MinTrustClearing(FUnitTest &inout T)
{
    TPlayerInfoAttr<int> local_2;
    local_2.Set(EPlayerInfoTrust(3), 777);
    T.AssertTrue(local_2.HasValue(), "");
    T.AssertTrue(local_2.Invalidate(EPlayerInfoTrust(3)), "");
    T.AssertFalse(local_2.HasValue(), "");
    T.AssertEquals(0, local_2.Get(), "");
    T.AssertTrue((int(local_2.GetTrust()) == 0), "");
    TPlayerInfoAttr<int> local_8;
    local_8.SetMinTrust(EPlayerInfoTrust(0));
    local_8.Set(EPlayerInfoTrust(3), 888);
    T.AssertTrue(local_8.Invalidate(EPlayerInfoTrust(3)), "");
    T.AssertTrue(local_8.HasValue(), "");
    T.AssertEquals(888, local_8.Get(), "");
    T.AssertTrue((int(local_8.GetTrust()) == 0), "");
    TPlayerInfoAttr<int> local_10;
    local_10.SetMinTrust(EPlayerInfoTrust(2));
    local_10.Set(EPlayerInfoTrust(2), 111);
    T.AssertTrue(local_10.Invalidate(EPlayerInfoTrust(2)), "");
    T.AssertFalse(local_10.HasValue(), "");
    T.AssertEquals(0, local_10.Get(), "");
    return;
}
void Test_PlayerInfoAttr_AtomicFallback(FUnitTest &inout T)
{
    TPlayerInfoAttr<int> local_2;
    local_2.Set(EPlayerInfoTrust(3), 100);
    T.AssertTrue(local_2.Invalidate(EPlayerInfoTrust(3), EPlayerInfoTrust(2), 50), "");
    T.AssertTrue(local_2.HasValue(), "");
    T.AssertEquals(50, local_2.Get(), "");
    T.AssertTrue((int(local_2.GetTrust()) == 2), "");
    TPlayerInfoAttr<int> local_9;
    local_9.SetMinTrust(EPlayerInfoTrust(2));
    local_9.Set(EPlayerInfoTrust(3), 200);
    T.AssertTrue(local_9.Invalidate(EPlayerInfoTrust(3), EPlayerInfoTrust(1), 99), "");
    T.AssertFalse(local_9.HasValue(), "");
    T.AssertEquals(0, local_9.Get(), "");
    T.AssertTrue((int(local_9.GetTrust()) == 0), "");
    TPlayerInfoAttr<int> local_11;
    local_11.Set(EPlayerInfoTrust(2), 300);
    T.AssertFalse(local_11.Invalidate(EPlayerInfoTrust(3), EPlayerInfoTrust(1), 1), "");
    T.AssertEquals(300, local_11.Get(), "");
    T.AssertTrue((int(local_11.GetTrust()) == 2), "");
    return;
}
void Test_PlayerInfoAttr_EndToEnd_Degradation(FUnitTest &inout T)
{
    TPlayerInfoAttr<FString> local_6;
    local_6.Set(EPlayerInfoTrust(3), "DSValue");
    T.AssertEquals("DSValue", local_6.Get(), "");
    T.AssertFalse(local_6.Set(EPlayerInfoTrust(2), "GSValue"), "");
    T.AssertEquals("DSValue", local_6.Get(), "");
    T.AssertTrue(local_6.Invalidate(EPlayerInfoTrust(3), EPlayerInfoTrust(2), "GSValue"), "");
    T.AssertEquals("GSValue", local_6.Get(), "");
    T.AssertTrue((int(local_6.GetTrust()) == 2), "");
    T.AssertTrue(local_6.HasValue(), "");
    T.AssertTrue(local_6.Set(EPlayerInfoTrust(2), "Updated"), "");
    T.AssertEquals("Updated", local_6.Get(), "");
    return;
}
