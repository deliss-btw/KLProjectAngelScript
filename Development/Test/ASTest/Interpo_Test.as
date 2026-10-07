

struct FTestInterpo
{
    UPROPERTY()
    float32 A;
    UPROPERTY()
    float32 B;

    FTestInterpo(const float32 A_, const float32 B_)
    {
        this.A = A_;
        this.B = B_;
        return;
    }
}

namespace FTestInterpo
{
FTestInterpo Interpolate(const FTestInterpo &inout A, const FTestInterpo &inout B, const float32 T, const float32 DeltaTime)
{
    return FTestInterpo(FMath::Lerp(A.A, B.A, T), FMath::Lerp(A.B, B.B, T));
}
}
void Test_Interpo(FUnitTest &inout T)
{
    TInterpoHistory<FTestInterpo, auto> local_18;
    T.AssertEquals(0, local_18.Num(), "");
    T.AssertEquals(3, local_18.Space(), "");
    local_18.Enqueue(FTestInterpo(1.0f, 2.0f), FFPTime(1));
    T.AssertEquals(1, local_18.Num(), "");
    T.AssertEquals(2, local_18.Space(), "");
    T.AssertEquals(1.0, local_18.PeekBack(0).GetTime().ToSeconds(), "");
    T.AssertEquals(1.0, local_18.PeekFront(0).GetTime().ToSeconds(), "");
    T.AssertEquals(1.0, local_18.GetLatestTime().ToSeconds(), "");
    local_18.Enqueue(FTestInterpo(4.0f, 3.0f), FFPTime(2));
    T.AssertEquals(2, local_18.Num(), "");
    T.AssertEquals(1, local_18.Space(), "");
    T.AssertEquals(2.0, local_18.PeekBack(0).GetTime().ToSeconds(), "");
    T.AssertEquals(1.0, local_18.PeekBack(1).GetTime().ToSeconds(), "");
    T.AssertEquals(1.0, local_18.PeekFront(0).GetTime().ToSeconds(), "");
    T.AssertEquals(2.0, local_18.PeekFront(1).GetTime().ToSeconds(), "");
    T.AssertEquals(2.0, local_18.GetLatestTime().ToSeconds(), "");
    local_18.EnqueueAndFlush(FTestInterpo(5.0f, 7.0f), FFPTime(4));
    T.AssertEquals(3, local_18.Num(), "");
    T.AssertEquals(0, local_18.Space(), "");
    T.AssertEquals(4.0, local_18.PeekBack(0).GetTime().ToSeconds(), "");
    T.AssertEquals(1.0, local_18.PeekFront(0).GetTime().ToSeconds(), "");
    T.AssertEquals(4.0, local_18.GetLatestTime().ToSeconds(), "");
    local_18.EnqueueAndFlush(FTestInterpo(8.0f, 6.0f), FFPTime(5));
    T.AssertEquals(3, local_18.Num(), "");
    T.AssertEquals(0, local_18.Space(), "");
    T.AssertEquals(5.0, local_18.PeekBack(0).GetTime().ToSeconds(), "");
    T.AssertEquals(2.0, local_18.PeekFront(0).GetTime().ToSeconds(), "");
    T.AssertEquals(5.0, local_18.GetLatestTime().ToSeconds(), "");
    FInterpoHistorySample local_36 = local_18.FindIndex(FFPTime(6));
    T.AssertEquals(0, int(local_36.FromIndex), "");
    T.AssertEquals(0, int(local_36.ToIndex), "");
    T.AssertAlmostEquals(1.0, local_36.T, 0.0001, "");
    T.AssertAlmostEquals(0.0, local_36.InterpoDeltaTime, 0.0001, "");
    T.AssertAlmostEquals(6.0, local_36.InterpoTime.ToSeconds(), 0.0001, "");
    FInterpoHistorySample local_42 = local_18.FindIndex(FFPTime(3));
    T.AssertEquals(2, int(local_42.FromIndex), "");
    T.AssertEquals(1, int(local_42.ToIndex), "");
    T.AssertAlmostEquals(0.5f, local_42.T, 0.0001f, "");
    T.AssertAlmostEquals(2.0, local_42.InterpoDeltaTime, 0.0001, "");
    T.AssertAlmostEquals(3.0, local_42.InterpoTime.ToSeconds(), 0.0001, "");
    FInterpoHistorySample local_50 = local_18.FindIndex(FFPTime(1));
    T.AssertEquals(2, int(local_50.FromIndex), "");
    T.AssertEquals(2, int(local_50.ToIndex), "");
    T.AssertAlmostEquals(0.0, local_50.T, 0.0001, "");
    T.AssertAlmostEquals(0.0, local_50.InterpoDeltaTime, 0.0001, "");
    T.AssertAlmostEquals(1.0, local_50.InterpoTime.ToSeconds(), 0.0001, "");
    FTestInterpo local_60;
    T.AssertTrue(local_18.GetInterpoValue(FFPTime(3), local_60), "");
    T.AssertAlmostEquals(4.5f, local_60.A, 0.0001f, "");
    T.AssertAlmostEquals(5.0, local_60.B, 0.0001, "");
    FTestInterpo local_64;
    T.AssertTrue(local_18.GetStepValue(FFPTime(3), local_64), "");
    T.AssertAlmostEquals(4.0, local_64.A, 0.0001, "");
    T.AssertAlmostEquals(3.0, local_64.B, 0.0001, "");
    return;
}
