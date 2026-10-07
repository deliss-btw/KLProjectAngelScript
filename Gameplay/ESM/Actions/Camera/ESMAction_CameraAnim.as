
enum ECameraAnimBlendParamType
{
    None,
    LockTargetDistance,
    LockTargetPitchAngle,
}

enum ECameraAnimOriginTransfromType
{
    Pawn,
    LookAtLockTarget,
    AttachParent,
    LockTarget,
    InteractTarget,
    WorldTransform,
    ManipulateMaster,
    CustomBBEntity,
}

const FConsoleVariable CVar_ForceConvexCollision = FConsoleVariable();
const FConsoleVariable CVar_DrawConvex = FConsoleVariable();
const FConsoleVariable CVar_DrawHitConvex = FConsoleVariable();

// NOTE: class defaults are not authored in this module: UESMAction_CameraAnim (default scalar field UESMAction.NetSimulateMode has no declared value type; load the matching Binds.Cache to author this module's defaults, or rerun with --force to use unverified Binds.Cache types (the result may be wrong)).
// They are carried over byte-exact when this module is recompiled.

struct FESMCameraAnimInstanceData
{
    UPROPERTY()
    bool MuteViewControlCounterModified;
    UPROPERTY()
    bool bCameraActivated = false;
    UPROPERTY()
    FECSEntity OriginEntity;
    UPROPERTY()
    FVector OriginPosition;
    UPROPERTY()
    FQuat4f OriginRotation;
    UPROPERTY()
    FVector LastOriginPosition;
    UPROPERTY()
    FQuat4f LastOriginRotation;
    UPROPERTY()
    FVector3f FocusPositionOffset;
    UPROPERTY()
    float32 BlendParam = 0.0f;
    UPROPERTY()
    FAnimCameraConvexCache ConvexCache;
    UPROPERTY()
    int ConvexTestIndex = 0;
    UPROPERTY()
    bool bCollisionCheckComplete = false;
    UPROPERTY()
    bool bCollisionBlocked = false;
    UPROPERTY()
    bool bFallbackModifierStarted = false;
    UPROPERTY()
    FVector CustomCollisionOrigin;


}

class UESMAction_CameraAnim : UESMBPBaseSpanTickAction
{
    UPROPERTY()
    FDataObjectPtr AnimKey;
    UPROPERTY()
    float32 NormalizedStartTime = 0.0f;
    UPROPERTY()
    float32 NormalizedEndTime = 1.0f;
    UPROPERTY()
    ECameraAnimBlendParamType BlendParamType = ECameraAnimBlendParamType(0);
    UPROPERTY()
    ECameraAnimOriginTransfromType OriginTransformType = ECameraAnimOriginTransfromType(0);
    UPROPERTY()
    FNameHandle_EntityBBVarEntity CustomBBEntityBBVar;
    UPROPERTY()
    EOffsetRefType OriginalPositionType = EOffsetRefType(1);
    UPROPERTY()
    bool bNormalFadeOutAfterExit = false;
    UPROPERTY()
    bool bUpdateBlendParam = false;
    UPROPERTY()
    bool bUpdateOriginTransform = false;
    UPROPERTY()
    bool bHideDynamicIcons;
    UPROPERTY()
    bool bEnableCollisionCorrection = true;
    UPROPERTY()
    bool bEnableCollisionPreCheck = false;
    UPROPERTY()
    float32 OverrideConvexScale = -1.0f;
    UPROPERTY()
    bool bLoop = false;
    UPROPERTY()
    bool bFadeOutCheckByWorldTime = false;


