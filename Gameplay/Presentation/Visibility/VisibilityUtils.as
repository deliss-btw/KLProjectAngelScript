
namespace FVisibilityUtils
{
UFUNCTION()
void SetEntityMeshHidden(const FECSEntity &inout Entity, const FName &inout MeshName, const bool bNewHidden)
{
    int local_14 = 0;
    int local_17 = 0;
    int local_18 = 0;
    if (!(Entity.IsValid()))
    {
        XError(ELog(8), FString().Append("Call SetEntityMeshHidden: Entity is invalid"));
        return;
    }
    if (bNewHidden)
    {
        int local_16 = local_14.GetModify_HiddenCountByName().FindOrAdd(MeshName);
        ++local_16;
        local_17 = int(local_16);
        if (local_17 == 0)
        {
        }
    }
    else
    {
        if (local_14.GetModify_HiddenCountByName().Find(MeshName))
        {
            local_18 = local_18 - 1;
            if (local_17 == 0)
            {
            }
        }
        else
        {
            local_18 = -1;
            local_14.GetModify_HiddenCountByName().Add(MeshName, local_18);
        }
    }
    if (local_14.GetHiddenCountByName().Num() == 0)
    {
        Remove local_26;
        local_26.opCall();
    }
    return;
}
}
