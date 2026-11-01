namespace AimPoseCompensatorFactory
{
UAimPoseCompensator Create(const EAimPoseCompensateMethod Method)
{
    switch (Method)
    {
    case EAimPoseCompensateMethod::RotationRestore:
    {
        return UCompensator_RotationRestore();
    }
    case EAimPoseCompensateMethod::TwoBoneIK:
    {
        return UCompensator_TwoBoneIK();
    }
    case EAimPoseCompensateMethod::RotationPropagate:
    {
        return UCompensator_RotationPropagate();
    }
    case EAimPoseCompensateMethod::RollFromAngularVelocity:
    {
        return UCompensator_RollFromAngularVelocity();
    }
    case EAimPoseCompensateMethod::TwistSmooth:
    {
        return UCompensator_TwistSmooth();
    }
    }
}
}
