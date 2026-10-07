
namespace FBeHitUtils
{
void HandleBeHitContext(const FECSEntity &inout Entity, const int Frame)
{
    Modify local_4;
    FC_DisableSyncNetTime& local_6 = local_4.opCall();
    if (local_6)
    {
        local_6.SetHandleFrame(Frame);
    }
    return;
}
void ClearBeHitContext(const FECSEntity &inout Entity)
{
    Get local_4;
    const FC_DisableSyncNetTime& local_6 = local_4.opCall();
    if (local_6)
    {
        if (local_6.GetHandleFrame() >= local_6.GetEnterFrame())
        {
            Remove local_14;
            local_14.opCall();
        }
    }
    return;
}
}