    UFUNCTION()
    FESMInstanceDataInfo GetViewInstanceDataInfo_Implementation() const
    {
        return ESMInstanceData::MakeRuntimeInstanceDataInfo(FESMCameraAnimInstanceData);
    }
    UFUNCTION()
    EESMAssetWorkflow GetWorkflow_Implementation() const
    {
        return EESMAssetWorkflow(3);
    }
    UFUNCTION()
    FLinearColor GetBackgroundColor_Implementation() const
    {
        return ESMActionColor::Camera;
    }
    UFUNCTION()
    void GetRestriction_Implementation(FESMNotifyRestriction &inout OutParam) const
    {
        OutParam.IdentifyName = UESMAction_CameraAnim.opArrow().GetFName();
        OutParam.bExclusive = true;
        return;
    }
    UFUNCTION()
    bool IsNotifyTypeAllowed_Implementation(const EESMNotifyType InType) const
    {
        return (int(InType) == 1);
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(2);
    }
    UFUNCTION()
    EESMActionExitPolicy GetExitPolicy_Implementation() const
    {
        return EESMActionExitPolicy(1);
    }
    UFUNCTION()
    void ViewEnter_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        FESMCameraAnimInstanceData& local_2 = this.ModifyViewInstanceData(Context);
        const FAnimCameraData& local_4 = FAnimCameraData::GetData(this.AnimKey);
        if (!(local_4.IsValid()))
        {
            return;
        }
        local_2.OriginEntity = this.ResolveOriginEntity(Context);
        if (!(local_2.OriginEntity.IsValid()) && (int(this.OriginTransformType) != 5))
        {
            local_2.bCameraActivated = false;
            local_2.MuteViewControlCounterModified = false;
            return;
        }
        this.ActivateCameraAnim(Context, Time, local_2, local_4);
        return;
    }
    UFUNCTION()
    void ViewTick_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        FC_AnimatedCamera local_20;
        int local_38 = 0;
        float32 local_85;
        float32 local_86;
        bool local_97;
        const FAnimCameraData& local_2 = FAnimCameraData::GetData(this.AnimKey);
        if (!(local_2.IsValid()))
        {
            return;
        }
        FESMCameraAnimInstanceData& local_6 = this.ModifyViewInstanceData(Context);
        if (!(local_6.bCameraActivated))
        {
            local_6.OriginEntity = this.ResolveOriginEntity(Context);
            if (!(local_6.OriginEntity.IsValid()) && (int(this.OriginTransformType) != 5))
            {
                return;
            }
            this.ActivateCameraAnim(Context, Time, local_6, local_2);
        }
        if (!(local_20))
        {
            return;
        }
        FESMCameraAnimInstanceData& local_22 = this.ModifyViewInstanceData(Context);
        if (local_22.bCollisionBlocked)
        {
            return;
        }
        if (this.bUpdateOriginTransform || this.bUpdateBlendParam)
        {
            if (this.bUpdateOriginTransform)
            {
                local_22.LastOriginPosition = local_22.OriginPosition;
                local_22.LastOriginRotation = local_22.OriginRotation;
                FVector local_28;
                FQuat4f local_32;
                GetDefaulted local_36;
                this.GetCameraOrigin(local_22.OriginEntity, local_36.opCall().GetTargetEntity(), local_28, local_32);
                local_22.OriginPosition = local_28;
                local_22.OriginRotation = local_32;
                if (this.bEnableCollisionPreCheck && local_22.OriginEntity.IsValid())
                {
                    if (local_38)
                    {
                        local_38.ToFTransform();
                        FVector local_76;
                        local_22.CustomCollisionOrigin = local_76;
                        local_20.CustomCollisionOrigin = local_22.CustomCollisionOrigin;
                    }
                }
            }
            if (this.bUpdateBlendParam)
            {
                local_22.BlendParam = this.CalculateBlendParam(Context.GetEntity(), local_22.OriginPosition);
            }
        }
        FFPTime local_80 = FFPTime(Time.WorldTime);
        local_20.OriginPosition = local_22.OriginPosition;
        local_20.OriginRotation = local_22.OriginRotation;
        if (this.bLoop)
        {
            float32 local_77 = float32(Time.ActionTime.ToSeconds());
            float32 local_87 = local_2.Duration;
            float32 local_81 = local_87 * FMath::Abs((this.NormalizedEndTime - this.NormalizedStartTime));
            if (local_81 > 0.0f)
            {
                local_85 = FMath::Fmod(local_77, local_81) / local_81;
            }
            else
            {
                local_85 = 0.0f;
            }
            local_87 = FMath::Lerp(this.NormalizedStartTime, this.NormalizedEndTime, local_85);
        }
        else
        {
            if (FFPTime(Time.ActionDuration).opCmp(0.0) > 0)
            {
                local_86 = float32((FFPTime(Time.ActionTime) / Time.ActionDuration));
            }
            else
            {
                local_86 = 0.0f;
            }
            float32 local_88 = FMath::Lerp(this.NormalizedStartTime, this.NormalizedEndTime, local_86);
        }
        local_85 = local_22.BlendParam;
        local_20.FocusPointPositionOffset = local_22.FocusPositionOffset;
        int local_13 = int(local_20.BlendPhase);
        if (local_13 == -1 && !(local_22.bCollisionCheckComplete))
        {
            this.TickCollisionCheck(Context, Time, local_22, local_2, local_20);
            if (local_22.bCollisionBlocked)
            {
                return;
            }
        }
        local_85 = Time.PlaySpeed;
        if (local_85 > 0.0f && (int(local_20.BlendPhase) != 1))
        {
            local_85 = float32(((FFPTime(Time.ActionDuration) - Time.ActionTime).ToSeconds()));
            float32 local_81_2 = local_85;
            if (this.bFadeOutCheckByWorldTime && (Time.PlaySpeed < 100.0f))
            {
                local_81_2 = local_85 / Time.PlaySpeed;
            }
            if (this.bNormalFadeOutAfterExit)
            {
                local_97 = (local_81_2 == 0.0f);
            }
            else
            {
                local_97 = (local_81_2 <= local_2.FadeOutDuration);
            }
            if (local_97)
            {
                local_22.MuteViewControlCounterModified = false;
                Modify local_102;
                local_102.opCall().MuteViewControlCounter = (int(local_102.opCall().MuteViewControlCounter) - 1);
                local_20.BlendStartTime = local_80;
                local_20.BlendEndTime = (local_80 + FFPTime(local_2.FadeOutDuration));
            }
        }
        return;
    }
    UFUNCTION()
    void ViewExit_Implementation(const FESMViewContext &inout Context, const FESMActionTime &inout Time) const
    {
        int local_18 = 0;
        FC_AnimatedCamera local_80;
        const FESMCameraAnimInstanceData& local_2 = this.GetViewInstanceData(Context);
        if (!(local_2.bCameraActivated))
        {
            return;
        }
        if (local_2.bFallbackModifierStarted)
        {
            const FAnimCameraData& local_6 = FAnimCameraData::GetData(this.AnimKey);
            if (local_6.IsValid() && local_6.FallBackCameraModifier.IsValid())
            {
                FFPTime local_14 = FFPTime(-1);
                local_18.SourceIdentifier = this.GetDataPathName();
                local_18.ModifierConfig = TDataObjectPtr<FTPCameraModifierConfig>(local_6.FallBackCameraModifier);
            }
        }
        if (local_2.MuteViewControlCounterModified)
        {
            Modify local_72;
            local_72.opCall().MuteViewControlCounter = (int(local_72.opCall().MuteViewControlCounter) - 1);
        }
        const FAnimCameraData& local_6_2 = FAnimCameraData::GetData(this.AnimKey);
        if (!(local_6_2.IsValid()))
        {
            return;
        }
        if (!(local_80))
        {
            return;
        }
        FFPTime local_82 = FFPTime(Time.WorldTime);
        float32 local_83 = local_80.GetRawBlendWeight(local_82);
        FFPTime local_86 = 0.1;
        FFPTime local_92 = (local_82 + FFPTime(local_6_2.BreakFadeOutDuration));
        if (local_2.bCollisionBlocked)
        {
            local_80.ExpireTime = (local_92 + local_86);
            if (this.bHideDynamicIcons)
            {
                this.SetIndicatorIconsVisible(Context, true);
            }
            return;
        }
        if ((!(Time.IsEnd()) == !(false) && this.bUpdateOriginTransform))
        {
            local_80.OriginPosition = local_2.LastOriginPosition;
            local_80.OriginRotation = local_2.LastOriginRotation;
        }
        if (int(local_80.BlendPhase) != 1)
        {
            local_80.BlendStartTime = local_82;
            local_80.BlendEndTime = local_92;
            local_80.ExpireTime = (local_92 + local_86);
        }
        else
        {
            if (Time.IsEnd())
            {
                local_80.ExpireTime = (FFPTime(local_80.BlendEndTime) + local_86);
            }
            else
            {
                if (FFPTime(local_80.BlendEndTime).opCmp(local_92) > 0)
                {
                    float32 local_83_4 = local_80.GetRawBlendWeight(local_82);
                    local_80.BlendStartTime = local_82;
                    local_80.BlendEndTime = local_92;
                }
                local_80.ExpireTime = (FFPTime(local_80.BlendEndTime) + local_86);
            }
        }
        if (this.bHideDynamicIcons)
        {
            this.SetIndicatorIconsVisible(Context, true);
        }
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        if (!(FAnimCameraData::GetData(this.AnimKey).IsValid()))
        {
            Info.AddDataInvalidComment(EESMDataValidType(2), "Not Valid Animated Camera");
            return;
        }
        return;
    }
    const FESMCameraAnimInstanceData GetViewInstanceData(const FESMViewContext &inout Context) const
    {
        const FESMCameraAnimInstanceData __r;
        return __r;
    }
    FESMCameraAnimInstanceData ModifyViewInstanceData(const FESMViewContext &inout Context) const
    {
        FESMCameraAnimInstanceData __r;
        return __r;
    }
    FECSEntity ResolveOriginEntity(const FESMViewContext &inout Context) const
    {
        if (int(this.OriginTransformType) == 2)
        {
            GetDefaulted local_8;
            return local_8.opCall().GetParent();
        }
        if (int(this.OriginTransformType) == 3)
        {
            GetDefaulted local_12;
            return local_12.opCall().GetTargetEntity();
        }
        if (int(this.OriginTransformType) == 4)
        {
            GetDefaulted local_16;
            return local_16.opCall().GetTargetEntity();
        }
        if (int(this.OriginTransformType) == 6)
        {
            FNameHandle_EntityBBVarEntity local_20;
            local_20;
            return Context.GetEntity().GetBB_Entity(local_20);
        }
        if (int(this.OriginTransformType) == 7)
        {
            return Context.GetEntity().GetBB_Entity(this.CustomBBEntityBBVar);
        }
        return Context.GetEntity();
    }
    void ActivateCameraAnim(const FESMViewContext &inout Context, const FESMActionTime &inout Time, FESMCameraAnimInstanceData &inout InstanceData, const FAnimCameraData &inout Config) const
    {
        int local_6 = 0;
        int local_18 = 0;
        FC_AnimatedCamera local_74;
        int local_106 = 0;
        if (local_6 && local_6.GetbCollisionBlocked())
        {
            InstanceData.bCameraActivated = true;
            InstanceData.bCollisionBlocked = true;
            InstanceData.bCollisionCheckComplete = true;
            InstanceData.MuteViewControlCounterModified = false;
            if (Config.FallBackCameraModifier.IsValid())
            {
                FFPTime local_14 = FFPTime(-1);
                local_18.SourceIdentifier = this.GetDataPathName();
                local_18.ModifierConfig = TDataObjectPtr<FTPCameraModifierConfig>(Config.FallBackCameraModifier);
                InstanceData.bFallbackModifierStarted = true;
            }
            local_74.SetbCollisionBlocked(true);
            local_74.ExpireTime = -1.0;
            return;
        }
        InstanceData.bCameraActivated = true;
        InstanceData.MuteViewControlCounterModified = true;
        ModifyOrAdd local_80;
        local_80.opCall().MuteViewControlCounter = (int(local_80.opCall().MuteViewControlCounter) + 1);
        FFPTime local_84 = FFPTime(Time.WorldTime);
        local_74.BlendStartTime = local_84;
        local_74.BlendEndTime = (local_84 + FFPTime(Config.FadeInDuration));
        local_74.AnimData = this.AnimKey;
        local_74.ExpireTime = -1;
        local_74.SetbEnableCollisionCorrection(this.bEnableCollisionCorrection);
        local_74.SetbUseCustomCollisionOrigin(this.bEnableCollisionPreCheck);
        InstanceData.LastOriginPosition = InstanceData.OriginPosition;
        InstanceData.LastOriginRotation = InstanceData.OriginRotation;
        FVector local_94;
        FQuat4f local_100;
        GetDefaulted local_104;
        this.GetCameraOrigin(InstanceData.OriginEntity, local_104.opCall().GetTargetEntity(), local_94, local_100);
        InstanceData.OriginPosition = local_94;
        InstanceData.OriginRotation = local_100;
        if (this.bEnableCollisionPreCheck && InstanceData.OriginEntity.IsValid())
        {
            if (local_106)
            {
                local_106.ToFTransform();
                FVector local_144;
                InstanceData.CustomCollisionOrigin = local_144;
                local_74.CustomCollisionOrigin = InstanceData.CustomCollisionOrigin;
            }
        }
        InstanceData.BlendParam = this.CalculateBlendParam(Context.GetEntity(), InstanceData.OriginPosition);
        InstanceData.FocusPositionOffset = this.GetFocusTargetPositionOffset(Context.GetEntity(), InstanceData.OriginPosition, InstanceData.OriginRotation);
        if (this.bHideDynamicIcons)
        {
            this.SetIndicatorIconsVisible(Context, false);
        }
        this.InitConvexCollisionCheck(Context, Time, InstanceData, Config, local_74);
        return;
    }
    void GetCameraOrigin(const FECSEntity &inout Entity, const FECSEntity &inout LockTargetEntity, FVector &inout OutPosition, FQuat4f &inout OutRotation) const
    {
        int local_2 = 0;
        if (int(this.OriginTransformType) == 1)
        {
            OutPosition = FTransformUtils::GetOffsetRefLocation(Entity, local_2.ToFTransform(), this.OriginalPositionType);
            Get local_6;
            FVector local_54 = (FVector(local_6.opCall().GetPosition()) - local_2.GetPosition());
            FVector3f local_57 = FVector3f(local_54);
            OutRotation = FQuat4f::MakeFromXZ(local_57, FVector3f::UpVector);
            return;
        }
        if (int(this.OriginTransformType) == 5)
        {
            OutPosition = FVector::ZeroVector;
            OutRotation = FQuat4f::Identity;
            return;
        }
        if (local_2)
        {
            OutPosition = FTransformUtils::GetOffsetRefLocation(Entity, local_2.ToFTransform(), this.OriginalPositionType);
            OutRotation = FQuat4f(local_2.GetRotation());
        }
        return;
    }
    float32 CalculateBlendParam(const FECSEntity &inout Entity, const FVector &inout Position) const
    {
        int local_10 = 0;
        if (int(this.BlendParamType) == 1)
        {
            return float32(((FVector(local_10.GetPresentationLockTargetPosition()) - Position).Size()));
        }
        if (int(this.BlendParamType) == 2)
        {
            return FVector3f((FVector(local_10.GetPresentationLockTargetPosition()) - Position)).ToOrientationRotator().Pitch;
        }
        return 0.0f;
    }
    FVector3f GetFocusTargetPositionOffset(const FECSEntity &inout Entity, const FVector &inout OriginPosition, const FQuat4f &inout OriginRotation) const
    {
        int local_6 = 0;
        if (local_6 && local_6.GetbCachedValidLockTargetPosition())
        {
            FVector local_14 = local_6.GetPresentationLockTargetPosition();
            return FVector3f(FTransform(FQuat(OriginRotation), OriginPosition, FVector::OneVector).InverseTransformPosition(local_14));
        }
        else
        {
            return FVector3f::ZeroVector;
        }
    }
    void InitConvexCollisionCheck(const FESMViewContext &inout Context, const FESMActionTime &inout Time, FESMCameraAnimInstanceData &inout InstanceData, const FAnimCameraData &inout Config, FC_AnimatedCamera &inout AnimatedCamera) const
    {
        bool local_4;
        int local_15 = 0;
        float32 local_85;
        bool local_2 = (this.bEnableCollisionCorrection && this.bEnableCollisionPreCheck) || CVar_ForceConvexCollision.GetBool();
        local_4 = CVar_DrawConvex.GetBool();
        if ((!(InstanceData.ConvexCache.IsValid()) && (local_2 || local_4)))
        {
            float32 local_6 = this.NormalizedStartTime;
            float32 local_7 = Config.Duration;
            local_6 = local_6 * local_7;
            local_7 = this.NormalizedEndTime;
            local_7 = local_7 * Config.Duration;
            TArray<FAnimCameraCollisionSegment> local_12;
            int local_13 = 0;
            for (auto& local_30 : Config.SequenceDatas[local_13].CollisionSegments)
            {
                if ((local_30.TimeStart >= local_6 && ((local_30.TimeEnd <= local_7))))
                {
                    local_12.Add(local_30);
                }
            }
            while (local_13 < local_15)
            {
                ++local_13;
                local_15 = Config.SequenceDatas.Num();
            }
            if (local_12.Num() == 0)
            {
                InstanceData.bCollisionCheckComplete = true;
                return;
            }
            FTransform local_56 = FTransform(FQuat(InstanceData.OriginRotation), InstanceData.OriginPosition, FVector::OneVector);
            FVector local_80;
            if (this.bEnableCollisionPreCheck)
            {
                local_80 = InstanceData.CustomCollisionOrigin;
            }
            else
            {
                Get local_74;
                local_80 = local_74.opCall().GetPosition();
            }
            if (this.OverrideConvexScale > 0.0f)
            {
                local_85 = this.OverrideConvexScale;
            }
            else
            {
                local_85 = UAnimatedCameraSettings::GetSettings().ConvexScale;
            }
            InstanceData.ConvexCache = FAnimCameraCollisionUtils::BuildConvexHulls(local_12, local_56, local_80, local_85);
            if (!(InstanceData.ConvexCache.IsValid()))
            {
                InstanceData.bCollisionCheckComplete = true;
                return;
            }
            if (local_4)
            {
                float32 local_8 = float32(Time.ActionDuration.ToSeconds());
                UWorld local_96 = ECS::GetUEWorld();
                FAnimCameraCollisionUtils::DrawCollisionConvex(local_96, local_12, local_56, local_80, FColor::Green, local_8, 2.0f, local_85);
            }
            if (!(local_2))
            {
                InstanceData.bCollisionCheckComplete = true;
                InstanceData.ConvexCache.Reset();
                return;
            }
        }
        return;
    }
    void TickCollisionCheck(const FESMViewContext &inout Context, const FESMActionTime &inout Time, FESMCameraAnimInstanceData &inout InstanceData, const FAnimCameraData &inout Config, FC_AnimatedCamera &inout AnimatedCamera) const
    {
        int local_36 = 0;
        bool local_3 = !(CVar_ForceConvexCollision.GetBool()) && !(this.bEnableCollisionCorrection && this.bEnableCollisionPreCheck);
        if (local_3)
        {
            return;
        }
        int local_5 = InstanceData.ConvexCache.GetConvexCount();
        if (int(InstanceData.ConvexTestIndex) >= local_5)
        {
            InstanceData.bCollisionCheckComplete = true;
            InstanceData.ConvexCache.Reset();
            return;
        }
        UWorld local_8 = ECS::GetUEWorld();
        int local_12 = 0;
        while (local_3)
        {
            local_3 = FAnimCameraCollisionUtils::TestConvexCollision(local_8, InstanceData.ConvexCache, int(InstanceData.ConvexTestIndex));
            int local_13 = InstanceData.ConvexTestIndex + 1;
            InstanceData.ConvexTestIndex = local_13;
            if (local_3)
            {
                AnimatedCamera.SetbCollisionBlocked(true);
                InstanceData.bCollisionBlocked = true;
                InstanceData.bCollisionCheckComplete = true;
                FFPTime local_18 = FFPTime(Time.WorldTime);
                float32 local_20 = AnimatedCamera.GetRawBlendWeight(local_18);
                AnimatedCamera.BlendStartTime = local_18;
                AnimatedCamera.BlendEndTime = (local_18 + FFPTime(Config.BreakFadeOutDuration));
                if (InstanceData.MuteViewControlCounterModified)
                {
                    InstanceData.MuteViewControlCounterModified = false;
                    Modify local_30;
                    local_13 = int(local_30.opCall().MuteViewControlCounter);
                    local_13 = local_13 - 1;
                    local_30.opCall().MuteViewControlCounter = local_13;
                }
                if (Config.FallBackCameraModifier.IsValid())
                {
                    FFPTime local_22 = FFPTime(-1);
                    local_36.SourceIdentifier = this.GetDataPathName();
                    local_36.ModifierConfig = TDataObjectPtr<FTPCameraModifierConfig>(Config.FallBackCameraModifier);
                    InstanceData.bFallbackModifierStarted = true;
                }
                if (CVar_DrawHitConvex.GetBool())
                {
                    FAnimCameraCollisionUtils::DrawConvexCache(InstanceData.ConvexCache, FColor::Red, 5.0f, 2.0f);
                }
                InstanceData.ConvexCache.Reset();
                return;
            }
            ++local_12;
            if (local_12 >= 2)
            {
                local_3 = false;
                continue;
            }
            local_3 = (int(InstanceData.ConvexTestIndex) < local_5);
        }
        if (int(InstanceData.ConvexTestIndex) >= local_5)
        {
            InstanceData.bCollisionCheckComplete = true;
            InstanceData.ConvexCache.Reset();
        }
        return;
    }
    void DrawRemainingCollisionBounds(const FAnimCameraData &inout Config, const float32 CurrentNormalizedTime, const FVector &inout OriginPosition, const FQuat4f &inout OriginRotation) const
    {
        int local_59 = 0;
        if (!(CVar_DrawConvex.GetBool()))
        {
            return;
        }
        FTransform local_28 = FTransform(FQuat(OriginRotation), OriginPosition, FVector::OneVector);
        FVector local_48 = local_28.GetTranslation();
        float32 local_49 = UAnimatedCameraSettings::GetSettings().ConvexScale;
        TArray<FAnimCameraCollisionSegment> local_56;
        int local_57 = 0;
        for (auto local_74 : Config.SequenceDatas[local_57].CollisionSegments)
        {
            if (local_74.TimeEnd > (CurrentNormalizedTime * Config.Duration))
            {
                local_56.Add(local_74);
            }
        }
        while (local_57 < local_59)
        {
            ++local_57;
            local_59 = Config.SequenceDatas.Num();
        }
        if (local_56.Num() == 0)
        {
            return;
        }
        ECS::GetUEWorld();
        for (auto local_74 : local_56)
        {
            FVector local_42 = local_28.TransformPosition(local_74.Position);
            if (int(local_74.Shape) == 0)
            {
                FECSDebugDraw::DrawDebugSphere(NAME_None, local_42, local_74.Radius, 8, FColor::Blue, FColor::Blue, 0.1f, uint8(1), 0.0f);
                continue;
            }
            FQuat local_116 = (local_28.GetRotation() * local_74.Orientation);
            float32 local_99 = local_74.HalfHeight + local_74.Radius;
            FECSDebugDraw::DrawDebugCapsule(NAME_None, local_42, local_99, local_74.Radius, local_116, FColor::Blue, FColor::Blue, 0.1f, uint8(1), 0.0f);
        }
        return;
    }
    void SetIndicatorIconsVisible(const FESMViewContext &inout Context, const bool bVisible) const
    {
        if (!(Context.GetECSRuntime().IsPreview))
        {
            AAS_ECSPlayerController local_6 = ::FASCommonUtils::GetASECSProxyPlayerController();
            if (local_6 != nullptr)
            {
                local_6.SetIndicatorIconsVisible.Execute(bVisible);
            }
        }
        return;
    }
}

