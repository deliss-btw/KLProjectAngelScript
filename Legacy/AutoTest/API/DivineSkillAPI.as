
namespace AutoTest::API::DivineSkillAPI
{
bool HasDivineSkillUnlocked(const FName &inout DivineSkillName)
{
    UDataTable local_22 = Cast<UDataTable>(FSoftObjectPath("/Script/Engine.DataTable'/Game/MoleRes/Dev/Data/Player/SDT_DivineSkillConfig.SDT_DivineSkillConfig'").ResolveObject());
    UDataTable::FindDataObject local_50;
    TDataObjectPtr<FDivineSkillConfig> local_74 = local_50.opCall(DivineSkillName);
    if ((local_74 == nullptr))
    {
        return false;
    }
    return FMS_DivineSkillData::Get(ECS::GetUEWorld()).IsUnlocked(local_74);
}
void EquipDivineSkillBySkillConfigPath(const FString &inout SkillConfigPath)
{
    int local_142 = 0;
    int local_152 = 0;
    USkillConfig local_2 = (Cast<USkillConfig>(LoadObject(nullptr, SkillConfigPath)));
    if (local_2 == nullptr)
    {
        XError(ELog(0), FString().Append("Failed to load SkillConfig: ").Append(SkillConfigPath));
        return;
    }
    UDataTable local_32 = (Cast<UDataTable>(FSoftObjectPath("/Script/Engine.DataTable'/Game/MoleRes/Dev/Data/Player/SDT_DivineSkillConfig.SDT_DivineSkillConfig'").ResolveObject()));
    if (local_32 == nullptr)
    {
        XError(ELog(0), "Failed to load DivineSkillDataTable");
        return;
    }
    TDataObjectPtr<FDivineSkillConfig> local_58;
    for (auto& local_76 : local_32.GetRowNames())
    {
        UDataTable::FindDataObject local_104;
        TDataObjectPtr<FDivineSkillConfig> local_128 = local_104.opCall(local_76);
        if (local_128 && ((local_128.opArrow().SkillConfig == local_2)))
        {
            local_58 = local_128;
            break;
        }
    }
    if ((local_58 == nullptr))
    {
        XError(ELog(0), FString().Append("Failed to find FDivineSkillConfig for SkillConfig: ").Append(SkillConfigPath));
        return;
    }
    if (!(FECSWorldPtr(ECS::GetECSWorld()).IsValid()))
    {
        XError(ELog(0), "ECSWorld is not valid");
        return;
    }
    if (!(local_142) || !(local_142.PlayerEntity.IsValid()))
    {
        XError(ELog(0), "LocalPlayer entity is not valid");
        return;
    }
    FFPTime local_148 = FFPTime(-1);
    local_152.DivineSkillConfig = local_58;
    return;
}
}
