
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
    int local_24;
    float32 local_26;
    UDataTable local_140;
    if (int(LandedInfo.GetImpactEventType()) != 2 && (int(LandedInfo.GetImpactEventType()) != 0))
    {
        return;
    }
    USFXSettings local_10 = UCombatGlobalSettings::Get().SFXSettings;
    if (!(local_10 == nullptr) && UCombatGlobalSettings::Get().SFXSettings.bEnableNewFootStepSFX)
    {
        ImpactFXUtils::HandleEntityLandedSound(EventSender, LandedInfo);
        return;
    }
    if (bDebug)
    {
        XLog(ELog(0), FString().Append("HandleEntityLandedSound Entity:").Append(EventSender.GetEntityName()).Append("  ImpactEventType: ").Append(LandedInfo.GetImpactEventType()));
    }
    FName local_21 = FImpactFXUtils::GetImpactRootBoneName(EventSender, LandedInfo.GetRootBoneName());
    FName local_23(EventSender.GetEntityName());
    local_24 = int(LandedInfo.GetCharacterSize());
    local_26 = LandedInfo.GetEntityMass();
    FVector local_34(LandedInfo.GetVelocity());
    FVector local_40(LandedInfo.GetLandedStrength());
    FVector local_46;
    FVector local_52;
    FQuat4f local_56;
    bool local_57 = false;
    FName local_19 = FSceneInteractUtils::GetLineTraceSurfaceName(local_57, local_46, local_52, local_56, EventSender, FImpactFXUtils::ConvertLandedInfo2SurfaceContanctInfo(LandedInfo));
    if ((local_19 == NAME_None))
    {
        local_19 = FGamePhysicsUtils::GetDefaultPhysicalSurfaceName();
    }
    if (!(local_57))
    {
        if (bDebug)
        {
            XLog(ELog(0), FString().Append("HandleEntityLandedSound: Trace failed for ").Append(local_23).Append(" (Entity: ").Append(EventSender.GetEntityName()).Append("), skipping SFX. OutLandedPosition=").Append(local_46.ToString()).Append(", RootBoneName=").Append(local_21).Append(", AttachName=").Append(LandedInfo.GetAttachName()));
            if (bPrintOnScreen)
            {
                Print(FString().Append("HandleEntityLandedSound: Trace failed for ").Append(local_23).Append(", SFX skipped"), 2.0f, FLinearColor::LucBlue);
            }
        }
        return;
    }
    int local_126 = 0;
    int local_125 = local_126;
    EActionImpactType local_127;
    local_127 = LandedInfo.GetActionImpactType();
    if (FASCommonUtils::IsAvatarPrefab(EventSender))
    {
    }
    else
    {
    }
    Get local_134;
    const FC_ImpactFXConfig& local_136 = local_134.opCall();
    if (local_136)
    {
        FName local_130;
        if (!((local_136.LandImpactConfigRowName == NAME_None)))
        {
            local_130 = local_136.LandImpactConfigRowName;
        }
    }
    if (int(local_127) != 0)
    {
        FName local_130;
        if (local_140 == nullptr)
        {
            if (bPrintOnScreen)
            {
                Print(FString().Append("HandleEntityLandedSound can not find datatable: ActionImpactSFXConfig"), 5.0f, FLinearColor::LucBlue);
            }
            return;
        }
        UDataTable::FindDataObject local_168;
        if (local_168.opCall(local_130))
        {
            const FActionSFXData& local_198 = local_19.GetDataRawByName().GetDataRawBySecondType().GetDataRawByThirdType();
            if (bDebug)
            {
                if (bPrintOnScreen)
                {
                    Print(FString().Append("Landed Impact ").Append(local_23).Append(": ").Append(local_19).Append(" -> ").Append(local_24).Append(" -> FActionImpactType:").Append(local_127).Append(" = -> AkEvent: ").Append(local_198.Event.GetAssetName()), 5.0f, FLinearColor::LucBlue);
                }
            }
            if (local_198.Event.IsPending())
            {
                if (bDebug)
                {
                    FString local_206 = FString(FString().Append("HandleEntityLandedSound Event"));
                    FString local_206_2 = ((local_206 + local_198.Event.GetAssetName()) + " IsPending, try AsyncLoad");
                    XLog(ELog(0), local_206_2);
                    if (bPrintOnScreen)
                    {
                        Print(local_206_2, 999.0f, FLinearColor::LucBlue);
                    }
                }
            }
            FQuat4f local_212;
            if (int(LandedInfo.GetImpactRotationType()) == 0)
            {
                local_212 = FTransformUtils::GetSocketRotationInActor(EventSender, local_21);
            }
            else
            {
                local_212 = FQuat4f(local_52.ToOrientationQuat());
            }
            FRotator3f local_234 = local_212.Rotator();
            if (FAsGameAudioUtils::CVar_UseNewAsynLoad.GetBool())
            {
                FGameAudioUtils::PlayEventAtLocation(local_198.Event, EventSender, FLoadEventCallback(), local_46, local_234.Quaternion(), FGameAudioUtils::GetCachedAudioWorld(), false, true);
            }
        }
        else
        {
            if (bDebug)
            {
                FString local_202 = FString();
                FString local_206_3 = FString(local_202.Append("Landed Impact ").Append(local_23).Append(": ").Append(local_19).Append(" -> ").Append(local_24).Append(" -> ").Append(local_127).Append(" -> Sound Event No Config!"));
                XLog(ELog(0), local_206_3);
                if (bPrintOnScreen)
                {
                    Print(local_206_3, 5.0f, FLinearColor::LucBlue);
                }
            }
        }
    }
    else
    {
        FName local_130;
        if (local_140 == nullptr)
        {
            if (bPrintOnScreen)
            {
                FString local_202_2 = FString();
                Print(local_202_2.Append("HandleEntityLandedSound can not find datatable: LandedImpactSFXConfig"), 5.0f, FLinearColor::LucBlue);
            }
            return;
        }
        UDataTable::FindDataObject local_268;
        if (local_268.opCall(local_130))
        {
            const FLISCharacterSizeData& local_296 = local_19.GetDataRawByName().GetDataRawBySecondType();
            if (LandedInfo.GetbUseLandedStrengthLevelDirectly())
            {
                local_125 = int(LandedInfo.GetLandedStrengthLevel());
            }
            else
            {
                local_125 = int(FImpactFXUtils::GetSFXLandedStrengthLevel(local_40, local_296));
            }
            const FLISStrengthData& local_298 = local_296.GetDataRawByThirdType();
            if (bDebug)
            {
                if (LandedInfo.GetbUseLandedStrengthLevelDirectly())
                {
                    FString local_206_4 = FString(FString().Append("Landed Impact ").Append(local_23).Append(": ").Append(local_19).Append(" -> ").Append(local_24).Append(" -> StepStrengthLevel:").Append(local_125).Append(" = -> SoundEvent: ").Append(local_298.Event));
                    XLog(ELog(0), local_206_4);
                    if (bPrintOnScreen)
                    {
                        Print(local_206_4, 5.0f, FLinearColor::LucBlue);
                    }
                }
                else
                {
                    FString local_206_5 = FString(FString().Append("Landed Impact ").Append(local_23).Append(": ").Append(local_19).Append(" -> ").Append(local_24).Append(" -> ").Append(local_125).Append(" = [").Append(local_26).Append(" * ").Append(local_34).Append(" = ").Append(local_40).Append("] -> SoundEvent: ").Append(local_298.Event));
                    XLog(ELog(0), local_206_5);
                    if (bPrintOnScreen)
                    {
                        Print(local_206_5, 5.0f, FLinearColor::LucBlue);
                    }
                }
            }
            if (local_298.Event.IsPending())
            {
                if (bDebug)
                {
                    FString local_202_3 = FString(FString().Append("HandleEntityLandedSound Event"));
                    FString local_14_2 = (local_202_3 + local_298.Event.GetAssetName());
                    FString local_202_4 = (local_14_2 + " IsPending, try AsyncLoad");
                    XLog(ELog(0), local_202_4);
                    if (bPrintOnScreen)
                    {
                        Print(local_202_4, 999.0f, FLinearColor::LucBlue);
                    }
                }
            }
            FQuat4f local_212;
            if (int(LandedInfo.GetImpactRotationType()) == 0)
            {
                local_212 = FTransformUtils::GetSocketRotationInActor(EventSender, local_21);
            }
            else
            {
                local_212 = FQuat4f(local_52.ToOrientationQuat());
            }
            FRotator3f local_231 = local_212.Rotator();
            if (FAsGameAudioUtils::CVar_UseNewAsynLoad.GetBool())
            {
                FGameAudioUtils::PlayEventAtLocation(local_298.Event, EventSender, FLoadEventCallback(), local_46, local_231.Quaternion(), FGameAudioUtils::GetCachedAudioWorld(), false, true);
            }
        }
        else
        {
            if (bDebug)
            {
                FString local_202_5 = FString(FString().Append("Landed Impact ").Append(local_23).Append(": ").Append(local_19).Append(" -> ").Append(local_24).Append(" -> ").Append(local_125).Append(" = [").Append(local_26).Append(" * ").Append(local_34).Append(" = ").Append(local_40).Append("] -> Sound Event No Config!"));
                XLog(ELog(0), local_202_5);
                if (bPrintOnScreen)
                {
                    Print(local_202_5, 5.0f, FLinearColor::LucBlue);
                }
            }
        }
    }
    return;
}
UFUNCTION()
void HandleEntityLandedEffect(const FECSEntity &inout EventSender, const FEntityLandedInfo &inout LandedInfo, const FFPTime &inout EventTime, const bool bDebug, const bool bPrintOnScreen)
{
    int local_20;
    float32 local_22;
    int local_128 = 0;
    UDataTable local_144;
    if (int(LandedInfo.GetImpactEventType()) != 1 && (int(LandedInfo.GetImpactEventType()) != 0))
    {
        return;
    }
    if (bDebug)
    {
        XLog(ELog(0), FString().Append("HandleEntityLandedEffect ").Append(EventTime).Append("  ImpactEventType ").Append(LandedInfo.GetImpactEventType()));
    }
    FName local_17 = FImpactFXUtils::GetImpactRootBoneName(EventSender, LandedInfo.GetRootBoneName());
    FName local_19(EventSender.GetEntityName());
    local_20 = int(LandedInfo.GetCharacterSize());
    local_22 = LandedInfo.GetEntityMass();
    FVector local_30(LandedInfo.GetVelocity());
    FVector local_36(LandedInfo.GetLandedStrength());
    FVector local_42;
    FVector local_48;
    FQuat4f local_52;
    bool local_53 = false;
    FName local_13 = FSceneInteractUtils::GetLineTraceSurfaceName(local_53, local_42, local_48, local_52, EventSender, FImpactFXUtils::ConvertLandedInfo2SurfaceContanctInfo(LandedInfo));
    if ((local_13 == NAME_None))
    {
        local_13 = FGamePhysicsUtils::GetDefaultPhysicalSurfaceName();
    }
    if (!(local_53))
    {
        if (bDebug)
        {
            XLog(ELog(0), FString().Append("HandleEntityLandedEffect: Trace failed for ").Append(local_19).Append(" (Entity: ").Append(EventSender.GetEntityName()).Append("), skipping VFX. OutLandedPosition=").Append(local_42.ToString()).Append(", RootBoneName=").Append(local_17).Append(", AttachName=").Append(LandedInfo.GetAttachName()));
            if (bPrintOnScreen)
            {
                Print(FString().Append("HandleEntityLandedEffect: Trace failed for ").Append(local_19).Append(", VFX skipped"), 2.0f, FLinearColor::LucBlue);
            }
        }
        return;
    }
    FFPTime local_126 = FFPTime(-1);
    local_128.SurfaceName = local_13;
    EActionImpactType local_129;
    local_129 = LandedInfo.GetActionImpactType();
    int local_132 = 0;
    int local_131 = local_132;
    if (FASCommonUtils::IsAvatarPrefab(EventSender))
    {
    }
    else
    {
    }
    Get local_138;
    const FC_ImpactFXConfig& local_140 = local_138.opCall();
    if (local_140)
    {
        FName local_134;
        if (!((local_140.LandImpactConfigRowName == NAME_None)))
        {
            local_134 = local_140.LandImpactConfigRowName;
        }
    }
    if (int(local_129) != 0)
    {
        FTransform local_384;
        FName local_134;
        if (local_144 == nullptr)
        {
            if (bPrintOnScreen)
            {
                Print(FString().Append("HandleEntityLandedEffect can not find datatable: LandedImpactVFXConfig"), 5.0f, FLinearColor::LucBlue);
            }
            return;
        }
        UDataTable::FindDataObject local_172;
        if (local_172.opCall(local_134))
        {
            const FActionVFXData& local_202 = local_13.GetDataRawByName().GetDataRawBySecondType().GetDataRawByThirdType();
            if (local_202.FXActor.IsNull())
            {
                if (bPrintOnScreen)
                {
                    Print(FString().Append("HandleEntityLandedEffect ").Append(local_19).Append(": ").Append(local_13).Append(" -> ").Append(local_20).Append(" -> ").Append(local_129).Append(" -> FxActor No Config!"), 5.0f, FLinearColor::LucBlue);
                }
                return;
            }
            FFXConfig local_318;
            if (bDebug)
            {
                if (bPrintOnScreen)
                {
                    Print(FString().Append("Landed Impact ").Append(local_19).Append(": ").Append(local_13).Append(" -> ").Append(local_20).Append(" -> FActionImpactType:").Append(local_129).Append(" = -> FxActor: ").Append(local_202.FXActor), 5.0f, FLinearColor::LucBlue);
                }
            }
            FQuat4f local_324;
            if (int(LandedInfo.GetImpactRotationType()) == 0)
            {
                local_324 = FTransformUtils::GetSocketRotationInActor(EventSender, local_17);
            }
            else
            {
                local_324 = FQuat4f(local_48.ToOrientationQuat());
            }
            FRotator3f local_346 = local_324.Rotator();
            local_318.SetAsset(FSoftClassPath(local_202.FXActor.ToString()));
            if (!((local_202.LocationOffset == FVector3f::ZeroVector)) || !((local_202.RotationOffset == FRotator3f::ZeroRotator)))
            {
                FRotator local_390 = FRotator(local_346);
                local_318.SetLocationOffset(local_384.TransformPosition(FVector(local_202.LocationOffset)));
                local_318.SetRotationOffset(local_384.TransformRotation(FRotator(local_202.RotationOffset)));
            }
            else
            {
                local_318.SetLocationOffset(local_42);
                local_318.SetRotationOffset(FRotator(local_346));
            }
            local_318.SetScale(FVector(local_202.Scale));
            local_318.SetbUseWorldOriginAsBaseTransformSource(true);
            local_318.SetLocationOffsetSpace(EFXOffsetSpace(2));
            local_318.SetRotationOffsetSpace(EFXOffsetSpace(2));
            local_318.SetbDetach(true);
            if (FSceneInteractUtils::CVar_Enable_SceneInteract_DebugLog.GetBool())
            {
                DebugDraw::DrawDebugLine(ECS::GetUEWorld(), local_318.GetLocationOffset(), (FVector(local_318.GetLocationOffset()) + (local_318.GetRotationOffset().GetForwardVector() * 100.0)), FColor::Yellow, false, 8.0f, uint8(0), 0.0f);
            }
            if (LandedInfo.GetbDurational())
            {
                ECSFX::PlayFXDurational(EventSender, local_318, EventTime, 1.0f, false);
            }
            else
            {
                ECSFX::PlayFXInstant(EventSender, local_318, EventTime, 1.0f, false, true);
            }
        }
        else
        {
            if (bDebug)
            {
                if (bPrintOnScreen)
                {
                    Print(FString().Append("Action Impact ").Append(local_19).Append(": ").Append(local_13).Append(" -> ").Append(local_20).Append(" -> [").Append(local_129).Append("]-> FxActor No Config!"), 5.0f, FLinearColor::LucBlue);
                }
            }
        }
    }
    else
    {
        FTransform local_384;
        FName local_134;
        if (local_144 == nullptr)
        {
            if (bPrintOnScreen)
            {
                Print(FString().Append("HandleEntityLandedEffect can not find datatable: LandedImpactVFXConfig"), 5.0f, FLinearColor::LucBlue);
            }
            return;
        }
        UDataTable::FindDataObject local_454;
        if (local_454.opCall(local_134))
        {
            const FLIVCharacterSizeData& local_482 = local_13.GetDataRawByName().GetDataRawBySecondType();
            if (LandedInfo.GetbUseLandedStrengthLevelDirectly())
            {
                local_131 = int(LandedInfo.GetLandedStrengthLevel());
            }
            else
            {
                local_131 = int(FImpactFXUtils::GetVFXLandedStrengthLevel(local_36, local_482));
            }
            const FLIVStrengthData& local_484 = local_482.GetDataRawByThirdType();
            if (local_484.FXActor.IsNull())
            {
                if (bPrintOnScreen)
                {
                    Print(FString().Append("HandleEntityLandedEffect ").Append(local_19).Append(": ").Append(local_13).Append(" -> ").Append(local_20).Append(" -> ").Append(local_131).Append(" -> FxActor No Config!"), 5.0f, FLinearColor::LucBlue);
                }
                return;
            }
            FFXConfig local_318;
            if (bDebug)
            {
                if (LandedInfo.GetbUseLandedStrengthLevelDirectly())
                {
                    if (bPrintOnScreen)
                    {
                        Print(FString().Append("Landed Impact ").Append(local_19).Append(": ").Append(local_13).Append(" -> ").Append(local_20).Append(" -> StepStrengthLevel:").Append(local_131).Append(" = -> FxActor: ").Append(local_484.FXActor), 5.0f, FLinearColor::LucBlue);
                    }
                }
                else
                {
                    if (bPrintOnScreen)
                    {
                        FString local_120_2 = FString();
                        Print(local_120_2.Append("Landed Impact ").Append(local_19).Append(": ").Append(local_13).Append(" -> ").Append(local_20).Append(" -> ").Append(local_131).Append(" = [").Append(local_22).Append(" * ").Append(local_30).Append(" = ").Append(local_36).Append("] -> FxActor: ").Append(local_484.FXActor), 5.0f, FLinearColor::LucBlue);
                    }
                }
            }
            FQuat4f local_324;
            if (int(LandedInfo.GetImpactRotationType()) == 0)
            {
                local_324 = FTransformUtils::GetSocketRotationInActor(EventSender, local_17);
            }
            else
            {
                local_324 = FQuat4f(local_48.ToOrientationQuat());
            }
            FRotator3f local_343 = local_324.Rotator();
            local_318.SetAsset(FSoftClassPath(local_484.FXActor.ToString()));
            if (!((local_484.LocationOffset == FVector3f::ZeroVector)) || !((local_484.RotationOffset == FRotator3f::ZeroRotator)))
            {
                FRotator local_390_2 = FRotator(local_343);
                local_318.SetLocationOffset(local_384.TransformPosition(FVector(local_484.LocationOffset)));
                local_318.SetRotationOffset(local_384.TransformRotation(FRotator(local_484.RotationOffset)));
            }
            else
            {
                local_318.SetLocationOffset(local_42);
                local_318.SetRotationOffset(FRotator(local_343));
            }
            local_318.SetScale(FVector(local_484.Scale));
            local_318.SetbUseWorldOriginAsBaseTransformSource(true);
            local_318.SetLocationOffsetSpace(EFXOffsetSpace(2));
            local_318.SetRotationOffsetSpace(EFXOffsetSpace(2));
            local_318.SetbDetach(true);
            if (FSceneInteractUtils::CVar_Enable_SceneInteract_DebugLog.GetBool())
            {
                DebugDraw::DrawDebugLine(ECS::GetUEWorld(), local_318.GetLocationOffset(), (FVector(local_318.GetLocationOffset()) + (local_318.GetRotationOffset().GetForwardVector() * 100.0)), FColor::Yellow, false, 8.0f, uint8(0), 0.0f);
            }
            if (LandedInfo.GetbDurational())
            {
                ECSFX::PlayFXDurational(EventSender, local_318, EventTime, 1.0f, false);
            }
            else
            {
                ECSFX::PlayFXInstant(EventSender, local_318, EventTime, 1.0f, false, true);
            }
        }
        else
        {
            if (bDebug)
            {
                if (bPrintOnScreen)
                {
                    FString local_10_2 = FString();
                    Print(local_10_2.Append("Landed Impact ").Append(local_19).Append(": ").Append(local_13).Append(" -> ").Append(local_20).Append(" -> [").Append(local_22).Append(" * ").Append(local_30).Append(" = ").Append(local_36).Append("]-> FxActor No Config!"), 5.0f, FLinearColor::LucBlue);
                }
            }
        }
    }
    return;
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
    UDataTable local_16;
    int local_22;
    int local_308 = 0;
    int local_318 = 0;
    AActor local_332;
    if ((int(SurfaceContanctInfo.GetImpactEventType())) != 1 && (int(SurfaceContanctInfo.GetImpactEventType()) != 0))
    {
        return;
    }
    if (bDebug)
    {
        XLog(ELog(0), FString().Append("HandleSurfaceContactEffect ").Append(EventTime).Append("  ImpactEventType ").Append(SurfaceContanctInfo.GetImpactEventType()));
    }
    if (local_16 == nullptr)
    {
        if (bPrintOnScreen)
        {
            Print(FString().Append("HandleSurfaceContactEffect can not find datatable: SurfaceContactVFXConfig"), 5.0f, FLinearColor::LucBlue);
        }
        return;
    }
    FName local_19(EventSender.GetEntityName());
    local_22 = int(SurfaceContanctInfo.GetCharacterSize());
    FVector local_30;
    FVector local_36;
    FQuat4f local_40;
    bool local_41 = false;
    FName local_21 = FSceneInteractUtils::GetLineTraceSurfaceName(local_41, local_30, local_36, local_40, EventSender, SurfaceContanctInfo);
    if ((local_21 == NAME_None))
    {
        local_21 = FGamePhysicsUtils::GetDefaultPhysicalSurfaceName();
    }
    UDataTable::FindDataObject local_72;
    if (local_72.opCall(n"Default"))
    {
        const FImpactFXData& local_100 = local_21.GetDataRawByName().GetDataRawBySecondType();
        if (local_100.FXActor.IsNull())
        {
            return;
        }
        FFXConfig local_216;
        if (bDebug)
        {
            if (bPrintOnScreen)
            {
                Print(FString().Append("Surface Contact Impact ").Append(local_19).Append(": ").Append(local_21).Append(" -> ").Append(local_22).Append(" -> FxActor: ").Append(local_100.FXActor), 5.0f, FLinearColor::LucBlue);
            }
        }
        FQuat4f local_220 = local_40;
        FRotator3f local_226 = local_220.Rotator();
        local_216.SetAsset(FSoftClassPath(local_100.FXActor.ToString()));
        if (!((local_100.LocationOffset == FVector3f::ZeroVector)) || !((local_100.RotationOffset == FRotator3f::ZeroRotator)))
        {
            FRotator local_270 = FRotator(local_226);
            FTransform local_264;
            local_216.SetLocationOffset(local_264.TransformPosition(FVector(local_100.LocationOffset)));
            local_216.SetRotationOffset(local_264.TransformRotation(FRotator(local_100.RotationOffset)));
        }
        else
        {
            local_216.SetLocationOffset(local_30);
            local_216.SetRotationOffset(FRotator(local_226));
        }
        local_216.SetScale(FVector(local_100.Scale));
        local_216.SetbUseWorldOriginAsBaseTransformSource(true);
        local_216.SetLocationOffsetSpace(EFXOffsetSpace(2));
        local_216.SetRotationOffsetSpace(EFXOffsetSpace(2));
        local_216.SetbDetach(true);
        if (FSceneInteractUtils::CVar_Enable_WeaponDraggingOnGround_DebugDraw.GetBool())
        {
            DebugDraw::DrawDebugLine(ECS::GetUEWorld(), local_216.GetLocationOffset(), (FVector(local_216.GetLocationOffset()) + (local_216.GetRotationOffset().GetForwardVector() * 100.0)), FColor::Yellow, false, 8.0f, uint8(0), 0.0f);
        }
        if (local_41)
        {
            bool local_5;
            local_5 = local_100.bIsLoop;
            if (local_5)
            {
                if (!(SurfaceContanctInfo.GetbUseEntitySystem()))
                {
                    local_5 = false;
                }
                else
                {
                    Has local_312;
                    local_5 = local_312.opCall();
                }
                if (local_5)
                {
                    if (local_318.SocketAttachedEntity.IsValid())
                    {
                        if (!(local_308.FxEntity.IsValid()))
                        {
                            local_308.FxEntity = FFXUtils::PlayFXDurationalBySoftRef(EventSender, local_100.FXActor, TArray<FFXOverrideParam>(), SurfaceContanctInfo.GetSocketName().Name, true, EFXBaseTransformResolveModeWithAttachmentOption(0), FVector(local_100.LocationOffset), EFXOffsetSpaceWithAttachmentOption(3), FRotator(local_100.RotationOffset), EFXOffsetSpaceWithAttachmentOption(3), true, local_318.SocketAttachedEntity, EAttachFXStopMethod(0));
                        }
                    }
                    else
                    {
                        if (!(local_308.FxEntity.IsValid()))
                        {
                            local_308.FxEntity = FFXUtils::PlayFXDurationalBySoftRef(EventSender, local_100.FXActor, TArray<FFXOverrideParam>(), SurfaceContanctInfo.GetSocketName().Name, true, EFXBaseTransformResolveModeWithAttachmentOption(0), FVector(local_100.LocationOffset), EFXOffsetSpaceWithAttachmentOption(3), FRotator(local_100.RotationOffset), EFXOffsetSpaceWithAttachmentOption(3), true, EventSender, EAttachFXStopMethod(0));
                        }
                    }
                }
                else
                {
                    local_332 = local_308.FxActor;
                    if (!((local_332 != nullptr)))
                    {
                        local_308.FxActor = (FImpactFXUtils::PlayWeaponDraggingFX(EventSender, local_100.FXActor, SurfaceContanctInfo, FVector(local_100.LocationOffset), FRotator(local_100.RotationOffset)));
                    }
                }
            }
            else
            {
                if (SurfaceContanctInfo.GetbDurational())
                {
                    ECSFX::PlayFXDurational(EventSender, local_216, EventTime, 1.0f, false);
                }
                else
                {
                    ECSFX::PlayFXInstant(EventSender, local_216, EventTime, 1.0f, false, true);
                }
            }
        }
        else
        {
            if (local_100.bIsLoop && local_308.HasValidFX())
            {
                if (local_308.FxEntity.IsValid())
                {
                    FFXUtils::StopFX(local_308.FxEntity, false);
                }
                if (local_308.FxActor != nullptr)
                {
                    local_308.FxActor.DetachFromActor(EDetachmentRule(0), EDetachmentRule(0), EDetachmentRule(0));
                    local_308.FxActor.DestroyActor();
                }
                local_308.ClearAllFX();
            }
        }
        return;
    }
    if (bDebug)
    {
        if (bPrintOnScreen)
        {
            Print(FString().Append("Surface Contact Impact ").Append(local_19).Append(": ").Append(local_21).Append(" -> ").Append(local_22).Append(" -> FxActor No Config!"), 5.0f, FLinearColor::LucBlue);
        }
    }
    return;
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
