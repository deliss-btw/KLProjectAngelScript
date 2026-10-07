

namespace DSTest
{
struct FDSTestSpawnLocAndRot
{
    UPROPERTY()
    FVector Location;
    UPROPERTY()
    FRotator Rotation;

    FDSTestSpawnLocAndRot()
    {
        return;
    }
    FDSTestSpawnLocAndRot(const FVector &inout InLocation, const FRotator &inout InRotation)
    {
        this.Rotation = InRotation;
        return;
    }
}

struct FDSTestSpawnerInfo
{
    UPROPERTY()
    TArray<DSTest::FDSTestSpawnLocAndRot> SpawnLocAndRots;

    FDSTestSpawnerInfo()
    {
        return;
    }
    FDSTestSpawnerInfo(const TArray<DSTest::FDSTestSpawnLocAndRot> &inout InSpawnLocAndRot)
    {
        // body not fully recovered вЂ” stub [argmismatch:copyctor]
    }
}

}
class US_ASGameModeSystemDSTest : US_ECSScriptGameModeSystemBase
{
    TArray<DSTest::FDSTestSpawnerInfo> TeamSpawnerInfo;

    US_ASGameModeSystemDSTest()
    {
        return;
    }
    UFUNCTION()
    void Init_Implementation()
    {
        this.TeamSpawnerInfo.Reset(0);
        TArray<DSTest::FDSTestSpawnLocAndRot> local_6;
        local_6.Add(DSTest::FDSTestSpawnLocAndRot(FVector(34120.0, 35845.0, 5140.0), FRotator(0.0, 0.0, 0.0)));
        local_6.Add(DSTest::FDSTestSpawnLocAndRot(FVector(34092.558036, 35319.617063, 5126.03095), FRotator(0.0, 0.0, 0.0)));
        local_6.Add(DSTest::FDSTestSpawnLocAndRot(FVector(33450.0, 35030.0, 5105.0), FRotator(0.0, 0.0, 0.0)));
        local_6.Add(DSTest::FDSTestSpawnLocAndRot(FVector(33700.0, 36115.0, 5155.0), FRotator(0.0, 0.0, 0.0)));
        TArray<DSTest::FDSTestSpawnLocAndRot> local_40;
        local_40.Add(DSTest::FDSTestSpawnLocAndRot(FVector(44650.326834, 14322.730285, 5822.949262), FRotator(0.0, 0.0, 0.0)));
        local_40.Add(DSTest::FDSTestSpawnLocAndRot(FVector(45746.677648, 15276.194522, 5844.760485), FRotator(0.0, 0.0, 0.0)));
        local_40.Add(DSTest::FDSTestSpawnLocAndRot(FVector(46392.190793, 15158.875498, 5864.993434), FRotator(0.0, 0.0, 0.0)));
        local_40.Add(DSTest::FDSTestSpawnLocAndRot(FVector(44969.884909, 15014.302978, 5842.82815), FRotator(0.0, 0.0, 0.0)));
        TArray<DSTest::FDSTestSpawnLocAndRot> local_44;
        local_44.Add(DSTest::FDSTestSpawnLocAndRot(FVector(-8542.470804, -7626.913909, 15696.099893), FRotator(0.0, 0.0, 0.0)));
        local_44.Add(DSTest::FDSTestSpawnLocAndRot(FVector(-8843.54743, -8041.366405, 15703.237389), FRotator(0.0, 0.0, 0.0)));
        local_44.Add(DSTest::FDSTestSpawnLocAndRot(FVector(-8592.422906, -7158.224999, 15648.150377), FRotator(0.0, 0.0, 0.0)));
        local_44.Add(DSTest::FDSTestSpawnLocAndRot(FVector(-9050.961691, -6616.375339, 15558.676041), FRotator(0.0, 0.0, 0.0)));
        TArray<DSTest::FDSTestSpawnLocAndRot> local_48;
        local_48.Add(DSTest::FDSTestSpawnLocAndRot(FVector(-51252.795191, 34031.868217, 14586.612483), FRotator(0.0, 0.0, 0.0)));
        local_48.Add(DSTest::FDSTestSpawnLocAndRot(FVector(-51649.227182, 34405.780503, 14586.612483), FRotator(0.0, 0.0, 0.0)));
        local_48.Add(DSTest::FDSTestSpawnLocAndRot(FVector(-51229.625596, 33428.477471, 14586.612483), FRotator(0.0, 0.0, 0.0)));
        local_48.Add(DSTest::FDSTestSpawnLocAndRot(FVector(-51674.31318, 33088.601597, 14586.612483), FRotator(0.0, 0.0, 0.0)));
        TArray<DSTest::FDSTestSpawnLocAndRot> local_52;
        local_52.Add(DSTest::FDSTestSpawnLocAndRot(FVector(22536.126417, 68560.663773, 2834.348313), FRotator(0.0, 0.0, 0.0)));
        local_52.Add(DSTest::FDSTestSpawnLocAndRot(FVector(21644.451989, 67834.237661, 2852.395752), FRotator(0.0, 0.0, 0.0)));
        local_52.Add(DSTest::FDSTestSpawnLocAndRot(FVector(22990.577721, 68034.220502, 2802.20594), FRotator(0.0, 0.0, 0.0)));
        local_52.Add(DSTest::FDSTestSpawnLocAndRot(FVector(22434.720336, 68142.386137, 2804.922255), FRotator(0.0, 0.0, 0.0)));
        TArray<DSTest::FDSTestSpawnLocAndRot> local_56;
        local_56.Add(DSTest::FDSTestSpawnLocAndRot(FVector(77649.902201, 10868.624373, 7723.312471), FRotator(0.0, 0.0, 0.0)));
        local_56.Add(DSTest::FDSTestSpawnLocAndRot(FVector(76867.803224, 10601.597771, 7697.866686), FRotator(0.0, 0.0, 0.0)));
        local_56.Add(DSTest::FDSTestSpawnLocAndRot(FVector(77414.542338, 10957.146849, 7702.052457), FRotator(0.0, 0.0, 0.0)));
        local_56.Add(DSTest::FDSTestSpawnLocAndRot(FVector(77400.89936, 10424.679657, 7720.656634), FRotator(0.0, 0.0, 0.0)));
        TArray<DSTest::FDSTestSpawnLocAndRot> local_60;
        local_60.Add(DSTest::FDSTestSpawnLocAndRot(FVector(23262.525632, -31991.597764, 18263.147449), FRotator(0.0, 0.0, 0.0)));
        local_60.Add(DSTest::FDSTestSpawnLocAndRot(FVector(24111.614814, -31966.72085, 18197.377742), FRotator(0.0, 0.0, 0.0)));
        local_60.Add(DSTest::FDSTestSpawnLocAndRot(FVector(23771.484512, -30641.760999, 18264.578336), FRotator(0.0, 0.0, 0.0)));
        local_60.Add(DSTest::FDSTestSpawnLocAndRot(FVector(24435.486235, -31258.096288, 18013.374309), FRotator(0.0, 0.0, 0.0)));
        TArray<DSTest::FDSTestSpawnLocAndRot> local_64;
        local_64.Add(DSTest::FDSTestSpawnLocAndRot(FVector(12048.423701, -63880.017112, 7844.405838), FRotator(0.0, 0.0, 0.0)));
        local_64.Add(DSTest::FDSTestSpawnLocAndRot(FVector(12109.780438, -60827.961486, 7844.4375), FRotator(0.0, 0.0, 0.0)));
        local_64.Add(DSTest::FDSTestSpawnLocAndRot(FVector(10753.732571, -62754.988885, 7844.4375), FRotator(0.0, 0.0, 0.0)));
        local_64.Add(DSTest::FDSTestSpawnLocAndRot(FVector(13440.721245, -62283.911029, 7844.408651), FRotator(0.0, 0.0, 0.0)));
        this.TeamSpawnerInfo.Add(DSTest::FDSTestSpawnerInfo(TArray<DSTest::FDSTestSpawnLocAndRot>()));
        this.TeamSpawnerInfo.Add(DSTest::FDSTestSpawnerInfo(TArray<DSTest::FDSTestSpawnLocAndRot>()));
        this.TeamSpawnerInfo.Add(DSTest::FDSTestSpawnerInfo(TArray<DSTest::FDSTestSpawnLocAndRot>()));
        this.TeamSpawnerInfo.Add(DSTest::FDSTestSpawnerInfo(TArray<DSTest::FDSTestSpawnLocAndRot>()));
        this.TeamSpawnerInfo.Add(DSTest::FDSTestSpawnerInfo(TArray<DSTest::FDSTestSpawnLocAndRot>()));
        this.TeamSpawnerInfo.Add(DSTest::FDSTestSpawnerInfo(TArray<DSTest::FDSTestSpawnLocAndRot>()));
        this.TeamSpawnerInfo.Add(DSTest::FDSTestSpawnerInfo(TArray<DSTest::FDSTestSpawnLocAndRot>()));
        this.TeamSpawnerInfo.Add(DSTest::FDSTestSpawnerInfo(TArray<DSTest::FDSTestSpawnLocAndRot>()));
        return;
    }
    UFUNCTION()
    void ServerJob_Begin() const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        0.SetStageType(EFCS_GameStageType(1));
        ::FGameModeUtils::InitAttributeScale(this.GetECSWorld());
        return;
    }
    UFUNCTION()
    void ServerJob_Tick() const
    {
        FECSWorldPtr local_2 = this.GetECSWorld();
        0.SetStageType(EFCS_GameStageType(2));
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        Has local_14;
        if (!(local_14.opCall()))
        {
            ::FGameModeUtils::InitTeamSpawner(this.GetECSWorld());
        }
        this.TickStart();
        return;
    }
    void TickStart() const
    {
        int local_8 = 0;
        int local_146 = 0;
        int local_147 = 0;
        AECSPlayerController local_150;
        TArray<DSTest::FDSTestSpawnLocAndRot> local_160;
        ::FGameModeUtils::HandleClientJoin();
        FECSWorldPtr local_2 = this.GetECSWorld();
        FECSWorldPtr local_2_2 = this.GetECSWorld();
        FECSWorldPtr local_2_3 = this.GetECSWorld();
        FECSRuntimeView local_60 = this.GetECSWorld().GetRuntimeView(EECSRuntimeViewType(2));
        Include local_64;
        local_64.opCall();
        Exclude(local_60).opCall();
        FECSRuntimeViewIterator local_102 = local_60.Iterator();
        for (; local_102.CanProceed;)
        {
            const FECSEntity& local_140 = local_102.Proceed();
            TWeakObjectPtr<AECSPlayerController> local_152 = local_146.GetUEPlayerController();
            AECSPlayerController local_154;
            local_150 = local_154;
            if (local_150 != nullptr)
            {
                local_147 = Gameplay::GetIntOption(local_150.LoginOptions, "Team", 1);
            }
            local_146.SetTeam(uint8(local_147));
            int local_148 = (local_146.GetTeam() - 1) % this.TeamSpawnerInfo.Num();
            int local_156 = local_160.Num() - 1;
            const DSTest::FDSTestSpawnLocAndRot& local_166 = local_160[FMath::RandRange(0, local_156)];
            TDataObjectPtr<FLevelInfoConfig> local_214 = ::FLevelUtils::GetCurrentLevelInfoConfig(nullptr);
            local_166.Rotation.Quaternion();
            FC_PlayerStates local_234;
            Assign local_228;
            local_228.opCall(local_234);
            FECSEntity local_244 = FECSEntity(local_140.GetId());
            FECSWorldPtr local_2_4 = this.GetECSWorld();
            local_156 = local_146.GetPlayerId();
        }
        local_8.SetStageType(EFCS_GameStageType(3));
        return;
    }
    UFUNCTION()
    void Run_ServerJob_Begin() const
    {
        ECS::GetContextJob();
        this.ServerJob_Begin();
        return;
    }
    UFUNCTION()
    void Run_ServerJob_Tick() const
    {
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        if (!(local_2.IsOnInterval(FFPTime(1))))
        {
            return;
        }
        this.ServerJob_Tick();
        return;
    }
}

