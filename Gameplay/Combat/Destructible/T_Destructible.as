

struct FT_Destructible : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_DestructibleConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_DestructibleConfig, NAME_None);
    UPROPERTY()
    FC_DestructibleConfig Config_FC_DestructibleConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_HitBox_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_HitBox, NAME_None);
    UPROPERTY()
    FC_HitBox Config_FC_HitBox;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_VisualComponentToggleConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_VisualComponentToggleConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_VisualComponentToggleConfig = false;
    UPROPERTY()
    FC_VisualComponentToggleConfig Config_FC_VisualComponentToggleConfig;


    FString ValidateConfig(const AECSPrefab Prefab) const
    {
        if ((!(this.bHas_FC_VisualComponentToggleConfig) && (int(this.Config_FC_DestructibleConfig.BreakType) == 1)))
        {
            FString local_10 = Prefab.GetPathName(nullptr);
            return FString().Append("Prefab [").Append(local_10).Append("] ValidateConfig Fail: HideComponentжЁЎејЏдё‹еї…йЎ»й…ЌзЅ®VisualComponentToggleConfig");
        }
        return "";
    }
}

struct FT_DestructibleDamageDefault : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_DestructibleDamageDefaultConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_DestructibleDamageDefaultConfig, NAME_None);
    UPROPERTY()
    FC_DestructibleDamageDefaultConfig Config_FC_DestructibleDamageDefaultConfig;

    FT_DestructibleDamageDefault()
    {
        return;
    }
}

