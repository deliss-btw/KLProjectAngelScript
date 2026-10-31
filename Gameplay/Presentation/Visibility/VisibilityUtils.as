namespace FVisibilityUtils
{
UFUNCTION()
void SetEntityMeshHidden(const FECSEntity &inout Entity, const FName &inout MeshName, const bool bNewHidden)
{
    int local_14 = 0;
    if (!(Entity.IsValid()))
    {
        XError(ELog(8), FString().Append("Call SetEntityMeshHidden: Entity is invalid"));
        return;
    }
    if (bNewHidden)
    {
        int local_16 = local_14.GetModify_HiddenCountByName().FindOrAdd(MeshName);
        ++local_16;
        if (int(local_16) == 0)
        {
            local_14.GetModify_HiddenCountByName().Remove(MeshName);
        }
    }
    else
    {
        TRawPtr<int> local_22 = local_14.GetModify_HiddenCountByName().Find(MeshName);
        if (local_22)
        {
            int local_18 = local_22.Get() - 1;
            if (local_22.Get() == 0)
            {
                local_14.GetModify_HiddenCountByName().Remove(MeshName);
            }
        }
        else
        {
            int local_18_2 = -1;
            local_14.GetModify_HiddenCountByName().Add(MeshName, local_18_2);
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
