

struct FT_EcoCollectableConfig : FECSTrait
{
    FECSTrait _base_FECSTrait;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_EcoCollectableConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_EcoCollectableConfig, NAME_None);
    UPROPERTY()
    FC_EcoCollectableConfig Config_FC_EcoCollectableConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_EcoCollectableNonSyncedVisualStatus_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_EcoCollectableNonSyncedVisualStatus, NAME_None);
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_EcoCollectableNonSyncedPendingViewInitTag_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_EcoCollectableNonSyncedPendingViewInitTag, NAME_None);
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_EcoCollectableNonSyncedPendingEnvInitTag_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_EcoCollectableNonSyncedPendingEnvInitTag, NAME_None);
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_EcoCollectableBundleConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_EcoCollectableBundleConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_EcoCollectableBundleConfig = false;
    UPROPERTY()
    FC_EcoCollectableBundleConfig Config_FC_EcoCollectableBundleConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_DropItemConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_DropItemConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_DropItemConfig = true;
    UPROPERTY()
    FC_DropItemConfig Config_FC_DropItemConfig;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_DropEnergyBallSource_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_DropEnergyBallSource, NAME_None);
    UPROPERTY()
    bool bHas_FC_DropEnergyBallSource = false;
    UPROPERTY()
    FC_DropEnergyBallSource Config_FC_DropEnergyBallSource;
    UPROPERTY()
    FECSInternalTraitCompDefinition FC_PropAddBuffConfig_Defination = FECSInternalTraitCompDefinition::CreateNoCheck(FC_PropAddBuffConfig, NAME_None);
    UPROPERTY()
    bool bHas_FC_PropAddBuffConfig = false;
    UPROPERTY()
    FC_PropAddBuffConfig Config_FC_PropAddBuffConfig;


    FString CheckNamesExistence(const TArray<FName> &inout ValidNames, const TArray<FName> &inout NamesToCheck) const
    {
        bool local_17;
        for (auto& local_16 : NamesToCheck)
        {
            local_17 = false;
            for (auto& local_26 : ValidNames)
            {
                if (local_16.IsEqual(local_26, false, true))
                {
                    local_17 = true;
                    break;
                }
            }
            if (!(local_17))
            {
                return FString().Append(local_16).Append(" is not found.");
            }
        }
        return "";
    }
    FString ClassifyComponentClass(const UClass CompClass) const
    {
        if (CompClass == nullptr)
        {
            return "None";
        }
        if (CompClass.IsChildOf(UStaticMeshComponent))
        {
            return "SM";
        }
        if (CompClass.IsChildOf(USkeletalMeshComponent))
        {
            return "SKM";
        }
        if (CompClass.IsChildOf(UNiagaraComponent))
        {
            return "FX";
        }
        if (CompClass.IsChildOf(UDecalComponent))
        {
            return "Decal";
        }
        if (CompClass.IsChildOf(ULightComponent))
        {
            return "Light";
        }
        if (CompClass.IsChildOf(USplineComponent))
        {
            return "Spline";
        }
        return "Other";
    }
    FString CheckLogicNameComponentTypes(const AGameActor GameActor, const TMap<FName, UClass> &inout CompClassMap, const TArray<FName> &inout LogicNames, const TArray<FString> &inout AllowedTypes, const FString &inout FieldName) const
    {
        UClass local_68;
        for (auto& local_16 : LogicNames)
        {
            TArray<FName> local_20;
            for (auto& local_34 : GameActor.NameToSceneComponentEntries)
            {
                if (local_34.LogicName.IsEqual(local_16, false, true))
                {
                    local_20.Add(local_34.SceneComponentName);
                    break;
                }
            }
            if (local_20.IsEmpty())
            {
                for (auto& local_52 : GameActor.NameToSceneComponentGroups)
                {
                    if (local_52.LogicName.IsEqual(local_16, false, true))
                    {
                        local_20 = local_52.ComponentNames;
                        break;
                    }
                }
            }
            for (auto& local_66 : local_20)
            {
                if (CompClassMap.Find(local_66, local_68))
                {
                    bool local_77;
                    FString local_76 = this.ClassifyComponentClass(local_68);
                    local_77 = false;
                    for (auto& local_92 : AllowedTypes)
                    {
                        if ((local_76 == local_92))
                        {
                            local_77 = true;
                            break;
                        }
                    }
                    if (!(local_77))
                    {
                        FString local_72 = FString::Join(AllowedTypes, ", ");
                        return FString().Append("In ").Append(FieldName).Append(", LogicName '").Append(local_16).Append("' references component '").Append(local_66).Append("' of type '").Append(local_76).Append("', expected one of: [").Append(local_72).Append("].");
                    }
                }
            }
        }
        return "";
    }
    FString ValidateConfig(const AECSPrefab Prefab) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        FString __r; return __r;
    }
}

