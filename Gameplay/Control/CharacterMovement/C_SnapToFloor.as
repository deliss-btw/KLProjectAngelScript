

struct FT_SnapToFloor : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_SnapToFloorConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_SnapToFloorConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_SnapToFloorConfig = false;
    UPROPERTY()
    FC_SnapToFloorConfig Config_FC_SnapToFloorConfig;


}

struct FT_VehicleSnapToFloor : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_VehicleSnapToFloorConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_VehicleSnapToFloorConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_VehicleSnapToFloorConfig = false;
    UPROPERTY()
    FC_VehicleSnapToFloorConfig Config_FC_VehicleSnapToFloorConfig;


}

