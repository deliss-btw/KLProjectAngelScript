

struct FEcologyResourceModifierFilter
{
    UPROPERTY()
    FGameplayTagContainer ResourceTag;

    FEcologyResourceModifierFilter()
    {
        return;
    }
    bool CheckTargetEntity(const FECSEntity &inout TargetEntity) const
    {
        return true;
    }
}

struct FEcologyResourceModifier
{
    FEcologyResourceModifier()
    {
        return;
    }
}

struct FEcologyResourceModifier_SpecialTimeSegments : FEcologyResourceModifier
{
    FEcologyResourceModifier _base_FEcologyResourceModifier;
    UPROPERTY()
    FGameplayTagContainer IncludeDaySegment;

    FEcologyResourceModifier_SpecialTimeSegments()
    {
        super();
        return;
    }
}

struct FEcologyResourceModifierConfig
{
    UPROPERTY()
    FEcologyResourceModifierFilter Filter;
    UPROPERTY()
    TArray<FVirtualConfigData> Modifier;

    FEcologyResourceModifierConfig()
    {
        return;
    }
    TConstRawPtr<FVirtualConfigData> FindModifierByClass(const UStruct Class) const
    {
        for (auto& local_16 : this.Modifier)
        {
            if (local_16.GetConfigData().GetScriptStruct() == Class)
            {
                return TConstRawPtr<FVirtualConfigData>(local_16);
            }
        }
        return TConstRawPtr<FVirtualConfigData>();
    }
}

