
namespace FMonsterPathConnectUtils
{
UFUNCTION()
bool MonsterPathConnectTest(const UObject WorldContextObject, const FVector &inout Start, const FVector &inout End, const TDataObjectPtr<FMonsterMainConfig> &inout MonsterConfig)
{
    if (!(MonsterConfig))
    {
        return false;
    }
    UWorld local_4 = WorldContextObject.GetWorld();
    if (local_4 == nullptr)
    {
        return false;
    }
    TSoftClassPtr<ACharacterPrefab> local_16;
    local_16.GetSoftCombatPrefab();
    if (local_16.IsNull())
    {
        return false;
    }
    if (!(local_16.IsValid()) && local_16.IsPending())
    {
        local_16.ToSoftObjectPath().TryLoad();
    }
    TSubclassOf<ACharacterPrefab> local_40 = local_16.Get();
    if ((local_40 == nullptr))
    {
        return false;
    }
    ACharacterPrefab local_44 = local_40.GetDefaultObject();
    if (local_44 == nullptr || !(local_44.AI.bHas_FC_AINavAgent))
    {
        return false;
    }
    TDataObjectPtr<FAIMoveConfig> local_70 = local_44.AI.Config_FC_AINavAgent.GetMoveAbilityConfig();
    if (!(local_70))
    {
        return false;
    }
    float32 local_95 = -1.0f;
    if (local_44.Physics.bTraitEnable)
    {
        float32 local_96 = local_44.Physics.Config_FC_Collision.GetScaledHalfHeight();
        if (local_96 > 0.0f)
        {
            local_95 = local_96;
        }
    }
    EKLMoveAbilityMask local_98;
    return FAIPathSessionUtils::IsPathConnected(local_4, Start, End, local_70, local_98, local_95);
}
}
