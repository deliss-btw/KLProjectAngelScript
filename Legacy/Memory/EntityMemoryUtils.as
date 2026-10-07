
namespace FEntityMemoryUtils
{
UFUNCTION()
void AddMemoryToPawnEntity(const FECSEntity &inout PawnEntity, const FString &inout Memory)
{
    0.EntitySimpleMemoryList.Add(Memory);
    return;
}
UFUNCTION()
TArray<FString> GetPawnEntityMemory(const FECSEntity &inout PawnEntity)
{
    return 0.EntitySimpleMemoryList;
}
UFUNCTION()
FString ConstructMemoryPromptFragment(const FECSEntity &inout PawnEntity)
{
    int local_10 = 0;
    FString local_4 = "иЎЊеЉЁеЋ†еЏІпјљ\n";
    if (local_10.EntitySimpleMemoryList.IsEmpty())
    {
        local_4 += "ж— \n\n";
        return local_4;
    }
    for (auto& local_26 : local_10.EntitySimpleMemoryList)
    {
        FString local_30 = (local_26 + "\n");
        local_4 += local_30;
    }
    local_4 += "\n";
    return local_4;
}
}
