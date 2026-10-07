
namespace AutoTest::CommonUtils
{
FECSEntity GetLocalAvatarEntity()
{
    int local_12 = 0;
    ThrowIf(!(ECS::GetECSWorld().IsValid()), "ECSWorld is null.");
    bool local_5 = !(local_12);
    ThrowIf(local_5, "LocalPlayer is null.");
    FECSEntity local_16 = FECSEntity(local_12.GetPlayerPawnEntity());
    ThrowIf(!(local_16.IsValid()), "LocalPlayerPawnEntity is invalid.");
    Get local_24;
    const FC_MountIsDrivenBy& local_26 = local_24.opCall();
    if (local_26)
    {
        return local_26.GetDriverEntity();
    }
    return local_16;
}
FECSEntity GetLocalPlayerEntity()
{
    int local_12 = 0;
    ThrowIf(!(ECS::GetECSWorld().IsValid()), "ECSWorld is null.");
    bool local_5 = !(local_12);
    ThrowIf(local_5, "LocalPlayer is null.");
    return local_12.PlayerEntity;
}
ULocalPlayer GetULocalPlayer()
{
    int local_12 = 0;
    ThrowIf(!(ECS::GetECSWorld().IsValid()), "ECSWorld is null.");
    bool local_5 = !(local_12);
    ThrowIf(local_5, "LocalPlayer is null.");
    return local_12.UEPlayerController.GetLocalPlayer();
}
FDataObjectPtr FindDataObjectByRowName(const UScriptStruct Class, const FString &inout RowName)
{
    FDataObjectPtr local_24;
    FDataObjectIterator local_56 = FDataObjectIterator(Class);
    for (; local_56; )
    {
        if ((local_56.GetDataPtr().GetDataName() == RowName))
        {
            local_24 = local_56.GetDataPtr();
            break;
        }
        local_56.Next();
    }
    return local_24;
}
}
