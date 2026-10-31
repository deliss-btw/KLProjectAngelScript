const FConsoleVariable CVar_EnvImpact_Debug = FConsoleVariable();
const FConsoleVariable CVar_EnvImpact_SwitchLineTrace = FConsoleVariable();
const FConsoleVariable CVar_EnvImpact_ShowDiscardGroundNormal = FConsoleVariable();
const FConsoleVariable CVar_VfxSurfaceContact = FConsoleVariable();

class US_EnvSurfaceImpactSystem : UECSScriptSystem
{
    US_EnvSurfaceImpactSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_CheckEnvironmentSurfaceHit(const FCE_CheckEnvSurfaceHit &inout Event, const FCS_LocalTime &inout LocalTime) const
    {
        if (!(Event.Sender.IsValid()))
        {
            XLog(ELog(1), FString().Append("Job_CheckEnvironmentSurfaceHit Event sender is not valid."));
            return;
        }
        Has local_12;
        if (!(local_12.opCall()))
        {
            return;
        }
        bool local_13 = false;
        FStrikeEventData local_16 = Event.StrikeEventData;
        FEnvHitPresentationData local_42;
        if (CVar_EnvImpact_SwitchLineTrace.GetBool())
        {
            FSurfaceContactInfo local_72;
            local_72.SetApplyTargetType(EApplyTargetType(2));
            local_72.SetImpactEventType(EImpactEventType(1));
            local_72.SetImpactRotationType(EImpactRotationType(2));
            local_72.SetSocketName(FAttachRefName());
            local_72.SetTraceStartOffset(FVector(0.0, 0.0, 0.0));
            local_72.SetTraceDir(FVector(1.0, 0.0, 0.0));
            local_72.SetTraceLength(-1.0f);
            local_72.SetbDurational(false);
            local_72.SetCharacterSize(ECharacterBodySize(0));
            TDataObjectPtr<FBasePrefabConfig> local_116 = ::GetPrefabConfigPtr(Event.Sender);
            if (local_116)
            {
                local_72.SetCharacterSize(ECharacterBodySize(local_116.Get().Size));
            }
            local_13 = ::FEnvSurfaceImpactUtils::GetWeaponHitEnvSurfaceHitInfo(local_42, Event.Sender, local_16, local_72);
        }
        else
        {
            local_13 = ::FEnvSurfaceImpactUtils::CheckEnvSurfaceHit(local_42, Event.Sender, local_16);
        }
        if (!(local_13))
        {
            return;
        }
        float local_88 = FMath::RadiansToDegrees(FMath::Acos(local_42.HitNormal.DotProduct(FVector::UpVector)));
        float32 local_91 = float32(local_88);
        if (local_91 >= 0.0f && (local_91 < 30.0f))
        {
            if (CVar_EnvImpact_ShowDiscardGroundNormal.GetBool())
            {
                DebugDraw::DrawDebugLine(ECS::GetUEWorld(), local_42.HitLocation, (local_42.HitLocation + (local_42.HitNormal * 50.0)), FColor::Black, false, 5.0f, uint8(0), 0.0f);
            }
            return;
        }
        FFPTime local_174 = FFPTime(LocalTime.Time);
        FVector local_162 = local_16.StrikeDirection.opNeg();
        FRotator local_192 = local_162.ToOrientationRotator();
        FVector local_198(FVector::ZeroVector);
        FName local_200(n"Default");
        FRotator local_186 = FRotator::MakeFromZ(local_42.HitFanPlaneNormal);
        FVector local_198_2 = local_186.UnrotateVector(local_42.HitNormal);
        local_198_2.Z = 0.0;
        local_198_2 = local_186.RotateVector(local_198_2);
        if (FMath::Abs(local_162.DotProduct(local_42.HitNormal)) > 0.5)
        {
            FVector local_212 = local_42.HitNormal.RotateAngleAxis(90.0, local_42.HitNormal.CrossProduct(local_162).GetSafeNormal(9.99999993922529e-9, FVector::ZeroVector));
            local_162 = FMath::Lerp(local_162, local_212, 0.5);
            local_192 = local_162.ToOrientationRotator();
        }
        FVector local_180 = local_192.UnrotateVector(local_42.HitNormal.opNeg());
        local_180.X = 0.0;
        if (!(local_180.IsZero()))
        {
            float local_88_2 = FMath::RadiansToDegrees(FMath::Acos(local_180.GetUnsafeNormal().DotProduct(FVector::UpVector)));
            if (local_180.Y < 0.0)
            {
                local_88_2 = -local_88_2;
            }
            local_192.Roll = local_88_2;
        }
        UGamePhysicalMaterial local_226 = (Cast<UGamePhysicalMaterial>(local_42.PhysicsMaterial));
        if (local_226 != nullptr)
        {
            local_200 = local_226.FinalSurfaceTypeName;
        }
        FFPTime local_232 = FFPTime(-1);
        FCE_EnvSurfaceImpactFXEvent local_234;
        local_234.ImpactOutDir = local_198_2;
        local_234.bDurational = false;
        local_234.ImpactPosition = local_42.HitLocation;
        local_234.ImpactRotation = FRotator3f(local_192);
        local_234.ImpactSurfaceTypeName = local_200;
        TDataObjectPtr<FBasePrefabConfig> local_140 = ::GetPrefabConfigPtr(Event.Sender);
        if (local_140)
        {
            int local_92_2 = int(local_140.Get().Size);
            local_234.CharacterBodySize = ECharacterBodySize(local_92_2);
        }
        Get local_242;
        const FC_ArealStrikeEnvSurfaceFXConfig& local_244 = local_242.opCall();
        if (local_244)
        {
            local_234.FXStyle_Sparks = EArealStrikeEnvSurfaceFXStyle_Sparks(local_244.Style_Sparks);
        }
        return;
    }
    UFUNCTION()
    void Job_CheckEnvSurfaceFxPresentation(const FCE_EnvSurfaceImpactFXEvent &inout Event, const FCS_LocalTime &inout LocalTime) const
    {
        ::FEnvSurfaceImpactUtils::ShowEnvSurfaceImpact_Effect(Event, ::FEnvSurfaceImpactUtils::EnableLog(), FEnvSurfaceImpactUtils::CVar_EnvSurfaceImpact_PrintToScreen.GetBool());
        return;
    }
    UFUNCTION()
    void Run_Job_CheckEnvironmentSurfaceHit() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        TECSEventConstIterator<FCE_CheckEnvSurfaceHit> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_CheckEnvSurfaceHit& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.Job_CheckEnvironmentSurfaceHit(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_Job_CheckEnvSurfaceFxPresentation() const
    {
        int local_12 = 0;
        ECS::GetContextJob();
        FECSWorldPtr local_4 = this.GetECSWorld();
        Has local_8;
        if (!(local_8.opCall()))
        {
            return;
        }
        FECSWorldPtr local_4_2 = this.GetECSWorld();
        TECSEventConstIterator<FCE_EnvSurfaceImpactFXEvent> local_48 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_48.CanProceed;)
        {
            const FCE_EnvSurfaceImpactFXEvent& local_70 = local_48.Proceed();
            FECSEntityScopeCycleCounter local_71 = FECSEntityScopeCycleCounter(local_70.Sender);
            ECSInternal::PushContextTime(local_70.GetHandleTime());
            this.Job_CheckEnvSurfaceFxPresentation(local_70, local_12);
            ECSInternal::PopContextTime();
        }
        return;
    }
}

