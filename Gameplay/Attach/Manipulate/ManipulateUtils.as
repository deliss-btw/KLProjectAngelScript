namespace FManipulateUtils
{
UFUNCTION()
void CleanupManipulatedByCurve(const FECSEntity &inout SlaveEntity, const FECSEntity &inout MasterEntity)
{
    Remove local_4;
    local_4.opCall();
    Modify local_10;
    FC_CharacterMovement& local_12 = local_10.opCall();
    if (local_12)
    {
        local_12.GetModify_AttachIgnoreCollisionEntities().Remove(MasterEntity);
    }
    Has local_18;
    bool local_5 = local_18.opCall();
    if (local_5)
    {
        FC_CharacterMovement& local_12_2 = local_10.opCall();
        if (local_12_2)
        {
            local_12_2.GetModify_AttachIgnoreCollisionEntities().Remove(SlaveEntity);
        }
    }
    Remove local_22;
    local_22.opCall();
    return;
}
}
