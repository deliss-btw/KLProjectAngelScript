

class UCombatGlobalSettings : UCombatGlobalSettingsBase
{
    UPROPERTY()
    UCurveFloat DefaultFreezeAttenuationCurve;
    UPROPERTY()
    float32 PlayerLowHPPercentThreshold = 0.3f;
    UPROPERTY()
    float32 BossLowHPPercentThreshold = 0.0f;
    UPROPERTY()
    UAbnormalDataAsset AbnormalData;
    UPROPERTY()
    FItemTableRowRef ArrowItem;
    UPROPERTY()
    UDataTable EmojiDataTable;
    UPROPERTY()
    UDataTable TimeHintDataTable;
    UPROPERTY()
    UDataTable SideHintConfig;
    UPROPERTY()
    UDataTable CombatHintConfig;
    UPROPERTY()
    UDataTable MotionDataTable;
    UPROPERTY()
    TMap<FName, FUI_HintInfo> AllHintInfoData;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> NoSocialTargetHint;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> SystemUnlockHint;
    UPROPERTY()
    TMap<TDataObjectPtr<FEUIWidgetConfig>, FText> SystemWidgetLockHintMap;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> SkillInsufficientResourceHint;
    UPROPERTY()
    TDataObjectPtr<FMessageHintConfig> ConsumeItemFailHint;
    UPROPERTY()
    TSubclassOf<AProjectilePrefab> Prefab_ShuiJing_PowerArrow;
    UPROPERTY()
    UGlobalEnvEffectSettings EnvEffectSettings;
    UPROPERTY()
    TSubclassOf<AActor> ScreenDarknessPlane;
    UPROPERTY()
    UMaterialParameterCollection GlobalEnvStateMPC;
    UPROPERTY()
    USFXSettings SFXSettings;
    UPROPERTY()
    TDataObjectPtr<FWidgetHiddenConfig> CutSceneWidgetHiddenConfig;
    UPROPERTY()
    UDataTable AttributeTextConfig;
    UPROPERTY()
    TSubclassOf<AECSPrefab> MetaEntityPrefab;
    UPROPERTY()
    UDataTable EcosimAIV2DialogueDT;
    UPROPERTY()
    FGameplayTagContainer IndependentCombatGroupTags;
    UPROPERTY()
    FGameplayTagContainer UnTargetableTags;
    UPROPERTY()
    FBuffConfigRef SafeZoneBuff;
    UPROPERTY()
    FWeaponDrawSheatheConfig WeaponDrawSheatheConfig;
    UPROPERTY()
    TArray<UTexture2D> ArmWrestleResultTextures;


    UFUNCTION()
    AFXActor DoSurfaceTraceSpawnFx_Implementation(const FKLSpawnFxActorHelper &inout SpawnFxActorHelper, const FTransform &inout SpawnTransform) const
    {
        return ::FSurfaceContactFXUtils::DoSurfaceTrace(SpawnFxActorHelper, SpawnTransform);
    }
    bool CheckBossIsLowHp(const float32 HPRatio)
    {
        return HPRatio < this.BossLowHPPercentThreshold && (HPRatio > 0.0f);
    }
}

