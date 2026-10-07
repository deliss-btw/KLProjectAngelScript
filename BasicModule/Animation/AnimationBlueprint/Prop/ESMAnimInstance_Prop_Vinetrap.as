

class UESMAnimInstance_Prop_Vinetrap : UESMAnimInstance_Prop
{
    UPROPERTY()
    FC_TrapAttachData TrapAttachData;

    UESMAnimInstance_Prop_Vinetrap()
    {
        super();
        return;
    }
    UFUNCTION()
    void EntitySync_SyncView_Implementation()
    {
        GetDefaulted local_4;
        this.TrapAttachData = local_4.opCall();
        return;
    }
}

