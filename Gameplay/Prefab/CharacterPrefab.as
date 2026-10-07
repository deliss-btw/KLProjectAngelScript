

// NOTE: class defaults are not authored in this module: ACharacterPrefab (default scalar field AECSPrefab.PerformanceStatCategory has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

class ACharacterPrefab : AKLLevelPrefabBase
{
    UPROPERTY()
    FT_PrefabConfig PrefabConfig;
    UPROPERTY()
    FT_Physics Physics;
    UPROPERTY()
    FT_Animation Animation;
    UPROPERTY()
    FT_AnimationConfig AnimationConfig;
    UPROPERTY()
    FT_Character Character;
    UPROPERTY()
    FT_GameAttribute GameAttribute;
    UPROPERTY()
    FT_GameplayTags GameplayTags;
    UPROPERTY()
    FT_Capability Capability;
    UPROPERTY()
    FT_Buff Buff;
    UPROPERTY()
    FT_ESM ESM;
    UPROPERTY()
    FT_EntityBlackboard EntityBlackboard;
    UPROPERTY()
    FT_EntityPoolOwner EntityPoolOwner;
    UPROPERTY()
    FT_Ability Ability;
    UPROPERTY()
    FT_Skill Skill;
    UPROPERTY()
    FT_Camera Camera;
    UPROPERTY()
    FT_CameraAffector CameraAffector;
    UPROPERTY()
    FT_EquipmentHolder EquipmentHolder;
    UPROPERTY()
    FT_CharacterCombat CharacterCombat;
    UPROPERTY()
    FT_Hittable Hittable;
    UPROPERTY()
    FT_BeHitPresentation BeHitPresentation;
    UPROPERTY()
    FT_AttackerHitPresentation AttackerHitPresentation;
    UPROPERTY()
    FT_MiniHPBarConfig MiniHPBarConfig;
    UPROPERTY()
    FT_InteractTrait Interact;
    UPROPERTY()
    FT_SampleTrajectoryConfig SampleTrajectoryConfig;
    UPROPERTY()
    FT_Mount Mount;
    UPROPERTY()
    FT_AI AI;
    UPROPERTY()
    FT_SwitchPlayerAvatarConfig SwitchPlayerAvatarConfig;
    UPROPERTY()
    FT_CharacterFXPool CharacterFXPool;
    UPROPERTY()
    FT_Faction Faction;
    UPROPERTY()
    FT_AIThreat AIThreat;
    UPROPERTY()
    FT_AITargetable AITargetable;
    UPROPERTY()
    FT_CareAboutRegion CareAboutRegion;
    UPROPERTY()
    FT_SpawnAppear SpawnAppear;
    UPROPERTY()
    FT_HUDIndicator HUDIndicator;
    UPROPERTY()
    FT_VisualComponentToggle VisualComponentToggle;
    UPROPERTY()
    FT_EcosimAIV2Chain EcosimAIV2Chain;
    UPROPERTY()
    FT_HTN HTN;
    UPROPERTY()
    FT_CharacterAudio CharacterAudio;
    UPROPERTY()
    FT_ArealStrikeEnvSurfaceFXConfig ArealStrikeEnvSurfaceFXConfig;
    UPROPERTY()
    FT_DestructibleDamageDefault DestructibleDamageDefault;
    UPROPERTY()
    FT_LookRequest LookRequest;
    UPROPERTY()
    FT_EntitySpawnInit SpawnInit;

    ACharacterPrefab()
    {
        return;
    }
    UFUNCTION()
    float32 GetCollisionHalfHeight_Implementation() const
    {
        if (this.Physics.bTraitEnable)
        {
            return this.Physics.Config_FC_Collision.GetScaledHalfHeight();
        }
        return 0.0f;
    }
    UFUNCTION()
    void DrawVisualisationOnSelected_Implementation() const
    {
        return;
    }
}

