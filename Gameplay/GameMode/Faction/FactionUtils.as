
namespace FFactionUtils
{
UFUNCTION()
EFaction GetEntityFaction(const FECSEntity &inout Entity)
{
    int local_6 = 0;
    if (local_6)
    {
        return local_6.GetFactionId();
    }
    return EFaction(0);
}
UFUNCTION()
FString ConvertFactionRelationToString(const EFactionRelation FactionRelation)
{
    switch (int(FactionRelation))
    {
    case 1:
    {
        return "neutral";
    }
    case 2:
    {
        return "enemy";
    }
    case 4:
    {
        return "friend";
    }
    }
    return UEnum::GetEnumType(n"EFactionRelation").GetNameStringByValue(int(FactionRelation)).ToLower();
}
UFUNCTION()
void InitFactionRelationForEntity(const FECSEntity &inout Entity, const FC_Faction &inout Faction)
{
    int local_22 = 0;
    UDataTable local_24;
    if (int(Faction.GetFactionId()) != 0)
    {
        FString local_12 = UEnum::GetEnumType(n"EFaction").GetNameStringByValue(int(Faction.GetFactionId()));
        if (local_24 != nullptr)
        {
            FDamageFactionRelationConfig local_34;
            if (local_24.FindRow(FName(local_12), local_34))
            {
                local_22.SetRelations(local_34.ToRelationArray());
            }
        }
    }
    return;
}
void SetEntityFaction(const FECSEntity &inout Entity, const EFaction Faction)
{
    Has local_4;
    if (!(local_4.opCall()))
    {
        return;
    }
    if ((int(FFactionUtils::GetEntityFaction(Entity))) == (int(Faction)))
    {
        return;
    }
    Modify local_12;
    FC_Faction& local_14 = local_12.opCall();
    if (local_14)
    {
        local_14.SetFactionId(EFaction(Faction));
        Remove local_18;
        local_18.opCall();
    }
    return;
}
}
