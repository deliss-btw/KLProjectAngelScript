

class UASEventsCallerImpl : UASEventsCallerBase
{
    UASEventsCallerImpl()
    {
        return;
    }
    UFUNCTION()
    EFactionRelation GetFactionRelationBetweenEntities_Implementation(const FECSEntity &inout EntityA, const FECSEntity &inout EntityB)
    {
        return ::FASCommonUtils::GetEntityFactionRelation(EntityA, EntityB);
    }
    UFUNCTION()
    EFactionRelation GetFactionRelationBetweenFactions_Implementation(const EFaction FactionA, const EFaction FactionB)
    {
        return ::FASCommonUtils::GetDefaultFactionRelation(EFaction(FactionA), EFaction(FactionB));
    }
    UFUNCTION()
    FECSEntity GetUniquePlayerEntity_Implementation(const FECSEntity &inout Entity)
    {
        return ::FASCommonUtils::GetUniquePlayerEntity(Entity);
    }
    UFUNCTION()
    void PostPrefabLoadFaction_Implementation(const FECSEntity &inout Entity, const FC_Faction &inout Faction)
    {
        ::FFactionUtils::InitFactionRelationForEntity(Entity, Faction);
        return;
    }
    UFUNCTION()
    float32 GetDefaultStepHeightForCharacter_Implementation(const FName &inout CharacterName) const
    {
        UDataTable local_4;
        float32 local_1 = 0.0f;
        if (local_4 != nullptr)
        {
            FDTCharacterMovementConfig local_148;
            if (local_4.FindRow(CharacterName, local_148))
            {
                local_1 = local_148.StepHeight;
            }
        }
        return local_1;
    }
    UFUNCTION()
    bool BuildMapUrlFromLevelKey_Implementation(const int LevelKey, FString &inout OutUrl)
    {
        return ::FLevelDataLayerUtils::BuildMapUrlFromLevelKey(LevelKey, OutUrl);
    }
    UFUNCTION()
    ELevelType GetCurrentLevelType_Implementation()
    {
        return ::FLevelUtils::GetCurrentLevelType();
    }
    UFUNCTION()
    ECommissionType GetCurrentCommissionType_Implementation()
    {
        FECSWorldPtr local_2 = ECS::GetECSWorld();
        Get local_6;
        const FCS_CommissionInfo& local_8 = local_6.opCall();
        if (local_8)
        {
            if (local_8.CommissionConfig.IsSet())
            {
                return local_8.CommissionConfig.opArrow().CommissionType;
            }
        }
        return ECommissionType(0);
    }
    UFUNCTION()
    bool IsMonsterPrefab_Implementation(const FECSEntity &inout Entity)
    {
        return ::FASCommonUtils::IsMonsterPrefab(Entity);
    }
    UFUNCTION()
    EMonsterRank GetMonsterRank_Implementation(const FECSEntity &inout Entity)
    {
        return ::FASCommonUtils::GetMonsterRank(Entity);
    }
    UFUNCTION()
    bool IsPropPrefab_Implementation(const FECSEntity &inout Entity)
    {
        return ::FASCommonUtils::IsPropPrefab(Entity);
    }
    UFUNCTION()
    void ApplyFacePresetToActor_Implementation(const AActor Actor, const int AvatarId, const int FacePresetId)
    {
        ::FaceCustomizeUtils::ApplyFacePresetToActor(Actor, AvatarId, FacePresetId);
        return;
    }
    UFUNCTION()
    void ApplyFacePresetBodyMaterialToActor_Implementation(const AActor Actor, const int AvatarId, const int FacePresetId)
    {
        ::FaceCustomizeUtils::ApplyFacePresetBodyMaterialToActor(Actor, AvatarId, FacePresetId);
        return;
    }
    UFUNCTION()
    void ApplyFashionToActor_Implementation(const AActor Actor, const int AvatarId, const TArray<int> &inout FashionIds, const bool bUseBathrobe)
    {
        FRuntimeFashionInfo local_28;
        local_28.SetbUseBathrobe(bUseBathrobe);
        for (auto local_42 : FashionIds)
        {
            local_28.GetModify_FashionIds().Add(local_42);
        }
        ::FashionUtils::ApplyFashionToActor(Actor, AvatarId, local_28);
        return;
    }
    UFUNCTION()
    void GetAllAvailableLoadingPassNames_Implementation(TArray<FName> &inout OutLoadingPassNames)
    {
        OutLoadingPassNames = FLevelGroupLoadingPassNames::AllAvailableLoadingPassNames;
        return;
    }
    UFUNCTION()
    FName GetDefaultLoadingPassName_Implementation()
    {
        return FLevelGroupLoadingPassNames::DefaultLoadingPassName;
    }
}

