
namespace AimPoseSolverFactory
{
UAimPoseSegmentSolver Create(const EAimPoseSolverMode SolverMode)
{
    USolver_DirectWeightCurve local_12;
    switch (int(SolverMode))
    {
    case 1:
    {
        return USolver_LookAtWeightCurve();
    }
    case 2:
    {
        return USolver_IterativeCascade();
    }
    case 3:
    {
        return USolver_HermiteCurve();
    }
    case 4:
    {
        return USolver_AdditiveHermiteCurve();
    }
    default:
    {
        local_12 = USolver_DirectWeightCurve();
    }
    }
    return local_12;
}
}
