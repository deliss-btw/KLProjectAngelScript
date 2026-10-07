

class AGoldBirdPlay : AKLLevelScriptAreaTargetEvent
{
    UPROPERTY()
    TArray<AActor> PutDownPoints;
    UPROPERTY()
    float32 CalculateDistance;
    UPROPERTY()
    TSubclassOf<AFXActor> ActiveEffect_Statue;
    UPROPERTY()
    TSubclassOf<AFXActor> ActiveEffect_Desk;
    UPROPERTY()
    TSubclassOf<AFXActor> DeskInfo_Right;
    UPROPERTY()
    TSubclassOf<AFXActor> DeskInfo_Wrong;
    UPROPERTY()
    TSoftObjectPtr<AECSPrefab> Desk;
    FECSEntity CurActiveStatue;
    TArray<FECSEntity> AllPickedStatueList;
    FECSEntity FXEntity_Statue;
    FECSEntity FXEntity_Desk;
    FECSEntity FXEntity_Link;
    FECSEntity FXEntity_DeskInfo;
    FLevelTimerCallback DistanceCheckTimer;
    UPROPERTY()
    TSubclassOf<AFXActor> LinkEffect;
    UPROPERTY()
    TSubclassOf<AFXActor> GoodInfoEffect;
    UPROPERTY()
    TSubclassOf<AFXActor> BadInfoEffect;
    UPROPERTY()
    TMap<int, ACombatPropPrefab> RightStatueInfoMap;
    UPROPERTY()
    FString HintText;
    UPROPERTY()
    FString HintText_NeedActiveStatue;
    int NearestIndex;
    bool recordRightInfo = false;
    bool bSuccess = false;


