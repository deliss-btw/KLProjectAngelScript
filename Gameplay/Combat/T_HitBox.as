

struct FT_Hittable : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_HittableConfig_Defination;
    UPROPERTY()
    bool bHas_FC_HittableConfig;
    UPROPERTY()
    FC_HittableConfig Config_FC_HittableConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_HitBoxConfig_Defination;
    UPROPERTY()
    FC_HitBoxConfig Config_FC_HitBoxConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_HitBox_Defination;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_HitBoxBoundingBuffer_Defination;

    default CustomName = FName("еЏ—е‡»еЉџиѓЅй…ЌзЅ® (FT_Hittable)");

    FT_Hittable()
    {
        this.FC_HittableConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_HittableConfig, NAME_None);
        this.bHas_FC_HittableConfig = true;
        this.FC_HitBoxConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_HitBoxConfig, NAME_None);
        this.FC_HitBox_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_HitBox, NAME_None);
        this.FC_HitBoxBoundingBuffer_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_HitBoxBoundingBuffer, NAME_None);
        this.__InitDefaults();
        return;
    }
}

