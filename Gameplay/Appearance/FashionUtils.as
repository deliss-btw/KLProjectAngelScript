
const FConsoleVariable CVar_Fashion_DisableApply = FConsoleVariable();

namespace FashionUtils
{
EBodyType GetBodyTypeFromAvatar(const TDataObjectPtr<FAvatarPrefabConfig> &inout AvatarConfig)
{
    int local_3 = 0;
    if (!(AvatarConfig))
    {
        return EBodyType(1);
    }
    int local_4 = local_3;
    if (local_4 <= 1)
    {
        if (local_4 != 0)
        {
            if (local_4 != 1)
            {
            }
            else
            {
                return EBodyType(2);
            }
        }
    }
    return EBodyType(1);
}
TDataObjectPtr<FMountFashionConfig> GetPlayerMountFashionConfig(const FECSEntity &inout PlayerEntity)
{
    Get local_4;
    const FC_PlayerFashionState& local_6 = local_4.opCall();
    if (local_6)
    {
        for (auto local_21 : local_6.GetFashionIds())
        {
            if (!(FFashionConfig::GetByDataId(local_21)) || ((0 != -55)))
            {
                continue;
            }
            CastTo local_78;
            return local_78.opCall();
        }
    }
    UDataObjectManager::GetSingletonDataObject<FFashionGlobalConfig> local_174;
    TDataObjectPtr<FFashionGlobalConfig> local_198 = local_174.opImplConv();
    if (!(local_198))
    {
        return TDataObjectPtr<FMountFashionConfig>(nullptr);
    }
    return GetDefaultMount();
}
UClass GetMountPrefabClass(const FECSEntity &inout PlayerEntity)
{
    if (!(FashionUtils::GetPlayerMountFashionConfig(PlayerEntity)))
    {
        return nullptr;
    }
    return TSubclassOf<ACharacterPrefab>();
}
void ApplyFashionToActor(const AActor Actor, const uint AvatarId, const FRuntimeFashionInfo &inout FashionInfo)
{
    int local_311 = 0;
    bool local_340;
    bool local_341 = false;
    USkeletalMeshComponent local_344;
    EFashionDecoSocket local_479;
    EFashionDecoSocket local_480 = EFashionDecoSocket(0);
    FDecoAttachOffset local_548;
    if (CVar_Fashion_DisableApply.GetBool())
    {
        return;
    }
    TDataObjectPtr<FAvatarPrefabConfig> local_26 = FAvatarPrefabConfig::GetByDataId(AvatarId);
    if (!(local_26))
    {
        return;
    }
    TDataObjectPtr<FCharacterDefaultFashionConfig> local_74 = GetDefaultFashion();
    if (!(local_74))
    {
        return;
    }
    int local_100 = int(FashionUtils::GetBodyTypeFromAvatar(local_26));
    bool local_1 = false;
    USkeletalMeshComponent local_106 = AppearanceMeshUtils::ResolveViewMesh(Actor, local_1);
    if (local_106 == nullptr)
    {
        return;
    }
    FCharacterDefaultFashionConfig local_108;
    TDataObjectPtr<FFashionConfig> local_132 = local_108.GetInitHair();
    if (FashionInfo.GetbUseBathrobe())
    {
    }
    else
    {
    }
    TDataObjectPtr<FFashionConfig> local_156;
    TDataObjectPtr<FFashionConfig> local_180 = local_156;
    if (FashionInfo.GetbUseBathrobe())
    {
    }
    else
    {
    }
    TDataObjectPtr<FFashionConfig> local_204 = local_156;
    TDataObjectPtr<FFashionConfig> local_228;
    if (FashionInfo.GetbUseBathrobe())
    {
        local_228 = (TDataObjectPtr<FFashionConfig>(nullptr));
    }
    else
    {
        local_228 = local_108.GetInitSuit();
    }
    bool local_277 = false;
    bool local_278 = false;
    TArray<TDataObjectPtr<FFashionConfig>> local_282;
    int local_284 = FashionInfo.GetFashionIds().Num();
    int local_285 = 0;
    for (; local_285 < local_284; ++local_285)
    {
        TDataObjectPtr<FFashionConfig> local_276 = FFashionConfig::GetByDataId(FashionInfo.GetFashionIds()[local_285]);
        if (!(local_276))
        {
            continue;
        }
        switch (local_311)
        {
        case 1:
        {
            local_132 = local_276;
            break;
        }
        case 2:
        {
            if (!(FashionInfo.GetbUseBathrobe()))
            {
                local_180 = local_276;
            }
            local_277 = true;
            break;
        }
        case 3:
        {
            if (!(FashionInfo.GetbUseBathrobe()))
            {
                local_204 = local_276;
            }
            local_277 = true;
            break;
        }
        case 4:
        {
            if (!(FashionInfo.GetbUseBathrobe()))
            {
                local_228 = local_276;
            }
            local_278 = true;
            break;
        }
        case 5:
        {
            if (FashionInfo.GetbUseBathrobe())
            {
                local_180 = local_276;
            }
            break;
        }
        case 6:
        {
            if (FashionInfo.GetbUseBathrobe())
            {
                local_204 = local_276;
            }
            break;
        }
        default:
        {
            local_282.Add(local_276);
            break;
        }
        }
    }
    TDataObjectPtr<FFashionConfig> local_310 = local_108.GetInitHair();
    bool local_1_2 = !((local_310 == nullptr));
    TDataObjectPtr<FFashionConfig> local_338;
    local_338 = local_108.GetInitTop();
    bool local_314 = !((local_338 == nullptr)) || (!((local_108.GetInitSuit() == nullptr)));
    local_338 = local_108.GetInitBottom();
    bool local_339 = !((local_338 == nullptr)) || (!((local_108.GetInitSuit() == nullptr)));
    if (FashionInfo.GetbUseBathrobe())
    {
        local_314 = local_314 && !((local_180 == nullptr));
        local_340 = local_339 && !((local_204 == nullptr));
        local_339 = local_340;
    }
    else
    {
        local_341 = !((local_228 == nullptr));
        if (local_341)
        {
            if (local_278)
            {
                local_341 = true;
            }
            else
            {
                if (!(local_277))
                {
                    local_341 = false;
                }
                else
                {
                    local_341 = local_180;
                }
                if (!(local_341))
                {
                    local_340 = false;
                }
                else
                {
                    local_340 = local_204;
                }
                local_340 = !local_340;
                local_341 = local_340;
            }
            if (local_341)
            {
                local_180 = local_228;
                local_204 = TDataObjectPtr<FFashionConfig>(nullptr);
            }
        }
    }
    if (local_1_2)
    {
        local_344 = AppearanceMeshUtils::FindChildSkeletalMesh(local_106, AppearanceMeshUtils::HairChildName);
        if (local_344 != nullptr)
        {
            FashionUtils::ApplyMeshToChild(local_344, local_106, local_132, EBodyType(local_100));
        }
    }
    if (local_314)
    {
        local_344 = AppearanceMeshUtils::FindChildSkeletalMesh(local_106, AppearanceMeshUtils::UpperChildName);
        if (local_344 != nullptr)
        {
            FashionUtils::ApplyMeshToChild(local_344, local_106, local_180, EBodyType(local_100));
        }
    }
    if (local_339)
    {
        local_344 = AppearanceMeshUtils::FindChildSkeletalMesh(local_106, AppearanceMeshUtils::LowerChildName);
        if (local_344 != nullptr)
        {
            FashionUtils::ApplyMeshToChild(local_344, local_106, local_204, EBodyType(local_100));
        }
    }
    TSet<EFashionDecoSocket> local_364;
    CastTo local_382;
    for (auto& local_378 : local_282)
    {
        if ((local_382.opCall() == nullptr))
        {
            continue;
        }
        if (!(FashionInfo.GetbUseBathrobe()))
        {
            local_340 = false;
        }
        else
        {
            local_341 = !local_341;
            local_340 = local_341;
        }
        if (local_340)
        {
            continue;
        }
        TDataObjectPtr<FAttachPointConfig> local_454 = GetAttachPoint();
        if ((local_454 == nullptr))
        {
            continue;
        }
        local_479 = local_480;
        local_364.Add(local_479);
        local_344 = AppearanceMeshUtils::FindChildSkeletalMesh(local_106, AppearanceMeshUtils::DecoChildName(EFashionDecoSocket(local_479)));
        if (local_344 != nullptr)
        {
            FDecoAttachOffset local_492;
            FashionUtils::ApplyMeshToChild(local_344, local_106, local_378, EBodyType(local_100));
            local_492.GetOffsetForAvatar(AvatarId);
            FTransform local_516 = local_492.ToTransform();
            local_340 = !local_340;
            if (local_340)
            {
                FFloat3 local_552;
                FFloat3 local_556;
                local_552 = local_556;
                local_548.SetLocation(FVector3f(local_552.X, local_552.Y, local_552.Z));
                FFloat3 local_566;
                local_566 = local_556;
                float32 local_560 = local_566.Z;
                local_548.SetRotation(FRotator3f(local_566.X, local_566.Y, local_560));
                local_548.SetScale(local_560);
            }
            local_516 = (local_548.ToTransform() * local_516);
            local_344.SetRelativeTransform(local_516);
        }
    }
    int local_285_2 = 1;
    for (; local_285_2 < 14; ++local_285_2)
    {
        local_480 = local_285_2;
        if (local_364.Contains(local_480))
        {
            continue;
        }
        local_344 = AppearanceMeshUtils::FindChildSkeletalMesh(local_106, AppearanceMeshUtils::DecoChildName(EFashionDecoSocket(local_480)));
        if (local_344 != nullptr)
        {
            local_344.SetAnimInstanceClass(nullptr);
            local_344.SetSkeletalMeshAsset(nullptr);
            local_344.SetRelativeTransform(FTransform::Identity);
        }
    }
    return;
}
void ApplyMeshToChild(const USkeletalMeshComponent ChildMesh, const USkeletalMeshComponent LeaderMesh, const TDataObjectPtr<FFashionConfig> &inout Config, const EBodyType BodyType)
{
    bool local_1 = !(Config);
    if (local_1)
    {
        ChildMesh.SetAnimInstanceClass(nullptr);
        ChildMesh.SetSkeletalMeshAsset(nullptr);
        return;
    }
    TSoftObjectPtr<USkeletalMesh> local_12;
    local_1 = !local_1;
    if (local_1)
    {
        local_1 = !local_1;
        if (local_1)
        {
            return;
        }
    }
    USkeletalMesh local_16 = (Cast<USkeletalMesh>(local_12.ToSoftObjectPath().TryLoad()));
    if (local_16 == nullptr)
    {
        FString local_36 = local_12.ToSoftObjectPath().ToString();
        FString local_32 = FString();
        return;
    }
    FashionUtils::ApplyFashionAnimBlueprint(ChildMesh, LeaderMesh, Config, EBodyType(BodyType));
    ChildMesh.SetSkeletalMeshAsset(local_16);
    AppearanceMeshUtils::ResetMaterialOverrides(ChildMesh);
    FashionUtils::ApplyFashionDye(ChildMesh, Config, EBodyType(BodyType));
    return;
}
TSoftClassPtr<UAnimInstance> ResolveAnimBlueprint(const TMap<EBodyType, TSoftClassPtr<UAnimInstance>> &inout AnimBlueprints, const EBodyType BodyType)
{
    TSoftClassPtr<UAnimInstance> local_10;
    if (AnimBlueprints.Find(BodyType, local_10))
    {
        return local_10;
    }
    AnimBlueprints.Find(EBodyType(0), local_10);
    return local_10;
}
void ApplyFashionAnimBlueprint(const USkeletalMeshComponent ChildMesh, const USkeletalMeshComponent LeaderMesh, const TDataObjectPtr<FFashionConfig> &inout Config, const EBodyType BodyType)
{
    TSoftClassPtr<UAnimInstance> local_20;
    if (local_20.IsNull())
    {
        ChildMesh.SetAnimInstanceClass(nullptr);
        ChildMesh.SetLeaderPoseComponent(LeaderMesh, false, false);
        return;
    }
    UClass local_24 = (Cast<UClass>(local_20.ToSoftObjectPath().TryLoad()));
    if (local_24 == nullptr)
    {
        FString local_44 = local_20.ToSoftObjectPath().ToString();
        FString local_40 = FString();
        ChildMesh.SetAnimInstanceClass(nullptr);
        ChildMesh.SetLeaderPoseComponent(LeaderMesh, false, false);
        return;
    }
    ChildMesh.SetAnimInstanceClass(local_24);
    ChildMesh.SetLeaderPoseComponent(nullptr, false, false);
    return;
}
FName ResolveDyeConfigName(const TMap<EBodyType, FName> &inout DyeConfigs, const EBodyType BodyType)
{
    FName local_2(NAME_None);
    if (DyeConfigs.Find(BodyType, local_2))
    {
        return local_2;
    }
    DyeConfigs.Find(EBodyType(0), local_2);
    return local_2;
}
void ApplyFashionDye(const USkeletalMeshComponent SkComp, const TDataObjectPtr<FFashionConfig> &inout Config, const EBodyType BodyType)
{
    FName local_4;
    int local_6 = 0;
    if ((local_4 == NAME_None))
    {
        return;
    }
    else
    {
        switch (local_6)
        {
        case 1:
        {
            if (TDataObjectPtr<FFashionHairDyeConfig>(FFashionHairDyeConfig::FindByKey(local_4)))
            {
                FashionUtils::ApplyHairDyeToMesh(SkComp);
            }
            return;
        }
        case 2:
        case 4:
        {
            if (TDataObjectPtr<FFashionUpperClothDyeConfig>(FFashionUpperClothDyeConfig::FindByKey(local_4)))
            {
                FashionUtils::ApplyClothDyeToMesh(SkComp);
            }
            return;
        }
        case 3:
        case 6:
        {
            if (TDataObjectPtr<FFashionLowerClothDyeConfig>(FFashionLowerClothDyeConfig::FindByKey(local_4)))
            {
                FashionUtils::ApplyClothDyeToMesh(SkComp);
            }
            return;
        }
        case 5:
        {
            if (TDataObjectPtr<FFashionUpperClothDyeConfig>(FFashionUpperClothDyeConfig::FindByKey(local_4)))
            {
                FashionUtils::ApplyClothDyeToMesh(SkComp);
            }
            return;
        }
        }
    }
}
void ApplyHairDyeToMesh(const USkeletalMeshComponent SkComp, const FFashionHairDyeConfig &inout Dye)
{
    int local_2 = 0;
    int local_3 = 0;
    UMaterialInterface local_10;
    UMaterialInstanceDynamic local_14;
    int local_1 = 0;
    while (local_1 < local_3)
    {
        const FName& local_6 = Dye.SlotNames[local_1];
        if ((local_6 == NAME_None))
        {
        }
        else
        {
            local_3 = SkComp.GetMaterialIndex(local_6);
            if (local_3 < 0)
            {
            }
            else
            {
                local_10 = SkComp.GetMaterial(local_3);
                local_14 = SkComp.CreateDynamicMaterialInstance(local_3, local_10, NAME_None);
                if (local_14 == nullptr)
                {
                }
                else
                {
                    local_14.SetVectorParameterValue(n"Base Color", Dye.BaseColor);
                    local_14.SetVectorParameterValue(n"RootColor", Dye.RootColor);
                    local_14.SetVectorParameterValue(n"TipColor", Dye.TipColor);
                    local_14.SetVectorParameterValue(n"ID Color", Dye.IDColor);
                    local_14.SetScalarParameterValue(n"Scatter", Dye.Scatter);
                    local_14.SetScalarParameterValue(n"Brightness", Dye.Brightness);
                }
            }
        }
        ++local_1;
    }
    local_3 = 0;
    while (local_3 < local_2)
    {
        const FName& local_6_2 = Dye.DecoSlotNames[local_3];
        if ((local_6_2 == NAME_None))
        {
        }
        else
        {
            local_2 = SkComp.GetMaterialIndex(local_6_2);
            if (local_2 < 0)
            {
            }
            else
            {
                local_10 = SkComp.GetMaterial(local_2);
                local_14 = SkComp.CreateDynamicMaterialInstance(local_2, local_10, NAME_None);
                if (local_14 == nullptr)
                {
                }
                else
                {
                    local_14.SetScalarParameterValue(n"Dye Enable", 1.0f);
                    local_14.SetScalarParameterValue(n"Dye 1", Dye.DecoDye1);
                    local_14.SetVectorParameterValue(n"Dye Color 1", Dye.DecoColor1);
                    local_14.SetScalarParameterValue(n"Dye 2", Dye.DecoDye2);
                    local_14.SetVectorParameterValue(n"Dye Color 2", Dye.DecoColor2);
                    local_14.SetScalarParameterValue(n"Dye 3", Dye.DecoDye3);
                    local_14.SetVectorParameterValue(n"Dye Color 3", Dye.DecoColor3);
                    local_14.SetScalarParameterValue(n"Dye 4", Dye.DecoDye4);
                    local_14.SetVectorParameterValue(n"Dye Color 4", Dye.DecoColor4);
                }
            }
        }
        ++local_3;
    }
    return;
}
void ApplyClothDyeToMesh(const USkeletalMeshComponent SkComp, const FFashionClothDyeConfig &inout Dye)
{
    int local_3 = 0;
    int local_1 = 0;
    while (local_1 < local_3)
    {
        const FName& local_6 = Dye.SlotNames[local_1];
        if ((local_6 == NAME_None))
        {
        }
        else
        {
            local_3 = SkComp.GetMaterialIndex(local_6);
            if (local_3 < 0)
            {
            }
            else
            {
                UMaterialInterface local_10 = SkComp.GetMaterial(local_3);
                UMaterialInstanceDynamic local_14 = SkComp.CreateDynamicMaterialInstance(local_3, local_10, NAME_None);
                if (local_14 == nullptr)
                {
                }
                else
                {
                    local_14.SetScalarParameterValue(n"Dye Enable", 1.0f);
                    local_14.SetScalarParameterValue(n"Dye 1", Dye.Dye1);
                    local_14.SetVectorParameterValue(n"Dye Color 1", Dye.DyeColor1);
                    local_14.SetScalarParameterValue(n"Dye 2", Dye.Dye2);
                    local_14.SetVectorParameterValue(n"Dye Color 2", Dye.DyeColor2);
                    local_14.SetScalarParameterValue(n"Dye 3", Dye.Dye3);
                    local_14.SetVectorParameterValue(n"Dye Color 3", Dye.DyeColor3);
                    local_14.SetScalarParameterValue(n"Dye 4", Dye.Dye4);
                    local_14.SetVectorParameterValue(n"Dye Color 4", Dye.DyeColor4);
                }
            }
        }
        ++local_1;
    }
    return;
}
UFUNCTION()
void SetEntityUseBathrobe(const FECSEntityAdapter &inout Entity, const bool bUseBathrobe)
{
    ModifyOrAdd local_4;
    FC_FashionState& local_6 = local_4.opCall();
    if (local_6)
    {
        local_6.SetUseBathrobe(bUseBathrobe);
    }
    return;
}
}
