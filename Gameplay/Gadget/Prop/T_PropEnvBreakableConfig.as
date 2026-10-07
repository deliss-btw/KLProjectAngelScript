

struct FT_PropEnvBreakableConfig : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_PropEnvBreakableConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_PropEnvBreakableConfig, NAME_None);
    UPROPERTY()
    FC_PropEnvBreakableConfig Config_FC_PropEnvBreakableConfig;

    FT_PropEnvBreakableConfig()
    {
        return;
    }
    FString ValidateConfig(const AECSPrefab Prefab) const
    {
        if (!(this.Config_FC_PropEnvBreakableConfig.CheckValidSorted()))
        {
            FString local_6 = Prefab.GetPathName(nullptr);
            FString local_10 = FString();
            return local_10.Append("Prefab [").Append(local_6).Append("] ValidateConfig Fail: PropEnvBreakableConfig BreakPhasesжІЎжњ‰й™ЌеєЏжЋ’е€—пјЃ");
        }
        if (this.Config_FC_PropEnvBreakableConfig.BreakPhases.Num() > 5)
        {
            FString local_10_2 = Prefab.GetPathName(nullptr);
            FString local_6_2 = FString();
            return local_6_2.Append("Prefab [").Append(local_10_2).Append("] ValidateConfig Fail: PropEnvBreakableConfig BreakPhasesз›®е‰Ќд»…ж”ЇжЊЃе°ЏдєЋз­‰дєЋ5дёЄпјЃ");
        }
        return "";
    }
}

