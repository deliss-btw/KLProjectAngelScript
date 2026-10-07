

// NOTE: class defaults are not authored in this module: FKLFlowNode_MuteCombat (temporary `local_2` did not fold: m_ScriptOverrideMeta = Cast<UASStruct>(local_2);).
// They are carried over byte-exact when this module is recompiled.

struct FKLFlowNode_MuteCombat : FKLFlowNode
{
    FKLFlowNode _base_FKLFlowNode;
    UPROPERTY()
    FKLFlowECSEntityId EntityId;
    UPROPERTY()
    bool bReleaseMute;

    FKLFlowNode_MuteCombat()
    {
        this.bReleaseMute = false;
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
            FECSEntity local_6;
            if (::KLFlowLibrary::GetEntityByKLFlowECSEntityId(this.EntityId, local_6))
            {
                ::BlueprintFunctions_Ecology::EcologyDemoMuteCombat(FECSEntityAdapter(local_6), this.bReleaseMute);
            }
        }
        return;
    }
    void OnQuit_Implementation()
    {
        return;
    }
}

