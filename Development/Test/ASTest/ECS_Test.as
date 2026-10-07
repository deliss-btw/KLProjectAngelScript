

class UECSTestCounter : UObject
{
    int Count;

    UECSTestCounter()
    {
        return;
    }
}

void Test_ECSComponentDestruct(FUnitTest &inout T)
{
    int local_26 = 0;
    FECSWorldPtr local_2 = ECS::GetECSWorld();
    UECSTestCounter local_8 = UECSTestCounter();
    FECSEntity local_14 = local_2.Create(EEntityType(0), NAME_None);
    local_26.Counter = local_8;
    ECSInternal::DestroyForTestOnly(local_14);
    T.AssertEquals(1, int(local_8.Count), "");
    return;
}
