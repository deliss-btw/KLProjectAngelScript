
namespace FAppendantEntityUtils
{
FECSEntity SpawnAppendantEntityByParam(const FECSEntity &inout Owner, const TSubclassOf<AECSPrefab> &inout Prefab, const bool bPredictable, const FSpawnAppendantEntityParam &inout Params)
{
    int local_66 = 0;
    int local_106 = 0;
    if (!(ECS::GetRuntimeInfo().IsServer && Owner.IsValid()))
    {
        return ENTITY_NULL;
    }
    FECSEntity local_10 = FECSSpawnUtils::SpawnAppendantEntity(Owner, Prefab, bPredictable, true, Params.Position, Params.Rotation);
    if (Params.bUseOwnerAttackerValues)
    {
        FC_AttackerAttributeValueProvider local_20 = FC_AttackerAttributeValueProvider();
        Assign local_14;
        local_14.opCall(local_20).SetProviderEntity(Owner);
    }
    if (Params.bAttachToOwner)
    {
        local_66.SetAttachToEntity(Owner);
        if (Params.AttachToSocketName.IsNone())
        {
            local_66.SetAttachmentMode(ETransformAttachmentLogicMode(1));
        }
        else
        {
            local_66.SetAttachmentMode(ETransformAttachmentLogicMode(0));
            local_66.SetSocketName(Params.AttachToSocketName);
        }
        local_66.SetLocationOffset(Params.Position);
        local_66.SetRotationOffset(Params.Rotation);
        local_106.SetAttachToEntity(Owner);
        local_106.SetSocketName(Params.AttachToSocketName);
        local_106.SetLocationOffset(Params.Position);
        local_106.SetRotationOffset(Params.Rotation);
    }
    return local_10;
}
}
