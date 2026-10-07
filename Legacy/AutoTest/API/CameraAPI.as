
namespace AutoTest::API::CameraAPI
{
FRotator GetViewDir()
{
    int local_12 = 0;
    ThrowIf(!(ECS::GetECSWorld().IsValid()), "ECSWorld is invalid.");
    bool local_5 = !(local_12);
    ThrowIf(local_5, "FCS_InputLocal is null.");
    return local_12.ViewDir;
}
void SetViewDir(const float32 Pitch, const float32 Yaw, const float32 Roll)
{
    int local_12 = 0;
    ThrowIf(!(ECS::GetECSWorld().IsValid()), "ECSWorld is invalid.");
    bool local_5 = !(local_12);
    ThrowIf(local_5, "FCS_InputLocal is null.");
    local_12.ViewDir = FRotator(Pitch, Yaw, Roll);
    return;
}
bool IsLockTarget()
{
    ThrowIf(!(AutoTest::CommonUtils::GetLocalAvatarEntity().IsValid()), "AvatarEntity is invalid.");
    Has local_14;
    return local_14.opCall();
}
bool IsHardLockTarget()
{
    int local_16 = 0;
    FECSEntity local_8 = AutoTest::CommonUtils::GetLocalAvatarEntity();
    ThrowIf(!(local_8.IsValid()), "AvatarEntity is invalid.");
    if (!(local_16))
    {
        return false;
    }
    return (int(local_16.GetType()) == 2);
}
}
