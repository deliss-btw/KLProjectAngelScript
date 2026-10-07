
enum ETextArgEntityProperty
{
    Name,
    PlayerName,
    DisplayName,
}

enum ETextArgParser_EntityRelationType
{
    Self,
    Friendly,
    Enemy,
    Neutral,
}


struct FTextArgConfig_Entity : FTextArgConfig
{
    FTextArgConfig _base_FTextArgConfig;
    UPROPERTY()
    ETextArgEntityProperty Property;
    UPROPERTY()
    TMap<ETextArgParser_EntityRelationType, FText> FormatByRelation;


}

class UTextArgParser_Entity : UBlueprintTextArgParser
{
    UTextArgParser_Entity()
    {
        return;
    }
    UFUNCTION()
    UScriptStruct GetConfigType_Implementation() const
    {
        return FTextArgConfig_Entity;
    }
    UFUNCTION()
    bool ParseArgValue_Implementation(const FDataObjectPtr &inout Config, const FTextArgument &inout Arg, FText &inout OutResult) const
    {
        // body not fully recovered вЂ” stub [opcode-uncovered]
        bool __r; return __r;
    }
}

