
const FConsoleVariable CVar_QAStatPrefabs = FConsoleVariable();

struct FPrefabStatNum
{
    UPROPERTY()
    int Num;
    UPROPERTY()
    int ActiveNum;


    void Increase(const bool bActive)
    {
        ++this.Num;
        if (bActive)
        {
            ++this.ActiveNum;
        }
        return;
    }
}

struct FPrefabStatInfomation
{
    UPROPERTY()
    FPrefabStatNum PropNum;
    UPROPERTY()
    FPrefabStatNum MonsterNum;
    UPROPERTY()
    FPrefabStatNum AvatarNum;
    UPROPERTY()
    FPrefabStatNum MountNum;
    UPROPERTY()
    FPrefabStatNum InvalidNum;

    FPrefabStatInfomation()
    {
        return;
    }
    void PrintInfoToScreen()
    {
        PrintToScreen(FString().Append("InvalidNum: ").Append(this.InvalidNum.ActiveNum).Append("/").Append(this.InvalidNum.Num), 0.0f, FLinearColor::LucBlue);
        PrintToScreen(FString().Append("MountNum: ").Append(this.MountNum.ActiveNum).Append("/").Append(this.MountNum.Num), 0.0f, FLinearColor::LucBlue);
        PrintToScreen(FString().Append("AvatarNum: ").Append(this.AvatarNum.ActiveNum).Append("/").Append(this.AvatarNum.Num), 0.0f, FLinearColor::LucBlue);
        PrintToScreen(FString().Append("MonsterNum: ").Append(this.MonsterNum.ActiveNum).Append("/").Append(this.MonsterNum.Num), 0.0f, FLinearColor::LucBlue);
        PrintToScreen(FString().Append("PropNum: ").Append(this.ActiveNum).Append("/").Append(this.Num), 0.0f, FLinearColor::LucBlue);
        return;
    }
    void LogAsInfomation()
    {
        FString local_4_2 = ((((FString(FString().Append("PropNum: ").Append(this.ActiveNum).Append("/").Append(this.Num).Append("\n")) + FString().Append("MonsterNum: ").Append(this.MonsterNum.ActiveNum).Append("/").Append(this.MonsterNum.Num).Append("\n")) + FString().Append("AvatarNum: ").Append(this.AvatarNum.ActiveNum).Append("/").Append(this.AvatarNum.Num).Append("\n")) + FString().Append("MountNum: ").Append(this.MountNum.ActiveNum).Append("/").Append(this.MountNum.Num).Append("\n")) + FString().Append("InvalidNum: ").Append(this.InvalidNum.ActiveNum).Append("/").Append(this.InvalidNum.Num).Append("\n"));
        XLog(ELog(45), local_4_2);
        return;
    }
}

class US_QAStatisticSystem : UECSScriptSystem
{
    US_QAStatisticSystem()
    {
        return;
    }
    UFUNCTION()
    void Job_StatPrefabInfomations(FPrefabStatInfomation &inout Result, const FECSEntity &inout Entity, const FC_PrefabConfig &inout Config) const
    {
        bool local_2 = Entity.IsActive();
        if (int(Config.PrefabType) == 3)
        {
            Result.PropNum.Increase(local_2);
            return;
        }
        if (int(Config.PrefabType) == 2)
        {
            Result.MonsterNum.Increase(local_2);
            return;
        }
        if (int(Config.PrefabType) == 1)
        {
            Result.AvatarNum.Increase(local_2);
            return;
        }
        if (int(Config.PrefabType) == 4)
        {
            Result.MountNum.Increase(local_2);
            return;
        }
        if (int(Config.PrefabType) == 0)
        {
            Result.InvalidNum.Increase(local_2);
        }
        return;
    }
    UFUNCTION()
    void Job_RunStat(const FCS_FixedTime &inout FixedTime) const
    {
        if (CVar_QAStatPrefabs.GetBool())
        {
            FPrefabStatInfomation local_12;
            this.Run_Job_StatPrefabInfomations(local_12);
            local_12.PrintInfoToScreen();
            if (FixedTime.IsOnInterval(FFPTime(1)))
            {
                local_12.LogAsInfomation();
            }
        }
        return;
    }
    UFUNCTION()
    void Run_Job_StatPrefabInfomations_StaticReg(FPrefabStatInfomation &inout Arg0) const
    {
        int local_128 = 0;
        int local_130 = 0;
        FECSManualJobStatScope local_1 = FECSManualJobStatScope(FName("[AS][ManualJob]S_QAStatisticSystem::Job_StatPrefabInfomations"));
        ECS::GetContextJob();
        int local_8 = 1;
        int local_7 = local_8;
        FECSRuntimeView local_48 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(1), EECSRuntimeViewType(2));
        Include local_52;
        local_52.opCall();
        FECSRuntimeViewIterator local_86 = local_48.Iterator();
        for (; local_86.CanProceed;)
        {
            FECSEntityScopeCycleCounter local_125 = FECSEntityScopeCycleCounter(local_86.Proceed());
            this.Job_StatPrefabInfomations(Arg0, local_128, local_130);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_StatPrefabInfomations_LocalReg(FPrefabStatInfomation &inout Arg0) const
    {
        int local_128 = 0;
        int local_130 = 0;
        FECSManualJobStatScope local_1 = FECSManualJobStatScope(FName("[AS][ManualJob]S_QAStatisticSystem::Job_StatPrefabInfomations"));
        ECS::GetContextJob();
        int local_8 = 2;
        int local_7 = local_8;
        FECSRuntimeView local_48 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(2), EECSRuntimeViewType(2));
        Include local_52;
        local_52.opCall();
        FECSRuntimeViewIterator local_86 = local_48.Iterator();
        for (; local_86.CanProceed;)
        {
            FECSEntityScopeCycleCounter local_125 = FECSEntityScopeCycleCounter(local_86.Proceed());
            this.Job_StatPrefabInfomations(Arg0, local_128, local_130);
        }
        return;
    }
    UFUNCTION()
    void Run_Job_StatPrefabInfomations_DefaultReg(FPrefabStatInfomation &inout Arg0) const
    {
        int local_128 = 0;
        int local_130 = 0;
        FECSManualJobStatScope local_1 = FECSManualJobStatScope(FName("[AS][ManualJob]S_QAStatisticSystem::Job_StatPrefabInfomations"));
        ECS::GetContextJob();
        int local_8 = 0;
        int local_7 = local_8;
        FECSRuntimeView local_48 = this.GetECSWorld().GetRuntimeViewByRegType(EECSRegType(0), EECSRuntimeViewType(2));
        Include local_52;
        local_52.opCall();
        FECSRuntimeViewIterator local_86 = local_48.Iterator();
        for (; local_86.CanProceed;)
        {
            FECSEntityScopeCycleCounter local_125 = FECSEntityScopeCycleCounter(local_86.Proceed());
            this.Job_StatPrefabInfomations(Arg0, local_128, local_130);
        }
        return;
    }
    void Run_Job_StatPrefabInfomations(FPrefabStatInfomation &inout Arg0) const
    {
        this.Run_Job_StatPrefabInfomations_StaticReg(Arg0);
        this.Run_Job_StatPrefabInfomations_LocalReg(Arg0);
        this.Run_Job_StatPrefabInfomations_DefaultReg(Arg0);
        return;
    }
    UFUNCTION()
    void Run_Job_RunStat() const
    {
        int local_6 = 0;
        const FCS_FixedTime& local_2 = this.GetECSRuntime().FixedTime.__AsFCS_FixedTime();
        ECS::GetContextJob();
        this.Job_RunStat(local_6);
        return;
    }
}

