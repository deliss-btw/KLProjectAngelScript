
enum EBreathSFXTriggerType
{
    Enable,
    Disable,
}


class UESMAction_BreathSFXTrigger : UESMBPBaseInstantAction
{
    UPROPERTY()
    EBreathSFXTriggerType BreathSFXTriggerType = EBreathSFXTriggerType(0);
    UPROPERTY()
    FName AudioComponentName = n"None";
    UPROPERTY()
    bool bAllowStacking = false;


    UFUNCTION()
    EESMAssetWorkflow GetWorkflow_Implementation() const
    {
        return EESMAssetWorkflow(2);
    }
    UFUNCTION()
    EESMActionType GetActionType_Implementation() const
    {
        return EESMActionType(1);
    }
    UFUNCTION()
    void Do_Implementation(const FESMContext &inout Context, const FESMActionTime &inout Time) const
    {
        if (this.AudioComponentName.IsNone())
        {
            XWarning(ELog(1), FString().Append("ESMAction_BreathSFXTrigger: AudioComponentName is empty! Please select an audio component from the dropdown menu."));
            return;
        }
        this.ExecuteBreathSFXTrigger(Context.GetEntity(), this.BreathSFXTriggerType, this.AudioComponentName, this.bAllowStacking);
        return;
    }
    UFUNCTION()
    void OnDataValidate_Implementation(const FESMDataHierarchyInfo &inout Node)
    {
        if (this.AudioComponentName.IsNone())
        {
            Node.AddDataInvalidComment(EESMDataValidType(2), "йџійў‘з»„д»¶еђЌз§°дёЌиѓЅдёєз©єпјЊиЇ·д»Ћдё‹ж‹‰иЏњеЌ•дё­йЂ‰ж‹©йџійў‘з»„д»¶");
        }
        return;
    }
    UFUNCTION()
    FString GetDisplayInfo_Implementation() const
    {
        FString local_10 = this.GetTriggerTypeString(this.BreathSFXTriggerType);
        FString local_4 = this.AudioComponentName.ToString();
        FString local_14;
        if (this.bAllowStacking)
        {
            local_14 = " [еЏ еЉ ]";
        }
        else
        {
            local_14 = " [еЌ•ж¬Ў]";
        }
        return FString().Append(local_10).Append("е‘јеђёйџіж•€: ").Append(local_4).Append(local_14);
    }
    void ExecuteBreathSFXTrigger(const FECSEntity &inout Entity, const EBreathSFXTriggerType InTriggerType, const FName &inout InAudioComponentName, const bool InAllowStacking) const
    {
        ::BreathSFXUtils::ProcessEntityBreathSFX(Entity, EBreathSFXTriggerType(InTriggerType), InAudioComponentName, InAllowStacking);
        return;
    }
    FString GetTriggerTypeString(const EBreathSFXTriggerType InTriggerType) const
    {
        FString __return;
        int local_1 = int(InTriggerType);
        if (local_1 <= 1)
        {
            if (local_1 != 0)
            {
                if (local_1 != 1)
                {
                }
            }
            else
            {
                __return = "еђЇз”Ё";
                __return = "з¦Ѓз”Ё";
            }
        }
        return "жњЄзџҐ";
    }
}

