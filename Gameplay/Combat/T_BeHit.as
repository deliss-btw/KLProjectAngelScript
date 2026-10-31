struct FT_BeHitPresentation : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_BeHitPresentationConfig_Defination;
    UPROPERTY()
    FC_BeHitPresentationConfig Config_FC_BeHitPresentationConfig;

    default CustomName = FName("受击表现 (FT_BeHitPresentation)");

    FT_BeHitPresentation()
    {
        this.FC_BeHitPresentationConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_BeHitPresentationConfig, NAME_None);
        this.__InitDefaults();
        return;
    }
}

struct FT_AttackerHitPresentation : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_AttackerHitPresentationConfig_Defination;
    UPROPERTY()
    FC_AttackerHitPresentationConfig Config_FC_AttackerHitPresentationConfig;

    default CustomName = FName("作为攻击者表现 (AttackerHitPresentation)");

    FT_AttackerHitPresentation()
    {
        this.FC_AttackerHitPresentationConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_AttackerHitPresentationConfig, NAME_None);
        this.__InitDefaults();
        return;
    }
}

