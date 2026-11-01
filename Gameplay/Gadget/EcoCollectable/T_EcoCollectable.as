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
        AGameActor local_14;
        UClass local_22;
        TArray<FString> local_74;
        FString local_4 = FString().Append("Prefab [").Append(Prefab.GetPathName(nullptr)).Append("] ValidateConfig Fail: ");
        if (Prefab.bHasActor && Prefab.Actor.IsValid())
        {
            local_22 = (Cast<UClass>(Prefab.Actor.TryLoad()));
            if (local_22 != nullptr)
            {
                local_14 = (Cast<AGameActor>(local_22.GetDefaultObject()));
            }
        }
        if (local_14 == nullptr)
        {
            return (local_4 + FString().Append("bHasActor is false, or has empty actor class, or the actor class is not AGameActor."));
        }
        FNameToComponentClassMap local_66 = FGameActorUtils::GetSceneComponentNameToClassMap(local_14);
        TMap<FName, UClass> local_46 = local_66.Map;
        if (!(this.Config_FC_EcoCollectableConfig.CollectedShakeLogicNames.IsEmpty()))
        {
            FString local_8 = this.CheckNamesExistence(local_14.GetNameToSceneComponentLogicNames(), this.Config_FC_EcoCollectableConfig.CollectedShakeLogicNames);
            if (!(local_8.IsEmpty()))
            {
                return ((local_4 + FString().Append("In CollectedShakeLogicNames, ")) + local_8);
            }
            local_74 = {"SM", "SKM"};
            FString local_8_2 = this.CheckLogicNameComponentTypes(local_14, local_46, this.Config_FC_EcoCollectableConfig.CollectedShakeLogicNames, local_74, "CollectedShakeLogicNames");
            if (!(local_8_2.IsEmpty()))
            {
                return (local_4 + local_8_2);
            }
        }
        if (!(this.Config_FC_EcoCollectableConfig.EnvDitherLogicNamesExcludeFruit.IsEmpty()))
        {
            FString local_70 = this.CheckNamesExistence(local_14.GetNameToSceneComponentLogicNames(), this.Config_FC_EcoCollectableConfig.EnvDitherLogicNamesExcludeFruit);
            if (!(local_70.IsEmpty()))
            {
                return ((local_4 + FString().Append("In EnvDitherLogicNamesExcludeFruit, ")) + local_70);
            }
            local_74 = {"SM", "SKM", "FX", "Decal", "Light", "Spline"};
            FString local_70_2 = this.CheckLogicNameComponentTypes(local_14, local_46, this.Config_FC_EcoCollectableConfig.EnvDitherLogicNamesExcludeFruit, local_74, "EnvDitherLogicNamesExcludeFruit");
            if (!(local_70_2.IsEmpty()))
            {
                return (local_4 + local_70_2);
            }
        }
        if (!(this.Config_FC_EcoCollectableConfig.CollectedDitherLogicNames.IsEmpty()))
        {
            FString local_8_3 = this.CheckNamesExistence(local_14.GetNameToSceneComponentLogicNames(), this.Config_FC_EcoCollectableConfig.CollectedDitherLogicNames);
            if (!(local_8_3.IsEmpty()))
            {
                return ((local_4 + FString().Append("In CollectedDitherLogicNames, ")) + local_8_3);
            }
            local_74 = {"SM", "SKM", "FX", "Decal", "Light", "Spline"};
            FString local_8_4 = this.CheckLogicNameComponentTypes(local_14, local_46, this.Config_FC_EcoCollectableConfig.CollectedDitherLogicNames, local_74, "CollectedDitherLogicNames");
            if (!(local_8_4.IsEmpty()))
            {
                return (local_4 + local_8_4);
            }
        }
        if (!(this.Config_FC_EcoCollectableConfig.InteractTipDurationalFXCompLogicNames.IsEmpty()))
        {
            FString local_70_3 = this.CheckNamesExistence(local_14.GetNameToSceneComponentLogicNames(), this.Config_FC_EcoCollectableConfig.InteractTipDurationalFXCompLogicNames);
            if (!(local_70_3.IsEmpty()))
            {
                return ((local_4 + FString().Append("In InteractTipDurationalFXCompLogicNames, ")) + local_70_3);
            }
            local_74 = {"FX"};
            FString local_70_4 = this.CheckLogicNameComponentTypes(local_14, local_46, this.Config_FC_EcoCollectableConfig.InteractTipDurationalFXCompLogicNames, local_74, "InteractTipDurationalFXCompLogicNames");
            if (!(local_70_4.IsEmpty()))
            {
                return (local_4 + local_70_4);
            }
        }
        int local_77 = 0;
        for (; local_77 < this.Config_FC_EcoCollectableConfig.EnvDurationalFXs.Num(); ++local_77)
        {
            const FTimeAndSpaceRelatedDurationalFXConfig& local_82 = this.Config_FC_EcoCollectableConfig.EnvDurationalFXs[local_77];
            if (!(local_82.FXLogicNames.IsEmpty()))
            {
                FString local_8_5 = this.CheckNamesExistence(local_14.GetNameToSceneComponentLogicNames(), local_82.FXLogicNames);
                if (!(local_8_5.IsEmpty()))
                {
                    return ((local_4 + FString().Append("In EnvDurationalFXs[").Append(local_77).Append("].FXLogicNames, ")) + local_8_5);
                }
                local_74 = {"FX"};
                local_8_5 = this.CheckLogicNameComponentTypes(local_14, local_46, local_82.FXLogicNames, local_74, FString().Append("EnvDurationalFXs[").Append(local_77).Append("].FXLogicNames"));
                if (!(local_8_5.IsEmpty()))
                {
                    return (local_4 + local_8_5);
                }
            }
        }
        if (this.bHas_FC_DropItemConfig)
        {
            if (this.Config_FC_DropItemConfig.DropItems.IsEmpty())
            {
                return (local_4 + FString().Append("Enables DropItemConfig but has empty DropItems."));
            }
            int local_77_2 = 0;
            for (; local_77_2 < this.Config_FC_DropItemConfig.DropItems.Num(); ++local_77_2)
            {
                if (!(this.Config_FC_DropItemConfig.DropItems[local_77_2].Item.IsSet()))
                {
                    return (local_4 + FString().Append("DropItemConfig indexed [").Append(local_77_2).Append("] has empty item."));
                }
            }
        }
        if (this.bHas_FC_DropEnergyBallSource)
        {
            if (this.Config_FC_DropEnergyBallSource.DeathEnergyBallDrops.IsEmpty())
            {
                return (local_4 + FString().Append("Enables DropEnergyBallSource but has empty DeathEnergyBallDrops."));
            }
            if (!(this.Config_FC_DropEnergyBallSource.HitBreakEnergyBallDrops.IsEmpty()))
            {
                return (local_4 + FString().Append("EcoCollectable only supports DeathEnergyBallDrops, but HitBreakEnergyBallDrops is not empty."));
            }
            if (!(this.Config_FC_DropEnergyBallSource.HitStaggerEnergyBallDrops.IsEmpty()))
            {
                return (local_4 + FString().Append("EcoCollectable only supports DeathEnergyBallDrops, but HitStaggerEnergyBallDrops is not empty."));
            }
            int local_77_3 = 0;
            for (; local_77_3 < this.Config_FC_DropEnergyBallSource.DeathEnergyBallDrops.Num(); ++local_77_3)
            {
                if (!(this.Config_FC_DropEnergyBallSource.DeathEnergyBallDrops[local_77_3].Prefab.IsValid()))
                {
                    return (local_4 + FString().Append("EnergyBallConfig indexed [").Append(local_77_3).Append("] has empty PrefabClass."));
                }
            }
        }
        if (this.bHas_FC_PropAddBuffConfig)
        {
            FString local_12_2 = this.Config_FC_PropAddBuffConfig.ValidateConfig(Prefab);
            if (!(local_12_2.IsEmpty()))
            {
                return local_12_2;
            }
        }
        return "";
    }
}

