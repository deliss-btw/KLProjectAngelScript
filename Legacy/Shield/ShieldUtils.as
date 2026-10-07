
namespace FShieldUtils
{
    const FString EntityNamePrefix_Shield = FString();

FECSEntity CreateShield(const FECSEntity &inout ShieldOwnerEntity, const FName &inout ShieldName, const FShieldBaseData &inout BaseData, const EShieldType Type, const float32 ShieldMaxHP, const float32 ShieldInitHP)
{
    FECSEntity local_4;
    int local_12 = 0;
    int local_138 = 0;
    if (ECS::GetRuntimeInfo().IsClient)
    {
        return local_4;
    }
    FName local_28 = FName((FString(FShieldUtils::EntityNamePrefix_Shield) + ShieldName.ToString()));
    local_4 = ECS::CreateEmptyEntity(ShieldOwnerEntity.GetWorld(), EECSRegType(0), 6, local_28, false);
    Assign local_40;
    local_40.opCall(FC_LocalTag());
    ModifyOrAdd local_46;
    local_46.opCall().SetOwnerEntity(ShieldOwnerEntity);
    ModifyOrAdd local_50;
    local_50.opCall().RelevancePolicyType = (4 != 0);
    Get local_56;
    const FC_NetPredict& local_58 = local_56.opCall();
    if (local_58)
    {
        FECSNetUtils::SetNetPredict(local_4, local_58.GetMask());
    }
    local_138.SetShieldOwner(ShieldOwnerEntity);
    local_138.SetShieldName(ShieldName);
    local_138.SetShieldType(EShieldType(Type));
    local_138.SetBaseData(BaseData);
    int local_139 = BaseData.GetbHasRecoverMaxCountAfterBroken() ? BaseData.GetRecoverMaxCount_Broken() : -1;
    local_138.SetBrokenRecorverCount(local_139);
    local_138.GetModify_ShieldMaxHP().SetUpdated(ShieldMaxHP, ShieldMaxHP, FFPTime(0));
    local_138.GetModify_ShieldHP().SetUpdated(ShieldInitHP, ShieldInitHP, FFPTime(0));
    local_138.SetAssignTime(BlueprintFunctions_Common::GetWorldTime(ShieldOwnerEntity));
    if (int(Type) == 0)
    {
        FECSEntityId local_143;
        if (local_12.GetNamedInherentShields().Find(ShieldName, local_143))
        {
            FECSEntity(local_143).DestroyDeferred();
        }
        local_12.GetModify_NamedInherentShields().Add(ShieldName, local_4.GetId());
    }
    else
    {
    }
    return local_4;
}
FECSEntity GetShieldEntityByName(const FC_ShieldOwner &inout ShieldOwner, const FName &inout ShieldName)
{
    FECSEntityId local_1;
    if (ShieldOwner.GetNamedInherentShields().Find(ShieldName, local_1))
    {
        FECSEntity local_6 = FECSEntity(local_1);
        Has local_10;
        bool local_2 = local_10.opCall();
        if (local_2)
        {
            return local_6;
        }
    }
    return ENTITY_NULL;
}
void SetShieldActive(FC_Shield &inout Shield, const bool bActive, const FFPTime &inout Time)
{
    int local_10 = 0;
    int local_18 = 0;
    if (bActive && !(Shield.GetbShieldActive()))
    {
        Shield.SetbShieldActive(true);
        if (Shield.GetBaseData().GetbRecoverWhenDeactive())
        {
            float32 local_4 = Shield.GetShieldHP().Evaluate(Time);
            Shield.GetModify_ShieldHP().SetUpdated(local_4, local_4, Time);
        }
        local_10.ShieldName = Shield.GetShieldName();
        return;
    }
    if (!(bActive) && Shield.GetbShieldActive())
    {
        Shield.SetbShieldActive(false);
        Shield.SetDeactivateTime(Time);
        if (Shield.GetBaseData().GetbRecoverWhenActive())
        {
            float32 local_3 = Shield.GetShieldHP().Evaluate(Time);
            Shield.GetModify_ShieldHP().SetUpdated(local_3, local_3, Time);
        }
        local_18.ShieldName = Shield.GetShieldName();
    }
    return;
}
void SetShieldActiveByName(const FECSEntity &inout ShieldOwnerEntity, const FName &inout ShieldName, const bool bActive, const FFPTime &inout Time)
{
    Get local_4;
    const FC_ShieldOwner& local_6 = local_4.opCall();
    if (local_6)
    {
        FECSEntityId local_8;
        if (local_6.GetNamedInherentShields().Find(ShieldName, local_8))
        {
            FECSEntity local_12 = FECSEntity(local_8);
            Modify local_16;
            FC_Shield& local_18 = local_16.opCall();
            if (local_18)
            {
                FShieldUtils::SetShieldActive(local_18, bActive, Time);
            }
        }
    }
    return;
}
void DestoryShield(const FECSEntity &inout ShieldEntity, FC_Shield &inout Shield, const FFPTime &inout Time)
{
    if (ECS::GetRuntimeInfo().IsClient)
    {
        return;
    }
    Shield.SetbShieldActive(false);
    ShieldEntity.DestroyDeferred();
    Modify local_6;
    if (local_6.opCall())
    {
        FName local_10 = Shield.GetShieldName();
    }
    return;
}
void DestroyShieldByName(const FC_ShieldOwner &inout ShieldOwner, const FName &inout ShieldName, const FFPTime &inout Time)
{
    if (ECS::GetRuntimeInfo().IsClient)
    {
        return;
    }
    FECSEntityId local_2;
    if (ShieldOwner.GetNamedInherentShields().Find(ShieldName, local_2))
    {
        FECSEntity local_6 = FECSEntity(local_2);
        Modify local_10;
        FC_Shield& local_12 = local_10.opCall();
        if (local_12)
        {
            FShieldUtils::DestoryShield(local_6, local_12, Time);
        }
    }
    return;
}
}
