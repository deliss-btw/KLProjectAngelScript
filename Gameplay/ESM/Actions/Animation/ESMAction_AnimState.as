

class UESMAction_AnimState : UESMAnimStateAction
{
    bool bShowAnimNameInfo = true;


    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Info)
    {
        if (this.bAllowRootMotion && !((Info.StateMachine.GetDataName() == n"MainSM")))
        {
            Info.AddDataInvalidComment(EESMDataValidType(1), FString().Append("Only MainSM support root motion, auto disable bAllowRootMotion"));
            this.bAllowRootMotion = false;
        }
        return;
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        FString __r; return __r;
    }
}

