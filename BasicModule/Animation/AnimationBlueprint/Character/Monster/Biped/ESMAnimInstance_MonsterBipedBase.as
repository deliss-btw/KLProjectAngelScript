

class UESMAnimInstance_MonsterBipedBase : UESMAnimInstance_MonsterBase
{
    UPROPERTY()
    FC_BipedAimOffset BipedAimOffset;
    UPROPERTY()
    FC_CharacterGroundMovementInfo CharacterGroundMovementInfo;
    UPROPERTY()
    FC_AnimPostProcessEnable AnimPostProcessEnable;
    UPROPERTY()
    FC_RiderOffsetParamas RiderOffsetParamas;

    UESMAnimInstance_MonsterBipedBase()
    {
        super();
        return;
    }
    UFUNCTION()
    void EntitySync_SyncHistory_Implementation(const FFPTime &inout SampleTime)
    {
        int local_6 = 0;
        int local_30 = 0;
        int local_76 = 0;
        int local_94 = 0;
        Super::EntitySync_SyncHistory_Implementation(SampleTime);
        if (!(local_6) || !(local_6.GetInterpoValue(SampleTime, this.BipedAimOffset)))
        {
            FC_BipedAimOffset local_24;
            this.BipedAimOffset = local_24;
        }
        if (!(local_30) || !(local_30.GetInterpoValue(SampleTime, this.CharacterGroundMovementInfo)))
        {
            FC_CharacterGroundMovementInfo local_70;
            this.CharacterGroundMovementInfo = local_70;
        }
        if (!(local_76) || !(local_76.GetInterpoValue(SampleTime, this.AnimPostProcessEnable)))
        {
            FC_AnimPostProcessEnable local_88;
            this.AnimPostProcessEnable = local_88;
        }
        if (!(local_94) || !(local_94.GetInterpoValue(SampleTime, this.RiderOffsetParamas)))
        {
            FC_RiderOffsetParamas local_98;
            this.RiderOffsetParamas = local_98;
        }
        return;
    }
    UFUNCTION()
    void EntitySync_SyncView_Implementation()
    {
        Super::EntitySync_SyncView_Implementation();
        return;
    }
    UFUNCTION()
    void EntitySync_SyncLogic_Implementation()
    {
        Super::EntitySync_SyncLogic_Implementation();
        return;
    }
}

