
namespace FSocialUtils
{
UFUNCTION()
void CreateSocialActionEvent(const FECSEntity &inout Entity, const int SocialActionAnimIndex, const TDataObjectPtr<FMotionData> &inout MotionData)
{
    FFPTime local_8 = FFPTime(-1);
    FECSWorldPtr local_2 = Entity.GetWorld();
    FCE_SocialActionAnimEvent local_12;
    local_12.ActionAnimIndex = SocialActionAnimIndex;
    local_12.MotionData = MotionData;
    return;
}
UFUNCTION()
void CreateSocialRequestInteractActionEvent(const FECSEntity &inout Entity, const FECSEntity &inout TargetEntity, const TDataObjectPtr<FMotionData> &inout MotionData)
{
    int local_12 = 0;
    FFPTime local_8 = FFPTime(-1);
    FECSWorldPtr local_2 = Entity.GetWorld();
    local_12.RequestInteractAnimSourceEntity = Entity;
    local_12.RequestInteractAnimTargetEntity = TargetEntity;
    local_12.MotionData = MotionData;
    return;
}
UFUNCTION()
void PlaySocialAction(const FECSEntity &inout LocalPlayerPawn, const FECSEntity &inout LocalPlayer, const TDataObjectPtr<FMotionData> &inout Data)
{
    int local_2 = 0;
    int local_10 = 0;
    int local_58 = 0;
    if (LocalPlayer.IsValid())
    {
        local_10.SetSocialAnimName(EInteractionSocialTypeForESM(Data.opArrow().AnimName));
    }
    if (int(local_2) == 0)
    {
        FCE_SocialActionAnimEvent local_22;
        FFPTime local_20 = FFPTime(-1);
        local_22.ActionAnimIndex = Data.opArrow().AnimIndex;
        local_22.MotionData = Data;
        return;
    }
    if (int(local_2) == 1)
    {
        Get local_50;
        const FC_SelectSocialInteractionInfo& local_52 = local_50.opCall();
        if (local_52)
        {
            FSocialUtils::CreateSocialRequestInteractActionEvent(LocalPlayerPawn, local_52.InteractTarget, Data);
        }
        else
        {
            FSocialUtils::CreateSocialRequestInteractActionEvent(LocalPlayerPawn, ENTITY_NULL, Data);
        }
        return;
    }
    if (int(local_2) == 2)
    {
        if (LocalPlayer.GetBB_Int(Data.opArrow().PropNum) < Data.opArrow().MaxCount)
        {
            FFPTime local_20_2 = FFPTime(-1);
            local_58.Prefab = Data.opArrow().Prefab;
            local_58.PropNum = Data.opArrow().PropNum;
            local_58.SelectParams = Data.opArrow().GetSelectParams();
            const UFrontendSystemConfig local_86 = FrontendSystemUtil::FindSystemConfigByName("Social");
            if (local_86 != nullptr)
            {
                FrontendSystemUtil::ExitSystem(LocalPlayer, local_86);
            }
        }
    }
    return;
}
UFUNCTION()
void CancelSocialInteractActionRequest(const FECSEntity &inout Entity)
{
    int local_14 = 0;
    FASCommonUtils::GetUniquePlayerEntity(Entity);
    local_14.SetRequestInteractActionTargetPlayerEntity(ENTITY_NULL);
    local_14.SetRequestInteractActionIndex(-1);
    return;
}
UFUNCTION()
void GetSocialSpawnPropKeys(const FECSEntity &inout PlayerEntity, TArray<FString> &out Keys)
{
    int local_10;
    TArray<FString> local_4;
    Keys = local_4;
    for (auto& local_30 : local_10.SocialSpawnPropConfig.SocialSpawnPropItems)
    {
        Keys.Add(local_30.GetKey());
    }
    return;
}
UFUNCTION()
void GetSocialSpawnPropConfigByKey(const FECSEntity &inout PlayerEntity, const FString &inout Key, bool &out Result, FSocialSpawnPropItemConfig &out SocialSpawnPropItemConfig)
{
    int local_14 = 0;
    Result = false;
    TMap<FString, FSocialSpawnPropItemConfig> local_34 = local_14.SocialSpawnPropConfig.SocialSpawnPropItems;
    if (local_34.Contains(Key))
    {
        Result = local_34.Find(Key, SocialSpawnPropItemConfig);
    }
    return;
}
UFUNCTION()
void CreateSocialSpawnPropEvent(const FECSEntity &inout PlayerEntity, const FString &inout SpawnPropKey, const FTransform &inout SpawnTransform)
{
    int local_20 = 0;
    FECSEntity local_8 = FASCommonUtils::GetControlledPawnEntity(PlayerEntity);
    FFPTime local_16 = FFPTime(-1);
    FECSWorldPtr local_10 = local_8.GetWorld();
    local_20.PlayerEntity = PlayerEntity;
    local_20.SpawnPropKey = SpawnPropKey;
    local_20.Location = SpawnTransform.GetLocation();
    local_20.Rotator = FRotator3f(SpawnTransform.Rotator());
    return;
}
UFUNCTION()
FTransform GetLocalSocialSpawnPropTransform(const float32 DistanceOffset = 150)
{
    FTransform local_24;
    if (ECS::GetRuntimeInfo().IsClient)
    {
        FECSEntity local_34 = FASCommonUtils::GetLocalPlayerPawnEntity();
        Get local_64;
        FTransform local_88 = local_64.opCall().ToFTransform();
        APlayerCameraManager local_96 = Gameplay::GetPlayerCameraManager(__GetWorldContext(), 0);
        FVector local_108 = local_96.GetCameraLocation();
        FVector local_126(local_96.GetCameraRotation().GetForwardVector());
        local_126.Z = 0.0;
        FVector local_146 = (local_88.GetLocation() + (local_126 * DistanceOffset));
        FVector local_140_2 = (FRotator::MakeFromX((local_146 - local_108)).GetForwardVector() * 1500.0);
        FVector local_134 = (local_108 + local_140_2);
        FHitResult local_218;
        FCollisionQueryParams local_256;
        local_256.AddIgnoredActor(local_34.GetActor());
        local_256.bTraceComplex = (false != 0);
        FCollisionResponseParams local_267;
        bool local_25 = FPhysicsUtils::LineTraceSingle(ECS::GetUEWorld(), EPhysicsTraceTag(0), local_218, local_108, local_134, ECollisionChannel(0), local_256, local_267);
        local_24.SetRotation(FRotator::MakeFromX(local_126));
        if (local_25)
        {
            local_24.SetLocation(local_218.Location);
            return local_24;
        }
        local_24.SetLocation(local_134);
        return local_24;
    }
    return local_24;
}
UFUNCTION()
void PlayerEntitySetExpressionContent(const FECSEntity &inout PlayerEntity, const FString &inout Content)
{
    FFPTime local_6 = FFPTime(-1);
    0.ExpressionContent = Content;
    return;
}
}
