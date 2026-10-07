

struct FEcoCollectableCreatureAndCountRangeDefWrapper
{
    UPROPERTY()
    FString EcoCollectableCreatureName;
    UPROPERTY()
    int MinCount;
    UPROPERTY()
    int MaxCount;


    EcoCollectable::FEcoCollectableCreatureAndCountRangeDef ToStruct() const
    {
        EcoCollectable::FEcoCollectableCreatureAndCountRangeDef __r;
        FDataObjectPtr local_26 = ::AutoTest::CommonUtils::FindDataObjectByRowName(FEcoCollectableCreatureDefinitionRow, this);
        ThrowIf(!(local_26.IsValid()), FString().Append("Cannot find EcoCollectableCreatureDefinitionRow with name: ").Append(this));
        EcoCollectable::FEcoCollectableCreatureAndCountRangeDef local_82;
        local_82.EcoCollectableCreatureDef = TDataObjectPtr<FEcoCollectableCreatureDefinitionRow>(local_26.CastTo(FEcoCollectableCreatureDefinitionRow));
        local_82.MinCount = this.MinCount;
        local_82.MaxCount = this.MaxCount;
        return __r;
    }
}

