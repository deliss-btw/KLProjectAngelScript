
namespace AutoTest::API::RoleAPI
{
void ChangeRole(const int SlotIndex, const uint AvatarId)
{
    ThrowIf(!(AutoTest::CommonUtils::GetLocalPlayerEntity().IsValid()), "PlayerEntity is invalid.");
    FFPTime local_16 = FFPTime(-1);
    FCE_ClientToServerChangeRole local_20;
    local_20.SlotIndex = SlotIndex;
    local_20.AvatarId = AvatarId;
    return;
}
}
