
enum EDebugLevelUnitAction
{
    Load,
    Unload,
    UnloadAndLoad,
}


struct FDebugTriggerActionBase
{
    FDebugTriggerActionBase()
    {
        return;
    }
}

struct FDebugTriggerAction_ConsoleCommand : FDebugTriggerActionBase
{
    FDebugTriggerActionBase _base_FDebugTriggerActionBase;
    UPROPERTY()
    FString Command;

    FDebugTriggerAction_ConsoleCommand()
    {
        super();
        return;
    }
}

struct FDebugTriggerAction_SpawnMonster : FDebugTriggerActionBase
{
    FDebugTriggerActionBase _base_FDebugTriggerActionBase;
    UPROPERTY()
    FSingleMonsterSpawnerConfig Config;
    UPROPERTY()
    FVector SpawnOffset;

    FDebugTriggerAction_SpawnMonster()
    {
        super();
        return;
    }
}

struct FDebugTriggerAction_LevelUnit : FDebugTriggerActionBase
{
    FDebugTriggerActionBase _base_FDebugTriggerActionBase;
    UPROPERTY()
    FLevelUnitReference UnitRef;
    UPROPERTY()
    EDebugLevelUnitAction Action = EDebugLevelUnitAction(0);


}

class ADebugActionTriggerBox : AEntityTriggerBox
{
    UPROPERTY()
    TArray<FInstancedStruct> OnEnterActions;
    UPROPERTY()
    TArray<FInstancedStruct> OnExitActions;

    ADebugActionTriggerBox()
    {
        super();
        return;
    }
    UFUNCTION()
    bool CheckShouldOverlapEntity_Implementation(const FECSContext &inout Context, const FECSEntity &inout Entity) const
    {
        Has local_4;
        return local_4.opCall();
    }
    UFUNCTION()
    void OnEntityBeginOverlap_Implementation(const FECSContext &inout Context, const FECSEntity &inout Entity)
    {
        return;
    }
    UFUNCTION()
    void OnEntityEndOverlap_Implementation(const FECSContext &inout Context, const FECSEntity &inout Entity)
    {
        return;
    }
    void ExecuteActions(const TArray<FInstancedStruct> &inout Actions, const FECSContext &inout Context, const FECSEntity &inout Entity)
    {
        for (auto& local_16 : Actions)
        {
            this.DispatchAction(local_16, Context, Entity);
        }
        return;
    }
    void DispatchAction(const FInstancedStruct &inout ActionStruct, const FECSContext &inout Context, const FECSEntity &inout Entity)
    {
        // body not fully recovered вЂ” stub [argmismatch:argtype]
    }
    void ExecuteLevelUnitAction(const FLevelUnitReference &inout UnitRef, const EDebugLevelUnitAction Action)
    {
        int local_10 = 0;
        if (!(UnitRef.IsValid()))
        {
            return;
        }
        FECSWorldPtr local_4 = ECS::GetECSWorld();
        if (!(local_10))
        {
            XError(ELog(22), FString().Append("try op level unit failed because level data manager not exit"));
        }
        FConfigGUID local_20 = LevelConfig::FindGroupGUIDByUnitGUID(UnitRef.GUID);
        if (!(local_20.IsValid()))
        {
            return;
        }
        if (int(Action) == 1 || (int(Action) == 2))
        {
            local_10.UnloadSingleUnit(ECS::GetECSWorld(), UnitRef.GUID, local_20);
        }
        if (int(Action) == 0 || (int(Action) == 2))
        {
            local_10.LoadSingleUnit(UnitRef.GUID, local_20);
        }
        return;
    }
    void AddConsoleCommandAction(TArray<FInstancedStruct> &inout Actions, const FString &inout Command)
    {
        FDebugTriggerAction_ConsoleCommand local_4;
        local_4._base_FDebugTriggerActionBase = Command;
        Actions.Add(FInstancedStruct::Make(local_4));
        return;
    }
}

