namespace FImpactFXUtils
{
UFUNCTION()
void SendSurfaceContactEvent(const FECSWorldPtr &inout ECSWorld, const EApplyTargetType ApplyTargetType, const FECSEntity &inout Entity, const FESMActionTime &inout Time, const FSurfaceLineTraceConfig &inout Config)
{
    FFPTime local_14 = (FFPTime(Time.WorldTime) + FFPTime(Config.VFXDelay));
    FImpactFXUtils::FilllSurfaceContactEventData(EApplyTargetType(ApplyTargetType), Entity, 0.SurfaceContactInfo, Config, EImpactEventType(1));
    return;
}
UFUNCTION()
void FilllSurfaceContactEventData(const EApplyTargetType ApplyTargetType, const FECSEntity &inout Entity, FSurfaceContactInfo &inout Info, const FSurfaceLineTraceConfig &inout Config, const EImpactEventType Type)
{
    int local_53 = 0;
    Info.SetApplyTargetType(EApplyTargetType(ApplyTargetType));
    Info.SetImpactEventType(EImpactEventType(Type));
    Info.SetTraceLength(Config.TraceLength);
    Info.SetImpactRotationType(Config.ImpactRotationType);
    Info.SetRootBoneName(Config.RootBoneName);
    Info.SetSocketName(Config.TraceStartBoneOrSocketName);
    Info.SetWeaponMeshComponent(Config.WeaponMeshComponent);
    Info.SetFxStartLocation(Config.FxStartLocation);
    Info.SetTraceStartOffset(Config.TraceStartOffset);
    Info.SetTraceDir(Config.TraceDir);
    Info.SetbDurational(false);
    Info.SetCharacterSize(ECharacterBodySize(0));
    if (GetPrefabConfigPtr(Entity))
    {
        Info.SetCharacterSize(ECharacterBodySize(local_53));
    }
    return;
}
UFUNCTION()
void FillLandedEventData(const FECSEntity &inout Entity, FEntityLandedInfo &inout EntityLandedInfo, const FFootLineTraceConfig &inout Config)
{
    int local_10 = 0;
    EntityLandedInfo.SetTraceLength(Config.TraceLengthForSurfaceDetection);
    EntityLandedInfo.SetImpactRotationType(Config.ImpactRotationType);
    EntityLandedInfo.SetRootBoneName(Config.RootBoneName);
    EntityLandedInfo.SetAttachName(Config.TraceStartBoneOrSocketName.Name);
    EntityLandedInfo.SetTraceStartOffset(Config.TraceStartOffset);
    EntityLandedInfo.SetTraceDir(FVector::DownVector);
    float32 local_1 = FPhysicsUtils::GetMass(Entity);
    FVector local_16(local_10.GetVelocity());
    FVector local_36 = FVector((local_1 * local_16.X), (local_1 * local_16.Y), (local_1 * local_16.Z));
    EntityLandedInfo.SetVelocity(local_16);
    EntityLandedInfo.SetEntityMass(local_1);
    EntityLandedInfo.SetLandedStrength(local_36);
    EntityLandedInfo.SetbUseLandedStrengthLevelDirectly(true);
    EntityLandedInfo.SetLandedStrengthLevel(Config.StepStrengthLevel);
    EntityLandedInfo.SetbDurational(false);
    int local_39 = 0;
    EntityLandedInfo.SetCharacterSize(EPrefabSize(local_39));
    if (GetPrefabConfigPtr(Entity))
    {
        EntityLandedInfo.SetCharacterSize(EPrefabSize(local_39));
    }
    return;
}
UFUNCTION()
ELandedStrength GetSFXLandedStrengthLevel(const FVector &inout StrengthForce, const FLISCharacterSizeData &inout CharacterSizeData)
{
    float local_4 = StrengthForce.Size();
    if (local_4 >= CharacterSizeData.Light.MinImpactStrength && (local_4 < CharacterSizeData.Light.MaxImpactStrength))
    {
        return ELandedStrength(1);
    }
    if (local_4 >= CharacterSizeData.Moderate.MinImpactStrength && (local_4 < CharacterSizeData.Moderate.MaxImpactStrength))
    {
        return ELandedStrength(2);
    }
    if (local_4 >= CharacterSizeData.High.MinImpactStrength && (local_4 < CharacterSizeData.High.MaxImpactStrength))
    {
        return ELandedStrength(3);
    }
    if (local_4 >= CharacterSizeData.Extreme.MinImpactStrength && (local_4 < CharacterSizeData.Extreme.MaxImpactStrength))
    {
        return ELandedStrength(4);
    }
    if (local_4 >= CharacterSizeData.Default.MinImpactStrength && (local_4 < CharacterSizeData.Default.MaxImpactStrength))
    {
        return ELandedStrength(0);
    }
    return ELandedStrength(0);
}
UFUNCTION()
ELandedStrength GetVFXLandedStrengthLevel(const FVector &inout StrengthForce, const FLIVCharacterSizeData &inout CharacterSizeData)
{
    float local_4 = StrengthForce.Size();
    if (local_4 >= CharacterSizeData.Light.MinImpactStrength && (local_4 < CharacterSizeData.Light.MaxImpactStrength))
    {
        return ELandedStrength(1);
    }
    if (local_4 >= CharacterSizeData.Moderate.MinImpactStrength && (local_4 < CharacterSizeData.Moderate.MaxImpactStrength))
    {
        return ELandedStrength(2);
    }
    if (local_4 >= CharacterSizeData.High.MinImpactStrength && (local_4 < CharacterSizeData.High.MaxImpactStrength))
    {
        return ELandedStrength(3);
    }
    if (local_4 >= CharacterSizeData.Extreme.MinImpactStrength && (local_4 < CharacterSizeData.Extreme.MaxImpactStrength))
    {
        return ELandedStrength(4);
    }
    if (local_4 >= CharacterSizeData.Default.MinImpactStrength && (local_4 < CharacterSizeData.Default.MaxImpactStrength))
    {
        return ELandedStrength(0);
    }
    return ELandedStrength(0);
}
UFUNCTION()
FSurfaceContactInfo ConvertLandedInfo2SurfaceContanctInfo(const FEntityLandedInfo &inout LandedInfo)
{
    FSurfaceContactInfo local_30;
    local_30.SetApplyTargetType(EApplyTargetType(0));
    local_30.GetModify_SocketName().Name = LandedInfo.GetAttachName();
    int local_36 = int(LandedInfo.GetCharacterSize());
    local_30.SetCharacterSize(ECharacterBodySize(local_36));
    local_30.SetImpactEventType(LandedInfo.GetImpactEventType());
    local_30.SetImpactRotationType(LandedInfo.GetImpactRotationType());
    local_30.SetRootBoneName(LandedInfo.GetRootBoneName());
    local_30.SetTraceDir(LandedInfo.GetTraceDir());
    local_30.SetTraceLength(LandedInfo.GetTraceLength());
    local_30.SetTraceStartOffset(LandedInfo.GetTraceStartOffset());
    local_30.SetbDurational(LandedInfo.GetbDurational());
    return local_30;
}
UFUNCTION()
void LoadEventCallBack(const UObject ObjectLoaded)
{
    return;
}
UFUNCTION()
void HandleEntityLandedSound(const FECSEntity &inout EventSender, const FEntityLandedInfo &inout LandedInfo, const bool bDebug, const bool bPrintOnScreen)
{
    // body not fully recovered — stub [argmismatch:argint]
}
UFUNCTION()
void HandleEntityLandedEffect(const FECSEntity &inout EventSender, const FEntityLandedInfo &inout LandedInfo, const FFPTime &inout EventTime, const bool bDebug, const bool bPrintOnScreen)
{
    // body not fully recovered — stub [argmismatch:argint]
}
FName GetImpactRootBoneName(const FECSEntity &inout Entity, const FName &inout RootBoneName)
{
    FName local_2 = RootBoneName;
    if (!(FTransformUtils::DoesSocketExistInActor(Entity, local_2)))
    {
        local_2 = n"Root";
    }
    return local_2;
}
UFUNCTION()
void HandleSurfaceContactEffect(const FECSEntity &inout EventSender, const FSurfaceContactInfo &inout SurfaceContanctInfo, const FFPTime &inout EventTime, const bool bDebug, const bool bPrintOnScreen)
{
    // body not fully recovered — stub [argmismatch:argint]
}
UFUNCTION()
AActor PlayWeaponDraggingFX(const FECSEntity &inout PawnEntity, const TSoftClassPtr<AFXActor> &inout FXActor, const FSurfaceContactInfo &inout SurfaceContactInfo, const FVector &inout LocationOffset, const FRotator &inout RotationOffset)
{
    USceneComponent local_2;
    const AActor local_6;
    UClass local_82;
    AActor local_92;
    local_6 = PawnEntity.GetActor();
    if (local_6 != nullptr)
    {
        UStaticMeshComponent local_10 = Cast<UStaticMeshComponent>(local_6.GetComponentByClass(UStaticMeshComponent));
        if (local_10 != nullptr && (local_10.GetName() == SurfaceContactInfo.GetWeaponMeshComponent().ToString()))
        {
            local_2 = local_10;
        }
        else
        {
            USkeletalMeshComponent local_26 = Cast<USkeletalMeshComponent>(local_6.GetComponentByClass(USkeletalMeshComponent));
            if (local_26 != nullptr && (local_26.GetName() == SurfaceContactInfo.GetWeaponMeshComponent().ToString()))
            {
                local_2 = local_26;
            }
        }
    }
    if (local_2 != nullptr)
    {
        FTransform local_80 = local_2.GetSocketTransform(SurfaceContactInfo.GetSocketName().Name, ERelativeTransformSpace(0));
        local_82 = FXActor.Get();
        if (!(IsValid(local_82)))
        {
            XWarning(ELog(49), FString().Append("PlayWeaponDraggingFX failed due to invalid FXActor: ").Append(FXActor));
            return nullptr;
        }
        local_92 = SpawnActor(TSubclassOf<AActor>(local_82), local_80.GetLocation(), local_80.Rotator(), NAME_None, false, nullptr, nullptr);
        if (local_92 != nullptr)
        {
            local_92.AttachToComponent(local_2, SurfaceContactInfo.GetSocketName().Name, EAttachmentRule(0), EAttachmentRule(0), EAttachmentRule(1), false);
            local_92.SetActorRelativeLocation(LocationOffset);
            local_92.SetActorRelativeRotation(RotationOffset);
        }
        if (FSceneInteractUtils::CVar_Enable_WeaponDraggingOnGround_DebugDraw.GetBool())
        {
            FVector local_104 = local_80.TransformPosition(LocationOffset);
            DebugDraw::DrawDebugLine(ECS::GetUEWorld(), local_104, (local_104 + FVector(0.0, 0.0, 100.0)), FColor::Red, false, 8.0f, uint8(0), 0.0f);
        }
        return local_92;
    }
    return nullptr;
}
}
