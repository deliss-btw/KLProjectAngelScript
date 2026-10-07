
enum EEcosimAIV2PredicateNominal
{
    None,
    Mount,
}


class UEcosimAIV2UnitAsset : UObject
{
    UPROPERTY()
    FName UnitName;

    UEcosimAIV2UnitAsset()
    {
        return;
    }
}

struct FEcosimAIV2GroupRelation
{
    UPROPERTY()
    FName Subject;
    UPROPERTY()
    FName Possessor;
    UPROPERTY()
    EEcosimAIV2PredicateNominal PredicateNominal;

    FEcosimAIV2GroupRelation(const FName &inout InSubject, const FName &inout InPossessor, const EEcosimAIV2PredicateNominal InPredicateNominal)
    {
        this.Possessor = InPossessor;
        this.PredicateNominal = InPredicateNominal;
        return;
    }
}

class UEcosimAIV2GroupAsset : UObject
{
    UPROPERTY()
    TMap<FName, UEcosimAIV2UnitAsset> UnitMap;
    UPROPERTY()
    TArray<FEcosimAIV2GroupRelation> GroupRelationList;

    UEcosimAIV2GroupAsset()
    {
        return;
    }
}

struct FEcosimAIV2TeamElemment
{
    UPROPERTY()
    UEcosimAIV2GroupAsset GroupInfo;
    UPROPERTY()
    int Num;
    UPROPERTY()
    FVector LocationOffset;
    UPROPERTY()
    FRotator RotationOffset;

    FEcosimAIV2TeamElemment()
    {
        this.Num = 0;
        return;
    }
    FEcosimAIV2TeamElemment(const UEcosimAIV2GroupAsset InGroupInfo, const int InNum, const FVector &inout InLocationOffset, const FRotator &inout InRotationOffset)
    {
        this.GroupInfo = nullptr;
        this.Num = 0;
        this.Num = InNum;
        this.LocationOffset = InLocationOffset;
        this.RotationOffset = InRotationOffset;
        return;
    }
}

class UEcosimAIV2TeamAsset : UObject
{
    UPROPERTY()
    TArray<FEcosimAIV2TeamElemment> TeamElemmentList;

    UEcosimAIV2TeamAsset()
    {
        return;
    }
}

class UEcosimAIV2TeamGlobalAsset : UObject
{
    UPROPERTY()
    TMap<FName, UEcosimAIV2TeamAsset> TeamMap;

    UEcosimAIV2TeamGlobalAsset()
    {
        return;
    }
}

