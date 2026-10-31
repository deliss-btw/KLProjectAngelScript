struct FKLFlowNode_MuteCombat : FKLFlowNode
{
    FKLFlowNode _base_FKLFlowNode;
    UPROPERTY()
    FKLFlowECSEntityId EntityId;
    UPROPERTY()
    bool bReleaseMute;

    default m_ScriptOverrideMeta = Cast<UASStruct>(FKLFlowNode_MuteCombat.Get());

    FKLFlowNode_MuteCombat()
    {
        this.bReleaseMute = false;
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
            FECSEntity local_6;
            if (::KLFlowLibrary::GetEntityByKLFlowECSEntityId(this.EntityId, local_6))
            {
                ::BlueprintFunctions_Ecology::EcologyDemoMuteCombat(FECSEntityAdapter(local_6), (this.bReleaseMute));
            }
        }
        return;
    }
    void OnQuit_Implementation()
    {
        return;
    }
}

