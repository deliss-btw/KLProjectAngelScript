
namespace AutoTest::API::NavAPI
{
float GetViewYawToTarget(const int PawnEntityId, const FVector &inout TargetLocation)
{
    int local_16 = 0;
    ThrowIf(!(FECSEntity(PawnEntityId).IsValid()), "PawnEntity is invalid.");
    bool local_9 = !(local_16);
    ThrowIf(local_9, FString().Append("FC_Transform is null."));
    TDataObjectPtr<FAIMoveConfig> local_44;
    TDataObjectIterator<FAIMoveConfig> local_60;
    for (; local_60; )
    {
        const FAIMoveConfig& local_62 = local_60.GetData();
        if ((local_62.GetDataName() == FName("Default")))
        {
            local_44 = TDataObjectPtr<FAIMoveConfig>(local_62);
            break;
        }
        local_60.Next();
    }
    ThrowIf(!(local_44), "Failed to find MoveConfig.");
    TDataObjectPtr<FAIMoveProclivityConfig> local_138;
    TDataObjectIterator<FAIMoveProclivityConfig> local_154;
    for (; local_154; )
    {
        const FAIMoveProclivityConfig& local_156 = local_154.GetData();
        if ((local_156.GetDataName() == FName("Default_GroundOnly")))
        {
            local_138 = TDataObjectPtr<FAIMoveProclivityConfig>(local_156);
            break;
        }
        local_154.Next();
    }
    bool local_9_3 = !(local_138);
    ThrowIf(local_9_3, "Failed to find MoveProclivityConfig.");
    FAIPathSession local_298 = FAIPathSessionUtils::FindPathSync(GetCurrentWorld(), local_16.GetPosition(), TargetLocation, local_44, local_138);
    if (local_298.PathPoints.Num() < 2)
    {
        XLog(ELog(50), "Failed to find path or path is too short.");
        return 0.0;
    }
    FVector local_414 = (FVector(local_298.PathPoints[1].Position) - local_16.GetPosition());
    local_414.Z = 0.0;
    local_414.Normalize(9.99999993922529e-9);
    return local_414.ToOrientationRotator().Yaw;
}
}
