

struct FT_Lockable : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_LockableTag_Defination;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_LockableConfig_Defination;
    UPROPERTY()
    FC_LockableConfig Config_FC_LockableConfig;

    default CustomName = FName("й”Ѓе®љ (FT_Lockable)");

    FT_Lockable()
    {
        this.FC_LockableTag_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_LockableTag, NAME_None);
        this.FC_LockableConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_LockableConfig, NAME_None);
        this.__InitDefaults();
        return;
    }
}

