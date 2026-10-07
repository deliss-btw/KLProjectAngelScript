

struct FTestAnalyzeASAccessor
{
    UPROPERTY()
    FECSEntity Entity;

    FTestAnalyzeASAccessor()
    {
        return;
    }
    int ReadA() const
    {
        Get local_4;
        return local_4.opCall().TestData0;
    }
    void WriteA(const int V)
    {
        Modify local_4;
        local_4.opCall().TestData0 = V;
        return;
    }
    void EnsureB()
    {
        ModifyOrAdd local_4;
        local_4.opCall();
        return;
    }
    bool HasC() const
    {
        Has local_4;
        return local_4.opCall();
    }
}

namespace TestAnalyzeASUtils
{
void Touch(const FECSEntity &inout Entity)
{
    Get local_4;
    local_4.opCall();
    return;
}
void Touch(const FECSEntity &inout Entity, const int Value)
{
    Get local_4;
    local_4.opCall();
    Modify local_8;
    local_8.opCall().Value = Value;
    return;
}
void Touch(const FECSEntity &inout Entity, const bool bStructural)
{
    ModifyOrAdd local_4;
    local_4.opCall();
    return;
}
void Level3_WriteC(const FECSEntity &inout Entity)
{
    ModifyOrAdd local_4;
    local_4.opCall().Value = 1;
    return;
}
void Level2_CallsLevel3(const FECSEntity &inout Entity)
{
    TestAnalyzeASUtils::Level3_WriteC(Entity);
    return;
}
void Level1_CallsLevel2(const FECSEntity &inout Entity)
{
    TestAnalyzeASUtils::Level2_CallsLevel3(Entity);
    return;
}
void CycleA(const FECSEntity &inout Entity)
{
    Get local_4;
    local_4.opCall();
    TestAnalyzeASUtils::CycleB(Entity);
    return;
}
void CycleB(const FECSEntity &inout Entity)
{
    Modify local_4;
    local_4.opCall().Value = 1;
    TestAnalyzeASUtils::CycleC(Entity);
    return;
}
void CycleC(const FECSEntity &inout Entity)
{
    ModifyOrAdd local_4;
    local_4.opCall();
    TestAnalyzeASUtils::CycleA(Entity);
    return;
}
void SendAnalyzeEvent(const FECSEntity &inout Entity)
{
    FFPTime local_6 = FFPTime(-1);
    SendEvent local_4;
    local_4.opCall(local_6).TestData0 = 1;
    return;
}
}
