

// NOTE: class defaults are not authored in this module: FKLFlowNode_SetSpawnerActive (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

struct FKLFlowNode_SetSpawnerActive : FKLFlowNode
{
    FKLFlowNode _base_FKLFlowNode;
    UPROPERTY()
    AECSPrefab Spawner;
    UPROPERTY()
    bool bActive;

    FKLFlowNode_SetSpawnerActive()
    {
        this.Spawner = nullptr;
        this.bActive = true;
        this.__InitDefaults();
        return;
    }
    void OnBuild_Implementation()
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
    }
    void OnExec_Implementation(const FName &inout PinName)
    {
        if ((PinName == n"Input"))
        {
            FECSEntity local_10 = ECS::GetPrefabEntity(this.Spawner);
            if (local_10.IsValid())
            {
                local_10.SetActive(this.bActive, FFPTime(-1));
            }
        }
        return;
    }
    void OnQuit_Implementation()
    {
        return;
    }
}

