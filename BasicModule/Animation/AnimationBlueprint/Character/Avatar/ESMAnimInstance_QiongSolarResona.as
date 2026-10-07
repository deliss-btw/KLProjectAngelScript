

class UESMAnimInstance_QiongSolarResona : UESMAnimInstance_Base
{
    UPROPERTY()
    FC_AnimParamRigidBodyPhysicsControl AnimParamRigidBodyPhysicsControl;
    UPROPERTY()
    FC_AnimMoveParamsTemp AnimMoveParamsTemp;

    UESMAnimInstance_QiongSolarResona()
    {
        super();
        return;
    }
    UFUNCTION()
    void EntitySync_SyncHistory_Implementation(const FFPTime &inout SampleTime)
    {
        int local_6 = 0;
        int local_16 = 0;
        Super::EntitySync_SyncHistory_Implementation(SampleTime);
        if (!(local_6) || !(local_6.GetInterpoValue(SampleTime, this.AnimParamRigidBodyPhysicsControl)))
        {
            FC_AnimParamRigidBodyPhysicsControl local_10;
            this.AnimParamRigidBodyPhysicsControl = local_10;
        }
        if (!(local_16) || !(local_16.GetInterpoValue(SampleTime, this.AnimMoveParamsTemp)))
        {
            FC_AnimMoveParamsTemp local_18;
            this.AnimMoveParamsTemp = local_18;
        }
        return;
    }
    UFUNCTION()
    void EntitySync_SyncView_Implementation()
    {
        Super::EntitySync_SyncView_Implementation();
        return;
    }
}