namespace EcosimAIV2Unit
{
UEcosimAIV2TeamGlobalAsset GetTeamGlobalAsset() property
{
    UEcosimAIV2TeamGlobalAsset local_2;
    if (local_2 != nullptr)
    {
        return local_2;
    }
    local_2 = Cast<UEcosimAIV2TeamGlobalAsset>(__CreateLiteralAsset(UEcosimAIV2TeamGlobalAsset, "TeamGlobalAsset"));
    if (local_2 == nullptr)
    {
        return nullptr;
    }
    EcosimAIV2Unit::__Init_TeamGlobalAsset();
    __PostLiteralAssetSetup("TeamGlobalAsset");
    return local_2;
}
void __Init_TeamGlobalAsset(const UEcosimAIV2TeamGlobalAsset TeamGlobalAsset)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UEcosimAIV2UnitAsset GetUnit_BusinessOwner() property
{
    UEcosimAIV2UnitAsset local_2;
    if (local_2 != nullptr)
    {
        return local_2;
    }
    local_2 = Cast<UEcosimAIV2UnitAsset>(__CreateLiteralAsset(UEcosimAIV2UnitAsset, "Unit_BusinessOwner"));
    if (local_2 == nullptr)
    {
        return nullptr;
    }
    EcosimAIV2Unit::__Init_Unit_BusinessOwner();
    __PostLiteralAssetSetup("Unit_BusinessOwner");
    return local_2;
}
void __Init_Unit_BusinessOwner(const UEcosimAIV2UnitAsset Unit_BusinessOwner)
{
    Unit_BusinessOwner.UnitName = n"business_owner";
    return;
}
UEcosimAIV2UnitAsset GetUnit_HorngGuard() property
{
    UEcosimAIV2UnitAsset local_2;
    if (local_2 != nullptr)
    {
        return local_2;
    }
    local_2 = Cast<UEcosimAIV2UnitAsset>(__CreateLiteralAsset(UEcosimAIV2UnitAsset, "Unit_HorngGuard"));
    if (local_2 == nullptr)
    {
        return nullptr;
    }
    EcosimAIV2Unit::__Init_Unit_HorngGuard();
    __PostLiteralAssetSetup("Unit_HorngGuard");
    return local_2;
}
void __Init_Unit_HorngGuard(const UEcosimAIV2UnitAsset Unit_HorngGuard)
{
    Unit_HorngGuard.UnitName = n"horng_guard";
    return;
}
UEcosimAIV2UnitAsset GetUnit_Mount() property
{
    UEcosimAIV2UnitAsset local_2;
    if (local_2 != nullptr)
    {
        return local_2;
    }
    local_2 = Cast<UEcosimAIV2UnitAsset>(__CreateLiteralAsset(UEcosimAIV2UnitAsset, "Unit_Mount"));
    if (local_2 == nullptr)
    {
        return nullptr;
    }
    EcosimAIV2Unit::__Init_Unit_Mount();
    __PostLiteralAssetSetup("Unit_Mount");
    return local_2;
}
void __Init_Unit_Mount(const UEcosimAIV2UnitAsset Unit_Mount)
{
    Unit_Mount.UnitName = n"Mount";
    return;
}
UEcosimAIV2UnitAsset GetUnit_Coach() property
{
    UEcosimAIV2UnitAsset local_2;
    if (local_2 != nullptr)
    {
        return local_2;
    }
    local_2 = Cast<UEcosimAIV2UnitAsset>(__CreateLiteralAsset(UEcosimAIV2UnitAsset, "Unit_Coach"));
    if (local_2 == nullptr)
    {
        return nullptr;
    }
    EcosimAIV2Unit::__Init_Unit_Coach();
    __PostLiteralAssetSetup("Unit_Coach");
    return local_2;
}
void __Init_Unit_Coach(const UEcosimAIV2UnitAsset Unit_Coach)
{
    Unit_Coach.UnitName = n"Coach";
    return;
}
UEcosimAIV2GroupAsset GetGroup_HumanBusinessOwner() property
{
    UEcosimAIV2GroupAsset local_2;
    if (local_2 != nullptr)
    {
        return local_2;
    }
    local_2 = Cast<UEcosimAIV2GroupAsset>(__CreateLiteralAsset(UEcosimAIV2GroupAsset, "Group_HumanBusinessOwner"));
    if (local_2 == nullptr)
    {
        return nullptr;
    }
    EcosimAIV2Unit::__Init_Group_HumanBusinessOwner();
    __PostLiteralAssetSetup("Group_HumanBusinessOwner");
    return local_2;
}
void __Init_Group_HumanBusinessOwner(const UEcosimAIV2GroupAsset Group_HumanBusinessOwner)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UEcosimAIV2GroupAsset GetGroup_HumanHorngGuard() property
{
    UEcosimAIV2GroupAsset local_2;
    if (local_2 != nullptr)
    {
        return local_2;
    }
    local_2 = Cast<UEcosimAIV2GroupAsset>(__CreateLiteralAsset(UEcosimAIV2GroupAsset, "Group_HumanHorngGuard"));
    if (local_2 == nullptr)
    {
        return nullptr;
    }
    EcosimAIV2Unit::__Init_Group_HumanHorngGuard();
    __PostLiteralAssetSetup("Group_HumanHorngGuard");
    return local_2;
}
void __Init_Group_HumanHorngGuard(const UEcosimAIV2GroupAsset Group_HumanHorngGuard)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UEcosimAIV2GroupAsset GetGroup_Coach() property
{
    UEcosimAIV2GroupAsset local_2;
    if (local_2 != nullptr)
    {
        return local_2;
    }
    local_2 = Cast<UEcosimAIV2GroupAsset>(__CreateLiteralAsset(UEcosimAIV2GroupAsset, "Group_Coach"));
    if (local_2 == nullptr)
    {
        return nullptr;
    }
    EcosimAIV2Unit::__Init_Group_Coach();
    __PostLiteralAssetSetup("Group_Coach");
    return local_2;
}
void __Init_Group_Coach(const UEcosimAIV2GroupAsset Group_Coach)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UEcosimAIV2GroupAsset GetGroup_Mount() property
{
    UEcosimAIV2GroupAsset local_2;
    if (local_2 != nullptr)
    {
        return local_2;
    }
    local_2 = Cast<UEcosimAIV2GroupAsset>(__CreateLiteralAsset(UEcosimAIV2GroupAsset, "Group_Mount"));
    if (local_2 == nullptr)
    {
        return nullptr;
    }
    EcosimAIV2Unit::__Init_Group_Mount();
    __PostLiteralAssetSetup("Group_Mount");
    return local_2;
}
void __Init_Group_Mount(const UEcosimAIV2GroupAsset Group_Mount)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
UEcosimAIV2TeamAsset GetTeam_Trade() property
{
    UEcosimAIV2TeamAsset local_2;
    if (local_2 != nullptr)
    {
        return local_2;
    }
    local_2 = Cast<UEcosimAIV2TeamAsset>(__CreateLiteralAsset(UEcosimAIV2TeamAsset, "Team_Trade"));
    if (local_2 == nullptr)
    {
        return nullptr;
    }
    EcosimAIV2Unit::__Init_Team_Trade();
    __PostLiteralAssetSetup("Team_Trade");
    return local_2;
}
void __Init_Team_Trade(const UEcosimAIV2TeamAsset Team_Trade)
{
    // body not fully recovered вЂ” stub [opcode-uncovered]
}
}
