

struct FT_CharacterAudio : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_CharacterAudioConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_CharacterAudioConfig, NAME_None);
    UPROPERTY()
    FC_CharacterAudioConfig Config_FC_CharacterAudioConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_BreathAudioConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_BreathAudioConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_BreathAudioConfig = false;
    UPROPERTY()
    FC_BreathAudioConfig Config_FC_BreathAudioConfig;


}

