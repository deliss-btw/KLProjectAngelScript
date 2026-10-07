
namespace FLevelGroupLoadingPassNames
{
    const TArray<FName> AllAvailableLoadingPassNames = TArray<FName>();
    const TArray<FName> DefaultLoadingPassOrder = TArray<FName>();
    const FName DefaultLoadingPassName = n"BaseGameplay";
    const FName RandomEventPassName = n"RandomEvent";

UFUNCTION()
TArray<FName> GetLevelGroupLoadingPassNames()
{
    return FLevelGroupLoadingPassNames::AllAvailableLoadingPassNames;
}
}
