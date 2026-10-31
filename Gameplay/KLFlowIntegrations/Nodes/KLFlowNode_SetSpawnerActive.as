struct FKLFlowNode_SetSpawnerActive : FKLFlowNode
{
    FKLFlowNode _base_FKLFlowNode;
    UPROPERTY()
    AECSPrefab Spawner;
    UPROPERTY()
    bool bActive;

    default m_ScriptOverrideMeta = Cast<UASStruct>(FKLFlowNode_SetSpawnerActive.Get());

    FKLFlowNode_SetSpawnerActive()
    {
        this.Spawner = nullptr;
        this.bActive = true;
        this.__InitDefaults();
        return;
    }
    void OnBuild_Implementation()
    {
        this.InputPins = {n"Input"};
        this.OutputPins = {n"Output"};
        return;
    }
    void OnExec_Implementation(const FName &inout PinName)
    {
        if ((PinName == n"Input"))
        {
            FECSEntity local_10 = ECS::GetPrefabEntity(this.Spawner);
            if (local_10.IsValid())
            {
                local_10.SetActive((this.bActive), FFPTime(-1));
            }
        }
        return;
    }
    void OnQuit_Implementation()
    {
        return;
    }
}

