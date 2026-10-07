
namespace FAsAnimCurveUtils
{
    const float32 CurveTimeMaxOffset = 0.5f;
    const FName LeftFootCurveName = n"WP_Bn_L_ToeBase";
    const FName RightFootCurveName = n"WP_Bn_R_ToeBase";
    const TMap<FName, FName> CharacterCurveToSocket = TMap<FName, FName>();

UFUNCTION()
bool CheckCurveNameIsValid(const FName &inout CurveName)
{
    if (((CurveName == FAsAnimCurveUtils::LeftFootCurveName) || (CurveName == FAsAnimCurveUtils::RightFootCurveName)))
    {
        return true;
    }
    FString local_10 = CurveName.ToString();
    if (local_10.StartsWith("WP_", ESearchCase(0)))
    {
        return true;
    }
    return false;
}
UFUNCTION()
FName GetFootStepSocketName(const FName &inout CurveName)
{
    FName local_2(NAME_None);
    if (FAsAnimCurveUtils::CharacterCurveToSocket.Contains(CurveName))
    {
        local_2 = FAsAnimCurveUtils::CharacterCurveToSocket[CurveName];
    }
    else
    {
        FString local_12 = CurveName.ToString();
        if (local_12.StartsWith("WP_", ESearchCase(0)))
        {
            local_12 = local_12.RightChop(3);
            local_2 = FName(local_12);
        }
    }
    return local_2;
}
UFUNCTION()
FName GetCurveNameByBB(const FName &inout BBName)
{
    return FAnimUtils::GetRuntimeCurveNameByFootStepBBName(BBName);
}
}
