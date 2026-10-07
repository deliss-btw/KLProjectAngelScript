

class US_GameTestCase : UECSScriptSystem
{
    int GTCForceFixedOffsetFrame = 0;


    UFUNCTION()
    void ServerJob_GameTestBegin(const FECSEntity &inout Entity, FC_GameTest &inout GameTest, const FCS_FixedTime &inout FixedTime) const
    {
        int local_18 = 0;
        Remove local_4;
        local_4.opCall();
        if (GameTest.TestCaseList.Num() == 0)
        {
            return;
        }
        if (GameTest.StartDelay > 0.0f)
        {
            local_18.StartAtTime = (FFPTime(FixedTime.Time) + FFPTime(GameTest.StartDelay));
            return;
        }
        FC_GameTestInitPrefabTag local_32;
        Assign local_30;
        local_30.opCall(local_32);
        return;
    }
    UFUNCTION()
    void ServerJob_HandleGameTestRequestStart(const FCE_GameTestRequestStart &inout Event) const
    {
        ECS::RequestEntityByPrefabDeferred(AGTCEmptyPrefab, FVector(), FRotator(), EPrefabCollisionAlignment(2), EECSRegType(0), false);
        FC_GameTestInitPrefabTag local_30;
        Assign local_28;
        local_28.opCall(local_30);
        FC_GameTest local_52;
        local_52.GameTestId = int(Event.GameTestId);
        local_52.OutputFolder = Event.OutputFolder;
        local_52.TestCaseList.Empty(0);
        for (auto& local_68 : Event.TestCaseList)
        {
            local_52.TestCaseList.Add(local_68);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleGameTestRequestStop(const FCE_GameTestRequestStop &inout Event) const
    {
        ::BlueprintFunctions_Ecology::SetPauseGlobalAI(FGameplayTag::RequestGameplayTag(n"AI.ControlledByLevel", true), false);
        UKLGTCTestCaseLoader::SetGTCPlaybackCameraSuppress(false);
        UKLGTCTestCaseLoader::SetGTCPlaybackState(false);
        FECSEntity local_10 = FECSEntity(int(Event.GameTestEntityId));
        if (!(local_10.IsValid()))
        {
            return;
        }
        Modify local_20;
        FC_GameTest& local_22 = local_20.opCall();
        if (local_22)
        {
            for (auto local_35 : local_22.RuntimeEntityIds)
            {
                FECSEntity local_16 = FECSEntity(local_35);
                if (!(local_16.IsValid()))
                {
                    continue;
                }
                this.RestoreSuppressedBT(local_16);
                Has local_44;
                bool local_5 = local_44.opCall();
                if (local_5)
                {
                    int local_50;
                    for (auto& local_70 : local_50.GetEntityMap())
                    {
                        local_70;
                        FECSEntity local_40;
                        if (!(local_40.IsValid()))
                        {
                            continue;
                        }
                        Remove local_78;
                        local_78.opCall();
                        Remove local_82;
                        local_82.opCall();
                        Remove local_86;
                        local_86.opCall();
                    }
                    for (auto& local_100 : local_50.GetSpawnedEntityIds())
                    {
                        FECSEntity local_74 = FECSEntity(local_100);
                        if (local_74.IsValid())
                        {
                            ::FGTCUtils::RemoveEntity(local_74);
                        }
                    }
                }
                Remove local_104;
                local_104.opCall();
                Remove local_108;
                local_108.opCall();
                ::FGTCUtils::RemoveEntity(local_16);
            }
            local_22.RuntimeEntityIds.Empty(0);
        }
        ::FGTCUtils::RemoveEntity(local_10);
        return;
    }
    UFUNCTION()
    void ServerJob_WatchIssuerConnection(const FECSEntity &inout Entity, FC_GameTest &inout GameTest) const
    {
        if (int(GameTest.IssuerControllerEntityId) == 0)
        {
            return;
        }
        Get local_24;
        Has local_18;
        bool local_3 = !(FECSEntity(int(GameTest.IssuerControllerEntityId)).IsValid()) || !(local_18.opCall()) || (local_24.opCall().GetUEPlayerController() == nullptr);
        bool local_27 = false;
        if (!(local_3))
        {
            int64 local_30 = 4612811918334230528;
            TWeakObjectPtr<AECSPlayerController> local_26 = local_24.opCall().GetUEPlayerController();
            AECSPlayerController local_36;
            float local_32 = UKLGTCTestCaseLoader::GetPlayerConnectionIdleSeconds(local_36);
            local_27 = local_32 >= 0.0 && (local_32 > 2.5);
        }
        if (!(local_3) && !(local_27))
        {
            return;
        }
        if (local_3)
        {
            XLog(ELog(40), "[GTC] Issuer client disconnected (controller gone), stopping GameTest on DS");
        }
        else
        {
            XLog(ELog(40), "[GTC] Issuer client connection stale (likely crash), stopping GameTest on DS");
        }
        GameTest.IssuerControllerEntityId = 0;
        FFPTime local_44 = FFPTime(-1);
        FCE_GameTestRequestStop local_48;
        local_48.GameTestEntityId = Entity.GetId();
        return;
    }
    UFUNCTION()
    void ServerJob_GameTestBeginByTimer(const FECSEntity &inout Entity, FC_GameTestStartTimer &inout Timer, const FCS_FixedTime &inout FixedTime) const
    {
        FFPTime local_2 = FFPTime(FixedTime.Time);
        int local_3 = local_2.opCmp(Timer.StartAtTime);
        FFPTime local_2_2 = FFPTime(FixedTime.Time);
        if (local_2_2.opCmp(Timer.StartAtTime) >= 0)
        {
            FC_GameTestInitPrefabTag local_10;
            Assign local_8;
            local_8.opCall(local_10);
            Remove local_14;
            local_14.opCall();
        }
        return;
    }
    UFUNCTION()
    void ServerJob_HandleGameTestInitPrefab(const FECSEntity &inout Entity, FC_GameTest &inout GameTest) const
    {
        int local_166 = 0;
        Remove local_4;
        local_4.opCall();
        ::BlueprintFunctions_Ecology::SetPauseGlobalAI(FGameplayTag::RequestGameplayTag(n"AI.ControlledByLevel", true), true);
        GameTest.RuntimeEntityIds.Empty(0);
        for (auto& local_24 : GameTest.TestCaseList)
        {
            if (local_24.bDisabled)
            {
                continue;
            }
            FECSEntity local_42 = ECS::RequestEntityByPrefabDeferred(AGTCEmptyPrefab, FVector(), FRotator(), EPrefabCollisionAlignment(2), EECSRegType(0), false);
            FC_TestCaseInitPrefabTag local_52;
            Assign local_50;
            local_50.opCall(local_52);
            local_166.SetOutputFolder(GameTest.OutputFolder);
            local_166.SetLoopRounds(int(local_24.LoopRounds));
            local_166.SetGameTestId(int(GameTest.GameTestId));
            local_166.SetGameTestEntityId(Entity.GetId());
            local_166.SetGTCJsonAssetPath(local_24.GTCJsonAssetPath);
            local_166.SetbEnableLatency(local_24.bEnableLatency);
            local_166.SetBaseLatency(local_24.BaseLatency);
            local_166.SetbResetCaseEnvironment(local_24.bResetCaseEnvironment);
            local_166.SetFilterRemoveEntityNames(local_24.FilterRemoveEntityNames);
            local_166.SetbFilterClearCheckpoints(local_24.bFilterClearCheckpoints);
            local_166.SetbFilterClearSamplers(local_24.bFilterClearSamplers);
            local_166.SetNoReuseEntityNames(local_24.NoReuseEntityNames);
            TMap<FName, FECSEntityId> local_188;
            for (auto& local_206 : local_24.ManualPrefabs)
            {
                AECSPrefab local_208;
                FECSEntity local_46 = ECS::GetPrefabEntity(local_208);
                if (local_46.IsValid())
                {
                    local_188.Add(local_206.GetKey(), local_46.GetId());
                }
            }
            local_166.SetManualEntityMap(local_188);
            GameTest.RuntimeEntityIds.Add(local_42.GetId());
        }
        return;
    }
    UFUNCTION()
    void ServerJob_TestCaseIInitPrefab(const FECSEntity &inout Entity, FC_TestCase &inout TestCase, const FCS_FixedTime &inout FixedTime) const
    {
        int local_186 = 0;
        int local_276 = 0;
        int local_302;
        FECSEntity local_306;
        Include local_348;
        bool local_350 = false;
        int local_426 = 0;
        FECSEntity local_430;
        bool local_431;
        UClass local_442;
        int local_636 = 0;
        Remove local_4;
        local_4.opCall();
        UKLGTCTestCaseLoader::SetGTCPlaybackState(true);
        FECSWorldPtr local_8 = this.GetECSWorld();
        GetDefaulted local_12;
        TestCase.SetIssuerPawnEntityId(local_12.opCall().IssuerPawnEntityId);
        FGTCSourceData local_78;
        TestCase.LoadGTCSourceData(local_78);
        TestCase.ApplyPlaybackFilter(local_78);
        TestCase.SetCaseDuration(local_78.CaseDuration);
        float32 local_81 = FBlueprintDebugFunctions::ExchangeMaxScriptExecutionTime(60.0f);
        FC_TestCaseRoundCache local_172;
        local_172.EntityConfigs = local_78.EntityConfigs;
        local_172.ActionConfigs = local_78.ActionConfigs;
        local_172.ServerFixedInputConfigs = local_78.ServerFixedInputConfigs;
        local_172.ClientFixedInputConfigs = local_78.ClientFixedInputConfigs;
        local_172.InitConfigs = local_78.InitConfigs;
        local_172.CameraViewConfigs = local_78.CameraViewConfigs;
        local_172.CheckpointFrames = local_78.CheckpointFrames;
        local_172.AutoCheckpointFrames = local_78.AutoCheckpointFrames;
        local_172.DetailedDataLists = local_78.DetailedDataLists;
        local_172.DetailedDataCurrentIndex = 0;
        local_172.GlobalRandomSeed = int(local_78.GlobalRandomSeed);
        local_172.RecordWorldTimeTicks = local_78.RecordWorldTimeTicks;
        local_186.SamplerConfigs = local_78.SamplerConfigs;
        FBlueprintDebugFunctions::ExchangeMaxScriptExecutionTime(local_81);
        if (local_186.SamplerConfigs.Num() == 0)
        {
            int local_188 = 0;
            for (; local_188 < local_78.ActionConfigs.Num(); ++local_188)
            {
                if (!((FInstancedStruct::GetPtr(local_78.ActionConfigs[local_188]).opCall() == nullptr)))
                {
                    local_186.SamplerConfigs.Add(local_78.ActionConfigs[local_188]);
                }
            }
        }
        bool local_195 = false;
        TMap<FName, FECSEntityId> local_216;
        TSet<FECSEntityId> local_236;
        TArray<FECSEntityId> local_240;
        for (auto& local_254 : local_78.EntityConfigs)
        {
            if (local_254.bGameSpawnedLazyBind)
            {
                continue;
            }
            if (local_216.Contains(local_254.UniqueName))
            {
                XError(ELog(40), FString().Append("еЏ‘зЋ°й‡Ќе¤Ќзљ„EntityUniqueName: ").Append(local_254.UniqueName));
                continue;
            }
            FECSEntity local_264;
            FECSEntityId local_265;
            if (TestCase.GetManualEntityMap().Find(local_254.UniqueName, local_265))
            {
                local_264 = FECSEntity(local_265);
                FTransform local_300;
                local_300.SetLocation(local_276.GetPosition());
                local_300.SetRotation(local_276.GetRotation());
                local_172.ManualPrefabsResetTransform.Add(local_264.GetId(), local_300);
            }
            else
            {
                if (local_254.bUsePlayerPawn)
                {
                    bool local_349;
                    FECSWorldPtr local_8_2 = this.GetECSWorld();
                    int local_13_2 = local_12.opCall().IssuerPawnEntityId;
                    local_302 = local_13_2;
                    FECSEntity local_270 = FECSEntity(local_302);
                    FECSRuntimeView local_344 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
                    local_348.opCall();
                    int local_188_2 = 0;
                    local_349 = false;
                    local_350 = false;
                    FECSRuntimeViewIterator local_384 = local_344.Iterator();
                    for (; local_384.CanProceed;)
                    {
                        const FECSEntity& local_420 = local_384.Proceed();
                        local_306 = FECSEntity(local_426.GetPlayerPawnEntity());
                        if (local_270.IsValid() && local_306.IsValid() && (local_306.GetId() == local_270.GetId()))
                        {
                            local_264 = local_306;
                            local_349 = true;
                            local_350 = true;
                        }
                        else
                        {
                            if (!(local_349))
                            {
                                local_264 = local_426.GetPlayerPawnEntity();
                                local_349 = true;
                            }
                        }
                        ++local_188_2;
                    }
                }
                else
                {
                    if (local_254.bSpawnAsControlledPlayer)
                    {
                        FECSWorldPtr local_8_3 = this.GetECSWorld();
                        int local_13_3 = local_12.opCall().IssuerPawnEntityId;
                        local_302 = local_13_3;
                        local_430 = FECSEntity(local_302);
                        if (!(local_430.IsValid()))
                        {
                            local_431 = false;
                        }
                        else
                        {
                            Has local_436;
                            local_431 = local_436.opCall();
                        }
                        if (local_431)
                        {
                            Get local_440;
                            local_306 = FECSEntity(local_440.opCall().GetPlayerEntity());
                        }
                        if (!(local_306.IsValid()))
                        {
                            FECSRuntimeView local_324 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
                            local_348.opCall();
                            FECSRuntimeViewIterator local_418 = local_324.Iterator();
                            for (; local_418.CanProceed;)
                            {
                                const FECSEntity& local_420_2 = local_418.Proceed();
                                local_306 = FECSEntity(local_420_2.GetId());
                                break;
                            }
                        }
                        local_442 = Cast<UClass>(local_254.PrefabToSpawn.ToSoftObjectPath().TryLoad());
                        if (local_306.IsValid() && (local_442 != nullptr))
                        {
                            FECSSpawnCharacterParam local_462;
                            local_462.PlayerEntity = local_306.GetId();
                            local_462.CharacterPrototype = (TSubclassOf<AECSPrefab>(local_442));
                            local_462.Name = local_254.UniqueName;
                            local_462.bActive = true;
                            local_264 = US_ECSScriptGameModeSystemBase::SpawnCharacter(local_306.GetWorld(), local_462, local_254.InitTransform.GetLocation(), local_254.InitTransform.GetRotation());
                            Has local_482;
                            if (local_264.IsValid() && !(local_482.opCall()))
                            {
                                Assign local_486;
                                FC_Input local_598;
                                local_486.opCall(local_598);
                            }
                            local_240.Add(local_264.GetId());
                            XLog(ELog(40), FString().Append("[GTC] Spawned controlled-player puppet ").Append(local_254.UniqueName).Append(", controller=").Append(local_306.GetId()));
                        }
                        else
                        {
                            local_431 = (local_442 != nullptr);
                            XLog(ELog(40), FString().Append("[GTC] bSpawnAsControlledPlayer FAILED for ").Append(local_254.UniqueName).Append(": controllerValid=").Append(local_306.IsValid()).Append(", prefabLoaded=").Append(local_431));
                        }
                    }
                    else
                    {
                        if (!(TestCase.GetNoReuseEntityNames().Contains(local_254.UniqueName)))
                        {
                            local_430 = this.FindReusableLevelEntity(local_254, local_236);
                        }
                        if (local_430.IsValid())
                        {
                            local_236.Add(local_430.GetId());
                        }
                        else
                        {
                            FECSEntityId local_454 = Cast<UClass>(local_254.PrefabToSpawn.ToSoftObjectPath().TryLoad());
                            local_264 = ECS::RequestEntityByPrefabDeferred(TSubclassOf<AECSPrefab>(local_454), local_254.InitTransform.GetLocation(), local_254.InitTransform.GetRotation().Rotator(), EPrefabCollisionAlignment(2), EECSRegType(0), false);
                            local_240.Add(local_264.GetId());
                        }
                    }
                }
            }
            local_431 = !(local_216.Contains(local_254.UniqueName));
            local_216.Add(local_254.UniqueName, local_264.GetId());
            if (local_254.bTakeSampleOnClient)
            {
                local_195 = true;
            }
        }
        TestCase.SetEntityMap(local_216);
        TestCase.SetSpawnedEntityIds(local_240);
        TArray<FECSEntityId> local_610;
        for (auto& local_628 : local_236)
        {
            local_610.Add(local_628);
        }
        TestCase.SetReusedEntityIds(local_610);
        local_636.StartAtTime = (FFPTime(FixedTime.Time) + FFPTime(TestCase.GetStartDelay()));
        FC_TestCaseResetTimer local_652;
        Assign local_648;
        FC_TestCaseResetTimer& local_654 = local_648.opCall(local_652);
        if (local_654)
        {
            local_654.SetResetAtTime((((FFPTime(FixedTime.Time) + FFPTime(TestCase.GetStartDelay())) + FFPTime(TestCase.GetRunDelay())) + FFPTime(local_78.CaseDuration)));
        }
        if (local_195)
        {
            FC_TestCaseClientRunActionTag local_660;
            Assign local_658;
            local_658.opCall(local_660);
            FC_NetRelevancePolicy local_665;
            Assign local_664;
            local_664.opCall(local_665).RelevancePolicyType = false;
        }
        return;
    }
    UFUNCTION()
    void ServerJob_TestCaseResetByTimer(const FECSEntity &inout Entity, const FC_TestCase &inout TestCase, FC_TestCaseRoundCache &inout RoundCache, FC_TestCaseResetTimer &inout Timer, const FCS_FixedTime &inout FixedTime) const
    {
        int local_3 = FFPTime(FixedTime.Time).opCmp(Timer.GetResetAtTime());
        if (FFPTime(FixedTime.Time).opCmp(Timer.GetResetAtTime()) < 0)
        {
            return;
        }
        this.FinishRound(Entity, TestCase, RoundCache);
        for (auto& local_18 : RoundCache.EntityConfigs)
        {
            FECSEntityId local_19;
            if (!(TestCase.TryFindEntityId(local_18.UniqueName, local_19)))
            {
                continue;
            }
            FECSEntity local_24 = FECSEntity(local_19);
            local_24.IsValid();
            Remove local_34;
            local_34.opCall();
            if (local_18.bUsePlayerPawn)
            {
                continue;
            }
            if (TestCase.GetCurrntRound() >= TestCase.GetLoopRounds() && TestCase.IsSpawnedByGTC(local_24.GetId()))
            {
                FC_GTCPendingDestroyTag local_44;
                Assign local_42;
                local_42.opCall(local_44);
            }
        }
        if (TestCase.GetCurrntRound() < TestCase.GetLoopRounds())
        {
            FFPTime local_52 = (FFPTime(FixedTime.Time) + FFPTime(TestCase.GetCaseDuration()));
            Timer.SetResetAtTime((local_52 - FFPTime(0.0001)));
            return;
        }
        Remove local_56;
        local_56.opCall();
        Remove local_60;
        local_60.opCall();
        Remove local_64;
        local_64.opCall();
        Remove local_68;
        local_68.opCall();
        Remove local_72;
        local_72.opCall();
        UKLGTCTestCaseLoader::SetGTCPlaybackState(false);
        FFPTime local_48 = FFPTime(-1);
        FCE_TestCaseFinished local_78;
        local_78.GameTestId = TestCase.GetGameTestId();
        local_78.GameTestEntityId = TestCase.GetGameTestEntityId();
        return;
    }
    bool IsLocalGTCIssuer(const uint IssuerPawnEntityId) const
    {
        bool local_2;
        if (IssuerPawnEntityId == 0)
        {
            return true;
        }
        if (!(FECSEntity(IssuerPawnEntityId).IsValid()))
        {
            local_2 = false;
        }
        else
        {
            Has local_14;
            local_2 = local_14.opCall();
        }
        return local_2;
    }
    UFUNCTION()
    void ClientJob_TestCaseResetByTimer(const FECSEntity &inout Entity, const FC_TestCase &inout TestCase, FC_TestCaseRoundCache &inout RoundCache, const FC_TestCaseResetTimer &inout Timer, const FCS_FixedTime &inout FixedTime) const
    {
        if (!(this.IsLocalGTCIssuer(TestCase.GetIssuerPawnEntityId())))
        {
            return;
        }
        FFPTime local_4 = FFPTime(FixedTime.Time);
        int local_5 = local_4.opCmp(Timer.GetResetAtTime());
        FFPTime local_4_2 = FFPTime(FixedTime.Time);
        if (local_4_2.opCmp(Timer.GetResetAtTime()) < 0)
        {
            return;
        }
        if (!(RoundCache))
        {
            return;
        }
        this.FinishRound(Entity, TestCase, RoundCache);
        if (TestCase.GetCurrntRound() == TestCase.GetLoopRounds())
        {
            ::FGTCUtils::SetLatency(false, 0.0, 0.0);
            Remove local_14;
            local_14.opCall();
            Remove local_18;
            local_18.opCall();
            UKLGTCTestCaseLoader::SetGTCPlaybackCameraSuppress(false);
        }
        return;
    }
    void FinishRound(const FECSEntity &inout Entity, const FC_TestCase &inout TestCase, FC_TestCaseRoundCache &inout RoundCache) const
    {
        FString local_4;
        int local_24 = 0;
        FString local_14 = TestCase.GetGTCJsonAssetPath();
        FString local_18 = FPaths::GetBaseFilename(local_14, true);
        if (this.GenerateTestRoundOuput(local_18, TestCase.GetCurrntRound(), TestCase.GetCurrntStartTicks(), int(RoundCache.BeginFrame), local_24, local_4))
        {
            FString local_34;
            int local_25 = TestCase.GetCurrntRound();
            FString local_14_2 = FString();
            local_34 = FString(local_14_2.Append(local_18).Append("-").Append(local_25));
            RoundCache.CachedResult.Add(local_34, local_4);
        }
        bool local_9 = (TestCase.GetCurrntRound() == TestCase.GetLoopRounds());
        if (local_9 && !(TestCase.GetOutputFolder().IsEmpty()))
        {
            FString local_34;
            bool local_36;
            local_36 = this.GenerateTestCaseOuput(Entity.GetEntityName(), RoundCache.CachedResult, local_34);
            if (local_36)
            {
                bool local_35 = ECS::GetRuntimeInfo().IsClient;
                FString local_14_3 = this.GetOutputFilePathFor(TestCase, local_35);
                if (!(FFileHelper::SaveStringToFile(local_34, local_14_3, FFileHelper::EEncodingOptions(0), 0)))
                {
                    XError(ELog(40), FString().Append("[ERROR] Failed To Save GameTestOutput: ").Append(local_14_3));
                    return;
                }
                if (ECS::GetECSWorld().IsValid())
                {
                    ModifyOrAdd local_54;
                    FCS_GTCRecord& local_56 = local_54.opCall();
                    if (local_56)
                    {
                        int local_43 = TestCase.GetGameTestId();
                        if (local_43 != 0)
                        {
                            if (!(local_56.GTCMap.Contains(TestCase.GetGameTestId())))
                            {
                                FGTCInfo local_64;
                                local_64.IsFinished = false;
                                local_56.GTCMap.Add(TestCase.GetGameTestId(), local_64);
                            }
                            local_56.GTCMap[TestCase.GetGameTestId()].LogFiles.Add(local_14_3);
                        }
                    }
                }
            }
            else
            {
                XError(ELog(40), FString().Append("[ERROR] Failed To Generate TestCaseOuput"));
            }
        }
        if (!(local_9))
        {
            FC_TestCaseResetTag local_70;
            Assign local_68;
            local_68.opCall(local_70);
        }
        else
        {
            this.RestoreSuppressedBT(Entity);
            RoundCache.CachedResult.Empty(0);
        }
        return;
    }
    UFUNCTION()
    void ClientJob_TestCaseDispachAction(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime, const FC_TestCase &inout TestCase) const
    {
        int local_86 = 0;
        int local_122 = 0;
        int local_130 = 0;
        int local_154 = 0;
        if (!(this.IsLocalGTCIssuer(TestCase.GetIssuerPawnEntityId())))
        {
            return;
        }
        FGTCSourceData local_66;
        TestCase.LoadGTCSourceData(local_66);
        TestCase.ApplyPlaybackFilter(local_66);
        float32 local_69 = FBlueprintDebugFunctions::ExchangeMaxScriptExecutionTime(60.0f);
        FC_TestCaseRoundCache local_76;
        local_76.EntityConfigs = local_66.EntityConfigs;
        local_76.ActionConfigs = local_66.ActionConfigs;
        local_76.ServerFixedInputConfigs = local_66.ServerFixedInputConfigs;
        local_76.ClientFixedInputConfigs = local_66.ClientFixedInputConfigs;
        local_76.InitConfigs = local_66.InitConfigs;
        local_76.CameraViewConfigs = local_66.CameraViewConfigs;
        local_76.DetailedDataLists = local_66.DetailedDataLists;
        local_76.DetailedDataCurrentIndex = 0;
        local_76.GlobalRandomSeed = int(local_66.GlobalRandomSeed);
        local_76.RecordWorldTimeTicks = local_66.RecordWorldTimeTicks;
        local_86.SamplerConfigs = local_66.SamplerConfigs;
        FBlueprintDebugFunctions::ExchangeMaxScriptExecutionTime(local_69);
        if (local_86.SamplerConfigs.Num() == 0)
        {
            int local_88 = 0;
            for (; local_88 < local_66.ActionConfigs.Num(); ++local_88)
            {
                if ((!((FInstancedStruct::GetPtr(local_66.ActionConfigs[local_88]).opCall() == nullptr))))
                {
                    local_86.SamplerConfigs.Add(local_66.ActionConfigs[local_88]);
                }
            }
        }
        if (TestCase.GetbEnableLatency())
        {
            ::FGTCUtils::SetLatency(true, TestCase.GetBaseLatency().GetOutgoingLatency(), TestCase.GetBaseLatency().GetIncomingLatency());
        }
        else
        {
            ::FGTCUtils::SetLatency(false, 0.0, 0.0);
        }
        for (auto& local_112 : local_66.InitConfigs)
        {
            FGTCCameraInitTransformConfig local_114 = local_112.CameraInitTransform;
            if (!(local_114.Rotation.IsNearlyZero(9.999999747378752e-5)))
            {
                FECSWorldPtr local_116 = this.GetECSWorld();
                local_122.ViewDir = local_114.Rotation;
            }
            if (local_112.bHasCameraState)
            {
                FGTCCameraStateConfig local_124 = local_112.CameraState;
                FECSWorldPtr local_116_2 = this.GetECSWorld();
                FECSEntity local_138 = local_130.GetCameraViewTargetEntity();
                if (local_138.IsValid())
                {
                    FCS_TPCameraParam& local_140 = FCameraUtils::GetCameraParam(local_138);
                    if (local_140)
                    {
                        local_140.InputDir = FRotator3f(local_124.InputDir);
                        local_140.FinalDir = FRotator3f(local_124.FinalDir);
                        local_140.BaseDir = FRotator3f(local_124.BaseDir);
                        local_140.SetbHasBaseDir(local_124.bHasBaseDir);
                        local_140.StateParams.SetArmLength(local_124.ArmLength);
                        local_140.StateParams.SetSocketOffset(FVector3f(local_124.SocketOffset));
                        local_140.StateParams.SetTargetOffset(FVector3f(local_124.TargetOffset));
                        local_140.StateParams.SetFollowDamping(FVector3f(local_124.FollowDamping));
                        local_140.StateParams.SetFOV(local_124.FOV);
                        local_140.StateParams.SetPitchMin(local_124.PitchMin);
                        local_140.StateParams.SetPitchMax(local_124.PitchMax);
                        local_140.StateParams.SetEyePosVerticalOffset(local_124.EyePosVerticalOffset);
                        local_140.StateParams.SetFollowVerticalOffset(local_124.FollowVerticalOffset);
                    }
                }
            }
            break;
        }
        local_154.StartAtTime = (FFPTime(FixedTime.Time) + FFPTime(TestCase.GetStartDelay()));
        return;
    }
    UFUNCTION()
    void ServerJob_TestCaseStartByTimer(const FECSEntity &inout Entity, const FC_TestCase &inout TestCase, FC_TestCaseStartTimer &inout Timer, const FCS_FixedTime &inout FixedTime) const
    {
        FFPTime local_2 = FFPTime(FixedTime.Time);
        int local_3 = local_2.opCmp(Timer.StartAtTime);
        FFPTime local_2_2 = FFPTime(FixedTime.Time);
        if (local_2_2.opCmp(Timer.StartAtTime) >= 0)
        {
            Remove local_8;
            local_8.opCall();
            FC_TestCaseResetTag local_14;
            Assign local_12;
            local_12.opCall(local_14);
        }
        return;
    }
    UFUNCTION()
    void ClientJob_TestCaseStartByTimer(const FECSEntity &inout Entity, const FC_TestCase &inout TestCase, FC_TestCaseStartTimer &inout Timer, const FCS_FixedTime &inout FixedTime) const
    {
        if (!(this.IsLocalGTCIssuer(TestCase.GetIssuerPawnEntityId())))
        {
            return;
        }
        FFPTime local_4 = FFPTime(FixedTime.Time);
        int local_5 = local_4.opCmp(Timer.StartAtTime);
        FFPTime local_4_2 = FFPTime(FixedTime.Time);
        if (local_4_2.opCmp(Timer.StartAtTime) >= 0)
        {
            Remove local_10;
            local_10.opCall();
            FC_TestCaseResetTag local_16;
            Assign local_14;
            local_14.opCall(local_16);
        }
        return;
    }
    void ResetCaseGlobal() const
    {
        FECSRuntimeView local_40 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_44;
        local_44.opCall();
        FECSRuntimeViewIterator local_78 = local_40.Iterator();
        for (; local_78.CanProceed;)
        {
            const FECSEntity& local_116 = local_78.Proceed();
            if (!(local_116.IsValid()))
            {
                continue;
            }
            Has local_120;
            bool local_113 = local_120.opCall();
            if (local_113)
            {
                Has local_124;
                local_113 = local_124.opCall();
                if (local_113)
                {
                    float32 local_141 = FGameAttributeUtils::GetAttributeValue(local_116, Attribute::HPMax, ECS::GetContextTime(), false, 0.0f, false, FGameAttributeModificationValue());
                    float32 local_137 = FGameAttributeUtils::GetAttributeValue(local_116, Attribute::HP, ECS::GetContextTime(), false, 0.0f, false, FGameAttributeModificationValue());
                    if (local_137 < local_141)
                    {
                        FGameAttributeUtils::Recover(local_116, Attribute::HP, ECS::GetContextTime(), local_141 - local_137, -1.0f);
                    }
                }
                Has local_146;
                local_113 = local_146.opCall();
                if (local_113)
                {
                    int local_152;
                    TArray<FECSEntity> local_156;
                    for (auto& local_170 : local_152.GetBuffData())
                    {
                        local_156.Add(FECSEntity(local_170.BuffEntityId));
                    }
                    for (auto& local_190 : local_156)
                    {
                        FBuffUtils::RemoveBuff(local_116, local_190, ECS::GetContextTime(), EBuffEndType(0));
                    }
                }
                continue;
            }
            if (::FASCommonUtils::IsMonsterPrefab(local_116))
            {
                FC_GTCPendingDestroyTag local_198;
                Assign local_196;
                local_196.opCall(local_198);
            }
        }
        return;
    }
    TMap<FName, FECSEntityId> BuildRecordedAICommandAliases(const FC_TestCase &inout TestCase, FC_TestCaseRoundCache &inout RoundCache) const
    {
        TMap<FName, FECSEntityId> local_20;
        TArray<FString> local_24;
        for (auto& local_40 : RoundCache.ActionConfigs)
        {
            if ((FInstancedStruct::GetPtr(local_40).opCall() == nullptr))
            {
                continue;
            }
            FString local_52;
            if (local_52.IsEmpty())
            {
                continue;
            }
            TArray<FString> local_56;
            local_52.ParseIntoArray(local_56, "|", true);
            for (auto& local_72 : local_56)
            {
                int local_73 = -1;
                if (!(local_72.FindChar(int16(58), local_73)))
                {
                    continue;
                }
                FString local_84 = local_72.Mid(local_73 + 1, 2147483647);
                FECSEntityId local_85;
                bool local_37 = TestCase.GetEntityMap().Find(FName(local_84), local_85);
                if (local_37)
                {
                    continue;
                }
                local_24.AddUnique(local_84);
            }
        }
        if (local_24.Num() == 0)
        {
            return local_20;
        }
        for (auto& local_102 : RoundCache.EntityConfigs)
        {
            FString local_78 = local_102.PrefabToSpawn.ToSoftObjectPath().ToString();
            int local_73_2 = -1;
            if (!(local_78.FindChar(int16(46), local_73_2)))
            {
                continue;
            }
            FString local_84_2 = local_78.Mid(local_73_2 + 1, 2147483647);
            if (local_84_2.IsEmpty())
            {
                continue;
            }
            FECSEntityId local_85;
            if (!(TestCase.GetEntityMap().Find(local_102.UniqueName, local_85)))
            {
                continue;
            }
            for (auto& local_72 : local_24)
            {
                if (!(local_72.Contains(local_84_2, ESearchCase(1), ESearchDir(0))))
                {
                    continue;
                }
                local_20.Add(FName(local_72), local_85);
            }
        }
        return local_20;
    }
    TArray<FGTCLazyBindMonster> BuildLazyBindPending(const FC_TestCaseRoundCache &inout RoundCache) const
    {
        bool local_45;
        const FGTCAICommandAction& local_72;
        TArray<FGTCLazyBindMonster> local_4;
        for (auto& local_20 : RoundCache.EntityConfigs)
        {
            if (!(local_20.bGameSpawnedLazyBind))
            {
                continue;
            }
            FString local_36 = local_20.PrefabToSpawn.ToSoftObjectPath().ToString();
            FString local_40 = local_36;
            int local_41 = -1;
            if (local_36.FindChar(int16(46), local_41))
            {
                local_40 = local_36.Mid(local_41 + 1, 2147483647);
            }
            if (local_40.IsEmpty())
            {
                continue;
            }
            local_45 = false;
            FFPTime local_48;
            for (auto& local_62 : RoundCache.ActionConfigs)
            {
                if ((FInstancedStruct::GetPtr(local_62).opCall() == nullptr))
                {
                    continue;
                }
                if (!((FName(local_72.TargetUniqueName) == local_20.UniqueName)))
                {
                    continue;
                }
                if (!(local_45) || (local_72.StartTime.GetTicks() < local_48.GetTicks()))
                {
                    local_48 = local_72.StartTime;
                    local_45 = true;
                }
            }
            if (!(local_45))
            {
                continue;
            }
            FGTCLazyBindMonster local_96;
            local_96.UniqueName = local_20.UniqueName;
            local_96.PrefabClassToken = local_40;
            local_96.MatchLocation = local_20.InitTransform.GetLocation();
            local_96.FirstStartTime = local_48;
            local_96.bBound = false;
            local_4.Add(local_96);
        }
        return local_4;
    }
    UFUNCTION()
    void ServerJob_TestCaseReset(const FECSEntity &inout Entity, FC_TestCase &inout TestCase, FC_TestCaseRoundCache &inout RoundCache, const FCS_FixedTime &inout FixedTime) const
    {
        bool local_5;
        int local_104 = 0;
        int local_140 = 0;
        FC_TestCaseServerFixedInputs local_146;
        int local_152 = 0;
        FName local_176;
        int local_190 = 0;
        int local_206 = 0;
        int local_220 = 0;
        int local_226 = 0;
        int local_240 = 0;
        int local_262 = 0;
        Remove local_4;
        local_4.opCall();
        if (TestCase.GetbResetCaseEnvironment())
        {
            this.ResetCaseGlobal();
        }
        TestCase.SetCurrntRound((TestCase.GetCurrntRound() + 1));
        TestCase.SetCurrntRoundBeginTime(FixedTime.Time);
        TestCase.SetCurrntStartTicks(FDateTime::Now().GetTicks());
        RoundCache.BeginTime = FixedTime.Time;
        RoundCache.BeginFrame = int(FixedTime.Frame);
        RoundCache.DetailedDataCurrentIndex = 0;
        TestCase.SetReplayBeginFrame(-1);
        TArray<FName> local_16;
        for (auto& local_30 : RoundCache.EntityConfigs)
        {
            if (local_30.bGameSpawnedLazyBind)
            {
                local_16.Add(local_30.UniqueName);
            }
        }
        if (local_16.Num() > 0)
        {
            bool local_51;
            TMap<FName, FECSEntityId> local_50;
            local_51 = false;
            for (auto& local_70 : TestCase.GetEntityMap())
            {
                if (local_16.Contains(local_70.GetKey()))
                {
                    local_51 = true;
                    continue;
                }
                local_50.Add(local_70.GetKey());
            }
            if (local_51)
            {
                TestCase.SetEntityMap(local_50);
            }
        }
        TestCase.SetAICommandEntityAliasMap(this.BuildRecordedAICommandAliases(TestCase, RoundCache));
        TArray<FGTCLazyBindMonster> local_98 = this.BuildLazyBindPending(RoundCache);
        if (local_98.Num() > 0)
        {
            local_104.PendingMonsters = local_98;
            XLog(ELog(40), FString().Append("[GTC] LazyBind pending monsters: ").Append(local_98.Num()));
        }
        else
        {
            Has local_114;
            local_5 = local_114.opCall();
            if (local_5)
            {
                Remove local_118;
                local_118.opCall();
            }
        }
        for (auto& local_30 : RoundCache.EntityConfigs)
        {
            if (local_30.bGameSpawnedLazyBind)
            {
                continue;
            }
            FECSEntityId local_119;
            if (!(TestCase.TryFindEntityId(local_30.UniqueName, local_119)))
            {
                continue;
            }
            FECSEntity local_124 = FECSEntity(local_119);
            local_124.IsValid();
            ::FGTCUtils::RegisterBehaviorTreeResource(local_124);
            this.ResetEntity(local_124, local_30, RoundCache, FixedTime, TestCase.IsReusedLevelEntity(local_124.GetId()));
            Remove local_134;
            local_134.opCall();
            local_140.Init(Entity.GetId(), int(RoundCache.BeginFrame), RoundCache.BeginTime);
            local_146.Init(Entity.GetId(), int(RoundCache.BeginFrame), RoundCache.BeginTime);
            local_146.CheckpointFrames.Empty(0);
            local_146.CheckpointCursor = 0;
            local_146.LastAppliedCheckpointIndex = -1;
            local_146.AutoCheckpointFrames.Empty(0);
            local_146.AutoCheckpointCursor = 0;
            local_146.LastAppliedAutoCheckpointIndex = -1;
            local_5 = local_30.bUsePlayerPawn;
            if (local_5)
            {
                local_146.CheckpointFrames = RoundCache.CheckpointFrames;
                local_146.AutoCheckpointFrames = RoundCache.AutoCheckpointFrames;
            }
            local_152.Init(Entity.GetId(), int(RoundCache.BeginFrame), RoundCache.BeginTime);
            for (auto& local_166 : RoundCache.ActionConfigs)
            {
                if ((FInstancedStruct::GetPtr(local_166).opCall() == nullptr) || !((local_176 == local_30.UniqueName)))
                {
                    continue;
                }
                if ((FInstancedStruct::GetPtr(local_166).opCall() == nullptr))
                {
                    local_140.Actions.Add(local_166);
                }
            }
            for (auto& local_166 : RoundCache.ServerFixedInputConfigs)
            {
                if ((FInstancedStruct::GetPtr(local_166).opCall() == nullptr) || !((local_176 == local_30.UniqueName)))
                {
                    continue;
                }
                local_146.Actions.Add(local_166);
            }
            int local_191 = 0;
            for (; local_191 < local_190.SamplerConfigs.Num(); ++local_191)
            {
                if ((FInstancedStruct::GetPtr(local_190.SamplerConfigs[local_191]).opCall() == nullptr) || !((local_176 == local_30.UniqueName)))
                {
                    continue;
                }
                local_152.SamplerIndices.Add(local_191);
            }
            bool local_177 = !(local_30.bUsePlayerPawn);
            if (!(local_177))
            {
                local_177 = false;
            }
            else
            {
                Has local_196;
                local_5 = local_196.opCall();
                local_177 = local_5;
            }
            Has local_200;
            local_177 = local_177 && !(local_200.opCall());
            if (local_177)
            {
                if (!(FECSEntity(local_206.GetControllerEntity()).IsValid()))
                {
                    local_5 = false;
                }
                else
                {
                    Has local_214;
                    local_5 = local_214.opCall();
                }
                if (local_5)
                {
                    local_220.SetbShouldRun(false);
                    local_226.ControllerEntity = local_206.GetControllerEntity();
                    XLog(ELog(40), FString().Append("[GTC] BT suppressed for ").Append(local_30.UniqueName).Append(", Controller=").Append(local_206.GetControllerEntity()));
                }
            }
        }
        if (int(RoundCache.GlobalRandomSeed) != 0 || (RoundCache.RecordWorldTimeTicks != 0))
        {
            int64 local_228 = FixedTime.Time.GetTicks();
            if (int(RoundCache.GlobalRandomSeed) != 0)
            {
                FECSWorldPtr local_234 = this.GetECSWorld();
                XLog(ELog(40), FString().Append("[GTC] ApplyGlobalSeed: OldSeed=").Append(local_240.GetSeed()).Append(" -> NewSeed=").Append(RoundCache.GlobalRandomSeed));
                local_240.SetSeed(int(RoundCache.GlobalRandomSeed));
            }
            for (auto& local_30 : RoundCache.EntityConfigs)
            {
                if (int(local_30.RandomSeed) == 0)
                {
                    continue;
                }
                FECSEntityId local_119;
                if (!(TestCase.TryFindEntityId(local_30.UniqueName, local_119)))
                {
                    continue;
                }
                Has local_244;
                local_5 = !(FECSEntity(local_119).IsValid()) || !(local_244.opCall());
                if (local_5)
                {
                    continue;
                }
                int64 local_246 = 0;
                if (RoundCache.RecordWorldTimeTicks == 0)
                {
                    local_5 = false;
                }
                else
                {
                    local_5 = (local_30.RandomInitTimeTicks != 0);
                }
                if (local_5)
                {
                    local_246 = local_228 - (RoundCache.RecordWorldTimeTicks - local_30.RandomInitTimeTicks);
                    if (local_246 == 0)
                    {
                        local_246 = 1;
                    }
                }
                int local_6_2 = int(local_30.RandomSeed);
                XLog(ELog(40), FString().Append("[GTC] Assigned override seed for ").Append(local_30.UniqueName).Append(": Seed=").Append(local_30.RandomSeed).Append(", NewInitTicks=").Append(local_246));
            }
        }
        local_262.RunAtTime = (FFPTime(FixedTime.Time) + FFPTime(TestCase.GetRunDelay()));
        return;
    }
    bool HasMainPlayerReplayData(const FC_TestCaseRoundCache &inout RoundCache, const FName &inout PlayerName) const
    {
        FName local_26;
        for (auto& local_16 : RoundCache.ServerFixedInputConfigs)
        {
            if (!((FInstancedStruct::GetPtr(local_16).opCall() == nullptr)) && (local_26 == PlayerName))
            {
                return true;
            }
        }
        for (auto& local_16 : RoundCache.ActionConfigs)
        {
            if (!((FInstancedStruct::GetPtr(local_16).opCall() == nullptr)) && (local_26 == PlayerName))
            {
                return true;
            }
        }
        if (RoundCache.CameraViewConfigs.Num() > 0)
        {
            return true;
        }
        return false;
    }
    UFUNCTION()
    void ServerJob_TestCaseRunByTimer(const FECSEntity &inout Entity, const FC_TestCase &inout TestCase, FC_TestCaseRoundCache &inout RoundCache, FC_TestCaseRunTimer &inout Timer, FC_TestCaseResetTimer &inout ResetTimer, const FCS_FixedTime &inout FixedTime) const
    {
        FFPTime local_2 = FFPTime(FixedTime.Time);
        int local_3 = local_2.opCmp(Timer.RunAtTime);
        FFPTime local_2_2 = FFPTime(FixedTime.Time);
        if (local_2_2.opCmp(Timer.RunAtTime) < 0)
        {
            return;
        }
        Remove local_8;
        local_8.opCall();
        RoundCache.BeginTime = FixedTime.Time;
        RoundCache.BeginFrame = int(FixedTime.Frame);
        RoundCache.DetailedDataCurrentIndex = 0;
        Modify local_12;
        local_12.opCall().SetReplayBeginFrame(int(FixedTime.Frame));
        ResetTimer.SetResetAtTime((FFPTime(FixedTime.Time) + FFPTime(TestCase.GetCaseDuration())));
        for (auto& local_34 : RoundCache.EntityConfigs)
        {
            FECSEntityId local_35;
            if (!(TestCase.TryFindEntityId(local_34.UniqueName, local_35)))
            {
                continue;
            }
            FECSEntity local_40 = FECSEntity(local_35);
            if (!(local_40.IsValid()))
            {
                continue;
            }
            ::FGTCUtils::TransitToESMState(local_40, local_34.InitState, local_34.InitStateTime);
            for (auto& local_58 : local_34.InitESMLayers)
            {
                UKLGTCTestCaseLoader::ForceESMState(local_40, int(local_58.SMIndex), int(local_58.StateIndex), local_58.StateTime, local_58.PlaySpeed);
            }
            Has local_64;
            bool local_4 = local_64.opCall();
            if (local_4)
            {
                int local_3_2 = RoundCache.BeginFrame;
                FC_TestCaseActions local_70;
                local_70.BeginTime = RoundCache.BeginTime;
            }
            Has local_74;
            local_4 = local_74.opCall();
            if (local_4)
            {
                int local_60 = RoundCache.BeginFrame;
                FC_TestCaseServerFixedInputs local_80;
                local_80.BeginTime = RoundCache.BeginTime;
            }
            Has local_84;
            local_4 = local_84.opCall();
            if (local_4)
            {
                int local_3_3 = RoundCache.BeginFrame;
                FC_TestCaseServerSamplers local_90;
                local_90.BeginTime = RoundCache.BeginTime;
            }
            if (local_34.bUsePlayerPawn && !(this.HasMainPlayerReplayData(RoundCache, local_34.UniqueName)))
            {
                XLog(ELog(40), FString().Append("[GTC] Main player '").Append(local_34.UniqueName).Append("' has no replay data: skip ReadyTag, keep it player-operable during playback"));
            }
            else
            {
                FC_TestCaseReadyTag local_104;
                Assign local_102;
                local_102.opCall(local_104);
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_TestCaseReset(const FECSEntity &inout Entity, const FC_TestCase &inout TestCase, FC_TestCaseRoundCache &inout RoundCache, const FCS_FixedTime &inout FixedTime) const
    {
        int local_64 = 0;
        if (!(this.IsLocalGTCIssuer(TestCase.GetIssuerPawnEntityId())))
        {
            return;
        }
        for (auto& local_16 : RoundCache.EntityConfigs)
        {
            FECSEntityId local_17;
            if (!(TestCase.TryFindEntityId(local_16.UniqueName, local_17)))
            {
                continue;
            }
            if (!(FECSEntity(local_17).IsValid()))
            {
                return;
            }
        }
        for (auto& local_16 : RoundCache.EntityConfigs)
        {
            FECSEntityId local_17;
            if (!(TestCase.TryFindEntityId(local_16.UniqueName, local_17)))
            {
                continue;
            }
            FECSEntity local_22 = FECSEntity(local_17);
            if (!(local_22.IsValid()))
            {
                continue;
            }
            if ((!((local_16.InitState == NAME_None))))
            {
                ::FGTCUtils::TransitToESMState(local_22, local_16.InitState, local_16.InitStateTime);
            }
            for (auto& local_46 : local_16.InitESMLayers)
            {
                UKLGTCTestCaseLoader::ForceESMState(local_22, int(local_46.SMIndex), int(local_46.StateIndex), local_46.StateTime, local_46.PlaySpeed);
            }
        }
        Remove local_56;
        local_56.opCall();
        local_64.RunAtTime = (FFPTime(FixedTime.Time) + FFPTime(TestCase.GetRunDelay()));
        return;
    }
    UFUNCTION()
    void ClientJob_TestCasePinESMDuringWait(const FECSEntity &inout Entity, const FC_TestCase &inout TestCase, FC_TestCaseRoundCache &inout RoundCache, FC_TestCaseRunTimer &inout Timer, const FCS_FixedTime &inout FixedTime) const
    {
        int local_50 = 0;
        if (!(this.IsLocalGTCIssuer(TestCase.GetIssuerPawnEntityId())))
        {
            return;
        }
        FFPTime local_4 = FFPTime(FixedTime.Time);
        if (local_4.opCmp(Timer.RunAtTime) >= 0)
        {
            return;
        }
        float32 local_12 = TestCase.GetRunDelay() - (float32(((Timer.RunAtTime - FixedTime.Time).ToSeconds())));
        Has local_42;
        for (auto& local_28 : RoundCache.EntityConfigs)
        {
            FECSEntityId local_29;
            if (!(TestCase.TryFindEntityId(local_28.UniqueName, local_29)))
            {
                continue;
            }
            FECSEntity local_34 = FECSEntity(local_29);
            if (!(local_34.IsValid()) || !(local_42.opCall()))
            {
                continue;
            }
            if (local_50.Player.GetSMRuntime().Num() > 0)
            {
                int local_52;
                local_52 = local_50.Player.GetSMRuntime()[0].GetStateIndex();
                UKLGTCTestCaseLoader::SoftSyncESMTime(local_34, 0, local_52, (local_28.InitStateTime + local_12), 1.0f);
            }
            for (auto& local_68 : local_28.InitESMLayers)
            {
                UKLGTCTestCaseLoader::SoftSyncESMTime(local_34, int(local_68.SMIndex), int(local_68.StateIndex), local_68.StateTime, local_68.PlaySpeed);
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_TestCaseRunByTimer(const FECSEntity &inout Entity, const FC_TestCase &inout TestCase, FC_TestCaseRoundCache &inout RoundCache, FC_TestCaseRunTimer &inout Timer, const FCS_FixedTime &inout FixedTime) const
    {
        int local_11;
        FCE_TestCaseDispatchClientActions local_50;
        FName local_74;
        int local_88 = 0;
        if (!(this.IsLocalGTCIssuer(TestCase.GetIssuerPawnEntityId())))
        {
            return;
        }
        int local_5 = FFPTime(FixedTime.Time).opCmp(Timer.RunAtTime);
        if (FFPTime(FixedTime.Time).opCmp(Timer.RunAtTime) < 0)
        {
            return;
        }
        if (TestCase.GetReplayBeginFrame() < 0)
        {
            return;
        }
        Remove local_10;
        local_10.opCall();
        local_11 = TestCase.GetReplayBeginFrame();
        int local_6 = int(FixedTime.Frame) - local_11;
        if (local_6 < 0)
        {
            local_6 = 0;
        }
        RoundCache.BeginFrame = local_11;
        FFPTime local_18 = FFPTime(FixedTime.Time);
        RoundCache.BeginTime = (local_18 - FFPTime((FixedTime.DeltaTime.ToSeconds() * local_6)));
        RoundCache.DetailedDataCurrentIndex = 0;
        for (auto& local_34 : RoundCache.EntityConfigs)
        {
            FECSEntityId local_35;
            if (!(TestCase.TryFindEntityId(local_34.UniqueName, local_35)))
            {
                continue;
            }
            if (!(FECSEntity(local_35).IsValid()))
            {
                continue;
            }
            FFPTime local_20 = FFPTime(-1);
            local_50.EntityId = local_35;
            local_50.BeginFrame = int(RoundCache.BeginFrame);
            local_50.BeginTime = RoundCache.BeginTime;
            local_50.bTakeSampleOnClient = local_34.bTakeSampleOnClient;
            for (auto& local_64 : RoundCache.ActionConfigs)
            {
                if ((FInstancedStruct::GetPtr(local_64).opCall() == nullptr) || !((local_74 == local_34.UniqueName)))
                {
                    continue;
                }
                if (!((FInstancedStruct::GetPtr(local_64).opCall() == nullptr)))
                {
                    continue;
                }
                local_50.Actions.Add(local_64);
            }
            for (auto& local_64 : RoundCache.ServerFixedInputConfigs)
            {
                if ((FInstancedStruct::GetPtr(local_64).opCall() == nullptr) || !((local_74 == local_34.UniqueName)))
                {
                    continue;
                }
                local_50.FixedInputActions.Add(local_64);
            }
            int local_89 = 0;
            for (; local_89 < local_88.SamplerConfigs.Num(); ++local_89)
            {
                if ((FInstancedStruct::GetPtr(local_88.SamplerConfigs[local_89]).opCall() == nullptr) || !((local_74 == local_34.UniqueName)))
                {
                    continue;
                }
                local_50.SamplerIndices.Add(local_89);
            }
        }
        if (RoundCache.CameraViewConfigs.Num() > 0)
        {
            FC_TestCaseCameraViewPlayback local_96;
            local_96.CurrentIndex = 0;
            local_96.BeginTime = FixedTime.Time;
            local_96.CameraViewConfigs = RoundCache.CameraViewConfigs;
            UKLGTCTestCaseLoader::SetGTCPlaybackCameraSuppress(true);
            return;
        }
        Remove local_100;
        local_100.opCall();
        return;
    }
    UFUNCTION()
    void ServerJob_TickForceFixedTimeOffset(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime) const
    {
        int local_16 = 0;
        int local_1 = this.GTCForceFixedOffsetFrame;
        local_16.Enqueue(int(FixedTime.Frame), local_1, FFPTime((local_1 * FixedTime.DeltaTime.ToSeconds())));
        return;
    }
    UFUNCTION()
    void ClientJob_TickForceFixedTimeOffset(const FECSEntity &inout Entity, const FCS_FixedTime &inout FixedTime) const
    {
        int local_16 = 0;
        int local_1 = this.GTCForceFixedOffsetFrame;
        local_16.Enqueue(int(FixedTime.Frame), local_1, FFPTime((local_1 * FixedTime.DeltaTime.ToSeconds())));
        return;
    }
    UFUNCTION()
    void ServerJob_TestCaseTickFixedInput(const FECSEntity &inout Entity, FC_TestCaseServerFixedInputs &inout ActionComp, const FCS_FixedTime &inout FixedTime, const FCS_LocalTime &inout LocalTime) const
    {
        if (ActionComp.Actions.Num() > 0)
        {
            Modify local_30;
            TArray<FInputData> local_8;
            Get local_12;
            const FC_LockTarget& local_14 = local_12.opCall();
            if (local_14)
            {
                if (local_14.GetTargetEntity().IsValid())
                {
                    Get local_18;
                    FC_Input local_20 = local_18.opCall();
                    if (local_20)
                    {
                        int local_21 = 0;
                        for (; local_21 < local_20.Packets.Num(); ++local_21)
                        {
                            int local_22 = 0;
                            for (; local_22 < local_20.Packets[local_21].InputDatas.Num(); ++local_22)
                            {
                                FName local_25(local_20.Packets[local_21].InputDatas[local_22].Name);
                                if ((local_25 == FCharacterInputUtils::GetLockTargetPositionInputName()) || (local_25 == FCharacterInputUtils::GetLockTargetRotationInputName()) || (local_25 == FCharacterInputUtils::GetMultiLockTargetPositionInputName()) || (local_25 == FCharacterInputUtils::GetMultiLockTargetRotationInputName()) || (local_25 == FCharacterInputUtils::GetViewDirInputName()) || (local_25 == FCharacterInputUtils::GetCorrectedViewDirInputName()))
                                {
                                    local_8.Add(local_20.Packets[local_21].InputDatas[local_22]);
                                }
                            }
                        }
                    }
                }
            }
            FC_Input local_20_2 = local_30.opCall();
            if (local_20_2)
            {
                local_20_2.Packets.Empty(0);
            }
            this.TickFixedInputActions(Entity, ActionComp, FixedTime, LocalTime);
            if (local_8.Num() > 0)
            {
                FC_Input local_20_3 = local_30.opCall();
                if (local_20_3)
                {
                    int local_22_2 = 0;
                    for (; local_22_2 < local_8.Num(); )
                    {
                        local_8[local_22_2].Time = FixedTime.Time;
                        local_20_3.GetOrAddPacket(int(FixedTime.Frame)).ReplaceOrAdd(local_8[local_22_2]);
                        ++local_22_2;
                    }
                }
            }
        }
        return;
    }
    UFUNCTION()
    void ClientJob_TestCaseTickFixedInput(const FECSEntity &inout Entity, FC_TestCaseClientFixedInputs &inout ActionComp, const FCS_FixedTime &inout FixedTime, const FCS_LocalTime &inout LocalTime) const
    {
        if (ActionComp.Actions.Num() > 0)
        {
            Modify local_8;
            FC_Input& local_10 = local_8.opCall();
            if (local_10)
            {
                local_10.Packets.Empty(0);
            }
            this.TickFixedInputActions(Entity, ActionComp, FixedTime, LocalTime);
        }
        return;
    }
    UFUNCTION()
    void ClientJob_TestCaseSyncCameraFromServerInput(const FECSEntity &inout Entity, FC_TestCaseClientFixedInputs &inout FixedInputs, const FCS_FixedTime &inout FixedTime) const
    {
        int local_6 = 0;
        int local_34 = 0;
        if (local_6 && local_6.GetTargetEntity().IsValid() && (int(local_6.GetType()) == 2))
        {
            return;
        }
        FRotator local_24 = this.SampleRecordedViewDir(FixedInputs.Actions, FixedInputs.BeginTime, FixedTime.Time);
        if (local_24.IsNearlyZero(9.999999747378752e-5))
        {
            return;
        }
        FECSWorldPtr local_28 = this.GetECSWorld();
        local_34.ViewDir = local_24;
        FCS_TPCameraParam& local_36 = FCameraUtils::GetCameraParam(Entity);
        if (local_36)
        {
            local_36.InputDir = FRotator3f(local_24);
        }
        return;
    }
    UFUNCTION()
    void ClientJob_TestCaseSmoothCameraOnRenderFrame(const FECSEntity &inout Entity, const FC_TestCaseClientFixedInputs &inout FixedInputs) const
    {
        int local_6 = 0;
        FRotator local_28;
        int local_38 = 0;
        if (local_6 && local_6.GetTargetEntity().IsValid() && (int(local_6.GetType()) == 2))
        {
            return;
        }
        if (local_28.IsNearlyZero(9.999999747378752e-5))
        {
            return;
        }
        FECSWorldPtr local_32 = this.GetECSWorld();
        local_38.ViewDir = local_28;
        FCS_TPCameraParam& local_40 = FCameraUtils::GetCameraParam(Entity);
        if (local_40)
        {
            local_40.InputDir = FRotator3f(local_28);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_TestCaseMigrateReplayOnSwitch(const FCE_PlayerSwitchSuccess &inout Event) const
    {
        FECSEntity local_4 = Event.SwitchOutPawn;
        FECSEntity local_8 = Event.SwitchInPawn;
        if (!(local_4.IsValid()) || !(local_8.IsValid()) || (local_4.GetId() == local_8.GetId()))
        {
            return;
        }
        Has local_16;
        if (!(local_16.opCall()))
        {
            return;
        }
        Get local_22;
        FECSEntityId local_18 = FECSEntityId(local_22.opCall().TestCaseEntityId);
        this.MoveComponent_ServerFixedInputs(local_4, local_8);
        Has local_26;
        bool local_9 = local_26.opCall();
        if (local_9)
        {
            this.MoveComponent_Actions(local_4, local_8);
        }
        Has local_30;
        bool local_10 = local_30.opCall();
        if (local_10)
        {
            this.MoveComponent_ServerSamplers(local_4, local_8);
        }
        Has local_34;
        bool local_9_2 = local_34.opCall();
        if (local_9_2)
        {
            FC_TestCaseReadyTag local_40;
            Assign local_38;
            local_38.opCall(local_40);
            Remove local_44;
            local_44.opCall();
        }
        this.RetargetTestCaseToNewPawn(local_18, local_4.GetId(), local_8.GetId());
        XLog(ELog(40), FString().Append("[GTC] е€‡дєєиїЃз§»дё»и§’е›ћж”ѕ(Server): ").Append(local_4.GetId()).Append(" -> ").Append(local_8.GetId()));
        return;
    }
    UFUNCTION()
    void ClientJob_TestCaseMigrateReplayOnSwitch(const FCE_PlayerSwitchSuccess &inout Event) const
    {
        FECSEntityId local_11;
        FECSEntity local_4 = Event.SwitchOutPawn;
        FECSEntity local_8 = Event.SwitchInPawn;
        bool local_9 = !(local_4.IsValid()) || !(local_8.IsValid());
        if (local_9)
        {
            local_9 = true;
        }
        else
        {
            local_4.GetId();
            local_9 = (local_11 == local_8.GetId());
        }
        if (local_9)
        {
            return;
        }
        Has local_16;
        if (!(local_16.opCall()))
        {
            return;
        }
        this.MoveComponent_ClientFixedInputs(local_4, local_8);
        Has local_22;
        bool local_9_2 = local_22.opCall();
        if (local_9_2)
        {
            this.MoveComponent_ClientLogicSamplers(local_4, local_8);
        }
        FECSEntityId local_12 = local_8.GetId();
        local_4.GetId();
        XLog(ELog(40), FString().Append("[GTC] е€‡дєєиїЃз§»дё»и§’е›ћж”ѕ(Client-Logic): ").Append(local_11).Append(local_11).Append(" -> "));
        return;
    }
    UFUNCTION()
    void ClientJob_TestCaseMigrateViewOnSwitch(const FCE_PlayerSwitchSuccess &inout Event) const
    {
        FECSEntityId local_11;
        Has local_16;
        Has local_20;
        FECSEntity local_4 = Event.SwitchOutPawn;
        FECSEntity local_8 = Event.SwitchInPawn;
        bool local_9 = !(local_4.IsValid()) || !(local_8.IsValid());
        if (local_9)
        {
            local_9 = true;
        }
        else
        {
            local_4.GetId();
            local_9 = (local_11 == local_8.GetId());
        }
        if (local_9)
        {
            return;
        }
        if (!(local_16.opCall()) && !(local_20.opCall()))
        {
            return;
        }
        bool local_10 = local_16.opCall();
        if (local_10)
        {
            this.MoveComponent_ClientInputs(local_4, local_8);
        }
        bool local_9_2 = local_20.opCall();
        if (local_9_2)
        {
            this.MoveComponent_ClientViewSamplers(local_4, local_8);
        }
        FECSEntityId local_12 = local_8.GetId();
        local_4.GetId();
        XLog(ELog(40), FString().Append("[GTC] е€‡дєєиїЃз§»дё»и§’е›ћж”ѕ(Client-View): ").Append(local_11).Append(local_11).Append(" -> "));
        return;
    }
    void MoveComponent_ServerFixedInputs(const FECSEntity &inout From, const FECSEntity &inout To) const
    {
        FC_TestCaseServerFixedInputs local_6;
        int local_13 = int(local_6._base_FC_GTCActionContainer);
        FC_TestCaseServerFixedInputs local_12;
        local_12.BeginTime = local_6.BeginTime;
        local_12.Actions = local_6.Actions;
        local_12.StartedFlags = local_6.StartedFlags;
        local_12.TestCaseEntityId = local_6.TestCaseEntityId;
        local_12.SamplerIndices = local_6.SamplerIndices;
        local_12.SamplerStartedFlags = local_6.SamplerStartedFlags;
        local_12.CheckpointFrames = local_6.CheckpointFrames;
        local_12.CheckpointCursor = int(local_6.CheckpointCursor);
        local_12.LastAppliedCheckpointIndex = int(local_6.LastAppliedCheckpointIndex);
        local_12.AutoCheckpointFrames = local_6.AutoCheckpointFrames;
        local_12.AutoCheckpointCursor = int(local_6.AutoCheckpointCursor);
        local_12.LastAppliedAutoCheckpointIndex = int(local_6.LastAppliedAutoCheckpointIndex);
        Remove local_18;
        local_18.opCall();
        return;
    }
    void MoveComponent_Actions(const FECSEntity &inout From, const FECSEntity &inout To) const
    {
        FC_TestCaseActions local_6;
        FC_TestCaseActions local_12;
        local_12.BeginTime = local_6.BeginTime;
        local_12.Actions = local_6.Actions;
        local_12.StartedFlags = local_6.StartedFlags;
        local_12.TestCaseEntityId = local_6.TestCaseEntityId;
        local_12.SamplerIndices = local_6.SamplerIndices;
        local_12.SamplerStartedFlags = local_6.SamplerStartedFlags;
        Remove local_18;
        local_18.opCall();
        return;
    }
    void MoveComponent_ServerSamplers(const FECSEntity &inout From, const FECSEntity &inout To) const
    {
        FC_TestCaseServerSamplers local_6;
        FC_TestCaseServerSamplers local_12;
        local_12.BeginTime = local_6.BeginTime;
        local_12.Actions = local_6.Actions;
        local_12.StartedFlags = local_6.StartedFlags;
        local_12.TestCaseEntityId = local_6.TestCaseEntityId;
        local_12.SamplerIndices = local_6.SamplerIndices;
        local_12.SamplerStartedFlags = local_6.SamplerStartedFlags;
        Remove local_18;
        local_18.opCall();
        return;
    }
    void MoveComponent_ClientFixedInputs(const FECSEntity &inout From, const FECSEntity &inout To) const
    {
        FC_TestCaseClientFixedInputs local_6;
        FC_TestCaseClientFixedInputs local_12;
        local_12.BeginTime = local_6.BeginTime;
        local_12.Actions = local_6.Actions;
        local_12.StartedFlags = local_6.StartedFlags;
        local_12.TestCaseEntityId = local_6.TestCaseEntityId;
        local_12.SamplerIndices = local_6.SamplerIndices;
        local_12.SamplerStartedFlags = local_6.SamplerStartedFlags;
        Remove local_18;
        local_18.opCall();
        return;
    }
    void MoveComponent_ClientInputs(const FECSEntity &inout From, const FECSEntity &inout To) const
    {
        FC_TestCaseClientInputs local_6;
        FC_TestCaseClientInputs local_12;
        local_12.BeginTime = local_6.BeginTime;
        local_12.Actions = local_6.Actions;
        local_12.StartedFlags = local_6.StartedFlags;
        local_12.TestCaseEntityId = local_6.TestCaseEntityId;
        local_12.SamplerIndices = local_6.SamplerIndices;
        local_12.SamplerStartedFlags = local_6.SamplerStartedFlags;
        Remove local_18;
        local_18.opCall();
        return;
    }
    void MoveComponent_ClientLogicSamplers(const FECSEntity &inout From, const FECSEntity &inout To) const
    {
        FC_TestCaseClientLogicSamplers local_6;
        FC_TestCaseClientLogicSamplers local_12;
        local_12.BeginTime = local_6.BeginTime;
        local_12.Actions = local_6.Actions;
        local_12.StartedFlags = local_6.StartedFlags;
        local_12.TestCaseEntityId = local_6.TestCaseEntityId;
        local_12.SamplerIndices = local_6.SamplerIndices;
        local_12.SamplerStartedFlags = local_6.SamplerStartedFlags;
        Remove local_18;
        local_18.opCall();
        return;
    }
    void MoveComponent_ClientViewSamplers(const FECSEntity &inout From, const FECSEntity &inout To) const
    {
        FC_TestCaseClientViewSamplers local_6;
        FC_TestCaseClientViewSamplers local_12;
        local_12.BeginTime = local_6.BeginTime;
        local_12.Actions = local_6.Actions;
        local_12.StartedFlags = local_6.StartedFlags;
        local_12.TestCaseEntityId = local_6.TestCaseEntityId;
        local_12.SamplerIndices = local_6.SamplerIndices;
        local_12.SamplerStartedFlags = local_6.SamplerStartedFlags;
        Remove local_18;
        local_18.opCall();
        return;
    }
    void RetargetTestCaseToNewPawn(const FECSEntityId &inout TestCaseEntityId, const FECSEntityId &inout FromId, const FECSEntityId &inout ToId) const
    {
        int local_22 = 0;
        int local_64;
        Has local_14;
        if (!(FECSEntity(TestCaseEntityId).IsValid()) || !(local_14.opCall()))
        {
            return;
        }
        TMap<FName, FECSEntityId> local_42;
        bool local_43 = false;
        FECSEntityId local_63;
        for (auto& local_62 : local_22.GetEntityMap())
        {
            if ((local_63 == FromId))
            {
                local_42.Add(local_62.GetKey(), ToId);
                local_43 = true;
                continue;
            }
            local_42.Add(local_62.GetKey());
        }
        if (local_43)
        {
            local_22.SetEntityMap(local_42);
        }
        int local_65 = FromId;
        local_64 = local_65;
        if (local_22.GetIssuerPawnEntityId() == local_64)
        {
            local_22.SetIssuerPawnEntityId(ToId);
        }
        return;
    }
    UFUNCTION()
    void ServerJob_TestCaseTickAction(const FECSEntity &inout Entity, FC_TestCaseActions &inout ActionComp, const FCS_FixedTime &inout FixedTime, const FCS_LocalTime &inout LocalTime) const
    {
        int local_1 = int(ActionComp._base_FC_GTCActionContainer);
        if (ActionComp.Actions.Num() == 0)
        {
            Remove local_72;
            local_72.opCall();
        }
        return;
    }
    UFUNCTION()
    void ServerJob_TestCaseTickLazyBind(const FECSEntity &inout Entity, FC_TestCase &inout TestCase, FC_TestCaseRoundCache &inout RoundCache, FC_TestCaseLazyBindMonsters &inout LazyBind, const FCS_FixedTime &inout FixedTime) const
    {
        FFPTime local_6 = (FFPTime(FixedTime.Time) - RoundCache.BeginTime);
        int local_7 = 0;
        while (local_7 < 0)
        {
            FGTCLazyBindMonster& local_12 = LazyBind.PendingMonsters[local_7];
            if (local_12.bBound)
            {
            }
            else
            {
                if (local_6.GetTicks() < local_12.FirstStartTime.GetTicks())
                {
                }
                else
                {
                    FECSEntity local_24 = this.FindGameSpawnedMonster(TestCase, local_12);
                    if (!(local_24.IsValid()))
                    {
                    }
                    else
                    {
                        TMap<FName, FECSEntityId> local_44 = TestCase.GetEntityMap();
                        local_24.GetId();
                        TestCase.SetEntityMap(local_44);
                        TMap<FName, FECSEntityId> local_66 = TestCase.GetAICommandEntityAliasMap();
                        local_24.GetId();
                        TestCase.SetAICommandEntityAliasMap(local_66);
                        this.BindLazyMonster(Entity, RoundCache, local_12, local_24);
                        local_12.bBound = true;
                    }
                }
            }
            ++local_7;
        }
        return;
    }
    FECSEntity FindGameSpawnedMonster(const FC_TestCase &inout TestCase, const FGTCLazyBindMonster &inout Pending) const
    {
        FECSEntity local_4;
        int local_152 = 0;
        bool local_171;
        int local_198 = 0;
        float local_6 = -1.0;
        FECSRuntimeView local_48 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_52;
        local_52.opCall();
        Include local_56;
        local_56.opCall();
        Exclude(local_48).opCall();
        FECSRuntimeViewIterator local_94 = local_48.Iterator();
        FECSEntityId local_191;
        for (; local_94.CanProceed;)
        {
            const FECSEntity& local_132 = local_94.Proceed();
            if (!(local_132.IsValid()))
            {
                continue;
            }
            Has local_136;
            bool local_129 = local_136.opCall();
            if (local_129)
            {
                continue;
            }
            Has local_140;
            local_129 = local_140.opCall();
            if (local_129)
            {
                local_129 = true;
            }
            else
            {
                Has local_144;
                local_129 = local_144.opCall();
            }
            if (local_129)
            {
                continue;
            }
            if (!(::FASCommonUtils::IsMonsterPrefab(local_132)))
            {
                continue;
            }
            FString local_168 = local_152.PrefabClass.ToSoftObjectPath().ToString();
            if (!(local_168.Contains(Pending.PrefabClassToken, ESearchCase(1), ESearchDir(0))))
            {
                continue;
            }
            local_171 = false;
            for (auto& local_190 : TestCase.GetEntityMap())
            {
                local_190;
                if ((local_191 == local_132.GetId()))
                {
                    local_171 = true;
                    break;
                }
            }
            if (local_171)
            {
                continue;
            }
            float local_8 = (FVector(local_198.GetPosition()) - Pending.MatchLocation).SizeSquared();
            if (local_6 < 0.0 || (local_8 < local_6))
            {
                local_6 = local_8;
                local_4 = local_132;
            }
        }
        return local_4;
    }
    void BindLazyMonster(const FECSEntity &inout TestCaseEntity, FC_TestCaseRoundCache &inout RoundCache, const FGTCLazyBindMonster &inout Pending, const FECSEntity &inout TargetEntity) const
    {
        bool local_11;
        int local_18 = 0;
        int local_36 = 0;
        int local_42 = 0;
        int local_58 = 0;
        ::FGTCUtils::RegisterBehaviorTreeResource(TargetEntity);
        Has local_4;
        Has local_10;
        if (local_4.opCall() && !(local_10.opCall()))
        {
            if (!(FECSEntity(local_18.GetControllerEntity()).IsValid()))
            {
                local_11 = false;
            }
            else
            {
                Has local_30;
                local_11 = local_30.opCall();
            }
            if (local_11)
            {
                local_36.SetbShouldRun(false);
                local_42.ControllerEntity = local_18.GetControllerEntity();
                XLog(ELog(40), FString().Append("[GTC] LazyBind BT suppressed for ").Append(Pending.UniqueName).Append(", Controller=").Append(local_18.GetControllerEntity()));
            }
        }
        Remove local_52;
        local_52.opCall();
        local_58.Init(TestCaseEntity.GetId(), int(RoundCache.BeginFrame), RoundCache.BeginTime);
        FName local_84;
        for (auto& local_74 : RoundCache.ActionConfigs)
        {
            if ((FInstancedStruct::GetPtr(local_74).opCall() == nullptr) || !((local_84 == Pending.UniqueName)))
            {
                continue;
            }
            if ((FInstancedStruct::GetPtr(local_74).opCall() == nullptr))
            {
                local_58.Actions.Add(local_74);
            }
        }
        FC_TestCaseReadyTag local_98;
        Assign local_96;
        local_96.opCall(local_98);
        XLog(ELog(40), FString().Append("[GTC] LazyBind: '").Append(Pending.UniqueName).Append("' -> entity ").Append(TargetEntity.GetId()).Append(", actions=").Append(local_58.Actions.Num()));
        return;
    }
    UFUNCTION()
    void ServerJob_TestCaseTickSampler(const FECSEntity &inout Entity, FC_TestCaseServerSamplers &inout ActionComp, const FCS_FixedTime &inout FixedTime, const FCS_LocalTime &inout LocalTime) const
    {
        if (!(FECSEntity(ActionComp.TestCaseEntityId).IsValid()))
        {
            return;
        }
        return;
    }
    UFUNCTION()
    void ClientJob_HandleDispatchClientActions(const FCE_TestCaseDispatchClientActions &inout Event) const
    {
        int local_16 = 0;
        int local_24 = 0;
        bool local_47 = false;
        if (!(FECSEntity(Event.EntityId).IsValid()))
        {
            return;
        }
        local_16.Init(Event.Sender.GetId(), int(Event.BeginFrame), Event.BeginTime);
        local_24.Init(Event.Sender.GetId(), int(Event.BeginFrame), Event.BeginTime);
        for (auto& local_38 : Event.Actions)
        {
            if ((!((FInstancedStruct::GetPtr(local_38).opCall() == nullptr))) && local_47)
            {
                local_24.Actions.Add(local_38);
            }
        }
        local_16.SamplerIndices = Event.SamplerIndices;
        return;
    }
    UFUNCTION()
    void ClientJob_HandleDispatchLogicClientActions(const FCE_TestCaseDispatchClientActions &inout Event) const
    {
        int local_16 = 0;
        int local_24 = 0;
        if (!(FECSEntity(Event.EntityId).IsValid()))
        {
            return;
        }
        local_16.Init(Event.Sender.GetId(), int(Event.BeginFrame), Event.BeginTime);
        local_24.Init(Event.Sender.GetId(), int(Event.BeginFrame), Event.BeginTime);
        for (auto& local_38 : Event.FixedInputActions)
        {
            local_24.Actions.Add(local_38);
        }
        local_16.SamplerIndices = Event.SamplerIndices;
        return;
    }
    UFUNCTION()
    void ClientJob_TestCaseTickLocalInput(const FECSEntity &inout Entity, FC_TestCaseClientInputs &inout ActionComp, const FCS_FixedTime &inout FixedTime, const FCS_LocalTime &inout LocalTime) const
    {
        int local_1 = int(ActionComp._base_FC_GTCActionContainer);
        if (ActionComp.Actions.Num() == 0)
        {
            Remove local_72;
            local_72.opCall();
        }
        return;
    }
    UFUNCTION()
    void ClientJob_TestCaseTickSampler(const FECSEntity &inout Entity, FC_TestCaseClientViewSamplers &inout ActionComp, const FCS_FixedTime &inout FixedTime, const FCS_LocalTime &inout LocalTime) const
    {
        if (!(FECSEntity(ActionComp.TestCaseEntityId).IsValid()))
        {
            return;
        }
        return;
    }
    UFUNCTION()
    void ClientJob_TestCaseFixedFrameSampler(const FECSEntity &inout Entity, FC_TestCaseClientLogicSamplers &inout ActionComp, const FCS_FixedTime &inout FixedTime, const FCS_LocalTime &inout LocalTime) const
    {
        if (!(FECSEntity(ActionComp.TestCaseEntityId).IsValid()))
        {
            return;
        }
        return;
    }
    UFUNCTION()
    void ClientJob_TestCaseTickCameraView(const FECSEntity &inout Entity, FC_TestCaseCameraViewPlayback &inout Playback, const FCS_FixedTime &inout FixedTime) const
    {
        float32 local_40;
        int local_66 = 0;
        TArray<FGTCCameraViewConfig> local_2 = Playback.CameraViewConfigs;
        if (local_2.Num() == 0)
        {
            return;
        }
        float local_12 = (FFPTime(FixedTime.Time) - Playback.BeginTime).ToSeconds();
        float32 local_13 = float32(local_12);
        while ((int(Playback.CurrentIndex) < (local_2.Num() - 1) && (((local_2[(int(Playback.CurrentIndex) + 1)].Time) <= local_13))))
        {
            ++Playback.CurrentIndex;
        }
        FVector local_22;
        FRotator local_28;
        int local_30 = Playback.CurrentIndex;
        if (local_30 >= (local_2.Num() - 1))
        {
            float32 local_29;
            FGTCCameraViewConfig& local_32 = local_2[local_2.Num() - 1];
            local_22 = local_32.Position;
            local_28 = local_32.Rotation;
            local_29 = local_32.FOV;
        }
        else
        {
            float32 local_29;
            FGTCCameraViewConfig& local_32_2 = local_2[local_30];
            FGTCCameraViewConfig& local_34 = local_2[local_30 + 1];
            float32 local_6 = local_34.Time;
            float32 local_36 = local_32_2.Time;
            if (local_6 > local_36)
            {
                local_6 = local_13 - local_32_2.Time;
                local_36 = local_34.Time;
                local_36 = local_36 - local_32_2.Time;
                local_40 = FMath::Clamp(local_6 / local_36, 0.0f, 1.0f);
            }
            else
            {
                local_40 = 0.0f;
            }
            local_22 = FMath::Lerp(local_32_2.Position, local_34.Position, local_40);
            float32 local_48 = FMath::Lerp(local_32_2.Rotation.Roll, local_34.Rotation.Roll, local_40);
            float local_58 = FMathUtils::LerpDegree(float32(local_32_2.Rotation.Yaw), float32(local_34.Rotation.Yaw), local_40);
            local_28 = FRotator(FMath::Lerp(local_32_2.Rotation.Pitch, local_34.Rotation.Pitch, local_40), local_58, local_48);
            local_29 = FMath::Lerp(local_32_2.FOV, local_28, local_40);
        }
        FECSWorldPtr local_60 = this.GetECSWorld();
        local_66.ViewDir = local_28;
        return;
    }
    UFUNCTION()
    void ClientJob_TestCaseTickDetailedData(const FECSEntity &inout Entity, FC_TestCaseRoundCache &inout RoundCache, const FCS_FixedTime &inout FixedTime) const
    {
        if (RoundCache.DetailedDataLists.Num() == 0)
        {
            return;
        }
        int local_2 = RoundCache.DetailedDataCurrentIndex;
        int local_1 = RoundCache.DetailedDataLists.Num();
        if (local_2 >= local_1)
        {
            return;
        }
        FFPTime local_10 = (FFPTime(FixedTime.Time) - RoundCache.BeginTime);
        FFPTime local_6 = (FFPTime(FixedTime.LastTime) - RoundCache.BeginTime);
        while (local_2 < local_1)
        {
            FDetailedData& local_14 = RoundCache.DetailedDataLists[int(RoundCache.DetailedDataCurrentIndex)];
            FFPTime local_16 = FFPTime(local_14.TimeStamp.FrameTime);
            if (local_16.opCmp(local_10) > 0)
            {
                break;
            }
            if (local_16.opCmp(local_6) >= 0)
            {
                if (!(local_14.ConsoleCommands.IsEmpty()))
                {
                    TArray<FString> local_20;
                    local_14.ConsoleCommands.ParseIntoArray(local_20, ";", true);
                    for (auto& local_34 : local_20)
                    {
                        if (!(local_34.IsEmpty()))
                        {
                            UKLGTCTestCaseLoader::GTCEnqueueConsoleCommand(local_34);
                        }
                    }
                }
            }
            ++RoundCache.DetailedDataCurrentIndex;
        }
        return;
    }
    UFUNCTION()
    void ServerJob_GatherTestCaseResult(const FCE_TestCaseFinished &inout Event) const
    {
        int local_2 = 0;
        FECSEntity local_6 = FECSEntity(int(Event.GameTestEntityId));
        if (!(local_6.IsValid()))
        {
            return;
        }
        Modify local_18;
        FC_GameTest& local_20 = local_18.opCall();
        if (local_20)
        {
            int local_7 = local_2.GetId();
            ::FGTCUtils::RemoveEntity(local_2);
            if (local_20.RuntimeEntityIds.Num() == 0)
            {
                XLog(ELog(40), FString().Append("GameTest All Finished: ").Append(local_6.GetEntityName()));
                FFPTime local_38 = FFPTime(-1);
                FCE_GameTestFinished local_40;
                local_40.GameTestId = int(local_20.GameTestId);
                ::BlueprintFunctions_Ecology::SetPauseGlobalAI(FGameplayTag::RequestGameplayTag(n"AI.ControlledByLevel", true), false);
                ::FGTCUtils::RemoveEntity(local_6);
            }
        }
        return;
    }
    UFUNCTION()
    void ServerJob_GTCDeferredDestroy(const FECSEntity &inout Entity) const
    {
        ::FGTCUtils::RemoveEntity(Entity);
        return;
    }
    FGTCActionContext MakeActionContext(const FECSEntityId &inout InEntityId, const int InBeginFrame, const FFPTime &inout InBeginTime, const FCS_FixedTime &inout InFixedTime, const FCS_LocalTime &inout InLocalTime) const
    {
        FGTCActionContext local_32;
        local_32.TestCaseEntityId = InEntityId;
        local_32.FixedTime = InFixedTime;
        local_32.LocalTime = InLocalTime;
        int local_33 = int(InFixedTime.Frame) - InBeginFrame;
        local_32.CurTime = (FFPTime(InFixedTime.Time) - InBeginTime);
        local_32.LastTime = (FFPTime(InFixedTime.LastTime) - InBeginTime);
        return local_32;
    }
    FECSEntity FindReusableLevelEntity(const FGTCEntityConfig &inout EntityConfig, const TSet<FECSEntityId> &inout UsedEntities) const
    {
        int local_182 = 0;
        int local_188 = 0;
        if (EntityConfig.ReuseExistingRadius <= 0.0f)
        {
            return FECSEntity();
        }
        FSoftObjectPath local_24 = EntityConfig.PrefabToSpawn.ToSoftObjectPath();
        if (local_24.IsNull())
        {
            return FECSEntity();
        }
        FVector local_30(EntityConfig.InitTransform.GetLocation());
        float local_44 = -1.0;
        FECSEntity local_48;
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Exclude(local_88).opCall();
        FECSRuntimeViewIterator local_134 = local_88.Iterator();
        for (; local_134.CanProceed;)
        {
            const FECSEntity& local_170 = local_134.Proceed();
            if (UsedEntities.Contains(local_170.GetId()))
            {
                continue;
            }
            Has local_176;
            bool local_3 = local_176.opCall();
            if (local_3)
            {
                continue;
            }
            if (!((local_182.PrefabClass.ToSoftObjectPath() == local_24)))
            {
                continue;
            }
            float local_38 = (FVector(local_188.GetPosition()) - local_30).SizeSquared();
            if (local_38 > (EntityConfig.ReuseExistingRadius * EntityConfig.ReuseExistingRadius))
            {
                continue;
            }
            if ((local_44 < 0.0 || (local_38 < local_44)))
            {
                local_44 = local_38;
                local_48 = local_170;
            }
        }
        return local_48;
    }
    void ResetEntity(const FECSEntity &inout TargetEntity, const FGTCEntityConfig &inout EntityConfig, const FC_TestCaseRoundCache &inout RoundCache, const FCS_FixedTime &inout FixedTime, const bool bIsReusedLevelEntity = false) const
    {
        int local_8 = 0;
        int local_26 = 0;
        int local_36 = 0;
        if ((!(bIsReusedLevelEntity) && EntityConfig.bDisableCollision))
        {
            local_8.SetCounter((local_8.GetCounter() + 1));
            Modify local_14;
            FC_Collision& local_16 = local_14.opCall();
            if (local_16)
            {
                local_16.GetMoveCollisionOptions().IncreaseDisableCounter();
                local_16.GetPushColliderOptions().IncreaseDisableCounter();
            }
        }
        if (!(bIsReusedLevelEntity) && !((EntityConfig.InitState == NAME_None)))
        {
            ::FGTCUtils::TransitToESMState(TargetEntity, EntityConfig.InitState, EntityConfig.InitStateTime);
        }
        if (!(bIsReusedLevelEntity) && (int(EntityConfig.InitFaction) != 0))
        {
            local_26.SetFactionId(EntityConfig.InitFaction);
        }
        bool local_1_2 = !(bIsReusedLevelEntity) && ::FASCommonUtils::IsMonsterPrefab(TargetEntity);
        if (!(local_1_2))
        {
            local_1_2 = false;
        }
        else
        {
            Has local_30;
            local_1_2 = local_30.opCall();
        }
        if (local_1_2)
        {
            if (local_36.HasAttribute(Attribute::HPMax) && local_36.HasAttribute(Attribute::HP))
            {
                int local_37 = 1232348160;
                FGameAttributeUtils::DebugSetBaseValue(TargetEntity, Attribute::HPMax, FixedTime.Time, 1000000.0f);
                FGameAttributeUtils::ChangeConsumeValue(TargetEntity, Attribute::HP, FixedTime.Time, 1000000.0f, -1.0f);
            }
        }
        FTransform local_64;
        if (RoundCache.ManualPrefabsResetTransform.Find(TargetEntity.GetId(), local_64))
        {
            TargetEntity.TeleportTo(local_64.GetLocation(), local_64.GetRotation(), FFPTime(-1));
            return;
        }
        TargetEntity.TeleportTo(EntityConfig.InitTransform.GetLocation(), EntityConfig.InitTransform.GetRotation(), FFPTime(-1));
        return;
    }
    int FindCurrentFixedInputIndex(const TArray<FInstancedStruct> &inout Actions, const FFPTime &inout CurTime) const
    {
        int local_1 = -1;
        int local_3 = 0;
        int local_2 = Actions.Num() - 1;
        FFPTime local_18;
        while (local_3 <= local_2)
        {
            int local_8 = FMath::IntegerDivisionTrunc(local_3 + local_2, 2);
            if (!((FInstancedStruct::GetPtr(Actions[local_8]).opCall() == nullptr)) && (local_18.opCmp(CurTime) <= 0))
            {
                local_1 = local_8;
                local_3 = local_8 + 1;
            }
            else
            {
                local_2 = local_8 - 1;
            }
        }
        return local_1;
    }
    void TickFixedInputActions(const FECSEntity &inout Entity, FC_TestCaseServerFixedInputs &inout ActionComp, const FCS_FixedTime &inout FixedTime, const FCS_LocalTime &inout LocalTime) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void TickFixedInputActions(const FECSEntity &inout Entity, FC_TestCaseClientFixedInputs &inout ActionComp, const FCS_FixedTime &inout FixedTime, const FCS_LocalTime &inout LocalTime) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void InterpolateFixedInputCamera(const FECSEntity &inout Entity, TArray<FInstancedStruct> &inout Actions, const int Idx, const FGTCActionContext &inout Context) const
    {
        int local_10 = 0;
        float local_26 = 0.0;
        int local_40 = 0;
        bool local_51;
        int local_2 = Actions.Num();
        if ((Idx + 1) >= local_2)
        {
            return;
        }
        FECSEntity::Get<FC_LockTarget> local_8 = FECSEntity::Get<FC_LockTarget>(Entity);
        if (local_10 && local_10.GetTargetEntity().IsValid() && (int(local_10.GetType()) == 2))
        {
            return;
        }
        if ((FInstancedStruct::GetPtr<FGTCFixedInputAction>(Actions[Idx]).opCall() == nullptr) || ((FInstancedStruct::GetPtr<FGTCFixedInputAction>(Actions[(Idx + 1)]).opCall()) == nullptr))
        {
            return;
        }
        float32 local_27 = float32(local_26);
        float32 local_28 = float32(local_26) - local_27;
        if (local_28 <= 0.0f)
        {
            return;
        }
        local_26 = Context.CurTime.ToSeconds();
        float32 local_33 = FMath::Clamp(((float32(local_26) - local_27) / local_28), 0.0f, 1.0f);
        if (local_33 < 0.001f)
        {
            return;
        }
        int local_41 = 0;
        FName local_43;
        FVector local_50;
        FName local_62;
        for (; local_41 < local_2; ++local_41)
        {
            if (!((local_43 == n"CharacterViewDirection")) && !((local_43 == n"CharacterViewOffset")) && !((local_43 == n"CharacterCorrectedViewDirection")))
            {
                continue;
            }
            local_51 = false;
            FVector local_58;
            int local_59 = 0;
            for (; local_59 < 0; ++local_59)
            {
                if ((local_62 == local_43))
                {
                    local_51 = true;
                    break;
                }
            }
            if (!(local_51))
            {
                continue;
            }
            FVector local_68;
            if ((local_43 == n"CharacterViewDirection") || (local_43 == n"CharacterCorrectedViewDirection"))
            {
                local_26 = local_58.X;
                local_26 = local_26 - local_50.X;
                if (local_26 > 180.0)
                {
                    local_26 = local_26 - 360.0;
                }
                else
                {
                    if (local_26 < -180.0)
                    {
                        local_26 = local_26 + 360.0;
                    }
                }
                local_68.X = (local_50.X + (local_26 * local_33));
                local_68.Y = (local_50.Y + ((local_58.Y - local_50.Y) * local_33));
                local_68.Z = (local_50.Z + ((local_58.Z - local_50.Z) * local_33));
            }
            else
            {
                float local_70_2 = local_58.X - local_50.X;
                local_68.X = (local_50.X + (local_70_2 * local_33));
                float local_74_2 = local_58.Y - local_50.Y;
                float local_76_2 = local_33;
                local_68.Y = (local_50.Y + (local_74_2 * local_76_2));
                local_70_2 = local_58.Z - local_50.Z;
                local_76_2 = local_70_2 * local_33;
                local_68.Z = (local_50.Z + local_76_2);
            }
            FInputData local_88;
            local_88.Name = local_43;
            local_88.Value = local_68;
            local_88.Time = Context.FixedTime.Time;
            local_40.GetOrAddPacket(int(Context.FixedTime.Frame)).ReplaceOrAdd(local_88);
        }
        return;
    }
    void ApplyFixedInputCamera(const FECSEntity &inout Entity, TArray<FInstancedStruct> &inout Actions, const int Idx, const FGTCActionContext &inout Context) const
    {
        int local_6 = 0;
        int local_26 = 0;
        float32 local_43 = 0.0f;
        if (local_6 && local_6.GetTargetEntity().IsValid() && ((int(local_6.GetType()) == 2)))
        {
            return;
        }
        if ((FInstancedStruct::GetPtr(Actions[Idx]).opCall() == nullptr))
        {
            return;
        }
        int local_27 = 0;
        FName local_29;
        for (; local_27 < 0; ++local_27)
        {
            if (!((local_29 == n"CharacterViewDirection")) && !((local_29 == n"CharacterViewOffset")) && !((local_29 == n"CharacterCorrectedViewDirection")))
            {
                continue;
            }
            FInputData local_40;
            local_40.Name = local_29;
            local_40.Time = (FFPTime(Context.FixedTime.Time) + FFPTime(local_43));
            local_26.GetOrAddPacket(int(Context.FixedTime.Frame)).ReplaceOrAdd(local_40);
        }
        return;
    }
    FRotator SampleRecordedViewDir(const TArray<FInstancedStruct> &inout Actions, const FFPTime &inout BeginTime, const FFPTime &inout AtWorldTime) const
    {
        FName local_33;
        float local_52 = 0.0;
        FFPTime local_4 = (AtWorldTime - BeginTime);
        int local_6 = this.FindCurrentFixedInputIndex(Actions, local_4);
        if (local_6 < 0)
        {
            return FRotator();
        }
        if ((FInstancedStruct::GetPtr(Actions[local_6]).opCall() == nullptr))
        {
            return FRotator();
        }
        FVector local_28;
        bool local_29 = false;
        int local_30 = 0;
        for (; local_30 < 0; ++local_30)
        {
            if ((local_33 == n"CharacterViewDirection"))
            {
                local_29 = true;
                break;
            }
        }
        if (!(local_29))
        {
            return FRotator();
        }
        FVector local_40 = local_28;
        if ((local_6 + 1) < Actions.Num())
        {
            int local_5 = local_6 + 1;
            if (!((FInstancedStruct::GetPtr(Actions[local_5]).opCall() == nullptr)))
            {
                bool local_49;
                FVector local_48;
                local_49 = false;
                int local_30_2 = 0;
                for (; local_30_2 < local_5; ++local_30_2)
                {
                    if ((local_33 == n"CharacterViewDirection"))
                    {
                        local_49 = true;
                        break;
                    }
                }
                if (local_49)
                {
                    float32 local_53 = float32(local_52);
                    float32 local_54 = float32(local_52) - local_53;
                    if (local_54 > 0.0f)
                    {
                        local_52 = local_4.ToSeconds();
                        float32 local_59 = FMath::Clamp(((float32(local_52) - local_53) / local_54), 0.0f, 1.0f);
                        local_52 = local_48.X;
                        local_52 = local_52 - local_28.X;
                        if (local_52 > 180.0)
                        {
                            local_52 = local_52 - 360.0;
                        }
                        else
                        {
                            if (local_52 < -180.0)
                            {
                                local_52 = local_52 + 360.0;
                            }
                        }
                        local_40.X = (local_28.X + (local_52 * local_59));
                        local_40.Y = (local_28.Y + ((local_48.Y - local_28.Y) * local_59));
                        local_40.Z = (local_28.Z + ((local_48.Z - local_28.Z) * local_59));
                    }
                }
            }
        }
        return FRotator(local_40.Y, local_40.X, local_40.Z);
    }
    void ExecuteSamplersByIndex(const FECSEntity &inout Entity, TArray<FInstancedStruct> &inout SamplerConfigs, TArray<int> &inout SamplerIndices, TArray<bool> &inout SamplerStartedFlags, const FGTCActionContext &inout Context) const
    {
        int local_5;
        FGTCAction& local_16;
        if (SamplerStartedFlags.Num() != SamplerIndices.Num())
        {
            SamplerStartedFlags.SetNum(SamplerIndices.Num());
            int local_4 = 0;
            for (; local_4 < SamplerStartedFlags.Num(); )
            {
                SamplerStartedFlags[local_4] = false;
                ++local_4;
            }
        }
        int local_4_2 = 0;
        for (; local_4_2 < SamplerIndices.Num(); ++local_4_2)
        {
            local_5 = SamplerIndices[local_4_2];
            if (local_5 < 0 || (local_5 >= SamplerConfigs.Num()))
            {
                continue;
            }
            if ((FInstancedStruct::GetMutablePtr(SamplerConfigs[local_5]).opCall() == nullptr))
            {
                continue;
            }
            FFPTime local_18 = FFPTime(local_16.StartTime);
            if (local_18.opCmp(Context.CurTime) > 0)
            {
                continue;
            }
            if (!(SamplerStartedFlags[local_4_2]))
            {
                SamplerStartedFlags[local_4_2] = true;
                local_16.OnStart(Entity, Context);
            }
            if (int(local_16.ActionType) == 1)
            {
                local_16.Execute(Entity, Context);
                continue;
            }
            if (int(local_16.ActionType) == 2)
            {
                local_18 = FFPTime(Context.LastTime);
                if (local_18.opCmp(local_16.EndTime) < 0)
                {
                    local_16.Execute(Entity, Context);
                }
                continue;
            }
            local_16.Execute(Entity, Context);
        }
        return;
    }
    void ExecuteAndRemoveActions(const FECSEntity &inout Entity, TArray<FInstancedStruct> &inout Actions, TArray<bool> &inout StartedFlags, const FGTCActionContext &inout Context) const
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void ApplyCheckpointIfPresent(const FECSEntity &inout TargetEntity, FC_TestCaseServerFixedInputs &inout ActionComp, const FFPTime &inout CurTime) const
    {
        int local_22 = 0;
        float local_30;
        int local_1 = ActionComp.CheckpointFrames.Num();
        if (local_1 == 0)
        {
            return;
        }
        int local_4 = ActionComp.CheckpointCursor;
        while (local_4 < ActionComp.CheckpointFrames.Num() && (FFPTime(ActionComp.CheckpointFrames[local_4].FrameTime).opCmp(CurTime) <= 0))
        {
            ++local_4;
        }
        --local_4;
        if ((local_4 < 0 || ((local_4 == int(ActionComp.LastAppliedCheckpointIndex)))))
        {
            return;
        }
        int local_1_2 = UKLGTCTestCaseLoader::GetReplayCheckpointInterval();
        if ((local_1_2 > 0 && (int(ActionComp.LastAppliedCheckpointIndex) >= 0) && ((local_4 - int(ActionComp.LastAppliedCheckpointIndex)) < local_1_2)))
        {
            return;
        }
        ActionComp.LastAppliedCheckpointIndex = local_4;
        ActionComp.CheckpointCursor = local_4;
        FGTCCheckpointFrame& local_10 = ActionComp.CheckpointFrames[local_4];
        UKLGTCTestCaseLoader::SoftSyncCheckpoint(TargetEntity, local_10.Position, local_10.Rotation, local_10.Velocity, local_10.AngularVelocity, local_10.DesiredRotation, local_10.RelativeYaw, local_10.SpeedScale);
        bool local_7 = FECSEntity::Has<FC_ESMPlayer>(TargetEntity).opCall();
        if (local_7)
        {
            int local_2 = local_10.ESMStates.Num();
            int local_24 = FMath::Min(local_22.Player.GetSMRuntime().Num());
            int local_25 = 0;
            for (; local_25 < local_24; )
            {
                int local_23 = int(local_10.ESMStates[local_25].X);
                local_30 = local_10.ESMStates[local_25].Y;
                UKLGTCTestCaseLoader::SoftSyncESMTime(TargetEntity, local_25, local_23, local_30, float32(local_10.ESMStates[local_25].Z));
                ++local_25;
            }
        }
        return;
    }
    void ApplyAutoCheckpointIfPresent(const FECSEntity &inout TargetEntity, FC_TestCaseServerFixedInputs &inout ActionComp, const FFPTime &inout CurTime) const
    {
        if (ActionComp.AutoCheckpointFrames.Num() == 0)
        {
            return;
        }
        int local_4 = ActionComp.AutoCheckpointCursor;
        while (local_4 < ActionComp.AutoCheckpointFrames.Num() && (FFPTime(ActionComp.AutoCheckpointFrames[local_4].FrameTime).opCmp(CurTime) <= 0))
        {
            ++local_4;
        }
        --local_4;
        if ((local_4 < 0 || (local_4 == int(ActionComp.LastAppliedAutoCheckpointIndex))))
        {
            return;
        }
        ActionComp.LastAppliedAutoCheckpointIndex = local_4;
        ActionComp.AutoCheckpointCursor = local_4;
        FGTCCheckpointFrame& local_10 = ActionComp.AutoCheckpointFrames[local_4];
        UKLGTCTestCaseLoader::SoftSyncCheckpoint(TargetEntity, local_10.Position, local_10.Rotation, local_10.Velocity, local_10.AngularVelocity, local_10.DesiredRotation, local_10.RelativeYaw, local_10.SpeedScale);
        return;
    }
    bool TryCombineOutputJson(const FString &inout InJsonString, const TMap<FString, FString> &inout ResultMap, FString &out OutputJson) const
    {
        FString local_4;
        OutputJson = local_4;
        FString local_8 = InJsonString;
        for (auto& local_28 : ResultMap)
        {
            local_28;
            FString local_32 = local_4;
            FString local_38;
            local_8 = local_38;
        }
        FJsonObject local_42;
        if (!(local_42.LoadFromString(local_8)))
        {
            return false;
        }
        OutputJson = local_42.SaveToString(true);
        return true;
    }
    bool GenerateTestRoundOuput(const FString &inout GTCAssetName, const int Round, const int64 CurrntStartTicks, const int BeginFrame, FC_TestCaseSharedSamplers &inout SharedSamplers, FString &out JsonString) const
    {
        FString local_56;
        FString local_4;
        JsonString = local_4;
        FGTCTestCaseJsonOutput local_16;
        local_16.Round = Round;
        local_16.TestCaseName = GTCAssetName;
        local_16.BeginFrame = BeginFrame;
        TMap<FString, FString> local_36;
        int local_37 = 0;
        while (local_37 < 0)
        {
            if ((FInstancedStruct::GetMutablePtr(SharedSamplers.SamplerConfigs[local_37]).opCall() == nullptr))
            {
            }
            else
            {
                bool local_63;
                FString local_52;
                FString local_60 = FString();
                int local_62 = CurrntStartTicks;
                local_63 = false;
                if (!((FInstancedStruct::GetMutablePtr(SharedSamplers.SamplerConfigs[local_37]).opCall() == nullptr)))
                {
                    local_63 = local_62.TryCollectResult(local_52);
                }
                else
                {
                    if (!((FInstancedStruct::GetMutablePtr(SharedSamplers.SamplerConfigs[local_37]).opCall() == nullptr)))
                    {
                        local_63 = local_62.TryCollectResult(local_52);
                    }
                }
                if (local_63)
                {
                    local_16.SamplerResults.Add(local_56);
                    local_36.Add(local_56, local_52);
                }
                else
                {
                    XError(ELog(40), FString().Append("[ERROR] Failed To Replace ").Append(local_56));
                }
            }
            ++local_37;
        }
        if (FJsonObjectConverter::UStructToJsonObjectString(local_16, local_56, 0, 0, 0, true))
        {
            return this.TryCombineOutputJson(local_56, local_36, JsonString);
        }
        return false;
    }
    bool GenerateTestCaseOuput(const FName &inout EntityName, TMap<FString, FString> &inout CachedResult, FString &out OutputJson) const
    {
        FString local_4;
        OutputJson = local_4;
        FGTCGameTestJsonOutput local_12;
        local_12.TestEntityName = EntityName.ToString();
        for (auto& local_36 : CachedResult)
        {
            local_12.Results.Add(local_36.GetKey());
        }
        FString local_42;
        OutputJson = "";
        if (FJsonObjectConverter::UStructToJsonObjectString(local_12, local_42, 0, 0, 0, true))
        {
            return this.TryCombineOutputJson(local_42, CachedResult, OutputJson);
        }
        return false;
    }
    void RestoreSuppressedBT(const FECSEntity &inout TestCaseEntity) const
    {
        Has local_4;
        bool local_5;
        int local_12;
        int local_48 = 0;
        int local_64 = 0;
        if (!(local_4.opCall()))
        {
            return;
        }
        Has local_42;
        for (auto& local_30 : local_12.GetEntityMap())
        {
            FECSEntity local_34;
            if (!(local_34.IsValid()))
            {
                continue;
            }
            if (!(local_42.opCall()))
            {
                continue;
            }
            if (!(FECSEntity(local_48.ControllerEntity).IsValid()))
            {
                local_5 = false;
            }
            else
            {
                Has local_56;
                local_5 = local_56.opCall();
            }
            if (local_5)
            {
                local_64.SetbShouldRun(true);
                XLog(ELog(40), FString().Append("[GTC] BT restored for ").Append(local_30.GetKey()).Append(", Controller=").Append(local_48.ControllerEntity));
            }
            Remove local_74;
            local_74.opCall();
        }
        return;
    }
    FString GetOutputFilePathFor(const FC_TestCase &inout TestCase, const bool bIsClient) const
    {
        FString local_4 = FString().Append("GameTest_").Append(FPaths::GetBaseFilename(TestCase.GetGTCJsonAssetPath(), true));
        FString local_14;
        if (bIsClient)
        {
            local_14 = "_Client";
        }
        else
        {
            local_14 = "_Server";
        }
        return FString().Append(TestCase.GetOutputFolder()).Append(local_4).Append(local_14).Append(".json");
    }
    UFUNCTION()
    void Run_ServerJob_GameTestBegin() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_174 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.ServerJob_GameTestBegin(local_40, local_42, local_6);
                local_50.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Exclude(local_88).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_88.Iterator();
        for (; local_136.CanProceed;)
        {
            local_40 = local_136.Proceed();
            ++local_102;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ServerJob_GameTestBegin(local_174, local_42, local_6);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleGameTestRequestStart() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_GameTestRequestStart> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_GameTestRequestStart& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleGameTestRequestStart(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleGameTestRequestStop() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_GameTestRequestStop> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_GameTestRequestStop& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_HandleGameTestRequestStop(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_WatchIssuerConnection() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_166 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ServerJob_WatchIssuerConnection(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_94 = 0;
        FECSRuntimeViewIterator local_128 = local_84.Iterator();
        for (; local_128.CanProceed;)
        {
            local_36 = local_128.Proceed();
            ++local_94;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ServerJob_WatchIssuerConnection(local_166, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_94);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    void Monitor___JobTimer_Pre___ServerJob_GameTestBeginByTimer(const FC_GameTestStartTimer &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.StartAtTime;
        FName local_8 = FName("S_GameTestCase::ServerJob_GameTestBeginByTimer");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___ServerJob_GameTestBeginByTimer(const FC_GameTestStartTimer &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.StartAtTime;
        FName local_8 = FName("S_GameTestCase::ServerJob_GameTestBeginByTimer");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___ServerJob_GameTestBeginByTimer() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorGameTestStartTimerOnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___ServerJob_GameTestBeginByTimer(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorGameTestStartTimerOnActiveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___ServerJob_GameTestBeginByTimer(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___ServerJob_GameTestBeginByTimer() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorGameTestStartTimerOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___ServerJob_GameTestBeginByTimer(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorGameTestStartTimerOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___ServerJob_GameTestBeginByTimer(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_GameTestBeginByTimer() const
    {
        int local_6 = 0;
        int local_42 = 0;
        int local_50 = 0;
        int local_52 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        local_4.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_14 = local_4.GetExternalEntityList();
        FECSEntity local_32;
        for (auto& local_28 : local_14)
        {
            local_28;
            FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
            bool local_11 = false;
            bool local_35 = !(false);
            if (!(local_32.IsActive()) == local_35)
            {
                continue;
            }
            if (!(local_42))
            {
                continue;
            }
            FFPTime local_44 = local_42.StartAtTime;
            if (local_44.opCmp(0.0) < 0 || (local_42.StartAtTime == FPTIME_MAX))
            {
                continue;
            }
            if (local_11)
            {
                continue;
            }
            this.ServerJob_GameTestBeginByTimer(local_50, local_52, local_6);
            MarkModifiedIfDirty local_60;
            local_60.opCall(local_52);
        }
        local_4.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_HandleGameTestInitPrefab() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        MarkModifiedIfDirty local_46;
        int local_170 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ServerJob_HandleGameTestInitPrefab(local_36, local_38);
                local_46.opCall(local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_84.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ServerJob_HandleGameTestInitPrefab(local_170, local_38);
            local_46.opCall(local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TestCaseIInitPrefab() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_174 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.ServerJob_TestCaseIInitPrefab(local_40, local_42, local_6);
                local_50.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Exclude(local_88).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_88.Iterator();
        for (; local_136.CanProceed;)
        {
            local_40 = local_136.Proceed();
            ++local_102;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ServerJob_TestCaseIInitPrefab(local_174, local_42, local_6);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    void Monitor___JobTimer_Pre___ServerJob_TestCaseResetByTimer(const FC_TestCaseResetTimer &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetResetAtTime());
        FName local_8 = FName("S_GameTestCase::ServerJob_TestCaseResetByTimer");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___ServerJob_TestCaseResetByTimer(const FC_TestCaseResetTimer &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetResetAtTime());
        FName local_8 = FName("S_GameTestCase::ServerJob_TestCaseResetByTimer");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___ServerJob_TestCaseResetByTimer() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorTestCaseResetTimerOnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___ServerJob_TestCaseResetByTimer(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorTestCaseResetTimerOnActiveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___ServerJob_TestCaseResetByTimer(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___ServerJob_TestCaseResetByTimer() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorTestCaseResetTimerOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___ServerJob_TestCaseResetByTimer(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorTestCaseResetTimerOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___ServerJob_TestCaseResetByTimer(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TestCaseResetByTimer() const
    {
        int local_6 = 0;
        int local_42 = 0;
        int local_50 = 0;
        int local_52 = 0;
        int local_58 = 0;
        int local_64 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        local_4.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_14 = local_4.GetExternalEntityList();
        FECSEntity local_32;
        for (auto& local_28 : local_14)
        {
            local_28;
            FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
            bool local_11 = false;
            bool local_35 = !(false);
            if (!(local_32.IsActive()) == local_35)
            {
                continue;
            }
            if (!(local_42))
            {
                continue;
            }
            FFPTime local_44 = FFPTime(local_42.GetResetAtTime());
            if (local_44.opCmp(0.0) < 0 || (FFPTime(local_42.GetResetAtTime()) == FPTIME_MAX))
            {
                continue;
            }
            if (local_11)
            {
                continue;
            }
            this.ServerJob_TestCaseResetByTimer(local_50, local_52, local_58, local_64, local_6);
            MarkModifiedIfDirty local_72;
            local_72.opCall(local_58);
            MarkModifiedIfDirty local_76;
            local_76.opCall(local_64);
        }
        local_4.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    void Monitor___JobTimer_Pre___ClientJob_TestCaseResetByTimer(const FC_TestCaseResetTimer &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetResetAtTime());
        FName local_8 = FName("S_GameTestCase::ClientJob_TestCaseResetByTimer");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___ClientJob_TestCaseResetByTimer(const FC_TestCaseResetTimer &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetResetAtTime());
        FName local_8 = FName("S_GameTestCase::ClientJob_TestCaseResetByTimer");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    void Monitor___JobTimer_OnSync___ClientJob_TestCaseResetByTimer(const FC_TestCaseResetTimer &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = FFPTime(TimerComp.GetResetAtTime());
        FName local_8 = FName("S_GameTestCase::ClientJob_TestCaseResetByTimer");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___ClientJob_TestCaseResetByTimer() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorTestCaseResetTimerOnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___ClientJob_TestCaseResetByTimer(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorTestCaseResetTimerOnActiveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___ClientJob_TestCaseResetByTimer(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___ClientJob_TestCaseResetByTimer() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorTestCaseResetTimerOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___ClientJob_TestCaseResetByTimer(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorTestCaseResetTimerOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___ClientJob_TestCaseResetByTimer(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_OnSync___ClientJob_TestCaseResetByTimer() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorTestCaseResetTimerOnModifyView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_OnSync___ClientJob_TestCaseResetByTimer(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorTestCaseResetTimerOnActiveView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_OnSync___ClientJob_TestCaseResetByTimer(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TestCaseResetByTimer() const
    {
        int local_6 = 0;
        int local_42 = 0;
        int local_50 = 0;
        int local_52 = 0;
        int local_58 = 0;
        int local_64 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        local_4.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_14 = local_4.GetExternalEntityList();
        FECSEntity local_32;
        for (auto& local_28 : local_14)
        {
            local_28;
            FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
            bool local_11 = false;
            bool local_35 = !(false);
            if (!(local_32.IsActive()) == local_35)
            {
                continue;
            }
            if (!(local_42))
            {
                continue;
            }
            FFPTime local_44 = FFPTime(local_42.GetResetAtTime());
            if (local_44.opCmp(0.0) < 0 || (FFPTime(local_42.GetResetAtTime()) == FPTIME_MAX))
            {
                continue;
            }
            if (local_11)
            {
                continue;
            }
            this.ClientJob_TestCaseResetByTimer(local_50, local_52, local_58, local_64, local_6);
            MarkModifiedIfDirty local_68;
            local_68.opCall(local_58);
        }
        local_4.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TestCaseDispachAction() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_174 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.ClientJob_TestCaseDispachAction(local_40, local_6, local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_84 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_84).opCall();
        Exclude(local_84).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_102 = 0;
        FECSRuntimeViewIterator local_136 = local_84.Iterator();
        for (; local_136.CanProceed;)
        {
            local_40 = local_136.Proceed();
            ++local_102;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ClientJob_TestCaseDispachAction(local_174, local_6, local_42);
        }
        local_4.UpdateCachedEntityCount(local_102);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    void Monitor___JobTimer_Pre___ServerJob_TestCaseStartByTimer(const FC_TestCaseStartTimer &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.StartAtTime;
        FName local_8 = FName("S_GameTestCase::ServerJob_TestCaseStartByTimer");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___ServerJob_TestCaseStartByTimer(const FC_TestCaseStartTimer &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.StartAtTime;
        FName local_8 = FName("S_GameTestCase::ServerJob_TestCaseStartByTimer");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___ServerJob_TestCaseStartByTimer() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorTestCaseStartTimerOnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___ServerJob_TestCaseStartByTimer(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorTestCaseStartTimerOnActiveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___ServerJob_TestCaseStartByTimer(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___ServerJob_TestCaseStartByTimer() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorTestCaseStartTimerOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___ServerJob_TestCaseStartByTimer(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorTestCaseStartTimerOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___ServerJob_TestCaseStartByTimer(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TestCaseStartByTimer() const
    {
        int local_6 = 0;
        int local_42 = 0;
        int local_50 = 0;
        int local_52 = 0;
        int local_58 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        local_4.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_14 = local_4.GetExternalEntityList();
        FECSEntity local_32;
        for (auto& local_28 : local_14)
        {
            local_28;
            FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
            bool local_11 = false;
            bool local_35 = !(false);
            if (!(local_32.IsActive()) == local_35)
            {
                continue;
            }
            if (!(local_42))
            {
                continue;
            }
            FFPTime local_44 = local_42.StartAtTime;
            if (local_44.opCmp(0.0) < 0 || (local_42.StartAtTime == FPTIME_MAX))
            {
                continue;
            }
            if (local_11)
            {
                continue;
            }
            this.ServerJob_TestCaseStartByTimer(local_50, local_52, local_58, local_6);
            MarkModifiedIfDirty local_66;
            local_66.opCall(local_58);
        }
        local_4.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    void Monitor___JobTimer_Pre___ClientJob_TestCaseStartByTimer(const FC_TestCaseStartTimer &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.StartAtTime;
        FName local_8 = FName("S_GameTestCase::ClientJob_TestCaseStartByTimer");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___ClientJob_TestCaseStartByTimer(const FC_TestCaseStartTimer &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.StartAtTime;
        FName local_8 = FName("S_GameTestCase::ClientJob_TestCaseStartByTimer");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    void Monitor___JobTimer_OnSync___ClientJob_TestCaseStartByTimer(const FC_TestCaseStartTimer &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.StartAtTime;
        FName local_8 = FName("S_GameTestCase::ClientJob_TestCaseStartByTimer");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___ClientJob_TestCaseStartByTimer() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorTestCaseStartTimerOnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___ClientJob_TestCaseStartByTimer(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorTestCaseStartTimerOnActiveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___ClientJob_TestCaseStartByTimer(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___ClientJob_TestCaseStartByTimer() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorTestCaseStartTimerOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___ClientJob_TestCaseStartByTimer(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorTestCaseStartTimerOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___ClientJob_TestCaseStartByTimer(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_OnSync___ClientJob_TestCaseStartByTimer() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorTestCaseStartTimerOnModifyView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_OnSync___ClientJob_TestCaseStartByTimer(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorTestCaseStartTimerOnActiveView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_OnSync___ClientJob_TestCaseStartByTimer(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TestCaseStartByTimer() const
    {
        int local_6 = 0;
        int local_42 = 0;
        int local_50 = 0;
        int local_52 = 0;
        int local_58 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        local_4.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_14 = local_4.GetExternalEntityList();
        FECSEntity local_32;
        for (auto& local_28 : local_14)
        {
            local_28;
            FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
            bool local_11 = false;
            bool local_35 = !(false);
            if (!(local_32.IsActive()) == local_35)
            {
                continue;
            }
            if (!(local_42))
            {
                continue;
            }
            FFPTime local_44 = local_42.StartAtTime;
            if (local_44.opCmp(0.0) < 0 || (local_42.StartAtTime == FPTIME_MAX))
            {
                continue;
            }
            if (local_11)
            {
                continue;
            }
            this.ClientJob_TestCaseStartByTimer(local_50, local_52, local_58, local_6);
            MarkModifiedIfDirty local_66;
            local_66.opCall(local_58);
        }
        local_4.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TestCaseReset() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        MarkModifiedIfDirty local_60;
        int local_188 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.ServerJob_TestCaseReset(local_40, local_42, local_48, local_6);
                FECSEntity::MarkModifiedIfDirty<FC_TestCase> local_56;
                local_56.opCall(local_42);
                local_60.opCall(local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Exclude(local_98).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_116 = 0;
        FECSRuntimeViewIterator local_150 = local_98.Iterator();
        for (; local_150.CanProceed;)
        {
            local_40 = local_150.Proceed();
            ++local_116;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ServerJob_TestCaseReset(local_188, local_42, local_48, local_6);
            FECSEntity::MarkModifiedIfDirty<FC_TestCase>(local_40).opCall(local_42);
            local_60.opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_116);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    void Monitor___JobTimer_Pre___ServerJob_TestCaseRunByTimer(const FC_TestCaseRunTimer &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.RunAtTime;
        FName local_8 = FName("S_GameTestCase::ServerJob_TestCaseRunByTimer");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___ServerJob_TestCaseRunByTimer(const FC_TestCaseRunTimer &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.RunAtTime;
        FName local_8 = FName("S_GameTestCase::ServerJob_TestCaseRunByTimer");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___ServerJob_TestCaseRunByTimer() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorTestCaseRunTimerOnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___ServerJob_TestCaseRunByTimer(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorTestCaseRunTimerOnActiveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___ServerJob_TestCaseRunByTimer(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___ServerJob_TestCaseRunByTimer() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorTestCaseRunTimerOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___ServerJob_TestCaseRunByTimer(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorTestCaseRunTimerOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___ServerJob_TestCaseRunByTimer(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TestCaseRunByTimer() const
    {
        int local_6 = 0;
        int local_42 = 0;
        int local_50 = 0;
        int local_52 = 0;
        int local_58 = 0;
        int local_64 = 0;
        int local_70 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        local_4.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_14 = local_4.GetExternalEntityList();
        FECSEntity local_32;
        for (auto& local_28 : local_14)
        {
            local_28;
            FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
            bool local_11 = false;
            bool local_35 = !(false);
            if (!(local_32.IsActive()) == local_35)
            {
                continue;
            }
            if (!(local_42))
            {
                continue;
            }
            FFPTime local_44 = local_42.RunAtTime;
            if (local_44.opCmp(0.0) < 0 || (local_42.RunAtTime == FPTIME_MAX))
            {
                continue;
            }
            if (local_11)
            {
                continue;
            }
            this.ServerJob_TestCaseRunByTimer(local_50, local_52, local_58, local_64, local_70, local_6);
            MarkModifiedIfDirty local_78;
            local_78.opCall(local_58);
            MarkModifiedIfDirty local_82;
            local_82.opCall(local_64);
            MarkModifiedIfDirty local_86;
            local_86.opCall(local_70);
        }
        local_4.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TestCaseReset() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_184 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.ClientJob_TestCaseReset(local_40, local_42, local_48, local_6);
                FECSEntity::MarkModifiedIfDirty<FC_TestCaseRoundCache> local_56;
                local_56.opCall(local_48);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_94 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_98;
        local_98.opCall();
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Exclude(local_94).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_112 = 0;
        FECSRuntimeViewIterator local_146 = local_94.Iterator();
        for (; local_146.CanProceed;)
        {
            local_40 = local_146.Proceed();
            ++local_112;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ClientJob_TestCaseReset(local_184, local_42, local_48, local_6);
            FECSEntity::MarkModifiedIfDirty<FC_TestCaseRoundCache>(local_40).opCall(local_48);
        }
        local_4.UpdateCachedEntityCount(local_112);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TestCasePinESMDuringWait() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        MarkModifiedIfDirty local_62;
        MarkModifiedIfDirty local_66;
        int local_194 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.ClientJob_TestCasePinESMDuringWait(local_40, local_42, local_48, local_54, local_6);
                local_62.opCall(local_48);
                local_66.opCall(local_54);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_104 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_108;
        local_108.opCall();
        Include local_112;
        local_112.opCall();
        Include local_116;
        local_116.opCall();
        local_116.opCall();
        Exclude(local_104).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_122 = 0;
        FECSRuntimeViewIterator local_156 = local_104.Iterator();
        for (; local_156.CanProceed;)
        {
            local_40 = local_156.Proceed();
            ++local_122;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ClientJob_TestCasePinESMDuringWait(local_194, local_42, local_48, local_54, local_6);
            local_62.opCall(local_48);
            local_66.opCall(local_54);
        }
        local_4.UpdateCachedEntityCount(local_122);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    void Monitor___JobTimer_Pre___ClientJob_TestCaseRunByTimer(const FC_TestCaseRunTimer &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.RunAtTime;
        FName local_8 = FName("S_GameTestCase::ClientJob_TestCaseRunByTimer");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), true);
        }
        return;
    }
    void Monitor___JobTimer_Post___ClientJob_TestCaseRunByTimer(const FC_TestCaseRunTimer &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.RunAtTime;
        FName local_8 = FName("S_GameTestCase::ClientJob_TestCaseRunByTimer");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    void Monitor___JobTimer_OnSync___ClientJob_TestCaseRunByTimer(const FC_TestCaseRunTimer &inout TimerComp, const FECSEntity &inout Entity) const
    {
        if (!(TimerComp))
        {
            return;
        }
        FFPTime local_6 = TimerComp.RunAtTime;
        FName local_8 = FName("S_GameTestCase::ClientJob_TestCaseRunByTimer");
        if (local_6.opCmp(0.0) >= 0 && (local_6.opCmp(FPTIME_MAX) < 0))
        {
            ECS::ScheduleJobTimer(local_8, local_6, Entity.GetId(), false);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Pre___ClientJob_TestCaseRunByTimer() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorTestCaseRunTimerOnModifyView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Pre___ClientJob_TestCaseRunByTimer(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorTestCaseRunTimerOnActiveView(this.GetECSWorld(), EECSRegType(0), true, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Pre___ClientJob_TestCaseRunByTimer(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_Post___ClientJob_TestCaseRunByTimer() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorTestCaseRunTimerOnModifyView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_Post___ClientJob_TestCaseRunByTimer(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorTestCaseRunTimerOnActiveView(this.GetECSWorld(), EECSRegType(0), true, true);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_Post___ClientJob_TestCaseRunByTimer(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_Monitor___JobTimer_OnSync___ClientJob_TestCaseRunByTimer() const
    {
        int local_52 = 0;
        int local_54 = 0;
        ECS::GetContextJob();
        FECSMonitorRuntimeView local_14 = ::__GetMonitorTestCaseRunTimerOnModifyView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_30 = local_14.Iterator();
        for (; local_30.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44 = local_30.Proceed();
            FECSEntityScopeCycleCounter local_45 = FECSEntityScopeCycleCounter(local_44.Entity);
            GetComponent local_50 = FECSMonitorRuntimeViewItem::GetComponent(local_44);
            this.Monitor___JobTimer_OnSync___ClientJob_TestCaseRunByTimer(local_52, local_54);
        }
        FECSMonitorRuntimeView local_18 = ::__GetMonitorTestCaseRunTimerOnActiveView(this.GetECSWorld(), EECSRegType(0), false, false);
        FECSMonitorRuntimeViewIterator local_42 = local_18.Iterator();
        for (; local_42.CanProceed;)
        {
            FECSMonitorRuntimeViewItem& local_44_2 = local_42.Proceed();
            FECSEntityScopeCycleCounter local_45_2 = FECSEntityScopeCycleCounter(local_44_2.Entity);
            GetComponent local_50_2 = FECSMonitorRuntimeViewItem::GetComponent(local_44_2);
            this.Monitor___JobTimer_OnSync___ClientJob_TestCaseRunByTimer(local_52, local_54);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TestCaseRunByTimer() const
    {
        int local_6 = 0;
        int local_42 = 0;
        int local_50 = 0;
        int local_52 = 0;
        int local_58 = 0;
        int local_64 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_8 = ECS::GetECSWorld();
        local_4.MarkIteratingExternalEntityList(true);
        const TArray<FECSEntityId>& local_14 = local_4.GetExternalEntityList();
        FECSEntity local_32;
        for (auto& local_28 : local_14)
        {
            local_28;
            FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
            bool local_11 = false;
            bool local_35 = !(false);
            if (!(local_32.IsActive()) == local_35)
            {
                continue;
            }
            if (!(local_42))
            {
                continue;
            }
            FFPTime local_44 = local_42.RunAtTime;
            if (local_44.opCmp(0.0) < 0 || (local_42.RunAtTime == FPTIME_MAX))
            {
                continue;
            }
            if (local_11)
            {
                continue;
            }
            this.ClientJob_TestCaseRunByTimer(local_50, local_52, local_58, local_64, local_6);
            MarkModifiedIfDirty local_72;
            local_72.opCall(local_58);
            MarkModifiedIfDirty local_76;
            local_76.opCall(local_64);
        }
        local_4.MarkIteratingExternalEntityList(false);
        ECS::ClearCurJobExternalEntityList();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TickForceFixedTimeOffset() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_160 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.ServerJob_TickForceFixedTimeOffset(local_40, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_78 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_82;
        local_82.opCall();
        Exclude(local_78).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_88 = 0;
        FECSRuntimeViewIterator local_122 = local_78.Iterator();
        for (; local_122.CanProceed;)
        {
            local_40 = local_122.Proceed();
            ++local_88;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ServerJob_TickForceFixedTimeOffset(local_160, local_6);
        }
        local_4.UpdateCachedEntityCount(local_88);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TickForceFixedTimeOffset() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_164 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.ClientJob_TickForceFixedTimeOffset(local_40, local_6);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_78 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_82;
        local_82.opCall();
        Include local_86;
        local_86.opCall();
        Exclude(local_78).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_92 = 0;
        FECSRuntimeViewIterator local_126 = local_78.Iterator();
        for (; local_126.CanProceed;)
        {
            local_40 = local_126.Proceed();
            ++local_92;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ClientJob_TickForceFixedTimeOffset(local_164, local_6);
        }
        local_4.UpdateCachedEntityCount(local_92);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TestCaseTickFixedInput() const
    {
        int local_14 = 0;
        int local_16 = 0;
        const FECSEntity& local_50;
        int local_52 = 0;
        MarkModifiedIfDirty local_60;
        int local_184 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_6 = this.GetECSWorld();
        Has local_10;
        if (!(local_10.opCall()))
        {
            return;
        }
        FECSWorldPtr local_6_2 = this.GetECSWorld();
        int local_22 = 0;
        int local_21 = local_22;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_6_3 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_26 = local_4.GetViewCacheEntities();
            int local_27 = 0;
            for (auto& local_42 : local_26)
            {
                local_42;
                FECSEntity local_46;
                if (!(local_46.IsValid()))
                {
                    continue;
                }
                ++local_27;
                FECSEntityScopeCycleCounter local_47 = FECSEntityScopeCycleCounter(local_46);
                this.ServerJob_TestCaseTickFixedInput(local_50, local_52, local_14, local_16);
                local_60.opCall(local_52);
            }
            local_4.UpdateCachedEntityCount(local_27);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Exclude(local_98).opCall();
        bool local_11 = local_4.BeginViewCacheBuild();
        int local_28 = local_4.GetViewCacheEpoch();
        int local_112 = 0;
        FECSRuntimeViewIterator local_146 = local_98.Iterator();
        for (; local_146.CanProceed;)
        {
            local_50 = local_146.Proceed();
            ++local_112;
            if (local_11)
            {
                local_4.AddViewCacheEntity(local_50.GetId());
            }
            FECSEntityScopeCycleCounter local_47_2 = FECSEntityScopeCycleCounter(local_50);
            FECSEntity::ModifyAndMarkDirtyManually<FC_TestCaseServerFixedInputs> local_56 = FECSEntity::ModifyAndMarkDirtyManually<FC_TestCaseServerFixedInputs>(local_50);
            this.ServerJob_TestCaseTickFixedInput(local_184, local_52, local_14, local_16);
            local_60.opCall(local_52);
        }
        local_4.UpdateCachedEntityCount(local_112);
        if (local_11)
        {
            local_4.CommitViewCacheBuild(local_28);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TestCaseTickFixedInput() const
    {
        int local_14 = 0;
        int local_16 = 0;
        const FECSEntity& local_50;
        int local_52 = 0;
        MarkModifiedIfDirty local_60;
        int local_188 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_6 = this.GetECSWorld();
        Has local_10;
        if (!(local_10.opCall()))
        {
            return;
        }
        FECSWorldPtr local_6_2 = this.GetECSWorld();
        int local_22 = 0;
        int local_21 = local_22;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_6_3 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_26 = local_4.GetViewCacheEntities();
            int local_27 = 0;
            for (auto& local_42 : local_26)
            {
                local_42;
                FECSEntity local_46;
                if (!(local_46.IsValid()))
                {
                    continue;
                }
                ++local_27;
                FECSEntityScopeCycleCounter local_47 = FECSEntityScopeCycleCounter(local_46);
                this.ClientJob_TestCaseTickFixedInput(local_50, local_52, local_14, local_16);
                local_60.opCall(local_52);
            }
            local_4.UpdateCachedEntityCount(local_27);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Include local_110;
        local_110.opCall();
        Exclude(local_98).opCall();
        bool local_11 = local_4.BeginViewCacheBuild();
        int local_28 = local_4.GetViewCacheEpoch();
        int local_116 = 0;
        FECSRuntimeViewIterator local_150 = local_98.Iterator();
        for (; local_150.CanProceed;)
        {
            local_50 = local_150.Proceed();
            ++local_116;
            if (local_11)
            {
                local_4.AddViewCacheEntity(local_50.GetId());
            }
            FECSEntityScopeCycleCounter local_47_2 = FECSEntityScopeCycleCounter(local_50);
            FECSEntity::ModifyAndMarkDirtyManually<FC_TestCaseClientFixedInputs> local_56 = FECSEntity::ModifyAndMarkDirtyManually<FC_TestCaseClientFixedInputs>(local_50);
            this.ClientJob_TestCaseTickFixedInput(local_188, local_52, local_14, local_16);
            local_60.opCall(local_52);
        }
        local_4.UpdateCachedEntityCount(local_116);
        if (local_11)
        {
            local_4.CommitViewCacheBuild(local_28);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TestCaseSyncCameraFromServerInput() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_178 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.ClientJob_TestCaseSyncCameraFromServerInput(local_40, local_42, local_6);
                local_50.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        Include local_96;
        local_96.opCall();
        Include local_100;
        local_100.opCall();
        Exclude(local_88).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_106 = 0;
        FECSRuntimeViewIterator local_140 = local_88.Iterator();
        for (; local_140.CanProceed;)
        {
            local_40 = local_140.Proceed();
            ++local_106;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ClientJob_TestCaseSyncCameraFromServerInput(local_178, local_42, local_6);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_106);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TestCaseSmoothCameraOnRenderFrame() const
    {
        const FECSEntity& local_36;
        int local_38 = 0;
        int local_170 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ClientJob_TestCaseSmoothCameraOnRenderFrame(local_36, local_38);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_80 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_84;
        local_84.opCall();
        Include local_88;
        local_88.opCall();
        Include local_92;
        local_92.opCall();
        Exclude(local_80).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_80.Iterator();
        for (; local_132.CanProceed;)
        {
            local_36 = local_132.Proceed();
            ++local_98;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ClientJob_TestCaseSmoothCameraOnRenderFrame(local_170, local_38);
        }
        local_2.UpdateCachedEntityCount(local_98);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TestCaseMigrateReplayOnSwitch() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PlayerSwitchSuccess> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PlayerSwitchSuccess& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_TestCaseMigrateReplayOnSwitch(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TestCaseMigrateReplayOnSwitch() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PlayerSwitchSuccess> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PlayerSwitchSuccess& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_TestCaseMigrateReplayOnSwitch(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TestCaseMigrateViewOnSwitch() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_PlayerSwitchSuccess> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_PlayerSwitchSuccess& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_TestCaseMigrateViewOnSwitch(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TestCaseTickAction() const
    {
        int local_14 = 0;
        int local_16 = 0;
        const FECSEntity& local_50;
        int local_52 = 0;
        MarkModifiedIfDirty local_60;
        int local_184 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_6 = this.GetECSWorld();
        Has local_10;
        if (!(local_10.opCall()))
        {
            return;
        }
        FECSWorldPtr local_6_2 = this.GetECSWorld();
        int local_22 = 0;
        int local_21 = local_22;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_6_3 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_26 = local_4.GetViewCacheEntities();
            int local_27 = 0;
            for (auto& local_42 : local_26)
            {
                local_42;
                FECSEntity local_46;
                if (!(local_46.IsValid()))
                {
                    continue;
                }
                ++local_27;
                FECSEntityScopeCycleCounter local_47 = FECSEntityScopeCycleCounter(local_46);
                this.ServerJob_TestCaseTickAction(local_50, local_52, local_14, local_16);
                local_60.opCall(local_52);
            }
            local_4.UpdateCachedEntityCount(local_27);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Exclude(local_98).opCall();
        bool local_11 = local_4.BeginViewCacheBuild();
        int local_28 = local_4.GetViewCacheEpoch();
        int local_112 = 0;
        FECSRuntimeViewIterator local_146 = local_98.Iterator();
        for (; local_146.CanProceed;)
        {
            local_50 = local_146.Proceed();
            ++local_112;
            if (local_11)
            {
                local_4.AddViewCacheEntity(local_50.GetId());
            }
            FECSEntityScopeCycleCounter local_47_2 = FECSEntityScopeCycleCounter(local_50);
            FECSEntity::ModifyAndMarkDirtyManually<FC_TestCaseActions> local_56 = FECSEntity::ModifyAndMarkDirtyManually<FC_TestCaseActions>(local_50);
            this.ServerJob_TestCaseTickAction(local_184, local_52, local_14, local_16);
            local_60.opCall(local_52);
        }
        local_4.UpdateCachedEntityCount(local_112);
        if (local_11)
        {
            local_4.CommitViewCacheBuild(local_28);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TestCaseTickLazyBind() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        int local_48 = 0;
        int local_54 = 0;
        MarkModifiedIfDirty local_62;
        MarkModifiedIfDirty local_66;
        MarkModifiedIfDirty local_70;
        int local_202 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.ServerJob_TestCaseTickLazyBind(local_40, local_42, local_48, local_54, local_6);
                local_62.opCall(local_42);
                local_66.opCall(local_48);
                local_70.opCall(local_54);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_108 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_112;
        local_112.opCall();
        Include local_116;
        local_116.opCall();
        Include local_120;
        local_120.opCall();
        local_120.opCall();
        Exclude(local_108).opCall();
        Exclude(local_108).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_130 = 0;
        FECSRuntimeViewIterator local_164 = local_108.Iterator();
        for (; local_164.CanProceed;)
        {
            local_40 = local_164.Proceed();
            ++local_130;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ServerJob_TestCaseTickLazyBind(local_202, local_42, local_48, local_54, local_6);
            local_62.opCall(local_42);
            local_66.opCall(local_48);
            local_70.opCall(local_54);
        }
        local_4.UpdateCachedEntityCount(local_130);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_TestCaseTickSampler() const
    {
        int local_14 = 0;
        int local_16 = 0;
        const FECSEntity& local_50;
        int local_52 = 0;
        MarkModifiedIfDirty local_60;
        int local_184 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_6 = this.GetECSWorld();
        Has local_10;
        if (!(local_10.opCall()))
        {
            return;
        }
        FECSWorldPtr local_6_2 = this.GetECSWorld();
        int local_22 = 0;
        int local_21 = local_22;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_6_3 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_26 = local_4.GetViewCacheEntities();
            int local_27 = 0;
            for (auto& local_42 : local_26)
            {
                local_42;
                FECSEntity local_46;
                if (!(local_46.IsValid()))
                {
                    continue;
                }
                ++local_27;
                FECSEntityScopeCycleCounter local_47 = FECSEntityScopeCycleCounter(local_46);
                this.ServerJob_TestCaseTickSampler(local_50, local_52, local_14, local_16);
                local_60.opCall(local_52);
            }
            local_4.UpdateCachedEntityCount(local_27);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Exclude(local_98).opCall();
        bool local_11 = local_4.BeginViewCacheBuild();
        int local_28 = local_4.GetViewCacheEpoch();
        int local_112 = 0;
        FECSRuntimeViewIterator local_146 = local_98.Iterator();
        for (; local_146.CanProceed;)
        {
            local_50 = local_146.Proceed();
            ++local_112;
            if (local_11)
            {
                local_4.AddViewCacheEntity(local_50.GetId());
            }
            FECSEntityScopeCycleCounter local_47_2 = FECSEntityScopeCycleCounter(local_50);
            FECSEntity::ModifyAndMarkDirtyManually<FC_TestCaseServerSamplers> local_56 = FECSEntity::ModifyAndMarkDirtyManually<FC_TestCaseServerSamplers>(local_50);
            this.ServerJob_TestCaseTickSampler(local_184, local_52, local_14, local_16);
            local_60.opCall(local_52);
        }
        local_4.UpdateCachedEntityCount(local_112);
        if (local_11)
        {
            local_4.CommitViewCacheBuild(local_28);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleDispatchClientActions() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_TestCaseDispatchClientActions> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(2)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_TestCaseDispatchClientActions& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleDispatchClientActions(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_HandleDispatchLogicClientActions() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_TestCaseDispatchClientActions> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(0)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_TestCaseDispatchClientActions& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ClientJob_HandleDispatchLogicClientActions(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TestCaseTickLocalInput() const
    {
        int local_14 = 0;
        int local_16 = 0;
        const FECSEntity& local_50;
        int local_52 = 0;
        MarkModifiedIfDirty local_60;
        int local_180 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_6 = this.GetECSWorld();
        Has local_10;
        if (!(local_10.opCall()))
        {
            return;
        }
        FECSWorldPtr local_6_2 = this.GetECSWorld();
        int local_22 = 0;
        int local_21 = local_22;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_6_3 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_26 = local_4.GetViewCacheEntities();
            int local_27 = 0;
            for (auto& local_42 : local_26)
            {
                local_42;
                FECSEntity local_46;
                if (!(local_46.IsValid()))
                {
                    continue;
                }
                ++local_27;
                FECSEntityScopeCycleCounter local_47 = FECSEntityScopeCycleCounter(local_46);
                this.ClientJob_TestCaseTickLocalInput(local_50, local_52, local_14, local_16);
                local_60.opCall(local_52);
            }
            local_4.UpdateCachedEntityCount(local_27);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Exclude(local_98).opCall();
        bool local_11 = local_4.BeginViewCacheBuild();
        int local_28 = local_4.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_98.Iterator();
        for (; local_142.CanProceed;)
        {
            local_50 = local_142.Proceed();
            ++local_108;
            if (local_11)
            {
                local_4.AddViewCacheEntity(local_50.GetId());
            }
            FECSEntityScopeCycleCounter local_47_2 = FECSEntityScopeCycleCounter(local_50);
            FECSEntity::ModifyAndMarkDirtyManually<FC_TestCaseClientInputs> local_56 = FECSEntity::ModifyAndMarkDirtyManually<FC_TestCaseClientInputs>(local_50);
            this.ClientJob_TestCaseTickLocalInput(local_180, local_52, local_14, local_16);
            local_60.opCall(local_52);
        }
        local_4.UpdateCachedEntityCount(local_108);
        if (local_11)
        {
            local_4.CommitViewCacheBuild(local_28);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TestCaseTickSampler() const
    {
        int local_14 = 0;
        int local_16 = 0;
        const FECSEntity& local_50;
        int local_52 = 0;
        MarkModifiedIfDirty local_60;
        int local_180 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_6 = this.GetECSWorld();
        Has local_10;
        if (!(local_10.opCall()))
        {
            return;
        }
        FECSWorldPtr local_6_2 = this.GetECSWorld();
        int local_22 = 0;
        int local_21 = local_22;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_6_3 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_26 = local_4.GetViewCacheEntities();
            int local_27 = 0;
            for (auto& local_42 : local_26)
            {
                local_42;
                FECSEntity local_46;
                if (!(local_46.IsValid()))
                {
                    continue;
                }
                ++local_27;
                FECSEntityScopeCycleCounter local_47 = FECSEntityScopeCycleCounter(local_46);
                this.ClientJob_TestCaseTickSampler(local_50, local_52, local_14, local_16);
                local_60.opCall(local_52);
            }
            local_4.UpdateCachedEntityCount(local_27);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Exclude(local_98).opCall();
        bool local_11 = local_4.BeginViewCacheBuild();
        int local_28 = local_4.GetViewCacheEpoch();
        int local_108 = 0;
        FECSRuntimeViewIterator local_142 = local_98.Iterator();
        for (; local_142.CanProceed;)
        {
            local_50 = local_142.Proceed();
            ++local_108;
            if (local_11)
            {
                local_4.AddViewCacheEntity(local_50.GetId());
            }
            FECSEntityScopeCycleCounter local_47_2 = FECSEntityScopeCycleCounter(local_50);
            FECSEntity::ModifyAndMarkDirtyManually<FC_TestCaseClientViewSamplers> local_56 = FECSEntity::ModifyAndMarkDirtyManually<FC_TestCaseClientViewSamplers>(local_50);
            this.ClientJob_TestCaseTickSampler(local_180, local_52, local_14, local_16);
            local_60.opCall(local_52);
        }
        local_4.UpdateCachedEntityCount(local_108);
        if (local_11)
        {
            local_4.CommitViewCacheBuild(local_28);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TestCaseFixedFrameSampler() const
    {
        int local_14 = 0;
        int local_16 = 0;
        const FECSEntity& local_50;
        int local_52 = 0;
        MarkModifiedIfDirty local_60;
        int local_184 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        FECSWorldPtr local_6 = this.GetECSWorld();
        Has local_10;
        if (!(local_10.opCall()))
        {
            return;
        }
        FECSWorldPtr local_6_2 = this.GetECSWorld();
        int local_22 = 0;
        int local_21 = local_22;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_6_3 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_26 = local_4.GetViewCacheEntities();
            int local_27 = 0;
            for (auto& local_42 : local_26)
            {
                local_42;
                FECSEntity local_46;
                if (!(local_46.IsValid()))
                {
                    continue;
                }
                ++local_27;
                FECSEntityScopeCycleCounter local_47 = FECSEntityScopeCycleCounter(local_46);
                this.ClientJob_TestCaseFixedFrameSampler(local_50, local_52, local_14, local_16);
                local_60.opCall(local_52);
            }
            local_4.UpdateCachedEntityCount(local_27);
            return;
        }
        FECSRuntimeView local_98 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_102;
        local_102.opCall();
        Include local_106;
        local_106.opCall();
        Exclude(local_98).opCall();
        bool local_11 = local_4.BeginViewCacheBuild();
        int local_28 = local_4.GetViewCacheEpoch();
        int local_112 = 0;
        FECSRuntimeViewIterator local_146 = local_98.Iterator();
        for (; local_146.CanProceed;)
        {
            local_50 = local_146.Proceed();
            ++local_112;
            if (local_11)
            {
                local_4.AddViewCacheEntity(local_50.GetId());
            }
            FECSEntityScopeCycleCounter local_47_2 = FECSEntityScopeCycleCounter(local_50);
            FECSEntity::ModifyAndMarkDirtyManually<FC_TestCaseClientLogicSamplers> local_56 = FECSEntity::ModifyAndMarkDirtyManually<FC_TestCaseClientLogicSamplers>(local_50);
            this.ClientJob_TestCaseFixedFrameSampler(local_184, local_52, local_14, local_16);
            local_60.opCall(local_52);
        }
        local_4.UpdateCachedEntityCount(local_112);
        if (local_11)
        {
            local_4.CommitViewCacheBuild(local_28);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TestCaseTickCameraView() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_170 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.ClientJob_TestCaseTickCameraView(local_40, local_42, local_6);
                local_50.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        local_92.opCall();
        Exclude(local_88).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_88.Iterator();
        for (; local_132.CanProceed;)
        {
            local_40 = local_132.Proceed();
            ++local_98;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ClientJob_TestCaseTickCameraView(local_170, local_42, local_6);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_98);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ClientJob_TestCaseTickDetailedData() const
    {
        int local_6 = 0;
        const FECSEntity& local_40;
        int local_42 = 0;
        MarkModifiedIfDirty local_50;
        int local_170 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        const FECSJob& local_4 = ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        if (local_4.IsViewCacheUsable())
        {
            FECSWorldPtr local_12 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_16 = local_4.GetViewCacheEntities();
            int local_17 = 0;
            for (auto& local_32 : local_16)
            {
                local_32;
                FECSEntity local_36;
                if (!(local_36.IsValid()))
                {
                    continue;
                }
                ++local_17;
                FECSEntityScopeCycleCounter local_37 = FECSEntityScopeCycleCounter(local_36);
                this.ClientJob_TestCaseTickDetailedData(local_40, local_42, local_6);
                local_50.opCall(local_42);
            }
            local_4.UpdateCachedEntityCount(local_17);
            return;
        }
        FECSRuntimeView local_88 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_92;
        local_92.opCall();
        local_92.opCall();
        Exclude(local_88).opCall();
        bool local_9 = local_4.BeginViewCacheBuild();
        int local_18 = local_4.GetViewCacheEpoch();
        int local_98 = 0;
        FECSRuntimeViewIterator local_132 = local_88.Iterator();
        for (; local_132.CanProceed;)
        {
            local_40 = local_132.Proceed();
            ++local_98;
            if (local_9)
            {
                local_4.AddViewCacheEntity(local_40.GetId());
            }
            FECSEntityScopeCycleCounter local_37_2 = FECSEntityScopeCycleCounter(local_40);
            this.ClientJob_TestCaseTickDetailedData(local_170, local_42, local_6);
            local_50.opCall(local_42);
        }
        local_4.UpdateCachedEntityCount(local_98);
        if (local_9)
        {
            local_4.CommitViewCacheBuild(local_18);
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_GatherTestCaseResult() const
    {
        ECS::GetContextJob();
        TECSEventConstIterator<FCE_TestCaseFinished> local_36 = FECSWorldPtr::ViewEvents(this.GetECSWorld()).opCall(EECSEventFilterMode(1)).Iterator();
        for (; local_36.CanProceed;)
        {
            const FCE_TestCaseFinished& local_60 = local_36.Proceed();
            FECSEntityScopeCycleCounter local_61 = FECSEntityScopeCycleCounter(local_60.Sender);
            ECSInternal::PushContextTime(local_60.GetHandleTime());
            this.ServerJob_GatherTestCaseResult(local_60);
            ECSInternal::PopContextTime();
        }
        return;
    }
    UFUNCTION()
    void Run_ServerJob_GTCDeferredDestroy() const
    {
        const FECSEntity& local_36;
        int local_156 = 0;
        const FECSJob& local_2 = ECS::GetContextJob();
        int local_4 = 0;
        int local_3 = local_4;
        if (local_2.IsViewCacheUsable())
        {
            FECSWorldPtr local_8 = ECS::GetECSWorld();
            const TArray<FECSEntityId>& local_12 = local_2.GetViewCacheEntities();
            int local_13 = 0;
            for (auto& local_28 : local_12)
            {
                local_28;
                FECSEntity local_32;
                if (!(local_32.IsValid()))
                {
                    continue;
                }
                ++local_13;
                FECSEntityScopeCycleCounter local_33 = FECSEntityScopeCycleCounter(local_32);
                this.ServerJob_GTCDeferredDestroy(local_36);
            }
            local_2.UpdateCachedEntityCount(local_13);
            return;
        }
        FECSRuntimeView local_74 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_78;
        local_78.opCall();
        Exclude(local_74).opCall();
        bool local_5 = local_2.BeginViewCacheBuild();
        int local_14 = local_2.GetViewCacheEpoch();
        int local_84 = 0;
        FECSRuntimeViewIterator local_118 = local_74.Iterator();
        for (; local_118.CanProceed;)
        {
            local_36 = local_118.Proceed();
            ++local_84;
            if (local_5)
            {
                local_2.AddViewCacheEntity(local_36.GetId());
            }
            FECSEntityScopeCycleCounter local_33_2 = FECSEntityScopeCycleCounter(local_36);
            this.ServerJob_GTCDeferredDestroy(local_156);
        }
        local_2.UpdateCachedEntityCount(local_84);
        if (local_5)
        {
            local_2.CommitViewCacheBuild(local_14);
        }
        return;
    }
}

