
namespace FaceCustomizeUtils
{
void ApplyFacePresetToActor(const AActor Actor, const uint AvatarId, const uint FacePresetId)
{
    if (!(FAvatarPrefabConfig::GetByDataId(AvatarId)))
    {
        return;
    }
    TDataObjectPtr<FFacePresetConfig> local_74 = FFacePresetConfig::GetByDataId(FacePresetId);
    if (!(local_74))
    {
        return;
    }
    bool local_101 = false;
    USkeletalMeshComponent local_106 = AppearanceMeshUtils::ResolveViewMesh(Actor, local_101);
    if (local_106 == nullptr)
    {
        return;
    }
    USkeletalMeshComponent local_108 = AppearanceMeshUtils::FindChildSkeletalMesh(local_106, AppearanceMeshUtils::FaceChildName);
    if (local_108 == nullptr)
    {
        return;
    }
    EGenderType local_100;
    FaceCustomizeUtils::ApplyMeshToChild(local_108, local_74, EGenderType(local_100));
    return;
}
void ApplyMeshToChild(const USkeletalMeshComponent FaceMesh, const TDataObjectPtr<FFacePresetConfig> &inout PresetConfig, const EGenderType GenderType)
{
    if (int(GenderType) == 1)
    {
    }
    else
    {
    }
    TSoftObjectPtr<USkeletalMesh> local_10;
    if (local_10.IsNull())
    {
        return;
    }
    USkeletalMesh local_16 = (Cast<USkeletalMesh>(local_10.ToSoftObjectPath().TryLoad()));
    if (local_16 == nullptr)
    {
        return;
    }
    FaceMesh.SetSkeletalMeshAsset(local_16);
    AppearanceMeshUtils::ResetMaterialOverrides(FaceMesh);
    return;
}
void ApplyBodyMaterialToMesh(const USkeletalMeshComponent SkComp, const TSoftObjectPtr<UMaterialInterface> &inout MaterialPtr)
{
    if (SkComp == nullptr || MaterialPtr.IsNull())
    {
        return;
    }
    int local_6 = SkComp.GetMaterialIndex(AppearanceMeshUtils::BodyMaterialSlotName);
    if (local_6 < 0)
    {
        return;
    }
    UMaterialInterface local_8 = (Cast<UMaterialInterface>(MaterialPtr.ToSoftObjectPath().TryLoad()));
    if (local_8 == nullptr)
    {
        XError(ELog(79), FString().Append("ApplyBodyMaterialToMesh: failed to load material path=").Append(MaterialPtr.ToSoftObjectPath().ToString()).Append(" SkComp=").Append(SkComp));
        return;
    }
    SkComp.SetMaterial(local_6, local_8);
    return;
}
void ApplyFacePresetBodyMaterialToActor(const AActor Actor, const uint AvatarId, const uint FacePresetId)
{
    EGenderType local_100 = EGenderType(0);
    if (FacePresetId == 0)
    {
        return;
    }
    if (!(FAvatarPrefabConfig::GetByDataId(AvatarId)))
    {
        return;
    }
    if (!(FFacePresetConfig::GetByDataId(FacePresetId)))
    {
        return;
    }
    if ((int(local_100)) == 1)
    {
    }
    else
    {
    }
    TSoftObjectPtr<UMaterialInterface> local_110;
    if (local_110.IsNull())
    {
        return;
    }
    bool local_113 = false;
    USkeletalMeshComponent local_118 = AppearanceMeshUtils::ResolveViewMesh(Actor, local_113);
    if (local_118 == nullptr)
    {
        return;
    }
    USkeletalMeshComponent local_120 = AppearanceMeshUtils::FindChildSkeletalMesh(local_118, AppearanceMeshUtils::UpperChildName);
    if (local_120 != nullptr)
    {
        FaceCustomizeUtils::ApplyBodyMaterialToMesh(local_120, local_110);
    }
    USkeletalMeshComponent local_122 = AppearanceMeshUtils::FindChildSkeletalMesh(local_118, AppearanceMeshUtils::LowerChildName);
    if (local_122 != nullptr)
    {
        FaceCustomizeUtils::ApplyBodyMaterialToMesh(local_122, local_110);
    }
    return;
}
}
