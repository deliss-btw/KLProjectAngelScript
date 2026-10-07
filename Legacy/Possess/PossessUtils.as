
namespace FPossessUtils
{
UFUNCTION()
void PossessPropEntity(const FECSEntity &inout PawnEntity, const FECSEntity &inout PropEntity)
{
    bool local_1;
    int local_12 = 0;
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    if (PawnEntity.IsValid() && PropEntity.IsValid())
    {
        ModifyOrAdd local_6;
        local_6.opCall().SetPossessedByEntity(PawnEntity);
        local_12.SetPropEntity(PropEntity);
        local_12.SetbEnableAttach(false);
        Has local_16;
        local_1 = local_16.opCall();
        if (local_1)
        {
            Get local_20;
            ModifyOrAdd local_28;
            local_28.opCall().SetPoolSourceEntity(FECSEntity(local_20.opCall().GetPlayerEntity()));
            Get local_32;
            FECSNetUtils::SetNetPredict(PropEntity, FNetPlayerMask::MakeForPlayerIndex(local_32.opCall().GetPlayerIndex()));
        }
        Get local_40;
        const FC_PossessPropConfig& local_42 = local_40.opCall();
        if (local_42)
        {
            if (local_42.bEnableAttach)
            {
                FECSWorldPtr local_44 = ECS::GetECSWorld();
                local_1 = false;
                local_42.AttachConfig.GetSocketName();
                Assign local_60;
                local_60.opCall(FC_CharacterAimVisualOverrideBlockedTag());
                local_12.SetbEnableAttach(true);
                local_12.SetAttachConfig(local_42.AttachConfig);
            }
        }
    }
    return;
}
UFUNCTION()
void UnPossessPropEntity(const FECSEntity &inout PawnEntity)
{
    int local_8 = 0;
    int local_32 = 0;
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    if (!(local_8))
    {
        return;
    }
    const FECSEntity& local_10 = local_8.GetPropEntity();
    if (local_10.IsValid())
    {
        Remove local_14;
        local_14.opCall();
        Has local_18;
        bool local_1 = local_18.opCall();
        if (local_1)
        {
            Remove local_22;
            local_22.opCall();
            FECSNetUtils::SetNetPredict(local_10, FNetPlayerMask());
        }
    }
    if (local_8.GetbEnableAttach())
    {
        FECSWorldPtr local_26 = ECS::GetECSWorld();
        Has local_36;
        if (!(local_36.opCall()))
        {
            if (local_8.GetAttachConfig().GetbUseDetachOffset())
            {
                FAttachmentUtils::EntityDetach(PawnEntity, local_32.Time, local_8.GetAttachConfig().GetDetachLocationOffset(), local_8.GetAttachConfig().GetDetachRotationOffset(), false, uint8(0), false);
            }
            else
            {
                FAttachmentUtils::EntityDetachWithoutOffset(PawnEntity, local_32.Time, false, uint8(0));
            }
        }
        Remove local_42;
        local_42.opCall();
    }
    Remove local_46;
    local_46.opCall();
    return;
}
UFUNCTION()
void SetPropPossessEnable(const FECSEntity &inout PropEntity, const bool bEnablePossess)
{
    bool local_1;
    if (!(ECS::GetRuntimeInfo().IsServer))
    {
        return;
    }
    if (!(PropEntity.IsValid()))
    {
        local_1 = false;
    }
    else
    {
        Has local_6;
        local_1 = local_6.opCall();
    }
    if (local_1)
    {
        ModifyOrAdd local_12;
        local_12.opCall().SetbEnabled(bEnablePossess);
    }
    return;
}
}
