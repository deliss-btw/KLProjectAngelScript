

struct FCommissionTierConfig : FDataObject
{
    FDataObject _base_FDataObject;
    UPROPERTY()
    ECommissionTier Tier;
    UPROPERTY()
    FText TierName;
    UPROPERTY()
    FLinearColor TierColor;


}

namespace FCommissionTierConfig
{
FDataObjectPtr FindByKey(const ECommissionTier &inout Value)
{
    FindByGlobalKeyValue<ECommissionTier> local_28 = FindByGlobalKeyValue<ECommissionTier>(__DataObjectStructName(n"FCommissionTierConfig"), Value);
    return local_28.opImplConv();
}
}
