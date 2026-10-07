
namespace FTeamCommonData
{
    const FTeamCommonData Dummy = FTeamCommonData();

}
struct FTeamCommonData
{
    UPROPERTY()
    TArray<TEUIModelRef<FM_TeamMember>> Members;
    UPROPERTY()
    TEUIModelRef<FM_TeamMember> Captain;

    FTeamCommonData()
    {
        return;
    }
}

