

struct FT_HookPoint : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_HookMoveConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_HookMoveConfig, NAME_None);
    UPROPERTY()
    FC_HookMoveConfig Config_FC_HookMoveConfig;

    FT_HookPoint()
    {
        return;
    }
}