    UFUNCTION()
    void PreLevelBeginPlay_Implementation()
    {
        Super::PreLevelBeginPlay_Implementation();
        this.RegisterLevelEventCallback(n"OnLevelStatueEvent", FCE_CustomLevelEvent, ENTITY_NULL);
        this.DistanceCheckTimer.BindUFunction(this, n"UpdateCheck");
        UECSLevelTimerFunctions::ECSLevelSetTimer(this, this.DistanceCheckTimer, 0.2f, true, -1.0f);
        return;
    }
    UFUNCTION()
    void OnGameplaySuccess_Implementation()
    {
        return;
    }
    UFUNCTION()
    void OnLevelStatueEvent(const FCE_CustomLevelEvent &inout Event)
    {
        FNameHandle_EntityBBVarInt local_34;
        if ((Event.CustomName == n"GoldBird_StartCarry"))
        {
            this.AllPickedStatueList.Add(Event.Sender);
            this.RefreshStatueState();
        }
        else
        {
            if ((Event.CustomName == n"GoldBird_EndCarry"))
            {
                if (((this.CurActiveStatue == Event.Sender) && (this.NearestIndex >= 0)))
                {
                    FVector local_16 = this.PutDownPoints[this.NearestIndex].GetActorLocation();
                    ::BlueprintFunctions_Common::SimpleLinearMoveTo(FECSEntityAdapter(this.CurActiveStatue), local_16, 300.0f, true, FRotator::ZeroRotator, false);
                    if (this.CheckRightStatue())
                    {
                        local_34;
                        this.CurActiveStatue.SetBB_Int(local_34, n"iState");
                    }
                    else
                    {
                        local_34;
                        this.CurActiveStatue.SetBB_Int(local_34, n"iState");
                    }
                }
                this.RefreshStatueState();
            }
        }
        int local_35 = 0;
        if ((Event.CustomName == n"GoldBird_InfoCarrierGood"))
        {
            local_35 = 1;
        }
        else
        {
            if ((Event.CustomName == n"GoldBird_InfoCarrierBad"))
            {
                local_35 = 2;
            }
        }
        if (local_35 > 0)
        {
            if (this.NearestIndex >= 0)
            {
                FFXConfig local_152;
                local_152.SetbDetach(true);
                if (local_35 == 1)
                {
                    local_152.SetAsset(System::GetSoftClassPath(this.GoodInfoEffect));
                }
                else
                {
                    if (local_35 == 2)
                    {
                        local_152.SetAsset(System::GetSoftClassPath(this.BadInfoEffect));
                    }
                }
                local_152.SetLocationOffset(this.PutDownPoints[this.NearestIndex].GetActorLocation());
                local_152.SetbUseWorldOriginAsBaseTransformSource(true);
                local_152.SetLocationOffsetSpace(EFXOffsetSpace(2));
                local_152.SetRotationOffsetSpace(EFXOffsetSpace(2));
                local_152.SetScale(FVector(0.3, 0.3, 0.3));
                ECS::GetContextTime();
                return;
            }
            XLog(ELog(0), "no nearest index");
            ::MessageHintUtils::ServerDebugShowHintText(this.HintText_NeedActiveStatue, 0.5f, Event.Sender);
        }
        return;
    }
    void RefreshStatueState()
    {
        if (this.AllPickedStatueList.Num() == 0)
        {
            this.CurActiveStatue = ENTITY_NULL;
            ECSFX::StopFX(this.FXEntity_Statue, true, false, 0.0f);
            ECSFX::StopFX(this.FXEntity_Desk, true, false, 0.0f);
            return;
        }
        FECSEntity local_10 = this.AllPickedStatueList[0];
        if ((!((this.CurActiveStatue == local_10))))
        {
            this.CurActiveStatue = this.AllPickedStatueList[0];
            ECSFX::StopFX(this.FXEntity_Statue, true, false, 0.0f);
            ECSFX::StopFX(this.FXEntity_Desk, true, false, 0.0f);
            FECSEntity local_14 = this.CurActiveStatue;
            if ((!((local_14 == ENTITY_NULL))))
            {
                FFXConfig local_130;
                local_130.SetAsset(System::GetSoftClassPath(this.ActiveEffect_Statue));
                local_130.SetbDetach(false);
                ECS::GetContextTime();
                this.FXEntity_Statue = local_14;
                local_130.SetAsset(System::GetSoftClassPath(this.ActiveEffect_Desk));
                ECS::GetContextTime();
                AECSPrefab local_144;
                FECSEntity local_14_2 = ECS::GetPrefabEntity(local_144);
                FECSEntity local_148;
                this.FXEntity_Desk = local_148;
            }
        }
        return;
    }
    UFUNCTION()
    void UpdateCheck()
    {
        if (this.bSuccess)
        {
            return;
        }
        if (this.CheckSuccess())
        {
            this.bSuccess = true;
            this.OnSuccess();
            return;
        }
        this.CheckStatueLink();
        this.CheckRightStatue();
        return;
    }
    void CheckStatueLink()
    {
        if (!(this.CurActiveStatue.IsValid()) || !(this.CurActiveStatue.IsActive()))
        {
            this.NearestIndex = -1;
            this.RemoveLinkEffect();
            return;
        }
        Get local_14;
        FVector local_10 = local_14.opCall().GetPosition();
        float32 local_15 = 100000000.0f;
        FVector local_22(FVector::ZeroVector);
        int local_23 = -1;
        int local_24 = 0;
        for (; local_24 < this.PutDownPoints.Num(); ++local_24)
        {
            FVector local_38 = this.PutDownPoints[local_24].GetActorLocation();
            float32 local_16 = float32(((local_10 - local_38).Size()));
            if (local_16 < local_15)
            {
                local_15 = local_16;
                local_22 = local_38;
                local_23 = local_24;
            }
        }
        if (local_15 <= this.CalculateDistance)
        {
            if (this.NearestIndex != local_23)
            {
                this.NearestIndex = local_23;
                this.RemoveLinkEffect();
                this.CreateLinkEffect(local_22, local_23);
            }
            return;
        }
        this.NearestIndex = -1;
        this.RemoveLinkEffect();
        return;
    }
    bool CheckSuccess()
    {
        FNameHandle_EntityBBVarInt local_32;
        for (auto& local_20 : this.RightStatueInfoMap)
        {
            local_20;
            local_32;
            if (ECS::GetPrefabEntity().GetBB_Int(local_32) != 201)
            {
                return false;
            }
        }
        return true;
    }
    void OnSuccess()
    {
        this.OnGameplaySuccess();
        AECSPrefab local_2;
        local_2.GetActorLocation();
        this.RemoveLinkEffect();
        ECSFX::StopFX(this.FXEntity_Desk, true, false, 0.0f);
        ECSFX::StopFX(this.FXEntity_Statue, true, false, 0.0f);
        ECSFX::StopFX(this.FXEntity_DeskInfo, true, false, 0.0f);
        return;
    }
    bool CheckRightStatue()
    {
        ACombatPropPrefab local_8;
        AECSPrefab local_140;
        FECSEntity local_154;
        if (this.NearestIndex < 0)
        {
            if (this.FXEntity_DeskInfo.IsValid())
            {
                ECSFX::StopFX(this.FXEntity_DeskInfo, true, false, 0.0f);
            }
            this.recordRightInfo = false;
            return false;
        }
        bool local_6 = false;
        if (this.NearestIndex >= 0)
        {
            if (this.RightStatueInfoMap.Contains(this.NearestIndex))
            {
                local_8 = this.RightStatueInfoMap[this.NearestIndex];
                if ((ECS::GetPrefabEntity(local_8) == this.CurActiveStatue))
                {
                    local_6 = true;
                }
            }
        }
        if ((!(this.recordRightInfo) != !(local_6) || !(this.FXEntity_DeskInfo.IsValid())))
        {
            ECSFX::StopFX(this.FXEntity_DeskInfo, true, false, 0.0f);
            this.recordRightInfo = local_6;
            if (local_6)
            {
                FFXConfig local_128;
                local_128.SetAsset(System::GetSoftClassPath(this.DeskInfo_Right));
                local_128.SetbDetach(true);
                local_128.SetLocationOffset(local_140.GetActorLocation());
                local_128.SetbUseWorldOriginAsBaseTransformSource(true);
                local_128.SetLocationOffsetSpace(EFXOffsetSpace(2));
                local_128.SetRotationOffsetSpace(EFXOffsetSpace(2));
                ECS::GetContextTime();
                ECS::GetPrefabEntity(local_140);
                this.FXEntity_DeskInfo = local_154;
            }
            else
            {
                FFXConfig local_128;
                local_128.SetAsset(System::GetSoftClassPath(this.DeskInfo_Wrong));
                local_128.SetbDetach(true);
                local_128.SetLocationOffset(local_140.GetActorLocation());
                local_128.SetbUseWorldOriginAsBaseTransformSource(true);
                local_128.SetLocationOffsetSpace(EFXOffsetSpace(2));
                local_128.SetRotationOffsetSpace(EFXOffsetSpace(2));
                ECS::GetContextTime();
                ECS::GetPrefabEntity(local_140);
                this.FXEntity_DeskInfo = local_154;
            }
        }
        return local_6;
    }
    void CreateLinkEffect(const FVector &inout TargetPoint, const int PointIndex)
    {
        if (!(this.CurActiveStatue.IsValid()) || !(this.LinkEffect.IsValid()))
        {
            return;
        }
        FFXConfig local_118;
        local_118.SetAsset(System::GetSoftClassPath(this.LinkEffect));
        local_118.SetbDetach(true);
        local_118.SetLocationOffset(this.PutDownPoints[PointIndex].GetActorLocation());
        local_118.SetbUseWorldOriginAsBaseTransformSource(true);
        local_118.SetLocationOffsetSpace(EFXOffsetSpace(2));
        local_118.SetRotationOffsetSpace(EFXOffsetSpace(2));
        local_118.SetScale(FVector(0.3, 0.3, 0.3));
        ECS::GetContextTime();
        FECSEntity local_150;
        this.FXEntity_Link = local_150;
        return;
    }
    void RemoveLinkEffect()
    {
        ECSFX::StopFX(this.FXEntity_Link, true, false, 0.0f);
        return;
    }
    void OnGameplaySuccess()
    {
        __Evt_Execute(this, n"OnGameplaySuccess");
        return;
    }
}

