

struct FT_PlayerAudio : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_PlayerBGMInfo_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_PlayerBGMInfo, NAME_None);
    UPROPERTY()
    bool bHas_FC_PlayerBGMInfo = true;
    UPROPERTY()
    FC_PlayerBGMInfo Config_FC_PlayerBGMInfo;


}

struct FT_MonsterAudio : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_MonsterBGMConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_MonsterBGMConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_MonsterBGMConfig = true;
    UPROPERTY()
    FC_MonsterBGMConfig Config_FC_MonsterBGMConfig;


}

